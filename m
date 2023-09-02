Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20C1CA1000
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5669.1693650552490806249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cSUiRWR4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gl9+tHY1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a55708374-570fcaf8-1fe9-4f69-8d75-a13a6872da20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JIhAA2AdbEIvimy1jBdPi1ZR1+ggFsEazoqCEPvbf2o=;
	b=cSUiRWR4IJZuf5UsM8X6NmwX/uWtryU2PtbN50gEbr9uwC4HQixi3zxSir9GkXYY
	tZ3fmdKCsCA0pLuE0NhwRpgckLla1O82WvMdY4Kcr2Y3Eb3azMwQEhRe9me7sbJGmyJ
	6SjyHa1eBTMRzWP5GsTwPdnIpWswHyU3M7cu1bEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JIhAA2AdbEIvimy1jBdPi1ZR1+ggFsEazoqCEPvbf2o=;
	b=gl9+tHY1aWO1dFeY3UWrkTEA4QG0X1BwrZylMQXF5pKnqgkpKaRMNS0Trt37lHWe
	S29Ic8p7PobkywVrEzaT5dYlRwiSk20fSuMSQLuJBBwC9FDo5jnAuJKMO0ebABqzCMG
	s+rwwOH+VS/M7oHve18eH5Cokn5TRDOgMDlQR9fs=
Content-Type: multipart/mixed; boundary="===============1832157570244678486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.1 SUCCEEDED
Message-ID: <0101018a55708374-570fcaf8-1fe9-4f69-8d75-a13a6872da20-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187041

--===============1832157570244678486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254-254.1.patch
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
From cb501123b5d09708955ccc88a9e696894404f9ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 09:59:26 +0000
Subject: [PATCH] systemd-boot: upgrade 254 -> 254.1

---
 ...temd-boot_254.bb => systemd-boot_254.1.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  6 +-
 ...-elf2efi-Fix-header-size-calculation.patch | 70 -------------------
 3 files changed, 2 insertions(+), 74 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.bb => systemd-boot_254.1.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.bb
rename to meta/recipes-core/systemd/systemd-boot_254.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e5686fbe44..c767a1f916 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
+SRCREV = "208a21833b6953a2517a6c3f8f4849c6664b01be"
 SRCBRANCH = "v254-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
