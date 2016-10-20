Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id C453A71A90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:48:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t09Bd2M8Bz3hjRk;
	Thu, 20 Oct 2016 15:48:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t09Bd21cCzvkhs;
	Thu, 20 Oct 2016 15:48:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id FFtIgVZDs4lw; Thu, 20 Oct 2016 15:48:40 +0200 (CEST)
X-Auth-Info: red/YxS+jNrRQKtcSGqsXO6av92lHVRFU9od8+Xp3/I=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Thu, 20 Oct 2016 15:48:40 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 15:48:27 +0200
Message-Id: <20161020134827.3970-1-marex@denx.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161020133514.3403-3-marex@denx.de>
References: <20161020133514.3403-3-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH V3 3/4] u-boot: Drop PV altogether
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
X-List-Received-Date: Thu, 20 Oct 2016 13:48:41 -0000

Drop the explicit setting of PV altogether. This changes the U-Boot
version string from "v20yy.mm" to "20yy.mm" , so layer setting the
PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
V2: - Add PE=1 to increment the epoch of the package, as the version
      numbering changes in non-backward-compatible way.
V3: - Formatting fix of the PE line
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index 0a90621..183e222 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -3,14 +3,13 @@ SECTION = "bootloaders"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+PE = "1"
 
 # This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.09.01"
-
 SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
 S = "${WORKDIR}/git"
-- 
2.9.3


