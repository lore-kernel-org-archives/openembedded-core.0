Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8938EC4829B
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:08 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4585.1704114719484963193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G923c+bA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n0mHTaDq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018cc5270922-33e64be8-f57b-4c6e-96a2-e332b2390dac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GR1tvNTtGjQWE+HpyqaC2NBDkMYknw1KHdCCOCv65kw=;
	b=G923c+bAxwPOKOKlJoSZ1y/6j8CpyhZqFYV2aYtRQiRgMsq2mAdUXsr1S/JZr1Wb
	DpPnhKwsMKAIyRMNXMwniqNAA8XdOKFbB2nPZXzPs26GN/fkZRESCbxNp/rGdy8Rr+L
	30UG7dk6vjh6cGT7wFliJ+EfrMY09EChHqFN+qIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GR1tvNTtGjQWE+HpyqaC2NBDkMYknw1KHdCCOCv65kw=;
	b=n0mHTaDqB7o9fNUYX79GgPqMFdYD3EON+Qc0V6uGpKGJ/MbAtfJujoB9YE0ctKpg
	tyU+53cuHndH5yM9EDIhlYCuS2iMXDKu0gemAaATV52qXmNB261hyt9zo82sykfANn3
	mS07lonxyBeVZXq4j1C86FFUMwYHVgzzdifIin9I=
Content-Type: multipart/mixed; boundary="===============0538390933728184249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.1.2 FAILED
Message-ID: <0101018cc5270922-33e64be8-f57b-4c6e-96a2-e332b2390dac-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193126

--===============0538390933728184249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bcrypt* to *4.1.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.1.1-4.1.2.patch
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
From e03e1599a94d95c7e8c900d072ea99a6dd1be70f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 06:45:07 +0000
Subject: [PATCH] python3-bcrypt: upgrade 4.1.1 -> 4.1.2

---
 .../python/python3-bcrypt-crates.inc          | 53 -------------------
 ...crypt_4.1.1.bb => python3-bcrypt_4.1.2.bb} |  2 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.1.1.bb => python3-bcrypt_4.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index b99d753a87..732e604307 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -57,56 +57,3 @@ SRC_URI += " \
     crate://crates.io/zeroize/1.7.0 \
 "
 
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
-SRC_URI[bcrypt-0.15.0.sha256sum] = "28d1c9c15093eb224f0baa400f38fcd713fc1391a6f1c389d886beef146d60a3"
-SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
-SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.11.sha256sum] = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
-SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
-SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
-SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
-SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
-SRC_URI[pyo3-0.20.0.sha256sum] = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
-SRC_URI[pyo3-build-config-0.20.0.sha256sum] = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
-SRC_URI[pyo3-ffi-0.20.0.sha256sum] = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
-SRC_URI[pyo3-macros-0.20.0.sha256sum] = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
-SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
-SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
-SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
-SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
-SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 30063c3410..860f291476 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "${PYTHON_PN}-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "df37f5418d4f1cdcff845f60e747a015389fa4e63703c918330865e06ad80007"
+SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.42.0


--===============0538390933728184249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.1.1-4.1.2.patch"

