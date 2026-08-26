Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B390C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:32:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6172.1787722318426648966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oDbYO47M;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1F344E413BB
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EDE9604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE91711C7AB30;
	Wed, 26 Aug 2026 07:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787722312; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2jg1+8mEQlcL7CbJ5+9jt9TkOlTqJEngndgrK4rlafk=;
	b=oDbYO47MAli5M/Nf/dJhN0PS3gn/7T91NsF+krFFQP5qNb+ZTEihbpo7HzNRkfPkwiWItx
	C5Tk+HgMaX7TOAO0+nqK8YbnOMMbxm0Ogij/XC1x6kGxJ+v0DcEv4hxVu4ZArZBe7dcfbN
	h7EBTMP7vztSahG46sODBKESjTw603enTp7kgDyOs5ZebPzxHJSGkDtyhIfmegBhzcqeQK
	3/QbQZ0F9vjrIFJaV7qFJSh6S1IKNzpX2nZoRNs/ZKPCS3IkNsVXznD+kJAb5wvQTp7otx
	ga+2xy9KE3YJM3zQE9YiPgwBaUDl0rezN5jXBINJ+KBfjNsUznEVq9piRfkjZA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 07:31:26 +0200
Subject: [PATCH 2/2] python3-maturin: upgrade 1.14.1 -> 1.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260826-mathieu-updates-v1-2-7a93b2311f69@bootlin.com>
References: <20260826-mathieu-updates-v1-0-7a93b2311f69@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-v1-0-7a93b2311f69@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787722301; l=15183;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=YgaqDe4Lz28hj2ZBx+3lBISUnMTFTc7PwTEUWVDRJuU=;
 b=2slJymIWGdOCV+LmvZCaKfJfCUjakfAlS7xbgNp846jguebzwPAq4tPdaUcQ7krwEN15takqn
 ptY8I6RHj98CgZF71bKlQtjnUBSfYsBbILE49KwGLHz/y39Cr7ptoPq
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244293

Changelog:

