Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444A9C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 22:40:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1234.1717540842719785715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 15:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ULakno4I;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-702555eb23bso3010412b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717540842; x=1718145642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz6O8zBIuYApv9m47ePnQSsxEEGn8YNglquaffDjbSE=;
        b=ULakno4IvDqq+PuNtCtlEYaXs771SQvHNqbNDUKpoHxmf4FxX0hjzUTWU1pTyEoxk7
         WI7KDVFLhpIAy9ePeMbtP5ZtRqvyoOUM/gaY0uvElq8HdNKVrDBJbai8ONz+1l66/fnm
         cojqtmko+dYypXD8xm1XtkK5jjJ/xctfHsTNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717540842; x=1718145642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz6O8zBIuYApv9m47ePnQSsxEEGn8YNglquaffDjbSE=;
        b=COSzs9qzU76WGhOxrVXtMaJ+IDgBoBAvE5quVtCDW8qGwzqpaa0ZXBrqfqBe5liaxu
         fGVzD7gLf8ToBYWhSWSIfsKRJKYZxKWMCp/ItKItwYgw6YMDMSRGgWLXMh/9ohlOD81z
         o++ySxDuZksArCgu4Opis6sCXbFHEl/E5tpwQ05P6NFe+fxnUuRuhMCdtH6G1lxYs8Hq
         E45bE/lCHEm1wkQtnlc7EN7v3B+3QQf87LnTDJOeFrsVBbW2i4V8NNnjc8amCxOoQ+O8
         hyM8/WzkWmvWT0dk5lZy633qvvZbz/S/P+KBsI9f59UX1z/+bgQkE6UKcKwAPs3ItA+V
         bZGg==
X-Gm-Message-State: AOJu0YxCaO74/8w+0cVAeflwPnduFkmC4zSAUbTorkYXd9ysx2jwusED
	cf3IgKPER2FByU0blaMfLjwgDlzeqtnwiVw+D4lvjYocc5OXTdM04rzS8AU2KhiUj7u3q6ATlVo
	N1iM=
X-Google-Smtp-Source: AGHT+IEWqVO2PgT64iqtSFheXGr6rZDHgHTUk0zPquqiPxqtPMl3D3FEqwLf5pOKji9ISwOTpLpWZg==
X-Received: by 2002:a05:6a21:998f:b0:1b2:afc4:ff71 with SMTP id adf61e73a8af0-1b2b6b08f37mr1285051637.0.1717540841511;
        Tue, 04 Jun 2024 15:40:41 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:c044:4ad9:9718:452d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806d18ecsm34967a91.52.2024.06.04.15.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 15:40:40 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-maturin: upgrade 1.5.1 -> 1.6.0
Date: Tue,  4 Jun 2024 15:40:17 -0700
Message-ID: <20240604224016.1815550-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 22:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200348

From: Tim Orling <tim.orling@konsulko.com>

* Refresh python3-maturin-crates.inc

1.6.0 - 2024-06-04
* Detect compiling from Linux gnu to Linux musl as cross compiling in #2010
* Add musllinux support to generate-ci in #2011
* Add uv support to develop command in #2015
* Add support for AIX target in #2030
* Remove rust-cpython support in #2044
* Add a global -v option in #2080
* Detect target based on interpreter for pep517 build-wheel in #2088
* Use base executable when possible in PEP 517 build in #2094

https://github.com/pyo3/maturin/compare/v1.5.1...v1.6.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with oe-selftest -r recipetool.RecipetoolCreateTests.test_recipetool_create_python3_pep517_maturin

 .../python/python3-maturin-crates.inc         | 54 ++++++++++++++++---
 ...urin_1.5.1.bb => python3-maturin_1.6.0.bb} |  2 +-
 2 files changed, 47 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.5.1.bb => python3-maturin_1.6.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index ba207458ef9..dff1a166b22 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -26,11 +26,11 @@ SRC_URI += " \
     crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
     crate://crates.io/cab/0.4.1 \
     crate://crates.io/camino/1.1.6 \
-    crate://crates.io/cargo-config2/0.1.19 \
-    crate://crates.io/cargo-options/0.7.2 \
+    crate://crates.io/cargo-config2/0.1.24 \
+    crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.6 \
     crate://crates.io/cargo-xwin/0.16.4 \
-    crate://crates.io/cargo-zigbuild/0.18.3 \
+    crate://crates.io/cargo-zigbuild/0.18.4 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cbindgen/0.26.0 \
     crate://crates.io/cc/1.0.88 \
