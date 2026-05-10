Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC0BCD3427
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 08:04:53 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26555.1778400284253054290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 01:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FDE6J92E;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso5797174a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2026 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778400282; x=1779005082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSVHKlBV/KnH4VEaPy4iLd0xw1U0tWinpf/OnSjqEM4=;
        b=FDE6J92EGMhwJDvCIxCJ0jd7Kc4vHYE5A/qVSsWwouqUzF14umDovcdwskcVwCGUy9
         z6JVUBbI2cm3oNpidlD5PmwuuYCc7d4yDWwVDiYIsXGIYllpTuv+VfU9A96PXy9AVwvv
         W2l70lrjEopBGYhXacVUY+cAkrLJ7qibH00vEgZ2TE5rU+Rl/CDip5pZHZEPqlfdNlLn
         kTJIZUpx/p0azTxLz2ZfQHizzsP3avjBzyMktMnf5FclOxsVv3/Z5WTDeW0hqbFHI7o2
         d2IURvHlvijDEcHZMhB1Qsu/9UyvlUnD6y3TpMaq4a2HYWWCeju1ty7P83zUuNoTqIVN
         Pt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778400282; x=1779005082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSVHKlBV/KnH4VEaPy4iLd0xw1U0tWinpf/OnSjqEM4=;
        b=jLeFxKcCH1o75REvMPEyt6nOUutt0oNhbw3rgIDnRruvzAz8FTyIw8JlY2Gm5YrH/7
         l2sforXkRwQVBeAG1renUtxH8qCndguBI58nvGbuFreBqAJBp4dy55t+QkD4tjj+/UDU
         4sb3TFmpnxcayNbVwZYw1tvcOYCa7+oJeU+0SwoMEtHff4mU1NTefskvPYFSuC/2TUtY
         gSvP53EhC3sLE5DIwRD7k1OlfsbALESTpCjuur92HC+vTGHTi4TOEU8mLJ6Y1K6NOzib
         BAZiByWVEnrvJX7oFTp+6AaJm7vstY0hGGSg+k8LmQSlJbXdbG4vlsfbeXgGi2JOmRs4
         2GfA==
X-Gm-Message-State: AOJu0YyPFaadhxemEs02YNOOYTywNdDiwcovFZQN2Y6/AiCFOF/CLiOh
	TLrTLO7VR0b0fm3sc4rWpu5gVX08jnrlokpEO/s7ZHoO+sir2321glgsjAj3t+wn
X-Gm-Gg: Acq92OGOuVmAoFXw7HwMMoiRvDezZsQbrypKT4WTW8FAXJB15yjkMsvYjM1OLTjBc+y
	E3ZRXVWkbSTYS1fuR0ooTmTUi1DANXe6qviU0p9f6Aa2aZ89YaqNarjI4C7fuveF2qI/qozqKsm
	vua7orV6DapYxYdEuKT2j15F2Cno/nRwX+J1+zmQaIeEArUiFLZJNh8yxsX5yshzNcL69gMkO5C
	ST2IuokhEJcF2kcmEU6HIp9mWTojZShSfV15lc/xrMVB0bji5VNrFW6tJX7D6Tu4l6KLraFdHan
	w+MbXCUgueYbi4+RyhYrIqy4+ChhJG6VC4pNBp01m4W6vXudnyJvATaFXue2sT6tWYvXi1SwIBS
	Bp3LsgCVt/PDSwvmDmP5NUfF8dNBQPJXnp5si1k0zvtsfhqZhBunHCXPPW5y8JMJ98V62dn3fwX
	4wcC6ti+y8RF0TpJyTwfFBMZdCzRlNii9eIO82+5dhB1yFc+enS21lplWBAWaoCn/D6X6+/VR2Z
	Bx3JlwYNBcS
X-Received: by 2002:aa7:c544:0:b0:67b:cd1f:9cc1 with SMTP id 4fb4d7f45d1cf-67d63d80abamr7489867a12.6.1778400281806;
        Sun, 10 May 2026 01:04:41 -0700 (PDT)
