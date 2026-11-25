Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45122.1795622907188753328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=iJLGvSYy;
 spf=pass (domain: baylibre.com, ip: 209.85.217.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so1968905137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622906; x=1796227706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o/essmbfw6PL2dxXvJ4JR4I7rAudgp3a2iCxG0kmWrY=;
        b=iJLGvSYyck07Q3K5gyYGGKFsgA9XlZWhpYZ+bVDLSgw1nMPZ+e2QhrZY3cDo9HdasK
         +DcUO4ip7wa+dGTG35FzXeW8wJp+bn1z9V4J4qD4de04/RREOikpEoCa8yiyurRcuKHa
         ukyA+/d9/+Nqh83nHE3I2hih6AULq+WrcPjyXlfEuBxB+jXHOyumBLV9m0RptJ9ig71H
         CyABh2HNCgNwz4iRpd5rZy+t6B09z7bbSz+2DQE0XJkBb+eAMyhJMYBmt+th0l2ufRrm
         6GHoq5Sh/7135dnzDUoY3623tcpGQCFMIqzUKhjFl4uSDDrRIGQJaiE6oFKoccLmAnK/
         sO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622906; x=1796227706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o/essmbfw6PL2dxXvJ4JR4I7rAudgp3a2iCxG0kmWrY=;
        b=17MvyLVoMWk6rbFT3M6rpdSZZyG4xgOoBNBiboM2JcBgpaDZjQep1p9rR5Uu4AEJqQ
         65Lz4XMwavWDQh6icoV/EIya7k7x/Q2NrlOOYHaLqoeBTUGMSnV+6RsScrIc+DRW6Sa0
         BJNMlAFGvmVsg/oXV9vVBGAf2xu6hNStoz/0F5FrFIjMPVd6vyAKlfgPARhnhs5NyGUr
         SiYTHRAgYI9tVYJxq7q+e2xfoLKplK61ShzEhI0VirKzslwa5l9PwPEStyV982qSyCVt
         Zkr8iZvS9kUB5t1j0fh5MvMlL/l2968BI+TFtFrZBFCSRYdTga+9ngzX8hGTKpEEu2Xv
         4l+Q==
X-Gm-Message-State: APuU4Z9J4JhF743RrDKwkb8hKyUEbn1oWGsVdtr4IkgG2JEnDh3FBP5E
	DYV8SDonkOAfU+eEk8nZCv6dSqQk8RNvXhEl8oAjG4oN/DDIuLMoEk0bTUhcBfDWauH29De10RV
	ir6zl
X-Gm-Gg: AZFdTZclTvlqYpUyM4u5eHrcAkttzGCYK8KZCtJ7cwR1Q/l2DSGDY26KUc7E47eIiFB
	xC2Mko8StNHDeZrcHBxpRbpo0fMLB/l9pJ3ZYGKxGRGG81ZsxnFugYdhuM8rQ7+E9ao8NWcWvCp
	w7T5UsUIeN/vfBGhvcCCThnMnsadiptIPprzLz4TV0cHd9c5glMfg2gxyLYRA5O5xcqLo9BLdjN
	MW0IPptfwc3ZAtv0tvIhdcKxCXOYrwL023K9rVAxxgc57zvew7vm02eH2sVTOq5axcD93YZkGRU
	E6Nxdi49GscC/6tCh0KD6iTt/52fROF3FLXgwfJmIGOW+A6xA7LT+HaJ8Dpn/I34OVoYvcnAXSS
	/iivWSFaCIjr2ucv3XYk3i90ZK404sKI2VOneEXbUaNrVpKKT5DVxCpJZHxrF+rwicMGcL4VxVg
	5H333DLvYr8IjCZAZM3l+wm6sodgN/08/xPHAC+NpjIdOKSJtHOb4gMpM+C4EubNVgbD61FOgNg
	AhpaDrOfE24i0GBdxpycZ8hw2E1yIoMTwyx6nIzOSO4W5mO3bpR2ZyAXU409jOoXaDTqsaOB41K
	+Kwv8H7MDwCNCm2BDdkWjzaXmgfOiTIEV8OQDeBP0N81Yr2ZNJuASTZP9t9VgepbWQD0a0H92hM
	7zPeAhBUvmA==
X-Received: by 2002:a05:6102:292a:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7d7392a493emr8891096137.1.1795622905777;
        Wed, 25 Nov 2026 08:08:25 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:25 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6 v2] hyperfine: add ptest support
Date: Wed, 25 Nov 2026 11:08:17 -0500
Message-ID: <20261125160821.3028875-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251207
Content-Type: text/plain; charset="utf-8"

