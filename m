Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0705C25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 00:31:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11184.1660523508501362976
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 17:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KGDgAnHs;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5226248fcf=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27F0VlPN022039
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=8TOmWd4pSNv0wJmJ+NMf1jRT6h0bujomBd6n727zIYg=;
 b=KGDgAnHsIQNx9uPthaN2fq4Sxlv1fd+NsHrgcBQGQ4my15lOMRpXir3uqzUZnnv+Bmte
 NA7T8psmExqzzmUYY50YHuHUQX7cxyToFquy5BinUcnQmlzQzHn7ZJk2sGo8m0L7PWLZ
 nOY8f6x0dolVztDPihja/yJYpl2PBgFgs3vAGilXN8O/tsX01Ce1YpsZTH92ptHsmnP3
 isvivUTPrd45Pfi22te9VE92KVVq/h2qhgbWsIDQmuhvFGSLvNi14D67dnjG+spwEtjh
 YhejOixll5LopNtSbNSVWi1+xSirfN4RQ6MfoeyUXH9PkTmJi06gqI3QJD+iLnbhJokZ yg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8h7pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 00:31:46 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Aug 2022 17:31:45 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 14 Aug 2022 17:31:45 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rust: update from 1.62.1 to 1.63.0
Date: Sun, 14 Aug 2022 17:31:45 -0700
Message-ID: <20220815003145.88258-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WXv8WuK4XSUK3buyaeVYI4t-mMuWa94B
X-Proofpoint-GUID: WXv8WuK4XSUK3buyaeVYI4t-mMuWa94B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_15,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=877 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208150000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169339

Release notes:
   https://blog.rust-lang.org/2022/08/11/Rust-1.63.0.html

This is a standard upgrade aside from the path for the
stage2 tools binaries (clippy, et.al.) changing.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../{cargo_1.62.1.bb => cargo_1.63.0.bb}      |  0
 ...ibstd-rs_1.62.1.bb => libstd-rs_1.63.0.bb} |  0
 ....62.1.bb => rust-cross-canadian_1.63.0.bb} |  0
 ...ust-llvm_1.62.1.bb => rust-llvm_1.63.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 24 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.62.1.bb => rust_1.63.0.bb}   |  4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo_1.62.1.bb => cargo_1.63.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.62.1.bb => libstd-rs_1.63.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.62.1.bb => rust-cross-canadian_1.63.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.62.1.bb => rust-llvm_1.63.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.62.1.bb => rust_1.63.0.bb} (92%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 31c9dd5065..52d0f7a79f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "14.0.6"
-RUSTVERSION ?= "1.62%"
+RUSTVERSION ?= "1.63%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo_1.62.1.bb b/meta/recipes-devtools/cargo/cargo_1.63.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.62.1.bb
rename to meta/recipes-devtools/cargo/cargo_1.63.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.62.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 3bd7b07cef..b9d7edd672 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -1,25 +1,25 @@
 ## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.txt
+## snapshot info is taken from rust/src/stage0.json
 ## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION = "1.61.0"
-CARGO_VERSION = "1.61.0"
+RS_VERSION = "1.62.0"
+CARGO_VERSION = "1.62.0"
 
 # TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "270b07aa5f2de52255a117e1e587138d77375ce0d09a1d7fead085f29b3977e9"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "21c4613f389ed130fbaaf88f1e984319f72b5fc10734569a5ba19e22ebb03abd"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "9461727d754f865ef2a87479d40bbe4c5176f80963b7c50b7797bc8940d7a0a0"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "e7f71f4ef09334ddc9ec8cbf2f958d654e36f580c95f8fec6d5c816ce256dbd6"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "815c63119a9cf0282ff240c6444b6f867238763ee3dea182f10837ae7dbbb1d4"
 
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "57d60a519dbce12146849f7e72d55f3cffe9cdcbff8d58e90bb62d3c016bb5c0"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "c996de6391e3ea94629fbc09b03bce186fcde345159f43ec95a82c500adb5e94"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "a055e6cfd9b5f8938780db6179d2ef92990c714ce64278337d7edf3d29c8ab62"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0fa320a19d41dcfc592bc006f5e9eda8e3b972598a26c96ad64eedd868516df3"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "475038ecacca9ff586cad2082d5d950544b0d581a2a287facc7d899aae488813"
 
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "36c0ccff14c80419507561db050f9533f0abd43fc50f3ddb859c10df74b1c351"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "dc54893d747e4f3330515caa75e404f78c6c5475a1216d1428f5e7ce1c2e9602"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "09817011ff1ef4b7006387c7cabb6a059731792a9372533dec7d87e7f014444b"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b66d0bc6dbfdc0d4b826f787ec4e772dea8e3d2015cecbe2105632d468c28dcb"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "016257f1641693008068bd086fec66d68550d1778f6aea9d06c9b263fca392d5"
 
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index dbcef2cbc2..47bfbe98a7 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e"
+SRC_URI[rust.sha256sum] = "8f44af6dc44cc4146634a4dd5e4cc5470b3052a2337019b870c0e025e8987e0c"
 
 SRC_URI:append:class-target:pn-rust = " file://hardcodepaths.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
diff --git a/meta/recipes-devtools/rust/rust_1.62.1.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
similarity index 92%
rename from meta/recipes-devtools/rust/rust_1.62.1.bb
rename to meta/recipes-devtools/rust/rust_1.63.0.bb
index 81923c3331..3081cd5ef3 100644
--- a/meta/recipes-devtools/rust/rust_1.62.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -43,7 +43,7 @@ rust_do_install:class-nativesdk() {
 
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
+        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
@@ -60,7 +60,7 @@ rust_do_install:class-target() {
 
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
+        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
-- 
2.35.1


