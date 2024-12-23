Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF2FE77196
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10575.1734945082569905880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qm36ESC6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OD3m0kAkAlmbtK7HrO1GBifkFmxF05tDJytsIVZJ2kc=;
  b=qm36ESC6H82z/z2zFdTVuQVAunMpUJ8VNtQQhGTXTs0exqV9Lh3d78j8
   E3Y+gL+prCZuE6E7wkRiBkqo87UJ53ikDHqfEQu00Q4ZGKw0e2hNcmzIT
   bAPZfOoDG1Q2bNWKPMLGGClFceWYndolHDh6isOunWS5oLDg3jBUh0Zaw
   hfWXg1YnIdAriFJTlfvmC4NxZODcx68PI3gNPA+OejhM09qqbbDwAsWCH
   1gvYudNczTWuuJKhcixjr2AYwDeMYxZPErhduBYtJyxUt7puO/kgcvarJ
   kyOD0GAFOI00BQQSYkdMhwgB3X06r5J1ISbw1nwCem0N8gRk3Erbh+GPg
   w==;
X-CSE-ConnectionGUID: AOs6sGN9T12B0SmRKgZZzw==
X-CSE-MsgGUID: wkyAeKWOSpquD2Oavo06hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="163591234"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="163591234"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D00F5D4C39
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96682BF493
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9509200930C0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 911EC1A0073;
	Mon, 23 Dec 2024 17:11:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/22] python3-maturin: upgrade 1.7.4 -> 1.7.8
Date: Mon, 23 Dec 2024 17:10:55 +0800
Message-Id: <1734945065-4373-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--15.614700-10.000000
X-TMASE-MatchedRID: DZJZqnbbs3Wjz0nOeth/yeyqPZuzomI+kdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI2ricPOsQXkQ224dI/2gQ7/qc3w8LXZ2a4WCjDJRYeAZ2pr7RsZn6zmVgYwsPuFUjAe/I
	P7fTYRZE9HFh3RLXD6d+ZQOugzwCHFePd46UQ9mp85pjA/x1xfiKajbeLFjgOM6eIOeX50FizhH
	ct+GcMBFsYzlA5COcgzmlEEytj49m52GHObZFsZzdgZMTW2ZCj2+EDPw+8xre3lIo0YTJv4Kiz2
	yX3N56R25ZKiGOSdjVv78I6Kpfa8dGETJv1/WyOuce7gFxhKa2XBPRemiwRNb5/tqn0MloN7v0M
	lFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0wo+sXt0rns4vmPkMN08c/wdc9Srwl8GhGbbX
	vIHWMTdUrfTvbThLWsUlHUmKWow8UH4Ie3fpSsaqHmm/V4M/PRXtlVL3Vch+tK8tFFF9EbeUUT3
	zIzJs8Fp86wHE89HocH8jEI2tcLqjaFW98O54CY3lXn11HdtTFUZ7q8HqQFEekR3VSvOYVyG9tJ
	u7z9B0QoBF94NzIPPyvrWdwLTirxhAlvhBPg1YotYKdGcWqijRgv1Ik+59fdFY+YGPfKwzT0PpH
	DbMis/GreLFhOYYLzsnffK9T/uFYM+pmHGmzhjz6L+U/pejxltF+xW+zhUhyURnQQNo5iBzuL4P
	52bGMgrpHH63XKBneLyT0oSNhxXpsxhuKgz2pb/oIJuUAIuEW4OwYi14vl1gLks93sG9tmkh1mX
	1VkyfYgCp6bjAgaoAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7Du0QtnPPPdNppp6TuqeI3NXGdFwd
	IEtgCvtrmdcTy9scL3eQ7Y4p6Y=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209029

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build_context-improve-wheel-reproducibility-by-sorti.patch
removed since it's included in 1.7.8

