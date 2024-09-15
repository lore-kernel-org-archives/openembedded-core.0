Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1ACC3ABAA
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.115637.1726410840563662385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QsvJYRaI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nMwLsnAV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191f61ad711-c98c58be-b441-4abf-9a4c-707c2d6ead0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bLz6LTDZcLHa/SwKZcx4rs6fDNvTMRmC1+mnWYQFpuE=;
	b=QsvJYRaIbYq7w9CRJ98PUTGCC/TnWwEQB0NL+QpGb1Uq7N/8gq08YqzoemiqLLRM
	8/Pb1dMkBNaMmYLAxLKhJMX39ObJ2TiulHMZuyYEnwpmiYIErOJd0HFE92pJBsMYDkA
	0qskz9JEoS0KYXPBtuGRs+SK+B6JBMWDF54dNBzc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bLz6LTDZcLHa/SwKZcx4rs6fDNvTMRmC1+mnWYQFpuE=;
	b=nMwLsnAVCQG+KaO+vpLeAb+iJ0lujGXU3BQrG3yG6MQu8abpZr0GaHaQlP2g0pDV
	QgadwLbNjWDtW2doOE3VmCzAGQwwidMFSWjZw2O4ztcIM+HqWTXayxfLwy5amM8ZXfF
	BN7sNWP7DlOG9x6yBTnymXgdT635aJxAWBzO6uP0=
Content-Type: multipart/mixed; boundary="===============5382107509134007231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 43.0.1 FAILED
Message-ID: <01010191f61ad711-c98c58be-b441-4abf-9a4c-707c2d6ead0c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204523

--===============5382107509134007231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography* to *43.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-42.0.8-43.0.1.patch
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
From d511e1dea4695d82e9b15db5a9ea0a0c37099b53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:27:30 +0000
Subject: [PATCH] python3-cryptography: upgrade 42.0.8 -> 43.0.1

---
 .../python/python3-cryptography-crates.inc    | 130 +++++++-----------
 ...toml-remove-benchmark-disable-option.patch |   8 +-
 ....0.8.bb => python3-cryptography_43.0.1.bb} |   2 +-
 3 files changed, 55 insertions(+), 85 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb => python3-cryptography_43.0.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index dbeda05dc4..319a47dabd 100644
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
+    crate://crates.io/openssl/0.10.66 \
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
+SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
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
index 3eed171ffe..c720793e55 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
+From 49c2da6045c83b8b3358a4bcbececf2a89c1b7f1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index d2e304f..10aabcf 100644
+index e5b801d..985fc8c 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
- 
+@@ -117,7 +117,7 @@ exclude = [
+ ]
  
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
rename to meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
index 3f70f910d4..0ecbd382ac 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
+SRC_URI[sha256sum] = "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.44.0


--===============5382107509134007231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-eff9e048405785e3c60187ae2d5e20873ec588a2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:eff9e048405785e3c60187ae2d5e20873ec588a2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 494 Local 473 Mirrors 0 Missed 21 Current 550 (95% match, 97% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1437 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2314 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_fetch)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2885 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_unpack)
NOTE: Running task 2886 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-43.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_patch)
NOTE: Running task 2888 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2889 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2890 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_rust_create_wrappers)
NOTE: Running task 2891 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_rust_gen_targets)
NOTE: Running task 2892 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_populate_lic)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-43.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-43.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-43.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-43.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2893 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-43.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2895 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-43.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_hooks/_impl.py", line 321, in _call_hook
|     raise BackendUnavailable(data.get('traceback', ''))
| pyproject_hooks._impl.BackendUnavailable: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 77, in _build_backend
|     obj = import_module(mod_path)
|           ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/recipe-sysroot-native/usr/lib/python3.12/importlib/__init__.py", line 90, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1324, in _find_and_load_unlocked
| ModuleNotFoundError: No module named 'maturin'
| 
| ERROR Backend 'maturin' is not available.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/run.do_compile.1456758:190 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/dist /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/cryptography-43.0.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/run.do_compile.1456758, line 190
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/run.do_compile.1456758, line 166
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/run.do_compile.1456758, line 201
NOTE: recipe python3-cryptography-43.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2895 tasks of which 2882 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915082712.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915082712.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_compile
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/log.do_compile.1456758
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-cryptography-43.0.1-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/run.do_compile.1456758' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/43.0.1/temp/log.do_compile.1456758
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb:do_compile) failed with exit code '1'

