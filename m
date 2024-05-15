Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBBFC32719
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1246.1715794338120636303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AICv6d9w;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lEJRn9MG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fde89-325e7a99-bb5a-4886-9cc7-d18d943bd2b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1m/ufKSj6eGQUMoiDOtKybdzp3MutFiGS9qdNK86Wms=;
	b=AICv6d9wwej5axMwf+nTdx5u6Zr3JX+8+i7qQ2SYx6ToLnwNCMinPK9KnaRfZJ+v
	rngEspPA2NNK0+j6Uv9Wflu5SO/8a8yardyF44+9lZN7TlqAwNoKtZ8GQ2Hc3lpJQmg
	XLPJrGZje5/xivP13xakjxOsAVg6Fcb5/+Qxz6Vc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1m/ufKSj6eGQUMoiDOtKybdzp3MutFiGS9qdNK86Wms=;
	b=lEJRn9MGsn5phMhIxvy+IXczc6QiaAampzDRgEe/j4M16FTo7FARVlNtinRSQs1N
	nHn8yvsPlMr6BglZ/7Y9ypgXFSwHSOCOVrt3auwi5lT9rYxsBleDZSuYmrb1Q6OvOyu
	AB2WyTTqssTQr7prqeL+VYX3tHPStR+cStsBYhbI=
Content-Type: multipart/mixed; boundary="===============1932627174948380110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 42.0.7 FAILED
Message-ID: <0101018f7d4fde89-325e7a99-bb5a-4886-9cc7-d18d943bd2b8-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199328

--===============1932627174948380110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *42.0.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-42.0.5-42.0.7.patch
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
From 76d121a6da399d37329d74c20e67e1dc80285e7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:24:59 +0000
Subject: [PATCH] python3-cryptography: upgrade 42.0.5 -> 42.0.7

---
 .../python/python3-cryptography-crates.inc    | 48 -------------------
 ...toml-remove-benchmark-disable-option.patch |  7 +--
 ....0.5.bb => python3-cryptography_42.0.7.bb} |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.5.bb => python3-cryptography_42.0.7.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b26e22b70c..f9b3f0b6fd 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -52,51 +52,3 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
 "
 
