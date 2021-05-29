Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.19571.1622285892964317108
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 03:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mPBMy6YC;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id o21so6829868iow.13
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=elJ5I0KdzaHjHkLnWtz9vDezFz+HdHh7sExnXALAPUo=;
        b=mPBMy6YCXAQ7j2kccc+TidqDD0v7ZrOToP5thK/YfzL+zp0eq3ML9xB2HjhEbcb/zc
         IhKdcD3Abbom0katFQT1ySCr2gx6uBIT3Gqjw4ZR0NxXDAEdFyCzIdrasYjL5DXJ2DnF
         i8nkyfzrVmPGTw4HPNjgv6TVDmakCwR0/NG56TbO5Dm/cts/hSmrhGfnSdt48WHPADHn
         /ANhYdYWGfEtgUT1b+TayR6Z7vnFIhQLUIKl0LYHRR6/I3cXCdumZojr/qTrYmyw3sRK
         Jsdbm9Xtq4dZhmKgS9tBWhQ32htf6NQLFM+tloa2/MhjIklsQFRDG8yivlZUCDLXz1Rr
         fTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=elJ5I0KdzaHjHkLnWtz9vDezFz+HdHh7sExnXALAPUo=;
        b=R7rrcbvmwBPc9fsdJUHlUiQHw3Y+/XXI5GGeCfBv64Ax3HlxYaQFYJQJLBaMvhGMB2
         lzz2CUYoGOWV6sKK+E7o1YEWLjhYpy6xymNm3m4mzWv8s5i3di3C1jCKF2+eEU2ftVQC
         lW+lrAt4aCRr+/Mw4Ug30xYPwflDsR6QypR1B+T9vEUsVvV6+jlz3L70xkGGy+YaLq4B
         PiTmoQkc0JzgShLGZRxuEzC/0S9KR1aCDrxnQEXAWKe4qWPP7Yl2X7oCQPyzI0JwsHCa
         5eKc98U7u3mEaO1KOdKZTV9CLd7sLKyMm6A8AejvRr4uw8gJJl447PI8q7tuS88tdXk7
         azfw==
X-Gm-Message-State: AOAM533+Ung8mvJ6YC99UlbenaUZdCgmhGzn8J9Zl9yu/gXD4tNkywHm
	/VuCKj8pELmnLSoJutkHLvGUnEKbDa3dHDfZ
X-Google-Smtp-Source: ABdhPJyKnP8juj5XJhb+70b0OEh08kqkNy3SaA8MoCm54oc1ojRvqetYmKdoK9OUq6qXuFE1Dhc6Kg==
X-Received: by 2002:a05:6638:380a:: with SMTP id i10mr5549709jav.100.1622285891757;
        Sat, 29 May 2021 03:58:11 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id o5sm4441174ilm.78.2021.05.29.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:58:11 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v8 1/5] rust-testsuite.inc : Rust cross testing.
Date: Sat, 29 May 2021 03:57:45 -0700
Message-Id: <20210529105749.3017489-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
References: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>

Below list of functions are part of rust-testsuite.inc
setup_cargo_environment(): Build bootstrap and some early stage tools.
do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
do_configure(): To generate config.toml
do_compile(): To build "remote-test-server" for qemutarget image.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite.inc | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc

diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
new file mode 100644
index 0000000000..ef9b660c79
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -0,0 +1,155 @@
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
+do_rust_setup_snapshot () {
+    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
+        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
+    done
+
+    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
+    # and fail without it there.
+    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
+    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
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
2.17.1