@@ -69,6 +69,7 @@ SRC_URI += " \
     crate://crates.io/dirs-sys/0.4.1 \
     crate://crates.io/dissimilar/1.0.7 \
     crate://crates.io/dunce/1.0.4 \
+    crate://crates.io/dyn-clone/1.0.17 \
     crate://crates.io/either/1.9.0 \
     crate://crates.io/encode_unicode/0.3.6 \
     crate://crates.io/encoding_rs/0.8.33 \
@@ -84,6 +85,16 @@ SRC_URI += " \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/fs-err/2.11.0 \
+    crate://crates.io/futures/0.3.30 \
+    crate://crates.io/futures-channel/0.3.30 \
+    crate://crates.io/futures-core/0.3.30 \
+    crate://crates.io/futures-executor/0.3.30 \
+    crate://crates.io/futures-io/0.3.30 \
+    crate://crates.io/futures-macro/0.3.30 \
+    crate://crates.io/futures-sink/0.3.30 \
+    crate://crates.io/futures-task/0.3.30 \
+    crate://crates.io/futures-timer/3.0.3 \
+    crate://crates.io/futures-util/0.3.30 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.12 \
     crate://crates.io/glob/0.3.1 \
@@ -148,6 +159,7 @@ SRC_URI += " \
     crate://crates.io/pep508_rs/0.4.2 \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/pin-project-lite/0.2.13 \
+    crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.29 \
     crate://crates.io/plain/0.2.3 \
     crate://crates.io/platform-info/2.0.2 \
@@ -174,11 +186,14 @@ SRC_URI += " \
     crate://crates.io/regex-automata/0.4.5 \
     crate://crates.io/regex-syntax/0.6.29 \
     crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/relative-path/1.9.2 \
     crate://crates.io/rfc2047-decoder/0.2.2 \
     crate://crates.io/ring/0.17.7 \
+    crate://crates.io/rstest/0.18.2 \
+    crate://crates.io/rstest_macros/0.18.2 \
     crate://crates.io/rustc_version/0.4.0 \
     crate://crates.io/rustix/0.38.32 \
-    crate://crates.io/rustls/0.22.2 \
+    crate://crates.io/rustls/0.22.4 \
     crate://crates.io/rustls-pemfile/2.1.0 \
     crate://crates.io/rustls-pki-types/1.3.1 \
     crate://crates.io/rustls-webpki/0.102.1 \
@@ -186,6 +201,8 @@ SRC_URI += " \
     crate://crates.io/ryu/1.0.16 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schannel/0.1.23 \
+    crate://crates.io/schemars/0.8.16 \
+    crate://crates.io/schemars_derive/0.8.16 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/scroll/0.12.0 \
     crate://crates.io/scroll_derive/0.12.0 \
@@ -194,6 +211,7 @@ SRC_URI += " \
     crate://crates.io/semver/1.0.22 \
     crate://crates.io/serde/1.0.197 \
     crate://crates.io/serde_derive/1.0.197 \
+    crate://crates.io/serde_derive_internals/0.26.0 \
     crate://crates.io/serde_json/1.0.114 \
     crate://crates.io/serde_spanned/0.6.5 \
     crate://crates.io/sha2/0.10.8 \
@@ -201,6 +219,7 @@ SRC_URI += " \
     crate://crates.io/shell-words/1.1.0 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/similar/2.4.0 \
+    crate://crates.io/slab/0.4.9 \
     crate://crates.io/smallvec/1.13.1 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/snapbox/0.5.7 \
@@ -321,11 +340,11 @@ SRC_URI[bzip2-0.4.4.sha256sum] = "bdb116a6ef3f6c3698828873ad02c3014b3c85cadb8849
 SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] = "736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc"
 SRC_URI[cab-0.4.1.sha256sum] = "ae6b4de23c7d39c0631fd3cc952d87951c86c75a13812d7247cb7a896e7b3551"
 SRC_URI[camino-1.1.6.sha256sum] = "c59e92b5a388f549b863a7bea62612c09f24c8393560709a54558a9abdfb3b9c"
-SRC_URI[cargo-config2-0.1.19.sha256sum] = "3a7fb69d74d76f8c254afd1c0e76aca40c305707b28aebe3c5a0fd2ee62aeeeb"
-SRC_URI[cargo-options-0.7.2.sha256sum] = "cad71bf996c8e5b9d28ef3472d7ee41f277edf4e38cd597f51ad0438d05d76ea"
+SRC_URI[cargo-config2-0.1.24.sha256sum] = "88d9bdc858a15454c2d0a5138d8dcf4bcabc06fde679abdea8330393fbc0ef05"
+SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.6.sha256sum] = "ceed8ef69d8518a5dda55c07425450b58a4e1946f4951eab6d7191ee86c2443d"
 SRC_URI[cargo-xwin-0.16.4.sha256sum] = "5e6c3dd7f20fdd197397532ac882e918cfe1d56f262a97ded7460a50e031e06b"
