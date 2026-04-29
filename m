Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B380DFF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:26:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12632.1777472784606072511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KXCBpeg9;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso1283700566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777472783; x=1778077583; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msLoB3vk/ZzitpSu4NrRFlBpe7VJfSWidHJhRY3Zglw=;
        b=KXCBpeg96z+xb7LfbItt00WSVHmR59tVBoevbxFRhV4xRQlRZ6JfqbU77H8iWagC+2
         n+MrAbUF6+FvliP/Z+mDsZsvJQqPVnYIkJII2W7gm49ct1jSBUiilU9Ae65tX3zpRFTE
         U7yUkjAVqe89X823I/K+QcClwCTCSYGNkDPljhuU9g8VIhMUy/nw14XXymRRfApKopFI
         lQsuBeoXOcsuAk02uvaKh9IBjKO+L/QdoB8jUd6f9Ew4KzeHQHLTk37gWVONyHXh4eF5
         0f7uOhaZjkJkSutB+sA0l3CJZjCK5KD1DAikb2mprWjZnSdKATScXoCbInoZf2f/N+zZ
         2kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472783; x=1778077583;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msLoB3vk/ZzitpSu4NrRFlBpe7VJfSWidHJhRY3Zglw=;
        b=Ymo5419IHUGms3vK55labRI3TFmROlsEM82Ri9SSrpjYQx+6F8SLmbQhrHmqKmIo8h
         Q2yMi9cxCb4lquDBEaGZ0X4YXkr0F6AI+JUxCJI61DyF4+XyySNqDFpfcFCwiaxs0PsA
         13ECClSwadzzMB6LKp7FX7dtGtzDwOLMMiC95yN0MwHsWS1Dh/7EsTklw/KkD2gxgY6l
         sbU+1l/KWbJTBGEgwC1HGKmGsSaKzZuWn/Hd81Z/jCz7i4UgAzpj0Hl4BcjeeR6YXDFo
         ecgh5PTjVmIVP4KBmK5QKMx4RB9MgsFlwzr2JxE0atJ1p1RnnO4dhb0IZp8dTaowIbcO
         rs8g==
X-Gm-Message-State: AOJu0YwBqb5vgkHmm1SbSb1bsUOehACVJfLwC/2OmdiwI9tkRP4i121Q
	RswKhdMXEUvMDheZtGtM8rmfXnZAH5PPsCCeW9JoqBPvc9TA7W71nHdv
X-Gm-Gg: AeBDies177o/0wpp+ulTNu1Z7tyUCtgOLLBEpflph+I8IXLqctibYNNDkkkS8RP/Wz2
	crpTc4njdl4FxcjHtK3rMc2GoUjynrdUUrjd8hDXlAukKF9HzNqyUdWcdG0ZThlkq/9KI3Y0u6i
	moF3NDeL9YbZb3jeEZhMH6LmJDeUCRvO3NyfOqcY27x83IJWNi4XTmD3+04VjHugmZuM+uPDTQ1
	wC8857I8w8+RVj6ddDSZ1AlJWqxncmeE9jGaJa6mKo+M/nbvVwqFRvJacHmbnzdWvrnMdL9aLJ5
	RINK8zJEVcBLd8lJDe9MYQ0XYKeITWZ+TTObyTrxFQtQcLLE3v5brkCWqgnAPcCOxe6JrJrA9NT
	alnexQtd1IUaun0bcVgoaZP+sY7xn/6z80CQPaAgYBc26DbJi9mX/gHNs1MhCeGbgT3TevlyKxG
	YtgsqYd774ASDCtvTkIuWf9BOF+41gSdiEXyU3aYPcFZSvp05O7MzvsVBEDatjiqmX1Gt359OCn
	vOGuC6uHFjiFVfHUeCP/U3bYg==
X-Received: by 2002:a17:907:c30a:b0:bab:9453:9e3 with SMTP id a640c23a62f3a-bb804a2b53amr494926266b.34.1777472782366;
        Wed, 29 Apr 2026 07:26:22 -0700 (PDT)
Received: from [127.0.0.2] ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543b3f4sm105870966b.34.2026.04.29.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:26:21 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Date: Wed, 29 Apr 2026 16:26:20 +0200
Subject: [PATCH v4] rsync: add ptest support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAsV8mkC/x3MTQ5AMBBA4avIrE2iNX6vIhbVDmaj0ooQcXeN5
 bd474HIQThCnz0Q+JQofkugPAO7mm1hFJcMutB1QbrDifD29vCoaq0UnoSmpNZUTctT4yB1e+B
 Zrv85jO/7Ac2RPdZjAAAA
