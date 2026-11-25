Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44781.1795622114248825829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=fEKIHS5y;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94960131b30so542854585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622113; x=1796226913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gfSrflwxPItPKHCbHJsjciZWr1uGKwqJGhwTDwMrRwA=;
        b=fEKIHS5ylwCoKJNSg1GtGI9U8ZDLT6kvDB40apCtVVwT8n7UfqXJUh5wZVBjtxlWlh
         oifBpvvDrXMhrC05Gn4vS3HqWL4scJox57J+gLF+4t2SsJn1xRLuRcndq+YyjXM4Eful
         KoR7tg0gQhdWe7b4s9JblulBhi1bLVvDGTFKH08IzF74LtRa2Z6xLbI2LuRy184S3sHK
         bIloPFcVzp2URyV0aXvMq6pLADf+ehRUCNcOrZuiM0LhFViBXOlzqx72B0RkO6m8edvQ
         RidQRZ0riUVyXR/3uJnOMOetcpTVKma/qBU1eJvWMwQxxyHHSMtgg8QZeuDuj+U4B5BK
         j6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622113; x=1796226913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gfSrflwxPItPKHCbHJsjciZWr1uGKwqJGhwTDwMrRwA=;
        b=kbbbZvkx9g5FnTHdzb0WKpyjSfpdEcxbWrd+FYIYMz/OPaWklanov4pw8fDv+Hvdy8
         uODARoW70NA+0OaaP0evJCMYDmdBcTNF5TOJ9YTyJ/Gm4peWx6scfWehxgtZLvCy+jue
         UhhvfF5iwkHcQdYCyhzqlyZ7BnYv3anksbaAczl81gbP0xuscTcBv2+v7U1LB9RLv77G
         OlJP3U8C0D/NQz2GG2WTxaD5K8rjScULsPovnlPj9N8rhh+kPv30QIswOJKmaXTcvmi/
         gFwqtsUrweJp5gxhWLYCF9EVxPIBo+Q/RHxCpnEbNLl1aJC7lN/YQ+4QBbq292Iz6Mka
         nZ9Q==
X-Gm-Message-State: APuU4Z/YzFCkqiMazIaSc/+wnKmmTyxlKSfyB1SWP8KGvBhhw60wKTsa
	x7WSnxDnYwpMtRQRNP9FTDlMLjR3TZzbY5kavKaTYH88TZIKrKQzhuyUziZwIvqHJExWJRRP+tJ
	7VEUn
X-Gm-Gg: AZFdTZfbQmH/JnG56QwpS/vtJwGfseWYdC8y5IvdPyJN1kx8iGt8rMKLewU40dpVC9z
	atHZSdudbwY92F2cTXxta4YGjX3LsIewgtf3m2zXFhy+WdlhtU8nFNZATfnt4x0oYW4Wnv/GCXZ
	PjGMPzgtBe5IoZE5SsRVaQZH47WurSPw3SsEqxN1hqB9iPvemqjsVO45T5VLcL7JktNceGqp1lV
	KKI7o+/HiMotC481u3Jvb61RdFeTcFqzCsK1O6hFcO+pkl3dZ+uCjEZv9JgI6wfIoI5JniZEA8g
	hh+buIvt9uUelrh3C3Vb9UvqxhWKivBaXi0EHfnStKsibz7BIxBNtRMcMYp7CGTd2BJ6M+eSG8+
	hmzI4jRR+3IG4/kXGXpH6f/AFWrS9C3eBr3RqTjnik5IATs/RcbLM/4kO7WXsVChAlNv3L0/Ygm
	wCCnmZgnkH9Pj5tgogIqhlcOTD6qyLo8apUYkstKRC+zlZBC2Vjgp0G9GqsYqoQ6krwwHjbKSar
	b2wR6L1Ql/ByFzk4D8QkSAjUhe2tYxzBoAROeiyoS14xMeW3lthdnevKX0QDqUL7aFPmM7VLcv7
	eH+5qLbNmH/k7eOfhCAbl8CLAnR72nKrKCNrEWT7bvzOtx/XO73TenMq+eiq4WPoW9S/m5TXaHG
	jKpQsCEj83pAIvTKrmqLUWzmWzEhnPdg=
X-Received: by 2002:a05:620a:8812:b0:944:941:c060 with SMTP id af79cd13be357-949ba95df74mr2974517985a.15.1795622113038;
        Wed, 25 Nov 2026 07:55:13 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:12 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] hyperfine: add ptest support
Date: Wed, 25 Nov 2026 10:55:03 -0500
Message-ID: <20261125155508.3024814-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125155508.3024814-1-tgamblin@baylibre.com>
References: <20261125155508.3024814-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251199
Content-Type: text/plain; charset="utf-8"

Enable ptests for the hyperfine recipe, using ptest-cargo.bbclass like
rpm-sequoia and librsvg.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...riding-the-hyperfine-binary-with-HYP.patch | 38 +++++++++++++++++++
 .../hyperfine/files/run-ptest                 |  7 ++++
 .../hyperfine/hyperfine_2.0.0.bb              | 19 +++++++++-
 4 files changed, 63 insertions(+), 2 deletions(-)
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
index 0000000000..458a721297
--- /dev/null
+++ b/meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
@@ -0,0 +1,38 @@
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
+AI-Generated: Uses Claude Code
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

