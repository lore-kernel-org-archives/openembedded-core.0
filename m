Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E82C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:05:02 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.5890.1632902702000584068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VoLy/FbJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u7so1245010pfg.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k1C22GfUNz7rYgvzuAzEOyNubPGuYfY03PtNyL5GToY=;
        b=VoLy/FbJskbEAu8M6nKlwrhJ2Zwu0eiFZew++uzjFf/qYSTunxSfIwOjr/xWJX0IU7
         ERlY61vNQkPWAUsKqp4iA/+VaW4b5l+fYvllIZ5dWE1jYIEKQiCUhPDEDAgt2//hzIae
         ja+WH9+CF15TFkbuWsPGkwu1xIyKbP9cjmmtBXcJ6DOHttVYtRjF+4g9bd0Lb94dPKdz
         9dXky1mcktznklFGYHlXmggGqDZJbKVY9cPylvRLUB5z2nryu7YCytOYl4uyKPK5F+Cg
         Aj10sEamN1Dn1Sgd5Y0SnPuq2fty+OsHD7zqaBek0MYGQa4iPBnrdE92m0xsteU/iZL/
         0wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1C22GfUNz7rYgvzuAzEOyNubPGuYfY03PtNyL5GToY=;
        b=b2yL6bWdJ5cJl7nxSfm3QUvuTueFfM12PgQcplf3b51zcxGoE6rBwe/ulxBVkjcSWf
         6+CyOLO9c4TGl1HLeeKrs8laKijp8PkD51PSLDbmJjuUXqyA/23ucZFOpTNUZB5UKmiI
         zX1p5fpConzenS7NfS1Thzj+HzQhGKwrLzhydRmUEovmo1K5x5A5o5b/DBFeA4Pa/s17
         9PhAM7wCjwbw3NEP3dxA6CupLYvlOnsf5HQGhuJNLFIM3NOAEQRe9x2YdE/F153MxzXZ
         woZeObbefz8deZqcTqjjHzhlSy/vCAByYcRsVAluFUTFzEjP8OxcjqCVfUlyngur6P5I
         ih6g==
X-Gm-Message-State: AOAM532q/hBvUJIL0A2XGKdGHLCB5qy3/nyygDqBaCcJ85S3Wif9Egt+
	wU1gNKVKwG00XElnd4YhlEjElO9IIU91sQ==
X-Google-Smtp-Source: 
 ABdhPJzA0WSldzaD8oDVakk4GCgzTFttbF6MYaqsBHPxdhInavy8NjGgtqt+PsZG6bQ9biSQNuXwMQ==
X-Received: by 2002:a65:6ab0:: with SMTP id x16mr8506541pgu.181.1632902701241;
        Wed, 29 Sep 2021 01:05:01 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 cq21sm1075081pjb.10.2021.09.29.01.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 01:05:00 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v2 2/3] Rust cross testing file
Date: Wed, 29 Sep 2021 01:04:47 -0700
Message-Id: <20210929080448.16224-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929080448.16224-1-pgowda.cve@gmail.com>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:05:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156449

The file is main entry point for rust oe-selftest.
It configures, compiles and runs the test suite framework.

It implements the above using the following functions:
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemutarget image.
---
 meta/recipes-devtools/rust/rust-testsuite.inc | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc

diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..861c4ff504
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,167 @@
+SUMMARY = "Rust testing"
+HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
+SECTION = "test"
+LICENSE = "MIT | Apache-2.0"
+
+inherit rust
+inherit cargo_common
+
+DEPENDS += "file-native python3-native"
+EXCLUDE_FROM_WORLD = "1"
+
+S = "${RUSTSRC}"
+
+# Path of target specification file "target-poky-linux.json"
+export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
+
+export FORCE_CRATE_HASH="${BB_TASKHASH}"
+
+# We don't want to use bitbakes vendoring because the rust sources do their
+# own vendoring.
+CARGO_DISABLE_BITBAKE_VENDORING = "1"
+
+# We can't use RUST_BUILD_SYS here because that may be "musl" if
+# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
+SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
+setup_cargo_environment () {
+    # The first step is to build bootstrap and some early stage tools,
+    # these are build for the same target as the snapshot, e.g.
+    # x86_64-unknown-linux-gnu.
+    # Later stages are build for the native target (i.e. target.x86_64-linux)
+    cargo_common_do_configure
+
+    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
+    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
+}
+
+include rust-common.inc
+
+do_rust_setup_snapshot () {
+    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
+        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
+    done
+
+    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
+    # and fail without it there.
+    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
+    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
+
+    # Need to use uninative's loader if enabled/present since the library paths
+    # are used internally by rust and result in symbol mismatches if we don't
+    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+        for bin in cargo rustc rustdoc; do
+            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
+        done
+    fi
+}
+addtask rust_setup_snapshot after do_unpack before do_configure
+do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
+
+python do_configure() {
+    import json
+    from distutils.version import LooseVersion
+    try:
+        import configparser
+    except ImportError:
+        import ConfigParser as configparser
+
+    # toml is rather similar to standard ini like format except it likes values
+    # that look more JSON like. So for our purposes simply escaping all values
+    # as JSON seem to work fine.
+
+    e = lambda s: json.dumps(s)
+
+    config = configparser.RawConfigParser()
+
+    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
+    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    config.add_section(target_section)
+
+    # Points to wrapper files which contain target specific compiler and linker commands.
+    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
+
+    # If we don't do this rust-native will compile it's own llvm for BUILD.
+    # [target.${BUILD_ARCH}-unknown-linux-gnu]
+    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    config.add_section(target_section)
+
+    # Wrapper scripts of build system.
+    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
+
+    # [rust]
+    config.add_section("rust")
+    config.set("rust", "rpath", e(True))
+    config.set("rust", "channel", e("stable"))
+
+    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
+        config.set("rust", "use-jemalloc", e(False))
+
+    # Whether or not to optimize the compiler and standard library
+    config.set("rust", "optimize", e(True))
+
+    # Emits extraneous output from tests to ensure that failures of the test
+    # harness are debuggable just from logfiles
+    config.set("rust", "verbose-tests", e(True))
+
+    # Override default linker cc.
+    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
+
+    # [build]
+    config.add_section("build")
+    config.set("build", "submodules", e(False))
+    config.set("build", "docs", e(False))
+
+    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    config.set("build", "rustc", e(rustc))
+
+    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    config.set("build", "cargo", e(cargo))
+
+    config.set("build", "vendor", e(True))
+
+    targets = [d.getVar("TARGET_SYS", True)]
+    config.set("build", "target", e(targets))
+
+    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
+    config.set("build", "host", e(hosts))
+
+    # We can't use BUILD_SYS since that is something the rust snapshot knows
+    # nothing about when trying to build some stage0 tools (like fabricate)
+    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+
+    with open("config.toml", "w") as f:
+        config.write(f)
+
+    # set up ${WORKDIR}/cargo_home
+    bb.build.exec_func("setup_cargo_environment", d)
+}
+
+
+rust_runx () {
+    echo "COMPILE ${PN}" "$@"
+
+    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
+    # wide range of targets (not just TARGET). Yocto's settings for them will
+    # be inappropriate, avoid using.
+    unset CFLAGS
+    unset LDFLAGS
+    unset CXXFLAGS
+    unset CPPFLAGS
+
+    oe_cargo_fix_env
+
+    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
+}
+rust_runx[vardepsexclude] += "PARALLEL_MAKE"
+
+do_compile () {
+
+    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
+}
-- 
2.31.1


