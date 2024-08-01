Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CED1C531DA
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75748.1722536827204193488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sp37OD2J;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eg3HK3jQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f32142e-053f0249-8956-43f3-a48f-14c0b381492f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KFUyyUuzFHzSh0xjoGF+4LJEfh3aQKBiISKh0RYA/MU=;
	b=Sp37OD2JhOaBQ+3Rgzls6LRHl+Ekoru9RrBgUhGPcKlgXvBRYZOmBCzmH9wdNLT3
	XGdZg4pjNcaJKeB+K7a7He5cDqZYLFgWz8NjDU2l8gqQnxEeP/kwsFqeMCWkXumY5/x
	Lx+CML8e4W93QWDXAQ3Mz4Iwe4h9i6UPpDQi3QyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KFUyyUuzFHzSh0xjoGF+4LJEfh3aQKBiISKh0RYA/MU=;
	b=eg3HK3jQjJHWxF/ZL2gde0WS0GyVfElRtHbAY5LnIjX/Bl0GpapkgITE5kq/HioJ
	IMtLBSWIhiY9SrBoKXLV2FOQUIT2yXezf3uApz3Eext7i7cxnTjDUNa5tLv9dycMPuy
	RTiagejGxBJ62yinSYy2MeRXJWPByNxI4TzYC1TY=
Content-Type: multipart/mixed; boundary="===============6666282186993042782=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 43.0.0 FAILED
Message-ID: <010101910f32142e-053f0249-8956-43f3-a48f-14c0b381492f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202802

--===============6666282186993042782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography* to *43.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-42.0.8-43.0.0.patch
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
From 9b7c415b5a7386fe0c8e8dbd971e157a6c218e37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:26:06 +0000
Subject: [PATCH] python3-cryptography: upgrade 42.0.8 -> 43.0.0

---
 .../python/python3-cryptography-crates.inc    | 130 +++++++-----------
 ...toml-remove-benchmark-disable-option.patch |   8 +-
 ....0.8.bb => python3-cryptography_43.0.0.bb} |   2 +-
 3 files changed, 55 insertions(+), 85 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb => python3-cryptography_43.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index dbeda05dc4..a0f606cb46 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,101 +2,71 @@
 
 # from src/rust/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.15.5 \
-    crate://crates.io/asn1_derive/0.15.5 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.7 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.2 \
-    crate://crates.io/cc/1.0.83 \
+    crate://crates.io/asn1/0.16.2 \
+    crate://crates.io/asn1_derive/0.16.2 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bitflags/2.6.0 \
+    crate://crates.io/cc/1.1.6 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/indoc/2.0.4 \
-    crate://crates.io/libc/0.2.152 \
-    crate://crates.io/lock_api/0.4.11 \
-    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.64 \
+    crate://crates.io/openssl/0.10.65 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.102 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.9 \
-    crate://crates.io/pem/3.0.3 \
-    crate://crates.io/pkg-config/0.3.29 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.78 \
-    crate://crates.io/pyo3/0.20.3 \
-    crate://crates.io/pyo3-build-config/0.20.3 \
-    crate://crates.io/pyo3-ffi/0.20.3 \
-    crate://crates.io/pyo3-macros/0.20.3 \
-    crate://crates.io/pyo3-macros-backend/0.20.3 \
-    crate://crates.io/quote/1.0.35 \
-    crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/self_cell/1.0.3 \
-    crate://crates.io/smallvec/1.13.1 \
-    crate://crates.io/syn/2.0.48 \
-    crate://crates.io/target-lexicon/0.12.13 \
+    crate://crates.io/openssl-sys/0.9.103 \
+    crate://crates.io/pem/3.0.4 \
+    crate://crates.io/pkg-config/0.3.30 \
+    crate://crates.io/portable-atomic/1.7.0 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/pyo3/0.22.2 \
+    crate://crates.io/pyo3-build-config/0.22.2 \
+    crate://crates.io/pyo3-ffi/0.22.2 \
+    crate://crates.io/pyo3-macros/0.22.2 \
+    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/self_cell/1.0.4 \
+    crate://crates.io/syn/2.0.71 \
+    crate://crates.io/target-lexicon/0.12.15 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.48.5 \
 "
 