-SRC_URI[cargo-zigbuild-0.18.3.sha256sum] = "cb76e6ab558f9138291c7e1fa954ffd58e060712eab13f97a317da712218ca24"
+SRC_URI[cargo-zigbuild-0.18.4.sha256sum] = "65004153e67ac23be88a8e244304a872d727b2aa08654dcabfbecd1fdea4a488"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cbindgen-0.26.0.sha256sum] = "da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49"
 SRC_URI[cc-1.0.88.sha256sum] = "02f341c093d19155a6e41631ce5971aac4e9a868262212153124c15fa22d1cdc"
@@ -364,6 +383,7 @@ SRC_URI[dirs-5.0.1.sha256sum] = "44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5
 SRC_URI[dirs-sys-0.4.1.sha256sum] = "520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c"
 SRC_URI[dissimilar-1.0.7.sha256sum] = "86e3bdc80eee6e16b2b6b0f87fbc98c04bee3455e35174c0de1a125d0688c632"
 SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
+SRC_URI[dyn-clone-1.0.17.sha256sum] = "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
 SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
 SRC_URI[encoding_rs-0.8.33.sha256sum] = "7268b386296a025e474d5140678f75d6de9493ae55a5d709eeb9dd08149945e1"
@@ -379,6 +399,16 @@ SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[fs-err-2.11.0.sha256sum] = "88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41"
+SRC_URI[futures-0.3.30.sha256sum] = "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
+SRC_URI[futures-channel-0.3.30.sha256sum] = "eac8f7d7865dcb88bd4373ab671c8cf4508703796caa2b1985a9ca867b3fcb78"
+SRC_URI[futures-core-0.3.30.sha256sum] = "dfc6580bb841c5a68e9ef15c77ccc837b40a7504914d52e47b8b0e9bbda25a1d"
+SRC_URI[futures-executor-0.3.30.sha256sum] = "a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
+SRC_URI[futures-io-0.3.30.sha256sum] = "a44623e20b9681a318efdd71c299b6b222ed6f231972bfe2f224ebad6311f0c1"
+SRC_URI[futures-macro-0.3.30.sha256sum] = "87750cf4b7a4c0625b1529e4c543c2182106e4dedc60a2a6455e00d212c489ac"
+SRC_URI[futures-sink-0.3.30.sha256sum] = "9fb8e00e87438d937621c1c6269e53f536c14d3fbd6a042bb24879e57d474fb5"
+SRC_URI[futures-task-0.3.30.sha256sum] = "38d84fa142264698cdce1a9f9172cf383a0c82de1bddcf3092901442c4097004"
+SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
+SRC_URI[futures-util-0.3.30.sha256sum] = "3d6401deb83407ab3da39eba7e33987a73c3df0c82b4bb5813ee871c19c41d48"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
@@ -443,6 +473,7 @@ SRC_URI[pep440_rs-0.5.0.sha256sum] = "15efd4d885c29126cc93e12af3087896e2518bd5ca
 SRC_URI[pep508_rs-0.4.2.sha256sum] = "1455babf8edd3eedcdfcb39700e455a4bb189e71b4f1fa0eacc9b244cc5a55e6"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[pin-project-lite-0.2.13.sha256sum] = "8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58"
+SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
 SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
 SRC_URI[platform-info-2.0.2.sha256sum] = "d6259c4860e53bf665016f1b2f46a8859cadfa717581dc9d597ae4069de6300f"
@@ -469,11 +500,14 @@ SRC_URI[regex-automata-0.1.10.sha256sum] = "6c230d73fb8d8c1b9c0b3135c5142a8acee3
 SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
 SRC_URI[regex-syntax-0.6.29.sha256sum] = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
 SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
+SRC_URI[relative-path-1.9.2.sha256sum] = "e898588f33fdd5b9420719948f9f2a32c922a246964576f71ba7f24f80610fbc"
 SRC_URI[rfc2047-decoder-0.2.2.sha256sum] = "61fc4b4e52897c3e30b12b7e9b04461215b647fbe66f6def60dd8edbce14ec2e"
 SRC_URI[ring-0.17.7.sha256sum] = "688c63d65483050968b2a8937f7995f443e27041a0f7700aa59b0822aedebb74"
