Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233EED47CBD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1440.1768526750779691020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CdzfUvp2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UX/9tp5d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019bc468a1d3-72a17797-069e-4a47-b146-1bad8d24313a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B4vspebblli7AOLS7lqcFgZKMR9+I2lOabP4tfyjbXQ=;
	b=CdzfUvp2EartBEAwwsCiHB8w01GF70I9HBR0PQ34UCLWL+C4mOonBjKtsvArdBmw
	VYvFSwJYkt01V75Pj5DbP3x/zxfreIHzGHcIWZ1ooLfKhlwiA5TcBqmDCsRcgrzzlAa
	o1z+i9hXax1xkxKaRyEaaLcz9ehdgoE/2zoceT7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B4vspebblli7AOLS7lqcFgZKMR9+I2lOabP4tfyjbXQ=;
	b=UX/9tp5dhCLnmuB1vbtcjv2nTmXq368cajc4HRhn3zcflJ/7WIaUX0fBCRZc7zwj
	aMjtVHKdAl6xnPKIB7evDQcpK9kfK/Aqn+CpR634i297rAQmRkn5SoSi9oyKYvdn9EQ
	HOrV8BkV4QIr4kBWImVxzeHb1yTyECDW6psnr6dM=
Content-Type: multipart/mixed; boundary="===============2390711913578222769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] python3-uv-build: upgrading to 0.9.25 SUCCEEDED
Message-ID: <0101019bc468a1d3-72a17797-069e-4a47-b146-1bad8d24313a-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229476

--===============2390711913578222769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.9.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.9.18-0.9.25.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From deb313afc3131ecdebb580e8ec78bca837c9d602 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 22:05:24 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.9.18 -> 0.9.25

---
 .../python/python3-uv-build-crates.inc        | 94 +++++++++----------
 ...d_0.9.18.bb => python3-uv-build_0.9.25.bb} |  2 +-
 2 files changed, 47 insertions(+), 49 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.9.18.bb => python3-uv-build_0.9.25.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 6aadd77746..ee209cc4ae 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -25,7 +25,7 @@ SRC_URI += " \
     crate://crates.io/assert_fs/1.1.3 \
     crate://crates.io/astral-pubgrub/0.3.3 \
     crate://crates.io/astral-reqwest-middleware/0.4.2 \
-    crate://crates.io/astral-reqwest-retry/0.7.0 \
+    crate://crates.io/astral-reqwest-retry/0.8.0 \
     crate://crates.io/astral-tl/0.7.11 \
     crate://crates.io/astral-tokio-tar/0.5.6 \
     crate://crates.io/astral-version-ranges/0.1.3 \
@@ -205,9 +205,9 @@ SRC_URI += " \
     crate://crates.io/http-content-range/0.2.3 \
     crate://crates.io/httparse/1.10.1 \
     crate://crates.io/httpdate/1.0.3 \
-    crate://crates.io/hyper/1.7.0 \
+    crate://crates.io/hyper/1.8.1 \
     crate://crates.io/hyper-rustls/0.27.7 \
-    crate://crates.io/hyper-util/0.1.16 \
+    crate://crates.io/hyper-util/0.1.19 \
     crate://crates.io/icu_collections/2.0.0 \
     crate://crates.io/icu_locale_core/2.0.0 \
     crate://crates.io/icu_normalizer/2.0.0 \
@@ -224,7 +224,7 @@ SRC_URI += " \
     crate://crates.io/indicatif/0.18.3 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/insta/1.43.2 \
+    crate://crates.io/insta/1.45.0 \
     crate://crates.io/io-uring/0.7.9 \
     crate://crates.io/ipnet/2.11.0 \
     crate://crates.io/iri-string/0.7.8 \
@@ -248,12 +248,11 @@ SRC_URI += " \
     crate://crates.io/kurbo/0.8.3 \
     crate://crates.io/kurbo/0.9.5 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.175 \
+    crate://crates.io/libc/0.2.178 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
     crate://crates.io/libredox/0.1.6 \
     crate://crates.io/libz-rs-sys/0.5.1 \
-    crate://crates.io/linux-raw-sys/0.4.15 \
-    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/linux-raw-sys/0.11.0 \
     crate://crates.io/litemap/0.8.0 \
     crate://crates.io/lock_api/0.4.13 \
     crate://crates.io/log/0.4.27 \
@@ -274,7 +273,7 @@ SRC_URI += " \
     crate://crates.io/mime/0.3.17 \
     crate://crates.io/mime_guess/2.0.5 \
     crate://crates.io/miniz_oxide/0.8.9 \
-    crate://crates.io/mio/1.0.4 \
+    crate://crates.io/mio/1.1.0 \
     crate://crates.io/miow/0.6.1 \
     crate://crates.io/munge/0.4.5 \
     crate://crates.io/munge_macro/0.4.5 \
@@ -339,8 +338,8 @@ SRC_URI += " \
     crate://crates.io/priority-queue/2.5.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/procfs/0.17.0 \
-    crate://crates.io/procfs-core/0.17.0 \
+    crate://crates.io/procfs/0.18.0 \
+    crate://crates.io/procfs-core/0.18.0 \
     crate://crates.io/ptr_meta/0.3.0 \
     crate://crates.io/ptr_meta_derive/0.3.0 \
     crate://crates.io/purl/0.1.6 \
@@ -367,7 +366,7 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.28 \
-    crate://crates.io/regex/1.11.2 \
+    crate://crates.io/regex/1.12.2 \
     crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rend/0.5.2 \
@@ -379,7 +378,7 @@ SRC_URI += " \
     crate://crates.io/reqsign-http-send-reqwest/2.0.1 \
     crate://crates.io/reqwest/0.12.22 \
     crate://crates.io/resvg/0.29.0 \
-    crate://crates.io/retry-policies/0.4.0 \
+    crate://crates.io/retry-policies/0.5.1 \
     crate://crates.io/rgb/0.8.52 \
     crate://crates.io/ring/0.17.14 \
     crate://crates.io/rkyv/0.8.12 \
@@ -393,8 +392,7 @@ SRC_URI += " \
     crate://crates.io/rust-netrc/0.1.2 \
     crate://crates.io/rustc-demangle/0.1.25 \
     crate://crates.io/rustc-hash/2.1.1 \
-    crate://crates.io/rustix/0.38.44 \
-    crate://crates.io/rustix/1.0.8 \
+    crate://crates.io/rustix/1.1.3 \
     crate://crates.io/rustls/0.23.35 \
     crate://crates.io/rustls-native-certs/0.8.2 \
     crate://crates.io/rustls-pki-types/1.12.0 \
@@ -421,9 +419,9 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.145 \
+    crate://crates.io/serde_json/1.0.147 \
     crate://crates.io/serde_repr/0.1.20 \
-    crate://crates.io/serde_spanned/1.0.3 \
+    crate://crates.io/serde_spanned/1.0.4 \
     crate://crates.io/serde_urlencoded/0.7.1 \
     crate://crates.io/serde_yaml/0.9.34+deprecated \
     crate://crates.io/sha1/0.10.6 \
@@ -444,7 +442,7 @@ SRC_URI += " \
     crate://crates.io/socket2/0.5.10 \
     crate://crates.io/socket2/0.6.0 \
     crate://crates.io/spdx/0.10.9 \
-    crate://crates.io/spdx/0.13.2 \
+    crate://crates.io/spdx/0.13.3 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/statrs/0.18.0 \
@@ -470,7 +468,7 @@ SRC_URI += " \
     crate://crates.io/tar/0.4.44 \
     crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/temp-env/0.3.6 \
-    crate://crates.io/tempfile/3.20.0 \
+    crate://crates.io/tempfile/3.24.0 \
     crate://crates.io/terminal_size/0.4.2 \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/test-case/3.3.1 \
@@ -501,13 +499,13 @@ SRC_URI += " \
     crate://crates.io/tokio-rustls/0.26.2 \
     crate://crates.io/tokio-stream/0.1.17 \
     crate://crates.io/tokio-util/0.7.17 \
-    crate://crates.io/toml/0.9.8 \
+    crate://crates.io/toml/0.9.10+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.6.11 \
-    crate://crates.io/toml_datetime/0.7.3 \
+    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
     crate://crates.io/toml_edit/0.22.27 \
-    crate://crates.io/toml_edit/0.23.7 \
-    crate://crates.io/toml_parser/1.0.4 \
-    crate://crates.io/toml_writer/1.0.4 \
+    crate://crates.io/toml_edit/0.24.0+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
     crate://crates.io/tower/0.5.2 \
     crate://crates.io/tower-http/0.6.6 \
     crate://crates.io/tower-layer/0.3.3 \
@@ -550,7 +548,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.17.0 \
+    crate://crates.io/uuid/1.19.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wait-timeout/0.2.1 \
@@ -644,6 +642,7 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.11.1 \
     crate://crates.io/zip/2.4.2 \
     crate://crates.io/zlib-rs/0.5.1 \
+    crate://crates.io/zmij/0.1.11 \
     crate://crates.io/zopfli/0.8.2 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
@@ -676,7 +675,7 @@ SRC_URI[assert_cmd-2.0.17.sha256sum] = "2bd389a4b2970a01282ee455294913c0a43724da
 SRC_URI[assert_fs-1.1.3.sha256sum] = "a652f6cb1f516886fcfee5e7a5c078b9ade62cfcb889524efe5a64d682dd27a9"
 SRC_URI[astral-pubgrub-0.3.3.sha256sum] = "d6cb15b4f5096a3a1b41fdc2736a1c33d87c78f34d3c1ec2b669e766edadd559"
 SRC_URI[astral-reqwest-middleware-0.4.2.sha256sum] = "638d02e24aeb92f9537897cd1ff82e2bc98fd9ac9575a503e27bb07cdf64d4d7"
-SRC_URI[astral-reqwest-retry-0.7.0.sha256sum] = "cb7549bd00f62f73f2e7e76f3f77ccdabb31873f4f02f758ed88ad739d522867"
+SRC_URI[astral-reqwest-retry-0.8.0.sha256sum] = "78ab210f6cdf8fd3254d47e5ee27ce60ed34a428ff71b4ae9477b1c84b49498c"
 SRC_URI[astral-tl-0.7.11.sha256sum] = "d90933ffb0f97e2fc2e0de21da9d3f20597b804012d199843a6fe7c2810d28f3"
 SRC_URI[astral-tokio-tar-0.5.6.sha256sum] = "ec179a06c1769b1e42e1e2cbe74c7dcdb3d6383c838454d063eaac5bbb7ebbe5"
 SRC_URI[astral-version-ranges-0.1.3.sha256sum] = "e7adc2308a566fab9de02bc0e05d18c5a21cb0e793684e4f64c8eb956969b074"
@@ -856,9 +855,9 @@ SRC_URI[http-body-util-0.1.3.sha256sum] = "b021d93e26becf5dc7e1b75b1bed1fd93124b
 SRC_URI[http-content-range-0.2.3.sha256sum] = "63f67baaf67a9ae8fae78ecee69294d552b764dbcd6f8735d0a9c9be20ab0c82"
 SRC_URI[httparse-1.10.1.sha256sum] = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87"
 SRC_URI[httpdate-1.0.3.sha256sum] = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
-SRC_URI[hyper-1.7.0.sha256sum] = "eb3aa54a13a0dfe7fbe3a59e0c76093041720fdc77b110cc0fc260fafb4dc51e"
+SRC_URI[hyper-1.8.1.sha256sum] = "2ab2d4f250c3d7b1c9fcdff1cece94ea4e2dfbec68614f7b87cb205f24ca9d11"
 SRC_URI[hyper-rustls-0.27.7.sha256sum] = "e3c93eb611681b207e1fe55d5a71ecf91572ec8a6705cdb6857f7d8d5242cf58"
-SRC_URI[hyper-util-0.1.16.sha256sum] = "8d9b05277c7e8da2c93a568989bb6207bef0112e8d17df7a6eda4a3cf143bc5e"
+SRC_URI[hyper-util-0.1.19.sha256sum] = "727805d60e7938b76b826a6ef209eb70eaa1812794f9424d4a4e2d740662df5f"
 SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
 SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
 SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
@@ -875,7 +874,7 @@ SRC_URI[indexmap-2.12.1.sha256sum] = "0ad4bb2b565bca0645f4d68c5c9af97fba094e9791
 SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[insta-1.43.2.sha256sum] = "46fdb647ebde000f43b5b53f773c30cf9b0cb4300453208713fa38b2c70935a0"
+SRC_URI[insta-1.45.0.sha256sum] = "b76866be74d68b1595eb8060cb9191dca9c021db2316558e52ddc5d55d41b66c"
 SRC_URI[io-uring-0.7.9.sha256sum] = "d93587f37623a1a17d94ef2bc9ada592f5465fe7732084ab7beefabe5c77c0c4"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
 SRC_URI[iri-string-0.7.8.sha256sum] = "dbc5ebe9c3a1a7a5127f920a418f7585e9e758e911d0466ed004f393b0e380b2"
@@ -899,12 +898,11 @@ SRC_URI[junction-1.2.0.sha256sum] = "72bbdfd737a243da3dfc1f99ee8d6e166480f17ab4a
 SRC_URI[kurbo-0.8.3.sha256sum] = "7a53776d271cfb873b17c618af0298445c88afc52837f3e948fa3fafd131f449"
 SRC_URI[kurbo-0.9.5.sha256sum] = "bd85a5776cd9500c2e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
+SRC_URI[libc-0.2.178.sha256sum] = "37c93d8daa9d8a012fd8ab92f088405fb202ea0b6ab73ee2482ae66af4f42091"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
 SRC_URI[libredox-0.1.6.sha256sum] = "4488594b9328dee448adb906d8b126d9b7deb7cf5c22161ee591610bb1be83c0"
 SRC_URI[libz-rs-sys-0.5.1.sha256sum] = "172a788537a2221661b480fee8dc5f96c580eb34fa88764d3205dc356c7e4221"
-SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
-SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
 SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
@@ -925,7 +923,7 @@ SRC_URI[mimalloc-0.1.48.sha256sum] = "e1ee66a4b64c74f4ef288bcbb9192ad9c3feaad751
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
 SRC_URI[mime_guess-2.0.5.sha256sum] = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
-SRC_URI[mio-1.0.4.sha256sum] = "78bed444cc8a2160f01cbcf811ef18cac863ad68ae8ca62092e8db51d51c761c"
+SRC_URI[mio-1.1.0.sha256sum] = "69d83b0086dc8ecf3ce9ae2874b2d1290252e2a30720bea58a5c6639b0092873"
 SRC_URI[miow-0.6.1.sha256sum] = "536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08"
 SRC_URI[munge-0.4.5.sha256sum] = "9cce144fab80fbb74ec5b89d1ca9d41ddf6b644ab7e986f7d3ed0aab31625cb1"
 SRC_URI[munge_macro-0.4.5.sha256sum] = "574af9cd5b9971cbfdf535d6a8d533778481b241c447826d976101e0149392a1"
@@ -990,8 +988,8 @@ SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839
 SRC_URI[priority-queue-2.5.0.sha256sum] = "5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] = "edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[procfs-0.17.0.sha256sum] = "cc5b72d8145275d844d4b5f6d4e1eef00c8cd889edb6035c21675d1bb1f45c9f"
-SRC_URI[procfs-core-0.17.0.sha256sum] = "239df02d8349b06fc07398a3a1697b06418223b1c7725085e801e7c0fc6a12ec"
+SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
+SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
 SRC_URI[ptr_meta-0.3.0.sha256sum] = "fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28199e48daf8c8fc937ea90"
 SRC_URI[ptr_meta_derive-0.3.0.sha256sum] = "ca414edb151b4c8d125c12566ab0d74dc9cdba36fb80eb7b848c15f495fd32d1"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
