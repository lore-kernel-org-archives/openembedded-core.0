Return-Path: <mfe@pengutronix.de>
X-Greylist: delayed 3899 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Jan 2020 14:11:43 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id E554C6064C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:11:43 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>) id 1ix6Ok-0006Ie-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jan 2020 10:46:06 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>) id 1ix6Ok-0007zi-CH
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jan 2020 10:46:06 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 10:45:58 +0100
Message-Id: <20200130094558.29743-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: alternatify rtcwake
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:08 -0000
Content-Transfer-Encoding: 8bit

This tool can be turned on in busybox which lead into a error during
do_rootfs.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

it seems that the patch get lost in the www if not please ignore this
patch.

Regards,
  Marco

 meta/recipes-core/util-linux/util-linux.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a61bc78542..b72397bb73 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -248,6 +248,7 @@ ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
+ALTERNATIVE_LINK_NAME[rtcwake] = "${sbindir}/rtcwake"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
-- 
2.20.1