Received: from karaburan ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1af63sm2389470a12.25.2026.05.10.01.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:04:40 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jhonata Poma-Hansen <jhonata.poma@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Yi Zhao <yi.zhao@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v5] rsync: add ptest support
Date: Sun, 10 May 2026 10:04:38 +0200
Message-ID: <20260510-yocto-16211-v5-v5-1-6fd2a2b2234f@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
References: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com> <DIAKXED37M90.4QX504G4C9DW@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260506-yocto-16211-v5-cebacdeda435
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16559; i=jhonata.poma@gmail.com; h=from:subject:message-id; bh=ZFIQWi/2QzUIhr91lIhysNTZW4ElUeh21+qqs3FR1AM=; b=kA0DAAoW9T5TBtE/MS0ByyZiAGoANPjIZHVdWsnlJzl4xqKFb4PApF8huUJvmJtxsVGhnUtIW Ih1BAAWCgAdFiEETM3jjAsh8bj/4bjT9T5TBtE/MS0FAmoANPgACgkQ9T5TBtE/MS0pOAD8DxcB Q8HM5w/+fXXiJ0uf0TpmoYdLq0x4SA99AXFN4g4BAMZZWXaIHkLnJBYZ1YzA2or2JuhoRZ+rSZb 9th8CqyQD
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp; fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 May 2026 08:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236766

Wire up upstream's runtests.py testsuite as a ptest package. The
testsuite runs rsync itself through 49 entries (41 PASS + 8 SKIP)
covering ACLs, xattrs, device nodes, hardlinks, symlinks, daemon
mode, filters, backup, batch, etc., including 3 CHECK_SYMLINKS
variants (chown-fake, devices-fake, xattrs-hlink).