@@ -1018,7 +1016,7 @@ SRC_URI[redox_users-0.5.0.sha256sum] = "dd6f9d3d47bdd2ad6945c5015a226ec6155d0bcd
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.28.sha256sum] = "23bbed272e39c47a095a5242218a67412a220006842558b03fe2935e8f3d7b92"
-SRC_URI[regex-1.11.2.sha256sum] = "23d7fd106d8c02486a8d64e778353d1cffe08ce79ac2e82f540c86d0facf6912"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
 SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rend-0.5.2.sha256sum] = "a35e8a6bf28cd121053a66aa2e6a2e3eaffad4a60012179f0e864aa5ffeff215"
@@ -1030,7 +1028,7 @@ SRC_URI[reqsign-file-read-tokio-2.0.1.sha256sum] = "669ea66036266a9ac371d2e63cc7
 SRC_URI[reqsign-http-send-reqwest-2.0.1.sha256sum] = "46186bce769674f9200ad01af6f2ca42de3e819ddc002fff1edae135bfb6cd9c"
 SRC_URI[reqwest-0.12.22.sha256sum] = "cbc931937e6ca3a06e3b6c0aa7841849b160a90351d6ab467a8b9b9959767531"
 SRC_URI[resvg-0.29.0.sha256sum] = "76888219c0881e22b0ceab06fddcfe83163cd81642bd60c7842387f9c968a72e"
-SRC_URI[retry-policies-0.4.0.sha256sum] = "5875471e6cab2871bc150ecb8c727db5113c9338cc3354dc5ee3425b6aa40a1c"
+SRC_URI[retry-policies-0.5.1.sha256sum] = "46a4bd6027df676bcb752d3724db0ea3c0c5fc1dd0376fec51ac7dcaf9cc69be"
 SRC_URI[rgb-0.8.52.sha256sum] = "0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce"
 SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
 SRC_URI[rkyv-0.8.12.sha256sum] = "35a640b26f007713818e9a9b65d34da1cf58538207b052916a83d80e43f3ffa4"
@@ -1044,8 +1042,7 @@ SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5
 SRC_URI[rust-netrc-0.1.2.sha256sum] = "7e98097f62769f92dbf95fb51f71c0a68ec18a4ee2e70e0d3e4f47ac005d63e9"
 SRC_URI[rustc-demangle-0.1.25.sha256sum] = "989e6739f80c4ad5b13e0fd7fe89531180375b18520cc8c82080e4dc4035b84f"
 SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
-SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
-SRC_URI[rustix-1.0.8.sha256sum] = "11181fbabf243db407ef8df94a6ce0b2f9a733bd8be4ad02b4eda9602296cac8"
+SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
 SRC_URI[rustls-0.23.35.sha256sum] = "533f54bc6a7d4f647e46ad909549eda97bf5afc1585190ef692b4286b198bd8f"
 SRC_URI[rustls-native-certs-0.8.2.sha256sum] = "9980d917ebb0c0536119ba501e90834767bffc3d60641457fd84a1f3fd337923"
 SRC_URI[rustls-pki-types-1.12.0.sha256sum] = "229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79"
@@ -1072,9 +1069,9 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[serde_json-1.0.147.sha256sum] = "6af14725505314343e673e9ecb7cd7e8a36aa9791eb936235a3567cc31447ae4"
 SRC_URI[serde_repr-0.1.20.sha256sum] = "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
-SRC_URI[serde_spanned-1.0.3.sha256sum] = "e24345aa0fe688594e73770a5f6d1b216508b4f93484c0026d521acd30134392"
+SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
 SRC_URI[serde_urlencoded-0.7.1.sha256sum] = "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
 SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] = "6a8b1a1a2ebf674015cc02edccce75287f1a0130d394307b36743c2f5d504b47"
 SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
@@ -1095,7 +1092,7 @@ SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acb
 SRC_URI[socket2-0.5.10.sha256sum] = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
 SRC_URI[socket2-0.6.0.sha256sum] = "233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807"
 SRC_URI[spdx-0.10.9.sha256sum] = "c3e17e880bafaeb362a7b751ec46bdc5b61445a188f80e0606e68167cd540fa3"
-SRC_URI[spdx-0.13.2.sha256sum] = "35107b1c818f4e9cb9e6c4444ca560ba03b4ee1288dcecc6d7830c2023a7609e"
+SRC_URI[spdx-0.13.3.sha256sum] = "afd765179d12cdd06192e02b1d8c6b0d46bd26de9bf16ce04c881428ca2cc7ed"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[statrs-0.18.0.sha256sum] = "2a3fe7c28c6512e766b0874335db33c94ad7b8f9054228ae1c2abd47ce7d335e"
@@ -1121,7 +1118,7 @@ SRC_URI[tagu-0.1.6.sha256sum] = "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2
 SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
-SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
+SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
 SRC_URI[terminal_size-0.4.2.sha256sum] = "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
@@ -1152,13 +1149,13 @@ SRC_URI[tokio-macros-2.5.0.sha256sum] = "6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e6
 SRC_URI[tokio-rustls-0.26.2.sha256sum] = "8e727b36a1a0e8b74c376ac2211e40c2c8af09fb4013c60d910495810f008e9b"
 SRC_URI[tokio-stream-0.1.17.sha256sum] = "eca58d7bba4a75707817a2c44174253f9236b2d5fbd055602e9d5c07c139a047"
 SRC_URI[tokio-util-0.7.17.sha256sum] = "2efa149fe76073d6e8fd97ef4f4eca7b67f599660115591483572e406e165594"
-SRC_URI[toml-0.9.8.sha256sum] = "f0dc8b1fb61449e27716ec0e1bdf0f6b8f3e8f6b05391e8497b8b6d7804ea6d8"
+SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
 SRC_URI[toml_datetime-0.6.11.sha256sum] = "22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
-SRC_URI[toml_datetime-0.7.3.sha256sum] = "f2cdb639ebbc97961c51720f858597f7f24c4fc295327923af55b74c3c724533"
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
 SRC_URI[toml_edit-0.22.27.sha256sum] = "41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a"
-SRC_URI[toml_edit-0.23.7.sha256sum] = "6485ef6d0d9b5d0ec17244ff7eb05310113c3f316f2d14200d4de56b3cb98f8d"
-SRC_URI[toml_parser-1.0.4.sha256sum] = "c0cbe268d35bdb4bb5a56a2de88d0ad0eb70af5384a99d648cd4b3d04039800e"
-SRC_URI[toml_writer-1.0.4.sha256sum] = "df8b2b54733674ad286d16267dcfc7a71ed5c776e4ac7aa3c3e2561f7c637bf2"
+SRC_URI[toml_edit-0.24.0+spec-1.1.0.sha256sum] = "8c740b185920170a6d9191122cafef7010bd6270a3824594bff6784c04d7f09e"
+SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] = "a3198b4b0a8e11f09dd03e133c0280504d0801269e9afa46362ffde1cbeebf44"
+SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] = "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
 SRC_URI[tower-0.5.2.sha256sum] = "d039ad9159c98b70ecfd540b2573b97f7f52c3e8d9f8ad57a24b916a536975f9"
 SRC_URI[tower-http-0.6.6.sha256sum] = "adc82fd73de2a9722ac5da747f12383d2bfdb93591ee6c58486e0097890f05f2"
 SRC_URI[tower-layer-0.3.3.sha256sum] = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
@@ -1201,7 +1198,7 @@ SRC_URI[usvg-text-layout-0.29.0.sha256sum] = "195386e01bc35f860db024de275a76e7a3
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.17.0.sha256sum] = "3cf4199d1e5d15ddd86a694e4d0dffa9c323ce759fea589f00fef9d81cc1931d"
+SRC_URI[uuid-1.19.0.sha256sum] = "e2e054861b4bd027cd373e18e8d8d8e6548085000e41290d95ce0c373a654b4a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
@@ -1295,6 +1292,7 @@ SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350
 SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
 SRC_URI[zip-2.4.2.sha256sum] = "fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50"
 SRC_URI[zlib-rs-0.5.1.sha256sum] = "626bd9fa9734751fc50d6060752170984d7053f5a39061f524cda68023d4db8a"
+SRC_URI[zmij-0.1.11.sha256sum] = "3273ed2c1f89f63ec74ab75efe20159d0058e30831e6e9f1502cd5bf2fd8b178"
 SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.9.18.bb b/meta/recipes-devtools/python/python3-uv-build_0.9.25.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.9.18.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.9.25.bb
index aa14349197..e46bc972aa 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.9.18.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.9.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ae3458ebc3c2ae69cca621a1e6f1e280a7cb6c729f829b325fef4a65a55efa9d"
+SRC_URI[sha256sum] = "0683591211daf8d60c95da01536f7afb8324f8382e9d14b1580d33d9bee40cf4"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2390711913578222769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.9.18-0.9.25.patch"

