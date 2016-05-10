Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6940731F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A8ED6s022804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:13 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:05 -0700
Message-ID: <b3caa6cc8e4d01079d541d74f739a925d2d284af.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 7/8] arch-powerpc.inc: set vars for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 08:14:13 -0000
Content-Type: text/plain

These vars will be used when QEMU_BOOT_SUPPORTED = "1", and has no
impact when "0".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 9cf6b88..68c53bb 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -32,3 +32,8 @@ TUNE_FEATURES_tune-powerpc = "m32 fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
 TUNE_PKGARCH_tune-powerpc = "powerpc"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
+
+QEMU_MAHINE_SUBTYPE = "-machine mac99"
+QEMU_CPU_SUBTYPE = "-cpu G4"
+QEMU_SYSTEM_OPTIONS = "-no-reboot"
+QEMU_KERNEL_OPTIONS = "console=ttyS0 console=tty"
-- 
2.7.4


