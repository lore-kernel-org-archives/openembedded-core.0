Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CC8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:53 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.8753.1645501972273821763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=ih5Hlzxy;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 91B775C019D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 21 Feb 2022 22:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=PdL20hwYIsFDNrMqxkcxkG0IXTgkR5
	SFvySuUpSZRaM=; b=ih5HlzxyHiyUb9ygNxRxBVL/f1gX5yu5TXG9nRGvH5v9AO
	XGt8u0CskOQUhVnzkqnRno36hESP5ss2nIp6cxBAGmuePJyyVH26ePMgQuTCPVH7
	VP0tGuNmSq6BPztrIu4NUGvrSuCovf89ui8pXzRR93w3AtnjYeJjkBAPPZOtNYhk
	Zr1EJFigmQM1G2u0D2AFHbU62JLBlwERWzXtOumBs8zXfsEV9DyGSFjUEXdrYRjx
	ei+ZYjN5sLeFoleicwc+pOiPlbr4Zz3yr+szUBMqtDMAKhTcx6V7cdQSoWM+SjGM
	WewBXcRZngibD84xw7QrCWEsSZcj7ldhZbJrBLbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PdL20h
	wYIsFDNrMqxkcxkG0IXTgkR5SFvySuUpSZRaM=; b=FGBX9zzK1DJaRmlyEf+IPR
	0keB/X+BRZJtRXhIs+p01GrDKUuNP1z2eSPhCOr1EHbokhLlWb7AOOU2UrePPE5e
	AjYFfu67SM7mh9LsjNhWRtUoAioZ/8oQIdRTnS7ggmqfawO0N61/rHq9w2EksDa9
	6L2VEUUPbKZM3m+288/VsUSvCYwoNFfiX0HukBljGKcgqu+7DazWSyxR2TWnJgd7
	QQ6B0MRQyJnjiut4uWcxyYAK/H2qEkdUHwyn6aV9KQkKC6qT2dBdDWmxxfO+pWT/
	medWI54MtZRPiThwlTsNNO4sTPKHeFnoBydNCI+U6GWyFBb6vAVJ+scyv8IKTsQQ
	==
X-ME-Sender: <xms:E14UYqbTrfHVSNkMCq0Lg36ZvXlKWz4qbL3yDB8ljArhBtvF4iWCRQ>
    <xme:E14UYtZdKGyhG5qOt8KMnHy6l4rsWIt_Cs4oivuocougIV0KEahrgHXE8nckFbtsK
    uzM989wcEe4hzamiA>
X-ME-Received: 
 <xmr:E14UYk-QJl5akqKGwDAcCkWx4O3MboXn6yunWn2OAhSw6yTzy4UVhFyntYAVbJtoSN8P3V0C5DUgl9ox2tWKGO-rfb0mDYqbkRAk_-Rw9Z2JRbrvjhA8RtKwB-DsEgLYIytZBxpb>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:E14UYsrXyYvm2AOA0oiP99HzdbL-w5M9SYH05zkpBx6wDEw8d2j2lw>
    <xmx:E14UYlohTDNOIGIRYV8REAIzGotrPgusFWEfDt_7Srywhx7jsx70Gg>
    <xmx:E14UYqSrP4kJ9K_ThV1zdUjkibTyokNRe5WyOgdI_Mntmgh8bFoWGg>
    <xmx:E14UYnE1Lu3bKBdC11QGcMGAo7SgMEwYwXGqbXziQCxK1vfKpAGWqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:50 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 4/8] rust: Consistently use
 RUST_{BUILD,HOST,TARGET}_{ARCH,SYS}
Date: Tue, 22 Feb 2022 14:22:30 +1030
Message-Id: <20220222035234.463162-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162118