-SRC_URI[asn1-0.15.5.sha256sum] = "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
-SRC_URI[asn1_derive-0.15.5.sha256sum] = "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
-SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
-SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
-SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
-SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
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
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index f9c8d1393d..ec4bfcc98b 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b7dd3ce1d75d1e6255e1aca82aa7f401d4246a75 Mon Sep 17 00:00:00 2001
+From 18d78736f5c39784d5151b08fdfdd21c61225686 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index c9a7979bd..dec4b7157 100644
+index 4f0fa36..0d54ea6 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
@@ -38,6 +38,3 @@ index c9a7979bd..dec4b7157 100644
  console_output_style = "progress-even-when-capture-no"
  markers = [
      "skip_fips: this test is not executed in FIPS mode",
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
index 732f925d92..d809f33a01 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da607bfe1"
+SRC_URI[sha256sum] = "ecbfbc00bf55888edda9868a4cf927205de8499e7fabe6c050322298382953f2"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.44.0


--===============1932627174948380110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-42.0.5-42.0.7.patch"

RnJvbSA3NmQxMjFhNmRhMzk5ZDM3MzI5ZDc0YzIwZTY3ZTFkYzgwMjg1ZTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6MjQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSA0Mi4wLjUgLT4gNDIuMC43CgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDQ4IC0tLS0tLS0tLS0t
LS0tLS0tLS0KIC4uLnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8
ICA3ICstLQogLi4uLjAuNS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV80Mi4wLjcuYmJ9IHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0b2dyYXBo
eV80Mi4wLjUuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIuMC43LmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktY3JhdGVzLmluYwppbmRleCBiMjZlMjJiNzBjLi5mOWIzZjBiNmZkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNy
YXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCkBAIC01Miw1MSArNTIsMyBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC40OC41IFwKICIKIAotU1JD
X1VSSVthc24xLTAuMTUuNS5zaGEyNTZzdW1dID0gImFlM2VjYmNlODlhMjI2MjdiNWU4ZTZlMTFk
Njk3MTU2MTcxMzgyOTAyODllMzg1Y2RlNzczYjFmZTUwYmVmZGIiCi1TUkNfVVJJW2FzbjFfZGVy
aXZlLTAuMTUuNS5zaGEyNTZzdW1dID0gIjg2MWFmOTg4ZmFjNDYwYWM2OWEwOWY0MWU2MjE3YThm
YjkxNzg3OTdiNzZmY2M5NDc4NDQ0YmU2YTU5YmUxOWMiCi1TUkNfVVJJW2F1dG9jZmctMS4xLjAu
c2hhMjU2c3VtXSA9ICJkNDY4ODAyYmFiMTdjYmMwY2M1NzVlOWIwNTNmNDFlNzJhYTM2YmZhNmI3
ZjU1ZTM1MjlmZmE0MzE2MWI5N2ZhIgotU1JDX1VSSVtiYXNlNjQtMC4yMS43LnNoYTI1NnN1bV0g
PSAiOWQyOTdkZWIxOTI1Yjg5ZjJjY2MxM2Q3NjM1ZmEwNzE0ZjEyYzg3YWRjZTFjNzUzNTZiMzlj
YTliNzE3ODU2NyIKLVNSQ19VUklbYml0ZmxhZ3MtMS4zLjIuc2hhMjU2c3VtXSA9ICJiZWYzOGQ0
NTE2M2MyZjFkZGUwOTRhN2RmZDMzY2NmNTk1YzkyOTA1YzhmOGY0ZmRjMThkMDZmYjEwMzc3MThh
IgotU1JDX1VSSVtiaXRmbGFncy0yLjQuMi5zaGEyNTZzdW1dID0gImVkNTcwOTM0NDA2ZWIxNjQz
OGE0ZTk3NmIxYjQ1MDA3NzQwOTljMTNiOGNiOTZlZWM5OWY2MjBmMDUwOTBkZGYiCi1TUkNfVVJJ
W2NjLTEuMC44My5zaGEyNTZzdW1dID0gImYxMTc0ZmIwYjZlYzIzODYzZjhiOTcxMDI3ODA0YTQy
NjE0ZTM0N2VhZmIwYTk1YmYwYjEyY2RhZTIxZmM0ZDAiCi1TUkNfVVJJW2NmZy1pZi0xLjAuMC5z
aGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTllM2NiYzAxMjBlZTU4MmViYjc0YjUz
YjRlZmJmNzkxMTdiZDJkYTQwZmQiCi1TUkNfVVJJW2ZvcmVpZ24tdHlwZXMtMC4zLjIuc2hhMjU2
c3VtXSA9ICJmNmYzMzllYjhhZGMwNTJjZDJjYTc4OTEwZmRhODY5YWVmYTM4ZDIyZDVjYjY0OGU2
NDg1ZTRkM2ZjMDZmM2IxIgotU1JDX1VSSVtmb3JlaWduLXR5cGVzLXNoYXJlZC0wLjEuMS5zaGEy
NTZzdW1dID0gIjAwYjAyMjg0MTE5MDhjYTg2ODVkYmE3ZmMyY2RkNzBlYzk5OTBhNmU3NTNlODli
NmFjOTFhODRjNDBmYmFmNGIiCi1TUkNfVVJJW2hlY2stMC40LjEuc2hhMjU2c3VtXSA9ICI5NTUw
NWMzOGI0NTcyYjJkOTEwY2VjYjAyODE1NjBmNTRiNDQwYTE5MzM2Y2JiY2IyN2JmNmNlNmFkYzZm
NWE4IgotU1JDX1VSSVtpbmRvYy0yLjAuNC5zaGEyNTZzdW1dID0gIjFlMTg2Y2ZiYWU4MDg0ZTUx
M2RhZmY0MjQwYjQ3OTdlMzQyZjk4OGNlY2RhNGZiNmM5MzkxNTBmOTYzMTVmZDgiCi1TUkNfVVJJ
W2xpYmMtMC4yLjE1Mi5zaGEyNTZzdW1dID0gIjEzZTNiZjY1OTBjYmM2NDlmNGQxYTNlZWZjOWQ1
ZDZlYjc0NmY1MjAwZmZiMDRlNWUxNDI3MDBiOGZhYTU2ZTciCi1TUkNfVVJJW2xvY2tfYXBpLTAu
NC4xMS5zaGEyNTZzdW1dID0gIjNjMTY4Zjg2MTViMTJiYzAxZjljMTdlMmViMGNjMDdkY2FlMTk0
MDEyMTE4NTQ0NmVkYzM3NDQ5MjBlOGVmNDUiCi1TUkNfVVJJW21lbW9mZnNldC0wLjkuMC5zaGEy
NTZzdW1dID0gIjVhNjM0YjFjNjFhOTU1ODViZDE1NjA3YzZhYjBjNGU1YjIyNmU2OTVmZjI4MDBi
YTBjZGNjZGRmMjA4YzQwNmMiCi1TUkNfVVJJW29uY2VfY2VsbC0xLjE5LjAuc2hhMjU2c3VtXSA9
ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0NjdjMjQzODg1OWNhYTEzNmRlYzg2YzI2ZmRk
MmVmZTE3YjkyIgotU1JDX1VSSVtvcGVuc3NsLTAuMTAuNjMuc2hhMjU2c3VtXSA9ICIxNWM5ZDY5
ZGQ4N2EyOTU2OGQ0ZDAxN2NmZThlYzUxODcwNjA0NmEwNTE4NGU1YWVhOTJkMGFmODkwYjgwM2M4
IgotU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gImE5NDg2NjZiNjM3
YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkwZmMzZGNlZTdkOWMiCi1T
UkNfVVJJW29wZW5zc2wtc3lzLTAuOS45OS5zaGEyNTZzdW1dID0gIjIyZTFiZjIxNDMwNjA5OGU0
ODMyNDYwZjc5NzgyNGMwNWQyNWFhY2RmODk2ZjY0YTk4NWZiMGZkOTkyNDU0YWUiCi1TUkNfVVJJ
W3BhcmtpbmdfbG90LTAuMTIuMS5zaGEyNTZzdW1dID0gIjM3NDJiMmMxMDNiOWYwNmJjOWZmZjBh
MzdmZjQ5MTI5MzU4NTFiZWU2ZDM2ZjNjMDJiY2M3NTViY2ZlYzIyOGYiCi1TUkNfVVJJW3Bhcmtp
bmdfbG90X2NvcmUtMC45Ljkuc2hhMjU2c3VtXSA9ICI0YzQyYTkyMjY1NDZkNjhhY2RkOWMwYTI4
MGQxN2NlMTliZmUyN2E0NmJmNjg3ODRlNDA2NjExNTc4OGQwMDhlIgotU1JDX1VSSVtwZW0tMy4w
LjMuc2hhMjU2c3VtXSA9ICIxYjhmY2M3OTQwMzUzNDdmYjY0YmVkYTJkM2I0NjI1OTVkZDI3NTNl
M2YyNjhkODljNWFhZTc3ZThjZjJjMzEwIgotU1JDX1VSSVtwa2ctY29uZmlnLTAuMy4yOS5zaGEy
NTZzdW1dID0gIjI5MDBlZGU5NGUzMDUxMzBjMTNkZGQzOTFlMGFiN2NiYWViNzgzOTQ1YWUwN2Ey
NzljMjY4Y2IwNTEwOWM2Y2IiCi1TUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjYuMC5zaGEyNTZz
dW1dID0gIjcxNzBlZjk5ODhiYzE2OWJhMTZkZDM2YTdmYTA0MWU1YzRjYmViNmEzNWI3NmQ0YzAz
ZGFkZWQzNzFlYWU3YzAiCi1TUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC43OC5zaGEyNTZzdW1dID0g
ImUyNDIyYWQ2NDVkODljOTlmOGYzZTZiODhhOWZkZWNhN2ZhYmVhYzgzNmIxMDAyMzcxYzQzNjdj
OGY5ODRhYWUiCi1TUkNfVVJJW3B5bzMtMC4yMC4zLnNoYTI1NnN1bV0gPSAiNTNiZGJiOTZkNDkx
NTdlNjVkNDVjYzI4N2FmNWYzMmZmYWRkNWY0NzYxNDM4YjUyN2IwNTVmYjBkNGJiODIzMyIKLVNS
Q19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMC4zLnNoYTI1NnN1bV0gPSAiZGVhYTU3NDVkZTNm
NTIzMWNlMTA1MTdhMWY1ZGQ5N2Q1M2U1YTJmZDc3YWE2YjU4NDIyOTIwODU4MzFkNDhkNyIKLVNS
Q19VUklbcHlvMy1mZmktMC4yMC4zLnNoYTI1NnN1bV0gPSAiNjJiNDI1MzFkMDNlMDhkNGVmMWY2
ZTg1YTJlZDQyMmViNjc4YjhjZDYyYjc2MmU1Mzg5MWMwNWZhZjBkNGFmYSIKLVNSQ19VUklbcHlv
My1tYWNyb3MtMC4yMC4zLnNoYTI1NnN1bV0gPSAiNzMwNWM3MjBmYTAxYjgwNTVlYzk1ZTQ4NGE2
ZWNhN2E4M2M4NDEyNjdmMGRkNTI4MGYwYzhiODU1MWQyYzE1OCIKLVNSQ19VUklbcHlvMy1tYWNy
b3MtYmFja2VuZC0wLjIwLjMuc2hhMjU2c3VtXSA9ICI3YzdlOWI2OGJiOWMzMTQ5YzViMGNhZGU1
ZDA3Zjk1M2Q2ZDEyNWViNDMzNzcyM2M0Y2NkYjY2NWYxZjk2MTg1IgotU1JDX1VSSVtxdW90ZS0x
LjAuMzUuc2hhMjU2c3VtXSA9ICIyOTFlYzlhYjVlZmQ5MzRhYWY1MDNhNjQ2NmM1ZDUyNTE1MzVk
MTA4ZWU3NDc0NzJjMzk3N2NjNWFjYzg2OGVmIgotU1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuNC4x
LnNoYTI1NnN1bV0gPSAiNDcyMmQ3NjhlZmY0NmI3NTk4OWRkMTM0ZTVjMzUzZjBkNjI5NmU1YWFh
MzEzMmU3NzZjYmRiNTZiZTc3MzFhYSIKLVNSQ19VUklbc2NvcGVndWFyZC0xLjIuMC5zaGEyNTZz
dW1dID0gIjk0MTQzZjM3NzI1MTA5ZjkyYzI2MmVkMmNmNWU1OWJjZTc0OThjMDFiY2MxNTAyZDdi
OWFmZTQzOWE0ZTlmNDkiCi1TUkNfVVJJW3NlbGZfY2VsbC0xLjAuMy5zaGEyNTZzdW1dID0gIjU4
YmYzNzIzMmQzYmI5YTJjNGU2NDFjYTJhMTFkODNiNTA2MjA2NmY4OGRmN2ZlZDM2YzI4NzcyMDQ2
ZDY1YmEiCi1TUkNfVVJJW3NtYWxsdmVjLTEuMTMuMS5zaGEyNTZzdW1dID0gImU2ZWNkMzg0YjEw
YTY0NTQyZDc3MDcxYmQ2NGJkN2IyMzFmNGVkNTk0MGZiYTU1ZTk4YzNkZTEzODI0Y2YzZDciCi1T
UkNfVVJJW3N5bi0yLjAuNDguc2hhMjU2c3VtXSA9ICIwZjM1MzE2MzhlNDA3ZGZjMDgxNDc2MWFi
YjdjMDBhNWI1NDk5MmI4NDk0NTJhMDY0NmI3ZjY1YzlmNzcwZjNmIgotU1JDX1VSSVt0YXJnZXQt
bGV4aWNvbi0wLjEyLjEzLnNoYTI1NnN1bV0gPSAiNjk3NThiZGEyZTc4ZjA5OGU0Y2NiMzkzMDIx
YTA5NjNiYjM0NDJlYWMwNWYxMzVjMzBmNjFiNzM3MGJiYWZhZSIKLVNSQ19VUklbdW5pY29kZS1p
ZGVudC0xLjAuMTIuc2hhMjU2c3VtXSA9ICIzMzU0YjlhYzNmYWUxZmY2NzU1Y2I2ZGI1MzY4M2Fk
YjY2MTYzNGY2NzU1Nzk0MmRlYTRmYWNlYmVjMGZlZTRiIgotU1JDX1VSSVt1bmluZGVudC0wLjIu
My5zaGEyNTZzdW1dID0gImM3ZGU3ZDczZTE3NTQ0ODdjYjU4MzY0ZWU5MDZhNDk5OTM3YTBkZmFi
ZDg2YmNiOTgwZmE5OWVjOGM4ZmEyY2UiCi1TUkNfVVJJW3ZjcGtnLTAuMi4xNS5zaGEyNTZzdW1d
ID0gImFjY2Q0ZWE2MmY3YmI3YTgyZmUyMzA2NmZiMDk1N2Q0OGVmNjc3ZjZlZWI4MjE1ZjM3MmY1
MmU0OGJiMzI0MjYiCi1TUkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjQ4LjUuc2hhMjU2c3VtXSA9
ICI5YTJmYTZlMjE1NWQ3MjQ3YmU2OGMwOTY0NTYwODMxNDVjMTgzY2JiYmMyNzY0MTUwZGRhNDVh
ODcxOTc5NDBjIgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjQ4LjUuc2hhMjU2
c3VtXSA9ICIyYjM4ZTMyZjBhYmNjZjk5ODdhNGUzMDc5ZGZiNjdkY2Q3OTlmYjYxMzYxZTUzZTI4
ODJjM2NiYWYwZDkwNWQ4IgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjQ4LjUuc2hh
MjU2c3VtXSA9ICJkYzM1MzEwOTcxZjNiMmRiYmYzZjA2OTBhMjE5ZjQwZTJkOWFmY2Y2NGY5YWI3
Y2MxYmU3MjI5MzdjMjZiNGJjIgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNDguNS5zaGEy
NTZzdW1dID0gImE3NTkxNWU3ZGVmNjBjOTRkY2VmNzIyMDBiOWE4ZTU4ZTUwOTE3NDQ5NjBkYTY0
ZWM3MzRhNmM2ZTliMzc0M2UiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNDguNS5zaGEy
NTZzdW1dID0gIjhmNTVjMjMzZjcwYzRiMjdmNjZjNTIzNTgwZjc4ZjEwMDRlOGI1YThiNjU5ZTA1
YTRlYjQ5ZDQxNjZjY2E0MDYiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjQ4LjUuc2hh
MjU2c3VtXSA9ICI1M2Q0MGFiZDI1ODNkMjNlNDcxOGZkZGYxZWJlYzg0ZGJmZjgzODFjMDdjYWU2
N2ZmNzc2OGJiZjE5YzY3MThlIgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNDgu
NS5zaGEyNTZzdW1dID0gIjBiN2I1Mjc2Nzg2OGEyM2Q1YmFiNzY4ZTM5MGRjNWY1YzU1ODI1YjZk
MzBiODZjODQ0ZmYyZGM3NDE0MDQ0Y2MiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC40
OC41LnNoYTI1NnN1bV0gPSAiZWQ5NGZjZTYxNTcxYTQwMDY4NTJiNzM4OWEwNjNhYjk4M2MwMmVi
MWJiMzdiNDdmODI3MmNlOTJkMDZkOTUzOCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1v
dmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1i
ZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggZjljOGQxMzkzZC4uZWM0YmZjYzk4
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRp
b24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRp
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI3ZGQzY2UxZDc1ZDFlNjI1NWUxYWNhODJh
YTdmNDAxZDQyNDZhNzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE4ZDc4NzM2ZjVj
Mzk3ODRkNTE1MWIwOGZkZmRkMjFjNjEyMjU2ODYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBN
YXkgMjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDog
cmVtb3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25l
ZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlw
cm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggYzlhNzk3OWJkLi5kZWM0YjcxNTcg
MTAwNjQ0CitpbmRleCA0ZjBmYTM2Li4wZDU0ZWE2IDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRv
bWwKICsrKyBiL3B5cHJvamVjdC50b21sCiBAQCAtOTIsNyArOTIsNyBAQCBydXN0LXZlcnNpb24g
PSAiPj0xLjYzLjAiCkBAIC0zOCw2ICszOCwzIEBAIGluZGV4IGM5YTc5NzliZC4uZGVjNGI3MTU3
IDEwMDY0NAogIGNvbnNvbGVfb3V0cHV0X3N0eWxlID0gInByb2dyZXNzLWV2ZW4td2hlbi1jYXB0
dXJlLW5vIgogIG1hcmtlcnMgPSBbCiAgICAgICJza2lwX2ZpcHM6IHRoaXMgdGVzdCBpcyBub3Qg
ZXhlY3V0ZWQgaW4gRklQUyBtb2RlIiwKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIuMC41LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV80Mi4wLjcu
YmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV80Mi4wLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIuMC43LmJiCmluZGV4
IDczMmY5MjVkOTIuLmQ4MDlmMzNhMDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIuMC41LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDIuMC43LmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04YzM2MTdkYjRm
YjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAgICAgICAgICAgICAgICAgICAgIgogTERTSEFSRUQg
Kz0gIi1wdGhyZWFkIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmZlMDdlZWM5NWRmZDQ3N2Vi
OTUzMGFlZjViZWFkMzRmZWM4MTliM2FhZjZjNWJkNmQyMDU2NWRhNjA3YmZlMSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJlY2JmYmMwMGJmNTU4ODhlZGRhOTg2OGE0Y2Y5MjcyMDVkZTg0OTllN2Zh
YmU2YzA1MDMyMjI5ODM4Mjk1M2YyIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2pl
Y3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAg
ICAgIGZpbGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKLS0gCjIuNDQuMAoK

--===============1932627174948380110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-6bb0a479208727ba08487a00c8393392667c5593"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bb0a479208727ba08487a00c8393392667c5593"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 522 Local 502 Mirrors 0 Missed 20 Current 516 (96% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1415 of 2913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-42.0.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-42.0.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2878 of 2913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb:do_fetch)
NOTE: recipe python3-cryptography-42.0.7-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-42.0.7-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 2878 tasks of which 2876 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515092437.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515092437.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb:do_fetch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-42.0.7-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
SRC_URI[asn1-0.15.5.sha256sum] = "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
SRC_URI[asn1_derive-0.15.5.sha256sum] = "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
SRC_URI[cc-1.0.83.sha256sum] = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
SRC_URI[self_cell-1.0.3.sha256sum] = "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
SRC_URI[target-lexicon-0.12.13.sha256sum] = "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
ERROR: python3-cryptography-42.0.7-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/42.0.7/temp/log.do_fetch.721836
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb:do_fetch) failed with exit code '1'

--===============1932627174948380110==--