-SRC_URI[asn1-0.15.5.sha256sum] = "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
-SRC_URI[asn1_derive-0.15.5.sha256sum] = "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
-SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
+SRC_URI[asn1-0.16.2.sha256sum] = "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
+SRC_URI[asn1_derive-0.16.2.sha256sum] = "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
+SRC_URI[cc-1.1.6.sha256sum] = "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
-SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.64.sha256sum] = "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
+SRC_URI[openssl-0.10.65.sha256sum] = "c2823eb4c6453ed64055057ea8bd416eda38c71018723869dd043a3b1186115e"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.102.sha256sum] = "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
-SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
-SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
-SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
-SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
-SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
-SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[self_cell-1.0.3.sha256sum] = "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
-SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
-SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
-SRC_URI[target-lexicon-0.12.13.sha256sum] = "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
+SRC_URI[openssl-sys-0.9.103.sha256sum] = "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
+SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
+SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
+SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
+SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
+SRC_URI[syn-2.0.71.sha256sum] = "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
+SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 3eed171ffe..6f58bbc066 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
+From c6be6605365102329762c1ae8b63698b714ec417 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d2e304f..10aabcf 100644
+index 5f1bcc7..ba02540 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
- 
+@@ -117,7 +117,7 @@ exclude = [
+ ]
  
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb b/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
rename to meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
index 3f70f910d4..7d0b04a7b8 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
+SRC_URI[sha256sum] = "b88075ada2d51aa9f18283532c9f60e72170041bba88d7f37e49cbb10275299e"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.44.0


--===============6666282186993042782==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-42.0.8-43.0.0.patch"

