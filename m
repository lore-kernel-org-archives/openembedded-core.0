Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A8FC47DA2
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.88850.1705340029647244285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NCwZy1vZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TWo2hGwl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d0e2fcf7b-a0a4ba6d-3692-4328-ac1f-d3e207147e10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PxkoLlQOM7zcHopoLvIRl/NiTFiGrWoeKWjxaJokfwQ=;
	b=NCwZy1vZi0rzmqxhTGNRvGBc0Z0fYrVvfwsbIhKQPC/eT4DEKjblYLB6Dbl8rkJV
	Lk57i6178uKnkGmPGAR3X3fQOpw/CckuWUiZGCGZ3s9ZMhVINQyC2pHSycYC4LDzYsP
	PM7u9GmKx6grVUiHiqTGAf12QW5cKE6ZzkogkcP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PxkoLlQOM7zcHopoLvIRl/NiTFiGrWoeKWjxaJokfwQ=;
	b=TWo2hGwlM2gQOmGi1nA4t7omyfuirQjAXw02QMkWHtu6TdwJ3B8NPka18NouiTww
	TTyYRs8F2H5JoifgLdet2cjk3ulA8PkPyumUO2AovzWwtrNPx6Is1QeNvy+jsOxTwp7
	P25kV1rd6SpgI1e0ggEfhXGT+GWOIxsSrvu+Rj6g=
Content-Type: multipart/mixed; boundary="===============2983574562752926556=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kexec-tools: upgrading to 2.0.28 SUCCEEDED
Message-ID: <0101018d0e2fcf7b-a0a4ba6d-3692-4328-ac1f-d3e207147e10-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193792

--===============2983574562752926556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools* to *2.0.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.27-2.0.28.patch
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
From a1a8e7c414ec49c580d534a2c92b785a01e50dd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 13:11:15 +0000
Subject: [PATCH] kexec-tools: upgrade 2.0.27 -> 2.0.28

---
 ...xec-disabled-check-if-kaslr-seed-dtb-propert.patch |  8 +++-----
 .../0001-powerpc-change-the-memory-size-limit.patch   |  3 ++-
 .../0002-purgatory-Pass-r-directly-to-linker.patch    |  7 ++++---
 ...xec-ARM-Fix-add_buffer_phys_virt-align-issue.patch | 11 ++++++-----
 .../kexec-tools/0005-Disable-PIE-during-link.patch    |  7 ++++---
 .../{kexec-tools_2.0.27.bb => kexec-tools_2.0.28.bb}  |  2 +-
 6 files changed, 20 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.27.bb => kexec-tools_2.0.28.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index ddc1519126..adcc3e09b0 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From d48ec5e1a5fb7907520dee71b1d94045486a0c29 Mon Sep 17 00:00:00 2001
