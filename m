Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0960F6156E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 04:37:32 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so2846214pad.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 21:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tY4fHhCn6sQ+0t8AbXIgxCYLWpTMLZKsPyj9DsyjPzo=;
	b=b+DbXobEYS7hWNv/TU6tawjyaoZEMW7ukKyR2hu4q3fsQ2FbTj+5yweLS8h4T3U+S4
	EN+luwj4e2McdCPHND7vPrOlkXyt2i8i78uLon/QznPCqf2np5BAY7uWy0bgPwWgAs//
	hiHdw2NAT93qcHVQqBf5EyF1g2W+SZWbnfM+yWA6Pfm0A4FaIAdtM2k2+h5PLmODPWmS
	A9Ff4LqFQsRtzLblIeNFWYyVFZBKktMLlVpAkIRm3mfDLK1Fdh/RHHa8FFZFHCTHYTAG
	rOyd29veRG41ekPxWYyuv3KY0w5LV2djGt2CjrVVTL3GYPIrCzcEJ7d9O6jeqgUmJztO
	Mvbw==
X-Received: by 10.68.189.229 with SMTP id gl5mr598863pbc.77.1378442253785;
	Thu, 05 Sep 2013 21:37:33 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id kz4sm914416pbc.39.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 21:37:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 21:36:09 -0700
Message-Id: <1378442169-15822-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] systemd: Fix build with multilib
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
X-List-Received-Date: Fri, 06 Sep 2013 04:37:32 -0000

rpm macros should be independent of libdir
Fixes errors seen when multilib is turned on
it shows up since then libdir != usr/lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_206.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 75bdc61..120ab08 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -139,7 +139,7 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
                               ${exec_prefix}/lib/kernel \
                              "
-FILES_${PN}-rpm-macros = "${libdir}/rpm \
+FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
                          "
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
-- 
1.8.4