Enable ptests for the hyperfine recipe, using ptest-cargo.bbclass like
rpm-sequoia and librsvg.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds a missing sign-off in the carried patch file and is more explicit about
the LLM version used to create it.

 .../distro/include/ptest-packagelists.inc     |  1 +
 ...riding-the-hyperfine-binary-with-HYP.patch | 39 +++++++++++++++++++
 .../hyperfine/files/run-ptest                 |  7 ++++
 .../hyperfine/hyperfine_2.0.0.bb              | 19 ++++++++-
 4 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
 create mode 100644 meta/recipes-devtools/hyperfine/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6c8ff85fd0..a36718fc53 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -26,6 +26,7 @@ PTESTS_FAST = "\
     gdk-pixbuf \
     glib-networking \
     gzip \
+    hyperfine \
     icu \
     json-c \
     json-glib \
diff --git a/meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch b/meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
new file mode 100644
index 0000000000..9f95fcec28
--- /dev/null
+++ b/meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
@@ -0,0 +1,39 @@
+From b8714ae6630ca9e6a47d686a959b44a56d3ef7bd Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 20 Nov 2026 20:18:36 +0000
+Subject: [PATCH] tests: allow overriding the hyperfine binary with
+ HYPERFINE_BIN
+
+cargo_bin!() resolves to an absolute path in the build tree, so the
+integration tests cannot be run once installed elsewhere (e.g. as Yocto
+ptests on a target), and the path ends up embedded in the test
+binaries. Allow the path to be set at compile time instead.
+
+Upstream-Status: Inappropriate [oe specific]
+AI-Generated: Uses Claude Opus 5.5
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ tests/common.rs | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tests/common.rs b/tests/common.rs
+index fa03e46..058c962 100644
+--- a/tests/common.rs
++++ b/tests/common.rs
+@@ -1,7 +1,15 @@
+ use std::process::Command;
+ 
++// Allow overriding the binary location at compile time, e.g. when the tests
++// are run outside of the build tree. Evaluated as a const so that the
++// build-tree path is not embedded in the test binary when overridden.
++const HYPERFINE_BIN: &str = match option_env!("HYPERFINE_BIN") {
++    Some(bin) => bin,
++    None => env!("CARGO_BIN_EXE_hyperfine"),
++};
++
+ pub fn hyperfine_raw_command() -> Command {
+-    let mut cmd = Command::new(assert_cmd::cargo::cargo_bin!("hyperfine"));
++    let mut cmd = Command::new(HYPERFINE_BIN);
+     cmd.current_dir("tests/");
+     cmd
+ }
diff --git a/meta/recipes-devtools/hyperfine/files/run-ptest b/meta/recipes-devtools/hyperfine/files/run-ptest
new file mode 100644
index 0000000000..3e44f229a8
--- /dev/null
+++ b/meta/recipes-devtools/hyperfine/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+# ptest-cargo appends the test binary invocations to this script.
+# The integration tests run hyperfine from the tests/ directory and
+# compare its output against the insta snapshots installed there.
+cd "$(dirname "$0")"
+export INSTA_UPDATE=no
diff --git a/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb b/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb
index 3a81e1bf32..411ba8f724 100644
--- a/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb
+++ b/meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb
@@ -4,9 +4,12 @@ LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=50c79cd7360537975dfbbd15f8d01a34 \
                     file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-inherit cargo cargo-update-recipe-crates
+inherit cargo cargo-update-recipe-crates ptest-cargo
 
-SRC_URI = "git://github.com/sharkdp/hyperfine.git;protocol=https;nobranch=1;tag=v${PV}"
+SRC_URI = "git://github.com/sharkdp/hyperfine.git;protocol=https;nobranch=1;tag=v${PV} \
+           file://0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch \
+           file://run-ptest \
+           "
 SRCREV = "b33755fe1fca8bcc1f182c773ca3ab040bfe517d"
 
 require ${BPN}-crates.inc
@@ -14,4 +17,16 @@ require ${BPN}-crates.inc
 # Upstream's release profile sets strip = true; let do_package do the stripping
 export CARGO_PROFILE_RELEASE_STRIP = "false"
 
+# Point the tests at the target locations at compile time, which also keeps
+# build paths (CARGO_BIN_EXE_hyperfine, CARGO_MANIFEST_DIR) out of the test binaries.
+do_compile_ptest_cargo:prepend() {
+    os.environ["HYPERFINE_BIN"] = d.expand("${bindir}/hyperfine")
+    os.environ["INSTA_WORKSPACE_ROOT"] = d.getVar("PTEST_PATH")
+}
+
+do_install_ptest() {
+	cp -r ${S}/tests ${D}${PTEST_PATH}/
+	rm ${D}${PTEST_PATH}/tests/*.rs
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