RnJvbSBkZWIzMTNhZmMzMTMxZWNkZWJiNTgwZThlYzc4YmNhODM3YzlkNjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjI6MDU6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuOS4xOCAtPiAwLjkuMjUKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgOTQgKysrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjkuMTguYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjkuMjUuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjku
MTguYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjkuMjUuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCA2YWFkZDc3NzQ2Li5lZTIwOWNjNGFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAtMjUs
NyArMjUsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fzc2VydF9m
cy8xLjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXB1YmdydWIvMC4zLjMgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC1yZXF3ZXN0LW1pZGRsZXdhcmUvMC40LjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC1yZXF3ZXN0LXJldHJ5LzAuNy4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtcmVxd2VzdC1yZXRyeS8wLjguMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXN0cmFsLXRsLzAuNy4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0
cmFsLXRva2lvLXRhci8wLjUuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXZlcnNp
b24tcmFuZ2VzLzAuMS4zIFwKQEAgLTIwNSw5ICsyMDUsOSBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2h0dHAtY29udGVudC1yYW5nZS8wLjIuMyBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaHR0cGFyc2UvMS4xMC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9odHRw
ZGF0ZS8xLjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaHlwZXIvMS43LjAgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2h5cGVyLzEuOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oeXBl
ci1ydXN0bHMvMC4yNy43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9oeXBlci11dGlsLzAuMS4x
NiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaHlwZXItdXRpbC8wLjEuMTkgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2ljdV9jb2xsZWN0aW9ucy8yLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vaWN1X2xvY2FsZV9jb3JlLzIuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3Vfbm9y
bWFsaXplci8yLjAuMCBcCkBAIC0yMjQsNyArMjI0LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pbmRpY2F0aWYvMC4xOC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pbmRvYy8yLjAuNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5vdXQvMC4xLjQgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2luc3RhLzEuNDMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aW5zdGEvMS40NS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pby11cmluZy8wLjcuOSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXBuZXQvMi4xMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pcmktc3RyaW5nLzAuNy44IFwKQEAgLTI0OCwxMiArMjQ4LDExIEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8va3VyYm8vMC44LjMgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2t1cmJvLzAuOS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTc1IFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9saWJjLzAuMi4xNzggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYm1pbWFsbG9j
LXN5cy8wLjEuNDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYnJlZG94LzAuMS42IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9saWJ6LXJzLXN5cy8wLjUuMSBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGludXgtcmF3LXN5cy8wLjQuMTUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4
LXJhdy1zeXMvMC45LjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LXJhdy1zeXMvMC4x
MS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saXRlbWFwLzAuOC4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9sb2NrX2FwaS8wLjQuMTMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvZy8w
LjQuMjcgXApAQCAtMjc0LDcgKzI3Myw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbWltZS8wLjMuMTcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbWVfZ3Vlc3Mv
Mi4wLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOC45IFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9taW8vMS4wLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pby8x
LjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWlvdy8wLjYuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbXVuZ2UvMC40LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL211bmdlX21hY3Jv
LzAuNC41IFwKQEAgLTMzOSw4ICszMzgsOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3ByaW9yaXR5LXF1ZXVlLzIuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9w
cm9jLW1hY3JvLWNyYXRlLzMuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3Jv
Mi8xLjAuMTAzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jZnMvMC4xNy4wIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9wcm9jZnMtY29yZS8wLjE3LjAgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Byb2Nmcy8wLjE4LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2Nmcy1jb3JlLzAu
MTguMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGEvMC4zLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B0cl9tZXRhX2Rlcml2ZS8wLjMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHVybC8wLjEuNiBcCkBAIC0zNjcsNyArMzY2LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9yZWYtY2FzdC8xLjAuMjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3JlZi1jYXN0LWltcGwvMS4wLjI1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWZsaW5rLWNv
cHkvMC4xLjI4IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC8xLjExLjIgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3JlZ2V4LzEuMTIuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVn
ZXgtYXV0b21hdGEvMC40LjEzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1zeW50YXgv
MC44LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlbmQvMC41LjIgXApAQCAtMzc5LDcgKzM3
OCw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVxc2lnbi1odHRw
LXNlbmQtcmVxd2VzdC8yLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVxd2VzdC8wLjEy
LjIyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZXN2Zy8wLjI5LjAgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JldHJ5LXBvbGljaWVzLzAuNC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9y
ZXRyeS1wb2xpY2llcy8wLjUuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmdiLzAuOC41MiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmluZy8wLjE3LjE0IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ya3l2LzAuOC4xMiBcCkBAIC0zOTMsOCArMzkyLDcgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0LW5ldHJjLzAuMS4yIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ydXN0Yy1kZW1hbmdsZS8wLjEuMjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rj
LWhhc2gvMi4xLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC8wLjM4LjQ0IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgvMS4wLjggXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3J1c3RpeC8xLjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGxzLzAuMjMuMzUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rscy1uYXRpdmUtY2VydHMvMC44LjIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3J1c3Rscy1wa2ktdHlwZXMvMS4xMi4wIFwKQEAgLTQyMSw5ICs0MTks
OSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2NvcmUvMS4w
LjIyOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlLzEuMC4yMjggXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2Rlcml2ZV9pbnRlcm5hbHMvMC4yOS4xIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9zZXJkZV9qc29uLzEuMC4xNDUgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NlcmRlX2pzb24vMS4wLjE0NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfcmVw
ci8wLjEuMjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX3NwYW5uZWQvMS4wLjMgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX3NwYW5uZWQvMS4wLjQgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3NlcmRlX3VybGVuY29kZWQvMC43LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3NlcmRlX3lhbWwvMC45LjM0K2RlcHJlY2F0ZWQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3No
YTEvMC4xMC42IFwKQEAgLTQ0NCw3ICs0NDIsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NvY2tldDIvMC41LjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zb2Nr
ZXQyLzAuNi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zcGR4LzAuMTAuOSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc3BkeC8wLjEzLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgv
MC4xMy4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0YXRpY19hc3NlcnRpb25zLzEuMS4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9zdGF0cnMvMC4xOC4wIFwKQEAgLTQ3MCw3ICs0NjgsNyBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci8wLjQuNDQgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTMuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdGVtcC1lbnYvMC4zLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXBmaWxlLzMuMjAu
MCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZpbGUvMy4yNC4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90ZXJtaW5hbF9zaXplLzAuNC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90
ZXJtdHJlZS8wLjUuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVzdC1jYXNlLzMuMy4xIFwK
QEAgLTUwMSwxMyArNDk5LDEzIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9raW8tcnVzdGxzLzAuMjYuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tc3Ry
ZWFtLzAuMS4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tdXRpbC8wLjcuMTcgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWwvMC45LjggXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RvbWwvMC45LjEwK3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZGF0
ZXRpbWUvMC42LjExIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2RhdGV0aW1lLzAuNy4z
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2RhdGV0aW1lLzAuNy41K3NwZWMtMS4xLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZWRpdC8wLjIyLjI3IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby90b21sX2VkaXQvMC4yMy43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b21s
X3BhcnNlci8xLjAuNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF93cml0ZXIvMS4wLjQg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZWRpdC8wLjI0LjArc3BlYy0xLjEuMCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9wYXJzZXIvMS4wLjYrc3BlYy0xLjEuMCBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF93cml0ZXIvMS4wLjYrc3BlYy0xLjEuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdG93ZXIvMC41LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rvd2Vy
LWh0dHAvMC42LjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rvd2VyLWxheWVyLzAuMy4zIFwK
QEAgLTU1MCw3ICs1NDgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3V0Zjgtd2lkdGgvMC4xLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjhfaXRlci8xLjAu
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOHBhcnNlLzAuMi4yIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby91dWlkLzEuMTcuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjE5
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZhbHVhYmxlLzAuMS4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
YWl0LXRpbWVvdXQvMC4yLjEgXApAQCAtNjQ0LDYgKzY0Miw3IEBAIFNSQ19VUkkgKz0gIiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb3ZlYy1kZXJpdmUvMC4xMS4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby96aXAvMi40LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3psaWItcnMvMC41
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ptaWovMC4xLjExIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby96b3BmbGkvMC44LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3pzdGQvMC4xMy4z
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96c3RkLXNhZmUvNy4yLjQgXApAQCAtNjc2LDcgKzY3
NSw3IEBAIFNSQ19VUklbYXNzZXJ0X2NtZC0yLjAuMTcuc2hhMjU2c3VtXSA9ICIyYmQzODlhNGIy
OTcwYTAxMjgyZWU0NTUyOTQ5MTNjMGE0MzcyNGRhCiBTUkNfVVJJW2Fzc2VydF9mcy0xLjEuMy5z
aGEyNTZzdW1dID0gImE2NTJmNmNiMWY1MTY4ODZmY2ZlZTVlN2E1YzA3OGI5YWRlNjJjZmNiODg5
NTI0ZWZlNWE2NGQ2ODJkZDI3YTkiCiBTUkNfVVJJW2FzdHJhbC1wdWJncnViLTAuMy4zLnNoYTI1
NnN1bV0gPSAiZDZjYjE1YjRmNTA5NmEzYTFiNDFmZGMyNzM2YTFjMzNkODdjNzhmMzRkM2MxZWMy
YjY2OWU3NjZlZGFkZDU1OSIKIFNSQ19VUklbYXN0cmFsLXJlcXdlc3QtbWlkZGxld2FyZS0wLjQu
Mi5zaGEyNTZzdW1dID0gIjYzOGQwMmUyNGFlYjkyZjk1Mzc4OTdjZDFmZjgyZTJiYzk4ZmQ5YWM5
NTc1YTUwM2UyN2JiMDdjZGY2NGQ0ZDciCi1TUkNfVVJJW2FzdHJhbC1yZXF3ZXN0LXJldHJ5LTAu
Ny4wLnNoYTI1NnN1bV0gPSAiY2I3NTQ5YmQwMGY2MmY3M2YyZTdlNzZmM2Y3N2NjZGFiYjMxODcz
ZjRmMDJmNzU4ZWQ4OGFkNzM5ZDUyMjg2NyIKK1NSQ19VUklbYXN0cmFsLXJlcXdlc3QtcmV0cnkt
MC44LjAuc2hhMjU2c3VtXSA9ICI3OGFiMjEwZjZjZGY4ZmQzMjU0ZDQ3ZTVlZTI3Y2U2MGVkMzRh
NDI4ZmY3MWI0YWU5NDc3YjFjODRiNDk0OThjIgogU1JDX1VSSVthc3RyYWwtdGwtMC43LjExLnNo
YTI1NnN1bV0gPSAiZDkwOTMzZmZiMGY5N2UyZmMyZTBkZTIxZGE5ZDNmMjA1OTdiODA0MDEyZDE5
OTg0M2E2ZmU3YzI4MTBkMjhmMyIKIFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjUuNi5zaGEy
NTZzdW1dID0gImVjMTc5YTA2YzE3NjliMWU0MmUxZTJjYmU3NGM3ZGNkYjNkNjM4M2M4Mzg0NTRk
MDYzZWFhYzViYmI3ZWJiZTUiCiBTUkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjEuMy5z
aGEyNTZzdW1dID0gImU3YWRjMjMwOGE1NjZmYWI5ZGUwMmJjMGUwNWQxOGM1YTIxY2IwZTc5MzY4
NGU0ZjY0YzhlYjk1Njk2OWIwNzQiCkBAIC04NTYsOSArODU1LDkgQEAgU1JDX1VSSVtodHRwLWJv
ZHktdXRpbC0wLjEuMy5zaGEyNTZzdW1dID0gImIwMjFkOTNlMjZiZWNmNWRjN2UxYjc1YjFiZWQx
ZmQ5MzEyNGIKIFNSQ19VUklbaHR0cC1jb250ZW50LXJhbmdlLTAuMi4zLnNoYTI1NnN1bV0gPSAi
NjNmNjdiYWFmNjdhOWFlOGZhZTc4ZWNlZTY5Mjk0ZDU1MmI3NjRkYmNkNmY4NzM1ZDBhOWM5YmUy
MGFiMGM4MiIKIFNSQ19VUklbaHR0cGFyc2UtMS4xMC4xLnNoYTI1NnN1bV0gPSAiNmRiZjNkZTc5
ZTUxZjNkNTg2YWI0Y2I5ZDVjM2UyYzE0YWEyOGVkMjNkMTgwY2Y4OWI0ZGYwNDU0YTY5Y2M4NyIK
IFNSQ19VUklbaHR0cGRhdGUtMS4wLjMuc2hhMjU2c3VtXSA9ICJkZjNiNDY0MDJhOWQ1YWRiNGM4
NmEwY2Y0NjNmNDJlMTk5OTRlM2VlODkxMTAxYjE4NDFmMzBhNTQ1Y2I0OWE5IgotU1JDX1VSSVto
eXBlci0xLjcuMC5zaGEyNTZzdW1dID0gImViM2FhNTRhMTNhMGRmZTdmYmUzYTU5ZTBjNzYwOTMw
NDE3MjBmZGM3N2IxMTBjYzBmYzI2MGZhZmI0ZGM1MWUiCitTUkNfVVJJW2h5cGVyLTEuOC4xLnNo
YTI1NnN1bV0gPSAiMmFiMmQ0ZjI1MGMzZDdiMWM5ZmNkZmYxY2VjZTk0ZWE0ZTJkZmJlYzY4NjE0
ZjdiODdjYjIwNWYyNGNhOWQxMSIKIFNSQ19VUklbaHlwZXItcnVzdGxzLTAuMjcuNy5zaGEyNTZz
dW1dID0gImUzYzkzZWI2MTE2ODFiMjA3ZTFmZTU1ZDVhNzFlY2Y5MTU3MmVjOGE2NzA1Y2RiNjg1
N2Y3ZDhkNTI0MmNmNTgiCi1TUkNfVVJJW2h5cGVyLXV0aWwtMC4xLjE2LnNoYTI1NnN1bV0gPSAi
OGQ5YjA1Mjc3YzdlOGRhMmM5M2E1Njg5ODliYjYyMDdiZWYwMTEyZThkMTdkZjdhNmVkYTRhM2Nm
MTQzYmM1ZSIKK1NSQ19VUklbaHlwZXItdXRpbC0wLjEuMTkuc2hhMjU2c3VtXSA9ICI3Mjc4MDVk
NjBlNzkzOGI3NmI4MjZhNmVmMjA5ZWI3MGVhYTE4MTI3OTRmOTQyNGQ0YTRlMmQ3NDA2NjJkZjVm
IgogU1JDX1VSSVtpY3VfY29sbGVjdGlvbnMtMi4wLjAuc2hhMjU2c3VtXSA9ICIyMDAwNzJmNWQw
ZTM2MTQ1NTZmOTRhOTkzMGQ1ZGMzZTA2NjJhNjUyODIzOTA0YzNhNzVkYzNiMGFmN2ZlZTQ3Igog
U1JDX1VSSVtpY3VfbG9jYWxlX2NvcmUtMi4wLjAuc2hhMjU2c3VtXSA9ICIwY2RlMjcwMGNjYWVk
Mzg3MjA3OWE2NWZiMWE3OGY2YzBhMzZjOTE1NzBmMjg3NTVkZGE2N2JjOGY3ZDlmMDBhIgogU1JD
X1VSSVtpY3Vfbm9ybWFsaXplci0yLjAuMC5zaGEyNTZzdW1dID0gIjQzNjg4MGU4ZTE4ZGY0ZDdi
YmMwNmQ1ODQzMjMyOWQ2NDU4Y2M4NDUzMWY3YWM1ZjAyNGU5M2RlYWRiMzc5NzkiCkBAIC04NzUs
NyArODc0LDcgQEAgU1JDX1VSSVtpbmRleG1hcC0yLjEyLjEuc2hhMjU2c3VtXSA9ICIwYWQ0YmIy
YjU2NWJjYTA2NDVmNGQ2OGM1YzlhZjk3ZmJhMDk0ZTk3OTEKIFNSQ19VUklbaW5kaWNhdGlmLTAu
MTguMy5zaGEyNTZzdW1dID0gIjkzNzVlMTEyZTRiNDYzZWMxYjFjNmMwMTE5NTM1NDVjNjVhMzAx
NjRmYmFiNWI1ODFkZjMyYjNhYmYwZGNiODgiCiBTUkNfVVJJW2luZG9jLTIuMC43LnNoYTI1NnN1
bV0gPSAiNzljZjVjOTNmOTMyMjhjZjhlZmIzYmEzNjI1MzVmYjExMTk5YWM1NDhhMDljZTExN2M5
YjFhZGMzMDMwZDcwNiIKIFNSQ19VUklbaW5vdXQtMC4xLjQuc2hhMjU2c3VtXSA9ICI4NzlmMTBl
NjNjMjA2MjllY2FiYmI2NGE4MDEwMzE5NzM4YzY2YTVjZDBjMjliMDJkNjNkMjcyYjAzNzUxZDAx
IgotU1JDX1VSSVtpbnN0YS0xLjQzLjIuc2hhMjU2c3VtXSA9ICI0NmZkYjY0N2ViZGUwMDBmNDNi
NWI1M2Y3NzNjMzBjZjliMGNiNDMwMDQ1MzIwODcxM2ZhMzhiMmM3MDkzNWEwIgorU1JDX1VSSVtp
bnN0YS0xLjQ1LjAuc2hhMjU2c3VtXSA9ICJiNzY4NjZiZTc0ZDY4YjE1OTVlYjgwNjBjYjkxOTFk
Y2E5YzAyMWRiMjMxNjU1OGU1MmRkYzVkNTVkNDFiNjZjIgogU1JDX1VSSVtpby11cmluZy0wLjcu
OS5zaGEyNTZzdW1dID0gImQ5MzU4N2YzNzYyM2ExYTE3ZDk0ZWYyYmM5YWRhNTkyZjU0NjVmZTc3
MzIwODRhYjdiZWVmYWJlNWM3N2MwYzQiCiBTUkNfVVJJW2lwbmV0LTIuMTEuMC5zaGEyNTZzdW1d
ID0gIjQ2OWZiMGI5Y2VmYTU3ZTNlZjMxMjc1ZWU3Y2FjYjc4ZjJmZGNhNDRlNDc2NTQ5MTg4NGEy
YjExOWQ0ZWIxMzAiCiBTUkNfVVJJW2lyaS1zdHJpbmctMC43Ljguc2hhMjU2c3VtXSA9ICJkYmM1
ZWJlOWMzYTFhN2E1MTI3ZjkyMGE0MThmNzU4NWU5ZTc1OGU5MTFkMDQ2NmVkMDA0ZjM5M2IwZTM4
MGIyIgpAQCAtODk5LDEyICs4OTgsMTEgQEAgU1JDX1VSSVtqdW5jdGlvbi0xLjIuMC5zaGEyNTZz
dW1dID0gIjcyYmJkZmQ3MzdhMjQzZGEzZGZjMWY5OWVlOGQ2ZTE2NjQ4MGYxN2FiNGEKIFNSQ19V
Uklba3VyYm8tMC44LjMuc2hhMjU2c3VtXSA9ICI3YTUzNzc2ZDI3MWNmYjg3M2IxN2M2MThhZjAy
OTg0NDVjODhhZmM1MjgzN2YzZTk0OGZhM2ZhZmQxMzFmNDQ5IgogU1JDX1VSSVtrdXJiby0wLjku
NS5zaGEyNTZzdW1dID0gImJkODVhNTc3NmNkOTUwMGMyZTIwNTljOGM3NmMzYjAxNTI4NTY2Yjdm
Y2JhZjgwOThiNTVhMzNmYzI5ODg0OWIiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1
NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVl
MWYyOTgwNjgzMTZlNjZmZSIKLVNSQ19VUklbbGliYy0wLjIuMTc1LnNoYTI1NnN1bV0gPSAiNmE4
MmFlNDkzZTU5OGJhYWVhNTIwOTgwNWM0OWJiZjJlYTdkZTk1NmQ1MGQ3ZGEwZGExMTY0ZjljNmQy
ODU0MyIKK1NSQ19VUklbbGliYy0wLjIuMTc4LnNoYTI1NnN1bV0gPSAiMzdjOTNkOGRhYTlkOGEw
MTJmZDhhYjkyZjA4ODQwNWZiMjAyZWEwYjZhYjczZWUyNDgyYWU2NmFmNGY0MjA5MSIKIFNSQ19V
UklbbGlibWltYWxsb2Mtc3lzLTAuMS40NC5zaGEyNTZzdW1dID0gIjY2N2Y0ZmVjMjBmMjlkZmM2
YmM3MzU3YzU4MmQ5MTc5NmMxNjlhZDdlMmZjZTcwOTQ2OGFlZmViMmMwOTk4NzAiCiBTUkNfVVJJ
W2xpYnJlZG94LTAuMS42LnNoYTI1NnN1bV0gPSAiNDQ4ODU5NGI5MzI4ZGVlNDQ4YWRiOTA2ZDhi
MTI2ZDliN2RlYjdjZjVjMjIxNjFlZTU5MTYxMGJiMWJlODNjMCIKIFNSQ19VUklbbGliei1ycy1z
eXMtMC41LjEuc2hhMjU2c3VtXSA9ICIxNzJhNzg4NTM3YTIyMjE2NjFiNDgwZmVlOGRjNWY5NmM1
ODBlYjM0ZmE4ODc2NGQzMjA1ZGMzNTZjN2U0MjIxIgotU1JDX1VSSVtsaW51eC1yYXctc3lzLTAu
NC4xNS5zaGEyNTZzdW1dID0gImQyNmM1MmRiZDMyZGNjZjJkMTBjYWM3NzI1ZjhlYWU1Mjk2ODg1
ZmI1NzAzYjI2MWY3ZDBhMDczOWVjODA3YWIiCi1TUkNfVVJJW2xpbnV4LXJhdy1zeXMtMC45LjQu
c2hhMjU2c3VtXSA9ICJjZDk0NTg2NGYwN2ZlOWY1MzcxYTI3YWQ3YjUyYTE3MmI0YjQ5OTk5OWYx
ZDk3NTc0YzlmYTY4MzczOTM3ZTEyIgorU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTEuMC5zaGEy
NTZzdW1dID0gImRmMWQzYzNiNTNkYTY0Y2Y1NzYwNDgyMjczYTk4ZTU3NWM2NTFhNjdlZWM3Zjc3
ZGY5NmI1YjY0MmRlOGYwMzkiCiBTUkNfVVJJW2xpdGVtYXAtMC44LjAuc2hhMjU2c3VtXSA9ICIy
NDFlYWVmNWZkMTJjODg3MDVhMDFmYzEwNjZjNDhjNGIzNmUwZGQ0Mzc3ZGNkYzdlYzM5NDJjZWE3
YTY5OTU2IgogU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTMuc2hhMjU2c3VtXSA9ICI5NjkzNjUwN2Yx
NTM2MDViZGRmY2RhMDY4ZGQ4MDQ3OTZjODQzMjRlZDI1MTA4MDllNWIyYTYyNGM4MWRhNzY1Igog
U1JDX1VSSVtsb2ctMC40LjI3LnNoYTI1NnN1bV0gPSAiMTNkYzJkZjM1MWUzMjAyNzgzYTFmZTBk
NDQzNzVmNzI5NWZmYjQwNDkyNjdiMGYzMDE4MzQ2ZGMxMjJhMWQ5NCIKQEAgLTkyNSw3ICs5MjMs
NyBAQCBTUkNfVVJJW21pbWFsbG9jLTAuMS40OC5zaGEyNTZzdW1dID0gImUxZWU2NmE0YjY0Yzc0
ZjRlZjI4OGJjYmI5MTkyYWQ5YzNmZWFhZDc1MQogU1JDX1VSSVttaW1lLTAuMy4xNy5zaGEyNTZz
dW1dID0gIjY4NzdiYjUxNDA4MWVlMmE3ZmY1ZWY5ZGUzMjgxZjE0YTRkZDRiY2VhYzRjMDkzODgw
NzRhNmI1ZGY4YTEzOWEiCiBTUkNfVVJJW21pbWVfZ3Vlc3MtMi4wLjUuc2hhMjU2c3VtXSA9ICJm
N2M0NGY4ZTY3MmMwMGZlNTMwOGZhMjM1ZjgyMWNiNDE5ODQxNGUxYzc3OTM1YzFhYjY5NDhkM2Zk
Nzg1NTBlIgogU1JDX1VSSVttaW5pel9veGlkZS0wLjguOS5zaGEyNTZzdW1dID0gIjFmYTc2YTJj
ODZmNzA0YmRiMjIyZDY2OTY1ZmIzZDYzMjY5Y2UzODUxOGI4M2NiMDU3NWZjYTg1NWViYjYzMTYi
Ci1TUkNfVVJJW21pby0xLjAuNC5zaGEyNTZzdW1dID0gIjc4YmVkNDQ0Y2M4YTIxNjBmMDFjYmNm
ODExZWYxOGNhYzg2M2FkNjhhZThjYTYyMDkyZThkYjUxZDUxYzc2MWMiCitTUkNfVVJJW21pby0x
LjEuMC5zaGEyNTZzdW1dID0gIjY5ZDgzYjAwODZkYzhlY2YzY2U5YWUyODc0YjJkMTI5MDI1MmUy
YTMwNzIwYmVhNThhNWM2NjM5YjAwOTI4NzMiCiBTUkNfVVJJW21pb3ctMC42LjEuc2hhMjU2c3Vt
XSA9ICI1MzZiZmFkMzdhMzA5ZDYyMDY5NDg1MjQ4ZWVhYmExZThkOTg1M2FhZjk1MWNhYWVhZWQw
NTg1YTk1MzQ2ZjA4IgogU1JDX1VSSVttdW5nZS0wLjQuNS5zaGEyNTZzdW1dID0gIjljY2UxNDRm
YWI4MGZiYjc0ZWM1Yjg5ZDFjYTlkNDFkZGY2YjY0NGFiN2U5ODZmN2QzZWQwYWFiMzE2MjVjYjEi
CiBTUkNfVVJJW211bmdlX21hY3JvLTAuNC41LnNoYTI1NnN1bV0gPSAiNTc0YWY5Y2Q1Yjk5NzFj
YmZkZjUzNWQ2YThkNTMzNzc4NDgxYjI0MWM0NDc4MjZkOTc2MTAxZTAxNDkzOTJhMSIKQEAgLTk5
MCw4ICs5ODgsOCBAQCBTUkNfVVJJW3ByZXR0eV9hc3NlcnRpb25zLTEuNC4xLnNoYTI1NnN1bV0g
PSAiM2FlMTMwZTJmMjcxZmJjMmFjM2E0MGZiMWQwNzE4MDgzOQogU1JDX1VSSVtwcmlvcml0eS1x
dWV1ZS0yLjUuMC5zaGEyNTZzdW1dID0gIjU2NzZkNzAzZGRhMTAzY2JiMDM1YjY1M2E5ZjExNDQ4
YzBhNzIxNmM3OTI2YmQzNWZjYjU4NjU0NzVkMGM5NzAiCiBTUkNfVVJJW3Byb2MtbWFjcm8tY3Jh
dGUtMy4zLjAuc2hhMjU2c3VtXSA9ICJlZGNlNTg2OTcxYTRkZmFhMjg5NTBjNmYxOGVkNTVlMDQw
NmMxYWI4OGJiY2UyYzZmNjI5M2E3YWFiYTczZDM1IgogU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAu
MTAzLnNoYTI1NnN1bV0gPSAiNWVlOTViYzRlZjg3YjhkNWJhMzJlOGI3NzE0Y2NjODM0ODY1Mjc2
ZWFiMGFlZDVjOTk1OGQwMGVjNDVmNDllOCIKLVNSQ19VUklbcHJvY2ZzLTAuMTcuMC5zaGEyNTZz
dW1dID0gImNjNWI3MmQ4MTQ1Mjc1ZDg0NGQ0YjVmNmQ0ZTFlZWYwMGM4Y2Q4ODllZGI2MDM1YzIx
Njc1ZDFiYjFmNDVjOWYiCi1TUkNfVVJJW3Byb2Nmcy1jb3JlLTAuMTcuMC5zaGEyNTZzdW1dID0g
IjIzOWRmMDJkODM0OWIwNmZjMDczOThhM2ExNjk3YjA2NDE4MjIzYjFjNzcyNTA4NWU4MDFlN2Mw
ZmM2YTEyZWMiCitTUkNfVVJJW3Byb2Nmcy0wLjE4LjAuc2hhMjU2c3VtXSA9ICIyNTQ4NTM2MGE1
NGQ2ODYxNDM5ZDYwZmFjZWYyNmRlNzEzYjFlMTI2YmYwMTVlYzhmOTgyMzk0NjdhMmI4MmY3Igor
U1JDX1VSSVtwcm9jZnMtY29yZS0wLjE4LjAuc2hhMjU2c3VtXSA9ICJlNjQwMWJmN2I2YWYyMmY3
OGI1NjM2NjVkMTVhMjJlOWFlZjI3Nzc1Yjc5YjE0OWE2NmNhMDIyNDY4YTRlNDA1IgogU1JDX1VS
SVtwdHJfbWV0YS0wLjMuMC5zaGEyNTZzdW1dID0gImZlOWU3NmY2NmQzZjk2MDZmNDRlNDU1OThk
MTU1Y2IxM2VjZjA5ZjRhMjgxOTllNDhkYWY4YzhmYzkzN2VhOTAiCiBTUkNfVVJJW3B0cl9tZXRh
X2Rlcml2ZS0wLjMuMC5zaGEyNTZzdW1dID0gImNhNDE0ZWRiMTUxYjRjOGQxMjVjMTI1NjZhYjBk
NzRkYzljZGJhMzZmYjgwZWI3Yjg0OGMxNWY0OTVmZDMyZDEiCiBTUkNfVVJJW3B1cmwtMC4xLjYu
c2hhMjU2c3VtXSA9ICI2MGViZTQyNjJhZTkxZGRkMjhjODcyMTExMWEwYTZlOWU1ODg2MGUyMTFm
YzkyMTE2YzRiYjg1Yzk4ZmQ5NmFkIgpAQCAtMTAxOCw3ICsxMDE2LDcgQEAgU1JDX1VSSVtyZWRv
eF91c2Vycy0wLjUuMC5zaGEyNTZzdW1dID0gImRkNmY5ZDNkNDdiZGQyYWQ2OTQ1YzUwMTVhMjI2
ZWM2MTU1ZDBiY2QKIFNSQ19VUklbcmVmLWNhc3QtMS4wLjI1LnNoYTI1NnN1bV0gPSAiZjM1NDMw
MGFlNjZmNzZmMWM4NWM1Zjg0NjkzZjBjZTgxZDc0N2UyYzNmMjFhNDVmZWY0OTZkODljOTYwYmY3
ZCIKIFNSQ19VUklbcmVmLWNhc3QtaW1wbC0xLjAuMjUuc2hhMjU2c3VtXSA9ICJiNzE4NjAwNmRj
YjIxOTIwOTkwMDkzZjMwZTNkZWE2M2I3ZDZlOTc3YmYxMjU2YmUyMGMzNTYzYTVkYjA3MGRhIgog
U1JDX1VSSVtyZWZsaW5rLWNvcHktMC4xLjI4LnNoYTI1NnN1bV0gPSAiMjNiYmVkMjcyZTM5YzQ3
YTA5NWE1MjQyMjE4YTY3NDEyYTIyMDAwNjg0MjU1OGIwM2ZlMjkzNWU4ZjNkN2I5MiIKLVNSQ19V
UklbcmVnZXgtMS4xMS4yLnNoYTI1NnN1bV0gPSAiMjNkN2ZkMTA2ZDhjMDI0ODZhOGQ2NGU3Nzgz
NTNkMWNmZmUwOGNlNzlhYzJlODJmNTQwYzg2ZDBmYWNmNjkxMiIKK1NSQ19VUklbcmVnZXgtMS4x
Mi4yLnNoYTI1NnN1bV0gPSAiODQzYmMwMTkxZjc1ZjNlMjI2NTFhZTVmMWU3MjkzOWFiMmY3MmE0
YmMzMGZhODBhMDY2YmQ2NmVkZWZjMjRkNCIKIFNSQ19VUklbcmVnZXgtYXV0b21hdGEtMC40LjEz
LnNoYTI1NnN1bV0gPSAiNTI3NmNhZjI1YWM4NmM4ZDgxMDIyMmIzZGJiOTM4ZTUxMmM1NWM2ODMx
YTEwZjNlNmVkMWM5M2I4NDA0MWYxYyIKIFNSQ19VUklbcmVnZXgtc3ludGF4LTAuOC41LnNoYTI1
NnN1bV0gPSAiMmIxNWM0MzE4NmJlNjdhNGZkNjNiZWU1MGQwMzAzYWZmZmNlZjM4MTQ5MmViZTJj
NWQ4N2YzMjRlMWI4ODE1YyIKIFNSQ19VUklbcmVuZC0wLjUuMi5zaGEyNTZzdW1dID0gImEzNWU4
YTZiZjI4Y2QxMjEwNTNhNjZhYTJlNmEyZTNlYWZmYWQ0YTYwMDEyMTc5ZjBlODY0YWE1ZmZlZmYy
MTUiCkBAIC0xMDMwLDcgKzEwMjgsNyBAQCBTUkNfVVJJW3JlcXNpZ24tZmlsZS1yZWFkLXRva2lv
LTIuMC4xLnNoYTI1NnN1bV0gPSAiNjY5ZWE2NjAzNjI2NmE5YWMzNzFkMmU2M2NjNwogU1JDX1VS
SVtyZXFzaWduLWh0dHAtc2VuZC1yZXF3ZXN0LTIuMC4xLnNoYTI1NnN1bV0gPSAiNDYxODZiY2U3
Njk2NzRmOTIwMGFkMDFhZjZmMmNhNDJkZTNlODE5ZGRjMDAyZmZmMWVkYWUxMzViZmI2Y2Q5YyIK
IFNSQ19VUklbcmVxd2VzdC0wLjEyLjIyLnNoYTI1NnN1bV0gPSAiY2JjOTMxOTM3ZTZjYTNhMDZl
M2I2YzBhYTc4NDE4NDliMTYwYTkwMzUxZDZhYjQ2N2E4YjliOTk1OTc2NzUzMSIKIFNSQ19VUklb
cmVzdmctMC4yOS4wLnNoYTI1NnN1bV0gPSAiNzY4ODgyMTljMDg4MWUyMmIwY2VhYjA2ZmRkY2Zl
ODMxNjNjZDgxNjQyYmQ2MGM3ODQyMzg3ZjljOTY4YTcyZSIKLVNSQ19VUklbcmV0cnktcG9saWNp
ZXMtMC40LjAuc2hhMjU2c3VtXSA9ICI1ODc1NDcxZTZjYWIyODcxYmMxNTBlY2I4YzcyN2RiNTEx
M2M5MzM4Y2MzMzU0ZGM1ZWUzNDI1YjZhYTQwYTFjIgorU1JDX1VSSVtyZXRyeS1wb2xpY2llcy0w
LjUuMS5zaGEyNTZzdW1dID0gIjQ2YTRiZDYwMjdkZjY3NmJjYjc1MmQzNzI0ZGIwZWEzYzBjNWZj
MWRkMDM3NmZlYzUxYWM3ZGNhZjljYzY5YmUiCiBTUkNfVVJJW3JnYi0wLjguNTIuc2hhMjU2c3Vt
XSA9ICIwYzZhODg0ZDI5OTgzNTJiYjRkYWYwMTgzNTg5YWVjODgzZjE2YTZkYTFmNGRkZTg0ZDhl
MmU5YTU0MDlhMWNlIgogU1JDX1VSSVtyaW5nLTAuMTcuMTQuc2hhMjU2c3VtXSA9ICJhNDY4OWU2
YzIyOTRkODFlODhkYzYyNjFjNzY4YjYzYmM0ZmNkYjg1MmJlNmQxMzUyNDk4YjExNGY2MTM4M2I3
IgogU1JDX1VSSVtya3l2LTAuOC4xMi5zaGEyNTZzdW1dID0gIjM1YTY0MGIyNmYwMDc3MTM4MThl
OWE5YjY1ZDM0ZGExY2Y1ODUzODIwN2IwNTI5MTZhODNkODBlNDNmM2ZmYTQiCkBAIC0xMDQ0LDgg
KzEwNDIsNyBAQCBTUkNfVVJJW3J1c3QtaW5pLTAuMjEuMy5zaGEyNTZzdW1dID0gIjc5NmU4ZDJi
NjY5NjM5MmE0M2JlYTU4MTE2YjY2N2ZiNGMyOTcyN2RjNQogU1JDX1VSSVtydXN0LW5ldHJjLTAu
MS4yLnNoYTI1NnN1bV0gPSAiN2U5ODA5N2Y2Mjc2OWY5MmRiZjk1ZmI1MWY3MWMwYTY4ZWMxOGE0
ZWUyZTcwZTBkM2U0ZjQ3YWMwMDVkNjNlOSIKIFNSQ19VUklbcnVzdGMtZGVtYW5nbGUtMC4xLjI1
LnNoYTI1NnN1bV0gPSAiOTg5ZTY3MzlmODBjNGFkNWIxM2UwZmQ3ZmU4OTUzMTE4MDM3NWIxODUy
MGNjOGM4MjA4MGU0ZGM0MDM1Yjg0ZiIKIFNSQ19VUklbcnVzdGMtaGFzaC0yLjEuMS5zaGEyNTZz
dW1dID0gIjM1NzcwM2Q0MTM2NWI0YjI3YzU5MGUzZWQ5MWVhYmIxYjY2M2YwN2M0YzA4NDA5NWU2
MGNiZWQ0MzYyZGZmMGQiCi1TUkNfVVJJW3J1c3RpeC0wLjM4LjQ0LnNoYTI1NnN1bV0gPSAiZmRi
NWJjMWFlMmJhYTU5MTgwMGRmMTZjOWNhNzg2MTliZjY1YzA0ODhiNDFiOTZjY2VjNWQxMTIyMGQ4
YzE1NCIKLVNSQ19VUklbcnVzdGl4LTEuMC44LnNoYTI1NnN1bV0gPSAiMTExODFmYmFiZjI0M2Ri
NDA3ZWY4ZGY5NGE2Y2UwYjJmOWE3MzNiZDhiZTRhZDAyYjRlZGE5NjAyMjk2Y2FjOCIKK1NSQ19V
UklbcnVzdGl4LTEuMS4zLnNoYTI1NnN1bV0gPSAiMTQ2YzllMjQ3Y2NjMTgwYzFmNjE2MTU0MzM4
NjhjOTlmM2RlM2FlMjU2YTMwYTQzYjQ5ZjY3YzJkOTE3MWYzNCIKIFNSQ19VUklbcnVzdGxzLTAu
MjMuMzUuc2hhMjU2c3VtXSA9ICI1MzNmNTRiYzZhN2Q0ZjY0N2U0NmFkOTA5NTQ5ZWRhOTdiZjVh
ZmMxNTg1MTkwZWY2OTJiNDI4NmIxOThiZDhmIgogU1JDX1VSSVtydXN0bHMtbmF0aXZlLWNlcnRz
LTAuOC4yLnNoYTI1NnN1bV0gPSAiOTk4MGQ5MTdlYmIwYzA1MzYxMTliYTUwMWU5MDgzNDc2N2Jm
ZmMzZDYwNjQxNDU3ZmQ4NGExZjNmZDMzNzkyMyIKIFNSQ19VUklbcnVzdGxzLXBraS10eXBlcy0x
LjEyLjAuc2hhMjU2c3VtXSA9ICIyMjlhNGE0YzIyMTAxM2U3ZTFmMWEwNDM2NzhjNWNjMzlmZTUx
NzE0MzdjODhmYjQ3MTUxYTIxZTZmNWI1Yzc5IgpAQCAtMTA3Miw5ICsxMDY5LDkgQEAgU1JDX1VS
SVtzZXJkZS11bnRhZ2dlZC0wLjEuOS5zaGEyNTZzdW1dID0gImY5ZmFmNDhhNGEyZDI2OTNiZTI0
YzYyODlkYmUyNjU1Mjc3NmUKIFNSQ19VUklbc2VyZGVfY29yZS0xLjAuMjI4LnNoYTI1NnN1bV0g
PSAiNDFkMzg1YzdkNGNhNThlNTlmYzczMmFmMjVjMzk4M2I2N2FjODUyYzFhMjUwMDBhZmUxMTc1
ZGU0NThiNjdhZCIKIFNSQ19VUklbc2VyZGVfZGVyaXZlLTEuMC4yMjguc2hhMjU2c3VtXSA9ICJk
NTQwZjIyMGQzMTg3MTczZGEyMjBmODg1YWI2NjYwODM2N2I2NTc0ZTkyNTAxMWE5MzUzZTRiYWRk
YTkxZDc5IgogU1JDX1VSSVtzZXJkZV9kZXJpdmVfaW50ZXJuYWxzLTAuMjkuMS5zaGEyNTZzdW1d
ID0gIjE4ZDI2YTIwYTk2OWI5ZTNmZGYyZmMyZDlmMjFlZGE2YzQwZTJkZTg0Yzk0MDhiYjVkM2Iw
NWQ0OTlhYWU3MTEiCi1TUkNfVVJJW3NlcmRlX2pzb24tMS4wLjE0NS5zaGEyNTZzdW1dID0gIjQw
MmE2ZjY2ZDhjNzA5MTE2Y2YyMmY1NThlYWIyMTBmNWE1MDE4N2Y3MDJlYjRkN2U1ZWYzOGQ5YTdm
MWM3OWMiCitTUkNfVVJJW3NlcmRlX2pzb24tMS4wLjE0Ny5zaGEyNTZzdW1dID0gIjZhZjE0NzI1
NTA1MzE0MzQzZTY3M2U5ZWNiN2NkN2U4YTM2YWE5NzkxZWI5MzYyMzVhMzU2N2NjMzE0NDdhZTQi
CiBTUkNfVVJJW3NlcmRlX3JlcHItMC4xLjIwLnNoYTI1NnN1bV0gPSAiMTc1ZWUzZTgwYWU5OTgy
NzM3Y2E1NDNlOTYxMzMwODdjYmQ5YTQ4NWVlY2MzYmM0ZGU5YzFhMzdiNDdlYTU5YyIKLVNSQ19V
Uklbc2VyZGVfc3Bhbm5lZC0xLjAuMy5zaGEyNTZzdW1dID0gImUyNDM0NWFhMGZlNjg4NTk0ZTcz
NzcwYTVmNmQxYjIxNjUwOGI0ZjkzNDg0YzAwMjZkNTIxYWNkMzAxMzQzOTIiCitTUkNfVVJJW3Nl
cmRlX3NwYW5uZWQtMS4wLjQuc2hhMjU2c3VtXSA9ICJmOGJiZjkxZTVhNGQ2MzE1ZWVlNDVlNzA0
MzcyNTkwYjMwZTI2MGVlODNhZjY2MzlkNjQ1NTdmNTFiMDY3Nzc2IgogU1JDX1VSSVtzZXJkZV91
cmxlbmNvZGVkLTAuNy4xLnNoYTI1NnN1bV0gPSAiZDM0OTFjMTQ3MTVjYTIyOTRjNGQ2YTg4ZjE1
ZTg0NzM5Nzg4YzFkMDMwZWVkOGMxMTA0MzZhYWZkYWEyZjNmZCIKIFNSQ19VUklbc2VyZGVfeWFt
bC0wLjkuMzQrZGVwcmVjYXRlZC5zaGEyNTZzdW1dID0gIjZhOGIxYTFhMmViZjY3NDAxNWNjMDJl
ZGNjY2U3NTI4N2YxYTAxMzBkMzk0MzA3YjM2NzQzYzJmNWQ1MDRiNDciCiBTUkNfVVJJW3NoYTEt
MC4xMC42LnNoYTI1NnN1bV0gPSAiZTNiZjgyOWEyZDUxYWI0YTVkZGYxMzUyZDg0NzBjMTQwY2Fk
YzgzMDFiMmFlMTc4OWRiMDIzZjAxY2VkZDZiYSIKQEAgLTEwOTUsNyArMTA5Miw3IEBAIFNSQ19V
Uklbc21hd2stMC4zLjIuc2hhMjU2c3VtXSA9ICJiN2MzODhjMWI1ZTkzNzU2ZDBjNzQwOTY1YzQx
ZTg4MjJmODY2NjIxZDQxYWNiCiBTUkNfVVJJW3NvY2tldDItMC41LjEwLnNoYTI1NnN1bV0gPSAi
ZTIyMzc2YWJlZDM1MGQ3M2RkMWNkMTE5YjU3ZmZjY2FkOTViNGU1ODVhN2NkYTQzZTI4NjI0NWNl
MjNjMDY3OCIKIFNSQ19VUklbc29ja2V0Mi0wLjYuMC5zaGEyNTZzdW1dID0gIjIzMzUwNGFmNDY0
MDc0ZjlkMDY2ZDdiNTQxNmM1ZjliODk0YTU4NjJhNjUwNmUzMDZmN2I4MTZjZGQ2ZjE4MDciCiBT
UkNfVVJJW3NwZHgtMC4xMC45LnNoYTI1NnN1bV0gPSAiYzNlMTdlODgwYmFmYWViMzYyYTdiNzUx
ZWM0NmJkYzViNjE0NDVhMTg4ZjgwZTA2MDZlNjgxNjdjZDU0MGZhMyIKLVNSQ19VUklbc3BkeC0w
LjEzLjIuc2hhMjU2c3VtXSA9ICIzNTEwN2IxYzgxOGY0ZTljYjllNmM0NDQ0Y2E1NjBiYTAzYjRl
ZTEyODhkY2VjYzZkNzgzMGMyMDIzYTc2MDllIgorU1JDX1VSSVtzcGR4LTAuMTMuMy5zaGEyNTZz
dW1dID0gImFmZDc2NTE3OWQxMmNkZDA2MTkyZTAyYjFkOGM2YjBkNDZiZDI2ZGU5YmYxNmNlMDRj
ODgxNDI4Y2EyY2M3ZWQiCiBTUkNfVVJJW3N0YWJsZV9kZXJlZl90cmFpdC0xLjIuMC5zaGEyNTZz
dW1dID0gImE4ZjExMjcyOTUxMmY4ZTQ0MmQ4MWY5NWE4YTdkZGYyYjdjNmI4YTFhNmY1MDlhOTU4
NjQxNDJiMzBjYWIyZDMiCiBTUkNfVVJJW3N0YXRpY19hc3NlcnRpb25zLTEuMS4wLnNoYTI1NnN1
bV0gPSAiYTJlYjkzNDliNjQ0NGIzMjY4NzJlMTQwZWIxY2Y1ZTdjNTIyMTU0ZDY5ZTdhMGZmYjBm
YjgxYzA2YjM3NTQzZiIKIFNSQ19VUklbc3RhdHJzLTAuMTguMC5zaGEyNTZzdW1dID0gIjJhM2Zl
N2MyOGM2NTEyZTc2NmIwODc0MzM1ZGIzM2M5NGFkN2I4ZjkwNTQyMjhhZTFjMmFiZDQ3Y2U3ZDMz
NWUiCkBAIC0xMTIxLDcgKzExMTgsNyBAQCBTUkNfVVJJW3RhZ3UtMC4xLjYuc2hhMjU2c3VtXSA9
ICJlZGRiNmIwNmQyMGZiYTllZDIxZmNhM2Q2OTZlZTFiNmU4NzBiY2EwYmNmOWZhMgogU1JDX1VS
SVt0YXItMC40LjQ0LnNoYTI1NnN1bV0gPSAiMWQ4NjM4NzhkMjEyYzg3YTE5YzFhNjEwZWI1M2Ji
MDFmZTEyOTUxYzA1MDFjZjVhMGQ2NWY3MjQ5MTRhNjY3YSIKIFNSQ19VUklbdGFyZ2V0LWxleGlj
b24tMC4xMy4zLnNoYTI1NnN1bV0gPSAiZGY3ZjYyNTc3YzI1ZTA3ODM0NjQ5ZmMzYjM5ZmFmZGM1
OTdjMGEzNTI3ZGMxYzYwMTI5MjAxY2NmY2JhYTUwYyIKIFNSQ19VUklbdGVtcC1lbnYtMC4zLjYu
c2hhMjU2c3VtXSA9ICI5NjM3NDg1NTA2OGY0NzQwMmMzMTIxYzZlZWQ4OGQyOWNiMWRlOGYzYWIy
NzA5MGUyNzNlNDIwYmRhYmNmMDUwIgotU1JDX1VSSVt0ZW1wZmlsZS0zLjIwLjAuc2hhMjU2c3Vt
XSA9ICJlOGE2NGUzOTg1MzQ5ZjI0NDFhMWE5ZWYwYjg1M2Y4NjkwMDZjMzg1NWYyY2RhNjg2MmE5
NGQyNmViYjlkNmExIgorU1JDX1VSSVt0ZW1wZmlsZS0zLjI0LjAuc2hhMjU2c3VtXSA9ICI2NTVk
YTljN2ViNjMwNWM1NTc0MjA0NWQ1YThkMjAzNzk5NmQ2MWQ4ZGU5NTgwNjMzNWM3Yzg2Y2UwZjgy
ZTljIgogU1JDX1VSSVt0ZXJtaW5hbF9zaXplLTAuNC4yLnNoYTI1NnN1bV0gPSAiNDVjNjQ4MWM0
ODI5ZTRjYzYzODI1ZTYyYzQ5MTg2YTM0NTM4YjdiMjc1MGI3M2IyNjY1ODFmZmI2MTJmYjVlZCIK
IFNSQ19VUklbdGVybXRyZWUtMC41LjEuc2hhMjU2c3VtXSA9ICI4ZjUwZmViZWM4M2Y1ZWUxZGYz
MDE1MzQxZDhiZDQyOWYyZDFjYzYyYmNiYTdlYTIwNzY3NTlkMzE1MDg0NjgzIgogU1JDX1VSSVt0
ZXN0LWNhc2UtMy4zLjEuc2hhMjU2c3VtXSA9ICJlYjI1NTBkZDEzYWZjZDI4Njg1MzE5MmFmODYw
MTkyMGQ5NTliMTRjNDAxZmNlY2UzODA3MWQ1M2JmMDc2OGE4IgpAQCAtMTE1MiwxMyArMTE0OSwx
MyBAQCBTUkNfVVJJW3Rva2lvLW1hY3Jvcy0yLjUuMC5zaGEyNTZzdW1dID0gIjZlMDZkNDNmMTM0
NWEzYmNkMzlmNmE1NmRiYjdkY2FiMmJhNDdlNgogU1JDX1VSSVt0b2tpby1ydXN0bHMtMC4yNi4y
LnNoYTI1NnN1bV0gPSAiOGU3MjdiMzZhMWEwZThiNzRjMzc2YWMyMjExZTQwYzJjOGFmMDlmYjQw
MTNjNjBkOTEwNDk1ODEwZjAwOGU5YiIKIFNSQ19VUklbdG9raW8tc3RyZWFtLTAuMS4xNy5zaGEy
NTZzdW1dID0gImVjYTU4ZDdiYmE0YTc1NzA3ODE3YTJjNDQxNzQyNTNmOTIzNmIyZDVmYmQwNTU2
MDJlOWQ1YzA3YzEzOWEwNDciCiBTUkNfVVJJW3Rva2lvLXV0aWwtMC43LjE3LnNoYTI1NnN1bV0g
PSAiMmVmYTE0OWZlNzYwNzNkNmU4ZmQ5N2VmNGY0ZWNhN2I2N2Y1OTk2NjAxMTU1OTE0ODM1NzJl
NDA2ZTE2NTU5NCIKLVNSQ19VUklbdG9tbC0wLjkuOC5zaGEyNTZzdW1dID0gImYwZGM4YjFmYjYx
NDQ5ZTI3NzE2ZWMwZTFiZGYwZjZiOGYzZThmNmIwNTM5MWU4NDk3YjhiNmQ3ODA0ZWE2ZDgiCitT
UkNfVVJJW3RvbWwtMC45LjEwK3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICIwODI1MDUyMTU5Mjg0
YTFhOGI0ZDZjMGM4NmNiYzgwMWYyZGE1YWZkMmIyMjVmYTU0OGM3MmYyZTc0MDAyZjQ4IgogU1JD
X1VSSVt0b21sX2RhdGV0aW1lLTAuNi4xMS5zaGEyNTZzdW1dID0gIjIyY2RkYWY4OGY0ZmJjMTNj
NTFhZWJiZjVmOGVjZWI1YzdjNWE5ZGEyYWM0MGExMzUxOWViNWIwYTBlOGYxMWMiCi1TUkNfVVJJ
W3RvbWxfZGF0ZXRpbWUtMC43LjMuc2hhMjU2c3VtXSA9ICJmMmNkYjYzOWViYmM5Nzk2MWM1MTcy
MGY4NTg1OTdmN2YyNGM0ZmMyOTUzMjc5MjNhZjU1Yjc0YzNjNzI0NTMzIgorU1JDX1VSSVt0b21s
X2RhdGV0aW1lLTAuNy41K3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICI5MmUxY2ZlZDRhMzAzOGJj
NWExMjdlMzVhMmQzNjBmMTQ1ZTFmNGI5NzFiNTUxYTJiYTVmZDdhZWRmN2UxMzQ3IgogU1JDX1VS
SVt0b21sX2VkaXQtMC4yMi4yNy5zaGEyNTZzdW1dID0gIjQxZmU4YzY2MGFlNDI1Nzg4N2NmNjYz
OTQ4NjJkMjFkYmNhNGE2ZGRkMjZmMDRhMzU2MDQxMDQwNmEyZjgxOWEiCi1TUkNfVVJJW3RvbWxf
ZWRpdC0wLjIzLjcuc2hhMjU2c3VtXSA9ICI2NDg1ZWY2ZDBkOWI1ZDBlYzE3MjQ0ZmY3ZWIwNTMx
MDExM2MzZjMxNmYyZDE0MjAwZDRkZTU2YjNjYjk4ZjhkIgotU1JDX1VSSVt0b21sX3BhcnNlci0x
LjAuNC5zaGEyNTZzdW1dID0gImMwY2JlMjY4ZDM1YmRiNGJiNWE1NmEyZGU4OGQwYWQwZWI3MGFm
NTM4NGE5OWQ2NDhjZDRiM2QwNDAzOTgwMGUiCi1TUkNfVVJJW3RvbWxfd3JpdGVyLTEuMC40LnNo
YTI1NnN1bV0gPSAiZGY4YjJiNTQ3MzM2NzRhZDI4NmQxNjI2N2RjZmM3YTcxZWQ1Yzc3NmU0YWM3
YWEzYzNlMjU2MWY3YzYzN2JmMiIKK1NSQ19VUklbdG9tbF9lZGl0LTAuMjQuMCtzcGVjLTEuMS4w
LnNoYTI1NnN1bV0gPSAiOGM3NDBiMTg1OTIwMTcwYTZkOTE5MTEyMmNhZmVmNzAxMGJkNjI3MGEz
ODI0NTk0YmZmNjc4NGMwNGQ3ZjA5ZSIKK1NSQ19VUklbdG9tbF9wYXJzZXItMS4wLjYrc3BlYy0x
LjEuMC5zaGEyNTZzdW1dID0gImEzMTk4YjRiMGE4ZTExZjA5ZGQwM2UxMzNjMDI4MDUwNGQwODAx
MjY5ZTlhZmE0NjM2MmZmZGUxY2JlZWJmNDQiCitTUkNfVVJJW3RvbWxfd3JpdGVyLTEuMC42K3Nw
ZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICJhYjE2ZjE0YWVkMjFlZThiZmQ4ZWMyMjUxM2Y3Mjg3Y2Q0
YTkxYWE5MmU0NGVkZmUyYzE3ZGRkMDA0ZTkyNjA3IgogU1JDX1VSSVt0b3dlci0wLjUuMi5zaGEy
NTZzdW1dID0gImQwMzlhZDkxNTljOThiNzBlY2ZkNTQwYjI1NzNiOTdmN2Y1MmMzZThkOWY4YWQ1
N2EyNGI5MTZhNTM2OTc1ZjkiCiBTUkNfVVJJW3Rvd2VyLWh0dHAtMC42LjYuc2hhMjU2c3VtXSA9
ICJhZGM4MmZkNzNkZTJhOTcyMmFjNWRhNzQ3ZjEyMzgzZDJiZmRiOTM1OTFlZTZjNTg0ODZlMDA5
Nzg5MGYwNWYyIgogU1JDX1VSSVt0b3dlci1sYXllci0wLjMuMy5zaGEyNTZzdW1dID0gIjEyMWMy
YTZjZGE0Njk4MGJiMGZjZDE2NDdmZmFmNmNkM2ZjNzlhMDEzZGUyODg3ODI4MzZmNmRmOWM0ODc4
MGUiCkBAIC0xMjAxLDcgKzExOTgsNyBAQCBTUkNfVVJJW3VzdmctdGV4dC1sYXlvdXQtMC4yOS4w
LnNoYTI1NnN1bV0gPSAiMTk1Mzg2ZTAxYmMzNWY4NjBkYjAyNGRlMjc1YTc2ZTdhMwogU1JDX1VS
SVt1dGY4LXdpZHRoLTAuMS43LnNoYTI1NnN1bV0gPSAiODZiZDhkNGU4OTVkYTg1MzdlNTMxNWI4
MjU0NjY0ZTZiNzY5YzRmZjNkYjE4MzIxYjI5N2ExZTcwMDQzOTJlMyIKIFNSQ19VUklbdXRmOF9p
dGVyLTEuMC40LnNoYTI1NnN1bV0gPSAiYjZjMTQwNjIwZTdmZmJiMjJjMmRlZTU5Y2FmZTYwODRh
NTliNWZmYzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZiZSIKIFNSQ19VUklbdXRmOHBhcnNlLTAuMi4y
LnNoYTI1NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2FkZjY2ZDM4M2YwMGIwOTNkN2ZhZWNjN2ZhNTcw
NzFjY2UyNTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19VUklbdXVpZC0xLjE3LjAuc2hhMjU2c3VtXSA9
ICIzY2Y0MTk5ZDFlNWQxNWRkZDg2YTY5NGU0ZDBkZmZhOWMzMjNjZTc1OWZlYTU4OWYwMGZlZjlk
ODFjYzE5MzFkIgorU1JDX1VSSVt1dWlkLTEuMTkuMC5zaGEyNTZzdW1dID0gImUyZTA1NDg2MWI0
YmQwMjdjZDM3M2UxOGU4ZDhkOGU2NTQ4MDg1MDAwZTQxMjkwZDk1Y2UwYzM3M2E2NTRiNGEiCiBT
UkNfVVJJW3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1bV0gPSAiYmE3M2VhOWNmMTZhMjVkZjBjOGNh
YTE2YzUxYWNiOTM3ZDU3MTJhODQyOWRiNzhhM2VlMjlkNWRjYWNkM2E2NSIKIFNSQ19VUklbdmVy
c2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFkOWY4NmM4ZjI4
Mzg1M2FkMjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVlMjI4OTEwNWEiCiBTUkNfVVJJW3dhaXQtdGlt
ZW91dC0wLjIuMS5zaGEyNTZzdW1dID0gIjA5YWMzYjEyNmQzOTE0Zjk4NDkwMzZmODI2ZTA1NGNi
YWJkYzg1MTk5NzBiODk5OGRkYWYzYjViZDNjNjVmMTEiCkBAIC0xMjk1LDYgKzEyOTIsNyBAQCBT
UkNfVVJJW3plcm92ZWMtMC4xMS4yLnNoYTI1NnN1bV0gPSAiNGEwNWViMDgwZTAxNWJhMzljYzll
MjNiYmU1ZTdmYjA0ZDVmYjA0MDM1MAogU1JDX1VSSVt6ZXJvdmVjLWRlcml2ZS0wLjExLjEuc2hh
MjU2c3VtXSA9ICI1Yjk2MjM3ZWZhMGM4NzhjNjRiZDg5YzQzNmY2NjFiZTRlNDZiMmYzZWZmMWVi
Yjk3NmY3ZWYyMzIxZDJmNThmIgogU1JDX1VSSVt6aXAtMi40LjIuc2hhMjU2c3VtXSA9ICJmYWJl
NjMyNGU5MDhmODVhMWM1MjA2M2NlN2FhMjZiNjhkY2I3ZWI2ZGJjODNhMmQxNDg0MDNjOWJjM2Vi
YTUwIgogU1JDX1VSSVt6bGliLXJzLTAuNS4xLnNoYTI1NnN1bV0gPSAiNjI2YmQ5ZmE5NzM0NzUx
ZmM1MGQ2MDYwNzUyMTcwOTg0ZDcwNTNmNWEzOTA2MWY1MjRjZGE2ODAyM2Q0ZGI4YSIKK1NSQ19V
Uklbem1pai0wLjEuMTEuc2hhMjU2c3VtXSA9ICIzMjczZWQyYzFmODlmNjNlYzc0YWI3NWVmZTIw
MTU5ZDAwNThlMzA4MzFlNmU5ZjE1MDJjZDViZjJmZDhiMTc4IgogU1JDX1VSSVt6b3BmbGktMC44
LjIuc2hhMjU2c3VtXSA9ICJlZGZjNWVlNDA1ZjUwNGNkNDk4NGVjYzZmMTRkMDJkNTVjZmRhNjBm
YTRiNjg5NDM0ZWY0MTAyYWFlMTUwY2Q3IgogU1JDX1VSSVt6c3RkLTAuMTMuMy5zaGEyNTZzdW1d
ID0gImU5MWVlMzExYTU2OWMzMjcxNzE2NTE1NjZlMDc5NzIyMDBlNzZmY2ZlMjI0MmE0ZmE0NDYx
NDlhMzg4MWMwOGEiCiBTUkNfVVJJW3pzdGQtc2FmZS03LjIuNC5zaGEyNTZzdW1dID0gIjhmNDlj
NGQ1ZjBhYmI2MDJhOTNmYjg3MzZhZjJhNGY0ZGQ5NTEyZTM2ZjdmNTcwZDY2ZTY1ZmY4NjdlZDNi
OWQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYt
YnVpbGRfMC45LjE4LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2
LWJ1aWxkXzAuOS4yNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC45LjE4LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC45LjI1LmJi
CmluZGV4IGFhMTQzNDkxOTcuLmU0NmJjOTcyYWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjkuMTguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuOS4yNS5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZk
M2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThm
YzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBl
cDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTM0NThlYmMzYzJhZTY5Y2NhNjIxYTFlNmYxZTI4MGE3
Y2I2YzcyOWY4MjliMzI1ZmVmNGE2NWE1NWVmYTlkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA2
ODM1OTEyMTFkYWY4ZDYwYzk1ZGEwMTUzNmY3YWZiODMyNGY4MzgyZTlkMTRiMTU4MGQzM2Q5YmVl
NDBjZjQiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============2390711913578222769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info -> /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info, directory renamed /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info/licenses -> /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info moved to /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info