Changelog:
==========
- Fix aarch64 Windows cross compilation
- [pre-commit.ci] pre-commit autoupdate
- Fix aarch64 Windows cross compilation
- fix abi3 interpreter discovery on Windows
- fix: remove extra indent in generated CI
- Upgrade cargo-xwin to unify rustls versions
- Normalize python source directory path
- Enable fat LTO for maturin release workflow
- Use different binding dirs for different uniffi modules
- Update minimal Python minor version for pyo3 0.23
- Limit minimal PyPy version based on bindings crate version
- Remove hard coded pip show in fix_direct_url
- Do not use xwin to compile on Windows when MSVC compiler can build for the target
- fix abi3 interpreter discovery on Windows
- allow -i 3.13t
- propagate abiflags to wheel name on Windows
- Add free-threaded wheel build to generate-ci by default
- Bump metadata version to 2.4 to fix license bug
- allow -i 3.13t
- propagate abiflags to wheel name on Windows
- Add free-threaded wheel build to generate-ci by default
- Auto detect Python 3.13
- feat: add skip attestation option to maturin ci github
- generate-ci: use macos-13 runner for x86_64 build job
- Improve wheel reproducibility by sorting libs
- Fix inverted workspace inclusions
- Fix broken links to PyO3 building docs
- Update goblin to 0.9
- Don't resolve python interpreter when building sdist only
- include timestamps in the suggested log format
- Add support for GNU/Hurd
- Fix __init__ exports when using multiple UniFFI bindings
- Add free-threaded Python support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-maturin-crates.inc         | 140 ++++++++++--------
 ...prove-wheel-reproducibility-by-sorti.patch |  55 -------
 ...urin_1.7.4.bb => python3-maturin_1.7.8.bb} |   5 +-
 3 files changed, 83 insertions(+), 117 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
 rename meta/recipes-devtools/python/{python3-maturin_1.7.4.bb => python3-maturin_1.7.8.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 3ff5e4ec51..d4642d4b42 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -12,6 +12,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.0 \
     crate://crates.io/anstyle-wincon/3.0.3 \
     crate://crates.io/anyhow/1.0.89 \
+    crate://crates.io/arbitrary/1.4.1 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/automod/1.0.14 \
     crate://crates.io/base64/0.21.7 \
@@ -20,22 +21,23 @@ SRC_URI += " \
     crate://crates.io/bitflags/2.5.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/bstr/1.10.0 \
+    crate://crates.io/bumpalo/3.16.0 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/bytes/1.7.1 \
     crate://crates.io/bytesize/1.3.0 \
     crate://crates.io/bzip2/0.4.4 \
     crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
-    crate://crates.io/cab/0.5.0 \
+    crate://crates.io/cab/0.6.0 \
     crate://crates.io/camino/1.1.9 \
     crate://crates.io/cargo-config2/0.1.26 \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
-    crate://crates.io/cargo-xwin/0.16.5 \
-    crate://crates.io/cargo-zigbuild/0.19.3 \
-    crate://crates.io/cargo_metadata/0.18.1 \
-    crate://crates.io/cbindgen/0.26.0 \
+    crate://crates.io/cargo-xwin/0.17.5 \
+    crate://crates.io/cargo-zigbuild/0.19.5 \
+    crate://crates.io/cargo_metadata/0.19.0 \
+    crate://crates.io/cbindgen/0.27.0 \
     crate://crates.io/cc/1.1.21 \
-    crate://crates.io/cfb/0.9.0 \
+    crate://crates.io/cfb/0.10.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/charset/0.1.5 \
     crate://crates.io/chumsky/0.9.3 \
@@ -65,11 +67,13 @@ SRC_URI += " \
     crate://crates.io/data-encoding/2.6.0 \
     crate://crates.io/deranged/0.3.11 \
     crate://crates.io/derivative/2.2.0 \
+    crate://crates.io/derive_arbitrary/1.4.1 \
     crate://crates.io/dialoguer/0.11.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dirs/5.0.1 \
     crate://crates.io/dirs-sys/0.4.1 \
+    crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dissimilar/1.0.9 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.17 \
@@ -80,7 +84,7 @@ SRC_URI += " \
     crate://crates.io/errno/0.3.9 \
     crate://crates.io/expect-test/1.5.0 \
     crate://crates.io/fastrand/2.1.0 \
-    crate://crates.io/fat-macho/0.4.8 \
+    crate://crates.io/fat-macho/0.4.9 \
     crate://crates.io/filetime/0.2.23 \
     crate://crates.io/flate2/1.0.33 \
     crate://crates.io/fnv/1.0.7 \
@@ -88,22 +92,23 @@ SRC_URI += " \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/fs-err/2.11.0 \
+    crate://crates.io/fs-err/3.0.0 \
+    crate://crates.io/fs4/0.11.1 \
     crate://crates.io/futures/0.3.30 \
-    crate://crates.io/futures-channel/0.3.30 \
-    crate://crates.io/futures-core/0.3.30 \
+    crate://crates.io/futures-channel/0.3.31 \
+    crate://crates.io/futures-core/0.3.31 \
     crate://crates.io/futures-executor/0.3.30 \
-    crate://crates.io/futures-io/0.3.30 \
-    crate://crates.io/futures-macro/0.3.30 \
-    crate://crates.io/futures-sink/0.3.30 \
-    crate://crates.io/futures-task/0.3.30 \
+    crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures-macro/0.3.31 \
+    crate://crates.io/futures-sink/0.3.31 \
+    crate://crates.io/futures-task/0.3.31 \
     crate://crates.io/futures-timer/3.0.3 \
-    crate://crates.io/futures-util/0.3.30 \
+    crate://crates.io/futures-util/0.3.31 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.15 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/globset/0.4.15 \
-    crate://crates.io/goblin/0.8.2 \
-    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/goblin/0.9.2 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/heck/0.4.1 \
     crate://crates.io/heck/0.5.0 \
@@ -112,7 +117,6 @@ SRC_URI += " \
     crate://crates.io/humantime-serde/1.1.1 \
     crate://crates.io/idna/0.5.0 \
     crate://crates.io/ignore/0.4.23 \
-    crate://crates.io/indexmap/1.9.3 \
     crate://crates.io/indexmap/2.5.0 \
     crate://crates.io/indicatif/0.17.8 \
     crate://crates.io/indoc/2.0.5 \
@@ -122,13 +126,15 @@ SRC_URI += " \
     crate://crates.io/itoa/1.0.11 \
     crate://crates.io/keyring/2.3.3 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/lddtree/0.3.5 \
+    crate://crates.io/lddtree/0.3.7 \
     crate://crates.io/libc/0.2.158 \
     crate://crates.io/libmimalloc-sys/0.1.38 \
     crate://crates.io/libredox/0.1.3 \
     crate://crates.io/linux-keyutils/0.2.4 \
     crate://crates.io/linux-raw-sys/0.4.14 \
+    crate://crates.io/litemap/0.7.3 \
     crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/lockfree-object-pool/0.1.6 \
     crate://crates.io/log/0.4.21 \
     crate://crates.io/lzxd/0.2.5 \
     crate://crates.io/mailparse/0.15.0 \
@@ -137,10 +143,10 @@ SRC_URI += " \
     crate://crates.io/mimalloc/0.1.42 \
     crate://crates.io/mime/0.3.17 \
     crate://crates.io/mime_guess/2.0.4 \
-    crate://crates.io/minijinja/1.0.21 \
+    crate://crates.io/minijinja/2.5.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.8.0 \
-    crate://crates.io/msi/0.7.0 \
+    crate://crates.io/msi/0.8.0 \
     crate://crates.io/multipart/0.18.0 \
     crate://crates.io/native-tls/0.2.12 \
     crate://crates.io/nom/7.1.3 \
@@ -201,10 +207,10 @@ SRC_URI += " \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustflags/0.1.6 \
     crate://crates.io/rustix/0.38.34 \
-    crate://crates.io/rustls/0.22.4 \
+    crate://crates.io/rustls/0.23.19 \
     crate://crates.io/rustls-pemfile/2.1.3 \
-    crate://crates.io/rustls-pki-types/1.7.0 \
-    crate://crates.io/rustls-webpki/0.102.4 \
+    crate://crates.io/rustls-pki-types/1.10.0 \
+    crate://crates.io/rustls-webpki/0.102.8 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
     crate://crates.io/same-file/1.0.6 \
@@ -226,6 +232,7 @@ SRC_URI += " \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-words/1.1.0 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/simd-adler32/0.3.7 \
     crate://crates.io/similar/2.5.0 \
     crate://crates.io/slab/0.4.9 \
     crate://crates.io/smallvec/1.13.2 \
@@ -234,12 +241,13 @@ SRC_URI += " \
     crate://crates.io/snapbox-macros/0.3.10 \
     crate://crates.io/socks/0.3.4 \
     crate://crates.io/spin/0.9.8 \
+    crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/stacker/0.1.15 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/subtle/2.5.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.76 \
+    crate://crates.io/syn/2.0.87 \
     crate://crates.io/tar/0.4.42 \
     crate://crates.io/target-lexicon/0.12.16 \
     crate://crates.io/tempfile/3.11.0 \
@@ -247,14 +255,15 @@ SRC_URI += " \
     crate://crates.io/terminal_size/0.3.0 \
     crate://crates.io/textwrap/0.16.1 \
     crate://crates.io/thiserror/1.0.64 \
+    crate://crates.io/thiserror/2.0.3 \
     crate://crates.io/thiserror-impl/1.0.64 \
+    crate://crates.io/thiserror-impl/2.0.3 \
     crate://crates.io/thread_local/1.1.8 \
     crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
     crate://crates.io/time-macros/0.2.18 \
     crate://crates.io/tinyvec/1.7.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/toml/0.5.11 \
     crate://crates.io/toml/0.8.15 \
     crate://crates.io/toml_datetime/0.6.6 \
     crate://crates.io/toml_edit/0.21.1 \
@@ -277,7 +286,7 @@ SRC_URI += " \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/ureq/2.9.7 \
+    crate://crates.io/ureq/2.11.0 \
     crate://crates.io/url/2.5.2 \
     crate://crates.io/urlencoding/2.1.3 \
     crate://crates.io/utf8parse/0.2.2 \
@@ -290,8 +299,7 @@ SRC_URI += " \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/webpki-roots/0.26.2 \
-    crate://crates.io/which/5.0.0 \
-    crate://crates.io/which/6.0.3 \
+    crate://crates.io/which/7.0.0 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -320,12 +328,16 @@ SRC_URI += " \
     crate://crates.io/winnow/0.6.13 \
     crate://crates.io/winsafe/0.0.19 \
     crate://crates.io/xattr/1.3.1 \
-    crate://crates.io/xwin/0.5.1 \
+    crate://crates.io/xwin/0.6.5 \
     crate://crates.io/yansi/1.0.1 \
+    crate://crates.io/yoke/0.7.4 \
     crate://crates.io/zerocopy/0.7.34 \
     crate://crates.io/zerocopy-derive/0.7.34 \
+    crate://crates.io/zerofrom/0.1.4 \
     crate://crates.io/zeroize/1.8.1 \
     crate://crates.io/zip/0.6.6 \
+    crate://crates.io/zip/2.1.6 \
+    crate://crates.io/zopfli/0.8.1 \
 "
 
 SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
@@ -338,6 +350,7 @@ SRC_URI[anstyle-parse-0.2.4.sha256sum] = "c03a11a9034d92058ceb6ee011ce58af4a9bf6
 SRC_URI[anstyle-query-1.1.0.sha256sum] = "ad186efb764318d35165f1758e7dcef3b10628e26d41a44bc5550652e6804391"
 SRC_URI[anstyle-wincon-3.0.3.sha256sum] = "61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19"
 SRC_URI[anyhow-1.0.89.sha256sum] = "86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6"
+SRC_URI[arbitrary-1.4.1.sha256sum] = "dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[automod-1.0.14.sha256sum] = "edf3ee19dbc0a46d740f6f0926bde8c50f02bdbc7b536842da28f6ac56513a8b"
 SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
@@ -346,22 +359,23 @@ SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f
 SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[bstr-1.10.0.sha256sum] = "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
+SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[bytes-1.7.1.sha256sum] = "8318a53db07bb3f8dca91a600466bdb3f2eaadeedfdbcf02e1accbad9271ba50"
 SRC_URI[bytesize-1.3.0.sha256sum] = "a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc"
 SRC_URI[bzip2-0.4.4.sha256sum] = "bdb116a6ef3f6c3698828873ad02c3014b3c85cadb88496095628e3ef1e347f8"
 SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] = "736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc"