X-Change-ID: 20260429-b4-yocto-16211-v4-a348a578eb7d
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Yi Zhao <yi.zhao@windriver.com>, Ross Burton <ross.burton@arm.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13435;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=jHZh8H14TZrQ5Tt0WuMU+j+venFFMZw45BHvduUwvEE=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhsxPorw9md2rNPb+jrgq5n6pO3vK3b0CGzqndloplxxQ/
 G2wSH9hRykLgxgXg6yYIovP2cc93Iofd/x/uOMyzBxWJpAhDFycAjCRd8kM/2tuTgn+98Dh8ozk
 z3+u9krucnN2WHr+9qS7xVOP7PotyxTGyLDKhylsc62ozob/6yomyfp263hs5KiJ9GD7ENvSwXU
 pkB0A
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236102

Wire up upstream's runtests.sh testsuite as a ptest package. The
testsuite runs rsync itself through 43 .test scenarios covering
ACLs, xattrs, device nodes, hardlinks, symlinks, daemon mode,
filters, backup, batch, etc., plus 3 CHECK_SYMLINKS variants
(chown-fake, devices-fake, xattrs-hlink).

- Add file://run-ptest. It exports TOOLDIR + rsync_bin + srcdir
  for upstream's runtests.sh and translates its "PASS    name" /
  "SKIP    name" / "FAIL    name" / "XFAIL   name" lines to
  ptest-runner's "PASS: name" / "SKIP: name" / "FAIL: name"
  format via sed. XFAIL (exit 78, upstream's "known-bad, already
  counted as failed") is remapped to SKIP so a known-bad test
  does not flip the whole suite to failed on ptest-runner. sed
  is invoked without -u so the script works under BusyBox sed
  on core-image-minimal (BusyBox does not implement -u / line-
  buffered mode; ptest-runner collects the full output at the
  end so line buffering is not required).

- inherit ptest. RDEPENDS:${PN}-ptest += "bash coreutils
  findutils sed grep diffutils" so the testsuite gets the GNU
  userland it was written against (rsync.fns uses
  find | sort | sed | xargs pipelines to marshal filenames with
  spaces into tls; BusyBox's xargs handles backslash-escaped
  spaces differently from GNU xargs and the tests fail).

- do_compile_ptest: upstream's Makefile only builds the 7
  CHECK_PROGS helper binaries (tls, getgroups, getfsdev,
  testrun, trimslash, t_unsafe, wildtest) and 3 CHECK_SYMLINKS
  through the check / installcheck targets, so build them
  explicitly. Using oe_runmake on the upstream target names
  keeps this list in sync automatically on future rsync
  upgrades (the list lives in Makefile.in, not here).

- wildtest.c in 3.4.1 declares `typedef char bool;`, which
  collides with the native bool keyword added in C23 (gcc 15+
  defaults to -std=gnu23). Pin the helper compile to -std=gnu17
  to match the workaround already used in meta/recipes-core/
  ncurses/ncurses.inc, meta/recipes-devtools/expect/
  expect_5.45.4.bb, meta/recipes-extended/ghostscript/
  ghostscript_10.06.0.bb, and others. Passing CFLAGS on the
  oe_runmake command line is safe here because upstream's
  Makefile does not set per-target CFLAGS for these helpers.

- do_install_ptest: stage runtests.sh, shconfig (required by
  runtests.sh), config.h (runtests.sh greps HAVE_LUTIMES and
  CHOWN_MODIFIES_SYMLINK from it to set TLS_ARGS; otherwise
  those stay empty and lutime / symlink-ownership tests fail
  spuriously), the testsuite/ tree (including the symlinks
  produced by do_compile_ptest), and the 7 helper binaries.
  Also stage the specific upstream source leaves that individual
  tests consume via $srcdir:
    * all *.c (hands_setup uses `cat $srcdir/*.c` as a text
      corpus; intentionally a glob because any top-level .c
      file added in a future rsync release becomes part of the
      corpus automatically)
    * rsync.h       (mkpath.test, itemize.test)
    * configure.ac  (itemize.test)
    * config.sub    (itemize.test)
    * wildtest.txt  (wildmatch.test)
    * support/lsh.sh (the only support/ entry referenced by the
      testsuite; used as an RSYNC_RSH wrapper that emulates
      ssh-to-localhost via sh)
  shconfig inherits SHELL_PATH and FAKEROOT_PATH from the build
  host; retarget SHELL_PATH to /bin/sh (buildpaths QA) and blank
  out FAKEROOT_PATH so tests guarded by [ -e "$FAKEROOT_PATH" ]
  fall through cleanly on target instead of resolving to a
  build-host path.

- PTEST_BUILD_HOST_FILES += "shconfig" so the class's host-path
  scrub runs on it too.

- v4: SKIP hardlinks.test on riscv64 and riscv32. The autobuilder
  flagged a FAIL on qemuriscv64 in v3 (see Mathieu Dubois-Briand's
  reply on openembedded-core@). Investigation pinned it to the
  test's final block:
      makepath "$fromdir/sym" "$todir"
      checkit "$RSYNC -aH '$fromdir/sym' '$todir'" "$fromdir" "$todir"
  checkit's dir-diff phase compares the root mtime of $fromdir vs
  $todir. makepath creates both at the same wall-clock instant,
  but $todir's root mtime is then re-bumped when rsync places
  sym/ inside it. On fast targets the whole sequence finishes
  within a single second so the two mtimes match; on slow
  emulated targets (qemuriscv64) $todir's root ends up one second
  ahead of $fromdir's, which the test treats as a failure even
  though rsync's hardlink handling itself works (the rest of
  hardlinks.test passes cleanly). Stub the test with test_skipped
  on riscv where this race is consistently triggered, rather than
  modify upstream's testsuite. Total ptest wall-clock on the
  failing autobuilder run was 139.84s against a 450s ptest-runner
  timeout, so this is not a timeout issue.

