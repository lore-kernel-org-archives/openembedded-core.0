Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 68FB276063
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:51:09 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 8300C1025B1;
	Wed, 20 Jun 2018 04:51:52 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:50:42 +0800
Message-Id: <20180619195046.13424-3-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180619195046.13424-1-ayaka@soulik.info>
References: <20180619195046.13424-1-ayaka@soulik.info>
Subject: [PATCH v5 2/6] ThunderX: update the armv8a rules
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
X-List-Received-Date: Tue, 19 Jun 2018 19:51:09 -0000

I am not familiar with the big endian, so I don't update it.
I don't have much information about the Cavium ThunderX,
it looks like it supports all the ARM instructions.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/conf/machine/include/tune-thunderx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 3d43b0f7e5..f82a3a5635 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -1,4 +1,4 @@
-require conf/machine/include/arm/arch-armv8.inc
+require conf/machine/include/arm/arch-armv8a.inc
 
 DEFAULTTUNE ?= "thunderx"
 AVAILTUNES += "thunderx thunderx_be"
@@ -15,5 +15,5 @@ TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
 BASE_LIB_tune-thunderx = "lib64"
 BASE_LIB_tune-thunderx_be = "lib64"
 
-PACKAGE_EXTRA_ARCHS_tune-thunderx = "aarch64 thunderx"
+PACKAGE_EXTRA_ARCHS_tune-thunderx = "armv8a-crc-crypto thunderx"
 PACKAGE_EXTRA_ARCHS_tune-thunderx_be = "aarch64_be thunderx_be"
-- 
2.14.4