-SRC_URI[cab-0.5.0.sha256sum] = "9e8636d870cf15918e416b7904f0db1cbd06de0ffe392986c3b16662552df00c"
+SRC_URI[cab-0.6.0.sha256sum] = "171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2"
 SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3"
 SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
-SRC_URI[cargo-xwin-0.16.5.sha256sum] = "471f6fff351fc5ab837ce7223637f7c20048e4a846708e7e58fda64db9d3a8b9"
-SRC_URI[cargo-zigbuild-0.19.3.sha256sum] = "e700178b11124560cdbabc8808e938fe6d77abde036b77a4c03a191b02bac854"
-SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
-SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
+SRC_URI[cargo-xwin-0.17.5.sha256sum] = "9cfe03fae5d4f7192f1a573f84d12b11f20877d43941ea3730289cc7af050531"
+SRC_URI[cargo-zigbuild-0.19.5.sha256sum] = "5eb13fbc2ba490ac9eb0b359cf46ba265255424c04a172f1c1772a8b9532283d"
+SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
+SRC_URI[cbindgen-0.27.0.sha256sum] = "3fce8dd7fcfcbf3a0a87d8f515194b49d6135acab73e18bd380d1d93bb1a15eb"
 SRC_URI[cc-1.1.21.sha256sum] = "07b1695e2c7e8fc85310cde85aeaab7e3097f593c91d209d3f9df76c928100f0"
