Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910C1EED631
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.29667.1694804393351899620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cu+Sd0hl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GUHtZnHc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36b810-993950f7-a7b4-4831-b068-f6ad83a64c95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CHkQfSegXR46w8p/OcUd7nDdpiSpRZLIBchyTsOIf2M=;
	b=Cu+Sd0hlsOu8D+coP+KCLDUy5T0dnGq+M5rLO9PfXfMtpGUruVFpnIsqyvuZ1fUa
	QljL2AexKWSZADwkoMGiW1K4PKCp4uw0tzTXMNg0sgbvfqiIbm5LFhF9KRuVYDo/b/h
	A/VEqW4AYr2zpTubZkafNSQXlR5s5AfHE4+70emA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CHkQfSegXR46w8p/OcUd7nDdpiSpRZLIBchyTsOIf2M=;
	b=GUHtZnHcD0DgxQ2t1GiteKiJnFToOKHqbAbypGCvGKxHdcmyhgnYdAI3qHy+wOfB
	qrAmHJh4HxsxRd/5mzwqG/PCGE9z4vDqqf58Cvtz9RCUoJTHaWWDRjySUoF23SyWGgy
	PSxSWB+oBtZ4Bu15qK6FvOATSvGP4KEo6ILpQvv8=
Content-Type: multipart/mixed; boundary="===============3266710227446945206=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.3 SUCCEEDED
Message-ID: <0101018a9a36b810-993950f7-a7b4-4831-b068-f6ad83a64c95-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187688

--===============3266710227446945206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254-254.3.patch
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
From 6d4e9450387cf8debbf6eae38beb183db051077d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 07:37:33 +0000
Subject: [PATCH] systemd-boot: upgrade 254 -> 254.3

---
 ...temd-boot_254.bb => systemd-boot_254.3.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  6 +-
 ...-elf2efi-Fix-header-size-calculation.patch | 70 -------------------
 3 files changed, 2 insertions(+), 74 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.bb => systemd-boot_254.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-elf2efi-Fix-header-size-calculation.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.bb
rename to meta/recipes-core/systemd/systemd-boot_254.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e5686fbe44..f5f4448dd5 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
+SRCREV = "d5c180b96ef389da9923985e96504901f52ac605"
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


--===============3266710227446945206==
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

--===============3266710227446945206==
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

--===============3266710227446945206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v254-stable file://0001-elf2efi-Fix-header-size-calculation.patch" to "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v254-stable"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254 [default] to 254.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "254" to "254.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGSIZE changed from 108032 to 108544 (+0%)

--===============3266710227446945206==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254-254.3.patch"

