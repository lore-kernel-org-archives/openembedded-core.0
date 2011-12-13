Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDd-0000sc-1w
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:41 +0100
Received: by mail-fx0-f47.google.com with SMTP id a20so338376faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s2azPRX9OL79jwTX3ylDVCU/1xIfVXqN3vveZvpPYgg=;
	b=pcdccUynog+vrVreuF7cXnANCsO7IrQS/5p4YABYjTBObYCGghpWULj2l/K9ulgXyG
	eyE/OCuSDdtJf5Va+9X0mSFWSqGSThESm2nwnQSNiwanFByWLTWYoYOfMzRQN/20UjF2
	a0H2FL5Pw+cevURyOLVeG2aioUvjjNsDRe57E=
Received: by 10.180.105.3 with SMTP id gi3mr26814637wib.36.1323793293940;
	Tue, 13 Dec 2011 08:21:33 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.29
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:32 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:52 +0400
Message-Id: <1323793193-31090-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 8/9] readline: drop empty dir to shut up QA warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 16:28:41 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/readline/readline.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 8fe7e8a..743d8b3 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -28,6 +28,8 @@ do_install_append () {
 	# Make install doesn't properly install these
 	oe_libinstall -so -C shlib libhistory ${D}${libdir}
 	oe_libinstall -so -C shlib libreadline ${D}${libdir}
+
+	rmdir ${D}${bindir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.7.3