-SRC_URI[cfb-0.9.0.sha256sum] = "b390793e912300f1aa713429f7fd0c391024e6c18b988962558bc4f96a349b1f"
+SRC_URI[cfb-0.10.0.sha256sum] = "d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
 SRC_URI[chumsky-0.9.3.sha256sum] = "8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9"
@@ -391,11 +405,13 @@ SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813
 SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
 SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
 SRC_URI[derivative-2.2.0.sha256sum] = "fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b"
+SRC_URI[derive_arbitrary-1.4.1.sha256sum] = "30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800"
 SRC_URI[dialoguer-0.11.0.sha256sum] = "658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dirs-5.0.1.sha256sum] = "44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225"
 SRC_URI[dirs-sys-0.4.1.sha256sum] = "520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c"
+SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dissimilar-1.0.9.sha256sum] = "59f8e79d1fbf76bdfbde321e902714bf6c49df88a7dda6fc682fc2979226962d"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
@@ -406,7 +422,7 @@ SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca62
 SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
 SRC_URI[expect-test-1.5.0.sha256sum] = "9e0be0a561335815e06dab7c62e50353134c796e7a6155402a64bcff66b6a5e0"
 SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
-SRC_URI[fat-macho-0.4.8.sha256sum] = "0d4c93f393add03d72bc10dd3dea43a1610ecb29e0c0a6459c70b53b82931adf"
+SRC_URI[fat-macho-0.4.9.sha256sum] = "4c9c45caa6c6edfaee4cb3bd84ea9686e115df7f0efb530e15fb466eccb0b345"
 SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
 SRC_URI[flate2-1.0.33.sha256sum] = "324a1be68054ef05ad64b861cc9eaf1d623d2d8cb25b4bf2cb9cdd902b4bf253"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
