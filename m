Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1ShqZS-0001P9-1D
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:13:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5LKZW0l019013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:35:32 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 21 Jun 2012 13:35:32 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 16:35:25 -0400
Message-ID: <1340310925-12937-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Thu, 21 Jun 2012 23:13:50 -0000
Content-Type: text/plain

This is now the authoratative repository, taking updates.
The latest has a couple updated license files, vs. the previous
srcrev that was used.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3675978..0127d55 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -7,23 +7,23 @@ SECTION = "kernel"
 
 LICENSE = "Proprietary"
 
-LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
+LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
-                    file://LICENCE.iwlwifi_firmware;md5=311cc823df5b1be4f00fbf0f17d96a6b \
+                    file://LICENCE.iwlwifi_firmware;md5=11545778abf78c43d7644d4f171ea1c7 \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                    "
 
-SRCREV = "15888a2eab052ac3d3f49334e4f6f05f347a516e"
+SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
 PV = "0.0+git${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.6