-           file://0001-elf2efi-Fix-header-size-calculation.patch \
-           "
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch b/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
deleted file mode 100644
index 0e8924d27d..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d082d6502fa86e08dda858933838dde0406b824f Mon Sep 17 00:00:00 2001
-From: Jan Janssen <medhefgo@web.de>
-Date: Sun, 30 Jul 2023 20:59:04 +0200
-Subject: [PATCH] elf2efi: Fix header size calculation
-
-The PE header size calculation failed to take the PE magic and coff
-header size into account, which will lead to header truncation if we are
-writing only 5 sections.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ee91e06a5841c30bc7306260528ef407e0ebbab3]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- tools/elf2efi.py | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/tools/elf2efi.py b/tools/elf2efi.py
-index e233c8e3ab..2e478940f5 100755
---- a/tools/elf2efi.py
-+++ b/tools/elf2efi.py
-@@ -210,6 +210,7 @@ FILE_ALIGNMENT = 512
- 
- # Nobody cares about DOS headers, so put the PE header right after.
- PE_OFFSET = 64
-+PE_MAGIC = b"PE\0\0"
- 
- 
- def align_to(x: int, align: int) -> int:
-@@ -304,7 +305,10 @@ def copy_sections(elf: ELFFile, opt: PeOptionalHeader) -> typing.List[PeSection]
- 
- 
- def apply_elf_relative_relocation(
--    reloc: ElfRelocation, image_base: int, sections: typing.List[PeSection], addend_size: int
-+    reloc: ElfRelocation,
-+    image_base: int,
-+    sections: typing.List[PeSection],
-+    addend_size: int,
- ):
-     # fmt: off
-     [target] = [
-@@ -439,7 +443,7 @@ def write_pe(
-     file.seek(0x3C, io.SEEK_SET)
-     file.write(PE_OFFSET.to_bytes(2, byteorder="little"))
-     file.seek(PE_OFFSET, io.SEEK_SET)
--    file.write(b"PE\0\0")
-+    file.write(PE_MAGIC)
-     file.write(coff)
-     file.write(opt)
- 
-@@ -453,6 +457,8 @@ def write_pe(
-         file.write(pe_s)
-         offset = align_to(offset + len(pe_s.data), FILE_ALIGNMENT)
- 
-+    assert file.tell() <= opt.SizeOfHeaders
-+
-     for pe_s in sections:
-         file.seek(pe_s.PointerToRawData, io.SEEK_SET)
-         file.write(pe_s.data)
-@@ -515,6 +521,8 @@ def elf2efi(args: argparse.Namespace):
- 
-     opt.SizeOfHeaders = align_to(
-         PE_OFFSET
-+        + len(PE_MAGIC)
-+        + sizeof(PeCoffHeader)
-         + coff.SizeOfOptionalHeader
-         + sizeof(PeSection) * max(coff.NumberOfSections, args.minimum_sections),
-         FILE_ALIGNMENT,
--- 
-2.34.1
-
-- 
2.39.2


--===============1832157570244678486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============1832157570244678486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v254-stable file://0001-elf2efi-Fix-header-size-calculation.patch" to "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v254-stable"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254" to "254.1"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254 [default] to 254.1 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "254" to "254.1"

--===============1832157570244678486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============1832157570244678486==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254-254.1.patch"

RnJvbSBjYjUwMTEyM2I1ZDA5NzA4OTU1Y2NjODhhOWU2OTY4OTQ0MDRmOWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwOTo1OToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTQgLT4gMjU0LjEKCi0tLQogLi4udGVtZC1ib290XzI1NC5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjU0LjEuYmJ9IHwgIDAKIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC5pbmMgICAgICAgICB8ICA2ICstCiAuLi4tZWxmMmVmaS1GaXgtaGVhZGVyLXNp
emUtY2FsY3VsYXRpb24ucGF0Y2ggfCA3MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NC5iYiA9PiBzeXN0ZW1kLWJvb3RfMjU0
LjEuYmJ9ICgxMDAlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDAxLWVsZjJlZmktRml4LWhlYWRlci1zaXplLWNhbGN1bGF0aW9uLnBhdGNo
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjEuYmIKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC1ib290XzI1NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLWJvb3RfMjU0LjEuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCmlu
ZGV4IGU1Njg2ZmJlNDQuLmM3NjdhMWY5MTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0
ZW1kLmluYwpAQCAtMTQsMTAgKzE0LDggQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BM
LTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03
NTE0MTkyNjBhYTk1NDQ5OWY3YWJhYWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTlNFLkxHUEwyLjE7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZj
IgogCi1TUkNSRVYgPSAiOTk0Yzc5Nzg2MDhhMGJkOWIzMTdmNGY3NGZmMjY2ZGQ1MGEzZTc0ZSIK
K1NSQ1JFViA9ICIyMDhhMjE4MzNiNjk1M2EyNTE3YTZjM2Y4ZjQ4NDljNjY2NGIwMWJlIgogU1JD
QlJBTkNIID0gInYyNTQtc3RhYmxlIgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3Rl
bWQvc3lzdGVtZC1zdGFibGUuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0g
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1lbGYyZWZpLUZpeC1oZWFkZXItc2l6ZS1jYWxjdWxh
dGlvbi5wYXRjaCBcCi0gICAgICAgICAgICIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFO
Q0h9IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtZWxmMmVmaS1GaXgtaGVhZGVyLXNpemUtY2FsY3VsYXRp
b24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1lbGYyZWZp
LUZpeC1oZWFkZXItc2l6ZS1jYWxjdWxhdGlvbi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMGU4OTI0ZDI3ZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAwMS1lbGYyZWZpLUZpeC1oZWFkZXItc2l6ZS1jYWxjdWxhdGlvbi5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDcwICswLDAgQEAKLUZyb20gZDA4MmQ2NTAyZmE4NmUw
OGRkYTg1ODkzMzgzOGRkZTA0MDZiODI0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEphbiBKYW5zc2VuIDxtZWRoZWZnb0B3ZWIuZGU+Ci1EYXRlOiBTdW4sIDMwIEp1bCAyMDIzIDIw
OjU5OjA0ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGVsZjJlZmk6IEZpeCBoZWFkZXIgc2l6ZSBj
YWxjdWxhdGlvbgotCi1UaGUgUEUgaGVhZGVyIHNpemUgY2FsY3VsYXRpb24gZmFpbGVkIHRvIHRh
a2UgdGhlIFBFIG1hZ2ljIGFuZCBjb2ZmCi1oZWFkZXIgc2l6ZSBpbnRvIGFjY291bnQsIHdoaWNo
IHdpbGwgbGVhZCB0byBoZWFkZXIgdHJ1bmNhdGlvbiBpZiB3ZSBhcmUKLXdyaXRpbmcgb25seSA1
IHNlY3Rpb25zLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5j
b20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC9lZTkxZTA2YTU4NDFjMzBiYzczMDYyNjA1MjhlZjQw
N2UwZWJiYWIzXQotCi1TaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21h
QGZvdW5kcmllcy5pbz4KLS0tLQotIHRvb2xzL2VsZjJlZmkucHkgfCAxMiArKysrKysrKysrLS0K
LSAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL3Rvb2xzL2VsZjJlZmkucHkgYi90b29scy9lbGYyZWZpLnB5Ci1pbmRleCBlMjMz
YzhlM2FiLi4yZTQ3ODk0MGY1IDEwMDc1NQotLS0tIGEvdG9vbHMvZWxmMmVmaS5weQotKysrIGIv
dG9vbHMvZWxmMmVmaS5weQotQEAgLTIxMCw2ICsyMTAsNyBAQCBGSUxFX0FMSUdOTUVOVCA9IDUx
MgotIAotICMgTm9ib2R5IGNhcmVzIGFib3V0IERPUyBoZWFkZXJzLCBzbyBwdXQgdGhlIFBFIGhl
YWRlciByaWdodCBhZnRlci4KLSBQRV9PRkZTRVQgPSA2NAotK1BFX01BR0lDID0gYiJQRVwwXDAi
Ci0gCi0gCi0gZGVmIGFsaWduX3RvKHg6IGludCwgYWxpZ246IGludCkgLT4gaW50OgotQEAgLTMw
NCw3ICszMDUsMTAgQEAgZGVmIGNvcHlfc2VjdGlvbnMoZWxmOiBFTEZGaWxlLCBvcHQ6IFBlT3B0
aW9uYWxIZWFkZXIpIC0+IHR5cGluZy5MaXN0W1BlU2VjdGlvbl0KLSAKLSAKLSBkZWYgYXBwbHlf
ZWxmX3JlbGF0aXZlX3JlbG9jYXRpb24oCi0tICAgIHJlbG9jOiBFbGZSZWxvY2F0aW9uLCBpbWFn
ZV9iYXNlOiBpbnQsIHNlY3Rpb25zOiB0eXBpbmcuTGlzdFtQZVNlY3Rpb25dLCBhZGRlbmRfc2l6
ZTogaW50Ci0rICAgIHJlbG9jOiBFbGZSZWxvY2F0aW9uLAotKyAgICBpbWFnZV9iYXNlOiBpbnQs
Ci0rICAgIHNlY3Rpb25zOiB0eXBpbmcuTGlzdFtQZVNlY3Rpb25dLAotKyAgICBhZGRlbmRfc2l6
ZTogaW50LAotICk6Ci0gICAgICMgZm10OiBvZmYKLSAgICAgW3RhcmdldF0gPSBbCi1AQCAtNDM5
LDcgKzQ0Myw3IEBAIGRlZiB3cml0ZV9wZSgKLSAgICAgZmlsZS5zZWVrKDB4M0MsIGlvLlNFRUtf
U0VUKQotICAgICBmaWxlLndyaXRlKFBFX09GRlNFVC50b19ieXRlcygyLCBieXRlb3JkZXI9Imxp
dHRsZSIpKQotICAgICBmaWxlLnNlZWsoUEVfT0ZGU0VULCBpby5TRUVLX1NFVCkKLS0gICAgZmls
ZS53cml0ZShiIlBFXDBcMCIpCi0rICAgIGZpbGUud3JpdGUoUEVfTUFHSUMpCi0gICAgIGZpbGUu
d3JpdGUoY29mZikKLSAgICAgZmlsZS53cml0ZShvcHQpCi0gCi1AQCAtNDUzLDYgKzQ1Nyw4IEBA
IGRlZiB3cml0ZV9wZSgKLSAgICAgICAgIGZpbGUud3JpdGUocGVfcykKLSAgICAgICAgIG9mZnNl
dCA9IGFsaWduX3RvKG9mZnNldCArIGxlbihwZV9zLmRhdGEpLCBGSUxFX0FMSUdOTUVOVCkKLSAK
LSsgICAgYXNzZXJ0IGZpbGUudGVsbCgpIDw9IG9wdC5TaXplT2ZIZWFkZXJzCi0rCi0gICAgIGZv
ciBwZV9zIGluIHNlY3Rpb25zOgotICAgICAgICAgZmlsZS5zZWVrKHBlX3MuUG9pbnRlclRvUmF3
RGF0YSwgaW8uU0VFS19TRVQpCi0gICAgICAgICBmaWxlLndyaXRlKHBlX3MuZGF0YSkKLUBAIC01
MTUsNiArNTIxLDggQEAgZGVmIGVsZjJlZmkoYXJnczogYXJncGFyc2UuTmFtZXNwYWNlKToKLSAK
LSAgICAgb3B0LlNpemVPZkhlYWRlcnMgPSBhbGlnbl90bygKLSAgICAgICAgIFBFX09GRlNFVAot
KyAgICAgICAgKyBsZW4oUEVfTUFHSUMpCi0rICAgICAgICArIHNpemVvZihQZUNvZmZIZWFkZXIp
Ci0gICAgICAgICArIGNvZmYuU2l6ZU9mT3B0aW9uYWxIZWFkZXIKLSAgICAgICAgICsgc2l6ZW9m
KFBlU2VjdGlvbikgKiBtYXgoY29mZi5OdW1iZXJPZlNlY3Rpb25zLCBhcmdzLm1pbmltdW1fc2Vj
dGlvbnMpLAotICAgICAgICAgRklMRV9BTElHTk1FTlQsCi0tLSAKLTIuMzQuMQotCi0tIAoyLjM5
LjIKCg==

--===============1832157570244678486==--