@@ -414,22 +430,23 @@ SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[fs-err-2.11.0.sha256sum] = "88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41"
+SRC_URI[fs-err-3.0.0.sha256sum] = "8bb60e7409f34ef959985bc9d9c5ee8f5db24ee46ed9775850548021710f807f"
+SRC_URI[fs4-0.11.1.sha256sum] = "e871a4cfa68bb224863b53149d973df1ac8d1ed2fa1d1bfc37ac1bb65dd37207"
 SRC_URI[futures-0.3.30.sha256sum] = "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
-SRC_URI[futures-channel-0.3.30.sha256sum] = "eac8f7d7865dcb88bd4373ab671c8cf4508703796caa2b1985a9ca867b3fcb78"
-SRC_URI[futures-core-0.3.30.sha256sum] = "dfc6580bb841c5a68e9ef15c77ccc837b40a7504914d52e47b8b0e9bbda25a1d"
+SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
+SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
 SRC_URI[futures-executor-0.3.30.sha256sum] = "a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
-SRC_URI[futures-io-0.3.30.sha256sum] = "a44623e20b9681a318efdd71c299b6b222ed6f231972bfe2f224ebad6311f0c1"
-SRC_URI[futures-macro-0.3.30.sha256sum] = "87750cf4b7a4c0625b1529e4c543c2182106e4dedc60a2a6455e00d212c489ac"
-SRC_URI[futures-sink-0.3.30.sha256sum] = "9fb8e00e87438d937621c1c6269e53f536c14d3fbd6a042bb24879e57d474fb5"
-SRC_URI[futures-task-0.3.30.sha256sum] = "38d84fa142264698cdce1a9f9172cf383a0c82de1bddcf3092901442c4097004"
+SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
+SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
+SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
 SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