+From 91855300bfda18fde0d03b82c773e7bc504555b1 Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
@@ -29,12 +29,13 @@ as kaslr is disabled anyway.
 
 Signed-off-by: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Upstream-Status: Submitted [http://lists.infradead.org/pipermail/kexec/2020-November/021740.html]
+
 ---
  kexec/arch/arm64/kexec-arm64.c | 14 +-------------
  1 file changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index ec6df4b..10238d9 100644
+index 4a67b0d..b208275 100644
 --- a/kexec/arch/arm64/kexec-arm64.c
 +++ b/kexec/arch/arm64/kexec-arm64.c
 @@ -503,7 +503,7 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
@@ -65,6 +66,3 @@ index ec6df4b..10238d9 100644
  		/*
  		 * Invoke the getrandom system call with
  		 * GRND_NONBLOCK, to make sure we
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
index 029650f35c..06c7651ff1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
+From b60861420caed6abf788f380d987741f3201ac7b Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
@@ -16,6 +16,7 @@ locate_hole failed
 Upstream-Status: Pending
 
 Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+
 ---
  kexec/arch/ppc/kexec-ppc.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index 363d5da4ae..41f3b7db78 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From a04bcf8f683c1a5a7d015920124457ad56fb7cf0 Mon Sep 17 00:00:00 2001
+From 972deaf4dc65503bb9c48a33025014cb6a5387f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -10,15 +10,16 @@ unfiltered
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 2dd6c47..416e6b9 100644
+index 4d2d071..6673423 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
  			-Wl,--no-undefined -nostartfiles -nostdlib \
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
index 832fe67716..3ba6cb1fb1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
@@ -1,4 +1,4 @@
-From 55e583d20651e829afbbc8dba0f8ec3017cda2d5 Mon Sep 17 00:00:00 2001
+From d00cdc259d734d138035c256776d3cf94a548f88 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Mon, 9 Jan 2017 15:26:29 +0800
 Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
@@ -12,15 +12,16 @@ Upstream-Status: Pending
 
 Suggested-By:fredrik.markstrom@gmail.com
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+
 ---
  kexec/arch/arm/crashdump-arm.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index daa4788..3f72b38 100644
+index 1ec1826..cc20f63 100644
 --- a/kexec/arch/arm/crashdump-arm.c
 +++ b/kexec/arch/arm/crashdump-arm.c
-@@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -242,6 +242,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  	void *buf;
  	int err;
  	int last_ranges;
@@ -28,7 +29,7 @@ index daa4788..3f72b38 100644
  
  	/*
  	 * First fetch all the memory (RAM) ranges that we are going to pass to
-@@ -281,6 +282,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -283,6 +284,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  
  		/* for support LPAE enabled kernel*/
  		elf_info.class = ELFCLASS64;
@@ -36,7 +37,7 @@ index daa4788..3f72b38 100644
  
  		err = crash_create_elf64_headers(info, &elf_info,
  					 usablemem_rgns.ranges,
-@@ -302,8 +304,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -304,8 +306,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  	 * 1MB) so that available memory passed in kernel command line will be
  	 * aligned to 1MB. This is because kernel create_mapping() wants memory
  	 * regions to be aligned to SECTION_SIZE.
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 7a4b8548ca..b65b5956b8 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From c54488ad5fd657e0f154d76d7456d9080be24836 Mon Sep 17 00:00:00 2001
+From 0376b48dd49ce2ad1e52f76022656d53bf2597c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -9,15 +9,16 @@ just need to match it with linker flags
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 416e6b9..f00edb4 100644
+index 6673423..a7405ea 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index 9b9864da9a..c2141e6716 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "410f89057d1f4cd2b0477b6c2035ec2c52e21c185e90742bbae8b4f78a7077a5"
+SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
 
 inherit autotools update-rc.d systemd
 
-- 
2.42.0


--===============2983574562752926556==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.27-2.0.28.patch"

RnJvbSBhMWE4ZTdjNDE0ZWM0OWM1ODBkNTM0YTJjOTJiNzg1YTAxZTUwZGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6MTE6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
ZXhlYy10b29sczogdXBncmFkZSAyLjAuMjcgLT4gMi4wLjI4CgotLS0KIC4uLnhlYy1kaXNhYmxl
ZC1jaGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIHwgIDggKysrLS0tLS0KIC4u
Li8wMDAxLXBvd2VycGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6ZS1saW1pdC5wYXRjaCAgIHwgIDMg
KystCiAuLi4vMDAwMi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaCAg
ICB8ICA3ICsrKystLS0KIC4uLnhlYy1BUk0tRml4LWFkZF9idWZmZXJfcGh5c192aXJ0LWFsaWdu
LWlzc3VlLnBhdGNoIHwgMTEgKysrKysrLS0tLS0KIC4uLi9rZXhlYy10b29scy8wMDA1LURpc2Fi
bGUtUElFLWR1cmluZy1saW5rLnBhdGNoICAgIHwgIDcgKysrKy0tLQogLi4uL3trZXhlYy10b29s
c18yLjAuMjcuYmIgPT4ga2V4ZWMtdG9vbHNfMi4wLjI4LmJifSAgfCAgMiArLQogNiBmaWxlcyBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMta2VybmVsL2tleGVjL3trZXhlYy10b29sc18yLjAuMjcuYmIgPT4ga2V4ZWMtdG9vbHNf
Mi4wLjI4LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMv
a2V4ZWMtdG9vbHMvMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1rYXNsci1zZWVk
LWR0Yi1wcm9wZXJ0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29s
cy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3Bl
cnQucGF0Y2gKaW5kZXggZGRjMTUxOTEyNi4uYWRjYzNlMDliMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVk
LWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVkLWNoZWNr
LWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ0
OGVjNWUxYTVmYjc5MDc1MjBkZWU3MWIxZDk0MDQ1NDg2YTBjMjkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDkxODU1MzAwYmZkYTE4ZmRlMGQwM2I4MmM3NzNlN2JjNTA0NTU1YjEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FtZW5za3kgPGFsZXhhbmRl
ci5rYW1lbnNreTQyQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTIgTm92IDIwMjAgMTI6NTY6NDYg
LTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXJtNjQ6IGtleGVjOiBkaXNhYmxlZCBjaGVjayBpZiBr
YXNsci1zZWVkIGR0YiBwcm9wZXJ0eSB3YXMKQEAgLTI5LDEyICsyOSwxMyBAQCBhcyBrYXNsciBp
cyBkaXNhYmxlZCBhbnl3YXkuCiAKIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW1lbnNreSA8
YWxleGFuZGVyLmthbWVuc2t5NDJAZ21haWwuY29tPgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0
ZWQgW2h0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9rZXhlYy8yMDIwLU5vdmVt
YmVyLzAyMTc0MC5odG1sXQorCiAtLS0KICBrZXhlYy9hcmNoL2FybTY0L2tleGVjLWFybTY0LmMg
fCAxNCArLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTMg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9rZXhlYy9hcmNoL2FybTY0L2tleGVjLWFybTY0
LmMgYi9rZXhlYy9hcmNoL2FybTY0L2tleGVjLWFybTY0LmMKLWluZGV4IGVjNmRmNGIuLjEwMjM4
ZDkgMTAwNjQ0CitpbmRleCA0YTY3YjBkLi5iMjA4Mjc1IDEwMDY0NAogLS0tIGEva2V4ZWMvYXJj
aC9hcm02NC9rZXhlYy1hcm02NC5jCiArKysgYi9rZXhlYy9hcmNoL2FybTY0L2tleGVjLWFybTY0
LmMKIEBAIC01MDMsNyArNTAzLDcgQEAgc3RhdGljIGludCBzZXR1cF8ybmRfZHRiKHN0cnVjdCBk
dGIgKmR0YiwgY2hhciAqY29tbWFuZF9saW5lLCBpbnQgb25fY3Jhc2gpCkBAIC02NSw2ICs2Niwz
IEBAIGluZGV4IGVjNmRmNGIuLjEwMjM4ZDkgMTAwNjQ0CiAgCQkvKgogIAkJICogSW52b2tlIHRo
ZSBnZXRyYW5kb20gc3lzdGVtIGNhbGwgd2l0aAogIAkJICogR1JORF9OT05CTE9DSywgdG8gbWFr
ZSBzdXJlIHdlCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxp
bWl0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBv
d2VycGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6ZS1saW1pdC5wYXRjaAppbmRleCAwMjk2NTBmMzVj
Li4wNmM3NjUxZmYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wb3dlcnBjLWNo
YW5nZS10aGUtbWVtb3J5LXNpemUtbGltaXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIx
MWNhZTRiNmEwMmE0ZDlkMzdiZmNkNzZmMzcwMjY5NmUwOTVmYzMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGI2MDg2MTQyMGNhZWQ2YWJmNzg4ZjM4MGQ5ODc3NDFmMzIwMWFjN2IgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRdWFueWFuZyBXYW5nIDxxdWFueWFuZy53YW5n
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE2IEp1biAyMDE1IDEyOjU5OjU3ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHBvd2VycGM6IGNoYW5nZSB0aGUgbWVtb3J5IHNpemUgbGltaXQKQEAg
LTE2LDYgKzE2LDcgQEAgbG9jYXRlX2hvbGUgZmFpbGVkCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRp
bmcKIAogU2lnbmVkLW9mZi1ieTogUXVhbnlhbmcgV2FuZyA8cXVhbnlhbmcud2FuZ0B3aW5kcml2
ZXIuY29tPgorCiAtLS0KICBrZXhlYy9hcmNoL3BwYy9rZXhlYy1wcGMuaCB8IDIgKy0KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMi1wdXJnYXRvcnktUGFzcy1y
LWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHMvMDAwMi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaApp
bmRleCAzNjNkNWRhNGFlLi40MWYzYjdkYjc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1s
aW5rZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8w
MDAyLXB1cmdhdG9yeS1QYXNzLXItZGlyZWN0bHktdG8tbGlua2VyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBhMDRiY2Y4ZjY4M2MxYTVhN2QwMTU5MjAxMjQ0NTdhZDU2ZmI3Y2YwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NzJkZWFmNGRjNjU1MDNiYjljNDhhMzMwMjUwMTRj
YjZhNTM4N2Y3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgNyBTZXAgMjAxNSAwNzo1OTo0NSArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBwdXJnYXRvcnk6IFBhc3MgLXIgZGlyZWN0bHkgdG8gbGlua2VyCkBAIC0x
MCwxNSArMTAsMTYgQEAgdW5maWx0ZXJlZAogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCisKIC0tLQogIHB1cmdh
dG9yeS9NYWtlZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B1cmdhdG9yeS9NYWtlZmlsZSBiL3B1cmdhdG9y
eS9NYWtlZmlsZQotaW5kZXggMmRkNmM0Ny4uNDE2ZTZiOSAxMDA2NDQKK2luZGV4IDRkMmQwNzEu
LjY2NzM0MjMgMTAwNjQ0CiAtLS0gYS9wdXJnYXRvcnkvTWFrZWZpbGUKICsrKyBiL3B1cmdhdG9y
eS9NYWtlZmlsZQotQEAgLTYwLDcgKzYwLDcgQEAgJChQVVJHQVRPUlkpOiBDUFBGTEFHUz0kKCQo
QVJDSClfUFVSR0FUT1JZX0VYVFJBX0NGTEFHUykgXAorQEAgLTYxLDcgKzYxLDcgQEAgJChQVVJH
QVRPUlkpOiBDUFBGTEFHUz0kKCQoQVJDSClfUFVSR0FUT1JZX0VYVFJBX0NGTEFHUykgXAogIAkJ
CS1JJChzaGVsbCAkKENDKSAtcHJpbnQtZmlsZS1uYW1lPWluY2x1ZGUpCiAgJChQVVJHQVRPUlkp
OiBMREZMQUdTPSQoJChBUkNIKV9QVVJHQVRPUllfRVhUUkFfQ0ZMQUdTKVwKICAJCQktV2wsLS1u
by11bmRlZmluZWQgLW5vc3RhcnRmaWxlcyAtbm9zdGRsaWIgXApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAzLWtleGVjLUFSTS1GaXgtYWRkX2J1
ZmZlcl9waHlzX3ZpcnQtYWxpZ24taXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tl
eGVjL2tleGVjLXRvb2xzLzAwMDMta2V4ZWMtQVJNLUZpeC1hZGRfYnVmZmVyX3BoeXNfdmlydC1h
bGlnbi1pc3N1ZS5wYXRjaAppbmRleCA4MzJmZTY3NzE2Li4zYmE2Y2IxZmIxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDMta2V4ZWMtQVJNLUZp
eC1hZGRfYnVmZmVyX3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDMta2V4ZWMtQVJNLUZpeC1hZGRfYnVmZmVy
X3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTVlNTgz
ZDIwNjUxZTgyOWFmYmJjOGRiYTBmOGVjMzAxN2NkYTJkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZDAwY2RjMjU5ZDczNGQxMzgwMzVjMjU2Nzc2ZDNjZjk0YTU0OGY4OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhhaXFpbmcgQmFpIDxIYWlxaW5nLkJhaUB3aW5kcml2
ZXIuY29tPgogRGF0ZTogTW9uLCA5IEphbiAyMDE3IDE1OjI2OjI5ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGtleGVjOiBBUk06IEZpeCBhZGRfYnVmZmVyX3BoeXNfdmlydCgpIGFsaWduIGlzc3Vl
CkBAIC0xMiwxNSArMTIsMTYgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFN1Z2dlc3Rl
ZC1CeTpmcmVkcmlrLm1hcmtzdHJvbUBnbWFpbC5jb20KIFNpZ25lZC1vZmYtYnk6IEhhaXFpbmcg
QmFpIDxIYWlxaW5nLkJhaUB3aW5kcml2ZXIuY29tPgorCiAtLS0KICBrZXhlYy9hcmNoL2FybS9j
cmFzaGR1bXAtYXJtLmMgfCA1ICsrKystCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEva2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1w
LWFybS5jIGIva2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1wLWFybS5jCi1pbmRleCBkYWE0Nzg4Li4z
ZjcyYjM4IDEwMDY0NAoraW5kZXggMWVjMTgyNi4uY2MyMGY2MyAxMDA2NDQKIC0tLSBhL2tleGVj
L2FyY2gvYXJtL2NyYXNoZHVtcC1hcm0uYwogKysrIGIva2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1w
LWFybS5jCi1AQCAtMjQwLDYgKzI0MCw3IEBAIGludCBsb2FkX2NyYXNoZHVtcF9zZWdtZW50cyhz
dHJ1Y3Qga2V4ZWNfaW5mbyAqaW5mbywgY2hhciAqbW9kX2NtZGxpbmUpCitAQCAtMjQyLDYgKzI0
Miw3IEBAIGludCBsb2FkX2NyYXNoZHVtcF9zZWdtZW50cyhzdHJ1Y3Qga2V4ZWNfaW5mbyAqaW5m
bywgY2hhciAqbW9kX2NtZGxpbmUpCiAgCXZvaWQgKmJ1ZjsKICAJaW50IGVycjsKICAJaW50IGxh
c3RfcmFuZ2VzOwpAQCAtMjgsNyArMjksNyBAQCBpbmRleCBkYWE0Nzg4Li4zZjcyYjM4IDEwMDY0
NAogIAogIAkvKgogIAkgKiBGaXJzdCBmZXRjaCBhbGwgdGhlIG1lbW9yeSAoUkFNKSByYW5nZXMg
dGhhdCB3ZSBhcmUgZ29pbmcgdG8gcGFzcyB0bwotQEAgLTI4MSw2ICsyODIsNyBAQCBpbnQgbG9h
ZF9jcmFzaGR1bXBfc2VnbWVudHMoc3RydWN0IGtleGVjX2luZm8gKmluZm8sIGNoYXIgKm1vZF9j
bWRsaW5lKQorQEAgLTI4Myw2ICsyODQsNyBAQCBpbnQgbG9hZF9jcmFzaGR1bXBfc2VnbWVudHMo
c3RydWN0IGtleGVjX2luZm8gKmluZm8sIGNoYXIgKm1vZF9jbWRsaW5lKQogIAogIAkJLyogZm9y
IHN1cHBvcnQgTFBBRSBlbmFibGVkIGtlcm5lbCovCiAgCQllbGZfaW5mby5jbGFzcyA9IEVMRkNM
QVNTNjQ7CkBAIC0zNiw3ICszNyw3IEBAIGluZGV4IGRhYTQ3ODguLjNmNzJiMzggMTAwNjQ0CiAg
CiAgCQllcnIgPSBjcmFzaF9jcmVhdGVfZWxmNjRfaGVhZGVycyhpbmZvLCAmZWxmX2luZm8sCiAg
CQkJCQkgdXNhYmxlbWVtX3JnbnMucmFuZ2VzLAotQEAgLTMwMiw4ICszMDQsOSBAQCBpbnQgbG9h
ZF9jcmFzaGR1bXBfc2VnbWVudHMoc3RydWN0IGtleGVjX2luZm8gKmluZm8sIGNoYXIgKm1vZF9j
bWRsaW5lKQorQEAgLTMwNCw4ICszMDYsOSBAQCBpbnQgbG9hZF9jcmFzaGR1bXBfc2VnbWVudHMo
c3RydWN0IGtleGVjX2luZm8gKmluZm8sIGNoYXIgKm1vZF9jbWRsaW5lKQogIAkgKiAxTUIpIHNv
IHRoYXQgYXZhaWxhYmxlIG1lbW9yeSBwYXNzZWQgaW4ga2VybmVsIGNvbW1hbmQgbGluZSB3aWxs
IGJlCiAgCSAqIGFsaWduZWQgdG8gMU1CLiBUaGlzIGlzIGJlY2F1c2Uga2VybmVsIGNyZWF0ZV9t
YXBwaW5nKCkgd2FudHMgbWVtb3J5CiAgCSAqIHJlZ2lvbnMgdG8gYmUgYWxpZ25lZCB0byBTRUNU
SU9OX1NJWkUuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzLzAwMDUtRGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2gK
aW5kZXggN2E0Yjg1NDhjYS4uYjY1YjU5NTZiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDA1LURpc2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNhYmxl
LVBJRS1kdXJpbmctbGluay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzU0NDg4YWQ1ZmQ2
NTdlMGYxNTRkNzZkNzQ1NmQ5MDgwYmUyNDgzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMDM3NmI0OGRkNDljZTJhZDFlNTJmNzYwMjI2NTZkNTNiZjI1OTdjOCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBT
YXQsIDEwIEp1biAyMDE3IDExOjE4OjQ5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUg
UElFIGR1cmluZyBsaW5rCkBAIC05LDE1ICs5LDE2IEBAIGp1c3QgbmVlZCB0byBtYXRjaCBpdCB3
aXRoIGxpbmtlciBmbGFncwogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIHB1cmdhdG9yeS9NYWtl
ZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL3B1cmdhdG9yeS9NYWtlZmlsZSBiL3B1cmdhdG9yeS9NYWtlZmls
ZQotaW5kZXggNDE2ZTZiOS4uZjAwZWRiNCAxMDA2NDQKK2luZGV4IDY2NzM0MjMuLmE3NDA1ZWEg
MTAwNjQ0CiAtLS0gYS9wdXJnYXRvcnkvTWFrZWZpbGUKICsrKyBiL3B1cmdhdG9yeS9NYWtlZmls
ZQotQEAgLTU5LDcgKzU5LDcgQEAgJChQVVJHQVRPUlkpOiBDUFBGTEFHUz0kKCQoQVJDSClfUFVS
R0FUT1JZX0VYVFJBX0NGTEFHUykgXAorQEAgLTYwLDcgKzYwLDcgQEAgJChQVVJHQVRPUlkpOiBD
UFBGTEFHUz0kKCQoQVJDSClfUFVSR0FUT1JZX0VYVFJBX0NGTEFHUykgXAogIAkJCS1JaW5jbHVk
ZSBcCiAgCQkJLUkkKHNoZWxsICQoQ0MpIC1wcmludC1maWxlLW5hbWU9aW5jbHVkZSkKICAkKFBV
UkdBVE9SWSk6IExERkxBR1M9JCgkKEFSQ0gpX1BVUkdBVE9SWV9FWFRSQV9DRkxBR1MpXApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29sc18yLjAuMjcuYmIg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4yOC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzXzIuMC4yNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhl
Yy10b29sc18yLjAuMjguYmIKaW5kZXggOWI5ODY0ZGE5YS4uYzIxNDFlNjcxNiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29sc18yLjAuMjcuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29sc18yLjAuMjguYmIKQEAgLTE5LDcg
KzE5LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL2tlcm5l
bC9rZXhlYy9rZXhlYy10b29scy0ke1BWfS50YXIuZ3oKICAgICAgICAgICAgZmlsZTovLzAwMDEt
YXJtNjQta2V4ZWMtZGlzYWJsZWQtY2hlY2staWYta2FzbHItc2VlZC1kdGItcHJvcGVydC5wYXRj
aCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxMGY4OTA1N2QxZjRj
ZDJiMDQ3N2I2YzIwMzVlYzJjNTJlMjFjMTg1ZTkwNzQyYmJhZThiNGY3OGE3MDc3YTUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjMzZDI2NjBiM2UzOGQyNWExMjdlODcwOTc5NzhlMGY3YTlhNzNh
YjUxNTFhMjllYjgwOTc0ZDE2OWZmNmEyOSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLXJj
LmQgc3lzdGVtZAogCi0tIAoyLjQyLjAKCg==

--===============2983574562752926556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kdump: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 544296 to 545544 (+0%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PKGSIZE changed from 10455 to 10890 (+4%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 763485 to 765502 (+0%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/kexec: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.27.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.28.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch"
packages/core2-64-poky-linux/kexec-tools: PV changed from "2.0.27" to "2.0.28"
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.27 [default] to 2.0.28 [default]
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.27" to "2.0.28"

--===============2983574562752926556==--