RnJvbSA5YjdjNDE1YjVhNzM4NmZlMGM4ZThkYmQ5NzFlMTU3YTZjMjE4ZTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDoyNjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRlIDQyLjAuOCAtPiA0My4wLjAKCi0tLQogLi4uL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jICAgIHwgMTMwICsrKysrKystLS0t
LS0tLS0tLQogLi4udG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwg
ICA4ICstCiAuLi4uMC44LmJiID0+IHB5dGhvbjMtY3J5cHRvZ3JhcGh5XzQzLjAuMC5iYn0gfCAg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgODUgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlwdG9ncmFw
aHlfNDIuMC44LmJiID0+IHB5dGhvbjMtY3J5cHRvZ3JhcGh5XzQzLjAuMC5iYn0gKDk1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LWNyYXRlcy5pbmMKaW5kZXggZGJlZGEwNWRjNC4uYTBmNjA2Y2I0NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1j
cmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktY3JhdGVzLmluYwpAQCAtMiwxMDEgKzIsNzEgQEAKIAogIyBmcm9tIHNyYy9ydXN0
L0NhcmdvLmxvY2sKIFNSQ19VUkkgKz0gIiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXNuMS8w
LjE1LjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjFfZGVyaXZlLzAuMTUuNSBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
YmFzZTY0LzAuMjEuNyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMS4zLjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuNC4yIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9jYy8xLjAuODMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjEvMC4xNi4yIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8wLjE2LjIgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2F1dG9jZmcvMS4zLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIy
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuNi4wIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9jYy8xLjEuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEuMC4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mb3JlaWduLXR5cGVzLzAuMy4yIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9mb3JlaWduLXR5cGVzLXNoYXJlZC8wLjEuMSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vaGVjay8wLjQuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjQg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE1MiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbG9ja19hcGkvMC40LjExIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQv
MC45LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hlY2svMC41LjAgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2luZG9jLzIuMC41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4x
NTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMTkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3Bl
bnNzbC8wLjEwLjY0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAuMTAuNjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtbWFjcm9zLzAuMS4xIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9vcGVuc3NsLXN5cy8wLjkuMTAyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9w
YXJraW5nX2xvdC8wLjEyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BhcmtpbmdfbG90X2Nv
cmUvMC45LjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BlbS8zLjAuMyBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcGtnLWNvbmZpZy8wLjMuMjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bv
cnRhYmxlLWF0b21pYy8xLjYuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIv
MS4wLjc4IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjAuMyBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yMC4zIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLWZmaS8wLjIwLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9z
LzAuMjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIw
LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4zNSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjQuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2Nv
cGVndWFyZC8xLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VsZl9jZWxsLzEuMC4zIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjEzLjEgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3N5bi8yLjAuNDggXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29u
LzAuMTIuMTMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtc3lzLzAuOS4xMDMgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BlbS8zLjAuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cGtnLWNvbmZpZy8wLjMuMzAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21p
Yy8xLjcuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjg2IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy1idWlsZC1jb25maWcvMC4yMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZm
aS8wLjIyLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjIuMiBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIyLjIgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4zNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2Vs
Zl9jZWxsLzEuMC40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjcxIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEyLjE1IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5p
bmRlbnQvMC4yLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZjcGtnLzAuMi4xNSBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy10YXJnZXRzLzAuNDguNSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0vMC40OC41IFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjQ4LjUgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC40OC41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzX2k2ODZfbXN2Yy8wLjQ4LjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2
XzY0X2dudS8wLjQ4LjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2du
dWxsdm0vMC40OC41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3Zj
LzAuNDguNSBcCiAiCiAKLVNSQ19VUklbYXNuMS0wLjE1LjUuc2hhMjU2c3VtXSA9ICJhZTNlY2Jj
ZTg5YTIyNjI3YjVlOGU2ZTExZDY5NzE1NjE3MTM4MjkwMjg5ZTM4NWNkZTc3M2IxZmU1MGJlZmRi
IgotU1JDX1VSSVthc24xX2Rlcml2ZS0wLjE1LjUuc2hhMjU2c3VtXSA9ICI4NjFhZjk4OGZhYzQ2
MGFjNjlhMDlmNDFlNjIxN2E4ZmI5MTc4Nzk3Yjc2ZmNjOTQ3ODQ0NGJlNmE1OWJlMTljIgotU1JD
X1VSSVthdXRvY2ZnLTEuMS4wLnNoYTI1NnN1bV0gPSAiZDQ2ODgwMmJhYjE3Y2JjMGNjNTc1ZTli
MDUzZjQxZTcyYWEzNmJmYTZiN2Y1NWUzNTI5ZmZhNDMxNjFiOTdmYSIKLVNSQ19VUklbYmFzZTY0
LTAuMjEuNy5zaGEyNTZzdW1dID0gIjlkMjk3ZGViMTkyNWI4OWYyY2NjMTNkNzYzNWZhMDcxNGYx
MmM4N2FkY2UxYzc1MzU2YjM5Y2E5YjcxNzg1NjciCi1TUkNfVVJJW2JpdGZsYWdzLTEuMy4yLnNo
YTI1NnN1bV0gPSAiYmVmMzhkNDUxNjNjMmYxZGRlMDk0YTdkZmQzM2NjZjU5NWM5MjkwNWM4Zjhm
NGZkYzE4ZDA2ZmIxMDM3NzE4YSIKLVNSQ19VUklbYml0ZmxhZ3MtMi40LjIuc2hhMjU2c3VtXSA9
ICJlZDU3MDkzNDQwNmViMTY0MzhhNGU5NzZiMWI0NTAwNzc0MDk5YzEzYjhjYjk2ZWVjOTlmNjIw
ZjA1MDkwZGRmIgotU1JDX1VSSVtjYy0xLjAuODMuc2hhMjU2c3VtXSA9ICJmMTE3NGZiMGI2ZWMy
Mzg2M2Y4Yjk3MTAyNzgwNGE0MjYxNGUzNDdlYWZiMGE5NWJmMGIxMmNkYWUyMWZjNGQwIgorU1JD
X1VSSVthc24xLTAuMTYuMi5zaGEyNTZzdW1dID0gIjUzMmNlZGEwNTgyODFiNjIwOTZiMmFkZDRh
YjAwYWIzYTQ1M2QzMGRlZTI4Yjg4OTBmNjI0NjFhMDEwOWViYmQiCitTUkNfVVJJW2FzbjFfZGVy
aXZlLTAuMTYuMi5zaGEyNTZzdW1dID0gIjU2ZTYwNzZkMzhjYzE3Y2MyMmIwZjY1ZjMxMTcwYTJl
ZTE5NzVlNmIwN2YwMDEyODkzYWVmZDg2Y2UxOWM5ODciCitTUkNfVVJJW2F1dG9jZmctMS4zLjAu
c2hhMjU2c3VtXSA9ICIwYzRiNGQwYmQyNWJkMGI3NDY4MWMwYWQyMTQ5NzYxMGNlMWI3YzkxYjEw
MjJjZDIxYzgwYzZmYmRkOTQ3NmIwIgorU1JDX1VSSVtiYXNlNjQtMC4yMi4xLnNoYTI1NnN1bV0g
PSAiNzJiMzI1NGYxNjI1MWE4MzgxYWExMmU0MGUzYzRkMmYwMTk5ZjhjNjUwOGZiZWNiOWQ5MWY1
NzVlMGZiYjhjNiIKK1NSQ19VUklbYml0ZmxhZ3MtMi42LjAuc2hhMjU2c3VtXSA9ICJiMDQ4ZmI2
M2ZkOGI1OTIzZmM1YWE3YjM0MGQ4ZTE1NmFlYzdlYzAyZjBjNzhmYThhNmRkYzI2MTNmNmY3MWRl
IgorU1JDX1VSSVtjYy0xLjEuNi5zaGEyNTZzdW1dID0gIjJhYmE4ZjRlOTkwNmM3Y2UzYzczNDYz
ZjYyYTdmMGM2NTE4M2FkYTFhMmQ0N2UzOTdjYzg4MTA4MjdmOTY5NGYiCiBTUkNfVVJJW2NmZy1p
Zi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTllM2NiYzAxMjBlZTU4
MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCiBTUkNfVVJJW2ZvcmVpZ24tdHlwZXMtMC4z
LjIuc2hhMjU2c3VtXSA9ICJmNmYzMzllYjhhZGMwNTJjZDJjYTc4OTEwZmRhODY5YWVmYTM4ZDIy
ZDVjYjY0OGU2NDg1ZTRkM2ZjMDZmM2IxIgogU1JDX1VSSVtmb3JlaWduLXR5cGVzLXNoYXJlZC0w
LjEuMS5zaGEyNTZzdW1dID0gIjAwYjAyMjg0MTE5MDhjYTg2ODVkYmE3ZmMyY2RkNzBlYzk5OTBh
NmU3NTNlODliNmFjOTFhODRjNDBmYmFmNGIiCi1TUkNfVVJJW2hlY2stMC40LjEuc2hhMjU2c3Vt
XSA9ICI5NTUwNWMzOGI0NTcyYjJkOTEwY2VjYjAyODE1NjBmNTRiNDQwYTE5MzM2Y2JiY2IyN2Jm
NmNlNmFkYzZmNWE4IgotU1JDX1VSSVtpbmRvYy0yLjAuNC5zaGEyNTZzdW1dID0gIjFlMTg2Y2Zi
YWU4MDg0ZTUxM2RhZmY0MjQwYjQ3OTdlMzQyZjk4OGNlY2RhNGZiNmM5MzkxNTBmOTYzMTVmZDgi
Ci1TUkNfVVJJW2xpYmMtMC4yLjE1Mi5zaGEyNTZzdW1dID0gIjEzZTNiZjY1OTBjYmM2NDlmNGQx
YTNlZWZjOWQ1ZDZlYjc0NmY1MjAwZmZiMDRlNWUxNDI3MDBiOGZhYTU2ZTciCi1TUkNfVVJJW2xv
Y2tfYXBpLTAuNC4xMS5zaGEyNTZzdW1dID0gIjNjMTY4Zjg2MTViMTJiYzAxZjljMTdlMmViMGNj
MDdkY2FlMTk0MDEyMTE4NTQ0NmVkYzM3NDQ5MjBlOGVmNDUiCi1TUkNfVVJJW21lbW9mZnNldC0w
LjkuMC5zaGEyNTZzdW1dID0gIjVhNjM0YjFjNjFhOTU1ODViZDE1NjA3YzZhYjBjNGU1YjIyNmU2
OTVmZjI4MDBiYTBjZGNjZGRmMjA4YzQwNmMiCitTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2c3Vt
XSA9ICIyMzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4MmZl
MzM0NDliYmU1NWVhIgorU1JDX1VSSVtpbmRvYy0yLjAuNS5zaGEyNTZzdW1dID0gImIyNDhmNTIy
NGQxZDYwNjAwNWUwMmM5N2Y1YWE0ZTg4ZWViMjMwNDg4YmNjMDNiYzljYTRkNzk5MTM5OWYyYjUi
CitTUkNfVVJJW2xpYmMtMC4yLjE1NS5zaGEyNTZzdW1dID0gIjk3YjM4ODhhNGFlY2Y3N2U4MTEx
NDVjYWRmNmVlZjU5MDFmNDc4MmM1Mzg4NjE5MWIyZjY5M2YyNDc2MTg0N2MiCitTUkNfVVJJW21l
bW9mZnNldC0wLjkuMS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2Y2I0
NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQyNjk1MjAzZjIxOGEiCiBTUkNfVVJJW29uY2VfY2VsbC0x
LjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0NjdjMjQzODg1
OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgotU1JDX1VSSVtvcGVuc3NsLTAuMTAuNjQuc2hh
MjU2c3VtXSA9ICI5NWEwNDgxMjg2YTMxMDgwODI5ODEzMGQyMmRkMWZlZjBmYTU3MWUwNWE4ZjQ0
ZWM4MDE4MDFlODRiMjE2YjFmIgorU1JDX1VSSVtvcGVuc3NsLTAuMTAuNjUuc2hhMjU2c3VtXSA9
ICJjMjgyM2ViNGM2NDUzZWQ2NDA1NTA1N2VhOGJkNDE2ZWRhMzhjNzEwMTg3MjM4NjlkZDA0M2Ez
YjExODYxMTVlIgogU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gImE5
NDg2NjZiNjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkwZmMzZGNl
ZTdkOWMiCi1TUkNfVVJJW29wZW5zc2wtc3lzLTAuOS4xMDIuc2hhMjU2c3VtXSA9ICJjNTk3NjM3
ZDU2ZmJjODM4OTNhMzVlYjBkZDA0YjJiOGU3YTUwYzkxZTY0ZTk0OTNlMzk4YjVkZjRmYjQ1ZmEy
IgotU1JDX1VSSVtwYXJraW5nX2xvdC0wLjEyLjEuc2hhMjU2c3VtXSA9ICIzNzQyYjJjMTAzYjlm
MDZiYzlmZmYwYTM3ZmY0OTEyOTM1ODUxYmVlNmQzNmYzYzAyYmNjNzU1YmNmZWMyMjhmIgotU1JD
X1VSSVtwYXJraW5nX2xvdF9jb3JlLTAuOS45LnNoYTI1NnN1bV0gPSAiNGM0MmE5MjI2NTQ2ZDY4
YWNkZDljMGEyODBkMTdjZTE5YmZlMjdhNDZiZjY4Nzg0ZTQwNjYxMTU3ODhkMDA4ZSIKLVNSQ19V
UklbcGVtLTMuMC4zLnNoYTI1NnN1bV0gPSAiMWI4ZmNjNzk0MDM1MzQ3ZmI2NGJlZGEyZDNiNDYy
NTk1ZGQyNzUzZTNmMjY4ZDg5YzVhYWU3N2U4Y2YyYzMxMCIKLVNSQ19VUklbcGtnLWNvbmZpZy0w
LjMuMjkuc2hhMjU2c3VtXSA9ICIyOTAwZWRlOTRlMzA1MTMwYzEzZGRkMzkxZTBhYjdjYmFlYjc4
Mzk0NWFlMDdhMjc5YzI2OGNiMDUxMDljNmNiIgotU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS42
LjAuc2hhMjU2c3VtXSA9ICI3MTcwZWY5OTg4YmMxNjliYTE2ZGQzNmE3ZmEwNDFlNWM0Y2JlYjZh
MzViNzZkNGMwM2RhZGVkMzcxZWFlN2MwIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuNzguc2hh
MjU2c3VtXSA9ICJlMjQyMmFkNjQ1ZDg5Yzk5ZjhmM2U2Yjg4YTlmZGVjYTdmYWJlYWM4MzZiMTAw
MjM3MWM0MzY3YzhmOTg0YWFlIgotU1JDX1VSSVtweW8zLTAuMjAuMy5zaGEyNTZzdW1dID0gIjUz
YmRiYjk2ZDQ5MTU3ZTY1ZDQ1Y2MyODdhZjVmMzJmZmFkZDVmNDc2MTQzOGI1MjdiMDU1ZmIwZDRi
YjgyMzMiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjAuMy5zaGEyNTZzdW1dID0gImRl
YWE1NzQ1ZGUzZjUyMzFjZTEwNTE3YTFmNWRkOTdkNTNlNWEyZmQ3N2FhNmI1ODQyMjkyMDg1ODMx
ZDQ4ZDciCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjAuMy5zaGEyNTZzdW1dID0gIjYyYjQyNTMxZDAz
ZTA4ZDRlZjFmNmU4NWEyZWQ0MjJlYjY3OGI4Y2Q2MmI3NjJlNTM4OTFjMDVmYWYwZDRhZmEiCi1T
UkNfVVJJW3B5bzMtbWFjcm9zLTAuMjAuMy5zaGEyNTZzdW1dID0gIjczMDVjNzIwZmEwMWI4MDU1
ZWM5NWU0ODRhNmVjYTdhODNjODQxMjY3ZjBkZDUyODBmMGM4Yjg1NTFkMmMxNTgiCi1TUkNfVVJJ
W3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMC4zLnNoYTI1NnN1bV0gPSAiN2M3ZTliNjhiYjljMzE0
OWM1YjBjYWRlNWQwN2Y5NTNkNmQxMjVlYjQzMzc3MjNjNGNjZGI2NjVmMWY5NjE4NSIKLVNSQ19V
UklbcXVvdGUtMS4wLjM1LnNoYTI1NnN1bV0gPSAiMjkxZWM5YWI1ZWZkOTM0YWFmNTAzYTY0NjZj
NWQ1MjUxNTM1ZDEwOGVlNzQ3NDcyYzM5NzdjYzVhY2M4NjhlZiIKLVNSQ19VUklbcmVkb3hfc3lz
Y2FsbC0wLjQuMS5zaGEyNTZzdW1dID0gIjQ3MjJkNzY4ZWZmNDZiNzU5ODlkZDEzNGU1YzM1M2Yw
ZDYyOTZlNWFhYTMxMzJlNzc2Y2JkYjU2YmU3NzMxYWEiCi1TUkNfVVJJW3Njb3BlZ3VhcmQtMS4y
LjAuc2hhMjU2c3VtXSA9ICI5NDE0M2YzNzcyNTEwOWY5MmMyNjJlZDJjZjVlNTliY2U3NDk4YzAx
YmNjMTUwMmQ3YjlhZmU0MzlhNGU5ZjQ5IgotU1JDX1VSSVtzZWxmX2NlbGwtMS4wLjMuc2hhMjU2
c3VtXSA9ICI1OGJmMzcyMzJkM2JiOWEyYzRlNjQxY2EyYTExZDgzYjUwNjIwNjZmODhkZjdmZWQz
NmMyODc3MjA0NmQ2NWJhIgotU1JDX1VSSVtzbWFsbHZlYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJl
NmVjZDM4NGIxMGE2NDU0MmQ3NzA3MWJkNjRiZDdiMjMxZjRlZDU5NDBmYmE1NWU5OGMzZGUxMzgy
NGNmM2Q3IgotU1JDX1VSSVtzeW4tMi4wLjQ4LnNoYTI1NnN1bV0gPSAiMGYzNTMxNjM4ZTQwN2Rm
YzA4MTQ3NjFhYmI3YzAwYTViNTQ5OTJiODQ5NDUyYTA2NDZiN2Y2NWM5Zjc3MGYzZiIKLVNSQ19V
UklbdGFyZ2V0LWxleGljb24tMC4xMi4xMy5zaGEyNTZzdW1dID0gIjY5NzU4YmRhMmU3OGYwOThl
NGNjYjM5MzAyMWEwOTYzYmIzNDQyZWFjMDVmMTM1YzMwZjYxYjczNzBiYmFmYWUiCitTUkNfVVJJ
W29wZW5zc2wtc3lzLTAuOS4xMDMuc2hhMjU2c3VtXSA9ICI3ZjllOGRlZWU5MWRmNDBhOTQzYzcx
YjkxN2U1ODc0Yjk1MWQzMmE4MDI1MjZjODU3MjFjZTNiNzc2YzkyOWQ2IgorU1JDX1VSSVtwZW0t
My4wLjQuc2hhMjU2c3VtXSA9ICI4ZTQ1OTM2NWU1OTA3MzZhNTRjM2ZhNTYxOTQ3Yzg0ODM3NTM0
YjhlOWFmNmZjNWJmNzgxMzA3ZTgyNjU4ZmFlIgorU1JDX1VSSVtwa2ctY29uZmlnLTAuMy4zMC5z
aGEyNTZzdW1dID0gImQyMzFiMjMwOTI3YjVlNGFkMjAzZGI1N2JiY2JlZTI4MDJmNmJjZTYyMGIx
ZTRhOTAyNGEwN2Q5NGUyOTA3ZWMiCitTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjcuMC5zaGEy
NTZzdW1dID0gImRhNTQ0ZWUyMThmMGQyODdhOTExZTljOTlhMzlhOGM5YmM4ZmNhZDNjYjhkYjU5
NTk5NDAwNDRlY2ZjNjcyNjUiCitTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC44Ni5zaGEyNTZzdW1d
ID0gIjVlNzE5ZThkZjY2NWRmMGQxYzhmYmZkMjM4MDE1NzQ0NzM2MTUxZDQ0NDVlYzA4MzZiOGU2
MjhhYWUxMDNiNzciCitTUkNfVVJJW3B5bzMtMC4yMi4yLnNoYTI1NnN1bV0gPSAiODMxZThlODE5
YTEzOGMzNmUyMTJmM2FmM2ZkOWVlZmZlZDZiZjE1MTBhODA1YWYzNWIwZWRlZTVmZmE1OTQzMyIK
K1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMi4yLnNoYTI1NnN1bV0gPSAiMWU4NzMwZTU5
MWIxNDQ5MmE4OTQ1Y2RmZjMyZjA4OTI1MGIwNWY1YWNjZWNmNzRhZWRkZjllODI3MmNlMWZhOCIK
K1NSQ19VUklbcHlvMy1mZmktMC4yMi4yLnNoYTI1NnN1bV0gPSAiNWU5N2U5MTlkMmRmOTJlYjg4
Y2E4MGEwMzc5NjlmNDRlNWU3MDM1NjU1OTY1NDk2MmNiYjMzMTZkMDAzMDBjNiIKK1NSQ19VUklb
cHlvMy1tYWNyb3MtMC4yMi4yLnNoYTI1NnN1bV0gPSAiZWI1Nzk4MzAyMmFkNDFmOWU2ODNhNTk5
ZjJmZDEzYzM2NjRkNzA2M2EzYWM1NzE0Y2FlNGI3YmVlN2QzZjIwNiIKK1NSQ19VUklbcHlvMy1t
YWNyb3MtYmFja2VuZC0wLjIyLjIuc2hhMjU2c3VtXSA9ICJlYzQ4MGMwYzUxZGRlYzgxMDE5NTMx
NzA1YWNhYzUxYmNkYmVhZTU2MzU1N2M5ODJhYTgyNjNiYjk2ODgwMzcyIgorU1JDX1VSSVtxdW90
ZS0xLjAuMzYuc2hhMjU2c3VtXSA9ICIwZmE3NmFhZjM5MTAxYzQ1NzgzNmFlYzBjZTIzMTZkYmRj
M2FiNzIzY2RkYTFjNmJkNGU2YWQ0MjA4YWNhY2E3IgorU1JDX1VSSVtzZWxmX2NlbGwtMS4wLjQu
c2hhMjU2c3VtXSA9ICJkMzY5YTk2Zjk3ODYyM2ViM2RjMjg4MDdjNDg1MmQ2Y2M2MTdmZWQ1M2Rh
NWQzYzQwMGZlZmYxZWYzNGE3MTRhIgorU1JDX1VSSVtzeW4tMi4wLjcxLnNoYTI1NnN1bV0gPSAi
YjE0NmRjZjczMDQ3NGI0YmNkMTZjMzExNjI3YjMxZWRlOWFiMTQ5MDQ1ZGI0ZDYwODhiM2JlY2Fl
YTA0NjQ2MiIKK1NSQ19VUklbdGFyZ2V0LWxleGljb24tMC4xMi4xNS5zaGEyNTZzdW1dID0gIjQ4
NzMzMDdiN2MyNTdlZGRjYjUwYzliZWRmMTU4ZWI2Njk1NzgzNTlmYjI4NDI4YmVmNDM4ZmVjOGU2
YmE3YzIiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjEyLnNoYTI1NnN1bV0gPSAiMzM1NGI5
YWMzZmFlMWZmNjc1NWNiNmRiNTM2ODNhZGI2NjE2MzRmNjc1NTc5NDJkZWE0ZmFjZWJlYzBmZWU0
YiIKIFNSQ19VUklbdW5pbmRlbnQtMC4yLjMuc2hhMjU2c3VtXSA9ICJjN2RlN2Q3M2UxNzU0NDg3
Y2I1ODM2NGVlOTA2YTQ5OTkzN2EwZGZhYmQ4NmJjYjk4MGZhOTllYzhjOGZhMmNlIgogU1JDX1VS
SVt2Y3BrZy0wLjIuMTUuc2hhMjU2c3VtXSA9ICJhY2NkNGVhNjJmN2JiN2E4MmZlMjMwNjZmYjA5
NTdkNDhlZjY3N2Y2ZWViODIxNWYzNzJmNTJlNDhiYjMyNDI2IgotU1JDX1VSSVt3aW5kb3dzLXRh
cmdldHMtMC40OC41LnNoYTI1NnN1bV0gPSAiOWEyZmE2ZTIxNTVkNzI0N2JlNjhjMDk2NDU2MDgz
MTQ1YzE4M2NiYmJjMjc2NDE1MGRkYTQ1YTg3MTk3OTQwYyIKLVNSQ19VUklbd2luZG93c19hYXJj
aDY0X2dudWxsdm0tMC40OC41LnNoYTI1NnN1bV0gPSAiMmIzOGUzMmYwYWJjY2Y5OTg3YTRlMzA3
OWRmYjY3ZGNkNzk5ZmI2MTM2MWU1M2UyODgyYzNjYmFmMGQ5MDVkOCIKLVNSQ19VUklbd2luZG93
c19hYXJjaDY0X21zdmMtMC40OC41LnNoYTI1NnN1bV0gPSAiZGMzNTMxMDk3MWYzYjJkYmJmM2Yw
NjkwYTIxOWY0MGUyZDlhZmNmNjRmOWFiN2NjMWJlNzIyOTM3YzI2YjRiYyIKLVNSQ19VUklbd2lu
ZG93c19pNjg2X2dudS0wLjQ4LjUuc2hhMjU2c3VtXSA9ICJhNzU5MTVlN2RlZjYwYzk0ZGNlZjcy
MjAwYjlhOGU1OGU1MDkxNzQ0OTYwZGE2NGVjNzM0YTZjNmU5YjM3NDNlIgotU1JDX1VSSVt3aW5k
b3dzX2k2ODZfbXN2Yy0wLjQ4LjUuc2hhMjU2c3VtXSA9ICI4ZjU1YzIzM2Y3MGM0YjI3ZjY2YzUy
MzU4MGY3OGYxMDA0ZThiNWE4YjY1OWUwNWE0ZWI0OWQ0MTY2Y2NhNDA2IgotU1JDX1VSSVt3aW5k
b3dzX3g4Nl82NF9nbnUtMC40OC41LnNoYTI1NnN1bV0gPSAiNTNkNDBhYmQyNTgzZDIzZTQ3MThm
ZGRmMWViZWM4NGRiZmY4MzgxYzA3Y2FlNjdmZjc3NjhiYmYxOWM2NzE4ZSIKLVNSQ19VUklbd2lu
ZG93c194ODZfNjRfZ251bGx2bS0wLjQ4LjUuc2hhMjU2c3VtXSA9ICIwYjdiNTI3Njc4NjhhMjNk
NWJhYjc2OGUzOTBkYzVmNWM1NTgyNWI2ZDMwYjg2Yzg0NGZmMmRjNzQxNDA0NGNjIgotU1JDX1VS
SVt3aW5kb3dzX3g4Nl82NF9tc3ZjLTAuNDguNS5zaGEyNTZzdW1dID0gImVkOTRmY2U2MTU3MWE0
MDA2ODUyYjczODlhMDYzYWI5ODNjMDJlYjFiYjM3YjQ3ZjgyNzJjZTkyZDA2ZDk1MzgiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAw
MS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCmlu
ZGV4IDNlZWQxNzFmZmUuLjZmNThiYmMwNjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1v
dmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1v
dmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBl
NGQ3ODU2ZmU4NDJmM2RmN2M2MTQ1NTRkMDA2ZDgxMjUzYTVlZGYyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBjNmJlNjYwNTM2NTEwMjMyOTc2MmMxYWU4YjYzNjk4YjcxNGVjNDE3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJp
dmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgTWF5IDIwMjIgMTc6MjI6NDggKzA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gcHlwcm9qZWN0LnRvbWw6IHJlbW92ZSAtLWJlbmNobWFyay1kaXNhYmxlIG9wdGlv
bgpAQCAtMjYsMTEgKzI2LDExIEBAIFNpZ25lZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxp
bmdAa29uc3Vsa28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAot
aW5kZXggZDJlMzA0Zi4uMTBhYWJjZiAxMDA2NDQKK2luZGV4IDVmMWJjYzcuLmJhMDI1NDAgMTAw
NjQ0CiAtLS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKLUBAIC05Miw3
ICs5Miw3IEBAIHJ1c3QtdmVyc2lvbiA9ICI+PTEuNjMuMCIKLSAKK0BAIC0xMTcsNyArMTE3LDcg
QEAgZXhjbHVkZSA9IFsKKyBdCiAgCiAgW3Rvb2wucHl0ZXN0LmluaV9vcHRpb25zXQogLWFkZG9w
dHMgPSAiLXIgcyAtLWNhcHR1cmU9bm8gLS1zdHJpY3QtbWFya2VycyAtLWJlbmNobWFyay1kaXNh
YmxlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeV80Mi4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5XzQzLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzQyLjAu
OC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeV80My4wLjAuYmIKaW5kZXggM2Y3MGY5MTBkNC4uN2QwYjA0YTdiOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV80Mi4w
LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeV80My4wLjAuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICAgICAgICAg
ICAgICAgICAgICAiCiBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4ZDA5ZDA1NDM5Y2U3YmFhOGU5ZTk1YjA3ZWM1YjZjODg2ZjU0OGRlYjdlMGY2OWVmMjVm
NjRiM2JjZTg0MmYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4ODA3NWFkYTJkNTFhYTlmMTgy
ODM1MzJjOWY2MGU3MjE3MDA0MWJiYTg4ZDdmMzdlNDljYmIxMDI3NTI5OWUiCiAKIFNSQ19VUkkg
Kz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1v
cHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovL2NoZWNrLW1lbWZyZWUucHkgXAotLSAK
Mi40NC4wCgo=

