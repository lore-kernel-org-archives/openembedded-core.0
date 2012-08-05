Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxyAk-0001wx-Ht
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 12:34:58 +0200
Received: by weyr6 with SMTP id r6so1270607wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0AcoGEJiGbC742XtbUaVZBUbpvbhNRrTOOBOCs/9dOw=;
	b=aelUd9HBAs2lI5PKAa0xmyJuA9GlOMb5gcmWF1o+BCx24KNbNDUmkPPZxqWRbs2giR
	7DqHLGM412RUN65liGE9Vt3Vh9ajd5V7SPG6m/pOtfEiOAERZxMQAhC05t+bhpyynmUG
	g1SBBs0UJiyvsayRkgoaTC1gC6RpH/uWzhcqBWWiWBBe+AKqplHPbmZxAP7+tH2qPSBj
	LpqMdkNnmVoiMP4jfpUQUSf/izfeO5jLn1uewHzq/oxL1PfejTxSUphPJml87PiaTzrN
	cInvkcPPee9S1OImedtVkuJR1+0VxLONhc4l3XblWp2lBRpmtFKNH+zoIWC8aslEDIez
	nIfw==
Received: by 10.180.78.170 with SMTP id c10mr10157374wix.3.1344162195550;
	Sun, 05 Aug 2012 03:23:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm8686185wib.8.2012.08.05.03.23.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 03:23:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2012 12:23:07 +0200
Message-Id: <1344162187-27860-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
References: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] layer.conf: add udev-extraconf to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sun, 05 Aug 2012 10:34:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 090c8e2..dfcb1f3 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -23,4 +23,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal \
   base-files \
   keymaps \
+  udev-extraconf \
 "
-- 
1.7.8.6



