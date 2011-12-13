Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDR-0000sc-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:29 +0100
Received: by mail-fx0-f47.google.com with SMTP id a20so338376faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Cby5f/UX2n3khxRtjWLDlYrh0asfnbr06iHOs8+WojY=;
	b=M5Cv1vC5jcAl++DVmDU4cRHY3om1Twl+3PnDfYSYPCRpiJ1WjwhPEZxM7NLpjCAtBt
	J7lWWPPkAGPYLpj0YAVicyi/ossujGjv0YKZ6CUQfN2zgDsilC3Dmc3C3/7U2TfhOT6H
	zhZgGZSsG16b6D0q+Q2kEdwbJDFA0eYD223rI=
Received: by 10.216.139.210 with SMTP id c60mr315810wej.9.1323793295775;
	Tue, 13 Dec 2011 08:21:35 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.34
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:34 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:53 +0400
Message-Id: <1323793193-31090-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 9/9] libatomic-ops: drop directory with documentation to remove QA warning
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
X-List-Received-Date: Tue, 13 Dec 2011 16:28:29 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../pulseaudio/libatomics-ops_1.2.bb               |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index 184c167..f81aeb6 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -26,5 +26,6 @@ ARM_INSTRUCTION_SET = "arm"
 inherit autotools pkgconfig
 
 do_install_append() {
-	mv ${D}${datadir}/libatomic_ops ${D}${datadir}/libatomic-ops || true
+	# those contain only docs, not necessary for now.
+	rm -rf ${D}${datadir}/libatomic_ops || true
 }
-- 
1.7.7.3