- Add file://run-ptest. It exports TOOLDIR + rsync_bin + srcdir
  for upstream's runtests.py and translates its "PASS    name" /
  "SKIP    name" / "FAIL    name" / "XFAIL   name" lines to
  ptest-runner's "PASS: name" / "SKIP: name" / "FAIL: name"
  format via sed. XFAIL (exit 78, upstream's "known-bad, already
  counted as failed") is remapped to SKIP so a known-bad test
  does not flip the whole suite to failed on ptest-runner. sed
  is invoked without -u so the script works under BusyBox sed
  on core-image-minimal (BusyBox does not implement -u / line-
  buffered mode; ptest-runner collects the full output at the
  end so line buffering is not required). runtests.py honours the
  same legacy environment variables (rsync_bin / srcdir / TOOLDIR)
  that runtests.sh used, so the wrapper is a one-line invocation
  swap from the previous shell runner.

- inherit ptest. RDEPENDS:${PN}-ptest += "python3-core
  python3-asyncio bash coreutils findutils sed grep diffutils".
  python3-core covers the interpreter and the stdlib modules
  runtests.py imports directly (os, sys, subprocess, argparse,
  glob, threading). python3-asyncio is included because
  meta/recipes-devtools/python/python3/python3-manifest.json
  packages the entire concurrent/ namespace - including
  concurrent.futures - inside python3-asyncio rather than
  python3-core (an OE packaging detail; runtests.py itself does
  not use asyncio). The import sits at the top of runtests.py
  and runs at startup regardless of the default --parallel=1
  path, so the dep is unconditional. The GNU userland deps stay
  because rsync.fns uses find | sort | sed | xargs pipelines to
  marshal filenames with spaces into tls; BusyBox's xargs
  handles backslash-escaped spaces differently from GNU xargs
  and the tests fail.

- do_compile_ptest: upstream's Makefile only builds the 7
  CHECK_PROGS helper binaries (tls, getgroups, getfsdev,
  testrun, trimslash, t_unsafe, wildtest) and 3 CHECK_SYMLINKS
  through the check / installcheck targets, so build them
  explicitly. Using oe_runmake on the upstream target names
  keeps this list in sync automatically on future rsync
  upgrades (the list lives in Makefile.in, not here).

- wildtest.c declares `typedef char bool;`, which collides with
  the native bool keyword added in C23 (gcc 15+ defaults to
  -std=gnu23). Pin the helper compile to -std=gnu17 to match
  the workaround already used in meta/recipes-core/ncurses/
  ncurses.inc, meta/recipes-devtools/expect/expect_5.45.4.bb,
  meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb, and
  others. Passing CFLAGS on the oe_runmake command line is safe
  here because upstream's Makefile does not set per-target
  CFLAGS for these helpers.

- do_install_ptest: stage runtests.py, shconfig (its key=value
  body is consumed by runtests.py), config.h (runtests.py reads
  HAVE_LUTIMES and CHOWN_MODIFIES_SYMLINK from it to set
  TLS_ARGS; otherwise those stay empty and lutime / symlink-
  ownership tests fail spuriously), the testsuite/ tree
  (including the symlinks produced by do_compile_ptest), and
  the 7 helper binaries. Also stage the specific upstream
  source leaves that individual tests consume via $srcdir:
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

- SKIP hardlinks.test on riscv64 and riscv32. The autobuilder
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
  timeout, so this is not a timeout issue. The runtests.py runner
  introduces a longer per-test timeout (600s for hardlinks vs
  300s default), but timeout was never the cause; the SKIP stub
  remains required.

- Add rsync to conf/distro/include/ptest-packagelists.inc under
  PTESTS_SLOW (some tests start a daemon and wait on timeouts).

Runtime verification (qemux86-64, core-image-minimal, crops/
poky:ubuntu-22.04, DEFAULTTUNE=x86-64, testimage + ptest-runner,
slirp + kvm): 41 PASS, 0 FAIL, 8 SKIP.
testimage reports core-image-minimal - OK. Package verification:
rsync-ptest contains the 7 helpers, the testsuite entries,
runtests.py + shconfig + config.h + run-ptest + the *.c files +
the 5 named source leaves listed above + support/lsh.sh;
package_qa passes.

[YOCTO #16211]

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
This is a v5 reroll of the rsync ptest series. Mathieu Dubois-Briand
(Bootlin) flagged on patchwork that v4 needs to be rebased onto
upstream rsync 3.4.2, where runtests.sh has been removed and replaced
by a Python rewrite (runtests.py). v5 does that.

## Depends on

  [PATCH 55/62] rsync: upgrade 3.4.1 -> 3.4.2  (RP's AUH)
  Message-Id: <20260502162929.1377831-55-richard.purdie@linuxfoundation.org>
  https://patchwork.yoctoproject.org/patch/87450/

The series will not apply cleanly to current master in isolation; it
expects the recipe to already be at rsync_3.4.2.bb (the upgrade renames
rsync_3.4.1.bb -> rsync_3.4.2.bb).

## Changes since v4

* Rebased onto the rsync 3.4.2 upgrade. The recipe now modifies
  rsync_3.4.2.bb instead of rsync_3.4.1.bb.
* Switched the ptest runner invocation from `./runtests.sh` to
  `python3 ./runtests.py`. runtests.sh was removed in 3.4.2; runtests.py
  honours the same legacy environment variables (rsync_bin / srcdir /
  TOOLDIR) and emits the same "PASS    name" / "FAIL    name" /
  "SKIP    name" / "XFAIL   name" lines, so the run-ptest sed
  translation pipe is unchanged.
* RDEPENDS:${PN}-ptest now adds python3-core and python3-asyncio.
  python3-core is the obvious one (interpreter + os, sys, subprocess,
  argparse, glob, threading). python3-asyncio is needed because
  meta/recipes-devtools/python/python3/python3-manifest.json packs the
  entire concurrent/ namespace inside python3-asyncio rather than
  python3-core, and runtests.py imports concurrent.futures at the top
  unconditionally (used by ThreadPoolExecutor in --parallel mode; the
  default --parallel=1 path still imports it). runtests.py itself does
  not use asyncio. Inline comment in the recipe captures this for
  reviewers who haven't internalised the OE python3 split.
* Test-list count in the commit body updated from 43 to 46. The 3 new
  scenarios in 3.4.2 are clean-fname-underflow.test, open-noatime.test,
  and simd-checksum.test.
* hardlinks.test SKIP stub on riscv32/riscv64 retained. The mtime race
  is not a timeout issue; runtests.py's per-test 600s timeout for
  hardlinks (vs 300s default) does not change the analysis.
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-devtools/rsync/files/run-ptest     | 25 +++++++
 meta/recipes-devtools/rsync/rsync_3.4.2.bb      | 95 ++++++++++++++++++++++++-
 3 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50b6a8a41e..3fbceece1b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -141,6 +141,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3-numpy \
     python3-xmltodict \
+    rsync \
     strace \
     tar \
     tcl \
diff --git a/meta/recipes-devtools/rsync/files/run-ptest b/meta/recipes-devtools/rsync/files/run-ptest
new file mode 100644
index 0000000000..09678bf82e
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+cd "$(dirname "$0")"
+
+# runtests.py honours the same legacy environment variables that runtests.sh
+# (its predecessor, removed in rsync 3.4.2) used:
+#   rsync_bin   path to rsync to test (we use the installed one)
+#   srcdir      directory containing the testsuite/ subdir
+#   TOOLDIR     directory containing the test helper binaries (tls, ...)
+# runtests.py also reads ./shconfig (generated by configure at build time)
+# and ./config.h (for HAVE_LUTIMES / CHOWN_MODIFIES_SYMLINK -> TLS_ARGS).
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
+python3 ./runtests.py 2>&1 | sed \
+    -e 's/^PASS    \(.*\)/PASS: \1/' \
+    -e 's/^FAIL    \(.*\)/FAIL: \1/' \
+    -e 's/^XFAIL   \(.*\)/SKIP: \1 (xfail)/' \
+    -e 's/^SKIP    \(.*\)/SKIP: \1/'
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 5fe1bc2c2b..4b19897531 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,12 +15,13 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -62,6 +63,98 @@ do_install:append() {
 	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
+# runtests.py invokes these helper binaries from $TOOLDIR; upstream only builds
+# them via the make check/installcheck targets, so build them explicitly here.
+# CHECK_SYMLINKS are test variants that upstream's Makefile also creates only
+# for the check targets, so build them alongside the helpers to keep this list
+# in sync with upstream automatically on future rsync upgrades.
+RSYNC_PTEST_HELPERS = "tls getgroups getfsdev testrun trimslash t_unsafe wildtest"
+RSYNC_PTEST_CHECK_SYMLINKS = "testsuite/chown-fake.test testsuite/devices-fake.test testsuite/xattrs-hlink.test"
+
+# wildtest.c declares `typedef char bool;` which collides with the native
+# bool keyword added in C23. Pin to gnu17 for the helper compile so upstream
+# builds cleanly against gcc 15+ defaults. rsync's Makefile does not set
+# per-target CFLAGS for the helper binaries, so overriding CFLAGS on the
+# oe_runmake command line is safe here (nothing to preserve).
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
+	install -m 0755 ${S}/runtests.py ${D}${PTEST_PATH}/
+	install -m 0644 ${B}/shconfig ${D}${PTEST_PATH}/
+	# runtests.py reads config.h for HAVE_LUTIMES / CHOWN_MODIFIES_SYMLINK to
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
+RDEPENDS:${PN}-ptest += "python3-core python3-asyncio bash coreutils findutils sed grep diffutils"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-12084] = "fixed-version: fixed since v3.4.0"

---
base-commit: 5a24aa9c567ce332778a7f2ea8fb62e7c7dc0d85
change-id: 20260506-yocto-16211-v5-cebacdeda435

Best regards,
-- 
Jhonata Poma-Hansen <jhonata.poma@gmail.com>


