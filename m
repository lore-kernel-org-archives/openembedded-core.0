Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDE810FCAE8
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14638.1775054152474618053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PnF9zy6N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kxCT3RSo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d497908a5-5b6884a2-4997-4bcf-8a9a-93de865e745c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H3Rivba4nzQb6eyRZv0Y2F3xGRJbvi1+W8zsDdNzFTw=;
	b=PnF9zy6NQmizSWbQdNccQMvPwtzN0bn+wW5I9/jzPCYkkbmWcOjdKhcTSiGspObL
	DKH4VWEXFyDGUYUr/HnlMshFrtvxrWqMJhHO/q6U0Jp3GQtrFSkgS8fyBD6oL08Qfy2
	aLXbHlYLKGK9rhaNh6jcJ1kVLpMRY4WvLZ4icAmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H3Rivba4nzQb6eyRZv0Y2F3xGRJbvi1+W8zsDdNzFTw=;
	b=kxCT3RSoHOva8kFru95ykF+T3i6jc0yZhZQycEdzvr/L1lhPR77HYFtTeX1lDuLe
	FKnxSJkeuJJ3TaB4e1ziPvK31/HygOL3YDgAPtsOD/DGx6EzcDgiL0vPRf6ts18LuIa
	zyizGNlooK/sBi2EpMwRxU2k1IfQR5H0k9QFvmtU=
Content-Type: multipart/mixed; boundary="===============6677546369964206476=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.12.6 SUCCEEDED
Message-ID: <0101019d497908a5-5b6884a2-4997-4bcf-8a9a-93de865e745c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234383

--===============6677546369964206476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.12.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.12.4-1.12.6.patch
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
From a23290676988cb5dc595860adb4ec7b3a6ddb4a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 09:57:15 +0000
Subject: [PATCH] python3-maturin: upgrade 1.12.4 -> 1.12.6

---
 .../python/python3-maturin-crates.inc         | 36 +++++++++++++++----
 ...in_1.12.4.bb => python3-maturin_1.12.6.bb} |  2 +-
 2 files changed, 31 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.12.4.bb => python3-maturin_1.12.6.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 0b9ac4dba8..2b5c99e707 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -170,7 +170,7 @@ SRC_URI += " \
     crate://crates.io/litrs/1.0.0 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-rust2/0.13.0 \
+    crate://crates.io/lzma-rust2/0.16.2 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.6 \
     crate://crates.io/mailparse/0.16.1 \
@@ -231,7 +231,7 @@ SRC_URI += " \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/python-pkginfo/0.6.6 \
+    crate://crates.io/python-pkginfo/0.6.8 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
@@ -247,6 +247,7 @@ SRC_URI += " \
     crate://crates.io/redox_users/0.5.2 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
+    crate://crates.io/reflink-copy/0.1.28 \
     crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.3.9 \
     crate://crates.io/regex-automata/0.4.14 \
@@ -347,6 +348,7 @@ SRC_URI += " \
     crate://crates.io/tracing-subscriber/0.3.22 \
     crate://crates.io/trycmd/0.15.11 \
     crate://crates.io/twox-hash/2.1.2 \
+    crate://crates.io/typed-path/0.12.3 \
     crate://crates.io/typenum/1.19.0 \
     crate://crates.io/unicase/2.9.0 \
     crate://crates.io/unicode-bidi/0.3.18 \
@@ -389,7 +391,16 @@ SRC_URI += " \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.62.2 \
+    crate://crates.io/windows-collections/0.3.2 \
+    crate://crates.io/windows-core/0.62.2 \
+    crate://crates.io/windows-future/0.3.2 \
+    crate://crates.io/windows-implement/0.60.2 \
+    crate://crates.io/windows-interface/0.59.3 \
     crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-numerics/0.3.1 \
+    crate://crates.io/windows-result/0.4.1 \
+    crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.59.0 \
@@ -398,6 +409,7 @@ SRC_URI += " \
     crate://crates.io/windows-targets/0.42.2 \
     crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows-threading/0.2.1 \
     crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
@@ -441,7 +453,7 @@ SRC_URI += " \
     crate://crates.io/zerovec/0.11.5 \
     crate://crates.io/zerovec-derive/0.11.2 \
     crate://crates.io/zip/4.6.1 \
-    crate://crates.io/zip/6.0.0 \
+    crate://crates.io/zip/8.1.0 \
     crate://crates.io/zlib-rs/0.6.0 \
     crate://crates.io/zmij/1.0.19 \
     crate://crates.io/zopfli/0.8.3 \
@@ -618,7 +630,7 @@ SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-rust2-0.13.0.sha256sum] = "c60a23ffb90d527e23192f1246b14746e2f7f071cb84476dd879071696c18a4a"
+SRC_URI[lzma-rust2-0.16.2.sha256sum] = "47bb1e988e6fb779cf720ad431242d3f03167c1b3f2b1aae7f1a94b2495b36ae"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.6.sha256sum] = "7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
@@ -679,7 +691,7 @@ SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[python-pkginfo-0.6.6.sha256sum] = "464e5e2e0fb6c8c2c7aedc0cd6615258a3def4e34b417f6bf8835e76e7d441d4"
+SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
@@ -695,6 +707,7 @@ SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00
 SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
+SRC_URI[reflink-copy-0.1.28.sha256sum] = "23bbed272e39c47a095a5242218a67412a220006842558b03fe2935e8f3d7b92"
 SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.3.9.sha256sum] = "59b23e92ee4318893fa3fe3e6fb365258efbfe6ac6ab30f090cdcbb7aa37efa9"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