+SRC_URI[rstest-0.18.2.sha256sum] = "97eeab2f3c0a199bc4be135c36c924b6590b88c377d416494288c14f2db30199"
+SRC_URI[rstest_macros-0.18.2.sha256sum] = "d428f8247852f894ee1be110b375111b586d4fa431f6c46e64ba5a0dcccbe605"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
 SRC_URI[rustix-0.38.32.sha256sum] = "65e04861e65f21776e67888bfbea442b3642beaa0138fdb1dd7a84a52dffdb89"
-SRC_URI[rustls-0.22.2.sha256sum] = "e87c9956bd9807afa1f77e0f7594af32566e830e088a5576d27c5b6f30f49d41"
+SRC_URI[rustls-0.22.4.sha256sum] = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
 SRC_URI[rustls-pemfile-2.1.0.sha256sum] = "3c333bb734fcdedcea57de1602543590f545f127dc8b533324318fd492c5c70b"
 SRC_URI[rustls-pki-types-1.3.1.sha256sum] = "5ede67b28608b4c60685c7d54122d4400d90f62b40caee7700e700380a390fa8"
 SRC_URI[rustls-webpki-0.102.1.sha256sum] = "ef4ca26037c909dedb327b48c3327d0ba91d3dd3c4e05dad328f210ffb68e95b"
@@ -481,6 +515,8 @@ SRC_URI[rustversion-1.0.14.sha256sum] = "7ffc183a10b4478d04cbbbfc96d0873219d962d
 SRC_URI[ryu-1.0.16.sha256sum] = "f98d2aa92eebf49b69786be48e4477826b256916e84a57ff2a4f21923b48eb4c"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schannel-0.1.23.sha256sum] = "fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534"
+SRC_URI[schemars-0.8.16.sha256sum] = "45a28f4c49489add4ce10783f7911893516f15afe45d015608d41faca6bc4d29"
+SRC_URI[schemars_derive-0.8.16.sha256sum] = "c767fd6fa65d9ccf9cf026122c1b555f2ef9a4f0cea69da4d7dbc3e258d30967"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[scroll-0.12.0.sha256sum] = "6ab8598aa408498679922eff7fa985c25d58a90771bd6be794434c5277eab1a6"
 SRC_URI[scroll_derive-0.12.0.sha256sum] = "7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141a85313b1cb932"
@@ -489,6 +525,7 @@ SRC_URI[security-framework-sys-2.9.1.sha256sum] = "e932934257d3b408ed8f30db49d85
 SRC_URI[semver-1.0.22.sha256sum] = "92d43fe69e652f3df9bdc2b85b2854a0825b86e4fb76bc44d945137d053639ca"
 SRC_URI[serde-1.0.197.sha256sum] = "3fb1c873e1b9b056a4dc4c0c198b24c3ffa059243875552b2bd0933b1aee4ce2"
 SRC_URI[serde_derive-1.0.197.sha256sum] = "7eb0b34b42edc17f6b7cac84a52a1c5f0e1bb2227e997ca9011ea3dd34e8610b"
+SRC_URI[serde_derive_internals-0.26.0.sha256sum] = "85bf8229e7920a9f636479437026331ce11aa132b4dde37d121944a44d6e5f3c"
 SRC_URI[serde_json-1.0.114.sha256sum] = "c5f09b1bd632ef549eaa9f60a1f8de742bdbc698e6cee2095fc84dde5f549ae0"
 SRC_URI[serde_spanned-0.6.5.sha256sum] = "eb3622f419d1296904700073ea6cc23ad690adbd66f13ea683df73298736f0c1"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
@@ -496,6 +533,7 @@ SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e9
 SRC_URI[shell-words-1.1.0.sha256sum] = "24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[similar-2.4.0.sha256sum] = "32fea41aca09ee824cc9724996433064c89f7777e60762749a4170a14abbfa21"
+SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
 SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[snapbox-0.5.7.sha256sum] = "4a99efa20de5053229642a477436cdb39828c7651c614622eb4888f9688523e6"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.5.1.bb b/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.5.1.bb
rename to meta/recipes-devtools/python/python3-maturin_1.6.0.bb
index 96b046febaa..1d62671bb90 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "3dd834ece80edb866af18cbd4635e0ecac40139c726428d5f1849ae154b26dca"
+SRC_URI[sha256sum] = "b955025c24c8babc808db49e0ff90db8b4b1320dcc16b14eb26132841737230d"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.45.2