- Add rsync to conf/distro/include/ptest-packagelists.inc under
  PTESTS_SLOW (some tests start a daemon and wait on timeouts).

Runtime verification (qemux86-64, core-image-minimal, crops/
poky:ubuntu-22.04, DEFAULTTUNE=x86-64, testimage + ptest-runner,
slirp + kvm): 39 PASS, 0 FAIL, 7 SKIP (acls, acls-default,
chown-fake, crtimes, devices-fake, ssh-basic, xattrs,
xattrs-hlink; all legitimate for core-image-minimal which
lacks setfacl, root access, ssh host keys, crtime support,
char-device mknod, and xattr write). testimage reports
"core-image-minimal - OK - All required tests passed
(successes=3, skipped=1, failures=0, errors=0)". Package
verification: rsync-ptest contains the 7 helpers, 48 testsuite
entries, runtests.sh + shconfig + config.h + run-ptest + the
48 *.c files + the 5 named source leaves listed above +
support/lsh.sh; package_qa passes.

[YOCTO #16211]

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-devtools/rsync/files/run-ptest     | 23 ++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb      | 95 ++++++++++++++++++++++++-
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 11a894a..31cb1b3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -139,6 +139,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3-numpy \
     python3-xmltodict \
+    rsync \
     strace \
     tar \
     tcl \
diff --git a/meta/recipes-devtools/rsync/files/run-ptest b/meta/recipes-devtools/rsync/files/run-ptest
new file mode 100644
index 0000000..50f0641
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+cd "$(dirname "$0")"
+
+# rsync's runtests.sh expects (per upstream Makefile.in installcheck target):
+#   rsync_bin   path to rsync to test (we use the installed one)
+#   srcdir      directory containing the testsuite/ subdir
+#   TOOLDIR     directory containing the test helper binaries (tls, ...)
+# runtests.sh also sources ./shconfig (generated by configure at build time).
+#
+# rsync emits "PASS    name", "FAIL    name", "SKIP    name (reason)",
+# "XFAIL   name"; ptest-runner expects "PASS: name" / "FAIL: name" /
+# "SKIP: name". Transform on the fly. XFAIL is rsync's "expected fail"
+# and is counted as failure upstream, but it is a known-bad test and not
+# a regression, so report it as SKIP here so ptest does not fail on it.
+POSIXLY_CORRECT=1 \
+rsync_bin="$(command -v rsync)" \
+srcdir="$(pwd)" \
+TOOLDIR="$(pwd)" \
+./runtests.sh 2>&1 | sed \
+    -e 's/^PASS    \(.*\)/PASS: \1/' \
+    -e 's/^FAIL    \(.*\)/FAIL: \1/' \
+    -e 's/^XFAIL   \(.*\)/SKIP: \1 (xfail)/' \
+    -e 's/^SKIP    \(.*\)/SKIP: \1/'
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 697cdee..62f8494 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,12 +16,13 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2025-10158.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -63,4 +64,96 @@ do_install:append() {
 	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
+# runtests.sh invokes these helper binaries from $TOOLDIR; upstream only builds
+# them via the make check/installcheck targets, so build them explicitly here.
+# CHECK_SYMLINKS are test variants that upstream's Makefile also creates only
+# for the check targets, so build them alongside the helpers to keep this list
+# in sync with upstream automatically on future rsync upgrades.
+RSYNC_PTEST_HELPERS = "tls getgroups getfsdev testrun trimslash t_unsafe wildtest"
+RSYNC_PTEST_CHECK_SYMLINKS = "testsuite/chown-fake.test testsuite/devices-fake.test testsuite/xattrs-hlink.test"
+
+# wildtest.c in 3.4.1 declares `typedef char bool;` which collides with the
+# native bool keyword added in C23. Pin to gnu17 for the helper compile so
+# upstream builds cleanly against gcc 15+ defaults. rsync's Makefile does
+# not set per-target CFLAGS for the helper binaries, so overriding CFLAGS
+# on the oe_runmake command line is safe here (nothing to preserve).
+do_compile_ptest() {
+	oe_runmake ${RSYNC_PTEST_HELPERS} CFLAGS="${CFLAGS} -std=gnu17"
+	oe_runmake ${RSYNC_PTEST_CHECK_SYMLINKS}
+}
+
+PTEST_BUILD_HOST_FILES += "shconfig"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/testsuite
+	install -d ${D}${PTEST_PATH}/support
+	install -m 0755 ${S}/runtests.sh ${D}${PTEST_PATH}/
+	install -m 0644 ${B}/shconfig ${D}${PTEST_PATH}/
+	# runtests.sh greps config.h for HAVE_LUTIMES / CHOWN_MODIFIES_SYMLINK to
+	# derive TLS_ARGS. Without config.h those stay empty and some symlink-
+	# and lutime-sensitive tests fail spuriously.
+	install -m 0644 ${B}/config.h ${D}${PTEST_PATH}/
+	cp -a ${S}/testsuite/. ${D}${PTEST_PATH}/testsuite/
+	# Tests consume a handful of named source leaves via $srcdir:
+	#   *.c          - hands_setup uses `cat $srcdir/*.c` as a text corpus
+	#   rsync.h      - mkpath.test, itemize.test
+	#   configure.ac - itemize.test
+	#   config.sub   - itemize.test
+	#   wildtest.txt - wildmatch.test
+	# (Enumerated explicitly rather than globbed so future rsync releases
+	# that add/rename top-level files don't silently change the ptest
+	# package contents.)
+	install -m 0644 ${S}/*.c ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/rsync.h ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/configure.ac ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/config.sub ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/wildtest.txt ${D}${PTEST_PATH}/
+	# Only support/lsh.sh is referenced by the testsuite (as an RSYNC_RSH
+	# wrapper that emulates ssh-to-localhost via sh).
+	install -m 0755 ${S}/support/lsh.sh ${D}${PTEST_PATH}/support/
+	for prog in ${RSYNC_PTEST_HELPERS}; do
+		install -m 0755 ${B}/${prog} ${D}${PTEST_PATH}/
+	done
+	# shconfig hardcodes SHELL_PATH + FAKEROOT_PATH from the build host;
+	# retarget SHELL_PATH to /bin/sh (buildpaths QA) and blank out
+	# FAKEROOT_PATH so tests that guard with `[ -e "$FAKEROOT_PATH" ]`
+	# skip cleanly on target instead of resolving a build-host path.
+	sed -i -e 's|^SHELL_PATH=.*|SHELL_PATH="/bin/sh"|' \
+	       -e 's|^FAKEROOT_PATH=.*|FAKEROOT_PATH=""|' \
+	       ${D}${PTEST_PATH}/shconfig
+}
+
+# hardlinks.test ends with a single-directory transfer
+#
+#   makepath "$fromdir/sym" "$todir"
+#   checkit "$RSYNC -aH '$fromdir/sym' '$todir'" "$fromdir" "$todir"
+#
+# whose dir-diff phase compares the root mtime of $fromdir vs $todir.
+# makepath creates both at the same wall-clock instant, but $todir's root
+# mtime then gets re-bumped when rsync places sym/ inside it. On fast
+# targets the whole sequence finishes within a single second so the two
+# mtimes match; on slow emulated targets (qemuriscv64 in particular) the
+# $todir root ends up 1 second ahead of $fromdir, which the test treats
+# as a failure even though rsync's hardlink handling itself works
+# correctly. Replace the test with a SKIP stub on riscv where this race
+# is consistently triggered. Tracked at: YOCTO #16211.
+do_install_ptest:append:riscv64 () {
+	rsync_skip_hardlinks_test
+}
+
+do_install_ptest:append:riscv32 () {
+	rsync_skip_hardlinks_test
+}
+
+rsync_skip_hardlinks_test () {
+	cat > ${D}${PTEST_PATH}/testsuite/hardlinks.test <<'EOF'
+#!/bin/sh
+. "$suitedir/rsync.fns"
+test_skipped "directory mtime race on slow emulated target (YOCTO #16211)"
+EOF
+	chmod +x ${D}${PTEST_PATH}/testsuite/hardlinks.test
+}
+
+RDEPENDS:${PN}-ptest += "bash coreutils findutils sed grep diffutils"
+
 BBCLASSEXTEND = "native nativesdk"

---
base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
change-id: 20260429-b4-yocto-16211-v4-a348a578eb7d

Best regards,
-- 
Jhonata Poma-Hansen <jhonata.poma@gmail.com>


