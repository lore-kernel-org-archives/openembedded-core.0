Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id C9E6E71A04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:35:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t08vL18MBz3hjXL;
	Thu, 20 Oct 2016 15:35:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t08vL0jLdzvkjY;
	Thu, 20 Oct 2016 15:35:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id J39FFY-RFA_y; Thu, 20 Oct 2016 15:35:25 +0200 (CEST)
X-Auth-Info: gVDMH9mqOrmArTFDe51TBS0cdwFCX9Gt8lhzD8IqwdU=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Thu, 20 Oct 2016 15:35:25 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 15:35:14 +0200
Message-Id: <20161020133514.3403-4-marex@denx.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161020133514.3403-1-marex@denx.de>
References: <20161020133514.3403-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 4/4] u-boot: Drop redundant comment
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
X-List-Received-Date: Thu, 20 Oct 2016 13:35:25 -0000

Drop comment stating that the SRCREV corresponds to particular U-Boot
version. This comment is redundant, since the U-Boot version is part
of the recipe filename.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index e7f6364..8922947 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -5,7 +5,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 PE="1"
 
-# This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
-- 
2.9.3


