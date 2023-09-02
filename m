Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE30CCF98D
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5689.1693650555331110704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Rt6vEDsQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vpdwz09B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a557092cc-b12173e9-6910-4190-aa49-be98db8d75a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6TOnDLYOiWuKyJnZisua9JW2hB+EtMbjj61mX2ExvKY=;
	b=Rt6vEDsQmqygRot3YfmOKuz50cJiQuxDvsMWT141jHei9hZsEXpXaVmQwglSj1E4
	yPMuYJwh++SGsMdh66DhVP/wYf7Y80RkLK1HK5vaS/TvneL8h2vQxVpoydb/aqL+O71
	6c4nv4hVhU0Vf5cIyG/pvvsc0viNYMJmzlQo/ZcU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6TOnDLYOiWuKyJnZisua9JW2hB+EtMbjj61mX2ExvKY=;
	b=Vpdwz09BTpiQ2kOiRTD93KsAF0dF2gN/1MS3QcBP1eSFmOjuQXLBbywD1//6wLqJ
	H1LjU99wDgZj/GjK74olcvU1Ip7XaGT+x8votu7l/ysdhW1Heb/67RRmm6fJHHazusw
	Tu4F4qcN+BpbwT54ZxSMFNbmSptFwxB5AsBlIrGk=
Content-Type: multipart/mixed; boundary="===============5439712125491702912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kexec-tools: upgrading to 2.0.27 SUCCEEDED
Message-ID: <0101018a557092cc-b12173e9-6910-4190-aa49-be98db8d75a4-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187127

--===============5439712125491702912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools* to *2.0.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.26-2.0.27.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 010fe6987f307f2126bda5653885f26da4bea268 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 03:02:14 +0000
Subject: [PATCH] kexec-tools: upgrade 2.0.26 -> 2.0.27

---
 .../kexec/{kexec-tools_2.0.26.bb => kexec-tools_2.0.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.26.bb => kexec-tools_2.0.27.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
index 11a3c4f47e..9b9864da9a 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "89bdd941542c64fec16311858df304ed3a3908c1a60874d69df5d9bf1611e062"
+SRC_URI[sha256sum] = "410f89057d1f4cd2b0477b6c2035ec2c52e21c185e90742bbae8b4f78a7077a5"
 
 inherit autotools update-rc.d systemd
 
-- 
2.39.2


--===============5439712125491702912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kexec-tools/kdump: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 456388 to 462944 (+1%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PKGSIZE changed from 9742 to 10455 (+7%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 685247 to 690220 (+1%)
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools-src: FILELIST: directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/kexec/arch/i386 -> /usr/src/debug/kexec-tools/2.0.27-r0/kexec/arch/i386, directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/include/x86 -> /usr/src/debug/kexec-tools/2.0.27-r0/include/x86, directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/include/boot -> /usr/src/debug/kexec-tools/2.0.27-r0/include/boot, directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/util_lib -> /usr/src/debug/kexec-tools/2.0.27-r0/util_lib, directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/util_lib/include -> /usr/src/debug/kexec-tools/2.0.27-r0/util_lib/include, directory renamed /usr/src/debug/kexec-tools/2.0.26-r0/vmcore-dmesg -> /usr/src/debug/kexec-tools/2.0.27-r0/vmcore-dmesg, removed "/usr/src/debug/kexec-tools/2.0.26-r0/kexec/symbols.c /usr/src/debug/kexec-tools/2.0.26-r0/include/elf.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-iomem.c /usr/src/debug/kexec-too
 ls/2.0.26-r0/kexec/kexec-sha256.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf-exec.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/arch_reuse_initrd.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/ifdown.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-xen.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-lzma.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/proc_iomem.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-xen.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/add_segment.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-zlib.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/purgatory.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/crashdump.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf-boot.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/crashdump-elf.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/crashdump-xen.c /usr
 /src/debug/kexec-tools/2.0.26-r0/kexec/crashdump.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf-boot.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/phys_to_virt.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/virt_to_phys.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf-core.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/add_buffer.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/phys_arch.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/lzma.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/zlib.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/firmware_memmap.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-elf-rel.c /usr/src/debug/kexec-tools/2.0.26-r0/kexec/kexec-syscall.h /usr/src/debug/kexec-tools/2.0.26-r0/kexec/firmware_memmap.c", added "/usr/src/debug/kexec-tools/2.0.27-r0/kexec/add_buffer.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf-exec.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf-rel.c /usr/src/debug/kexec-too
 ls/2.0.27-r0/kexec/kexec-lzma.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-syscall.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/arch_reuse_initrd.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf-boot.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-pe-zboot.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/symbols.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/ifdown.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf-boot.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/proc_iomem.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/virt_to_phys.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/phys_to_virt.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/add_segment.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/crashdump.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/crashdump.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/crashdump-elf.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/crashdu
 mp-xen.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/purgatory.c /usr/src/debug/kexec-tools/2.0.27-r0/include/kexec-pe-zboot.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-iomem.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-sha256.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/lzma.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/zlib.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-xen.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-zlib.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-xen.c /usr/src/debug/kexec-tools/2.0.27-r0/include/elf.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/firmware_memmap.h /usr/src/debug/kexec-tools/2.0.27-r0/kexec/kexec-elf-core.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/phys_arch.c /usr/src/debug/kexec-tools/2.0.27-r0/kexec/firmware_memmap.c"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/kexec: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/kexec: PKGSIZE changed from 182420 to 186516 (+2%)
packages/core2-32-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.26.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.27.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch"
packages/core2-32-poky-linux/kexec-tools: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools: PKGV changed from 2.0.26 [default] to 2.0.27 [default]
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.26" to "2.0.27"
packages/core2-32-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.26 [default] to 2.0.27 [default]

--===============5439712125491702912==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.26-2.0.27.patch"

RnJvbSAwMTBmZTY5ODdmMzA3ZjIxMjZiZGE1NjUzODg1ZjI2ZGE0YmVhMjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMzowMjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4yNiAtPiAyLjAuMjcKCi0tLQogLi4uL2tleGVjL3trZXhl
Yy10b29sc18yLjAuMjYuYmIgPT4ga2V4ZWMtdG9vbHNfMi4wLjI3LmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy97a2V4ZWMtdG9vbHNfMi4wLjI2LmJiID0+IGtleGVjLXRv
b2xzXzIuMC4yNy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tl
eGVjL2tleGVjLXRvb2xzXzIuMC4yNi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHNfMi4wLjI3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjI2LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4yNy5iYgppbmRleCAxMWEzYzRm
NDdlLi45Yjk4NjRkYTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzXzIuMC4yNi5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzXzIuMC4yNy5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JH
X01JUlJPUn0vbGludXgvdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xzLSR7UFZ9LnRhci5n
egogICAgICAgICAgICBmaWxlOi8vMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1r
YXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiODliZGQ5NDE1NDJjNjRmZWMxNjMxMTg1OGRmMzA0ZWQzYTM5MDhjMWE2MDg3
NGQ2OWRmNWQ5YmYxNjExZTA2MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTBmODkwNTdkMWY0
Y2QyYjA0NzdiNmMyMDM1ZWMyYzUyZTIxYzE4NWU5MDc0MmJiYWU4YjRmNzhhNzA3N2E1IgogCiBp
bmhlcml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kCiAKLS0gCjIuMzkuMgoK

--===============5439712125491702912==--

