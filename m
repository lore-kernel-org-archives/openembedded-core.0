Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2971.1794721856347473120
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X0kQkPxL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V8oFJdyJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1ddc23710-0767a17b-7ef7-48ff-8d85-9972994ed1ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=WQIe3l9dOv7XI+ZjyVt3rD/aS6wqm/NLHu2v88oZ3Ng=;
	b=X0kQkPxLwOn1Fjkwn0w3wzWbApRV218tJTIBVPOvjlVAyDMEsOTEQY26Gt5ndhAS
	0SkayQfmwqCIsPWJYwxE9HQdgg27NdL2fMzu9pZbezjzc+7CQXaFzP49DvOi9RKD8M3
	TaidLPRzW9wCZBXQSFOYGFY5Q3eHS2j66b8snRnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=WQIe3l9dOv7XI+ZjyVt3rD/aS6wqm/NLHu2v88oZ3Ng=;
	b=V8oFJdyJV3SNayWngY1wKNiSWzQRHNo5wU3raadd1FMX+fJkodoMOMlwSWVZJZlu
	NV9EuPpWYz+Ijcj6w/8jG93l3CcIxgdUwKK/JjbrBWXcurLo/wNkPWX2TuqShD3Nuhg
	+rZTUsGZDhQEdjs34SoRFXNMF8ED+tKElR5k0bdo=
Content-Type: multipart/mixed; boundary="===============1034096055328293538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libffi: upgrading to 3.8.1 SUCCEEDED
Message-ID: <010101a1ddc23710-0767a17b-7ef7-48ff-8d85-9972994ed1ac-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250229

--===============1034096055328293538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.8.0-3.8.1.patch
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
From 5776977c6a7b8cf521df45d7d987bd6fdaffc411 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:43:07 +0000
Subject: [PATCH] libffi: upgrade 3.8.0 -> 3.8.1