With achitecture name translation, the RUST_-prefixed variables and
their unadorned equivalents may not be the same.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/cargo.bbclass                    |  4 ++--
 meta/classes/cargo_common.bbclass             |  6 ++---
 meta/classes/rust-common.bbclass              |  2 +-
 meta/classes/rust.bbclass                     |  8 +++----
 meta/recipes-devtools/rust/rust-common.inc    | 10 ++++----
 .../rust/rust-cross-canadian-common.inc       |  6 ++---
 .../rust/rust-cross-canadian.inc              | 23 ++++++++++---------
 meta/recipes-devtools/rust/rust-cross.inc     |  2 +-
 meta/recipes-devtools/rust/rust.inc           | 16 ++++++-------
 9 files changed, 40 insertions(+), 37 deletions(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 0ca38143c0b3..1507ff0e4ca1 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -31,12 +31,12 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
 BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_TARGET_SUBDIR="${HOST_SYS}/${BUILD_DIR}"
+CARGO_TARGET_SUBDIR="${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 90fad7541530..103240ce491e 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -69,15 +69,15 @@ cargo_common_do_configure () {
 	cat <<- EOF >> ${CARGO_HOME}/config
 
 	# HOST_SYS
-	[target.${HOST_SYS}]
+	[target.${RUST_HOST_SYS}]
 	linker = "${CARGO_RUST_TARGET_CCLD}"
 	EOF
 
-	if [ "${HOST_SYS}" != "${BUILD_SYS}" ]; then
+	if [ "${RUST_HOST_SYS}" != "${RUST_BUILD_SYS}" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		# BUILD_SYS
-		[target.${BUILD_SYS}]
+		[target.${RUST_BUILD_SYS}]
 		linker = "${RUST_BUILD_CCLD}"
 		EOF
 	fi
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 3c7d133f0445..58ece01097c8 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -83,7 +83,7 @@ def rust_base_triple(d, thing):
     if thing == "TARGET" and target_is_armv7(d):
         arch = "armv7"
     else:
-        arch = d.getVar('{}_ARCH'.format(thing))
+        arch = arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
 
     # All the Yocto targets are Linux and are 'unknown'
     vendor = "-unknown"
diff --git a/meta/classes/rust.bbclass b/meta/classes/rust.bbclass
index 5c8938d09fe5..bb1276215b0f 100644
--- a/meta/classes/rust.bbclass
+++ b/meta/classes/rust.bbclass
@@ -2,14 +2,14 @@ inherit rust-common
 
 RUSTC = "rustc"
 
-RUSTC_ARCHFLAGS += "--target=${HOST_SYS} ${RUSTFLAGS}"
+RUSTC_ARCHFLAGS += "--target=${RUST_HOST_SYS} ${RUSTFLAGS}"
 
 def rust_base_dep(d):
     # Taken from meta/classes/base.bbclass `base_dep_prepend` and modified to
     # use rust instead of gcc
     deps = ""
     if not d.getVar('INHIBIT_DEFAULT_RUST_DEPS'):
-        if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
+        if (d.getVar('RUST_HOST_SYS') != d.getVar('RUST_BUILD_SYS')):
             deps += " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
         else:
             deps += " rust-native"
@@ -37,9 +37,9 @@ HOST_CFLAGS   ?= "${CFLAGS}"
 HOST_CXXFLAGS ?= "${CXXFLAGS}"
 HOST_CPPFLAGS ?= "${CPPFLAGS}"
 
-rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${HOST_SYS}/lib"
+rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${RUST_HOST_SYS}/lib"
 # Native sysroot standard library path
 rustlib_src="${prefix}/lib/${rustlib_suffix}"
 # Host sysroot standard library path
 rustlib="${libdir}/${rustlib_suffix}"
-rustlib:class-native="${libdir}/rustlib/${BUILD_SYS}/lib"
+rustlib:class-native="${libdir}/rustlib/${RUST_BUILD_SYS}/lib"
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 4b758260d276..8ba78b978708 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -249,14 +249,14 @@ TARGET_C_INT_WIDTH[riscv64] = "64"
 MAX_ATOMIC_WIDTH[riscv64] = "64"
 
 def sys_for(d, thing):
-    return d.getVar('{}_SYS'.format(thing))
+    return d.getVar('RUST_{}_SYS'.format(thing))
 
 def prefix_for(d, thing):
     return d.getVar('{}_PREFIX'.format(thing))
 
 # generates our target CPU value
 def llvm_cpu(d):
-    cpu = d.getVar('PACKAGE_ARCH')
+    cpu = arch_to_rust_arch(d.getVar('PACKAGE_ARCH'))
     target = d.getVar('TRANSLATED_TARGET_ARCH')
 
     trans = {}
@@ -298,6 +298,8 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
+    arch = arch_to_rust_arch(arch)
+
     if abi:
         arch_abi = "{}-{}".format(arch, abi)
     else:
@@ -314,7 +316,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
-    tspec['arch'] = arch_to_rust_arch(arch)
+    tspec['arch'] = arch
     tspec['os'] = "linux"
     if "musl" in tspec['llvm-target']:
         tspec['env'] = "musl"
@@ -345,7 +347,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    build_arch = d.getVar('BUILD_ARCH')
+    build_arch = d.getVar('RUST_BUILD_ARCH')
     rust_gen_target(d, 'BUILD', wd, "", "generic", build_arch)
 }
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 827000f7bd1e..72226da68926 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -30,7 +30,7 @@ python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
     rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('RUST_BUILD_ARCH'))
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
@@ -42,8 +42,8 @@ export WRAPPER_TARGET_LDFLAGS = "${TARGET_LDFLAGS}"
 export WRAPPER_TARGET_AR = "${TARGET_PREFIX}ar"
 
 python do_configure:prepend() {
-    targets = [d.getVar("TARGET_SYS", True), "{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-    hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
+    targets = [d.getVar("RUST_TARGET_SYS", True), "{}-unknown-linux-gnu".format(d.getVar("RUST_HOST_ARCH", True))]
+    hosts = ["{}-unknown-linux-gnu".format(d.getVar("RUST_HOST_ARCH", True))]
 }
 
 INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8bbbd61bdc39..ed8b720d51c2 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -22,7 +22,7 @@ do_install () {
     # The required structure is retained for simplicity.
     SYS_LIBDIR=$(dirname ${D}${libdir})
     SYS_BINDIR=$(dirname ${D}${bindir})
-    RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
+    RUSTLIB_DIR=${SYS_LIBDIR}/${RUST_TARGET_SYS}/rustlib
 
     install -d "${SYS_BINDIR}"
     cp build/${SNAPSHOT_BUILD_SYS}/stage2/bin/* ${SYS_BINDIR}
@@ -31,8 +31,8 @@ do_install () {
     done
 
     install -d "${D}${libdir}"
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/*.so ${SYS_LIBDIR}
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/rustlib ${RUSTLIB_DIR}
+    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${RUST_TARGET_SYS}/*.so ${SYS_LIBDIR}
+    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${RUST_TARGET_SYS}/rustlib ${RUSTLIB_DIR}
 
     for i in ${SYS_LIBDIR}/*.so; do
 	chrpath -r "\$ORIGIN/../lib" ${i}
@@ -41,7 +41,7 @@ do_install () {
 	chrpath -d ${i}
     done
 
-    install -m 0644 "${WORKDIR}/targets/${TARGET_SYS}.json" "${RUSTLIB_DIR}"
+    install -m 0644 "${WORKDIR}/targets/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
 
     SRC_DIR=${RUSTLIB_DIR}/src/rust
     install -d ${SRC_DIR}/src/llvm-project
@@ -56,8 +56,9 @@ do_install () {
     ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     cat <<- EOF > "${ENV_SETUP_SH}"
-	export RUSTFLAGS="--sysroot=\$OECORE_NATIVE_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib/${TARGET_SYS}/lib"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	export RUSTFLAGS="--sysroot=\$OECORE_NATIVE_SYSROOT/usr -C
+    link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L\$OECORE_NATIVE_SYSROOT/usr/lib/${RUST_TARGET_SYS}/rustlib/${RUST_TARGET_SYS}/lib"
+	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${RUST_TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
@@ -65,14 +66,14 @@ do_install () {
 
 PKG_SYS_LIBDIR = "${SDKPATHNATIVE}/usr/lib"
 PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-PKG_RUSTLIB_DIR = "${PKG_SYS_LIBDIR}/${TARGET_SYS}/rustlib"
+PKG_RUSTLIB_DIR = "${PKG_SYS_LIBDIR}/${RUST_TARGET_SYS}/rustlib"
 FILES:${PN} = "${PKG_SYS_LIBDIR}/*.so ${PKG_SYS_BINDIR} ${base_prefix}/environment-setup.d"
-FILES:${RUSTLIB_TARGET_PN} = "${PKG_RUSTLIB_DIR}/${TARGET_SYS} ${PKG_RUSTLIB_DIR}/${TARGET_SYS}.json"
-FILES:${RUSTLIB_HOST_PN} = "${PKG_RUSTLIB_DIR}/${BUILD_ARCH}-unknown-linux-gnu"
+FILES:${RUSTLIB_TARGET_PN} = "${PKG_RUSTLIB_DIR}/${RUST_TARGET_SYS} ${PKG_RUSTLIB_DIR}/${RUST_TARGET_SYS}.json"
+FILES:${RUSTLIB_HOST_PN} = "${PKG_RUSTLIB_DIR}/${RUST_BUILD_ARCH}-unknown-linux-gnu"
 FILES:${RUSTLIB_SRC_PN} = "${PKG_RUSTLIB_DIR}/src"
 
-SUMMARY:${RUSTLIB_TARGET_PN} = "Rust cross canadian libaries for ${TARGET_SYS}"
-SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${HOST_SYS}"
+SUMMARY:${RUSTLIB_TARGET_PN} = "Rust cross canadian libaries for ${RUST_TARGET_SYS}"
+SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${RUST_HOST_SYS}"
 SUMMARY:${RUSTLIB_SRC_PN} = "Rust standard library sources for cross canadian toolchain"
 SUMMARY:${PN} = "Rust crost canadian compiler"
 
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index a77f7d512233..f7eda58246fa 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -64,7 +64,7 @@ do_compile () {
 
 do_install () {
 	mkdir -p ${D}${prefix}/${base_libdir_native}/rustlib
-	cp ${WORKDIR}/targets/${TARGET_SYS}.json ${D}${prefix}/${base_libdir_native}/rustlib
+	cp ${WORKDIR}/targets/${RUST_TARGET_SYS}.json ${D}${prefix}/${base_libdir_native}/rustlib
 }
 
 rust_cross_sysroot_preprocess() {
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 1d6f99afad31..cc0730e9cd2d 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -27,7 +27,7 @@ CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
 # We can't use RUST_BUILD_SYS here because that may be "musl" if
 # TCLIBC="musl". Snapshots are always -unknown-linux-gnu
-SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
+SNAPSHOT_BUILD_SYS = "${RUST_BUILD_ARCH}-unknown-linux-gnu"
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
@@ -48,8 +48,8 @@ do_rust_setup_snapshot () {
 
     # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
     # and fail without it there.
-    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
-    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
+    mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
+    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
 
     # Need to use uninative's loader if enabled/present since the library paths
     # are used internally by rust and result in symbol mismatches if we don't
@@ -79,7 +79,7 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
     config.add_section(target_section)
 
     llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
@@ -124,11 +124,11 @@ python do_configure() {
     config.set("build", "vendor", e(True))
 
     if not "targets" in locals():
-        targets = [d.getVar("TARGET_SYS", True)]
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
     config.set("build", "target", e(targets))
 
     if not "hosts" in locals():
-        hosts = [d.getVar("HOST_SYS", True)]
+        hosts = [d.getVar("RUST_HOST_SYS", True)]
     config.set("build", "host", e(hosts))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
@@ -177,10 +177,10 @@ do_compile () {
 
 rust_do_install () {
     mkdir -p ${D}${bindir}
-    cp build/${HOST_SYS}/stage2/bin/* ${D}${bindir}
+    cp build/${RUST_HOST_SYS}/stage2/bin/* ${D}${bindir}
 
     mkdir -p ${D}${libdir}/rustlib
-    cp -pRd build/${HOST_SYS}/stage2/lib/* ${D}${libdir}
+    cp -pRd build/${RUST_HOST_SYS}/stage2/lib/* ${D}${libdir}
     # Remove absolute symlink so bitbake doesn't complain
     rm -f ${D}${libdir}/rustlib/src/rust
 }
-- 
2.32.0


