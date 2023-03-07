Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111DC6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 12:11:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.12709.1678191063615394909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 04:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pZW9l-0001qE-8d; Tue, 07 Mar 2023 13:11:01 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pZW9k-002TKA-2T; Tue, 07 Mar 2023 13:11:00 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pZW9j-009aRd-Em; Tue, 07 Mar 2023 13:10:59 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] base: fix typos
Date: Tue,  7 Mar 2023 13:10:40 +0100
Message-Id: <20230307121040.2283624-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 12:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178104

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes-global/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 64e805c9476c..b6e339ed9c53 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -288,7 +288,7 @@ python base_eventhandler() {
             bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
     # This code is to silence warnings where the SDK variables overwrite the 
-    # target ones and we'd see dulpicate key names overwriting each other
+    # target ones and we'd see duplicate key names overwriting each other
     # for various PREFERRED_PROVIDERS
     if isinstance(e, bb.event.RecipePreFinalise):
         if d.getVar("TARGET_PREFIX") == d.getVar("SDK_PREFIX"):
@@ -351,7 +351,7 @@ base_do_compile() {
 
 addtask install after do_compile
 do_install[dirs] = "${B}"
-# Remove and re-create ${D} so that is it guaranteed to be empty
+# Remove and re-create ${D} so that it is guaranteed to be empty
 do_install[cleandirs] = "${D}"
 
 base_do_install() {
-- 
2.30.2


