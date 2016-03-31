Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC441605FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:47:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2VAl4uY012038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:47:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 31 Mar 2016 03:47:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2016 03:47:02 -0700
Message-ID: <7d0abc8ee6607ee15f5a7f3c05ff0cd468906fe5.1459421153.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459421153.git.liezhi.yang@windriver.com>
References: <cover.1459421153.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image-live.bbclass: DEPENDS on syslinux
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
X-List-Received-Date: Thu, 31 Mar 2016 10:47:06 -0000
Content-Type: text/plain

The mkisofs requires syslinux/isolinux.bin which is provided by
target syslinux, for pcbios, the depends is already there, but for
EFI, it isn't, so add the depends.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bootimg.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index d9ed7db..6204101 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -29,6 +29,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
+                        ${MLPREFIX}syslinux:do_populate_sysroot \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')}"
 
 PACKAGES = " "
-- 
2.7.4