-SRC_URI[futures-util-0.3.30.sha256sum] = "3d6401deb83407ab3da39eba7e33987a73c3df0c82b4bb5813ee871c19c41d48"
+SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[globset-0.4.15.sha256sum] = "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
-SRC_URI[goblin-0.8.2.sha256sum] = "1b363a30c165f666402fe6a3024d3bec7ebc898f96a4a23bd1c99f8dbf3f4f47"
-SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[goblin-0.9.2.sha256sum] = "53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
@@ -438,7 +455,6 @@ SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f9
 SRC_URI[humantime-serde-1.1.1.sha256sum] = "57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c"
 SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
 SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
-SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
 SRC_URI[indexmap-2.5.0.sha256sum] = "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
 SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
@@ -448,13 +464,15 @@ SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855b
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[lddtree-0.3.5.sha256sum] = "735dc8281e12cf7450b3a343c50bccdb15625f41b127d1bd7063949fe367847d"
+SRC_URI[lddtree-0.3.7.sha256sum] = "e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e"
 SRC_URI[libc-0.2.158.sha256sum] = "d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"
 SRC_URI[libmimalloc-sys-0.1.38.sha256sum] = "0e7bb23d733dfcc8af652a78b7bf232f0e967710d044732185e561e47c0336b6"
 SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
 SRC_URI[linux-keyutils-0.2.4.sha256sum] = "761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e"
 SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
+SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
 SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[lockfree-object-pool-0.1.6.sha256sum] = "9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e"
 SRC_URI[log-0.4.21.sha256sum] = "90ed8c1e510134f979dbc4f070f87d4313098b704861a105fe34231c70a3901c"
 SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
 SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
@@ -463,10 +481,10 @@ SRC_URI[memchr-2.7.2.sha256sum] = "6c8640c5d730cb13ebd907d8d04b52f55ac9a2eec55b4
 SRC_URI[mimalloc-0.1.42.sha256sum] = "e9186d86b79b52f4a77af65604b51225e8db1d6ee7e3f41aec1e40829c71a176"
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
 SRC_URI[mime_guess-2.0.4.sha256sum] = "4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef"
-SRC_URI[minijinja-1.0.21.sha256sum] = "55e877d961d4f96ce13615862322df7c0b6d169d40cab71a7ef3f9b9e594451e"
+SRC_URI[minijinja-2.5.0.sha256sum] = "2c37e1b517d1dcd0e51dc36c4567b9d5a29262b3ec8da6cb5d35e27a8fb529b5"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.8.0.sha256sum] = "e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1"
-SRC_URI[msi-0.7.0.sha256sum] = "226b2404f03d2cf47375b9715c8adfae4e388bb2377cff908e8a40f31e421514"
+SRC_URI[msi-0.8.0.sha256sum] = "4a2332f87a064dea9cce571408c879e0da8dc193b3af06a2b3b2604ee4182a32"
 SRC_URI[multipart-0.18.0.sha256sum] = "00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182"
 SRC_URI[native-tls-0.2.12.sha256sum] = "a8614eb2c83d59d1c8cc974dd3f920198647674a0a035e1af1fa58707e317466"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
@@ -527,10 +545,10 @@ SRC_URI[rstest_macros-0.22.0.sha256sum] = "c5e1711e7d14f74b12a58411c542185ef7fb7
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustflags-0.1.6.sha256sum] = "d7fc92159fb50a431c5da366f7627751fe7263cf867f8a30f27fa6063ba02ac0"
 SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
-SRC_URI[rustls-0.22.4.sha256sum] = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
+SRC_URI[rustls-0.23.19.sha256sum] = "934b404430bb06b3fae2cba809eb45a1ab1aecd64491213d7c3301b88393f8d1"
 SRC_URI[rustls-pemfile-2.1.3.sha256sum] = "196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425"
