Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8435.1795671539281179625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GUz/A1kL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CSQleru5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a2165d4651-d6b8168d-5881-4301-9c12-bd2d506ebb13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795671541;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=be9NbB96TWsxFboDMMVZUxY2KA99/tdJ5zQa1NarJG4=;
	b=GUz/A1kLo5bzSj6IZbFkxo36LAd7c9LxVMJmy+Con+lxDR1y1m7qpoQJCvCEzpDD
	jqnGS0Y9jfgh/JXaBygYBVEKRwg7NyPNHZzNlA+X+NL3Jqiw8qjdJhsndEqoNC0mKIX
	WabSfiz93jevHCEklT2hbFCDGBoFXAg+Nmpz1zaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795671541;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=be9NbB96TWsxFboDMMVZUxY2KA99/tdJ5zQa1NarJG4=;
	b=CSQleru5mb09J0b2Ikz7exj5mVb/FNkNywM5HUlfixgmo8zAJwGbDB80fUdvBFX7
	0A4IiBGDz4RJmBdToAz/NehjBQJL2O0GjNJrTUgR86PIobe15qMglrIiKBIRz59SHZz
	cjToaYmFNy4TnQE48qYbpLL6jkQB7PfKanFFYv4A=
Content-Type: multipart/mixed; boundary="===============7030930785116845714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libffi: upgrading to 3.8.2 SUCCEEDED
Message-ID: <010101a2165d4651-d6b8168d-5881-4301-9c12-bd2d506ebb13-000000@us-west-2.amazonses.com>
Date: Thu, 26 Nov 2026 05:39:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.26-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251276

--===============7030930785116845714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.8.1-3.8.2.patch
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
From 827a967461a780a46e9142860bb5a487f1df9b99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 26 Nov 2026 05:38:54 +0000
Subject: [PATCH] libffi: upgrade 3.8.1 -> 3.8.2

Release 3.8.2
loongarch: ignore return buffer for void calls
ABI and argument-handling fixes for 3.8.2
testsuite: use named fields, not arrays, in cls_struct_float_psave.c
SPARC64: fix the FP word mask for struct arguments in closures
testsuite: use __builtin_alloca in the over-aligned struct tests
SPARC64: keep SPARC_FLAG_FP_ARGS when ffi_call discards the result
testsuite: skip the over-aligned struct tests under MSVC
README: tighten the TBD changelog entries
README: correct the size-limit wording and the MIPS N32/N64 closure note
AIX: recompute struct alignment from the members on every layout pass
SPARC: allocate the scratch result for a NULL rvalue in ffi_call
Refuse signatures too large for libffi's counters and size fields
MIPS N32/N64: handle complex values that only partly fit in the FP registers
MIPS O32: give ffi_closure_O32 a 16-byte result slot
README: cite the advisory for each TBD changelog entry
i386: give a struct argument 16-byte alignment only for an aligned member
i386: fix three raw-API bugs in ffi_raw_call and ffi_prep_raw_closure_loc
powerpc64 ELFv2: do not quadword-align float/double/IBM long double aggregates
README: shorten the over-alignment changelog entry
Static trampolines: make the temporary code-table file immutable
RISC-V, LoongArch: one-float struct takes the integer convention once FPRs run
out
powerpc64 ELFv2: set FLAG_ARG_NEEDS_PSAVE only when an argument is in memory
Pass by-value aggregates aligned beyond the stack alignment correctly
aarch64: reserve 16 bytes per by-reference struct in the argument slab
Reject vector types in the Win64 and CRIS ffi_prep_cif paths
loongarch: ignore return buffer for void calls
---
 meta/recipes-support/libffi/libffi/not-win32.patch            | 4 ++--
 .../libffi/{libffi_3.8.1.bb => libffi_3.8.2.bb}               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.8.1.bb => libffi_3.8.2.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index e1a6b187f5..880a65d2fe 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 948a108c78f9030d1f1ea87af62ccd257da4b82b Mon Sep 17 00:00:00 2001