@@ -795,6 +808,7 @@ SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee
 SRC_URI[tracing-subscriber-0.3.22.sha256sum] = "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
 SRC_URI[trycmd-0.15.11.sha256sum] = "a81ea3136ddc88e19c2cc2eb3176b72abee4e831367cd8949f2a88ac5497e64e"
 SRC_URI[twox-hash-2.1.2.sha256sum] = "9ea3136b675547379c4bd395ca6b938e5ad3c3d20fad76e7fe85f9e0d011419c"
+SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
 SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
 SRC_URI[unicase-2.9.0.sha256sum] = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
 SRC_URI[unicode-bidi-0.3.18.sha256sum] = "5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5"
@@ -837,7 +851,16 @@ SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.62.2.sha256sum] = "527fadee13e0c05939a6a05d5bd6eec6cd2e3dbd648b9f8e447c6518133d8580"
+SRC_URI[windows-collections-0.3.2.sha256sum] = "23b2d95af1a8a14a3c7367e1ed4fc9c20e0a26e79551b1454d72583c97cc6610"
+SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
+SRC_URI[windows-future-0.3.2.sha256sum] = "e1d6f90251fe18a279739e78025bd6ddc52a7e22f921070ccdc67dde84c605cb"
+SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
+SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-numerics-0.3.1.sha256sum] = "6e2e40844ac143cdb44aead537bbf727de9b044e107a0f1220392177d15b0f26"
+SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
+SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
@@ -846,6 +869,7 @@ SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077d
 SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows-threading-0.2.1.sha256sum] = "3949bd5b99cafdf1c7ca86b43ca564028dfe27d66958f2470940f73d86d75b37"
 SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
@@ -889,7 +913,7 @@ SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c7
 SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
 SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
 SRC_URI[zip-4.6.1.sha256sum] = "caa8cd6af31c3b31c6631b8f483848b91589021b28fffe50adada48d4f4d2ed1"
-SRC_URI[zip-6.0.0.sha256sum] = "eb2a05c7c36fde6c09b08576c9f7fb4cda705990f73b58fe011abf7dfb24168b"
+SRC_URI[zip-8.1.0.sha256sum] = "6e499faf5c6b97a0d086f4a8733de6d47aee2252b8127962439d8d4311a73f72"
 SRC_URI[zlib-rs-0.6.0.sha256sum] = "a7948af682ccbc3342b6e9420e8c51c1fe5d7bf7756002b4a3c6cabfe96a7e3c"
 SRC_URI[zmij-1.0.19.sha256sum] = "3ff05f8caa9038894637571ae6b9e29466c1f4f829d26c9b28f869a29cbe3445"
 SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.12.4.bb b/meta/recipes-devtools/python/python3-maturin_1.12.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.12.4.bb
rename to meta/recipes-devtools/python/python3-maturin_1.12.6.bb
index bc4ff1d5c5..aceb981308 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.12.4.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.12.6.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "06f6438be7e723aaf4b412fb34839854b540a1350f7614fadf5bd1db2b98d5f7"
+SRC_URI[sha256sum] = "d37be3a811a7f2ee28a0fa0964187efa50e90f21da0c6135c27787fa0b6a89db"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============6677546369964206476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info

--===============6677546369964206476==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.12.4-1.12.6.patch"

