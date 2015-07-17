Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E459173E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:31:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2Vmpk017232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:31:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:31:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 19:31:43 -0700
Message-ID: <d0b1de963397260b4336e0e0314361f44ac0774a.1437100265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] btrfs-tools: 4.0.1 -> 4.1.1
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
X-List-Received-Date: Fri, 17 Jul 2015 02:31:49 -0000
Content-Type: text/plain

This upgrade fixes DEBUG_BUILD on qemuarm:
    [CC]     btrfs-convert.o
    [CC]     btrfs-corrupt-block.o
    [CC]     btrfs-calc-size.o
{standard input}: Assembler messages:
{standard input}:3257: Error: invalid operands (.text and *UND* sections) for `-'
{standard input}:3263: Error: invalid operands (.text and *UND* sections) for `-'
make: *** [cmds-fi-usage.o] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../btrfs-tools/btrfs-tools_git.bb                 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 82403aa..4ad4b81 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
-SRCREV = "c061b303c08af7a58373908d0d77ef0f1161fd36"
+SRCREV = "20be329fdb569fefdf88ba0e4ca1a41488fcbc19"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
 "
@@ -27,6 +27,6 @@ do_configure_prepend() {
 
 S = "${WORKDIR}/git"
 
-PV = "4.0.1+git${SRCPV}"
+PV = "4.1.1+git${SRCPV}"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


