Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 938376A48C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:16:27 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y11so7384499pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cH93ti4iF/lhqnQvfHBZBddWjUguRxdQZkPo5kZ9OvI=;
	b=r3zdoEBBpAS96fQe/xrzo5nrV9rbHFhNSbnxqKG3zxkpk6mytIYeUCVkBTGj0/wTCf
	RhI2fzrdxZEnYptb4w+G2d0+Ytrl9lN98Gt5M3wDv34ck0MTfYse3igLPMGnJmRO45KE
	A+c4ZBLo97DowvrGpicIblUhtC7Ctmqyfc2bdDwWVEDsedpTECdHyH8O8uX5BYKCUcjK
	wFCuhF5f+HsigB4P3VgdTZTGZnJ4s7M71+LbH1SjQmiQCH7PcX6gWXVKXoqT+yZRSRcW
	AIgWQY9AM9SbaUNjV8iwxjz9k9dl8OLMBVxgWy886y0WmD1wTrJ7sr4vM1I0EiY9Wday
	nKNg==
X-Received: by 10.68.190.104 with SMTP id gp8mr32882353pbc.120.1369728988649; 
	Tue, 28 May 2013 01:16:28 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id w8sm31989382pbo.9.2013.05.28.01.16.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 May 2013 01:16:27 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2013 18:29:52 +1000
Message-Id: <1369729792-19019-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] qt4: fix path to demos documentation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2013 08:16:27 -0000

The qt4-demos-doc package is not created when building qt4-x11-free
because ${docdir}/qtopia/qch/qt.qch doesn't exist.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 84c0ae9..828e30a 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -130,7 +130,7 @@ ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
 FILES_${PN}-dbg = "/usr/src/debug/"
-FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/qtopia/qch/qt.qch"
+FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
-- 
1.8.2.3