-SRC_URI[rustls-pki-types-1.7.0.sha256sum] = "976295e77ce332211c0d24d92c0e83e50f5c5f046d11082cea19f3df13a3562d"
-SRC_URI[rustls-webpki-0.102.4.sha256sum] = "ff448f7e92e913c4b7d4c6d8e4540a1724b319b4152b8aef6d4cf8339712b33e"
+SRC_URI[rustls-pki-types-1.10.0.sha256sum] = "16f1201b3c9a7ee8039bcadc17b7e605e2945b27eee7631788c1bd2b0643674b"
+SRC_URI[rustls-webpki-0.102.8.sha256sum] = "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
@@ -552,6 +570,7 @@ SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-words-1.1.0.sha256sum] = "24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[simd-adler32-0.3.7.sha256sum] = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
 SRC_URI[similar-2.5.0.sha256sum] = "fa42c91313f1d05da9b26f267f931cf178d4aba455b4c4622dd7355eb80c6640"
 SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
@@ -560,12 +579,13 @@ SRC_URI[snapbox-0.6.16.sha256sum] = "027c936207f85d10d015e21faf5c676c7e08c453ed3
 SRC_URI[snapbox-macros-0.3.10.sha256sum] = "16569f53ca23a41bb6f62e0a5084aa1661f4814a67fa33696a79073e03a664af"
 SRC_URI[socks-0.3.4.sha256sum] = "f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
+SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[stacker-0.1.15.sha256sum] = "c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.76.sha256sum] = "578e081a14e0cefc3279b0472138c513f37b41a08d5a3cca9b6e4e8ceb6cd525"
+SRC_URI[syn-2.0.87.sha256sum] = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
 SRC_URI[tar-0.4.42.sha256sum] = "4ff6c40d3aedb5e06b57c6f669ad17ab063dd1e63d977c6a88e7f4dfa4f04020"
 SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
 SRC_URI[tempfile-3.11.0.sha256sum] = "b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53"
@@ -573,14 +593,15 @@ SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c7
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
 SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
 SRC_URI[thiserror-1.0.64.sha256sum] = "d50af8abc119fb8bb6dbabcfa89656f46f84aa0ac7688088608076ad2b459a84"
+SRC_URI[thiserror-2.0.3.sha256sum] = "c006c85c7651b3cf2ada4584faa36773bd07bac24acfb39f3c431b36d7e667aa"
 SRC_URI[thiserror-impl-1.0.64.sha256sum] = "08904e7672f5eb876eaaf87e0ce17857500934f4981c4a0ab2b4aa98baac7fc3"
+SRC_URI[thiserror-impl-2.0.3.sha256sum] = "f077553d607adc1caf65430528a576c757a71ed73944b66ebb58ef2bbd243568"
 SRC_URI[thread_local-1.1.8.sha256sum] = "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
 SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
 SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
 SRC_URI[tinyvec-1.7.0.sha256sum] = "ce6b6a2fb3a985e99cebfaefa9faa3024743da73304ca1c683a36429613d3d22"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
 SRC_URI[toml-0.8.15.sha256sum] = "ac2caab0bf757388c6c0ae23b3293fdb463fee59434529014f85e3263b995c28"
 SRC_URI[toml_datetime-0.6.6.sha256sum] = "4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf"
 SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
@@ -603,7 +624,7 @@ SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810d
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[ureq-2.9.7.sha256sum] = "d11a831e3c0b56e438a28308e7c810799e3c118417f342d30ecec080105395cd"
+SRC_URI[ureq-2.11.0.sha256sum] = "b30e6f97efe1fa43535ee241ee76967d3ff6ff3953ebb430d8d55c5393029e7b"
 SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
 SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