* Set `UV_PYTHON` when running `maturin develop` with uv ([#3236](https:/=
/github.com/pyo3/maturin/pull/3236))
* Set UID and GID headers in pax ([#3241](https://github.com/pyo3/maturin=
/pull/3241))
* Replace unguarded panics with explicit errors on fallible input ([#3242=
](https://github.com/pyo3/maturin/pull/3242))
* Harden PEP 517 build-wheel and fix unreachable OIDC 404 fallback ([#324=
4](https://github.com/pyo3/maturin/pull/3244))
* Fix abi3t PyModExport entrypoint check ([#3246](https://github.com/pyo3=
/maturin/pull/3246))
* Fix `maturin build --pgo -i <version>` with `uv` install ([#3237](https=
://github.com/pyo3/maturin/pull/3237))
* Refactor: apply some mechanical cleanups ([#3250](https://github.com/py=
o3/maturin/pull/3250))
* Refactor: BuildOrchestrator pipeline deduplication ([#3251](https://git=
hub.com/pyo3/maturin/pull/3251))
* Refactor: improve context and environment hygiene ([#3252](https://gith=
ub.com/pyo3/maturin/pull/3252))
* Fix(ci): honor ~=3D and =3D=3DX.* in requires-python for generate-ci ([=
#3249](https://github.com/pyo3/maturin/pull/3249))
* Refactor: type cleanup for options, tags, and wheel metadata ([#3253](h=
ttps://github.com/pyo3/maturin/pull/3253))
* Refactor: InstallDest, single BridgeModel, and ui output facade ([#3254=
](https://github.com/pyo3/maturin/pull/3254))
* Don=E2=80=99t specify generate-import-lib for PyO3 0.29 ([#3258](https:=
//github.com/pyo3/maturin/pull/3258))
* Refactor build so that pgo is part of normal pathway ([#3257](https://g=
ithub.com/pyo3/maturin/pull/3257))
* Fix: verify bindings detection with cargo tree in workspaces ([#3264](h=
ttps://github.com/pyo3/maturin/pull/3264))
* Fix: harden cargo tree verification of bindings detection ([#3266](http=
s://github.com/pyo3/maturin/pull/3266))
* Feat: support --pgo for maturin develop ([#3270](https://github.com/pyo=
3/maturin/pull/3270))
* Feat: support `MATURIN_PGO` env var to activate --pgo ([#3271](https://=
github.com/pyo3/maturin/pull/3271))
* Docs: correct crate feature documentation; remove stale clippy allow
* Fix: deduplicate SBOM includes across full merged list, preserving firs=
t-seen order
* Feat: type the bindings input with a single-source-of-truth enum ([#327=
3](https://github.com/pyo3/maturin/pull/3273))
* Don't force export of the `PyInit_{module_name}` in UniFfi mode ([#3275=
](https://github.com/pyo3/maturin/pull/3275))
* Switch musllinux images to `musllinux_1_2` as `musllinux_1_1` is EOL ([=
#3280](https://github.com/pyo3/maturin/pull/3280))
* Fix(generate-stubs): write stubs into the module's package directory ([=
#3282](https://github.com/pyo3/maturin/pull/3282))
* Fix group not cwd ([#3284](https://github.com/pyo3/maturin/pull/3284))
* Docs: document missing [tool.maturin] config fields ([#3287](https://gi=
thub.com/pyo3/maturin/pull/3287))
* Update cargo-zigbuild & cargo-xwin to 0.23.1
---
 .../python/python3-maturin-crates.inc              | 34 ++++++++++------=
------
 ...maturin_1.14.1.bb =3D> python3-maturin_1.15.0.bb} |  2 +-
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/me=
ta/recipes-devtools/python/python3-maturin-crates.inc
index d8faf5e18dd1..0674a34bcabe 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -10,7 +10,7 @@ SRC_URI +=3D " \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.103 \
     crate://crates.io/ar_archive_writer/0.5.1 \
     crate://crates.io/arwen/0.0.5 \
     crate://crates.io/arwen-codesign/0.0.1-alpha.1 \
@@ -37,8 +37,8 @@ SRC_URI +=3D " \
     crate://crates.io/cargo-options/0.8.1 \
     crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-platform/0.3.2 \
-    crate://crates.io/cargo-xwin/0.23.0 \
-    crate://crates.io/cargo-zigbuild/0.23.0 \
+    crate://crates.io/cargo-xwin/0.23.1 \
+    crate://crates.io/cargo-zigbuild/0.23.1 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cargo_metadata/0.23.1 \
     crate://crates.io/cbindgen/0.29.2 \
@@ -75,7 +75,7 @@ SRC_URI +=3D " \
     crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/crossbeam-channel/0.5.15 \
     crate://crates.io/crossbeam-deque/0.8.6 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-epoch/0.9.20 \
     crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.1 \
@@ -170,7 +170,7 @@ SRC_URI +=3D " \
     crate://crates.io/lddtree/0.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libbz2-rs-sys/0.2.3 \
-    crate://crates.io/libc/0.2.185 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libmimalloc-sys/0.1.46 \
     crate://crates.io/libredox/0.1.16 \
     crate://crates.io/linux-keyutils/0.2.5 \
@@ -185,7 +185,7 @@ SRC_URI +=3D " \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.8.0 \
-    crate://crates.io/memmap2/0.9.10 \
+    crate://crates.io/memmap2/0.9.11 \
     crate://crates.io/memo-map/0.3.3 \
     crate://crates.io/mimalloc/0.1.49 \
     crate://crates.io/mime/0.3.17 \
@@ -294,7 +294,7 @@ SRC_URI +=3D " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/0.6.9 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/serial_test/3.4.0 \
@@ -456,7 +456,7 @@ SRC_URI +=3D " \
     crate://crates.io/writeable/0.6.3 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xml-rs/0.8.28 \
-    crate://crates.io/xwin/0.9.0 \
+    crate://crates.io/xwin/0.10.0 \
     crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yoke/0.8.2 \
@@ -467,7 +467,6 @@ SRC_URI +=3D " \
     crate://crates.io/zerotrie/0.2.4 \
     crate://crates.io/zerovec/0.11.6 \
     crate://crates.io/zerovec-derive/0.11.3 \
-    crate://crates.io/zip/7.2.0 \
     crate://crates.io/zip/8.5.1 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
@@ -485,7 +484,7 @@ SRC_URI[anstyle-1.0.14.sha256sum] =3D "940b3a0ca603d1=
eade50a4846a2afffd5ef57a9feac
 SRC_URI[anstyle-parse-1.0.0.sha256sum] =3D "52ce7f38b242319f7cabaa681305=
5467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099a=
bca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb8=
898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] =3D "7f202df86484c868dbad7eaa557ef785d=
5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.103.sha256sum] =3D "2a4385e2e34eb35d6b3efe798b9eb8809=
6925d87726c0798709bf56d9ed84af3"
 SRC_URI[ar_archive_writer-0.5.1.sha256sum] =3D "7eb93bbb63b9c227414f6eb3=
a0adfddca591a8ce1e9b60661bb08969b87e340b"
 SRC_URI[arwen-0.0.5.sha256sum] =3D "d44cbd9bd79165abe331ebabb9dd4d59a5dc=
93791be33ff15ebd71baaadc85ba"
 SRC_URI[arwen-codesign-0.0.1-alpha.1.sha256sum] =3D "35d7a19757bfe3658d5=
a95bf25a0492f29ebb21933549bdbfa4075c895510124"
@@ -512,8 +511,8 @@ SRC_URI[cargo-lock-10.1.0.sha256sum] =3D "c06acb4f714=
07ba205a07cb453211e0e6a67b219
 SRC_URI[cargo-options-0.8.1.sha256sum] =3D "b916a16b2a4b0ce91d46e42c51b7=
fc42e754220a4cc8bbfd1947efaafea99af7"
 SRC_URI[cargo-platform-0.1.9.sha256sum] =3D "e35af189006b9c0f00a064685c7=
27031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-platform-0.3.2.sha256sum] =3D "87a0c0e6148f11f01f32650a2ea=
02d532b2ad4e81d8bd41e6e565b5adc5e6082"
-SRC_URI[cargo-xwin-0.23.0.sha256sum] =3D "22a978d433c17ee532d4cb0a8ec9b7=
aeb121e658267ac1c637504583b12b2861"
-SRC_URI[cargo-zigbuild-0.23.0.sha256sum] =3D "68c7df45b9d9934aaed5987fbf=
422b31419f81827b13a52251a61e1e772c6ff7"
+SRC_URI[cargo-xwin-0.23.1.sha256sum] =3D "08fe6fef95319ecc03c40127b2af81=
1522b7918b05502ebb35b2972208993a57"
+SRC_URI[cargo-zigbuild-0.23.1.sha256sum] =3D "9840ba8824cf43c7efb04a2680=
90199072ad3ca8c65c386132909aee1bd4d4bf"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] =3D "2d886547e41f740c616ae73108=
f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cargo_metadata-0.23.1.sha256sum] =3D "ef987d17b0a113becdd19d3d00=
22d04d7ef41f9efe4f3fb63ac44ba61df3ade9"
 SRC_URI[cbindgen-0.29.2.sha256sum] =3D "befbfd072a8e81c02f8c507aefce431f=
e5e7d051f83d48a23ffc9b9fe5a11799"
@@ -550,7 +549,7 @@ SRC_URI[crc-catalog-2.4.0.sha256sum] =3D "19d374276b4=
0fb8bbdee95aef7c7fa6b5316ec76
 SRC_URI[crc32fast-1.5.0.sha256sum] =3D "9481c1c90cbf2ac953f07c8d4a58aa39=
45c425b7185c9154d67a65e4230da511"
 SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D "82b8f8f868b36967f960679=
0d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-epoch-0.9.20.sha256sum] =3D "2d6914041f254d6e9176c0194=
1b21115dcfb7089e55135a35411081bd106ef3f"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[crypto-common-0.1.7.sha256sum] =3D "78c8292055d1c1df0cce5d180393=
dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.1.sha256sum] =3D "77727bb15fa921304124b128af12=
5e7e3b968275d1b108b379190264f4423710"
@@ -645,7 +644,7 @@ SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c96=
3f2ddae06a2efc7e9f3591312473c
 SRC_URI[lddtree-0.5.0.sha256sum] =3D "39f71c5bd42adf4ee8e6b24da58c1f00a2=
817d27f618b169399f5adbf9e74492"
 SRC_URI[leb128fmt-0.1.0.sha256sum] =3D "09edd9e8b54e49e587e4f6295a7d29c3=
ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libbz2-rs-sys-0.2.3.sha256sum] =3D "b3a6a8c165077efc8f3a971534c5=
0ea6a1a18b329ef4a66e897a7e3a1494565f"
-SRC_URI[libc-0.2.185.sha256sum] =3D "52ff2c0fe9bc6cb6b14a0592c2ff4fa9ceb=
83eea9db979b0487cd054946a2b8f"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dcc=
dc6d17f656fb07896ee72867612f2"
 SRC_URI[libmimalloc-sys-0.1.46.sha256sum] =3D "bc89deee4af0429081d2a518c=
0431ae068222a5a262a3bc6ff4d8535ec2e02fe"
 SRC_URI[libredox-0.1.16.sha256sum] =3D "e02f3bb43d335493c96bf3fd3a321600=
bf6bd07ed34bc64118e9293bdffea46c"
 SRC_URI[linux-keyutils-0.2.5.sha256sum] =3D "83270a18e9f90d0707c41e9f35e=
fada77b64c0e6f3f1810e71c8368a864d5590"
@@ -660,7 +659,7 @@ SRC_URI[lzxd-0.2.6.sha256sum] =3D "7b29dffab797218e12=
e4df08ef5d15ab9efca2504038b1b
 SRC_URI[mailparse-0.16.1.sha256sum] =3D "60819a97ddcb831a5614eb3b0174f36=
20e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] =3D "d1525a2a28c7f4fa0fc98bb91ae755d1e=
2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd20=
5e060fb3ce5b979b8ed8e59ff3f79"
-SRC_URI[memmap2-0.9.10.sha256sum] =3D "714098028fe011992e1c3962653c96b2d=
578c4b4bce9036e15ff220319b1e0e3"
+SRC_URI[memmap2-0.9.11.sha256sum] =3D "d1219ed1b7f229ee7104d281dd01d6802=
fe28bb6e95d292942c4daacdeb798c0"
 SRC_URI[memo-map-0.3.3.sha256sum] =3D "38d1115007560874e373613744c6fba37=
4c17688327a71c1476d1a5954cc857b"
 SRC_URI[mimalloc-0.1.49.sha256sum] =3D "aca3c01a711f395b4257b81674c0e90e=
8dd1f1e62c4b7db45f684cc7a4fcb18a"
 SRC_URI[mime-0.3.17.sha256sum] =3D "6877bb514081ee2a7ff5ef9de3281f14a4dd=
4bceac4c09388074a6b5df8a139a"
@@ -769,7 +768,7 @@ SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd=
32cbbd37198a4a91436180c5bb472
 SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c39=
83b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab=
66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] =3D "18d26a20a969b9e3fd=
f2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.149.sha256sum] =3D "83fc039473c5595ace860d8c4fafa=
220ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[serde_json-1.0.151.sha256sum] =3D "c841b55ecdae098c80dcae9cf767f=
6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-0.6.9.sha256sum] =3D "bf41e0cfaf7226dca15e8197172c=
295a782857fcb97fad1808a166870dee75a3"
 SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879511e06e8999a8a235d8=
48113e942c9124f211511b16466ee2995f26"
 SRC_URI[serial_test-3.4.0.sha256sum] =3D "911bd979bf1070a3f3aa7b691a3b3e=
9968f339ceeec89e08c280a8a22207a32f"
@@ -931,7 +930,7 @@ SRC_URI[wit-parser-0.244.0.sha256sum] =3D "ecc8ac4bc1=
dc3381b7f59c34f00b67e18f910c2
 SRC_URI[writeable-0.6.3.sha256sum] =3D "1ffae5123b2d3fc086436f8834ae3ab0=
53a283cfac8fe0a0b8eaae044768a4c4"
 SRC_URI[xattr-1.6.1.sha256sum] =3D "32e45ad4206f6d2479085147f02bc2ef834a=
c85886624a23575ae137c8aa8156"
 SRC_URI[xml-rs-0.8.28.sha256sum] =3D "3ae8337f8a065cfc972643663ea4279e04=
e7256de865aa66fe25cec5fb912d3f"
-SRC_URI[xwin-0.9.0.sha256sum] =3D "c337699251ad0c38cf87ee63944de38c2201d=
017cfbb768e5a3897ae835aacc7"
+SRC_URI[xwin-0.10.0.sha256sum] =3D "e3ae2ef8d627ac8d97b3aeb67e4b71152015=
4edca5cc80fbec551415c7b671ef"
 SRC_URI[xz2-0.1.7.sha256sum] =3D "388c44dc09d76f1536602ead6d325eb532f5c1=
22f17782bd57fb47baeeb767e2"
 SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa=
3e30101319d168b781ed6529b049"
 SRC_URI[yoke-0.8.2.sha256sum] =3D "abe8c5fda708d9ca3df187cae8bfb9ceda00d=
d96231bed36e445a1a48e66f9ca"
@@ -942,7 +941,6 @@ SRC_URI[zeroize-1.8.2.sha256sum] =3D "b97154e67e32c85=
465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.4.sha256sum] =3D "0f9152d31db0792fa83f70fb2f83148ef=
fb5c1f5b8c7686c3459e361d9bc20bf"
 SRC_URI[zerovec-0.11.6.sha256sum] =3D "90f911cbc359ab6af17377d242225f4d7=
5119aec87ea711a880987b18cd7b239"
 SRC_URI[zerovec-derive-0.11.3.sha256sum] =3D "625dc425cab0dca6dc3c331950=
6e6593dcb08a9f387ea3b284dbd52a92c40555"
-SRC_URI[zip-7.2.0.sha256sum] =3D "c42e33efc22a0650c311c2ef19115ce232583a=
bbe80850bc8b66509ebef02de0"
 SRC_URI[zip-8.5.1.sha256sum] =3D "dcab981e19633ebcf0b001ddd37dd802996098=
bc1864f90b7c5d970ce76c1d59"
 SRC_URI[zlib-rs-0.6.3.sha256sum] =3D "3be3d40e40a133f9c916ee3f9f4fa2d9d6=
3435b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff89263=
9231befc6a1b58d29fff4c2cabaa"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb b/met=
a/recipes-devtools/python/python3-maturin_1.15.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.14.1.bb
rename to meta/recipes-devtools/python/python3-maturin_1.15.0.bb
index 854822d3c0ba..8ab27b667604 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2eb779966696f47=
3ee8540542 \
                     file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5=
c0797"
=20
-SRC_URI[sha256sum] =3D "9d6577a62cd08e0ceba7a0db06fb098e0c9b1b3429bad747=
a4f3a18215a1b3df"
+SRC_URI[sha256sum] =3D "94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408=
b38761263954228a"
=20
 S =3D "${UNPACKDIR}/maturin-${PV}"
=20

--=20
2.47.3