RnJvbSBlMDNlMTU5OWE5NGQ5NWM3ZThjOTAwZDA3MmVhOTlhNmRkMWJlNzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNjo0NTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMS4xIC0+IDQuMS4yCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1iY3J5cHQtY3JhdGVzLmluYyAgICAgICAgICB8IDUzIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLmNyeXB0XzQuMS4xLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMS4yLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJjcnlwdF80LjEuMS5iYiA9PiBw
eXRob24zLWJjcnlwdF80LjEuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKaW5kZXggYjk5ZDc1M2E4
Ny4uNzMyZTYwNDMwNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYwpAQCAtNTcsNTYgKzU3LDMgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvaXplLzEuNy4wIFwKICIKIAotU1JDX1VS
SVthdXRvY2ZnLTEuMS4wLnNoYTI1NnN1bV0gPSAiZDQ2ODgwMmJhYjE3Y2JjMGNjNTc1ZTliMDUz
ZjQxZTcyYWEzNmJmYTZiN2Y1NWUzNTI5ZmZhNDMxNjFiOTdmYSIKLVNSQ19VUklbYmFzZTY0LTAu
MjEuNS5zaGEyNTZzdW1dID0gIjM1NjM2YTE0OTRlZGUzYjY0NmNjOThmNzRmOGU2MmM3NzNhMzhh
NjU5ZWJjNzc3YTJjZjI2YjliNzQxNzFkZjkiCi1TUkNfVVJJW2JjcnlwdC0wLjE1LjAuc2hhMjU2
c3VtXSA9ICIyOGQxYzljMTUwOTNlYjIyNGYwYmFhNDAwZjM4ZmNkNzEzZmMxMzkxYTZmMWMzODlk
ODg2YmVlZjE0NmQ2MGEzIgotU1JDX1VSSVtiY3J5cHQtcGJrZGYtMC4xMC4wLnNoYTI1NnN1bV0g
PSAiNmFlYWMyZTFmZTg4ODc2OWYzNGYwNWFjMzQzYmJlZjk4YjE0ZDFmZmIyOTJhYjY5ZDQ2MDhi
M2FiYzg2ZjJhMiIKLVNSQ19VUklbYml0ZmxhZ3MtMS4zLjIuc2hhMjU2c3VtXSA9ICJiZWYzOGQ0
NTE2M2MyZjFkZGUwOTRhN2RmZDMzY2NmNTk1YzkyOTA1YzhmOGY0ZmRjMThkMDZmYjEwMzc3MThh
IgotU1JDX1VSSVtibG9jay1idWZmZXItMC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYy
ZDNmMDQzOTUxN2ZhMzk0OTk2YWNhY2M1Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKLVNS
Q19VUklbYmxvd2Zpc2gtMC45LjEuc2hhMjU2c3VtXSA9ICJlNDEyZTJjZDBmMmIyZDkzZTAyNTQz
Y2VhZTc5MTdiM2M3MDMzMTU3M2RmMTllZTA0NmJjYmMzNWU0NWU4N2Q3IgotU1JDX1VSSVtieXRl
b3JkZXItMS41LjAuc2hhMjU2c3VtXSA9ICIxZmQwZjI1ODQxNDZmNmYyZWY0ODA4NTA1MDg4NmFj
ZjM1M2JlZmY3MzA1ZWJkMWFlNjk1MDBlMjdjNjdmNjRiIgotU1JDX1VSSVtjZmctaWYtMS4wLjAu
c2hhMjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1
M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgotU1JDX1VSSVtjaXBoZXItMC40LjQuc2hhMjU2c3VtXSA9
ICI3NzNmM2I5YWY2NDQ0N2QyY2U5ODUwMzMwYzQ3MzUxNTAxNGFhMjM1ZTZhNzgzYjAyZGI4MWZm
MzllNGEzZGFkIgotU1JDX1VSSVtjcHVmZWF0dXJlcy0wLjIuMTEuc2hhMjU2c3VtXSA9ICJjZTQy
MGZlMDdhZWNkM2U2N2M1ZjkxMDYxOGZlNjVlOTQxNThmNmRjYzBhZGY0NGUwMGQ2OWNlMmJkZmUw
ZmQwIgotU1JDX1VSSVtjcnlwdG8tY29tbW9uLTAuMS42LnNoYTI1NnN1bV0gPSAiMWJmYjEyNTAy
ZjNmYzQ2Y2NhMWJiNTFhYzI4ZGY5ZDYxOGQ4MTNjZGMzZDJmMjViOWZlNzc1YTM0YWYyNmJiMyIK
LVNSQ19VUklbZGlnZXN0LTAuMTAuNy5zaGEyNTZzdW1dID0gIjllZDlhMjgxZjdiYzliNzU3NmU2
MTQ2OGJhNjE1YTY2YTVjOGNmZGZmNDI0MjBhNzBhYTgyNzAxYTNiMWUyOTIiCi1TUkNfVVJJW2dl
bmVyaWMtYXJyYXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDljYTUxZmQ3MjI3MmQ3ODIxYWRh
ZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5YSIKLVNSQ19VUklbZ2V0cmFu
ZG9tLTAuMi4xMS5zaGEyNTZzdW1dID0gImZlOTAwNmJlZDc2OTE3MGMxMWY4NDVjZjAwYzdjMWU5
MDkyYWViM2YyNjhlMDA3YzNlNzYwYWM2ODAwODA3MGYiCi1TUkNfVVJJW2hlY2stMC40LjEuc2hh
MjU2c3VtXSA9ICI5NTUwNWMzOGI0NTcyYjJkOTEwY2VjYjAyODE1NjBmNTRiNDQwYTE5MzM2Y2Ji
Y2IyN2JmNmNlNmFkYzZmNWE4IgotU1JDX1VSSVtpbmRvYy0yLjAuNC5zaGEyNTZzdW1dID0gIjFl
MTg2Y2ZiYWU4MDg0ZTUxM2RhZmY0MjQwYjQ3OTdlMzQyZjk4OGNlY2RhNGZiNmM5MzkxNTBmOTYz
MTVmZDgiCi1TUkNfVVJJW2lub3V0LTAuMS4zLnNoYTI1NnN1bV0gPSAiYTBjMTA1NTNkNjY0YTRk
MGJjZmY5ZjQyMTVkMGFhYzY3YTYzOWNjNjhlZjY2MDg0MGFmZTMwOWI4MDdiYzlmNSIKLVNSQ19V
UklbbGliYy0wLjIuMTUwLnNoYTI1NnN1bV0gPSAiODlkOTJhNDc0M2Y5YTYxMDAyZmFlMTgzNzRl
ZDExZTc5NzNmNTMwY2IzYTMyNTVmYjM1NDgxODExOGIyMjAzYyIKLVNSQ19VUklbbG9ja19hcGkt
MC40LjExLnNoYTI1NnN1bV0gPSAiM2MxNjhmODYxNWIxMmJjMDFmOWMxN2UyZWIwY2MwN2RjYWUx
OTQwMTIxMTg1NDQ2ZWRjMzc0NDkyMGU4ZWY0NSIKLVNSQ19VUklbbWVtb2Zmc2V0LTAuOS4wLnNo
YTI1NnN1bV0gPSAiNWE2MzRiMWM2MWE5NTU4NWJkMTU2MDdjNmFiMGM0ZTViMjI2ZTY5NWZmMjgw
MGJhMGNkY2NkZGYyMDhjNDA2YyIKLVNSQ19VUklbb25jZV9jZWxsLTEuMTguMC5zaGEyNTZzdW1d
ID0gImRkOGI1ZGQyYWU1ZWQ3MTQ2MmM1NDAyNThiZWRjYjUxOTY1MTIzYWQ3ZTdjY2Y0YjlhOGNh
ZmFhNGE2MzU3NmQiCi1TUkNfVVJJW3BhcmtpbmdfbG90LTAuMTIuMS5zaGEyNTZzdW1dID0gIjM3
NDJiMmMxMDNiOWYwNmJjOWZmZjBhMzdmZjQ5MTI5MzU4NTFiZWU2ZDM2ZjNjMDJiY2M3NTViY2Zl
YzIyOGYiCi1TUkNfVVJJW3BhcmtpbmdfbG90X2NvcmUtMC45Ljkuc2hhMjU2c3VtXSA9ICI0YzQy
YTkyMjY1NDZkNjhhY2RkOWMwYTI4MGQxN2NlMTliZmUyN2E0NmJmNjg3ODRlNDA2NjExNTc4OGQw
MDhlIgotU1JDX1VSSVtwYmtkZjItMC4xMi4yLnNoYTI1NnN1bV0gPSAiZjhlZDZhNzc2MWY3NmUz
YjlmOTJkZmIwYTYwYTZhNjQ3N2M2MTAyNGI3NzUxNDdmZjA5NzNhMDI2NTNhYmFmMiIKLVNSQ19V
UklbcHJvYy1tYWNybzItMS4wLjcwLnNoYTI1NnN1bV0gPSAiMzkyNzhmYmJmNWZiNGY2NDZjZTY1
MTY5MDg3N2Y4OWQxYzU4MTFhM2Q0YWNiMjc3MDBjMWNiM2NkYjc4ZmQzYiIKLVNSQ19VUklbcHlv
My0wLjIwLjAuc2hhMjU2c3VtXSA9ICIwNGU4NDUzYjY1OGZlNDgwYzNlNzBjOGVkNGUzZDNlYzMz
ZWI3NDk4OGJkMTg2NTYxYjBjYzY2Yjg1YzNiYzRiIgotU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZp
Zy0wLjIwLjAuc2hhMjU2c3VtXSA9ICJhOTZmZTcwYjE3NmE4OWNmZjc4ZjJmYTdiM2M5MzAwODFl
MTYzZDUzNzliNGRjZGY5OTNlM2FlMjljYTY2MmU1IgotU1JDX1VSSVtweW8zLWZmaS0wLjIwLjAu
c2hhMjU2c3VtXSA9ICIyMTQ5Mjk5MDBmZDI1ZTY2MDQ2NjFlZDljZjM0OTcyN2M4OTIwZDQ3ZGVm
ZjE5NmM0ZTI4MTY1YTZlZjJhOTZiIgotU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjIwLjAuc2hhMjU2
c3VtXSA9ICJkYWM1MzA3MmY3MTdhYTFiZmE0ZGI4MzJiMzlkZThjODc1YjdjN2FmNGY0YTZmZTkz
Y2RiZjkyNjRjZjgzODNiIgotU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjAuMC5zaGEy
NTZzdW1dID0gIjc3NzRiNWE4MjgyYmQ0ZjI1ZjgwM2IxZjBkOTQ1MTIwYmU5NTlhMzZjNzJlMDhl
N2NkMDMxYzc5MmZkZmQ0MjQiCi1TUkNfVVJJW3F1b3RlLTEuMC4zMy5zaGEyNTZzdW1dID0gIjUy
NjdmY2E0NDk2MDI4NjI4YTk1MTYwZmM0MjNhMzNlOGIyZTZhZjhhNTMwMjU3OWUzMjJlNGI1MjAy
OTNjYWUiCi1TUkNfVVJJW3JlZG94X3N5c2NhbGwtMC40LjEuc2hhMjU2c3VtXSA9ICI0NzIyZDc2
OGVmZjQ2Yjc1OTg5ZGQxMzRlNWMzNTNmMGQ2Mjk2ZTVhYWEzMTMyZTc3NmNiZGI1NmJlNzczMWFh
IgotU1JDX1VSSVtzY29wZWd1YXJkLTEuMi4wLnNoYTI1NnN1bV0gPSAiOTQxNDNmMzc3MjUxMDlm
OTJjMjYyZWQyY2Y1ZTU5YmNlNzQ5OGMwMWJjYzE1MDJkN2I5YWZlNDM5YTRlOWY0OSIKLVNSQ19V
Uklbc2hhMi0wLjEwLjguc2hhMjU2c3VtXSA9ICI3OTNkYjc1YWQyYmNhZmMzZmZhN2M2OGIyMTVm
ZWUyNjhmNTM3OTgyY2Q5MDFkMTMyZjg5YzYzNDNmM2EzZGM4IgotU1JDX1VSSVtzbWFsbHZlYy0x
LjExLjIuc2hhMjU2c3VtXSA9ICI0ZGNjZDA5NDBhMmRjZGY2OGQwOTJiOGNiYWI3ZGMwYWQ4ZmE5
MzhiZjk1Nzg3ZTFiOTE2YjBlM2QwZThlOTcwIgotU1JDX1VSSVtzdWJ0bGUtMi41LjAuc2hhMjU2
c3VtXSA9ICI4MWNkZDY0ZDMxMmJhZWRiNThlMjEzMzZiMzFiYzA0M2I3N2UwMWNjOTkwMzNjZTc2
ZWY1MzlmNzhlOTY1ZWJjIgotU1JDX1VSSVtzeW4tMi4wLjM5LnNoYTI1NnN1bV0gPSAiMjNlNzhi
OTBmMmZjZjQ1ZDNlODQyMDMyY2UzMmUzZjJkMTU0NWJhNjYzNjI3MWRjYmYyNGZhMzA2ZDg3YmU3
YSIKLVNSQ19VUklbdGFyZ2V0LWxleGljb24tMC4xMi4xMi5zaGEyNTZzdW1dID0gIjE0YzM5ZmQw
NDkyNGNhM2E4NjQyMDdjNjZmYzJjZDdkMjJkN2MwMTYwMDdmOWNlODQ2Y2JiOTMyNjMzMTkzMGEi
Ci1TUkNfVVJJW3R5cGVudW0tMS4xNy4wLnNoYTI1NnN1bV0gPSAiNDJmZjBiZjBjNjZiODIzOGM2
ZjNiNTc4ZGYzN2QwYjc4NDhlNTVkZjg1NzdiM2Y3NGY5MmE2OWFjY2VlYjgyNSIKLVNSQ19VUklb
dW5pY29kZS1pZGVudC0xLjAuMTIuc2hhMjU2c3VtXSA9ICIzMzU0YjlhYzNmYWUxZmY2NzU1Y2I2
ZGI1MzY4M2FkYjY2MTYzNGY2NzU1Nzk0MmRlYTRmYWNlYmVjMGZlZTRiIgotU1JDX1VSSVt1bmlu
ZGVudC0wLjIuMy5zaGEyNTZzdW1dID0gImM3ZGU3ZDczZTE3NTQ0ODdjYjU4MzY0ZWU5MDZhNDk5
OTM3YTBkZmFiZDg2YmNiOTgwZmE5OWVjOGM4ZmEyY2UiCi1TUkNfVVJJW3ZlcnNpb25fY2hlY2st
MC45LjQuc2hhMjU2c3VtXSA9ICI0OTg3NGI1MTY3YjY1ZDcxOTNiOGFiYTE1NjdmNWM3ZDkzZDAw
MWNhZmMzNDYwMGNlZTAwM2VkYTc4N2U0ODNmIgotU1JDX1VSSVt3YXNpLTAuMTEuMCt3YXNpLXNu
YXBzaG90LXByZXZpZXcxLnNoYTI1NnN1bV0gPSAiOWM4ZDg3ZTcyYjY0YTNiNGRiMjhkMTFjZTI5
MjM3YzI0NjE4OGY0ZjUxMDU3ZDY1YTdlYWI2M2I3OTg3ZTQyMyIKLVNSQ19VUklbd2luZG93cy10
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
NDAwNjg1MmI3Mzg5YTA2M2FiOTgzYzAyZWIxYmIzN2I0N2Y4MjcyY2U5MmQwNmQ5NTM4IgotU1JD
X1VSSVt6ZXJvaXplLTEuNy4wLnNoYTI1NnN1bV0gPSAiNTI1YjRlYzE0MmM2YjY4YTJkMTBmMDFm
N2JiZjY3NTU1OTljYTNmODFlYTUzYjg0MzFiN2RkMzQ4ZjVmZGIyZCIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4xLjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMS4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1iY3J5cHRfNC4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iY3J5cHRfNC4xLjIuYmIKaW5kZXggMzAwNjNjMzQxMC4uODYwZjI5MTQ3NiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF80
LjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0
XzQuMS4yLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3By
b2plY3QvYmNyeXB0LyIKIERFUEVORFMgKz0gIiR7UFlUSE9OX1BOfS1jZmZpLW5hdGl2ZSIKIExE
RkxBR1M6YXBwZW5kID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAn
cHRlc3QnLCAnIC1mdXNlLWxkPWJmZCcsICcnLCBkKX0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkZjM3ZjU0MThkNGYxY2RjZmY4NDVmNjBlNzQ3YTAxNTM4OWZhNGU2MzcwM2M5MTgzMzA4NjVl
MDZhZDgwMDA3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzMzEzYTEyMDBhM2FlOTBiNzU1ODdj
ZWFjNTAyYjA0OGI4NDBmYzY5ZTdmN2EwOTA1YjVmODdmYWM3YTEyNTgiCiAKIGluaGVyaXQgcHlw
aSBweXRob25fc2V0dXB0b29sczNfcnVzdCBwdGVzdC1jYXJnbyBjYXJnby11cGRhdGUtcmVjaXBl
LWNyYXRlcwogCi0tIAoyLjQyLjAKCg==