--===============5382107509134007231==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-42.0.8-43.0.1.patch"

RnJvbSBkNTExZTFkZWE0Njk1ZDgyZTliMTVkYjVhOWVhMGEwYzM3MDk5YjUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6Mjc6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSA0Mi4wLjggLT4gNDMuMC4xCgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDEzMCArKysrKysrLS0t
LS0tLS0tLS0KIC4uLnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8
ICAgOCArLQogLi4uLjAuOC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV80My4wLjEuYmJ9IHwg
ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5XzQyLjAuOC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV80My4wLjEuYmJ9ICg5NSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS1jcmF0ZXMuaW5jCmluZGV4IGRiZWRhMDVkYzQuLjMxOWE0N2RhYmQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LWNyYXRlcy5pbmMKQEAgLTIsMTAxICsyLDcxIEBACiAKICMgZnJvbSBzcmMvcnVz
dC9DYXJnby5sb2NrCiBTUkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjEv
MC4xNS41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8wLjE1LjUgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Jhc2U2NC8wLjIxLjcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzEuMy4yIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjQuMiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY2MvMS4wLjgzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc24xLzAuMTYuMiBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXNuMV9kZXJpdmUvMC4xNi4yIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9hdXRvY2ZnLzEuMy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4y
Mi4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjYuMCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2MvMS4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZm9yZWlnbi10eXBlcy8wLjMuMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZm9yZWlnbi10eXBlcy1zaGFyZWQvMC4xLjEgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2hlY2svMC40LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC40
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNTIgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2xvY2tfYXBpLzAuNC4xMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zmc2V0
LzAuOS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIu
MTU1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQvMC45LjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjE5LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL29w
ZW5zc2wvMC4xMC42NCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC8wLjEwLjY2IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLW1hY3Jvcy8wLjEuMSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vb3BlbnNzbC1zeXMvMC45LjEwMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cGFya2luZ19sb3QvMC4xMi4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXJraW5nX2xvdF9j
b3JlLzAuOS45IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wZW0vMy4wLjMgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3BrZy1jb25maWcvMC4zLjI5IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9w
b3J0YWJsZS1hdG9taWMvMS42LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8y
LzEuMC43OCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIwLjMgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAuMjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHlvMy1mZmkvMC4yMC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jv
cy8wLjIwLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4y
MC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzUgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JlZG94X3N5c2NhbGwvMC40LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Nj
b3BlZ3VhcmQvMS4yLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlbGZfY2VsbC8xLjAuMyBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xMy4xIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zeW4vMi4wLjQ4IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNv
bi8wLjEyLjEzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLXN5cy8wLjkuMTAzIFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9wZW0vMy4wLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3BrZy1jb25maWcvMC4zLjMwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9t
aWMvMS43LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC44NiBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjIyLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5bzMtYnVpbGQtY29uZmlnLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1m
ZmkvMC4yMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjIyLjIgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yMi4yIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Nl
bGZfY2VsbC8xLjAuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC43MSBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMi4xNSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdW5pY29kZS1pZGVudC8xLjAuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vu
aW5kZW50LzAuMi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92Y3BrZy8wLjIuMTUgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtdGFyZ2V0cy8wLjQ4LjUgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLzAuNDguNSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X21zdmMvMC40OC41IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzX2k2ODZfZ251LzAuNDguNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lu
ZG93c19pNjg2X21zdmMvMC40OC41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4
Nl82NF9nbnUvMC40OC41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9n
bnVsbHZtLzAuNDguNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2
Yy8wLjQ4LjUgXAogIgogCi1TUkNfVVJJW2FzbjEtMC4xNS41LnNoYTI1NnN1bV0gPSAiYWUzZWNi
Y2U4OWEyMjYyN2I1ZThlNmUxMWQ2OTcxNTYxNzEzODI5MDI4OWUzODVjZGU3NzNiMWZlNTBiZWZk
YiIKLVNSQ19VUklbYXNuMV9kZXJpdmUtMC4xNS41LnNoYTI1NnN1bV0gPSAiODYxYWY5ODhmYWM0
NjBhYzY5YTA5ZjQxZTYyMTdhOGZiOTE3ODc5N2I3NmZjYzk0Nzg0NDRiZTZhNTliZTE5YyIKLVNS
Q19VUklbYXV0b2NmZy0xLjEuMC5zaGEyNTZzdW1dID0gImQ0Njg4MDJiYWIxN2NiYzBjYzU3NWU5
YjA1M2Y0MWU3MmFhMzZiZmE2YjdmNTVlMzUyOWZmYTQzMTYxYjk3ZmEiCi1TUkNfVVJJW2Jhc2U2
NC0wLjIxLjcuc2hhMjU2c3VtXSA9ICI5ZDI5N2RlYjE5MjViODlmMmNjYzEzZDc2MzVmYTA3MTRm
MTJjODdhZGNlMWM3NTM1NmIzOWNhOWI3MTc4NTY3IgotU1JDX1VSSVtiaXRmbGFncy0xLjMuMi5z
aGEyNTZzdW1dID0gImJlZjM4ZDQ1MTYzYzJmMWRkZTA5NGE3ZGZkMzNjY2Y1OTVjOTI5MDVjOGY4
ZjRmZGMxOGQwNmZiMTAzNzcxOGEiCi1TUkNfVVJJW2JpdGZsYWdzLTIuNC4yLnNoYTI1NnN1bV0g
PSAiZWQ1NzA5MzQ0MDZlYjE2NDM4YTRlOTc2YjFiNDUwMDc3NDA5OWMxM2I4Y2I5NmVlYzk5ZjYy
MGYwNTA5MGRkZiIKLVNSQ19VUklbY2MtMS4wLjgzLnNoYTI1NnN1bV0gPSAiZjExNzRmYjBiNmVj
MjM4NjNmOGI5NzEwMjc4MDRhNDI2MTRlMzQ3ZWFmYjBhOTViZjBiMTJjZGFlMjFmYzRkMCIKK1NS
Q19VUklbYXNuMS0wLjE2LjIuc2hhMjU2c3VtXSA9ICI1MzJjZWRhMDU4MjgxYjYyMDk2YjJhZGQ0
YWIwMGFiM2E0NTNkMzBkZWUyOGI4ODkwZjYyNDYxYTAxMDllYmJkIgorU1JDX1VSSVthc24xX2Rl
cml2ZS0wLjE2LjIuc2hhMjU2c3VtXSA9ICI1NmU2MDc2ZDM4Y2MxN2NjMjJiMGY2NWYzMTE3MGEy
ZWUxOTc1ZTZiMDdmMDAxMjg5M2FlZmQ4NmNlMTljOTg3IgorU1JDX1VSSVthdXRvY2ZnLTEuMy4w
LnNoYTI1NnN1bV0gPSAiMGM0YjRkMGJkMjViZDBiNzQ2ODFjMGFkMjE0OTc2MTBjZTFiN2M5MWIx
MDIyY2QyMWM4MGM2ZmJkZDk0NzZiMCIKK1NSQ19VUklbYmFzZTY0LTAuMjIuMS5zaGEyNTZzdW1d
ID0gIjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1MDhmYmVjYjlkOTFm
NTc1ZTBmYmI4YzYiCitTUkNfVVJJW2JpdGZsYWdzLTIuNi4wLnNoYTI1NnN1bV0gPSAiYjA0OGZi
NjNmZDhiNTkyM2ZjNWFhN2IzNDBkOGUxNTZhZWM3ZWMwMmYwYzc4ZmE4YTZkZGMyNjEzZjZmNzFk
ZSIKK1NSQ19VUklbY2MtMS4xLjYuc2hhMjU2c3VtXSA9ICIyYWJhOGY0ZTk5MDZjN2NlM2M3MzQ2
M2Y2MmE3ZjBjNjUxODNhZGExYTJkNDdlMzk3Y2M4ODEwODI3Zjk2OTRmIgogU1JDX1VSSVtjZmct
aWYtMS4wLjAuc2hhMjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5ZTNjYmMwMTIwZWU1
ODJlYmI3NGI1M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgogU1JDX1VSSVtmb3JlaWduLXR5cGVzLTAu
My4yLnNoYTI1NnN1bV0gPSAiZjZmMzM5ZWI4YWRjMDUyY2QyY2E3ODkxMGZkYTg2OWFlZmEzOGQy
MmQ1Y2I2NDhlNjQ4NWU0ZDNmYzA2ZjNiMSIKIFNSQ19VUklbZm9yZWlnbi10eXBlcy1zaGFyZWQt
MC4xLjEuc2hhMjU2c3VtXSA9ICIwMGIwMjI4NDExOTA4Y2E4Njg1ZGJhN2ZjMmNkZDcwZWM5OTkw
YTZlNzUzZTg5YjZhYzkxYTg0YzQwZmJhZjRiIgotU1JDX1VSSVtoZWNrLTAuNC4xLnNoYTI1NnN1
bV0gPSAiOTU1MDVjMzhiNDU3MmIyZDkxMGNlY2IwMjgxNTYwZjU0YjQ0MGExOTMzNmNiYmNiMjdi
ZjZjZTZhZGM2ZjVhOCIKLVNSQ19VUklbaW5kb2MtMi4wLjQuc2hhMjU2c3VtXSA9ICIxZTE4NmNm
YmFlODA4NGU1MTNkYWZmNDI0MGI0Nzk3ZTM0MmY5ODhjZWNkYTRmYjZjOTM5MTUwZjk2MzE1ZmQ4
IgotU1JDX1VSSVtsaWJjLTAuMi4xNTIuc2hhMjU2c3VtXSA9ICIxM2UzYmY2NTkwY2JjNjQ5ZjRk
MWEzZWVmYzlkNWQ2ZWI3NDZmNTIwMGZmYjA0ZTVlMTQyNzAwYjhmYWE1NmU3IgotU1JDX1VSSVts
b2NrX2FwaS0wLjQuMTEuc2hhMjU2c3VtXSA9ICIzYzE2OGY4NjE1YjEyYmMwMWY5YzE3ZTJlYjBj
YzA3ZGNhZTE5NDAxMjExODU0NDZlZGMzNzQ0OTIwZThlZjQ1IgotU1JDX1VSSVttZW1vZmZzZXQt
MC45LjAuc2hhMjU2c3VtXSA9ICI1YTYzNGIxYzYxYTk1NTg1YmQxNTYwN2M2YWIwYzRlNWIyMjZl
Njk1ZmYyODAwYmEwY2RjY2RkZjIwOGM0MDZjIgorU1JDX1VSSVtoZWNrLTAuNS4wLnNoYTI1NnN1
bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNiNjBhODg0YjVkMzBjMGZjYTdkODJm
ZTMzNDQ5YmJlNTVlYSIKK1NSQ19VUklbaW5kb2MtMi4wLjUuc2hhMjU2c3VtXSA9ICJiMjQ4ZjUy
MjRkMWQ2MDYwMDVlMDJjOTdmNWFhNGU4OGVlYjIzMDQ4OGJjYzAzYmM5Y2E0ZDc5OTEzOTlmMmI1
IgorU1JDX1VSSVtsaWJjLTAuMi4xNTUuc2hhMjU2c3VtXSA9ICI5N2IzODg4YTRhZWNmNzdlODEx
MTQ1Y2FkZjZlZWY1OTAxZjQ3ODJjNTM4ODYxOTFiMmY2OTNmMjQ3NjE4NDdjIgorU1JDX1VSSVtt
ZW1vZmZzZXQtMC45LjEuc2hhMjU2c3VtXSA9ICI0ODgwMTZiZmFlNDU3YjAzNmQ5OTYwOTJmNmNi
NDQ4Njc3NjExY2U0NDQ5ZTk3MGNlYWY0MjY5NTIwM2YyMThhIgogU1JDX1VSSVtvbmNlX2NlbGwt
MS4xOS4wLnNoYTI1NnN1bV0gPSAiM2ZkYjEyYjI0NzZiNTk1ZjkzNThjNTE2MWFhNDY3YzI0Mzg4
NTljYWExMzZkZWM4NmMyNmZkZDJlZmUxN2I5MiIKLVNSQ19VUklbb3BlbnNzbC0wLjEwLjY0LnNo
YTI1NnN1bV0gPSAiOTVhMDQ4MTI4NmEzMTA4MDgyOTgxMzBkMjJkZDFmZWYwZmE1NzFlMDVhOGY0
NGVjODAxODAxZTg0YjIxNmIxZiIKK1NSQ19VUklbb3BlbnNzbC0wLjEwLjY2LnNoYTI1NnN1bV0g
PSAiOTUyOWY0Nzg2YjcwYTNlOGM2MWUxMTE3OWFmMTdhYjYxODhhZDhkMGRlZDc4YzU1Mjk0NDFl
ZDM5ZDRiZDljMSIKIFNSQ19VUklbb3BlbnNzbC1tYWNyb3MtMC4xLjEuc2hhMjU2c3VtXSA9ICJh
OTQ4NjY2YjYzN2EwZjQ2NWU4NTY0YzczZTg5ZDRkZGUwMGQ3MmQ0ZDQ3M2NjOTcyZjM5MGZjM2Rj
ZWU3ZDljIgotU1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTAyLnNoYTI1NnN1bV0gPSAiYzU5NzYz
N2Q1NmZiYzgzODkzYTM1ZWIwZGQwNGIyYjhlN2E1MGM5MWU2NGU5NDkzZTM5OGI1ZGY0ZmI0NWZh
MiIKLVNSQ19VUklbcGFya2luZ19sb3QtMC4xMi4xLnNoYTI1NnN1bV0gPSAiMzc0MmIyYzEwM2I5
ZjA2YmM5ZmZmMGEzN2ZmNDkxMjkzNTg1MWJlZTZkMzZmM2MwMmJjYzc1NWJjZmVjMjI4ZiIKLVNS
Q19VUklbcGFya2luZ19sb3RfY29yZS0wLjkuOS5zaGEyNTZzdW1dID0gIjRjNDJhOTIyNjU0NmQ2
OGFjZGQ5YzBhMjgwZDE3Y2UxOWJmZTI3YTQ2YmY2ODc4NGU0MDY2MTE1Nzg4ZDAwOGUiCi1TUkNf
VVJJW3BlbS0zLjAuMy5zaGEyNTZzdW1dID0gIjFiOGZjYzc5NDAzNTM0N2ZiNjRiZWRhMmQzYjQ2
MjU5NWRkMjc1M2UzZjI2OGQ4OWM1YWFlNzdlOGNmMmMzMTAiCi1TUkNfVVJJW3BrZy1jb25maWct
MC4zLjI5LnNoYTI1NnN1bV0gPSAiMjkwMGVkZTk0ZTMwNTEzMGMxM2RkZDM5MWUwYWI3Y2JhZWI3
ODM5NDVhZTA3YTI3OWMyNjhjYjA1MTA5YzZjYiIKLVNSQ19VUklbcG9ydGFibGUtYXRvbWljLTEu
Ni4wLnNoYTI1NnN1bV0gPSAiNzE3MGVmOTk4OGJjMTY5YmExNmRkMzZhN2ZhMDQxZTVjNGNiZWI2
YTM1Yjc2ZDRjMDNkYWRlZDM3MWVhZTdjMCIKLVNSQ19VUklbcHJvYy1tYWNybzItMS4wLjc4LnNo
YTI1NnN1bV0gPSAiZTI0MjJhZDY0NWQ4OWM5OWY4ZjNlNmI4OGE5ZmRlY2E3ZmFiZWFjODM2YjEw
MDIzNzFjNDM2N2M4Zjk4NGFhZSIKLVNSQ19VUklbcHlvMy0wLjIwLjMuc2hhMjU2c3VtXSA9ICI1
M2JkYmI5NmQ0OTE1N2U2NWQ0NWNjMjg3YWY1ZjMyZmZhZGQ1ZjQ3NjE0MzhiNTI3YjA1NWZiMGQ0
YmI4MjMzIgotU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjIwLjMuc2hhMjU2c3VtXSA9ICJk
ZWFhNTc0NWRlM2Y1MjMxY2UxMDUxN2ExZjVkZDk3ZDUzZTVhMmZkNzdhYTZiNTg0MjI5MjA4NTgz
MWQ0OGQ3IgotU1JDX1VSSVtweW8zLWZmaS0wLjIwLjMuc2hhMjU2c3VtXSA9ICI2MmI0MjUzMWQw
M2UwOGQ0ZWYxZjZlODVhMmVkNDIyZWI2NzhiOGNkNjJiNzYyZTUzODkxYzA1ZmFmMGQ0YWZhIgot
U1JDX1VSSVtweW8zLW1hY3Jvcy0wLjIwLjMuc2hhMjU2c3VtXSA9ICI3MzA1YzcyMGZhMDFiODA1
NWVjOTVlNDg0YTZlY2E3YTgzYzg0MTI2N2YwZGQ1MjgwZjBjOGI4NTUxZDJjMTU4IgotU1JDX1VS
SVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjAuMy5zaGEyNTZzdW1dID0gIjdjN2U5YjY4YmI5YzMx
NDljNWIwY2FkZTVkMDdmOTUzZDZkMTI1ZWI0MzM3NzIzYzRjY2RiNjY1ZjFmOTYxODUiCi1TUkNf
VVJJW3F1b3RlLTEuMC4zNS5zaGEyNTZzdW1dID0gIjI5MWVjOWFiNWVmZDkzNGFhZjUwM2E2NDY2
YzVkNTI1MTUzNWQxMDhlZTc0NzQ3MmMzOTc3Y2M1YWNjODY4ZWYiCi1TUkNfVVJJW3JlZG94X3N5
c2NhbGwtMC40LjEuc2hhMjU2c3VtXSA9ICI0NzIyZDc2OGVmZjQ2Yjc1OTg5ZGQxMzRlNWMzNTNm
MGQ2Mjk2ZTVhYWEzMTMyZTc3NmNiZGI1NmJlNzczMWFhIgotU1JDX1VSSVtzY29wZWd1YXJkLTEu
Mi4wLnNoYTI1NnN1bV0gPSAiOTQxNDNmMzc3MjUxMDlmOTJjMjYyZWQyY2Y1ZTU5YmNlNzQ5OGMw
MWJjYzE1MDJkN2I5YWZlNDM5YTRlOWY0OSIKLVNSQ19VUklbc2VsZl9jZWxsLTEuMC4zLnNoYTI1
NnN1bV0gPSAiNThiZjM3MjMyZDNiYjlhMmM0ZTY0MWNhMmExMWQ4M2I1MDYyMDY2Zjg4ZGY3ZmVk
MzZjMjg3NzIwNDZkNjViYSIKLVNSQ19VUklbc21hbGx2ZWMtMS4xMy4xLnNoYTI1NnN1bV0gPSAi
ZTZlY2QzODRiMTBhNjQ1NDJkNzcwNzFiZDY0YmQ3YjIzMWY0ZWQ1OTQwZmJhNTVlOThjM2RlMTM4
MjRjZjNkNyIKLVNSQ19VUklbc3luLTIuMC40OC5zaGEyNTZzdW1dID0gIjBmMzUzMTYzOGU0MDdk
ZmMwODE0NzYxYWJiN2MwMGE1YjU0OTkyYjg0OTQ1MmEwNjQ2YjdmNjVjOWY3NzBmM2YiCi1TUkNf
VVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTMuc2hhMjU2c3VtXSA9ICI2OTc1OGJkYTJlNzhmMDk4
ZTRjY2IzOTMwMjFhMDk2M2JiMzQ0MmVhYzA1ZjEzNWMzMGY2MWI3MzcwYmJhZmFlIgorU1JDX1VS
SVtvcGVuc3NsLXN5cy0wLjkuMTAzLnNoYTI1NnN1bV0gPSAiN2Y5ZThkZWVlOTFkZjQwYTk0M2M3
MWI5MTdlNTg3NGI5NTFkMzJhODAyNTI2Yzg1NzIxY2UzYjc3NmM5MjlkNiIKK1NSQ19VUklbcGVt
LTMuMC40LnNoYTI1NnN1bV0gPSAiOGU0NTkzNjVlNTkwNzM2YTU0YzNmYTU2MTk0N2M4NDgzNzUz
NGI4ZTlhZjZmYzViZjc4MTMwN2U4MjY1OGZhZSIKK1NSQ19VUklbcGtnLWNvbmZpZy0wLjMuMzAu
c2hhMjU2c3VtXSA9ICJkMjMxYjIzMDkyN2I1ZTRhZDIwM2RiNTdiYmNiZWUyODAyZjZiY2U2MjBi
MWU0YTkwMjRhMDdkOTRlMjkwN2VjIgorU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS43LjAuc2hh
MjU2c3VtXSA9ICJkYTU0NGVlMjE4ZjBkMjg3YTkxMWU5Yzk5YTM5YThjOWJjOGZjYWQzY2I4ZGI1
OTU5OTQwMDQ0ZWNmYzY3MjY1IgorU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuODYuc2hhMjU2c3Vt
XSA9ICI1ZTcxOWU4ZGY2NjVkZjBkMWM4ZmJmZDIzODAxNTc0NDczNjE1MWQ0NDQ1ZWMwODM2Yjhl
NjI4YWFlMTAzYjc3IgorU1JDX1VSSVtweW8zLTAuMjIuMi5zaGEyNTZzdW1dID0gIjgzMWU4ZTgx
OWExMzhjMzZlMjEyZjNhZjNmZDllZWZmZWQ2YmYxNTEwYTgwNWFmMzViMGVkZWU1ZmZhNTk0MzMi
CitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjIuMi5zaGEyNTZzdW1dID0gIjFlODczMGU1
OTFiMTQ0OTJhODk0NWNkZmYzMmYwODkyNTBiMDVmNWFjY2VjZjc0YWVkZGY5ZTgyNzJjZTFmYTgi
CitTUkNfVVJJW3B5bzMtZmZpLTAuMjIuMi5zaGEyNTZzdW1dID0gIjVlOTdlOTE5ZDJkZjkyZWI4
OGNhODBhMDM3OTY5ZjQ0ZTVlNzAzNTY1NTk2NTQ5NjJjYmIzMzE2ZDAwMzAwYzYiCitTUkNfVVJJ
W3B5bzMtbWFjcm9zLTAuMjIuMi5zaGEyNTZzdW1dID0gImViNTc5ODMwMjJhZDQxZjllNjgzYTU5
OWYyZmQxM2MzNjY0ZDcwNjNhM2FjNTcxNGNhZTRiN2JlZTdkM2YyMDYiCitTUkNfVVJJW3B5bzMt
bWFjcm9zLWJhY2tlbmQtMC4yMi4yLnNoYTI1NnN1bV0gPSAiZWM0ODBjMGM1MWRkZWM4MTAxOTUz
MTcwNWFjYWM1MWJjZGJlYWU1NjM1NTdjOTgyYWE4MjYzYmI5Njg4MDM3MiIKK1NSQ19VUklbcXVv
dGUtMS4wLjM2LnNoYTI1NnN1bV0gPSAiMGZhNzZhYWYzOTEwMWM0NTc4MzZhZWMwY2UyMzE2ZGJk
YzNhYjcyM2NkZGExYzZiZDRlNmFkNDIwOGFjYWNhNyIKK1NSQ19VUklbc2VsZl9jZWxsLTEuMC40
LnNoYTI1NnN1bV0gPSAiZDM2OWE5NmY5Nzg2MjNlYjNkYzI4ODA3YzQ4NTJkNmNjNjE3ZmVkNTNk
YTVkM2M0MDBmZWZmMWVmMzRhNzE0YSIKK1NSQ19VUklbc3luLTIuMC43MS5zaGEyNTZzdW1dID0g
ImIxNDZkY2Y3MzA0NzRiNGJjZDE2YzMxMTYyN2IzMWVkZTlhYjE0OTA0NWRiNGQ2MDg4YjNiZWNh
ZWEwNDY0NjIiCitTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTUuc2hhMjU2c3VtXSA9ICI0
ODczMzA3YjdjMjU3ZWRkY2I1MGM5YmVkZjE1OGViNjY5NTc4MzU5ZmIyODQyOGJlZjQzOGZlYzhl
NmJhN2MyIgogU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xMi5zaGEyNTZzdW1dID0gIjMzNTRi
OWFjM2ZhZTFmZjY3NTVjYjZkYjUzNjgzYWRiNjYxNjM0ZjY3NTU3OTQyZGVhNGZhY2ViZWMwZmVl
NGIiCiBTUkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1bV0gPSAiYzdkZTdkNzNlMTc1NDQ4
N2NiNTgzNjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBmYTk5ZWM4YzhmYTJjZSIKIFNSQ19V
UklbdmNwa2ctMC4yLjE1LnNoYTI1NnN1bV0gPSAiYWNjZDRlYTYyZjdiYjdhODJmZTIzMDY2ZmIw
OTU3ZDQ4ZWY2NzdmNmVlYjgyMTVmMzcyZjUyZTQ4YmIzMjQyNiIKLVNSQ19VUklbd2luZG93cy10
YXJnZXRzLTAuNDguNS5zaGEyNTZzdW1dID0gIjlhMmZhNmUyMTU1ZDcyNDdiZTY4YzA5NjQ1NjA4
MzE0NWMxODNjYmJiYzI3NjQxNTBkZGE0NWE4NzE5Nzk0MGMiCi1TUkNfVVJJW3dpbmRvd3NfYWFy
Y2g2NF9nbnVsbHZtLTAuNDguNS5zaGEyNTZzdW1dID0gIjJiMzhlMzJmMGFiY2NmOTk4N2E0ZTMw
NzlkZmI2N2RjZDc5OWZiNjEzNjFlNTNlMjg4MmMzY2JhZjBkOTA1ZDgiCi1TUkNfVVJJW3dpbmRv
d3NfYWFyY2g2NF9tc3ZjLTAuNDguNS5zaGEyNTZzdW1dID0gImRjMzUzMTA5NzFmM2IyZGJiZjNm
MDY5MGEyMTlmNDBlMmQ5YWZjZjY0ZjlhYjdjYzFiZTcyMjkzN2MyNmI0YmMiCi1TUkNfVVJJW3dp
bmRvd3NfaTY4Nl9nbnUtMC40OC41LnNoYTI1NnN1bV0gPSAiYTc1OTE1ZTdkZWY2MGM5NGRjZWY3
MjIwMGI5YThlNThlNTA5MTc0NDk2MGRhNjRlYzczNGE2YzZlOWIzNzQzZSIKLVNSQ19VUklbd2lu
ZG93c19pNjg2X21zdmMtMC40OC41LnNoYTI1NnN1bV0gPSAiOGY1NWMyMzNmNzBjNGIyN2Y2NmM1
MjM1ODBmNzhmMTAwNGU4YjVhOGI2NTllMDVhNGViNDlkNDE2NmNjYTQwNiIKLVNSQ19VUklbd2lu
ZG93c194ODZfNjRfZ251LTAuNDguNS5zaGEyNTZzdW1dID0gIjUzZDQwYWJkMjU4M2QyM2U0NzE4
ZmRkZjFlYmVjODRkYmZmODM4MWMwN2NhZTY3ZmY3NzY4YmJmMTljNjcxOGUiCi1TUkNfVVJJW3dp
bmRvd3NfeDg2XzY0X2dudWxsdm0tMC40OC41LnNoYTI1NnN1bV0gPSAiMGI3YjUyNzY3ODY4YTIz
ZDViYWI3NjhlMzkwZGM1ZjVjNTU4MjViNmQzMGI4NmM4NDRmZjJkYzc0MTQwNDRjYyIKLVNSQ19V
Uklbd2luZG93c194ODZfNjRfbXN2Yy0wLjQ4LjUuc2hhMjU2c3VtXSA9ICJlZDk0ZmNlNjE1NzFh
NDAwNjg1MmI3Mzg5YTA2M2FiOTgzYzAyZWIxYmIzN2I0N2Y4MjcyY2U5MmQwNmQ5NTM4IgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAw
MDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaApp
bmRleCAzZWVkMTcxZmZlLi5jNzIwNzkzZTU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVt
b3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVt
b3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZTRkNzg1NmZlODQyZjNkZjdjNjE0NTU0ZDAwNmQ4MTI1M2E1ZWRmMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNDljMmRhNjA0NWM4M2I4YjMzNThhNGJjYmVjZWNmMmE4OWMxYjdmMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IE1heSAyMDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiByZW1vdmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRp
b24KQEAgLTI2LDExICsyNiwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3Js
aW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwK
LWluZGV4IGQyZTMwNGYuLjEwYWFiY2YgMTAwNjQ0CitpbmRleCBlNWI4MDFkLi45ODVmYzhjIDEw
MDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJvamVjdC50b21sCi1AQCAtOTIs
NyArOTIsNyBAQCBydXN0LXZlcnNpb24gPSAiPj0xLjYzLjAiCi0gCitAQCAtMTE3LDcgKzExNyw3
IEBAIGV4Y2x1ZGUgPSBbCisgXQogIAogIFt0b29sLnB5dGVzdC5pbmlfb3B0aW9uc10KIC1hZGRv
cHRzID0gIi1yIHMgLS1jYXB0dXJlPW5vIC0tc3RyaWN0LW1hcmtlcnMgLS1iZW5jaG1hcmstZGlz
YWJsZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHlfNDIuMC44LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeV80My4wLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV80Mi4w
LjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHlfNDMuMC4xLmJiCmluZGV4IDNmNzBmOTEwZDQuLjBlY2JkMzgyYWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIu
MC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHlfNDMuMC4xLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAgICAgICAg
ICAgICAgICAgICAgIgogTERTSEFSRUQgKz0gIi1wdGhyZWFkIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOGQwOWQwNTQzOWNlN2JhYThlOWU5NWIwN2VjNWI2Yzg4NmY1NDhkZWI3ZTBmNjllZjI1
ZjY0YjNiY2U4NDJmMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMDNlOTJhNzU3MTZkOGNmYjQ5
MWRjNDdjNzllMTdkMGQ5MjA3Y2NmZmNiY2IzNWY1OThmYmU0NjNhZTM0NDRkIgogCiBTUkNfVVJJ
ICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUt
b3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKLS0g
CjIuNDQuMAoK

--===============5382107509134007231==--

