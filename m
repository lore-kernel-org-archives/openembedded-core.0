Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 38CA875043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 19:23:21 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 86A14100D33;
	Sat,  2 Jun 2018 04:14:53 +0900 (JST)
From: ayaka <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 03:14:08 +0800
Message-Id: <20180601191410.4795-2-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180601191410.4795-1-ayaka@soulik.info>
References: <20180601191410.4795-1-ayaka@soulik.info>
MIME-Version: 1.0
Subject: [PATCH 1/3] [WIP]: arch-arm64.inc: allow soft fpu configure
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
X-List-Received-Date: Fri, 01 Jun 2018 19:23:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From ARM® Cortex®-A35 Processor Techinical Reference Manual,
the NEON is optional. I am not sure about the VFP part.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 5f90763f7f..3707c61694 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -22,7 +22,7 @@ ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be',
 TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
 TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
 ABIEXTENSION_64 = ""
-TARGET_FPU_64 = ""
+TARGET_FPU_64 = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
 # Duplicated from arch-arm.inc
 TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
-- 
2.14.3