--===============0538390933728184249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ad137e41e313289f03803b71573f782ec8f2b62f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ad137e41e313289f03803b71573f782ec8f2b62f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 413 Local 399 Mirrors 0 Missed 14 Current 415 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 488 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 667 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 681 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cffi-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.74.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.74.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycparser-native-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 806 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.74.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycparser-native-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_recipe_qa_setscene)
NOTE: Running task 1129 of 2356 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_recipe_qa)
NOTE: recipe rust-native-1.74.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 814 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.74.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.74.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_recipe_qa_setscene)
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2118 of 2356 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_fetch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_fetch: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.74.1.bb:do_recipe_qa_setscene)
NOTE: recipe rust-llvm-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_fetch: Failed
NOTE: recipe rust-llvm-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 2283 tasks of which 2281 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101064447.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101064447.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_fetch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-bcrypt-4.1.2-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
SRC_URI[bcrypt-0.15.0.sha256sum] = "28d1c9c15093eb224f0baa400f38fcd713fc1391a6f1c389d886beef146d60a3"
SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
SRC_URI[cpufeatures-0.2.11.sha256sum] = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
SRC_URI[pyo3-0.20.0.sha256sum] = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
SRC_URI[pyo3-build-config-0.20.0.sha256sum] = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
SRC_URI[pyo3-ffi-0.20.0.sha256sum] = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
SRC_URI[pyo3-macros-0.20.0.sha256sum] = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
ERROR: python3-bcrypt-4.1.2-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-bcrypt/4.1.2/temp/log.do_fetch.92926
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_fetch) failed with exit code '1'

--===============0538390933728184249==--