+From dc67387ff4383bbf0f77ea6a45779983ca525baf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,7 +20,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 63731dd..cd78322 100644
+index 2237b05..658b4ae 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -449,7 +449,7 @@ done
diff --git a/meta/recipes-support/libffi/libffi_3.8.1.bb b/meta/recipes-support/libffi/libffi_3.8.2.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.8.1.bb
rename to meta/recipes-support/libffi/libffi_3.8.2.bb
index 318cc7ef46..317bf8d938 100644
--- a/meta/recipes-support/libffi/libffi_3.8.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5e9a8df556846bb3d1edec0d968a2311"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "81e879c094cc5ec3186c48510c6385ac6b3e866192e8bc71a35245703757ee40"
+SRC_URI[sha256sum] = "a699fda2b090c4b46cb79cf60c4dacfce480eb05742c0de66acf3af174a47f92"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============7030930785116845714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libffi-changelog.txt"

Release 3.8.2
loongarch: ignore return buffer for void calls
ABI and argument-handling fixes for 3.8.2
testsuite: use named fields, not arrays, in cls_struct_float_psave.c
SPARC64: fix the FP word mask for struct arguments in closures
testsuite: use __builtin_alloca in the over-aligned struct tests
SPARC64: keep SPARC_FLAG_FP_ARGS when ffi_call discards the result
testsuite: skip the over-aligned struct tests under MSVC
README: tighten the TBD changelog entries
README: correct the size-limit wording and the MIPS N32/N64 closure note
AIX: recompute struct alignment from the members on every layout pass
SPARC: allocate the scratch result for a NULL rvalue in ffi_call
Refuse signatures too large for libffi's counters and size fields
MIPS N32/N64: handle complex values that only partly fit in the FP registers
MIPS O32: give ffi_closure_O32 a 16-byte result slot
README: cite the advisory for each TBD changelog entry
i386: give a struct argument 16-byte alignment only for an aligned member
i386: fix three raw-API bugs in ffi_raw_call and ffi_prep_raw_closure_loc
powerpc64 ELFv2: do not quadword-align float/double/IBM long double aggregates
README: shorten the over-alignment changelog entry
Static trampolines: make the temporary code-table file immutable
RISC-V, LoongArch: one-float struct takes the integer convention once FPRs run
out
powerpc64 ELFv2: set FLAG_ARG_NEEDS_PSAVE only when an argument is in memory
Pass by-value aggregates aligned beyond the stack alignment correctly
aarch64: reserve 16 bytes per by-reference struct in the argument slab
Reject vector types in the Win64 and CRIS ffi_prep_cif paths
loongarch: ignore return buffer for void calls

--===============7030930785116845714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.5.1", added "/usr/lib/libffi.so.8.5.2"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so.8.5.1 moved to /usr/lib/libffi.so.8.5.2
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so.8.5.1 moved to /usr/lib/libffi.so.8.5.2

--===============7030930785116845714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.8.1-3.8.2.patch"

