Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE747FA1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 16:09:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47yXMD2Blbz1qr4P;
	Wed, 15 Jan 2020 17:09:12 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47yXMD1x8Kz1qtdw;
	Wed, 15 Jan 2020 17:09:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id JeRtTf4hm5V7; Wed, 15 Jan 2020 17:09:11 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Wed, 15 Jan 2020 17:09:11 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 7AB4645404A3;
	Wed, 15 Jan 2020 17:09:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id N1unLQpA4bTE; Wed, 15 Jan 2020 17:09:08 +0100 (CET)
Received: from papero.fritz.box (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id C9AF94540494;
	Wed, 15 Jan 2020 17:09:08 +0100 (CET)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 17:09:00 +0100
Message-Id: <20200115160900.2624-1-sbabic@denx.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libubootenv: fix multilib build
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
X-List-Received-Date: Wed, 15 Jan 2020 16:09:12 -0000

In case of multilib, the do_package fails with:

ERROR: libubootenv-0.2-r0 do_package: QA Issue: libubootenv: Files/directories were installed but not shipped in any package:
  /usr/lib/libubootenv.so
  /usr/lib/libubootenv.so.0.2

Issue is fixed in libubootenv repo - this patch updates SRCREV to the
commit with the fix.

Signed-off-by: Stefano Babic <sbabic@denx.de>
Reported-by: ChenQi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 23230d132e..1020258cdd 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
+SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