Release 3.8.1
testsuite: add new tests to EXTRA_DIST so they ship in the release
testsuite: add the new tests to EXTRA_DIST so they ship in the release
README: tighten the TBD changelog and fold in the security fixes
ci(emscripten): get the browser test job green (pytest 9.x +
closure_mmap_failure)
testsuite: guard closure_mmap_failure for non-glibc harnesses
ci(emscripten): bump pytest-pyodide 0.59.2 -> 0.59.4 for pytest 9.x
testsuite: guard closure_raw on !FFI_NO_RAW_API (fix Emscripten CI)
ci: xfail x86_64 Android ld-struct return; drop dead macos-14 runner
CI: make dist PDF best-effort (Android) and xfail closure_raw on i686 MSVC
testsuite: xfail closure_raw on i686 MSVC (libffi #1074)
build: make the dist-hook PDF manual truly best-effort
CI: fix regressions from new tests + complete the dist-hook docs guard
testsuite: xfail more mips N64 complex/fp-return tests (libffi #1071)
build: only build the PDF manual in dist-hook when texi2pdf is present
testsuite: fix closure_raw user_data cast for LLP64 (Windows)
README: complete and consolidate the TBD changelog
CI: fix make dist doc build and closure_mmap_failure on Android
README: complete and consolidate the TBD changelog for the release
testsuite: xfail mips N64 complex/fp-return tests (libffi #1071)
testsuite: restrict closure_mmap_failure to glibc Linux
build: only build docs in dist-hook when docs are enabled
configure: keep assembler defaults in sync with final CFLAGS
mips: Use CFI directives in N32/N64 assembly
Fix WASM heap view indexing at 2 GiB and above
x86-64: return a struct with one long double member in %st0
Fix raw-API closures under static trampolines (GHSA-w6j9-w53f-2857)
x86: support static trampolines in the i386 native raw closure path
raw API: pass the closure, not codeloc, as the translate-args user_data
s390x: pass 128-bit integer arguments to closures by reference (GHSA-
wf8m-qr3x-cch4)
Merge remote-tracking branch 'origin/master' into wf8m-merge
aarch64: fix large-struct pointer offset and HFA/HVA detection
(GHSA-h52h-3759-xqm4)
Merge remote-tracking branch 'origin/master' into h52h-merge
Harden static-trampoline code-table lookup against path attacks (GHSA-
fq46-69xf-x5gf)
s390x: pass 128-bit integer arguments to closures by reference
aarch64: fix homogeneous-aggregate detection (HFA/HVA)
aarch64: place spilled large-struct pointer at an 8-byte-aligned slot
Harden static-trampoline code-table lookup against path attacks
Fix heap use-after-free in Darwin trampoline-table closure allocator
(GHSA-23hx-9rxv-9qfp)
Merge remote-tracking branch 'origin/master' into fix/ghsa-23hx-9rxv-9qfp-
trampoline-uaf
Reject x86-64 vector types with an undefined calling convention
(GHSA-5pc3-hr6f-q3mm)
Reject x86-64 vector types with an undefined calling convention
Fix heap use-after-free in Darwin trampoline-table closure allocator
Fix WASM heap view indexing at 2 GiB and above
mips: Use CFI directives in N32/N64 assembly
configure: keep assembler defaults in sync with final CFLAGS
x86-64: return a struct with one long double member in %st0
Fix unbounded executable mmap retries
configure: honor explicit --enable-docs
closures: keep the dlmalloc 2.8.6 additions static
x86-64: copy the upper half of 16-byte vector arguments in call plans
riscv: ignore return buffer for void calls
x86-64: fix build with missing CFI
configure: respect every explicit libdir spelling
mips: bound small complex return stores
mips: fix O32 complex call and closure returns
ci: name the QEMU binfmt package correctly
aarch64: fix small composite stack slots on Darwin
aarch64: match Darwin stack slots to compiler ABI
testsuite: check a small struct passed on the stack
aarch64: give small composites full stack slots on Darwin
sparc64: fix small integer complex ABI handling
ci: fix QEMU package provisioning on Ubuntu 26.04
ci: keep MIPS64EL cross build on Ubuntu 24.04
ci: fix qemu package provisioning on Ubuntu 26.04
x86-64: fix build with missing CFI
configure: respect every explicit libdir spelling
NetBSD: handle sysconf failure in ffi_closure_alloc
README: note cross-architecture ABI improvements
arm: fix struct return argument space and small complex values
arm: pass sub-word complex arguments to big-endian closures in place
arm: lay out the arguments behind the hidden struct return pointer
loongarch: add support for complex types
riscv: add support for complex types
mips: fix N32/N64 soft-float returns of floating-point structs
mips: fix big-endian N32/N64 closure returns of small integers
powerpc: add complex type support for 32-bit SYSV
powerpc: fix big-endian closure returns of small structs
x86: pass complex arguments of up to 4 bytes like structs on i386
testsuite: complex arguments near register exhaustion, small integer complex
testsuite: use register-sized struct return storage
x86: leave complex arguments out of native raw calls
testsuite: use register-sized complex return storage
mips: fix big-endian N32/N64 closure returns of small integers
powerpc: fix big-endian

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.8.0.bb => libffi_3.8.1.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.8.0.bb => libffi_3.8.1.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 8808f502fb..e1a6b187f5 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 4f0da02754f86ec1aa38b2207872386b19605ec1 Mon Sep 17 00:00:00 2001
+From 948a108c78f9030d1f1ea87af62ccd257da4b82b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 826b453..54a41d8 100644
+index 63731dd..cd78322 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -429,7 +429,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -449,7 +449,7 @@ done
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.8.0.bb b/meta/recipes-support/libffi/libffi_3.8.1.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.8.0.bb
rename to meta/recipes-support/libffi/libffi_3.8.1.bb
index 583b143157..318cc7ef46 100644
--- a/meta/recipes-support/libffi/libffi_3.8.0.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5e9a8df556846bb3d1edec0d968a2311"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4"
+SRC_URI[sha256sum] = "81e879c094cc5ec3186c48510c6385ac6b3e866192e8bc71a35245703757ee40"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============1034096055328293538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.8.0/libffi-3.8.0.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.8.1/libffi-3.8.1.tar.gz file://not-win32.patch"
packages/x86-64-v3-poky-linux/libffi: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 196480 to 174784 (-11%)
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: FILELIST: removed "/usr/lib/.debug/libffi.so.8.5.0", added "/usr/lib/.debug/libffi.so.8.5.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGSIZE changed from 54058 to 54368 (+1%)
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 390473 to 395455 (+1%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: FILELIST: directory renamed /usr/src/debug/libffi/3.8.0/src/x86 -> /usr/src/debug/libffi/3.8.1/src/x86, directory renamed /usr/src/debug/libffi/3.8.0/include -> /usr/src/debug/libffi/3.8.1/include, directory renamed /usr/src/debug/libffi/3.8.0/src -> /usr/src/debug/libffi/3.8.1/src
packages/x86-64-v3-poky-linux/libffi/libffi-src: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 75903 to 63615 (-16%)
packages/x86-64-v3-poky-linux/libffi/libffi: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.5.0", added "/usr/lib/libffi.so.8.5.1"
packages/x86-64-v3-poky-linux/libffi/libffi: PV changed from "3.8.0" to "3.8.1"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so.8.5.0 moved to /usr/lib/libffi.so.8.5.1
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so.8.5.0 moved to /usr/lib/libffi.so.8.5.1

--===============1034096055328293538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.8.0-3.8.1.patch"

RnJvbSA1Nzc2OTc3YzZhN2I4Y2Y1MjFkZjQ1ZDdkOTg3YmQ2ZmRhZmZjNDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6NDM6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmZmk6IHVwZ3JhZGUgMy44LjAgLT4gMy44LjEKClJlbGVhc2UgMy44LjEKdGVzdHN1aXRlOiBh
ZGQgbmV3IHRlc3RzIHRvIEVYVFJBX0RJU1Qgc28gdGhleSBzaGlwIGluIHRoZSByZWxlYXNlCnRl
c3RzdWl0ZTogYWRkIHRoZSBuZXcgdGVzdHMgdG8gRVhUUkFfRElTVCBzbyB0aGV5IHNoaXAgaW4g
dGhlIHJlbGVhc2UKUkVBRE1FOiB0aWdodGVuIHRoZSBUQkQgY2hhbmdlbG9nIGFuZCBmb2xkIGlu
IHRoZSBzZWN1cml0eSBmaXhlcwpjaShlbXNjcmlwdGVuKTogZ2V0IHRoZSBicm93c2VyIHRlc3Qg
am9iIGdyZWVuIChweXRlc3QgOS54ICsKY2xvc3VyZV9tbWFwX2ZhaWx1cmUpCnRlc3RzdWl0ZTog
Z3VhcmQgY2xvc3VyZV9tbWFwX2ZhaWx1cmUgZm9yIG5vbi1nbGliYyBoYXJuZXNzZXMKY2koZW1z
Y3JpcHRlbik6IGJ1bXAgcHl0ZXN0LXB5b2RpZGUgMC41OS4yIC0+IDAuNTkuNCBmb3IgcHl0ZXN0
IDkueAp0ZXN0c3VpdGU6IGd1YXJkIGNsb3N1cmVfcmF3IG9uICFGRklfTk9fUkFXX0FQSSAoZml4
IEVtc2NyaXB0ZW4gQ0kpCmNpOiB4ZmFpbCB4ODZfNjQgQW5kcm9pZCBsZC1zdHJ1Y3QgcmV0dXJu
OyBkcm9wIGRlYWQgbWFjb3MtMTQgcnVubmVyCkNJOiBtYWtlIGRpc3QgUERGIGJlc3QtZWZmb3J0
IChBbmRyb2lkKSBhbmQgeGZhaWwgY2xvc3VyZV9yYXcgb24gaTY4NiBNU1ZDCnRlc3RzdWl0ZTog
eGZhaWwgY2xvc3VyZV9yYXcgb24gaTY4NiBNU1ZDIChsaWJmZmkgIzEwNzQpCmJ1aWxkOiBtYWtl
IHRoZSBkaXN0LWhvb2sgUERGIG1hbnVhbCB0cnVseSBiZXN0LWVmZm9ydApDSTogZml4IHJlZ3Jl
c3Npb25zIGZyb20gbmV3IHRlc3RzICsgY29tcGxldGUgdGhlIGRpc3QtaG9vayBkb2NzIGd1YXJk
CnRlc3RzdWl0ZTogeGZhaWwgbW9yZSBtaXBzIE42NCBjb21wbGV4L2ZwLXJldHVybiB0ZXN0cyAo
bGliZmZpICMxMDcxKQpidWlsZDogb25seSBidWlsZCB0aGUgUERGIG1hbnVhbCBpbiBkaXN0LWhv
b2sgd2hlbiB0ZXhpMnBkZiBpcyBwcmVzZW50CnRlc3RzdWl0ZTogZml4IGNsb3N1cmVfcmF3IHVz
ZXJfZGF0YSBjYXN0IGZvciBMTFA2NCAoV2luZG93cykKUkVBRE1FOiBjb21wbGV0ZSBhbmQgY29u
c29saWRhdGUgdGhlIFRCRCBjaGFuZ2Vsb2cKQ0k6IGZpeCBtYWtlIGRpc3QgZG9jIGJ1aWxkIGFu
ZCBjbG9zdXJlX21tYXBfZmFpbHVyZSBvbiBBbmRyb2lkClJFQURNRTogY29tcGxldGUgYW5kIGNv
bnNvbGlkYXRlIHRoZSBUQkQgY2hhbmdlbG9nIGZvciB0aGUgcmVsZWFzZQp0ZXN0c3VpdGU6IHhm
YWlsIG1pcHMgTjY0IGNvbXBsZXgvZnAtcmV0dXJuIHRlc3RzIChsaWJmZmkgIzEwNzEpCnRlc3Rz
dWl0ZTogcmVzdHJpY3QgY2xvc3VyZV9tbWFwX2ZhaWx1cmUgdG8gZ2xpYmMgTGludXgKYnVpbGQ6
IG9ubHkgYnVpbGQgZG9jcyBpbiBkaXN0LWhvb2sgd2hlbiBkb2NzIGFyZSBlbmFibGVkCmNvbmZp
Z3VyZToga2VlcCBhc3NlbWJsZXIgZGVmYXVsdHMgaW4gc3luYyB3aXRoIGZpbmFsIENGTEFHUwpt
aXBzOiBVc2UgQ0ZJIGRpcmVjdGl2ZXMgaW4gTjMyL042NCBhc3NlbWJseQpGaXggV0FTTSBoZWFw
IHZpZXcgaW5kZXhpbmcgYXQgMiBHaUIgYW5kIGFib3ZlCng4Ni02NDogcmV0dXJuIGEgc3RydWN0
IHdpdGggb25lIGxvbmcgZG91YmxlIG1lbWJlciBpbiAlc3QwCkZpeCByYXctQVBJIGNsb3N1cmVz
IHVuZGVyIHN0YXRpYyB0cmFtcG9saW5lcyAoR0hTQS13Nmo5LXc1M2YtMjg1NykKeDg2OiBzdXBw
b3J0IHN0YXRpYyB0cmFtcG9saW5lcyBpbiB0aGUgaTM4NiBuYXRpdmUgcmF3IGNsb3N1cmUgcGF0
aApyYXcgQVBJOiBwYXNzIHRoZSBjbG9zdXJlLCBub3QgY29kZWxvYywgYXMgdGhlIHRyYW5zbGF0
ZS1hcmdzIHVzZXJfZGF0YQpzMzkweDogcGFzcyAxMjgtYml0IGludGVnZXIgYXJndW1lbnRzIHRv
IGNsb3N1cmVzIGJ5IHJlZmVyZW5jZSAoR0hTQS0Kd2Y4bS1xcjN4LWNjaDQpCk1lcmdlIHJlbW90
ZS10cmFja2luZyBicmFuY2ggJ29yaWdpbi9tYXN0ZXInIGludG8gd2Y4bS1tZXJnZQphYXJjaDY0
OiBmaXggbGFyZ2Utc3RydWN0IHBvaW50ZXIgb2Zmc2V0IGFuZCBIRkEvSFZBIGRldGVjdGlvbgoo
R0hTQS1oNTJoLTM3NTkteHFtNCkKTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnb3JpZ2lu
L21hc3RlcicgaW50byBoNTJoLW1lcmdlCkhhcmRlbiBzdGF0aWMtdHJhbXBvbGluZSBjb2RlLXRh
YmxlIGxvb2t1cCBhZ2FpbnN0IHBhdGggYXR0YWNrcyAoR0hTQS0KZnE0Ni02OXhmLXg1Z2YpCnMz
OTB4OiBwYXNzIDEyOC1iaXQgaW50ZWdlciBhcmd1bWVudHMgdG8gY2xvc3VyZXMgYnkgcmVmZXJl
bmNlCmFhcmNoNjQ6IGZpeCBob21vZ2VuZW91cy1hZ2dyZWdhdGUgZGV0ZWN0aW9uIChIRkEvSFZB
KQphYXJjaDY0OiBwbGFjZSBzcGlsbGVkIGxhcmdlLXN0cnVjdCBwb2ludGVyIGF0IGFuIDgtYnl0
ZS1hbGlnbmVkIHNsb3QKSGFyZGVuIHN0YXRpYy10cmFtcG9saW5lIGNvZGUtdGFibGUgbG9va3Vw
IGFnYWluc3QgcGF0aCBhdHRhY2tzCkZpeCBoZWFwIHVzZS1hZnRlci1mcmVlIGluIERhcndpbiB0
cmFtcG9saW5lLXRhYmxlIGNsb3N1cmUgYWxsb2NhdG9yCihHSFNBLTIzaHgtOXJ4di05cWZwKQpN
ZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdvcmlnaW4vbWFzdGVyJyBpbnRvIGZpeC9naHNh
LTIzaHgtOXJ4di05cWZwLQp0cmFtcG9saW5lLXVhZgpSZWplY3QgeDg2LTY0IHZlY3RvciB0eXBl
cyB3aXRoIGFuIHVuZGVmaW5lZCBjYWxsaW5nIGNvbnZlbnRpb24KKEdIU0EtNXBjMy1ocjZmLXEz
bW0pClJlamVjdCB4ODYtNjQgdmVjdG9yIHR5cGVzIHdpdGggYW4gdW5kZWZpbmVkIGNhbGxpbmcg
Y29udmVudGlvbgpGaXggaGVhcCB1c2UtYWZ0ZXItZnJlZSBpbiBEYXJ3aW4gdHJhbXBvbGluZS10
YWJsZSBjbG9zdXJlIGFsbG9jYXRvcgpGaXggV0FTTSBoZWFwIHZpZXcgaW5kZXhpbmcgYXQgMiBH
aUIgYW5kIGFib3ZlCm1pcHM6IFVzZSBDRkkgZGlyZWN0aXZlcyBpbiBOMzIvTjY0IGFzc2VtYmx5
CmNvbmZpZ3VyZToga2VlcCBhc3NlbWJsZXIgZGVmYXVsdHMgaW4gc3luYyB3aXRoIGZpbmFsIENG
TEFHUwp4ODYtNjQ6IHJldHVybiBhIHN0cnVjdCB3aXRoIG9uZSBsb25nIGRvdWJsZSBtZW1iZXIg
aW4gJXN0MApGaXggdW5ib3VuZGVkIGV4ZWN1dGFibGUgbW1hcCByZXRyaWVzCmNvbmZpZ3VyZTog
aG9ub3IgZXhwbGljaXQgLS1lbmFibGUtZG9jcwpjbG9zdXJlczoga2VlcCB0aGUgZGxtYWxsb2Mg
Mi44LjYgYWRkaXRpb25zIHN0YXRpYwp4ODYtNjQ6IGNvcHkgdGhlIHVwcGVyIGhhbGYgb2YgMTYt
Ynl0ZSB2ZWN0b3IgYXJndW1lbnRzIGluIGNhbGwgcGxhbnMKcmlzY3Y6IGlnbm9yZSByZXR1cm4g
YnVmZmVyIGZvciB2b2lkIGNhbGxzCng4Ni02NDogZml4IGJ1aWxkIHdpdGggbWlzc2luZyBDRkkK
Y29uZmlndXJlOiByZXNwZWN0IGV2ZXJ5IGV4cGxpY2l0IGxpYmRpciBzcGVsbGluZwptaXBzOiBi
b3VuZCBzbWFsbCBjb21wbGV4IHJldHVybiBzdG9yZXMKbWlwczogZml4IE8zMiBjb21wbGV4IGNh
bGwgYW5kIGNsb3N1cmUgcmV0dXJucwpjaTogbmFtZSB0aGUgUUVNVSBiaW5mbXQgcGFja2FnZSBj
b3JyZWN0bHkKYWFyY2g2NDogZml4IHNtYWxsIGNvbXBvc2l0ZSBzdGFjayBzbG90cyBvbiBEYXJ3
aW4KYWFyY2g2NDogbWF0Y2ggRGFyd2luIHN0YWNrIHNsb3RzIHRvIGNvbXBpbGVyIEFCSQp0ZXN0
c3VpdGU6IGNoZWNrIGEgc21hbGwgc3RydWN0IHBhc3NlZCBvbiB0aGUgc3RhY2sKYWFyY2g2NDog
Z2l2ZSBzbWFsbCBjb21wb3NpdGVzIGZ1bGwgc3RhY2sgc2xvdHMgb24gRGFyd2luCnNwYXJjNjQ6
IGZpeCBzbWFsbCBpbnRlZ2VyIGNvbXBsZXggQUJJIGhhbmRsaW5nCmNpOiBmaXggUUVNVSBwYWNr
YWdlIHByb3Zpc2lvbmluZyBvbiBVYnVudHUgMjYuMDQKY2k6IGtlZXAgTUlQUzY0RUwgY3Jvc3Mg
YnVpbGQgb24gVWJ1bnR1IDI0LjA0CmNpOiBmaXggcWVtdSBwYWNrYWdlIHByb3Zpc2lvbmluZyBv
biBVYnVudHUgMjYuMDQKeDg2LTY0OiBmaXggYnVpbGQgd2l0aCBtaXNzaW5nIENGSQpjb25maWd1
cmU6IHJlc3BlY3QgZXZlcnkgZXhwbGljaXQgbGliZGlyIHNwZWxsaW5nCk5ldEJTRDogaGFuZGxl
IHN5c2NvbmYgZmFpbHVyZSBpbiBmZmlfY2xvc3VyZV9hbGxvYwpSRUFETUU6IG5vdGUgY3Jvc3Mt
YXJjaGl0ZWN0dXJlIEFCSSBpbXByb3ZlbWVudHMKYXJtOiBmaXggc3RydWN0IHJldHVybiBhcmd1
bWVudCBzcGFjZSBhbmQgc21hbGwgY29tcGxleCB2YWx1ZXMKYXJtOiBwYXNzIHN1Yi13b3JkIGNv
bXBsZXggYXJndW1lbnRzIHRvIGJpZy1lbmRpYW4gY2xvc3VyZXMgaW4gcGxhY2UKYXJtOiBsYXkg
b3V0IHRoZSBhcmd1bWVudHMgYmVoaW5kIHRoZSBoaWRkZW4gc3RydWN0IHJldHVybiBwb2ludGVy
Cmxvb25nYXJjaDogYWRkIHN1cHBvcnQgZm9yIGNvbXBsZXggdHlwZXMKcmlzY3Y6IGFkZCBzdXBw
b3J0IGZvciBjb21wbGV4IHR5cGVzCm1pcHM6IGZpeCBOMzIvTjY0IHNvZnQtZmxvYXQgcmV0dXJu
cyBvZiBmbG9hdGluZy1wb2ludCBzdHJ1Y3RzCm1pcHM6IGZpeCBiaWctZW5kaWFuIE4zMi9ONjQg
Y2xvc3VyZSByZXR1cm5zIG9mIHNtYWxsIGludGVnZXJzCnBvd2VycGM6IGFkZCBjb21wbGV4IHR5
cGUgc3VwcG9ydCBmb3IgMzItYml0IFNZU1YKcG93ZXJwYzogZml4IGJpZy1lbmRpYW4gY2xvc3Vy
ZSByZXR1cm5zIG9mIHNtYWxsIHN0cnVjdHMKeDg2OiBwYXNzIGNvbXBsZXggYXJndW1lbnRzIG9m
IHVwIHRvIDQgYnl0ZXMgbGlrZSBzdHJ1Y3RzIG9uIGkzODYKdGVzdHN1aXRlOiBjb21wbGV4IGFy
Z3VtZW50cyBuZWFyIHJlZ2lzdGVyIGV4aGF1c3Rpb24sIHNtYWxsIGludGVnZXIgY29tcGxleAp0
ZXN0c3VpdGU6IHVzZSByZWdpc3Rlci1zaXplZCBzdHJ1Y3QgcmV0dXJuIHN0b3JhZ2UKeDg2OiBs
ZWF2ZSBjb21wbGV4IGFyZ3VtZW50cyBvdXQgb2YgbmF0aXZlIHJhdyBjYWxscwp0ZXN0c3VpdGU6
IHVzZSByZWdpc3Rlci1zaXplZCBjb21wbGV4IHJldHVybiBzdG9yYWdlCm1pcHM6IGZpeCBiaWct
ZW5kaWFuIE4zMi9ONjQgY2xvc3VyZSByZXR1cm5zIG9mIHNtYWxsIGludGVnZXJzCnBvd2VycGM6
IGZpeCBiaWctZW5kaWFuCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDUwMDAg
Y2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2ht
ZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xp
YmZmaS9ub3Qtd2luMzIucGF0Y2ggICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2xpYmZmaS97bGli
ZmZpXzMuOC4wLmJiID0+IGxpYmZmaV8zLjguMS5iYn0gICAgICAgICAgICAgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJmZmkve2xpYmZmaV8zLjguMC5iYiA9PiBsaWJmZmlfMy44LjEu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZm
aS9ub3Qtd2luMzIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25v
dC13aW4zMi5wYXRjaAppbmRleCA4ODA4ZjUwMmZiLi5lMWE2YjE4N2Y1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNGYwZGEwMjc1NGY4NmVjMWFhMzhiMjIwNzg3MjM4NmIxOTYwNWVjMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTQ4YTEwOGM3OGY5MDMwZDFmMWVhODdhZjYy
Y2NkMjU3ZGE0YjgyYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUsIDQgRmViIDIwMTYgMTY6MjI6NTAg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZmZpOiBlbnN1cmUgc3lzcm9vdCBwYXRocyBhcmUg
bm90IGluIGxpYmZmaS5wYwpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKLWluZGV4IDgyNmI0NTMuLjU0YTQxZDggMTAwNjQ0CitpbmRleCA2MzczMWRkLi5j
ZDc4MzIyIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBA
IC00MjksNyArNDI5LDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3RvcnksCitAQCAt
NDQ5LDcgKzQ0OSw3IEBAIGRvbmUKICAKICAjIFRoZXNlIHZhcmlhYmxlcyBhcmUgb25seSBldmVy
IHVzZWQgd2hlbiB3ZSBjcm9zcy1idWlsZCB0byBYODZfV0lOMzIuCiAgIyBBbmQgd2Ugb25seSBz
dXBwb3J0IHRoaXMgd2l0aCBHQ0MsIHNvLi4uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJmZmkvbGliZmZpXzMuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZp
L2xpYmZmaV8zLjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuOC4xLmJiCmluZGV4IDU4M2IxNDMxNTcuLjMxOGNj
N2VmNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy44
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjguMS5iYgpA
QCAtMTMsNyArMTMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01
ZTlhOGRmNTU2ODQ2YmIzZDFlZGVjMGQ5NjhhMjMxMSIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFT
RV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQTn0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovL25vdC13aW4zMi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3ZGEzZTJkOWExNzFlYjBhMDM4ZjU5MmVjYWQzZmYyYmIyNTUwZjM0OTZkODdiM2IyOWFk
MGNmNDQzMGMwZGI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZTg3OWMwOTRjYzVlYzMxODZj
NDg1MTBjNjM4NWFjNmIzZTg2NjE5MmU4YmM3MWEzNTI0NTcwMzc1N2VlNDAiCiAKIEVYVFJBX09F
Q09ORiA9ICItLWRpc2FibGUtYnVpbGRkaXIiCiBFWFRSQV9PRUNPTkY6Y2xhc3MtbmF0aXZlICs9
ICItLXdpdGgtZ2NjLWFyY2g9Z2VuZXJpYyIKLS0gCjIuNDcuMQoK

--===============1034096055328293538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libffi-changelog.txt"

Release 3.8.1
testsuite: add new tests to EXTRA_DIST so they ship in the release
testsuite: add the new tests to EXTRA_DIST so they ship in the release
README: tighten the TBD changelog and fold in the security fixes
ci(emscripten): get the browser test job green (pytest 9.x +
closure_mmap_failure)
testsuite: guard closure_mmap_failure for non-glibc harnesses
ci(emscripten): bump pytest-pyodide 0.59.2 -> 0.59.4 for pytest 9.x
testsuite: guard closure_raw on !FFI_NO_RAW_API (fix Emscripten CI)
ci: xfail x86_64 Android ld-struct return; drop dead macos-14 runner
CI: make dist PDF best-effort (Android) and xfail closure_raw on i686 MSVC
testsuite: xfail closure_raw on i686 MSVC (libffi #1074)
build: make the dist-hook PDF manual truly best-effort
CI: fix regressions from new tests + complete the dist-hook docs guard
testsuite: xfail more mips N64 complex/fp-return tests (libffi #1071)
build: only build the PDF manual in dist-hook when texi2pdf is present
testsuite: fix closure_raw user_data cast for LLP64 (Windows)
README: complete and consolidate the TBD changelog
CI: fix make dist doc build and closure_mmap_failure on Android
README: complete and consolidate the TBD changelog for the release
testsuite: xfail mips N64 complex/fp-return tests (libffi #1071)
testsuite: restrict closure_mmap_failure to glibc Linux
build: only build docs in dist-hook when docs are enabled
configure: keep assembler defaults in sync with final CFLAGS
mips: Use CFI directives in N32/N64 assembly
Fix WASM heap view indexing at 2 GiB and above
x86-64: return a struct with one long double member in %st0
Fix raw-API closures under static trampolines (GHSA-w6j9-w53f-2857)
x86: support static trampolines in the i386 native raw closure path
raw API: pass the closure, not codeloc, as the translate-args user_data
s390x: pass 128-bit integer arguments to closures by reference (GHSA-
wf8m-qr3x-cch4)
Merge remote-tracking branch 'origin/master' into wf8m-merge
aarch64: fix large-struct pointer offset and HFA/HVA detection
(GHSA-h52h-3759-xqm4)
Merge remote-tracking branch 'origin/master' into h52h-merge
Harden static-trampoline code-table lookup against path attacks (GHSA-
fq46-69xf-x5gf)
s390x: pass 128-bit integer arguments to closures by reference
aarch64: fix homogeneous-aggregate detection (HFA/HVA)
aarch64: place spilled large-struct pointer at an 8-byte-aligned slot
Harden static-trampoline code-table lookup against path attacks
Fix heap use-after-free in Darwin trampoline-table closure allocator
(GHSA-23hx-9rxv-9qfp)
Merge remote-tracking branch 'origin/master' into fix/ghsa-23hx-9rxv-9qfp-
trampoline-uaf
Reject x86-64 vector types with an undefined calling convention
(GHSA-5pc3-hr6f-q3mm)
Reject x86-64 vector types with an undefined calling convention
Fix heap use-after-free in Darwin trampoline-table closure allocator
Fix WASM heap view indexing at 2 GiB and above
mips: Use CFI directives in N32/N64 assembly
configure: keep assembler defaults in sync with final CFLAGS
x86-64: return a struct with one long double member in %st0
Fix unbounded executable mmap retries
configure: honor explicit --enable-docs
closures: keep the dlmalloc 2.8.6 additions static
x86-64: copy the upper half of 16-byte vector arguments in call plans
riscv: ignore return buffer for void calls
x86-64: fix build with missing CFI
configure: respect every explicit libdir spelling
mips: bound small complex return stores
mips: fix O32 complex call and closure returns
ci: name the QEMU binfmt package correctly
aarch64: fix small composite stack slots on Darwin
aarch64: match Darwin stack slots to compiler ABI
testsuite: check a small struct passed on the stack
aarch64: give small composites full stack slots on Darwin
sparc64: fix small integer complex ABI handling
ci: fix QEMU package provisioning on Ubuntu 26.04
ci: keep MIPS64EL cross build on Ubuntu 24.04
ci: fix qemu package provisioning on Ubuntu 26.04
x86-64: fix build with missing CFI
configure: respect every explicit libdir spelling
NetBSD: handle sysconf failure in ffi_closure_alloc
README: note cross-architecture ABI improvements
arm: fix struct return argument space and small complex values
arm: pass sub-word complex arguments to big-endian closures in place
arm: lay out the arguments behind the hidden struct return pointer
loongarch: add support for complex types
riscv: add support for complex types
mips: fix N32/N64 soft-float returns of floating-point structs
mips: fix big-endian N32/N64 closure returns of small integers
powerpc: add complex type support for 32-bit SYSV
powerpc: fix big-endian closure returns of small structs
x86: pass complex arguments of up to 4 bytes like structs on i386
testsuite: complex arguments near register exhaustion, small integer complex
testsuite: use register-sized struct return storage
x86: leave complex arguments out of native raw calls
testsuite: use register-sized complex return storage
mips: fix big-endian N32/N64 closure returns of small integers
powerpc: fix big-endian SVR4 closure returns of 1- and 2-byte structs
mips: fix N32/N64 soft-float returns of floating-point structs
x86: pass complex arguments of up to 4 bytes like structs on i386
powerpc64: fix big-endian ELFv2 closure returns of 1- to 4-byte structs
testsuite: check return values of structs with one or two floating-point fields
testsuite: check integer complex types smaller than a register
testsuite: check complex arguments when argument registers run low
testsuite: check closures.o keeps dlmalloc symbols private
closures: keep the dlmalloc 2.8.6 additions static
x86-64: copy the upper half of 16-byte vector arguments in call plans
riscv: ignore return buffer for void calls
NetBSD: handle sysconf failure in ffi_closure_alloc
closures: check calloc return values in ffi_trampoline_table_alloc
Fix typos
closures: check calloc return values in ffi_trampoline_table_alloc
README: note the ppc64 complex long double, closure, wasm and Apple fixes
powerpc64: keep _Complex long double in step with the abi's long double
testsuite: pin -mlong-double-128 by compiler, not by target triplet
CI: test ppc64le with a 64-bit long double
powerpc64: fix _Complex long double when long double is 64 bits
Emscripten: Make closures work with wasm stack switching
build: check linker family before GNU ld version
CI: Update Emscripten, Node version, and pytest-pyodide to most recent versions
build: check linker family before GNU ld version
closures: handle page size lookup failure
testsuite: propagate tsan worker failures
Added `subsections_via_symbols` for Apple platforms
closures: handle page size lookup failure
testsuite: propagate tsan worker failures
README: start TBD notes with aarch64/arm big-endian fix
aarch64, arm: fix big-endian sub-word argument/return offsets
arm: fix big-endian sub-word argument offsets in closures
aarch64: fix big-endian argument and return offsets in closures
release: verify README Status line matches the tag
README: update Status line to 3.8.0

--===============1034096055328293538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 196480 to 174784 (-11%)
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 75903 to 63615 (-16%)
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.5.0", added "/usr/lib/libffi.so.8.5.1"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so.8.5.0 moved to /usr/lib/libffi.so.8.5.1
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.5.0 to libffi.so.8.5.1
  /usr/lib/libffi.so.8.5.0 moved to /usr/lib/libffi.so.8.5.1

--===============1034096055328293538==--
