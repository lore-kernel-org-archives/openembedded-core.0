Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABEDF76781
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 09:09:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B99Ssw026319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 02:09:28 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 11 Aug 2015 02:09:28 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 17:08:57 +0800
Message-ID: <648173de6f77371c4e0b803af12b23cd514b2d9f.1439283534.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1439283534.git.zhe.he@windriver.com>
References: <cover.1439283534.git.zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb
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
X-List-Received-Date: Tue, 11 Aug 2015 09:09:28 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

To avoid warning of "xxx contains the full path to the the dts file,
but only the dtb name should be used.", Set KERNEL_DEVICETREE to
mpc8315erdb.dtb

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
index f372f32..2beef48 100644
--- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
+++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
@@ -25,7 +25,7 @@ XSERVER ?= "xserver-xorg \
 PREFERRED_VERSION_u-boot ?= "v2013.07%"
 UBOOT_ENTRYPOINT = "0x00000000"
 
-KERNEL_DEVICETREE = "${S}/arch/powerpc/boot/dts/mpc8315erdb.dts"
+KERNEL_DEVICETREE = "mpc8315erdb.dtb"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
-- 
1.9.1