--===============2390711913578222769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.9.18.tar.gz;downloadfilename=uv_build-0.9.18.tar.gz crate://crates.io/addr2line/0.24.2 crate://crates.io/adler2/2.0.1 crate://crates.io/aes/0.8.4 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-id/0.0.7 crate://crates.io/anes/0.1.6 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.11 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.3 crate://crates.io/anstyle-wincon/3.0.9 crate://crates.io/anyhow/1.0.100 crate://crates.io/approx/0.5.1 crate://crates.io/arbitrary/1.4.1 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayref/0.3.9 crate://crates.io/arrayvec/0.7.6 crate://crates.io/assert-json-diff/2.0.2 crate://crates.io/assert_cmd/2.0.17 crate://crates.io/assert_fs/1.1.3 crate://crates.io/astral-pubgrub/0.3.3 crate://crates.io/astral-reqwest-middleware/0
 .4.2 crate://crates.io/astral-reqwest-retry/0.7.0 crate://crates.io/astral-tl/0.7.11 crate://crates.io/astral-tokio-tar/0.5.6 crate://crates.io/astral-version-ranges/0.1.3 crate://crates.io/astral_async_http_range_reader/0.9.1 crate://crates.io/astral_async_zip/0.0.17 crate://crates.io/async-broadcast/0.7.2 crate://crates.io/async-channel/2.5.0 crate://crates.io/async-compression/0.4.19 crate://crates.io/async-recursion/1.1.1 crate://crates.io/async-trait/0.1.89 crate://crates.io/atomic-waker/1.1.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/axoasset/1.3.0 crate://crates.io/axoprocess/0.2.1 crate://crates.io/axotag/0.3.0 crate://crates.io/axoupdater/0.9.1 crate://crates.io/backon/1.5.2 crate://crates.io/backtrace/0.3.75 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bisection/0.1.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.9.4 crate://crates.io/blake2/0.10.6 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-pad
 ding/0.3.3 crate://crates.io/block2/0.6.2 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.0 crate://crates.io/bumpalo/3.19.0 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytemuck/1.23.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.10.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/camino/1.1.10 crate://crates.io/cargo-util/0.2.24 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.1.2 crate://crates.io/cc/1.2.30 crate://crates.io/cfg-if/1.0.1 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.4.4 crate://crates.io/clap/4.5.53 crate://crates.io/clap_builder/4.5.53 crate://crates.io/clap_complete/4.5.55 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nus
 hell/4.5.8 crate://crates.io/clap_derive/4.5.49 crate://crates.io/clap_lex/0.7.5 crate://crates.io/codspeed/4.0.5 crate://crates.io/codspeed-criterion-compat/4.0.5 crate://crates.io/codspeed-criterion-compat-walltime/4.0.5 crate://crates.io/color_quant/1.1.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/colored/2.2.0 crate://crates.io/concurrent-queue/2.5.0 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.11 crate://crates.io/console/0.16.1 crate://crates.io/const-oid/0.9.6 crate://crates.io/const-random/0.1.18 crate://crates.io/const-random-macro/0.1.16 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc/3.3.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/criterion-plot/0.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam
 -epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.1.6 crate://crates.io/csv/1.3.1 crate://crates.io/csv-core/0.1.12 crate://crates.io/ctrlc/3.5.1 crate://crates.io/cyclonedx-bom/0.8.0 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/dashmap/6.1.0 crate://crates.io/data-encoding/2.9.0 crate://crates.io/data-url/0.2.0 crate://crates.io/deadpool/0.12.3 crate://crates.io/deadpool-runtime/0.1.4 crate://crates.io/deranged/0.5.5 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/diff/0.1.13 crate://crates.io/difflib/0.4.0 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/diskus/0.9.0 crate://crates.io/dispatch2/0.3.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dlv-list/0.5.2 crate://crates.io/doc-comment/0.3.4 crate://crates.io/dotenvy/0.15.7 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.19 crate://crates.io/eith
 er/1.15.0 crate://crates.io/embed-manifest/1.5.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/endi/1.1.0 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/env_filter/0.1.3 crate://crates.io/env_home/0.1.0 crate://crates.io/env_logger/0.11.8 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.6 crate://crates.io/errno/0.3.13 crate://crates.io/etcetera/0.11.0 crate://crates.io/event-listener/5.4.0 crate://crates.io/event-listener-strategy/0.5.4 crate://crates.io/fastrand/2.3.0 crate://crates.io/fdeflate/0.3.7 crate://crates.io/filetime/0.2.26 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.5 crate://crates.io/float-cmp/0.9.0 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fluent-uri/0.1.4 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/fontconfig-par
 ser/0.5.8 crate://crates.io/fontdb/0.12.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.1.3 crate://crates.io/futures/0.3.31 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.31 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-lite/2.6.0 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.16 crate://crates.io/getrandom/0.3.3 crate://crates.io/gif/0.12.0 crate://crates.io/gimli/0.31.1 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/globwalk/0.9.1 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/goblin/0.10.4 crate://crates.io/h2/0.4.12 crate://crates.io/half/2.6.0 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://cra
 tes.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/hkdf/0.12.4 crate://crates.io/hmac/0.12.1 crate://crates.io/homedir/0.3.6 crate://crates.io/html-escape/0.2.13 crate://crates.io/http/1.3.1 crate://crates.io/http-body/1.0.1 crate://crates.io/http-body-util/0.1.3 crate://crates.io/http-content-range/0.2.3 crate://crates.io/httparse/1.10.1 crate://crates.io/httpdate/1.0.3 crate://crates.io/hyper/1.7.0 crate://crates.io/hyper-rustls/0.27.7 crate://crates.io/hyper-util/0.1.16 crate://crates.io/icu_collections/2.0.0 crate://crates.io/icu_locale_core/2.0.0 crate://crates.io/icu_normalizer/2.0.0 crate://crates.io/icu_normalizer_data/2.0.0 crate://crates.io/icu_properties/2.0.1 crate://crates.io/icu_properties_data/2.0.1 crate://crates.io/icu_provider/2.0.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/image/0.25.6 crate://crates.io/imagesize/0.11.0 crate://crates.io/indexm
 ap/2.12.1 crate://crates.io/indicatif/0.18.3 crate://crates.io/indoc/2.0.7 crate://crates.io/inout/0.1.4 crate://crates.io/insta/1.43.2 crate://crates.io/io-uring/0.7.9 crate://crates.io/ipnet/2.11.0 crate://crates.io/iri-string/0.7.8 crate://crates.io/is-docker/0.2.0 crate://crates.io/is-terminal/0.4.16 crate://crates.io/is-wsl/0.4.0 crate://crates.io/is_ci/1.2.0 crate://crates.io/is_terminal_polyfill/1.70.1 crate://crates.io/itertools/0.10.5 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.15 crate://crates.io/jiff/0.2.16 crate://crates.io/jiff-static/0.2.16 crate://crates.io/jiff-tzdb/0.1.4 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.33 crate://crates.io/jpeg-decoder/0.3.2 crate://crates.io/js-sys/0.3.77 crate://crates.io/junction/1.2.0 crate://crates.io/kurbo/0.8.3 crate://crates.io/kurbo/0.9.5 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.175 crate://crates.io/libmimalloc-sys/0.1.44 
 crate://crates.io/libredox/0.1.6 crate://crates.io/libz-rs-sys/0.5.1 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.9.4 crate://crates.io/litemap/0.8.0 crate://crates.io/lock_api/0.4.13 crate://crates.io/log/0.4.27 crate://crates.io/lru-slab/0.1.2 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/markdown/1.0.0 crate://crates.io/matchers/0.2.0 crate://crates.io/md-5/0.10.6 crate://crates.io/memchr/2.7.6 crate://crates.io/memmap2/0.5.10 crate://crates.io/memmap2/0.9.7 crate://crates.io/memoffset/0.9.1 crate://crates.io/miette/7.6.0 crate://crates.io/miette-derive/7.6.0 crate://crates.io/mimalloc/0.1.48 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.0.4 crate://crates.io/miow/0.6.1 crate://crates.io/munge/0.4.5 crate://crates.io/munge_macro/0.4.5 crate://crates.io/nanoid/0.4.0 crate://crates.io/nix/0.30.1 crate://c
 rates.io/normalize-line-endings/0.3.0 crate://crates.io/nu-ansi-term/0.50.1 crate://crates.io/num/0.4.3 crate://crates.io/num-bigint/0.4.6 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.1.0 crate://crates.io/num-integer/0.1.46 crate://crates.io/num-iter/0.1.45 crate://crates.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.19 crate://crates.io/num_cpus/1.17.0 crate://crates.io/objc2/0.6.3 crate://crates.io/objc2-encode/4.1.0 crate://crates.io/object/0.36.7 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.1 crate://crates.io/oorandom/11.1.5 crate://crates.io/open/5.3.3 crate://crates.io/openssl-probe/0.1.6 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/4.6.0 crate://crates.io/ordered-multimap/0.7.3 crate://crates.io/ordered-stream/0.2.0 crate://crates.io/os_str_bytes/6.6.1 crate://crates.io/owo-colors/4.2.3 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.4 crate://crates.io/parking_lot_core/0.9
 .11 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem/3.0.6 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.1 crate://crates.io/pest_derive/2.8.1 crate://crates.io/pest_generator/2.8.1 crate://crates.io/pest_meta/2.8.1 crate://crates.io/petgraph/0.8.3 crate://crates.io/pico-args/0.5.0 crate://crates.io/pin-project/1.1.10 crate://crates.io/pin-project-internal/1.1.10 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plain/0.2.3 crate://crates.io/png/0.17.16 crate://crates.io/poloto/19.1.2 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/portable-atomic-util/0.2.4 crate://crates.io/potential_utf/0.1.2 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/predicates/3.1.3 crate://crates.io/predicates-core/1.0.9 crate://crates.io/predicates-tree/1.0.12 crate://crates.io/pretty
 _assertions/1.4.1 crate://crates.io/priority-queue/2.5.0 crate://crates.io/proc-macro-crate/3.3.0 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/procfs/0.17.0 crate://crates.io/procfs-core/0.17.0 crate://crates.io/ptr_meta/0.3.0 crate://crates.io/ptr_meta_derive/0.3.0 crate://crates.io/purl/0.1.6 crate://crates.io/quick-xml/0.38.3 crate://crates.io/quinn/0.11.8 crate://crates.io/quinn-proto/0.11.12 crate://crates.io/quinn-udp/0.5.13 crate://crates.io/quote/1.0.42 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.3 crate://crates.io/rayon/1.11.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/rcgen/0.14.5 crate://crates.io/rctree/0.5.0 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/redox_users/0.5.0 crate://crates.i
 o/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.28 crate://crates.io/regex/1.11.2 crate://crates.io/regex-automata/0.4.13 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/rend/0.5.2 crate://crates.io/reqsign/0.18.1 crate://crates.io/reqsign-aws-v4/2.0.1 crate://crates.io/reqsign-command-execute-tokio/2.0.1 crate://crates.io/reqsign-core/2.0.1 crate://crates.io/reqsign-file-read-tokio/2.0.1 crate://crates.io/reqsign-http-send-reqwest/2.0.1 crate://crates.io/reqwest/0.12.22 crate://crates.io/resvg/0.29.0 crate://crates.io/retry-policies/0.4.0 crate://crates.io/rgb/0.8.52 crate://crates.io/ring/0.17.14 crate://crates.io/rkyv/0.8.12 crate://crates.io/rkyv_derive/0.8.12 crate://crates.io/rmp/0.8.14 crate://crates.io/rmp-serde/1.3.0 crate://crates.io/rosvgtree/0.1.0 crate://crates.io/roxmltree/0.18.1 crate://crates.io/roxmltree/0.20.0 crate://crates.io/rust-ini/0.21.3 crate://crates.io/rust-netrc/0.1.2 crate://crates.io/rustc-demangle/0.1.
 25 crate://crates.io/rustc-hash/2.1.1 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.0.8 crate://crates.io/rustls/0.23.35 crate://crates.io/rustls-native-certs/0.8.2 crate://crates.io/rustls-pki-types/1.12.0 crate://crates.io/rustls-webpki/0.103.8 crate://crates.io/rustversion/1.0.21 crate://crates.io/rustybuzz/0.7.0 crate://crates.io/ryu/1.0.20 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.27 crate://crates.io/schemars/1.0.5 crate://crates.io/schemars_derive/1.0.5 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.0 crate://crates.io/seahash/4.1.0 crate://crates.io/secrecy/0.10.3 crate://crates.io/secret-service/5.0.0 crate://crates.io/security-framework/3.2.0 crate://crates.io/security-framework-sys/2.14.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.26 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io
 /serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.145 crate://crates.io/serde_repr/0.1.20 crate://crates.io/serde_spanned/1.0.3 crate://crates.io/serde_urlencoded/0.7.1 crate://crates.io/serde_yaml/0.9.34+deprecated crate://crates.io/sha1/0.10.6 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-escape/0.1.5 crate://crates.io/shellexpand/3.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.5 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/simplecss/0.2.2 crate://crates.io/siphasher/0.3.11 crate://crates.io/slab/0.4.11 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.5.10 crate://crates.io/socket2/0.6.0 crate://crates.io/spdx/0.10.9 crate://crates.io/spdx/0.13.2 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/static_assertions/1.1.0 crate://
 crates.io/statrs/0.18.0 crate://crates.io/strict-num/0.1.1 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.26.3 crate://crates.io/strum_macros/0.26.4 crate://crates.io/subtle/2.6.1 crate://crates.io/supports-color/3.0.2 crate://crates.io/supports-hyperlinks/3.1.0 crate://crates.io/supports-unicode/3.0.0 crate://crates.io/svg/0.18.0 crate://crates.io/svgfilters/0.4.0 crate://crates.io/svgtypes/0.9.0 crate://crates.io/svgtypes/0.10.0 crate://crates.io/syn/2.0.111 crate://crates.io/sync_wrapper/1.0.2 crate://crates.io/synstructure/0.13.2 crate://crates.io/sys-info/0.9.1 crate://crates.io/system-configuration/0.6.1 crate://crates.io/system-configuration-sys/0.6.0 crate://crates.io/tagu/0.1.6 crate://crates.io/tar/0.4.44 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.20.0 crate://crates.io/terminal_size/0.4.2 crate://crates.io/termtree/0.5.1 crate://crates.io/test-case/3.3.1 crate://crates.io/test-case-core/3.3.1 crate://cr
 ates.io/test-case-macros/3.3.1 crate://crates.io/test-log/0.2.18 crate://crates.io/test-log-macros/0.2.18 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.17 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.17 crate://crates.io/thread_local/1.1.9 crate://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 crate://crates.io/tikv-jemallocator/0.6.0 crate://crates.io/time/0.3.44 crate://crates.io/time-core/0.1.6 crate://crates.io/time-macros/0.2.24 crate://crates.io/tiny-keccak/2.0.2 crate://crates.io/tiny-skia/0.8.4 crate://crates.io/tiny-skia-path/0.8.4 crate://crates.io/tinystr/0.8.1 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.9.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.47.1 crate://crates.io/tokio-macros/2.5.0 crate://crates.io/tokio-rustls/0.26.2 crate://crates.io/tokio-stream/0.1.17 crate://crates.io/tokio-util/0.7.17 crate:
 //crates.io/toml/0.9.8 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.3 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.23.7 crate://crates.io/toml_parser/1.0.4 crate://crates.io/toml_writer/1.0.4 crate://crates.io/tower/0.5.2 crate://crates.io/tower-http/0.6.6 crate://crates.io/tower-layer/0.3.3 crate://crates.io/tower-service/0.3.3 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.30 crate://crates.io/tracing-core/0.1.34 crate://crates.io/tracing-durations-export/0.3.1 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.20 crate://crates.io/tracing-test/0.2.5 crate://crates.io/tracing-test-macro/0.2.5 crate://crates.io/tracing-tree/0.4.1 crate://crates.io/try-lock/0.2.5 crate://crates.io/ttf-parser/0.18.1 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.18.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/uds_windows/1.1.0 crate://crates
 .io/unicase/2.8.1 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-bidi-mirroring/0.1.0 crate://crates.io/unicode-ccc/0.1.2 crate://crates.io/unicode-general-category/0.6.0 crate://crates.io/unicode-id/0.3.5 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-script/0.5.7 crate://crates.io/unicode-vo/0.1.0 crate://crates.io/unicode-width/0.1.14 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unit-prefix/0.5.1 crate://crates.io/unsafe-libyaml/0.2.11 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/url/2.5.7 crate://crates.io/usvg/0.29.0 crate://crates.io/usvg-text-layout/0.29.0 crate://crates.io/utf8-width/0.1.7 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.17.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/want/0.3
 .1 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasite/0.1.0 crate://crates.io/wasm-bindgen/0.2.100 crate://crates.io/wasm-bindgen-backend/0.2.100 crate://crates.io/wasm-bindgen-futures/0.4.50 crate://crates.io/wasm-bindgen-macro/0.2.100 crate://crates.io/wasm-bindgen-macro-support/0.2.100 crate://crates.io/wasm-bindgen-shared/0.2.100 crate://crates.io/wasm-streams/0.4.2 crate://crates.io/wasmtimer/0.4.2 crate://crates.io/web-sys/0.3.77 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/1.0.2 crate://crates.io/weezl/0.1.10 crate://crates.io/which/8.0.0 crate://crates.io/whoami/1.6.1 crate://crates.io/widestring/1.2.0 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.9 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.59.0 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://cra
 tes.io/windows-core/0.59.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.59.0 crate://crates.io/windows-implement/0.60.0 crate://crates.io/windows-interface/0.59.1 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.0 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-registry/0.5.3 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.3.1 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.0 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.2 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.0 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.0 crate://crates.io/windows_i
 686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.0 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.0 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.0 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.0 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.0 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.0 crate://crates.io/winnow/0.7.13 crate://crates.io/winsafe/0.0.19 crate://crates.io/wiremock/0.6.5 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/wmi/0.16.0 crate://crates.io/writeable/0.6.1 crate://crates.io/xattr/1.5.1 crate://crates.io/xml-rs/0.8.27 crate://crates.io/xmlparser/0.13.6 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yasna/0.5.2 crate://crates.io/yoke/0.8.0 crate://crates.io/yoke-derive/0.8.0 crate://crates.io/zbus/5.8.0 crate://
 crates.io/zbus_macros/5.8.0 crate://crates.io/zbus_names/4.2.0 crate://crates.io/zerocopy/0.8.26 crate://crates.io/zerocopy-derive/0.8.26 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.2 crate://crates.io/zerovec/0.11.2 crate://crates.io/zerovec-derive/0.11.1 crate://crates.io/zip/2.4.2 crate://crates.io/zlib-rs/0.5.1 crate://crates.io/zopfli/0.8.2 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 crate://crates.io/zvariant/5.6.0 crate://crates.io/zvariant_derive/5.6.0 crate://crates.io/zvariant_utils/3.2.0" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.9.25.tar.gz;downloadfilename=uv_build-0.9.25.tar.gz crate://crates.io/addr2line/0.24.2 crate://crates.io/adler2/2.0.1 crate://crates.io/aes/0.8.4 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-id/0.0.7 crat
 e://crates.io/anes/0.1.6 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.11 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.3 crate://crates.io/anstyle-wincon/3.0.9 crate://crates.io/anyhow/1.0.100 crate://crates.io/approx/0.5.1 crate://crates.io/arbitrary/1.4.1 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayref/0.3.9 crate://crates.io/arrayvec/0.7.6 crate://crates.io/assert-json-diff/2.0.2 crate://crates.io/assert_cmd/2.0.17 crate://crates.io/assert_fs/1.1.3 crate://crates.io/astral-pubgrub/0.3.3 crate://crates.io/astral-reqwest-middleware/0.4.2 crate://crates.io/astral-reqwest-retry/0.8.0 crate://crates.io/astral-tl/0.7.11 crate://crates.io/astral-tokio-tar/0.5.6 crate://crates.io/astral-version-ranges/0.1.3 crate://crates.io/astral_async_http_range_reader/0.9.1 crate://crates.io/astral_async_zip/0.0.17 crate://crates.io/async-broadcast/0.7.2 crate://crates.io/async-channel/2.5.0 crate://crates.io/async-compression/0.4.19 crate://cr
 ates.io/async-recursion/1.1.1 crate://crates.io/async-trait/0.1.89 crate://crates.io/atomic-waker/1.1.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/axoasset/1.3.0 crate://crates.io/axoprocess/0.2.1 crate://crates.io/axotag/0.3.0 crate://crates.io/axoupdater/0.9.1 crate://crates.io/backon/1.5.2 crate://crates.io/backtrace/0.3.75 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bisection/0.1.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.9.4 crate://crates.io/blake2/0.10.6 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-padding/0.3.3 crate://crates.io/block2/0.6.2 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.0 crate://crates.io/bumpalo/3.19.0 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytemuck/1.23.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.10.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bz
 ip2-sys/0.1.13+1.0.8 crate://crates.io/camino/1.1.10 crate://crates.io/cargo-util/0.2.24 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.1.2 crate://crates.io/cc/1.2.30 crate://crates.io/cfg-if/1.0.1 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.4.4 crate://crates.io/clap/4.5.53 crate://crates.io/clap_builder/4.5.53 crate://crates.io/clap_complete/4.5.55 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.8 crate://crates.io/clap_derive/4.5.49 crate://crates.io/clap_lex/0.7.5 crate://crates.io/codspeed/4.0.5 crate://crates.io/codspeed-criterion-compat/4.0.5 crate://crates.io/codspeed-criterion-compat-walltime/4.0.5 crate://crates.io/color_quant/1.1.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/colored/2.2.0 crate://crates.io/concurrent-queue/2.5.0 crate://crates.io/configparser/3
 .1.0 crate://crates.io/console/0.15.11 crate://crates.io/console/0.16.1 crate://crates.io/const-oid/0.9.6 crate://crates.io/const-random/0.1.18 crate://crates.io/const-random-macro/0.1.16 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc/3.3.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/criterion-plot/0.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.1.6 crate://crates.io/csv/1.3.1 crate://crates.io/csv-core/0.1.12 crate://crates.io/ctrlc/3.5.1 crate://crates.io/cyclonedx-bom/0.8.0 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/dashmap/6.1.0 crate://crates.io/data-encoding/2.9.0 crate://crates.io/data-url/0.2
 .0 crate://crates.io/deadpool/0.12.3 crate://crates.io/deadpool-runtime/0.1.4 crate://crates.io/deranged/0.5.5 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/diff/0.1.13 crate://crates.io/difflib/0.4.0 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/diskus/0.9.0 crate://crates.io/dispatch2/0.3.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dlv-list/0.5.2 crate://crates.io/doc-comment/0.3.4 crate://crates.io/dotenvy/0.15.7 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.19 crate://crates.io/either/1.15.0 crate://crates.io/embed-manifest/1.5.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/endi/1.1.0 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/env_filter/0.1.3 crate://crates.io/env_home/0.1.0 crate://crates.io/env_logger/0.11.8 crate://crates.io/equiva
 lent/1.0.2 crate://crates.io/erased-serde/0.4.6 crate://crates.io/errno/0.3.13 crate://crates.io/etcetera/0.11.0 crate://crates.io/event-listener/5.4.0 crate://crates.io/event-listener-strategy/0.5.4 crate://crates.io/fastrand/2.3.0 crate://crates.io/fdeflate/0.3.7 crate://crates.io/filetime/0.2.26 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.5 crate://crates.io/float-cmp/0.9.0 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fluent-uri/0.1.4 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/fontconfig-parser/0.5.8 crate://crates.io/fontdb/0.12.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.1.3 crate://crates.io/futures/0.3.31 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.31 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-lite/2.6.0 crate://crates.io/futures-macro/0.3.31 crate://crates.io/fut
 ures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.16 crate://crates.io/getrandom/0.3.3 crate://crates.io/gif/0.12.0 crate://crates.io/gimli/0.31.1 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/globwalk/0.9.1 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/goblin/0.10.4 crate://crates.io/h2/0.4.12 crate://crates.io/half/2.6.0 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/hkdf/0.12.4 crate://crates.io/hmac/0.12.1 crate://crates.io/homedir/0.3.6 crate://crates.io/html-escape/0.2.13 crate://crates.io/http/1.3.1 crate://crates.io/http-body/1.0.1 crate://crates.io/http-body-util/0.1.3 crate://crates.io/http-content-range/0.2.3 crate://crates.io/httparse/1.10.1 crate://cra
 tes.io/httpdate/1.0.3 crate://crates.io/hyper/1.8.1 crate://crates.io/hyper-rustls/0.27.7 crate://crates.io/hyper-util/0.1.19 crate://crates.io/icu_collections/2.0.0 crate://crates.io/icu_locale_core/2.0.0 crate://crates.io/icu_normalizer/2.0.0 crate://crates.io/icu_normalizer_data/2.0.0 crate://crates.io/icu_properties/2.0.1 crate://crates.io/icu_properties_data/2.0.1 crate://crates.io/icu_provider/2.0.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/image/0.25.6 crate://crates.io/imagesize/0.11.0 crate://crates.io/indexmap/2.12.1 crate://crates.io/indicatif/0.18.3 crate://crates.io/indoc/2.0.7 crate://crates.io/inout/0.1.4 crate://crates.io/insta/1.45.0 crate://crates.io/io-uring/0.7.9 crate://crates.io/ipnet/2.11.0 crate://crates.io/iri-string/0.7.8 crate://crates.io/is-docker/0.2.0 crate://crates.io/is-terminal/0.4.16 crate://crates.io/is-wsl/0.4.0 crate://crates.io/is_ci/1.2.0 crate://crates.io/is_terminal_pol
 yfill/1.70.1 crate://crates.io/itertools/0.10.5 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.15 crate://crates.io/jiff/0.2.16 crate://crates.io/jiff-static/0.2.16 crate://crates.io/jiff-tzdb/0.1.4 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.33 crate://crates.io/jpeg-decoder/0.3.2 crate://crates.io/js-sys/0.3.77 crate://crates.io/junction/1.2.0 crate://crates.io/kurbo/0.8.3 crate://crates.io/kurbo/0.9.5 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.178 crate://crates.io/libmimalloc-sys/0.1.44 crate://crates.io/libredox/0.1.6 crate://crates.io/libz-rs-sys/0.5.1 crate://crates.io/linux-raw-sys/0.11.0 crate://crates.io/litemap/0.8.0 crate://crates.io/lock_api/0.4.13 crate://crates.io/log/0.4.27 crate://crates.io/lru-slab/0.1.2 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/markdown/1.0.0 crate://crates.io/matchers/0.2
 .0 crate://crates.io/md-5/0.10.6 crate://crates.io/memchr/2.7.6 crate://crates.io/memmap2/0.5.10 crate://crates.io/memmap2/0.9.7 crate://crates.io/memoffset/0.9.1 crate://crates.io/miette/7.6.0 crate://crates.io/miette-derive/7.6.0 crate://crates.io/mimalloc/0.1.48 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.1.0 crate://crates.io/miow/0.6.1 crate://crates.io/munge/0.4.5 crate://crates.io/munge_macro/0.4.5 crate://crates.io/nanoid/0.4.0 crate://crates.io/nix/0.30.1 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/nu-ansi-term/0.50.1 crate://crates.io/num/0.4.3 crate://crates.io/num-bigint/0.4.6 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.1.0 crate://crates.io/num-integer/0.1.46 crate://crates.io/num-iter/0.1.45 crate://crates.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.19 crate://crates.io/num_cpus/1.17.0 crate://crates.io/objc2/0.6.3 crate://crates.io/objc
 2-encode/4.1.0 crate://crates.io/object/0.36.7 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.1 crate://crates.io/oorandom/11.1.5 crate://crates.io/open/5.3.3 crate://crates.io/openssl-probe/0.1.6 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/4.6.0 crate://crates.io/ordered-multimap/0.7.3 crate://crates.io/ordered-stream/0.2.0 crate://crates.io/os_str_bytes/6.6.1 crate://crates.io/owo-colors/4.2.3 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.4 crate://crates.io/parking_lot_core/0.9.11 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem/3.0.6 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.1 crate://crates.io/pest_derive/2.8.1 crate://crates.io/pest_generator/2.8.1 crate://crates.io/pest_meta/2.8.1 crate://crates.io/petgraph/0.8.3 crate://crates.io/pico-args/0.5.0 crate://crates.io/pin-project/1.1.10 crate://crates.io/pin-pr
 oject-internal/1.1.10 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plain/0.2.3 crate://crates.io/png/0.17.16 crate://crates.io/poloto/19.1.2 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/portable-atomic-util/0.2.4 crate://crates.io/potential_utf/0.1.2 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/predicates/3.1.3 crate://crates.io/predicates-core/1.0.9 crate://crates.io/predicates-tree/1.0.12 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/priority-queue/2.5.0 crate://crates.io/proc-macro-crate/3.3.0 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/procfs/0.18.0 crate://crates.io/procfs-core/0.18.0 crate://crates.io/ptr_meta/0.3.0 crate://crates.io/ptr_meta_derive/0.3.0 crate://crates.io/purl/0.1.6 crate://crates.io/quick-xml/0.38.3 crate://crates.io/quinn/0.11.8 crate://crates.io/quinn-proto/0.11.12 crate://crates.io/quinn-udp
 /0.5.13 crate://crates.io/quote/1.0.42 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.3 crate://crates.io/rayon/1.11.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/rcgen/0.14.5 crate://crates.io/rctree/0.5.0 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/redox_users/0.5.0 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.28 crate://crates.io/regex/1.12.2 crate://crates.io/regex-automata/0.4.13 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/rend/0.5.2 crate://crates.io/reqsign/0.18.1 crate://crates.io/reqsign-aws-v4/2.0.1 crate://crates.io/reqsign-command-execute-tokio/2.0.1 crate://crates.io/reqsign-core/2.0.1 crate://crates.io/reqsign-file-read-tokio/2
 .0.1 crate://crates.io/reqsign-http-send-reqwest/2.0.1 crate://crates.io/reqwest/0.12.22 crate://crates.io/resvg/0.29.0 crate://crates.io/retry-policies/0.5.1 crate://crates.io/rgb/0.8.52 crate://crates.io/ring/0.17.14 crate://crates.io/rkyv/0.8.12 crate://crates.io/rkyv_derive/0.8.12 crate://crates.io/rmp/0.8.14 crate://crates.io/rmp-serde/1.3.0 crate://crates.io/rosvgtree/0.1.0 crate://crates.io/roxmltree/0.18.1 crate://crates.io/roxmltree/0.20.0 crate://crates.io/rust-ini/0.21.3 crate://crates.io/rust-netrc/0.1.2 crate://crates.io/rustc-demangle/0.1.25 crate://crates.io/rustc-hash/2.1.1 crate://crates.io/rustix/1.1.3 crate://crates.io/rustls/0.23.35 crate://crates.io/rustls-native-certs/0.8.2 crate://crates.io/rustls-pki-types/1.12.0 crate://crates.io/rustls-webpki/0.103.8 crate://crates.io/rustversion/1.0.21 crate://crates.io/rustybuzz/0.7.0 crate://crates.io/ryu/1.0.20 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.27 crate://crates.io/schemars/1.0.5 crate://c
 rates.io/schemars_derive/1.0.5 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.0 crate://crates.io/seahash/4.1.0 crate://crates.io/secrecy/0.10.3 crate://crates.io/secret-service/5.0.0 crate://crates.io/security-framework/3.2.0 crate://crates.io/security-framework-sys/2.14.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.26 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.147 crate://crates.io/serde_repr/0.1.20 crate://crates.io/serde_spanned/1.0.4 crate://crates.io/serde_urlencoded/0.7.1 crate://crates.io/serde_yaml/0.9.34+deprecated crate://crates.io/sha1/0.10.6 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-escape/0.1.5 crate://crates.io/shellexpand/3.1.1 crate://crates.io/shlex/1.3.0 cr
 ate://crates.io/signal-hook-registry/1.4.5 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/simplecss/0.2.2 crate://crates.io/siphasher/0.3.11 crate://crates.io/slab/0.4.11 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.5.10 crate://crates.io/socket2/0.6.0 crate://crates.io/spdx/0.10.9 crate://crates.io/spdx/0.13.3 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/static_assertions/1.1.0 crate://crates.io/statrs/0.18.0 crate://crates.io/strict-num/0.1.1 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.26.3 crate://crates.io/strum_macros/0.26.4 crate://crates.io/subtle/2.6.1 crate://crates.io/supports-color/3.0.2 crate://crates.io/supports-hyperlinks/3.1.0 crate://crates.io/supports-unicode/3.0.0 crate://crates.io/svg/0.18.0 crate://crates.io/svgfilters/0.4.0 crate://crates.io/svgtypes/0.9.0 crate://crates.io/svgtypes/0.10.0 crate://crates.io/syn/2.0
 .111 crate://crates.io/sync_wrapper/1.0.2 crate://crates.io/synstructure/0.13.2 crate://crates.io/sys-info/0.9.1 crate://crates.io/system-configuration/0.6.1 crate://crates.io/system-configuration-sys/0.6.0 crate://crates.io/tagu/0.1.6 crate://crates.io/tar/0.4.44 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.24.0 crate://crates.io/terminal_size/0.4.2 crate://crates.io/termtree/0.5.1 crate://crates.io/test-case/3.3.1 crate://crates.io/test-case-core/3.3.1 crate://crates.io/test-case-macros/3.3.1 crate://crates.io/test-log/0.2.18 crate://crates.io/test-log-macros/0.2.18 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.17 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.17 crate://crates.io/thread_local/1.1.9 crate://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 crate://crates.io/tikv-jemallocator/0.6.0 crate://cr
 ates.io/time/0.3.44 crate://crates.io/time-core/0.1.6 crate://crates.io/time-macros/0.2.24 crate://crates.io/tiny-keccak/2.0.2 crate://crates.io/tiny-skia/0.8.4 crate://crates.io/tiny-skia-path/0.8.4 crate://crates.io/tinystr/0.8.1 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.9.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.47.1 crate://crates.io/tokio-macros/2.5.0 crate://crates.io/tokio-rustls/0.26.2 crate://crates.io/tokio-stream/0.1.17 crate://crates.io/tokio-util/0.7.17 crate://crates.io/toml/0.9.10+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.24.0+spec-1.1.0 crate://crates.io/toml_parser/1.0.6+spec-1.1.0 crate://crates.io/toml_writer/1.0.6+spec-1.1.0 crate://crates.io/tower/0.5.2 crate://crates.io/tower-http/0.6.6 crate://crates.io/tower-layer/0.3.3 crate://crates.io/tower-service/0.3.3 crate://crates.io/tracing/0.1.41 
 crate://crates.io/tracing-attributes/0.1.30 crate://crates.io/tracing-core/0.1.34 crate://crates.io/tracing-durations-export/0.3.1 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.20 crate://crates.io/tracing-test/0.2.5 crate://crates.io/tracing-test-macro/0.2.5 crate://crates.io/tracing-tree/0.4.1 crate://crates.io/try-lock/0.2.5 crate://crates.io/ttf-parser/0.18.1 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.18.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/uds_windows/1.1.0 crate://crates.io/unicase/2.8.1 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-bidi-mirroring/0.1.0 crate://crates.io/unicode-ccc/0.1.2 crate://crates.io/unicode-general-category/0.6.0 crate://crates.io/unicode-id/0.3.5 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-script/0.5.7 crate://crates.io/unicode-vo/0.1.0 crate://crates.io/unicode-width/0.1.1
 4 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unit-prefix/0.5.1 crate://crates.io/unsafe-libyaml/0.2.11 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/url/2.5.7 crate://crates.io/usvg/0.29.0 crate://crates.io/usvg-text-layout/0.29.0 crate://crates.io/utf8-width/0.1.7 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.19.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/want/0.3.1 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasite/0.1.0 crate://crates.io/wasm-bindgen/0.2.100 crate://crates.io/wasm-bindgen-backend/0.2.100 crate://crates.io/wasm-bindgen-futures/0.4.50 crate://crates.io/wasm-bindgen-macro/0.2.100 crate://crates.io/wasm-bindgen-macro-support/0.2.100 crate://crates.io/wasm-bindgen-shared/0.2.100 crate://cra
 tes.io/wasm-streams/0.4.2 crate://crates.io/wasmtimer/0.4.2 crate://crates.io/web-sys/0.3.77 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/1.0.2 crate://crates.io/weezl/0.1.10 crate://crates.io/which/8.0.0 crate://crates.io/whoami/1.6.1 crate://crates.io/widestring/1.2.0 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.9 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.59.0 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.59.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.59.0 crate://crates.io/windows-implement/0.60.0 crate://crates.io/windows-interface/0.59.1 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.0 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-registry/0.5.3 crate://crates.io/windows-
 result/0.3.4 crate://crates.io/windows-strings/0.3.1 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.0 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.2 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.0 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.0 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.0 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.0 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.0 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.0 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.5
 3.0 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.0 crate://crates.io/winnow/0.7.13 crate://crates.io/winsafe/0.0.19 crate://crates.io/wiremock/0.6.5 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/wmi/0.16.0 crate://crates.io/writeable/0.6.1 crate://crates.io/xattr/1.5.1 crate://crates.io/xml-rs/0.8.27 crate://crates.io/xmlparser/0.13.6 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yasna/0.5.2 crate://crates.io/yoke/0.8.0 crate://crates.io/yoke-derive/0.8.0 crate://crates.io/zbus/5.8.0 crate://crates.io/zbus_macros/5.8.0 crate://crates.io/zbus_names/4.2.0 crate://crates.io/zerocopy/0.8.26 crate://crates.io/zerocopy-derive/0.8.26 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.2 crate://crates.io/zerovec/0.11.2 crate://crates.io/zerovec-derive/0.11.1 crate://crates.io/zip/2.4.2 crate://crates.io/zlib-rs/0.5.1 crate:
 //crates.io/zmij/0.1.11 crate://crates.io/zopfli/0.8.2 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 crate://crates.io/zvariant/5.6.0 crate://crates.io/zvariant_derive/5.6.0 crate://crates.io/zvariant_utils/3.2.0"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.9.18" to "0.9.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5212235 to 5208139 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.9.18 [default] to 0.9.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info -> /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info, directory renamed /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info/licenses -> /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.13/site-packages/uv_build-0.9.18.dist-info moved to /usr/lib/python3.13/site-packages/uv_build-0.9.25.dist-info

--===============2390711913578222769==--