--===============6666282186993042782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-23d6cfe93cd9321fceb4248835e993a5b1bbe1a9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:23d6cfe93cd9321fceb4248835e993a5b1bbe1a9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 474 Local 453 Mirrors 0 Missed 21 Current 573 (95% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1456 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2383 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_fetch)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2889 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_unpack)
NOTE: Running task 2890 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2891 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_patch)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2892 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2894 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_rust_create_wrappers)
NOTE: Running task 2895 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_rust_gen_targets)
NOTE: Running task 2896 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_populate_lic)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-43.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-43.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-43.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2897 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-43.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2898 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-43.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2899 of 2924 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-43.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_hooks/_impl.py", line 321, in _call_hook
|     raise BackendUnavailable(data.get('traceback', ''))
| pyproject_hooks._impl.BackendUnavailable: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 77, in _build_backend
|     obj = import_module(mod_path)
|           ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/recipe-sysroot-native/usr/lib/python3.12/importlib/__init__.py", line 90, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1324, in _find_and_load_unlocked
| ModuleNotFoundError: No module named 'maturin'
| 
| ERROR Backend 'maturin' is not available.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/run.do_compile.3669490:190 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/dist /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/cryptography-43.0.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/run.do_compile.3669490, line 190
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/run.do_compile.3669490, line 166
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/run.do_compile.3669490, line 201
NOTE: recipe python3-cryptography-43.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2899 tasks of which 2886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801102545.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801102545.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-cryptography-43.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/run.do_compile.3669490', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.0/temp/log.do_compile.3669490
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb:do_compile) failed with exit code '1'

--===============6666282186993042782==--