RnJvbSA2ZDRlOTQ1MDM4N2NmOGRlYmJmNmVhZTM4YmViMTgzZGIwNTEwNzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDc6Mzc6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjU0IC0+IDI1NC4zCgotLS0KIC4uLnRlbWQtYm9vdF8yNTQu
YmIgPT4gc3lzdGVtZC1ib290XzI1NC4zLmJifSB8ICAwCiBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgfCAgNiArLQogLi4uLWVsZjJlZmktRml4LWhlYWRlci1z
aXplLWNhbGN1bGF0aW9uLnBhdGNoIHwgNzAgLS0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTQuYmIgPT4gc3lzdGVtZC1ib290XzI1
NC4zLmJifSAoMTAwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAwMS1lbGYyZWZpLUZpeC1oZWFkZXItc2l6ZS1jYWxjdWxhdGlvbi5wYXRj
aAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1
NC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWQtYm9vdF8yNTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC1ib290XzI1NC4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwpp
bmRleCBlNTY4NmZiZTQ0Li5mNWY0NDQ4ZGQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC5pbmMKQEAgLTE0LDEwICsxNCw4IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQ
TC0yLjEtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9
NzUxNDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAotU1JDUkVWID0gIjk5NGM3OTc4NjA4YTBiZDliMzE3ZjRmNzRmZjI2NmRkNTBhM2U3NGUi
CitTUkNSRVYgPSAiZDVjMTgwYjk2ZWYzODlkYTk5MjM5ODVlOTY1MDQ5MDFmNTJhYzYwNSIKIFNS
Q0JSQU5DSCA9ICJ2MjU0LXN0YWJsZSIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0
ZW1kL3N5c3RlbWQtc3RhYmxlLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtZWxmMmVmaS1GaXgtaGVhZGVyLXNpemUtY2FsY3Vs
YXRpb24ucGF0Y2ggXAotICAgICAgICAgICAiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
c3lzdGVtZC9zeXN0ZW1kLXN0YWJsZS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPSR7U1JDQlJB
TkNIfSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLWVsZjJlZmktRml4LWhlYWRlci1zaXplLWNhbGN1bGF0
aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtZWxmMmVm
aS1GaXgtaGVhZGVyLXNpemUtY2FsY3VsYXRpb24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDBlODkyNGQyN2QuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLzAwMDEtZWxmMmVmaS1GaXgtaGVhZGVyLXNpemUtY2FsY3VsYXRpb24u
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw3MCArMCwwIEBACi1Gcm9tIGQwODJkNjUwMmZhODZl
MDhkZGE4NTg5MzM4MzhkZGUwNDA2YjgyNGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBKYW4gSmFuc3NlbiA8bWVkaGVmZ29Ad2ViLmRlPgotRGF0ZTogU3VuLCAzMCBKdWwgMjAyMyAy
MDo1OTowNCArMDIwMAotU3ViamVjdDogW1BBVENIXSBlbGYyZWZpOiBGaXggaGVhZGVyIHNpemUg
Y2FsY3VsYXRpb24KLQotVGhlIFBFIGhlYWRlciBzaXplIGNhbGN1bGF0aW9uIGZhaWxlZCB0byB0
YWtlIHRoZSBQRSBtYWdpYyBhbmQgY29mZgotaGVhZGVyIHNpemUgaW50byBhY2NvdW50LCB3aGlj
aCB3aWxsIGxlYWQgdG8gaGVhZGVyIHRydW5jYXRpb24gaWYgd2UgYXJlCi13cml0aW5nIG9ubHkg
NSBzZWN0aW9ucy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvZWU5MWUwNmE1ODQxYzMwYmM3MzA2MjYwNTI4ZWY0
MDdlMGViYmFiM10KLQotU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNt
YUBmb3VuZHJpZXMuaW8+Ci0tLS0KLSB0b29scy9lbGYyZWZpLnB5IHwgMTIgKysrKysrKysrKy0t
Ci0gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS90b29scy9lbGYyZWZpLnB5IGIvdG9vbHMvZWxmMmVmaS5weQotaW5kZXggZTIz
M2M4ZTNhYi4uMmU0Nzg5NDBmNSAxMDA3NTUKLS0tLSBhL3Rvb2xzL2VsZjJlZmkucHkKLSsrKyBi
L3Rvb2xzL2VsZjJlZmkucHkKLUBAIC0yMTAsNiArMjEwLDcgQEAgRklMRV9BTElHTk1FTlQgPSA1
MTIKLSAKLSAjIE5vYm9keSBjYXJlcyBhYm91dCBET1MgaGVhZGVycywgc28gcHV0IHRoZSBQRSBo
ZWFkZXIgcmlnaHQgYWZ0ZXIuCi0gUEVfT0ZGU0VUID0gNjQKLStQRV9NQUdJQyA9IGIiUEVcMFww
IgotIAotIAotIGRlZiBhbGlnbl90byh4OiBpbnQsIGFsaWduOiBpbnQpIC0+IGludDoKLUBAIC0z
MDQsNyArMzA1LDEwIEBAIGRlZiBjb3B5X3NlY3Rpb25zKGVsZjogRUxGRmlsZSwgb3B0OiBQZU9w
dGlvbmFsSGVhZGVyKSAtPiB0eXBpbmcuTGlzdFtQZVNlY3Rpb25dCi0gCi0gCi0gZGVmIGFwcGx5
X2VsZl9yZWxhdGl2ZV9yZWxvY2F0aW9uKAotLSAgICByZWxvYzogRWxmUmVsb2NhdGlvbiwgaW1h
Z2VfYmFzZTogaW50LCBzZWN0aW9uczogdHlwaW5nLkxpc3RbUGVTZWN0aW9uXSwgYWRkZW5kX3Np
emU6IGludAotKyAgICByZWxvYzogRWxmUmVsb2NhdGlvbiwKLSsgICAgaW1hZ2VfYmFzZTogaW50
LAotKyAgICBzZWN0aW9uczogdHlwaW5nLkxpc3RbUGVTZWN0aW9uXSwKLSsgICAgYWRkZW5kX3Np
emU6IGludCwKLSApOgotICAgICAjIGZtdDogb2ZmCi0gICAgIFt0YXJnZXRdID0gWwotQEAgLTQz
OSw3ICs0NDMsNyBAQCBkZWYgd3JpdGVfcGUoCi0gICAgIGZpbGUuc2VlaygweDNDLCBpby5TRUVL
X1NFVCkKLSAgICAgZmlsZS53cml0ZShQRV9PRkZTRVQudG9fYnl0ZXMoMiwgYnl0ZW9yZGVyPSJs
aXR0bGUiKSkKLSAgICAgZmlsZS5zZWVrKFBFX09GRlNFVCwgaW8uU0VFS19TRVQpCi0tICAgIGZp
bGUud3JpdGUoYiJQRVwwXDAiKQotKyAgICBmaWxlLndyaXRlKFBFX01BR0lDKQotICAgICBmaWxl
LndyaXRlKGNvZmYpCi0gICAgIGZpbGUud3JpdGUob3B0KQotIAotQEAgLTQ1Myw2ICs0NTcsOCBA
QCBkZWYgd3JpdGVfcGUoCi0gICAgICAgICBmaWxlLndyaXRlKHBlX3MpCi0gICAgICAgICBvZmZz
ZXQgPSBhbGlnbl90byhvZmZzZXQgKyBsZW4ocGVfcy5kYXRhKSwgRklMRV9BTElHTk1FTlQpCi0g
Ci0rICAgIGFzc2VydCBmaWxlLnRlbGwoKSA8PSBvcHQuU2l6ZU9mSGVhZGVycwotKwotICAgICBm
b3IgcGVfcyBpbiBzZWN0aW9uczoKLSAgICAgICAgIGZpbGUuc2VlayhwZV9zLlBvaW50ZXJUb1Jh
d0RhdGEsIGlvLlNFRUtfU0VUKQotICAgICAgICAgZmlsZS53cml0ZShwZV9zLmRhdGEpCi1AQCAt
NTE1LDYgKzUyMSw4IEBAIGRlZiBlbGYyZWZpKGFyZ3M6IGFyZ3BhcnNlLk5hbWVzcGFjZSk6Ci0g
Ci0gICAgIG9wdC5TaXplT2ZIZWFkZXJzID0gYWxpZ25fdG8oCi0gICAgICAgICBQRV9PRkZTRVQK
LSsgICAgICAgICsgbGVuKFBFX01BR0lDKQotKyAgICAgICAgKyBzaXplb2YoUGVDb2ZmSGVhZGVy
KQotICAgICAgICAgKyBjb2ZmLlNpemVPZk9wdGlvbmFsSGVhZGVyCi0gICAgICAgICArIHNpemVv
ZihQZVNlY3Rpb24pICogbWF4KGNvZmYuTnVtYmVyT2ZTZWN0aW9ucywgYXJncy5taW5pbXVtX3Nl
Y3Rpb25zKSwKLSAgICAgICAgIEZJTEVfQUxJR05NRU5ULAotLS0gCi0yLjM0LjEKLQotLSAKMi4z
OS4yCgo=

--===============3266710227446945206==--

