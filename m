Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41807.1793018709201369215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 05:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=RbktXkEq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6952425DF
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 05:45:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 348C03F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793018708; bh=Cw9kf4nxde+kpvwJ/bF1d0DT3KTbFl0oLbU97LN8DVA=;
	h=From:To:Subject:Date:From;
	b=RbktXkEqv7jRAXSg0sgqTpkzqAZ1ofrIDhod2Hgtw32oWjcr9xxcSyLwjacmz+9oM
	 FWmINku2Q48ZrwXqPWwlJdKEusYZqqm6TexGp/vqvN993x0JG18qgg8+TBLm/AXzhW
	 0RSq0ZMJpwlUZ4fAHJM6nrGwQNfptUch83tByqm0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libunwind: update patch status
Date: Mon, 26 Oct 2026 12:45:02 +0000
Message-ID: <20261026124502.1731660-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 12:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248679
Content-Type: text/plain; charset="utf-8"

More patches have been merged upstream, and ensure we reference the
upstream revisions for clarity.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch | 2 +-
 ...2-coredump-use-glibc-or-musl-register-names-as-appropr.patch | 2 +-
 .../libunwind/libunwind/0005-Handle-musl-on-PPC32.patch         | 2 +-
 meta/recipes-support/libunwind/libunwind/libatomic.patch        | 2 +-
 meta/recipes-support/libunwind/libunwind/mips-byte-order.patch  | 2 +-
 meta/recipes-support/libunwind/libunwind_1.8.3.bb               | 1 +
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-t=
est-sve-signal-check-that-SVE-is-prese.patch b/meta/recipes-support/libun=
wind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.=
patch
index f7af9a3fce0..c1c0b50033e 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve=
-signal-check-that-SVE-is-prese.patch
+++ b/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve=
-signal-check-that-SVE-is-prese.patch
@@ -18,7 +18,7 @@ Handle this case by checking HWCAP for SVE support, and=
 skipping the
 test unless we know it is available.  This check is Linux-specific at
 present, but the logic is easily extended.
=20
-Upstream-Status: Backport
+Upstream-Status: Backport [c8499e99dc7422a31c126f2954c8150c62d8a017]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  tests/Garm64-test-sve-signal.c | 19 +++++++++++++++++++
diff --git a/meta/recipes-support/libunwind/libunwind/0002-coredump-use-g=
libc-or-musl-register-names-as-appropr.patch b/meta/recipes-support/libun=
wind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.=
patch
index f458bc3c6f9..4f07f65c8c3 100644
--- a/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or=
-musl-register-names-as-appropr.patch
+++ b/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or=
-musl-register-names-as-appropr.patch
@@ -10,7 +10,7 @@ Handle this by using a macro to use the correct names.
=20
 Closes #708.
=20
-Upstream-Status: Backport
+Upstream-Status: Backport [df0807c1c2302c364c281d3d1109ddc10c9c7b19]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/coredump/_UCD_access_reg_linux.c | 69 ++++++++++++++++------------
diff --git a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on=
-PPC32.patch b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-=
on-PPC32.patch
index 63d3c85de49..396c0a45333 100644
--- a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.=
patch
+++ b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.=
patch
@@ -13,7 +13,7 @@ structures.
=20
 Closes #709.
=20
-Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
710]
+Upstream-Status: Backport [71559717599cecc4d1ccb2061766ec5c12e10ac6]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/ppc32/Ginit.c      | 13 ++++++++++---
diff --git a/meta/recipes-support/libunwind/libunwind/libatomic.patch b/m=
eta/recipes-support/libunwind/libunwind/libatomic.patch
index e783128e2c0..f6abea44a94 100644
--- a/meta/recipes-support/libunwind/libunwind/libatomic.patch
+++ b/meta/recipes-support/libunwind/libunwind/libatomic.patch
@@ -7,7 +7,7 @@ Some OS runtimes require libatomic be linked in separatel=
y to get
 standard atomic operations to work. Try to detect that at configure
 time.
=20
-Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
732/]
+Upstream-Status: Denied [https://github.com/libunwind/libunwind/pull/732=
/]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  configure.ac | 12 ++++++++++++
diff --git a/meta/recipes-support/libunwind/libunwind/mips-byte-order.pat=
ch b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
index 3336b790553..5c73eaf97fe 100644
--- a/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
+++ b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 2/2] byte order
 endian.h on musl/mips can't be included in __ASSEMBLER__ mode,
 so use the __BYTE_ORDER__ symbol instead.
=20
-Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
816]
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/commit=
/b2d2e81e5fe53b01a0dd39e2e634f963ebeaab43]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/mips/getcontext.S | 3 +--
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.3.bb
index 1a3a816d785..27ab122eb34 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -52,4 +52,5 @@ BBCLASSEXTEND =3D "native"
 # libunwind-1.8.1/src/elfxx.c:205:44: error: passing argument 3 of '_Upp=
c32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer=
-types]
 # libunwind-1.8.1/src/elfxx.c:279:52: error: passing argument 3 of '_Upp=
c32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer=
-types]
 # and others
+# Fixed in https://github.com/libunwind/libunwind/commit/43e609e3f37a3c3=
68d3732e43526ea00bd4e3609
 CFLAGS:append:powerpc:libc-musl =3D " -Wno-error=3Dincompatible-pointer-=
types"
--=20
2.43.0

