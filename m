Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 388 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Nov 2016 12:29:01 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B423A71A26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:29:01 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 20C9EB80910; Wed, 30 Nov 2016 13:22:31 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:22:31 +0100
Message-Id: <1480508551-26893-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
References: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] connman: enable connman-wait-online.service
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
X-List-Received-Date: Wed, 30 Nov 2016 12:29:02 -0000

Fixes network mounts on boot.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 091e402..0480257 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -56,7 +56,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-SYSTEMD_PACKAGES = "${PN} ${PN}-vpn"
+SYSTEMD_PACKAGES = "${PN} ${PN}-vpn ${PN}-wait-online"
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
-- 
2.7.4