RnJvbSBhMjMyOTA2NzY5ODhjYjVkYzU5NTg2MGFkYjRlYzdiM2E2ZGRiNGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwOTo1NzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWF0dXJpbjogdXBncmFkZSAxLjEyLjQgLT4gMS4xMi42CgotLS0KIC4uLi9weXRob24v
cHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKy0t
LS0KIC4uLmluXzEuMTIuNC5iYiA9PiBweXRob24zLW1hdHVyaW5fMS4xMi42LmJifSB8ICAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXR1cmluXzEuMTIuNC5i
YiA9PiBweXRob24zLW1hdHVyaW5fMS4xMi42LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCmluZGV4
IDBiOWFjNGRiYTguLjJiNWM5OWU3MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmluYwpAQCAtMTcwLDcgKzE3MCw3
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0cnMvMS4wLjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvY2tfYXBpLzAuNC4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbG9nLzAuNC4yOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbHptYS1ydXN0Mi8wLjEz
LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtcnVzdDIvMC4xNi4yIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9sem1hLXN5cy8wLjEuMjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6
eGQvMC4yLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21haWxwYXJzZS8wLjE2LjEgXApAQCAt
MjMxLDcgKzIzMSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHNt
LzAuMS4zMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHVybC8wLjEuNiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlwcm9qZWN0LXRvbWwvMC4xMy43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9weXRob24tcGtnaW5mby8wLjYuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHl0aG9uLXBr
Z2luZm8vMC42LjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40NCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJsZS8wLjUuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vci1lZmkvNS4zLjAgXApAQCAtMjQ3LDYgKzI0Nyw3IEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfdXNlcnMvMC41LjIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JlZi1jYXN0LzEuMC4yNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNh
c3QtaW1wbC8xLjAuMjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZmxpbmstY29weS8wLjEu
MjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LzEuMTIuMyBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmVnZXgtYXV0b21hdGEvMC4zLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Jl
Z2V4LWF1dG9tYXRhLzAuNC4xNCBcCkBAIC0zNDcsNiArMzQ4LDcgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXN1YnNjcmliZXIvMC4zLjIyIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby90cnljbWQvMC4xNS4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dHdveC1oYXNoLzIuMS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90eXBlZC1wYXRoLzAuMTIu
MyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZW51bS8xLjE5LjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3VuaWNhc2UvMi45LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUt
YmlkaS8wLjMuMTggXApAQCAtMzg5LDcgKzM5MSwxNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmFwaS1pNjg2LXBjLXdpbmRvd3MtZ251LzAuNC4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5hcGktdXRpbC8wLjEuMTEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmFwaS14ODZfNjQtcGMtd2luZG93cy1nbnUvMC40LjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3MvMC42Mi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLWNv
bGxlY3Rpb25zLzAuMy4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLWNvcmUvMC42
Mi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLWZ1dHVyZS8wLjMuMiBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1pbXBsZW1lbnQvMC42MC4yIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzLWludGVyZmFjZS8wLjU5LjMgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3MtbGluay8wLjIuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1u
dW1lcmljcy8wLjMuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1yZXN1bHQvMC40
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Mtc3RyaW5ncy8wLjUuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1zeXMvMC40NS4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzLXN5cy8wLjUyLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Mt
c3lzLzAuNTkuMCBcCkBAIC0zOTgsNiArNDA5LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzLXRhcmdldHMvMC40Mi4yIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzLXRhcmdldHMvMC41Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzLXRhcmdldHMvMC41My41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXRocmVh
ZGluZy8wLjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxs
dm0vMC40Mi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfZ251bGx2
bS8wLjUyLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZt
LzAuNTMuMSBcCkBAIC00NDEsNyArNDUzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby96ZXJvdmVjLzAuMTEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb3Zl
Yy1kZXJpdmUvMC4xMS4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96aXAvNC42LjEgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3ppcC82LjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemlw
LzguMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96bGliLXJzLzAuNi4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby96bWlqLzEuMC4xOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vem9wZmxp
LzAuOC4zIFwKQEAgLTYxOCw3ICs2MzAsNyBAQCBTUkNfVVJJW2xpdGVtYXAtMC44LjEuc2hhMjU2
c3VtXSA9ICI2MzczNjA3YTU5ZjBiZTczYTM5YjZmZTQ1NmI4MTkyZmNjMzU4NWY2MDJhZgogU1JD
X1VSSVtsaXRycy0xLjAuMC5zaGEyNTZzdW1dID0gIjExZDNkN2YyNDNkNWM1YThiOWJiNWQ2ZGQy
YjE2MDJjMGNiMGI5ZGIxNjIxYmFmYzdlZDY2ZTM1ZmY5ZmUwOTIiCiBTUkNfVVJJW2xvY2tfYXBp
LTAuNC4xNC5zaGEyNTZzdW1dID0gIjIyNDM5OWU3NGI4N2I1ZjM1NTc1MTFkOThkZmY4YjE0MDg5
YjNkYWRhZmNhYjZiYjkzZWFiNjdkM2FhY2U5NjUiCiBTUkNfVVJJW2xvZy0wLjQuMjkuc2hhMjU2
c3VtXSA9ICI1ZTUwMzJlMjQwMTkwNDVjNzYyZDNjMGYyOGY1YjZiOGJiZjM4NTYzYTY1OTA4Mzg5
YmY3OTc4NzU4OTIwODk3IgotU1JDX1VSSVtsem1hLXJ1c3QyLTAuMTMuMC5zaGEyNTZzdW1dID0g
ImM2MGEyM2ZmYjkwZDUyN2UyMzE5MmYxMjQ2YjE0NzQ2ZTJmN2YwNzFjYjg0NDc2ZGQ4NzkwNzE2
OTZjMThhNGEiCitTUkNfVVJJW2x6bWEtcnVzdDItMC4xNi4yLnNoYTI1NnN1bV0gPSAiNDdiYjFl
OTg4ZTZmYjc3OWNmNzIwYWQ0MzEyNDJkM2YwMzE2N2MxYjNmMmIxYWFlN2YxYTk0YjI0OTViMzZh
ZSIKIFNSQ19VUklbbHptYS1zeXMtMC4xLjIwLnNoYTI1NnN1bV0gPSAiNWZkYTA0YWIzNzY0ZTZj
ZGU3OGI5OTc0ZWVjNGY3NzlhY2FiYTdjNGU4NGIzNmVjYTNjZjc3YzU4MWI4NWQyNyIKIFNSQ19V
UklbbHp4ZC0wLjIuNi5zaGEyNTZzdW1dID0gIjdiMjlkZmZhYjc5NzIxOGUxMmU0ZGYwOGVmNWQx
NWFiOWVmY2EyNTA0MDM4YjFiMzJiOWIzMmZjODQ0YjM5YzkiCiBTUkNfVVJJW21haWxwYXJzZS0w
LjE2LjEuc2hhMjU2c3VtXSA9ICI2MDgxOWE5N2RkY2I4MzFhNTYxNGViM2IwMTc0ZjM2MjBlNzkz
ZTk3ZTA5MTk1YTM5NWJmYTk0OGZkNjhlZDJmIgpAQCAtNjc5LDcgKzY5MSw3IEBAIFNSQ19VUklb
cHJvYy1tYWNybzItMS4wLjEwNi5zaGEyNTZzdW1dID0gIjhmZDAwZjBiYjJlOTBkODFkMTA0NGMy
YjMyNjE3ZjY4ZmNiOWZhCiBTUkNfVVJJW3BzbS0wLjEuMzAuc2hhMjU2c3VtXSA9ICIzODUyNzY2
NDY3ZGY2MzRkNzRmMGIyZDc4MTliZjhkYzQ4M2EwZWIyZTNiMGY1MGY3NTZmOWNmZThiMGQxOGQ4
IgogU1JDX1VSSVtwdXJsLTAuMS42LnNoYTI1NnN1bV0gPSAiNjBlYmU0MjYyYWU5MWRkZDI4Yzg3
MjExMTFhMGE2ZTllNTg4NjBlMjExZmM5MjExNmM0YmI4NWM5OGZkOTZhZCIKIFNSQ19VUklbcHlw
cm9qZWN0LXRvbWwtMC4xMy43LnNoYTI1NnN1bV0gPSAiZjZkNzU1NDgzYWQxNGI0OWU3NjcxM2I1
MjI4NTIzNTQ2MWE1YjRmNzNmMTc2MTIzNTNlMTFhNWRlMzZhNWZkMiIKLVNSQ19VUklbcHl0aG9u
LXBrZ2luZm8tMC42LjYuc2hhMjU2c3VtXSA9ICI0NjRlNWUyZTBmYjZjOGMyYzdhZWRjMGNkNjYx
NTI1OGEzZGVmNGUzNGI0MTdmNmJmODgzNWU3NmU3ZDQ0MWQ0IgorU1JDX1VSSVtweXRob24tcGtn
aW5mby0wLjYuOC5zaGEyNTZzdW1dID0gIjIyOWZlNDc2NDdkNjYwMmI5YjA5MzRiMjFmYWI4YWVj
ZTFjNWE1YWViMGE5MzQxOTZhMTQzNTVmZWM2NTY2MjMiCiBTUkNfVVJJW3F1b3RlLTEuMC40NC5z
aGEyNTZzdW1dID0gIjIxYjJlYmNmNzI3Yjc3NjBjNDYxZjA5MWY5ZjBmNTM5Yjc3YjhlODdmMmZk
ODgxMzFlN2YxYjQzM2IzY2VjZTQiCiBTUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjEuc2hh
MjU2c3VtXSA9ICI2NDBjOWJkODQ5N2IwMjQ2NWFlZWY1Mzc1MTQ0YzI2MDYyZTBkY2Q1OTM5ZGZj
YmIwZjVkYjc2Y2I4YzE3YzczIgogU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0gIjY5
Y2RiMzRjMTU4Y2ViMjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2YzNDY3
NTRiMGYiCkBAIC02OTUsNiArNzA3LDcgQEAgU1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuNy4wLnNo
YTI1NnN1bV0gPSAiNDlmM2ZlMDg4OWU2OWUyYWU5ZTQxZjRkNmM0YzAxODE3MDFkMDAKIFNSQ19V
UklbcmVkb3hfdXNlcnMtMC41LjIuc2hhMjU2c3VtXSA9ICJhNGU2MDhjNjYzOGI5YzE4OTc3YjAw
YjQ3NWFjMWYyOGQxNGU4NGIyN2Q4ZDQyZjcwZTBiZjFlM2RlYzEyN2FjIgogU1JDX1VSSVtyZWYt
Y2FzdC0xLjAuMjUuc2hhMjU2c3VtXSA9ICJmMzU0MzAwYWU2NmY3NmYxYzg1YzVmODQ2OTNmMGNl
ODFkNzQ3ZTJjM2YyMWE0NWZlZjQ5NmQ4OWM5NjBiZjdkIgogU1JDX1VSSVtyZWYtY2FzdC1pbXBs
LTEuMC4yNS5zaGEyNTZzdW1dID0gImI3MTg2MDA2ZGNiMjE5MjA5OTAwOTNmMzBlM2RlYTYzYjdk
NmU5NzdiZjEyNTZiZTIwYzM1NjNhNWRiMDcwZGEiCitTUkNfVVJJW3JlZmxpbmstY29weS0wLjEu
Mjguc2hhMjU2c3VtXSA9ICIyM2JiZWQyNzJlMzljNDdhMDk1YTUyNDIyMThhNjc0MTJhMjIwMDA2
ODQyNTU4YjAzZmUyOTM1ZThmM2Q3YjkyIgogU1JDX1VSSVtyZWdleC0xLjEyLjMuc2hhMjU2c3Vt
XSA9ICJlMTA3NTRhMTRiOTEzN2RkN2IxZTNlNWIwNDkzY2M5MTcxZmRkMTA1ZTBhYjQ3N2Y1MWI3
MmU3ZjNhYzBlMjc2IgogU1JDX1VSSVtyZWdleC1hdXRvbWF0YS0wLjMuOS5zaGEyNTZzdW1dID0g
IjU5YjIzZTkyZWU0MzE4ODkzZmEzZmUzZTZmYjM2NTI1OGVmYmZlNmFjNmFiMzBmMDkwY2RjYmI3
YWEzN2VmYTkiCiBTUkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAuNC4xNC5zaGEyNTZzdW1dID0gIjZl
MWRkNDEyMmZjMTU5NWU4MTYyNjE4OTQ1NDc2ODkyZWVmY2E3Yjg4YzUyODIwZTc0YWY2MjYyMjEz
Y2FlOGYiCkBAIC03OTUsNiArODA4LDcgQEAgU1JDX1VSSVt0cmFjaW5nLXNlcmRlLTAuMi4wLnNo
YTI1NnN1bV0gPSAiNzA0YjFhZWI3YmUwZDBhODRmYzk4MjhjYWU1MWRhYjU5NzBmZWUKIFNSQ19V
UklbdHJhY2luZy1zdWJzY3JpYmVyLTAuMy4yMi5zaGEyNTZzdW1dID0gIjJmMzAxNDM4MjdkZGFi
MGQyNTZmZDg0M2I3YTY2ZDE2NGU5ZjI3MWNmYTBkZGU0OTE0MmM1Y2EwY2EyOTFmMWUiCiBTUkNf
VVJJW3RyeWNtZC0wLjE1LjExLnNoYTI1NnN1bV0gPSAiYTgxZWEzMTM2ZGRjODhlMTljMmNjMmVi
MzE3NmI3MmFiZWU0ZTgzMTM2N2NkODk0OWYyYTg4YWM1NDk3ZTY0ZSIKIFNSQ19VUklbdHdveC1o
YXNoLTIuMS4yLnNoYTI1NnN1bV0gPSAiOWVhMzEzNmI2NzU1NDczNzljNGJkMzk1Y2E2YjkzOGU1
YWQzYzNkMjBmYWQ3NmU3ZmU4NWY5ZTBkMDExNDE5YyIKK1NSQ19VUklbdHlwZWQtcGF0aC0wLjEy
LjMuc2hhMjU2c3VtXSA9ICI4ZTI4Zjg5YjgwYzg3YjhmYjBjZjA0YWI0NDhkNWRkMGRkMGFkZTJm
ODg5MWJhZTg3OGRlNjZhNzVhMjg2MDBlIgogU1JDX1VSSVt0eXBlbnVtLTEuMTkuMC5zaGEyNTZz
dW1dID0gIjU2MmQ0ODEwNjZiZGUwNjU4Mjc2YTM1NDY3YzRhZjAwYmRjNmVlNzI2MzA1Njk4YTU1
Yjg2ZTYxZDdhZDgyYmIiCiBTUkNfVVJJW3VuaWNhc2UtMi45LjAuc2hhMjU2c3VtXSA9ICJkYmM0
YmMzYTlmNzQ2ZDg2MmM0NWNiODlkNzA1YWExMGYxODdiYjk2Yzc2MDAxYWZhYjA3YTBkMzVjZTYw
MTQyIgogU1JDX1VSSVt1bmljb2RlLWJpZGktMC4zLjE4LnNoYTI1NnN1bV0gPSAiNWMxY2I1ZGIz
OTE1Mjg5OGE3OTE2ODk3MTU0M2IxY2I1MDIwZGZmN2ZlNDNjOGRjNDY4YjA4ODVmNWUyOWRmNSIK
QEAgLTgzNyw3ICs4NTEsMTYgQEAgU1JDX1VSSVt3aW5hcGktMC4zLjkuc2hhMjU2c3VtXSA9ICI1
YzgzOWE2NzRmY2Q3YTk4OTUyZTU5MzI0MmVhNDAwYWJlOTM5OTI3NDY3NjEKIFNSQ19VUklbd2lu
YXBpLWk2ODYtcGMtd2luZG93cy1nbnUtMC40LjAuc2hhMjU2c3VtXSA9ICJhYzNiODdjNjM2MjA0
MjZkZDliOTkxZTVjZTAzMjllZmY1NDViY2NiYmIzNGYzYmUwOWZmNmZiNmFiNTFiN2I2IgogU1JD
X1VSSVt3aW5hcGktdXRpbC0wLjEuMTEuc2hhMjU2c3VtXSA9ICJjMmE3YjFjMDNjODc2MTIyYWE0
M2YzMDIwZTZjM2MzZWU1YzA1MDgxYzlhMDA3MzlmYWY3NTAzYWViYTEwZDIyIgogU1JDX1VSSVt3
aW5hcGkteDg2XzY0LXBjLXdpbmRvd3MtZ251LTAuNC4wLnNoYTI1NnN1bV0gPSAiNzEyZTIyNzg0
MWQwNTdjMWVlMWNkMmZiMjJmYTdlNWE1NDYxYWU4ZTQ4ZmEyY2E3OWVjNDJjZmMxOTMxMTgzZiIK
K1NSQ19VUklbd2luZG93cy0wLjYyLjIuc2hhMjU2c3VtXSA9ICI1MjdmYWRlZTEzZTBjMDU5Mzlh
NmEwNWQ1YmQ2ZWVjNmNkMmUzZGJkNjQ4YjlmOGU0NDdjNjUxODEzM2Q4NTgwIgorU1JDX1VSSVt3
aW5kb3dzLWNvbGxlY3Rpb25zLTAuMy4yLnNoYTI1NnN1bV0gPSAiMjNiMmQ5NWFmMWE4YTE0YTNj
NzM2N2UxZWQ0ZmM5YzIwZTBhMjZlNzk1NTFiMTQ1NGQ3MjU4M2M5N2NjNjYxMCIKK1NSQ19VUklb
d2luZG93cy1jb3JlLTAuNjIuMi5zaGEyNTZzdW1dID0gImI4ZTgzYTE0ZDM0ZDA2MjNiNTFkY2U5
NTgxMTk5MzAyYTIyMTg2MzE5NmExZGRlNzFhNzY2M2E0YzJiZTlkZWIiCitTUkNfVVJJW3dpbmRv
d3MtZnV0dXJlLTAuMy4yLnNoYTI1NnN1bV0gPSAiZTFkNmY5MDI1MWZlMThhMjc5NzM5ZTc4MDI1
YmQ2ZGRjNTJhN2UyMmY5MjEwNzBjY2RjNjdkZGU4NGM2MDVjYiIKK1NSQ19VUklbd2luZG93cy1p
bXBsZW1lbnQtMC42MC4yLnNoYTI1NnN1bV0gPSAiMDUzZTJlMDQwYWI1N2I5ZGM5NTFiNzJjMjY0
ODYwZGI3ZWIzYjAyMDBiYTM0NWI0ZTRjM2IxNGY2Nzg1NWRkZiIKK1NSQ19VUklbd2luZG93cy1p
bnRlcmZhY2UtMC41OS4zLnNoYTI1NnN1bV0gPSAiM2YzMTZjNGEyNTcwYmEyNmJiZWM3MjIwMzJj
NDA5OWQ4YzhiYzA5NWVmY2NkYzE1Njg4NzA4NjIzMzY3ZTM1OCIKIFNSQ19VUklbd2luZG93cy1s
aW5rLTAuMi4xLnNoYTI1NnN1bV0gPSAiZjA4MDUyMjJlNTdmNzUyMWQ2YTYyZTM2ZmE5MTYzYmM4
OTFhY2Q0MjJmOTcxZGVmZTk3ZDY0ZTcwZDBhNGZlNSIKK1NSQ19VUklbd2luZG93cy1udW1lcmlj
cy0wLjMuMS5zaGEyNTZzdW1dID0gIjZlMmU0MDg0NGFjMTQzY2RiNDRhZWFkNTM3YmJmNzI3ZGU5
YjA0NGUxMDdhMGYxMjIwMzkyMTc3ZDE1YjBmMjYiCitTUkNfVVJJW3dpbmRvd3MtcmVzdWx0LTAu
NC4xLnNoYTI1NnN1bV0gPSAiNzc4MWZhODllYWY2MDg1MGFjM2QyZGE3YWY4ZTUyNDJhNWVhNzhk
MWExMWM0OWJmMjkxMGJiNWE3Mzg1M2ViNSIKK1NSQ19VUklbd2luZG93cy1zdHJpbmdzLTAuNS4x
LnNoYTI1NnN1bV0gPSAiNzgzN2QwOGY2OWM3N2NmNmIwNzY4OTU0NDUzOGUwMTdjMWJmY2Y1N2Uz
NGI0YzBmZjU4ZTZjMmNkM2IzNzA5MSIKIFNSQ19VUklbd2luZG93cy1zeXMtMC40NS4wLnNoYTI1
NnN1bV0gPSAiNzUyODNiZTVlZmIyODMxZDM3ZWExNDIzNjVmMDA5YzAyZWMyMDNjZDI5YTNlYmVj
YmMwOTNkNTIzMTViNjZkMCIKIFNSQ19VUklbd2luZG93cy1zeXMtMC41Mi4wLnNoYTI1NnN1bV0g
PSAiMjgyYmU1ZjM2YThjZTc4MWZhZDhjOGFlMThmYTNmOWJlZmY1N2VjMWI1MmNiM2RlMDc4OTIw
MTQyNWQ5YTMzZCIKIFNSQ19VUklbd2luZG93cy1zeXMtMC41OS4wLnNoYTI1NnN1bV0gPSAiMWUz
OGJjNGQ3OWVkNjdmZDA3NWJjYzI1MWExYzM5YjMyYTE3NzZiYmU5MmU1YmVmMWYwYmYxZjhjNTMx
ODUzYiIKQEAgLTg0Niw2ICs4NjksNyBAQCBTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNjEuMi5zaGEy
NTZzdW1dID0gImFlMTM3MjI5YmNiZDZjZGYwZjdiODBhMzFkZjYxNzY2MTQ1MDc3ZAogU1JDX1VS
SVt3aW5kb3dzLXRhcmdldHMtMC40Mi4yLnNoYTI1NnN1bV0gPSAiOGU1MTgwYzAwY2Q0NGM5YjFj
ODhhZGIzNjkzMjkxZjFjZDkzNjA1ZGVkODBjMjUwYTc1ZDQ3Mjc1NmI0ZDA3MSIKIFNSQ19VUklb
d2luZG93cy10YXJnZXRzLTAuNTIuNi5zaGEyNTZzdW1dID0gIjliNzI0ZjcyNzk2ZTAzNmFiOTBj
MTAyMWQ0NzgwZDRkM2Q2NDhhY2E1OWU0OTFlNmI5OGU3MjViODRlOTk5NzMiCiBTUkNfVVJJW3dp
bmRvd3MtdGFyZ2V0cy0wLjUzLjUuc2hhMjU2c3VtXSA9ICI0OTQ1ZjlmNTUxYjg4ZTBkNjVmM2Ri
MGJjMjVjMzNiOGFjZWE0ZDllNDExNjNlZGY5MGRjZDBiMTlmOTA2OWYzIgorU1JDX1VSSVt3aW5k
b3dzLXRocmVhZGluZy0wLjIuMS5zaGEyNTZzdW1dID0gIjM5NDliZDViOTljYWZkZjFjN2NhODZi
NDNjYTU2NDAyOGRmZTI3ZDY2OTU4ZjI0NzA5NDBmNzNkODZkNzViMzciCiBTUkNfVVJJW3dpbmRv
d3NfYWFyY2g2NF9nbnVsbHZtLTAuNDIuMi5zaGEyNTZzdW1dID0gIjU5N2E1MTE4NTcwYjY4YmMw
OGQ4ZDU5MTI1MzMyYzU0ZjFiYTlkOWFkZWVkZWVmNWI5OWIwMmJhMmIwNjk4ZjgiCiBTUkNfVVJJ
W3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjMyYTQ2MjIxODBl
N2EwZWMwNDRiYjU1NTQwNGM4MDBiYzlmZDllYzI2MmVjMTQ3ZWRkNTk4OWNjZDBjMDJjZDMiCiBT
UkNfVVJJW3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLTAuNTMuMS5zaGEyNTZzdW1dID0gImE5ZDg0
MTZmYThiNDJmNWM5NDdmODQ4MmM0M2U3ZDg5ZTczYTE3M2NlYWQ1NmQwNDRmNmE1NjEwNGE2ZDFi
NTMiCkBAIC04ODksNyArOTEzLDcgQEAgU1JDX1VSSVt6ZXJvdHJpZS0wLjIuMy5zaGEyNTZzdW1d
ID0gIjJhNTljMTdhNTU2MmQ1MDdlNGI1NDk2MGU4NTY5ZWJlZTMzYmVlODkwYzcKIFNSQ19VUklb
emVyb3ZlYy0wLjExLjUuc2hhMjU2c3VtXSA9ICI2YzI4NzE5Mjk0ODI5NDc3ZjUyNWJlMDE4NmQx
M2VmYTlhM2M2MDJmN2VjMjAyY2E5ZTM1M2QzMTBmYjlhMDAyIgogU1JDX1VSSVt6ZXJvdmVjLWRl
cml2ZS0wLjExLjIuc2hhMjU2c3VtXSA9ICJlYWRjZTM5NTM5Y2E1Y2IzOTg1NTkwMTAyNjcxZjI1
NjdlNjU5ZmNhOTY2NjU4MWFkMzQxMWQ1OTIwNzk1MWYzIgogU1JDX1VSSVt6aXAtNC42LjEuc2hh
MjU2c3VtXSA9ICJjYWE4Y2Q2YWYzMWMzYjMxYzY2MzFiOGY0ODM4NDhiOTE1ODkwMjFiMjhmZmZl
NTBhZGFkYTQ4ZDRmNGQyZWQxIgotU1JDX1VSSVt6aXAtNi4wLjAuc2hhMjU2c3VtXSA9ICJlYjJh
MDVjN2MzNmZkZTZjMDliMDg1NzZjOWY3ZmI0Y2RhNzA1OTkwZjczYjU4ZmUwMTFhYmY3ZGZiMjQx
NjhiIgorU1JDX1VSSVt6aXAtOC4xLjAuc2hhMjU2c3VtXSA9ICI2ZTQ5OWZhZjVjNmI5N2EwZDA4
NmY0YTg3MzNkZTZkNDdhZWUyMjUyYjgxMjc5NjI0MzlkOGQ0MzExYTczZjcyIgogU1JDX1VSSVt6
bGliLXJzLTAuNi4wLnNoYTI1NnN1bV0gPSAiYTc5NDhhZjY4MmNjYmMzMzQyYjZlOTQyMGU4YzUx
YzFmZTVkN2JmNzc1NjAwMmI0YTNjNmNhYmZlOTZhN2UzYyIKIFNSQ19VUklbem1pai0xLjAuMTku
c2hhMjU2c3VtXSA9ICIzZmYwNWY4Y2FhOTAzODg5NDYzNzU3MWFlNmI5ZTI5NDY2YzFmNGY4Mjlk
MjZjOWIyOGY4NjlhMjljYmUzNDQ1IgogU1JDX1VSSVt6b3BmbGktMC44LjMuc2hhMjU2c3VtXSA9
ICJmMDVjZDg3OTdkNjM4NjU0MjVmZjg5YjVjNGE0ODgwNGYzNWJhMGNlOGQxMjU4MDAwMjdhZDYw
MTdkMmI1MjQ5IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW1hdHVyaW5fMS4xMi40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW1hdHVyaW5fMS4xMi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTIuNC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xMi42
LmJiCmluZGV4IGJjNGZmMWQ1YzUuLmFjZWI5ODEzMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTIuNC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjEyLjYuYmIKQEAgLTUsNyAr
NSw3IEBAIExJQ0VOU0UgPSAiTUlUIHwgQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL2xpY2Vuc2UtYXBhY2hlO21kNT0xODM2ZWZiMmViNzc5OTY2Njk2ZjQ3M2VlODU0MDU0
MiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWNlbnNlLW1pdDttZDU9ODVmZDNiNjcw
NjljZmY3ODRkOThlYmZjN2Q1YzA3OTciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNmY2NDM4
YmU3ZTcyM2FhZjRiNDEyZmIzNDgzOTg1NGI1NDBhMTM1MGY3NjE0ZmFkZjViZDFkYjJiOThkNWY3
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQzN2JlM2E4MTFhN2YyZWUyOGEwZmEwOTY0MTg3ZWZh
NTBlOTBmMjFkYTBjNjEzNWMyNzc4N2ZhMGI2YTg5ZGIiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L21h
dHVyaW4tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============6677546369964206476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.12.4.tar.gz;downloadfilename=maturin-1.12.4.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.13 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.101 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arbitrary/1.4.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.19.1 crate://crates.io/byteorder/1.5.0 crate://crates.
 io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.40 crate://crates.io/cargo-cyclonedx/0.5.7 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.7.6 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.19.2 crate://crates.io/cargo-zigbuild/0.22.1 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 crate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.55 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.5.57 crate://crates.io/clap_builder/4.5.57 crate://crates.io/clap_complete/4.5.65 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.10 crate://crates.io/c
 lap_derive/4.5.55 crate://crates.io/clap_lex/0.7.7 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.11 crate://crates.io/console/0.16.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.0 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/cyclonedx-bom/0.8.0 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.7.10 crate://crates
 .io/deranged/0.5.5 crate://crates.io/derive_arbitrary/1.4.2 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.10 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_home/0.1.0 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.3.0 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.1.4 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foreign-types/0.3.2 crate://crate
 s.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.2.2 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://cr
 ates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/0.4.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.13.0 crate://crates.io/indicatif/0.17.11 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.46.3 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.0 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.85 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.4.0 crate://crates.io/libbz2-rs-sys/0.2.2 crate://crates.io/libc/0.2.180 crate://crates.io/libmimalloc-sys/0.1.44 crate://crates.io/libredox/0.1.12 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.1
 1.0 crate://crates.io/litemap/0.8.1 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.13.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/mimalloc/0.1.48 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.15.1 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.8.0 crate://crates.io/native-tls/0.2.14 crate://crates.io/nix/0.31.1 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.0 crate://crates.io/num-traits/0.2.19 crate://crates.io/number_prefix/0.4.0 crate://crates.io/object/0.37.3 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.2 crate://cr
 ates.io/openssl/0.10.75 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.6 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.111 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/4.6.0 crate://crates.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/0.7.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf
 /0.1.4 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.4.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.6 crate://crates.io/quote/1.0.44 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.5 crate://crates.io/rayon/1.11.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscall/0.7.0 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5
  crate://crates.io/regex-syntax/0.8.9 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.1 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.3 crate://crates.io/rustls/0.23.36 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.9 crate://crates.io/rustversion/1.0.22 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.28 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framewor
 k/2.11.1 crate://crates.io/security-framework/3.5.1 crate://crates.io/security-framework-sys/2.15.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.0.4 crate://crates.io/serial_test/3.3.1 crate://crates.io/serial_test_derive/3.3.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.24 crate://crates.io/snapbox-macros/0.4.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.10.9 crate://crates.io/stable_deref_trait/1.2.1 crate://crat
 es.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.26.3 crate://crates.io/strum_macros/0.26.4 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.114 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.44 crate://crates.io/target-lexicon/0.13.4 crate://crates.io/tempfile/3.24.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.3 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.10.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.11+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.i
 o/toml_edit/0.22.27 crate://crates.io/toml_edit/0.23.10+spec-1.0.0 crate://crates.io/toml_edit/0.24.0+spec-1.1.0 crate://crates.io/toml_parser/1.0.6+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.0.6+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.22 crate://crates.io/trycmd/0.15.11 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typenum/1.19.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.22 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-normalization/0.1.25 crate://crates.io/unicode-segmentation/1.12.0 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.2.0 crate://
 crates.io/ureq-proto/0.5.3 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf-8/0.7.6 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.20.0 crate://crates.io/validator/0.16.1 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.2 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasm-bindgen/0.2.108 crate://crates.io/wasm-bindgen-macro/0.2.108 crate://crates.io/wasm-bindgen-macro-support/0.2.108 crate://crates.io/wasm-bindgen-shared/0.2.108 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.6 crate://crates.io/webpki-roots/1.0.6 crate://crates.io/which/8.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/wi
 napi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i6
 86_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.14 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.6.6 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.39 crate://crates.io/zerocopy-derive/0.8.39 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-
 derive/0.1.6 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zip/4.6.1 crate://crates.io/zip/6.0.0 crate://crates.io/zlib-rs/0.6.0 crate://crates.io/zmij/1.0.19 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.12.6.tar.gz;downloadfilename=maturin-1.12.6.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.13 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.101 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arbitrary/1.4.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 
 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.19.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.40 crate://crates.io/cargo-cyclonedx/0.5.7 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.7.6 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.19.2 crate://crates.io/cargo-zigbuild/0.22.1 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 crate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.55 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.10.0 crate
 ://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.5.57 crate://crates.io/clap_builder/4.5.57 crate://crates.io/clap_complete/4.5.65 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.10 crate://crates.io/clap_derive/4.5.55 crate://crates.io/clap_lex/0.7.7 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.11 crate://crates.io/console/0.16.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.0 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/cros
 sbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/cyclonedx-bom/0.8.0 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.7.10 crate://crates.io/deranged/0.5.5 crate://crates.io/derive_arbitrary/1.4.2 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.10 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_home/0.1.0 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://cr
 ates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.3.0 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.1.4 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.2.2 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-ab
 i/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/0.4.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.13.0 crate://crates.io/indicatif/0.17.11 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.46.3 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.0 crate://crates.io/jobserver/0.1.34 crat
 e://crates.io/js-sys/0.3.85 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.4.0 crate://crates.io/libbz2-rs-sys/0.2.2 crate://crates.io/libc/0.2.180 crate://crates.io/libmimalloc-sys/0.1.44 crate://crates.io/libredox/0.1.12 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.11.0 crate://crates.io/litemap/0.8.1 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/mimalloc/0.1.48 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.15.1 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.8.0 crate://crates.io/native-tls/0.2.14 crate://crates.io/nix/0.31.1 crate://crates.io/nom/8.0.0 
 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.0 crate://crates.io/num-traits/0.2.19 crate://crates.io/number_prefix/0.4.0 crate://crates.io/object/0.37.3 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.75 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.6 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.111 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/4.6.0 crate://crates.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/0.7.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io
 /phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.5 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.4 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.4.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.44 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.5 crate://crates.io/rayon/1.11.0 crate://crates.io/rayo
 n-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscall/0.7.0 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.28 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.9 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.1 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.3 crate://crates.io/rustls/0.23.36 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/
 0.103.9 crate://crates.io/rustversion/1.0.22 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.28 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.5.1 crate://crates.io/security-framework-sys/2.15.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.0.4 crate://crates.io/serial_test/3.3.1 crate://crates.io/serial_test_derive/3.3.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 
 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.24 crate://crates.io/snapbox-macros/0.4.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.10.9 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.26.3 crate://crates.io/strum_macros/0.26.4 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.114 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.44 crate://crates.io/target-lexicon/0.13.4 crate://crates.io/tempfile/3.24.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.3 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.
 1.9 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.10.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.11+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.23.10+spec-1.0.0 crate://crates.io/toml_edit/0.24.0+spec-1.1.0 crate://crates.io/toml_parser/1.0.6+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.0.6+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.22 crate://crates.io/trycmd/0.15.11 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.19.0 cr
 ate://crates.io/unicase/2.9.0 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.22 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-normalization/0.1.25 crate://crates.io/unicode-segmentation/1.12.0 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.2.0 crate://crates.io/ureq-proto/0.5.3 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf-8/0.7.6 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.20.0 crate://crates.io/validator/0.16.1 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.2 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.
 0.2+wasi-0.2.9 crate://crates.io/wasm-bindgen/0.2.108 crate://crates.io/wasm-bindgen-macro/0.2.108 crate://crates.io/wasm-bindgen-macro-support/0.2.108 crate://crates.io/wasm-bindgen-shared/0.2.108 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.6 crate://crates.io/webpki-roots/1.0.6 crate://crates.io/which/8.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/wind
 ows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_
 64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.14 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.6.6 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.39 crate://crates.io/zerocopy-derive/0.8.39 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zip/4.
 6.1 crate://crates.io/zip/8.1.0 crate://crates.io/zlib-rs/0.6.0 crate://crates.io/zmij/1.0.19 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6113448 to 6140536 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.12.4 [default] to 1.12.6 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.12.4" to "1.12.6"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14348991 to 14414743 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.12.4.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.12.6.dist-info

--===============6677546369964206476==--