@@ -616,8 +637,7 @@ SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[webpki-roots-0.26.2.sha256sum] = "3c452ad30530b54a4d8e71952716a212b08efd0f3562baa66c29a618b07da7c3"
-SRC_URI[which-5.0.0.sha256sum] = "9bf3ea8596f3a0dd5980b46430f2058dfe2c36a27ccfbb1845d6fbfcd9ba6e14"
-SRC_URI[which-6.0.3.sha256sum] = "b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a868418ac1b39cf1f"
+SRC_URI[which-7.0.0.sha256sum] = "c9cad3279ade7346b96e38731a641d7343dd6a53d55083dd54eadfa5a1b38c6b"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -646,9 +666,13 @@ SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6
 SRC_URI[winnow-0.6.13.sha256sum] = "59b5e5f6c299a3c7890b876a2a587f3115162487e704907d9b6cd29473052ba1"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
-SRC_URI[xwin-0.5.1.sha256sum] = "c13f18103ecd54342d0f923b33fff9ed595e5813e5af85620f1a8e7622474acb"
+SRC_URI[xwin-0.6.5.sha256sum] = "ca7e4546db1514c186778f0a257d89732ed9ed75587d0953ac25be7519d9f0d1"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
+SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
 SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
 SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
+SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
 SRC_URI[zip-0.6.6.sha256sum] = "760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261"
+SRC_URI[zip-2.1.6.sha256sum] = "40dd8c92efc296286ce1fbd16657c5dbefff44f1b4ca01cc5f517d8b7b3d3e2e"
+SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch b/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
deleted file mode 100644
index bcbe7b87ea..0000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-build_context-improve-wheel-reproducibility-by-sorti.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 672dca922397016720eae2a3f0fb79613971c56e Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Thu, 17 Oct 2024 22:17:20 +0200
-Subject: [PATCH] build_context: improve wheel reproducibility by sorting libs
- (#2261)
-
-OE-core note: Upstream does not have a commit message for this. Bellow
-is the message I've sent:
-> While tracking a reproducibility issue from maturin's output, we found
-> that the .so file in the output .whl were not ordered the same
-> every time.
->
-> Order of the external libraries in the .whl comes down to the order
-> `soname_map` is iterated. But, `std::HashMap` does not provide a stable
-> order and that create an unstable order in the wheel.
->
-> Switch to `std::BTreeMap` which keeps keys sorted and is iterable
-> in a stable order.
->
-> This can be tested by building current python3-cryptography :
->   SOURCE_DATE_EPOCH=1728915855 maturin build
->
-> Before this commit, the above give two possible outputs (~50% each), the
-> difference is in the order of libssl and libcrypto.
->
-> After this commit, the output is reproducible.
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/61d54809776e1ca79ff8cc92387d70796d50c16e]
----
- src/build_context.rs | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/build_context.rs b/src/build_context.rs
-index a98d233..09ca090 100644
---- a/src/build_context.rs
-+++ b/src/build_context.rs
-@@ -24,7 +24,7 @@ use normpath::PathExt;
- use pep508_rs::Requirement;
- use platform_info::*;
- use sha2::{Digest, Sha256};
--use std::collections::{HashMap, HashSet};
-+use std::collections::{BTreeMap, HashSet};
- use std::env;
- use std::fmt::{Display, Formatter};
- use std::io;
-@@ -396,7 +396,7 @@ impl BuildContext {
-         writer.add_directory(&libs_dir)?;
- 
-         let temp_dir = tempfile::tempdir()?;
--        let mut soname_map = HashMap::new();
-+        let mut soname_map = BTreeMap::new();
-         let mut libs_copied = HashSet::new();
-         for lib in ext_libs.iter().flatten() {
-             let lib_path = lib.realpath.clone().with_context(|| {
diff --git a/meta/recipes-devtools/python/python3-maturin_1.7.4.bb b/meta/recipes-devtools/python/python3-maturin_1.7.8.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-maturin_1.7.4.bb
rename to meta/recipes-devtools/python/python3-maturin_1.7.8.bb
index d9891b6a09..539fd6d9ee 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.7.4.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.7.8.bb
@@ -5,10 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI += " \
-           file://0001-build_context-improve-wheel-reproducibility-by-sorti.patch \
-           "
-SRC_URI[sha256sum] = "2b349d742a07527d236f0b4b6cab26f53ebecad0ceabfc09ec4c6a396e3176f9"
+SRC_URI[sha256sum] = "649c6ef3f0fa4c5f596140d761dc5a4d577c485cc32fb5b9b344a8280352880d"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.43.0