RnJvbSA4MjdhOTY3NDYxYTc4MGE0NmU5MTQyODYwYmI1YTQ4N2YxZGY5Yjk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMDU6Mzg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmZmk6IHVwZ3JhZGUgMy44LjEgLT4gMy44LjIKClJlbGVhc2UgMy44LjIKbG9vbmdhcmNoOiBp
Z25vcmUgcmV0dXJuIGJ1ZmZlciBmb3Igdm9pZCBjYWxscwpBQkkgYW5kIGFyZ3VtZW50LWhhbmRs
aW5nIGZpeGVzIGZvciAzLjguMgp0ZXN0c3VpdGU6IHVzZSBuYW1lZCBmaWVsZHMsIG5vdCBhcnJh
eXMsIGluIGNsc19zdHJ1Y3RfZmxvYXRfcHNhdmUuYwpTUEFSQzY0OiBmaXggdGhlIEZQIHdvcmQg
bWFzayBmb3Igc3RydWN0IGFyZ3VtZW50cyBpbiBjbG9zdXJlcwp0ZXN0c3VpdGU6IHVzZSBfX2J1
aWx0aW5fYWxsb2NhIGluIHRoZSBvdmVyLWFsaWduZWQgc3RydWN0IHRlc3RzClNQQVJDNjQ6IGtl
ZXAgU1BBUkNfRkxBR19GUF9BUkdTIHdoZW4gZmZpX2NhbGwgZGlzY2FyZHMgdGhlIHJlc3VsdAp0
ZXN0c3VpdGU6IHNraXAgdGhlIG92ZXItYWxpZ25lZCBzdHJ1Y3QgdGVzdHMgdW5kZXIgTVNWQwpS
RUFETUU6IHRpZ2h0ZW4gdGhlIFRCRCBjaGFuZ2Vsb2cgZW50cmllcwpSRUFETUU6IGNvcnJlY3Qg
dGhlIHNpemUtbGltaXQgd29yZGluZyBhbmQgdGhlIE1JUFMgTjMyL042NCBjbG9zdXJlIG5vdGUK
QUlYOiByZWNvbXB1dGUgc3RydWN0IGFsaWdubWVudCBmcm9tIHRoZSBtZW1iZXJzIG9uIGV2ZXJ5
IGxheW91dCBwYXNzClNQQVJDOiBhbGxvY2F0ZSB0aGUgc2NyYXRjaCByZXN1bHQgZm9yIGEgTlVM
TCBydmFsdWUgaW4gZmZpX2NhbGwKUmVmdXNlIHNpZ25hdHVyZXMgdG9vIGxhcmdlIGZvciBsaWJm
ZmkncyBjb3VudGVycyBhbmQgc2l6ZSBmaWVsZHMKTUlQUyBOMzIvTjY0OiBoYW5kbGUgY29tcGxl
eCB2YWx1ZXMgdGhhdCBvbmx5IHBhcnRseSBmaXQgaW4gdGhlIEZQIHJlZ2lzdGVycwpNSVBTIE8z
MjogZ2l2ZSBmZmlfY2xvc3VyZV9PMzIgYSAxNi1ieXRlIHJlc3VsdCBzbG90ClJFQURNRTogY2l0
ZSB0aGUgYWR2aXNvcnkgZm9yIGVhY2ggVEJEIGNoYW5nZWxvZyBlbnRyeQppMzg2OiBnaXZlIGEg
c3RydWN0IGFyZ3VtZW50IDE2LWJ5dGUgYWxpZ25tZW50IG9ubHkgZm9yIGFuIGFsaWduZWQgbWVt
YmVyCmkzODY6IGZpeCB0aHJlZSByYXctQVBJIGJ1Z3MgaW4gZmZpX3Jhd19jYWxsIGFuZCBmZmlf
cHJlcF9yYXdfY2xvc3VyZV9sb2MKcG93ZXJwYzY0IEVMRnYyOiBkbyBub3QgcXVhZHdvcmQtYWxp
Z24gZmxvYXQvZG91YmxlL0lCTSBsb25nIGRvdWJsZSBhZ2dyZWdhdGVzClJFQURNRTogc2hvcnRl
biB0aGUgb3Zlci1hbGlnbm1lbnQgY2hhbmdlbG9nIGVudHJ5ClN0YXRpYyB0cmFtcG9saW5lczog
bWFrZSB0aGUgdGVtcG9yYXJ5IGNvZGUtdGFibGUgZmlsZSBpbW11dGFibGUKUklTQy1WLCBMb29u
Z0FyY2g6IG9uZS1mbG9hdCBzdHJ1Y3QgdGFrZXMgdGhlIGludGVnZXIgY29udmVudGlvbiBvbmNl
IEZQUnMgcnVuCm91dApwb3dlcnBjNjQgRUxGdjI6IHNldCBGTEFHX0FSR19ORUVEU19QU0FWRSBv
bmx5IHdoZW4gYW4gYXJndW1lbnQgaXMgaW4gbWVtb3J5ClBhc3MgYnktdmFsdWUgYWdncmVnYXRl
cyBhbGlnbmVkIGJleW9uZCB0aGUgc3RhY2sgYWxpZ25tZW50IGNvcnJlY3RseQphYXJjaDY0OiBy
ZXNlcnZlIDE2IGJ5dGVzIHBlciBieS1yZWZlcmVuY2Ugc3RydWN0IGluIHRoZSBhcmd1bWVudCBz
bGFiClJlamVjdCB2ZWN0b3IgdHlwZXMgaW4gdGhlIFdpbjY0IGFuZCBDUklTIGZmaV9wcmVwX2Np
ZiBwYXRocwpsb29uZ2FyY2g6IGlnbm9yZSByZXR1cm4gYnVmZmVyIGZvciB2b2lkIGNhbGxzCi0t
LQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaS9ub3Qtd2luMzIucGF0Y2ggICAg
ICAgICAgICB8IDQgKystLQogLi4uL2xpYmZmaS97bGliZmZpXzMuOC4xLmJiID0+IGxpYmZmaV8z
LjguMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZm
aS97bGliZmZpXzMuOC4xLmJiID0+IGxpYmZmaV8zLjguMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNoCmluZGV4IGUx
YTZiMTg3ZjUuLjg4MGE2NWQyZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDhhMTA4
Yzc4ZjkwMzBkMWYxZWE4N2FmNjJjY2QyNTdkYTRiODJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkYzY3Mzg3ZmY0MzgzYmJmMGY3N2VhNmE0NTc3OTk4M2NhNTI1YmFmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNv
bT4KIERhdGU6IFRodSwgNCBGZWIgMjAxNiAxNjoyMjo1MCArMDAwMAogU3ViamVjdDogW1BBVENI
XSBsaWJmZmk6IGVuc3VyZSBzeXNyb290IHBhdGhzIGFyZSBub3QgaW4gbGliZmZpLnBjCkBAIC0y
MCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRl
bC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDYzNzMxZGQu
LmNkNzgzMjIgMTAwNjQ0CitpbmRleCAyMjM3YjA1Li42NThiNGFlIDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC00NDksNyArNDQ5LDcgQEAgZG9uZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjguMS5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy44LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8z
LjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjgu
Mi5iYgppbmRleCAzMThjYzdlZjQ2Li4zMTdiZjhkOTM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmZmaS9saWJmZmlfMy44LjIuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWU5YThkZjU1Njg0NmJiM2QxZWRlYzBkOTY4YTIz
MTEiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUE59
LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ub3Qtd2luMzIucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFlODc5YzA5NGNjNWVjMzE4NmM0ODUx
MGM2Mzg1YWM2YjNlODY2MTkyZThiYzcxYTM1MjQ1NzAzNzU3ZWU0MCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJhNjk5ZmRhMmIwOTBjNGI0NmNiNzljZjYwYzRkYWNmY2U0ODBlYjA1NzQyYzBkZTY2
YWNmM2FmMTc0YTQ3ZjkyIgogCiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWJ1aWxkZGlyIgog
RVhUUkFfT0VDT05GOmNsYXNzLW5hdGl2ZSArPSAiLS13aXRoLWdjYy1hcmNoPWdlbmVyaWMiCi0t
IAoyLjQ3LjEKCg==

