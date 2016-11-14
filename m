Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id A843D6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 12:28:38 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so6129953vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 04:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ADhOarIjaC/KiLqrUIFPqHwphgDIMup+oSqrmwzDcOY=;
	b=zMhu+offCsi8+XysrhGyl86rAY3IHpuWiRqv6EQpVadt3epcKlw2Yzk9wDt7ZgHpaR
	oh3Y/Z+6bn06nrmFPpvcAbIFF3dUdLAB254dWNE2/KdLFbTY7Ly1lVxroBP1bIY4PBrV
	T/wvGse2j8VdFRK1SFndCghhy1972Uf0yTUDaRHv6ahSfRbv6eFkE1pVVaNs8jshkDvz
	mUzxBN1eNkh8212ZXbz7NZrWCdcLM9vCYBlvixjSaa6i2twFw92L438whO3xp8QfFcU1
	D1YrN9koMM/nxewfSn/1Rf2PDfYyGmCTMfPPVw2EWnQL9K5+EMi5dOffC7NPlbOIPFj6
	Y4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ADhOarIjaC/KiLqrUIFPqHwphgDIMup+oSqrmwzDcOY=;
	b=IcmXDzsH4ZFars/HUDMh8kt/kZ6JNj2HJ+3PixwSLMHDpMSo7p+5qZkErBxNxikOj9
	EhVH33qL97IarM6opfv94glHCDuRlOHI0/PAiQuZhtjfQFMFWx+Va6DCn2koiz6AWCqB
	AeFY0I70u57vt9gXYNXNnl1bwFPCo59ab4GFUFKfBON8vbb5nUeda6vBCgGC9GS2ylqz
	8lStgEeeLX8lUyvHst+ZzGTRrV84fyX2PWK5bsu7mjuIRPeKKRJe1npkPZ/UUUsITrvV
	2+1AhiuPXl66HJ9kLIXbl3LQRfhb/d4PdqHwxmtGf6uftl9N/immR+OA42VIiBPsL3XX
	7csw==
X-Gm-Message-State: ABUngvczKo2HHJj5eBLZDiE7sqHFYLM5fDnoscCgYDsICRFA2ngmdmVHarcucaGXxGhP0Q==
X-Received: by 10.31.87.133 with SMTP id l127mr9936673vkb.152.1479126519512;
	Mon, 14 Nov 2016 04:28:39 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id
	w13sm5369571uaa.26.2016.11.14.04.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Nov 2016 04:28:38 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 10:28:15 -0200
Message-Id: <1479126495-14047-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] binutils: Fix build for c293pcie PPC machine
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
X-List-Received-Date: Mon, 14 Nov 2016 12:28:38 -0000

The following patch fix build for c293pcie PPC machine :
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=8941017b

This patch is a backport from master branch.

Fix error:
/
|ERROR: binutils-2.27-r0 do_package: runstrip: ''powerpc-fslc-linux-gnuspe-strip'
|--remove-section=.comment --remove-section=.note --strip-unneeded
|'../tmp/work/ppce500v2-fslc-linux-gnuspe/binutils/2.27-r0/package/usr/lib/
|libbfd-2.27.0.20160806.so'' strip command failed with 1
|(b'powerpc-fslc-linux-gnuspe-strip: ../tmp/work/ppce500v2-fslc-linux-gnuspe/
|binutils/2.27-r0/package/usr/lib/stJMAEnm: Not enough room for program headers,
|try linking with -N\npowerpc-fslc-linux-gnuspe-strip:../tmp/work/
|ppce500v2-fslc-linux-gnuspe/binutils/2.27-r0/package/usr/lib/stJMAEnm
|[.note.gnu.build-id]: Bad value\n')
\

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 ...01-ppc-apuinfo-for-spe-parsed-incorrectly.patch | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index fc81721..75180ea 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
+     file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch b/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
new file mode 100644
index 0000000..d82a0b6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
@@ -0,0 +1,37 @@
+From 8941017bc0226b60ce306d5271df15820ce66a53 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 30 Aug 2016 20:57:32 +0930
+Subject: [PATCH] ppc apuinfo for spe parsed incorrectly
+Organization: O.S. Systems Software LTDA.
+
+apuinfo saying SPE resulted in mach = bfd_mach_ppc_vle due to a
+missing break.
+
+	PR 20531
+	* elf32-ppc.c (_bfd_elf_ppc_set_arch): Add missing "break".
+
+
+Backport from :
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=8941017b
+
+Upstream-Status: Backport
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ bfd/elf32-ppc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
+index 95ce1dc..e42ef1c 100644
+--- a/bfd/elf32-ppc.c
++++ b/bfd/elf32-ppc.c
+@@ -2246,6 +2246,7 @@ _bfd_elf_ppc_set_arch (bfd *abfd)
+ 		case PPC_APUINFO_BRLOCK:
+ 		  if (mach != bfd_mach_ppc_vle)
+ 		    mach = bfd_mach_ppc_e500;
++		  break;
+ 
+ 		case PPC_APUINFO_VLE:
+ 		  mach = bfd_mach_ppc_vle;
+-- 
+2.1.4
+
-- 
2.1.4


