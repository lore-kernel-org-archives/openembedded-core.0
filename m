Return-Path: <marex@denx.de>
X-Greylist: delayed 419 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Oct 2016 22:02:24 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD3D71AA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:02:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sz85G5J4nz3hjJk;
	Tue, 18 Oct 2016 23:55:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sz85G4VZYzvkY3;
	Tue, 18 Oct 2016 23:55:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id etXZwy98E2RZ; Tue, 18 Oct 2016 23:55:29 +0200 (CEST)
X-Auth-Info: 3qp0wrUTlG5uccRvqwqlSH3gKn1oNWag1II6pAXkUfM=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Tue, 18 Oct 2016 23:55:29 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 23:55:11 +0200
Message-Id: <20161018215513.2873-3-marex@denx.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161018215513.2873-1-marex@denx.de>
References: <20161018215513.2873-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 3/5] u-boot: Drop the +git part from PV
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
X-List-Received-Date: Tue, 18 Oct 2016 22:02:25 -0000

The U-Boot package is using release versions of U-Boot,
so drop the extra +git part from PV.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index ead5077..0a90621 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.09.01+git${SRCPV}"
+PV = "v2016.09.01"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
-- 
2.9.3