--===============7030930785116845714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.8.1/libffi-3.8.1.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.8.2/libffi-3.8.2.tar.gz file://not-win32.patch"
packages/x86-64-v3-poky-linux/libffi: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 174784 to 177408 (+2%)
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: FILELIST: removed "/usr/lib/.debug/libffi.so.8.5.1", added "/usr/lib/.debug/libffi.so.8.5.2"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 395455 to 401344 (+1%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: FILELIST: directory renamed /usr/src/debug/libffi/3.8.1/include -> /usr/src/debug/libffi/3.8.2/include, directory renamed /usr/src/debug/libffi/3.8.1/src/x86 -> /usr/src/debug/libffi/3.8.2/src/x86, directory renamed /usr/src/debug/libffi/3.8.1/src -> /usr/src/debug/libffi/3.8.2/src
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PV changed from "3.8.1" to "3.8.2"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 63615 to 67711 (+6%)
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.5.1", added "/usr/lib/libffi.so.8.5.2"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGV changed from 3.8.1 [default] to 3.8.2 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: PV changed from "3.8.1" to "3.8.2"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so.8.5.1 moved to /usr/lib/libffi.so.8.5.2
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.1 to libffi.so.8.5.2
  /usr/lib/libffi.so.8.5.1 moved to /usr/lib/libffi.so.8.5.2

--===============7030930785116845714==--
