Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C91C25B4E
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22195.1701436491939107320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yi6hVqOc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CbaprBuJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c258484c3-0b58b3ad-85da-409b-ab16-e6531410283e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zMpRHYVW6NYvRHC+HM+SahQ2abkFsbsNpbBCHtv1YL4=;
	b=Yi6hVqOcmX/LzMCW90t3luxS1U4vwRBbn1o7w1VG0/vnekU2gB6zXOkZjJE+X1ri
	Ka+5Cer1F2afRTqz9pFUlKtfQLuuv5Zio6LTSTi6HuUId/LuvCmNTovDbEZMc5UZN63
	RdwqCobfQoXfCsdrvZWrCZlgdGFS/wppVWbC3S2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zMpRHYVW6NYvRHC+HM+SahQ2abkFsbsNpbBCHtv1YL4=;
	b=CbaprBuJtwSUx5Ejnth1syL2TdpHMpLukzf97JYji/zFxualdPDwEtZL3IbhS4el
	8fo5n5fYmKXKIqANwTq8RBaKJMiWdlNGH1eETf82vIneMShNFcSiv6bz2+jJIXCdRmf
	77DKtlqrf8H3W5obb3VQyVRgUq642dTLrB2gIHhk=
Content-Type: multipart/mixed; boundary="===============0694085461278091453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.1.1 FAILED
Message-ID: <0101018c258484c3-0b58b3ad-85da-409b-ab16-e6531410283e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191607

--===============0694085461278091453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bcrypt* to *4.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.0.1-4.1.1.patch
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
From 3dfa6bf94ef62f8d88de55a15b817395632af12e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 08:19:50 +0000
Subject: [PATCH] python3-bcrypt: upgrade 4.0.1 -> 4.1.1

---
 .../python/python3-bcrypt-crates.inc          | 49 -------------------
 ...crypt_4.0.1.bb => python3-bcrypt_4.1.1.bb} |  2 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.0.1.bb => python3-bcrypt_4.1.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 16d9e55cc5..e8abe654df 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -53,52 +53,3 @@ SRC_URI += " \
     crate://crates.io/zeroize/1.5.7 \
 "
 
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.13.0.sha256sum] = "904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd"
-SRC_URI[bcrypt-0.13.0.sha256sum] = "a7e7c93a3fb23b2fdde989b2c9ec4dd153063ec81f408507f84c090cd91c6641"
-SRC_URI[bcrypt-pbkdf-0.8.1.sha256sum] = "f4ef233ffa9cb9c7820b2b0e9efd0821ed180e866c9120ec9f45518659742074"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
-SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
-SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[cipher-0.4.3.sha256sum] = "d1873270f8f7942c191139cb8a40fd228da6c3fd2fc376d7e92d47aa14aeb59e"
-SRC_URI[cpufeatures-0.2.5.sha256sum] = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
-SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[digest-0.10.5.sha256sum] = "adfbc57365a37acbd2ebf2b64d7e69bb766e2fea813521ed536f5d0520dcf86c"
-SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
-SRC_URI[getrandom-0.2.7.sha256sum] = "4eb1a864a501629691edf6c15a593b7a51eebaa1e8468e9ddc623de7c9b58ec6"
-SRC_URI[indoc-0.3.6.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
-SRC_URI[indoc-impl-0.3.6.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
-SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[libc-0.2.134.sha256sum] = "329c933548736bc49fd575ee68c89e8be4d260064184389a5b77517cddd99ffb"
-SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[once_cell-1.15.0.sha256sum] = "e82dad04139b71a90c080c8463fe0dc7902db5192d939bd0950f074d014339e1"
-SRC_URI[parking_lot-0.11.2.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
-SRC_URI[parking_lot_core-0.8.5.sha256sum] = "d76e8e1493bcac0d2766c42737f34458f1c8c50c0d23bcb24ea953affb273216"
-SRC_URI[paste-0.1.18.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
-SRC_URI[paste-impl-0.1.18.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
-SRC_URI[pbkdf2-0.10.1.sha256sum] = "271779f35b581956db91a3e55737327a03aa051e90b1c47aeb189508533adfd7"
-SRC_URI[proc-macro-hack-0.5.19.sha256sum] = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5"
-SRC_URI[proc-macro2-1.0.46.sha256sum] = "94e2ef8dbfc347b10c094890f778ee2e36ca9bb4262e86dc99cd217e35f3470b"
-SRC_URI[pyo3-0.15.2.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
-SRC_URI[pyo3-build-config-0.15.2.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
-SRC_URI[pyo3-macros-0.15.2.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
-SRC_URI[pyo3-macros-backend-0.15.2.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
-SRC_URI[quote-1.0.21.sha256sum] = "bbe448f377a7d6961e30f5955f9b8d106c3f5e449d493ee1b125c1d43c2b5179"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[sha2-0.10.6.sha256sum] = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
-SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[subtle-2.4.1.sha256sum] = "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
-SRC_URI[syn-1.0.102.sha256sum] = "3fcd952facd492f9be3ef0d0b7032a6e442ee9b361d4acc2b1d0c4aaa5f613a1"
-SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
-SRC_URI[unicode-ident-1.0.4.sha256sum] = "dcc811dc4066ac62f84f11307873c4850cb653bfa9b1719cee2bd2204a4bc5dd"
-SRC_URI[unindent-0.1.10.sha256sum] = "58ee9362deb4a96cef4d437d1ad49cffc9b9e92d202b6995674e928ce684f112"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[zeroize-1.5.7.sha256sum] = "c394b5bd0c6f669e7275d9c20aa90ae064cb22e75a1cad54e1b34088034b149f"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
index d8377de96c..30063c3410 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "${PYTHON_PN}-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
+SRC_URI[sha256sum] = "df37f5418d4f1cdcff845f60e747a015389fa4e63703c918330865e06ad80007"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.39.2


--===============0694085461278091453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.0.1-4.1.1.patch"

RnJvbSAzZGZhNmJmOTRlZjYyZjhkODhkZTU1YTE1YjgxNzM5NTYzMmFmMTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODoxOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMC4xIC0+IDQuMS4xCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1iY3J5cHQtY3JhdGVzLmluYyAgICAgICAgICB8IDQ5IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLmNyeXB0XzQuMC4xLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMS4xLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1MCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJjcnlwdF80LjAuMS5iYiA9PiBw
eXRob24zLWJjcnlwdF80LjEuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKaW5kZXggMTZkOWU1NWNj
NS4uZThhYmU2NTRkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYwpAQCAtNTMsNTIgKzUzLDMgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvaXplLzEuNS43IFwKICIKIAotU1JDX1VS
SVthdXRvY2ZnLTEuMS4wLnNoYTI1NnN1bV0gPSAiZDQ2ODgwMmJhYjE3Y2JjMGNjNTc1ZTliMDUz
ZjQxZTcyYWEzNmJmYTZiN2Y1NWUzNTI5ZmZhNDMxNjFiOTdmYSIKLVNSQ19VUklbYmFzZTY0LTAu
MTMuMC5zaGEyNTZzdW1dID0gIjkwNGRmZWFjNTBmM2NkYWJhMjhmYzZmNTdmZGNkZGI3NWY0OWVk
NjEzNDY2NzZhNzhjNGZmZTU1ODc3ODAyZmQiCi1TUkNfVVJJW2JjcnlwdC0wLjEzLjAuc2hhMjU2
c3VtXSA9ICJhN2U3YzkzYTNmYjIzYjJmZGRlOTg5YjJjOWVjNGRkMTUzMDYzZWM4MWY0MDg1MDdm
ODRjMDkwY2Q5MWM2NjQxIgotU1JDX1VSSVtiY3J5cHQtcGJrZGYtMC44LjEuc2hhMjU2c3VtXSA9
ICJmNGVmMjMzZmZhOWNiOWM3ODIwYjJiMGU5ZWZkMDgyMWVkMTgwZTg2NmM5MTIwZWM5ZjQ1NTE4
NjU5NzQyMDc0IgotU1JDX1VSSVtiaXRmbGFncy0xLjMuMi5zaGEyNTZzdW1dID0gImJlZjM4ZDQ1
MTYzYzJmMWRkZTA5NGE3ZGZkMzNjY2Y1OTVjOTI5MDVjOGY4ZjRmZGMxOGQwNmZiMTAzNzcxOGEi
Ci1TUkNfVVJJW2Jsb2NrLWJ1ZmZlci0wLjEwLjMuc2hhMjU2c3VtXSA9ICI2OWNjZTIwNzM3NDk4
Zjk3Yjk5MzQ3MGE2ZTUzNmI4NTIzZjBhZjc4OTJhNGY5MjhjY2ViMWFjNWU1MmViZTdlIgotU1JD
X1VSSVtibG93ZmlzaC0wLjkuMS5zaGEyNTZzdW1dID0gImU0MTJlMmNkMGYyYjJkOTNlMDI1NDNj
ZWFlNzkxN2IzYzcwMzMxNTczZGYxOWVlMDQ2YmNiYzM1ZTQ1ZTg3ZDciCi1TUkNfVVJJW2J5dGVv
cmRlci0xLjQuMy5zaGEyNTZzdW1dID0gIjE0YzE4OWM1M2QwOTg5NDU0OTljZGZhN2VjYzYzNTY3
Y2YzODg2YjMzMzJiMzEyYTViNDU4NWQ4ZDNhNmE2MTAiCi1TUkNfVVJJW2NmZy1pZi0xLjAuMC5z
aGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTllM2NiYzAxMjBlZTU4MmViYjc0YjUz
YjRlZmJmNzkxMTdiZDJkYTQwZmQiCi1TUkNfVVJJW2NpcGhlci0wLjQuMy5zaGEyNTZzdW1dID0g
ImQxODczMjcwZjhmNzk0MmMxOTExMzljYjhhNDBmZDIyOGRhNmMzZmQyZmMzNzZkN2U5MmQ0N2Fh
MTRhZWI1OWUiCi1TUkNfVVJJW2NwdWZlYXR1cmVzLTAuMi41LnNoYTI1NnN1bV0gPSAiMjhkOTk3
YmQ1ZTI0YTU5MjhkZDQzZTQ2ZGM1Mjk4NjdlMjA3OTA3ZmUwYjIzOWMzNDc3ZDkyNGY3ZjJjYTMy
MCIKLVNSQ19VUklbY3J5cHRvLWNvbW1vbi0wLjEuNi5zaGEyNTZzdW1dID0gIjFiZmIxMjUwMmYz
ZmM0NmNjYTFiYjUxYWMyOGRmOWQ2MThkODEzY2RjM2QyZjI1YjlmZTc3NWEzNGFmMjZiYjMiCi1T
UkNfVVJJW2RpZ2VzdC0wLjEwLjUuc2hhMjU2c3VtXSA9ICJhZGZiYzU3MzY1YTM3YWNiZDJlYmYy
YjY0ZDdlNjliYjc2NmUyZmVhODEzNTIxZWQ1MzZmNWQwNTIwZGNmODZjIgotU1JDX1VSSVtnZW5l
cmljLWFycmF5LTAuMTQuNi5zaGEyNTZzdW1dID0gImJmZjQ5ZTk0NzI5N2YzMzEyNDQ3YWJkY2E3
OWY0NWY0NzM4MDk3Y2M4MmIwNmU3MjA1NGQyMjIzZjYwMWYxYjkiCi1TUkNfVVJJW2dldHJhbmRv
bS0wLjIuNy5zaGEyNTZzdW1dID0gIjRlYjFhODY0YTUwMTYyOTY5MWVkZjZjMTVhNTkzYjdhNTFl
ZWJhYTFlODQ2OGU5ZGRjNjIzZGU3YzliNThlYzYiCi1TUkNfVVJJW2luZG9jLTAuMy42LnNoYTI1
NnN1bV0gPSAiNDc3NDFhOGJjNjBmYjI2ZWI4ZDZlMDIzOGJiYjI2ZDg1NzVmZjYyM2ZkYzk3YjFh
MmMwMGMwNTBiOTY4NGVkOCIKLVNSQ19VUklbaW5kb2MtaW1wbC0wLjMuNi5zaGEyNTZzdW1dID0g
ImNlMDQ2ZDE2MWYwMDBmZmZkZTVmNDMyYTBkMDM0ZDAzNDFkYzE1MjY0M2IyNTk4ZWQ1YmZjZTQ0
YzRmM2E4ZjAiCi1TUkNfVVJJW2lub3V0LTAuMS4zLnNoYTI1NnN1bV0gPSAiYTBjMTA1NTNkNjY0
YTRkMGJjZmY5ZjQyMTVkMGFhYzY3YTYzOWNjNjhlZjY2MDg0MGFmZTMwOWI4MDdiYzlmNSIKLVNS
Q19VUklbaW5zdGFudC0wLjEuMTIuc2hhMjU2c3VtXSA9ICI3YTViYmU4MjRjNTA3YzVkYTU5NTYz
NTVlODZhNzQ2ZDgyZTBlMTQ2NGY2NWQ4NjJjYzVlNzFkYTcwZTk0YjJjIgotU1JDX1VSSVtsaWJj
LTAuMi4xMzQuc2hhMjU2c3VtXSA9ICIzMjljOTMzNTQ4NzM2YmM0OWZkNTc1ZWU2OGM4OWU4YmU0
ZDI2MDA2NDE4NDM4OWE1Yjc3NTE3Y2RkZDk5ZmZiIgotU1JDX1VSSVtsb2NrX2FwaS0wLjQuOS5z
aGEyNTZzdW1dID0gIjQzNTAxMTM2NmZlNTY1ODNiMTZjZjk1NmY5ZGYwMDk1YjQwNWI4MmQ3NjQy
NWJjODk4MWMwZTIyZTYwZWM0ZGYiCi1TUkNfVVJJW29uY2VfY2VsbC0xLjE1LjAuc2hhMjU2c3Vt
XSA9ICJlODJkYWQwNDEzOWI3MWE5MGMwODBjODQ2M2ZlMGRjNzkwMmRiNTE5MmQ5MzliZDA5NTBm
MDc0ZDAxNDMzOWUxIgotU1JDX1VSSVtwYXJraW5nX2xvdC0wLjExLjIuc2hhMjU2c3VtXSA9ICI3
ZDE3Yjc4MDM2YTYwNjYzYjc5N2FkZWFlZTQ2ZjVjOWRmZWJiODY5NDhkMTI1NTAwN2ExZDZiZTAy
NzFmZjk5IgotU1JDX1VSSVtwYXJraW5nX2xvdF9jb3JlLTAuOC41LnNoYTI1NnN1bV0gPSAiZDc2
ZThlMTQ5M2JjYWMwZDI3NjZjNDI3MzdmMzQ0NThmMWM4YzUwYzBkMjNiY2IyNGVhOTUzYWZmYjI3
MzIxNiIKLVNSQ19VUklbcGFzdGUtMC4xLjE4LnNoYTI1NnN1bV0gPSAiNDVjYTIwYzc3ZDgwYmU2
NjZhZWYyYjQ1NDg2ZGE4NjIzOGZhYmUzM2UzODMwNmJkMzExOGZlNGFmMzNmYTg4MCIKLVNSQ19V
UklbcGFzdGUtaW1wbC0wLjEuMTguc2hhMjU2c3VtXSA9ICJkOTVhN2RiMjAwYjk3ZWYzNzBjOGU2
ZGUwMDg4MjUyZjdlMGRmZmY3ZDA0N2EyODUyOGU0NzQ1NmMwZmM5OGI2IgotU1JDX1VSSVtwYmtk
ZjItMC4xMC4xLnNoYTI1NnN1bV0gPSAiMjcxNzc5ZjM1YjU4MTk1NmRiOTFhM2U1NTczNzMyN2Ew
M2FhMDUxZTkwYjFjNDdhZWIxODk1MDg1MzNhZGZkNyIKLVNSQ19VUklbcHJvYy1tYWNyby1oYWNr
LTAuNS4xOS5zaGEyNTZzdW1dID0gImRiZjBjNDhiYzFkOTEzNzVhZTVjM2NkODFlMzcyMmRmZjFh
YmNmODFhMzA5NjAyNDA2NDBkMjIzZjU5ZmUwZTUiCi1TUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC40
Ni5zaGEyNTZzdW1dID0gIjk0ZTJlZjhkYmZjMzQ3YjEwYzA5NDg5MGY3NzhlZTJlMzZjYTliYjQy
NjJlODZkYzk5Y2QyMTdlMzVmMzQ3MGIiCi1TUkNfVVJJW3B5bzMtMC4xNS4yLnNoYTI1NnN1bV0g
PSAiZDQxZDUwYTcyNzFlMDhjN2M4YTU0Y2QyNGFmNWQ2MmY3M2VlM2E2ZjZhMzE0MjE1MjgxZWJk
ZWM0MjFkNTc1MiIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4xNS4yLnNoYTI1NnN1bV0g
PSAiNzc5MjM5ZmM0MGI4ZTE4YmM4NDE2ZDNhMzdkMjgwY2E5YjlmYjA0YmRhNTRiOTgwMzdiYjY3
NDg1OTVjMjQxMCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4xNS4yLnNoYTI1NnN1bV0gPSAiMDBi
MjQ3ZThjNjY0YmU4Nzk5OGQ4NjI4ZTg2ZjI4MmMyNTA2NjE2NWYxZjhkZGE2NjEwMGM0ODIwMmZk
YjkzYSIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjE1LjIuc2hhMjU2c3VtXSA9ICI1
YThjMjgxMmM0MTJlMDBlNjQxZDk5ZWViNzlkZDQ3ODMxN2Q5ODFkOTM4YWE2MDMyNWRmYTcxNTdi
NjA3MDk1IgotU1JDX1VSSVtxdW90ZS0xLjAuMjEuc2hhMjU2c3VtXSA9ICJiYmU0NDhmMzc3YTdk
Njk2MWUzMGY1OTU1ZjliOGQxMDZjM2Y1ZTQ0OWQ0OTNlZTFiMTI1YzFkNDNjMmI1MTc5IgotU1JD
X1VSSVtyZWRveF9zeXNjYWxsLTAuMi4xNi5zaGEyNTZzdW1dID0gImZiNWE1OGMxODU1YjRiNjgx
OWQ1OTAxMjE1NTYwM2YwYjIyYWQzMGNhZDc1MjYwMGFhZGZjYjY5NTI2NTUxOWEiCi1TUkNfVVJJ
W3Njb3BlZ3VhcmQtMS4xLjAuc2hhMjU2c3VtXSA9ICJkMjlhYjBjNmQzZmMwZWU5MmZlNjZlMmQ5
OWY3MDBlYWIxN2E4ZDU3ZDFjMWQzYjc0ODM4MGZiMjBiYWE3OGNkIgotU1JDX1VSSVtzaGEyLTAu
MTAuNi5zaGEyNTZzdW1dID0gIjgyZTZiNzk1ZmUyZTNiMWU4NDViYWZjYjI3YWEzNTQwNWM0ZDQ3
Y2RmYzkyYWY1ZmM4ZDMwMDJmNzZjZWJkYzAiCi1TUkNfVVJJW3NtYWxsdmVjLTEuMTAuMC5zaGEy
NTZzdW1dID0gImE1MDdiZWZlNzk1NDA0NDU2MzQxZGZhYjEwY2VmNjZlYWQ0YzA0MWY2MmI4YjEx
YmJiOTJiZmZlNWQwOTUzZTAiCi1TUkNfVVJJW3N1YnRsZS0yLjQuMS5zaGEyNTZzdW1dID0gIjZi
ZGVmMzJlODE1MGMyYTA4MTExMGI0Mjc3MmZmZTdkN2M5MDMyYjYwNmJjMjI2YzgyNjBmZDk3ZTA5
NzY2MDEiCi1TUkNfVVJJW3N5bi0xLjAuMTAyLnNoYTI1NnN1bV0gPSAiM2ZjZDk1MmZhY2Q0OTJm
OWJlM2VmMGQwYjcwMzJhNmU0NDJlZTliMzYxZDRhY2MyYjFkMGM0YWFhNWY2MTNhMSIKLVNSQ19V
UklbdHlwZW51bS0xLjE1LjAuc2hhMjU2c3VtXSA9ICJkY2Y4MWFjNTllZGMxN2NjODY5N2ZmMzEx
ZThmNWVmMmQ5OWZjYmQ5ODE3YjM0Y2VjNjZmOTBiNmMzZGZkOTg3IgotU1JDX1VSSVt1bmljb2Rl
LWlkZW50LTEuMC40LnNoYTI1NnN1bV0gPSAiZGNjODExZGM0MDY2YWM2MmY4NGYxMTMwNzg3M2M0
ODUwY2I2NTNiZmE5YjE3MTljZWUyYmQyMjA0YTRiYzVkZCIKLVNSQ19VUklbdW5pbmRlbnQtMC4x
LjEwLnNoYTI1NnN1bV0gPSAiNThlZTkzNjJkZWI0YTk2Y2VmNGQ0MzdkMWFkNDljZmZjOWI5ZTky
ZDIwMmI2OTk1Njc0ZTkyOGNlNjg0ZjExMiIKLVNSQ19VUklbdmVyc2lvbl9jaGVjay0wLjkuNC5z
aGEyNTZzdW1dID0gIjQ5ODc0YjUxNjdiNjVkNzE5M2I4YWJhMTU2N2Y1YzdkOTNkMDAxY2FmYzM0
NjAwY2VlMDAzZWRhNzg3ZTQ4M2YiCi1TUkNfVVJJW3dhc2ktMC4xMS4wK3dhc2ktc25hcHNob3Qt
cHJldmlldzEuc2hhMjU2c3VtXSA9ICI5YzhkODdlNzJiNjRhM2I0ZGIyOGQxMWNlMjkyMzdjMjQ2
MTg4ZjRmNTEwNTdkNjVhN2VhYjYzYjc5ODdlNDIzIgotU1JDX1VSSVt3aW5hcGktMC4zLjkuc2hh
MjU2c3VtXSA9ICI1YzgzOWE2NzRmY2Q3YTk4OTUyZTU5MzI0MmVhNDAwYWJlOTM5OTI3NDY3NjFl
Mzg2NDE0MDVkMjhiMDBmNDE5IgotU1JDX1VSSVt3aW5hcGktaTY4Ni1wYy13aW5kb3dzLWdudS0w
LjQuMC5zaGEyNTZzdW1dID0gImFjM2I4N2M2MzYyMDQyNmRkOWI5OTFlNWNlMDMyOWVmZjU0NWJj
Y2JiYjM0ZjNiZTA5ZmY2ZmI2YWI1MWI3YjYiCi1TUkNfVVJJW3dpbmFwaS14ODZfNjQtcGMtd2lu
ZG93cy1nbnUtMC40LjAuc2hhMjU2c3VtXSA9ICI3MTJlMjI3ODQxZDA1N2MxZWUxY2QyZmIyMmZh
N2U1YTU0NjFhZThlNDhmYTJjYTc5ZWM0MmNmYzE5MzExODNmIgotU1JDX1VSSVt6ZXJvaXplLTEu
NS43LnNoYTI1NnN1bV0gPSAiYzM5NGI1YmQwYzZmNjY5ZTcyNzVkOWMyMGFhOTBhZTA2NGNiMjJl
NzVhMWNhZDU0ZTFiMzQwODgwMzRiMTQ5ZiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4w
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5
cHRfNC4xLjEuYmIKaW5kZXggZDgzNzdkZTk2Yy4uMzAwNjNjMzQxMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF80LjAuMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMS4xLmJiCkBAIC02
LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvYmNyeXB0LyIK
IERFUEVORFMgKz0gIiR7UFlUSE9OX1BOfS1jZmZpLW5hdGl2ZSIKIExERkxBR1M6YXBwZW5kID0g
IiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncHRlc3QnLCAnIC1mdXNl
LWxkPWJmZCcsICcnLCBkKX0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2QzNzU5MDNhYzgy
NjFjZmU0MDQ3ZjY3MDlkMTZmN2QxOGQzOWIxZWM5MmFhZjcyYWY5ODk1NTJhNjUwZWJkIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImRmMzdmNTQxOGQ0ZjFjZGNmZjg0NWY2MGU3NDdhMDE1Mzg5ZmE0
ZTYzNzAzYzkxODMzMDg2NWUwNmFkODAwMDciCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sczNfcnVzdCBwdGVzdC1jYXJnbyBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcwogCi0tIAoy
LjM5LjIKCg==

--===============0694085461278091453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a970af91c8bf41b63bbdd7e015d88ac7b59d7807"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a970af91c8bf41b63bbdd7e015d88ac7b59d7807"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 430 Local 416 Mirrors 0 Missed 14 Current 398 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 437 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 579 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cffi-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 691 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_create_spdx_setscene)
NOTE: Running task 410 of 2356 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb:do_recipe_qa)
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-native-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-8.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-toml-native-0.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 756 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.70.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-cffi-native-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 762 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running task 689 of 2356 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-8.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-toml-native-0.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 765 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_23.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 778 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-native-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-bcrypt-4.1.1-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-8.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-native-23.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-toml-native-0.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 783 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-8.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-toml-native-0.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pip-native-23.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_23.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-native-23.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pip-native-23.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-llvm-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.1-r0: task do_fetch: Failed
NOTE: recipe rust-llvm-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 2283 tasks of which 2281 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201081929.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201081929.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb:do_fetch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-bcrypt-4.1.1-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
SRC_URI[base64-0.13.0.sha256sum] = "904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd"
SRC_URI[bcrypt-0.13.0.sha256sum] = "a7e7c93a3fb23b2fdde989b2c9ec4dd153063ec81f408507f84c090cd91c6641"
SRC_URI[bcrypt-pbkdf-0.8.1.sha256sum] = "f4ef233ffa9cb9c7820b2b0e9efd0821ed180e866c9120ec9f45518659742074"
SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
SRC_URI[cipher-0.4.3.sha256sum] = "d1873270f8f7942c191139cb8a40fd228da6c3fd2fc376d7e92d47aa14aeb59e"
SRC_URI[cpufeatures-0.2.5.sha256sum] = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
SRC_URI[digest-0.10.5.sha256sum] = "adfbc57365a37acbd2ebf2b64d7e69bb766e2fea813521ed536f5d0520dcf86c"
SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
SRC_URI[getrandom-0.2.7.sha256sum] = "4eb1a864a501629691edf6c15a593b7a51eebaa1e8468e9ddc623de7c9b58ec6"
SRC_URI[indoc-0.3.6.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
SRC_URI[indoc-impl-0.3.6.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
SRC_URI[libc-0.2.134.sha256sum] = "329c933548736bc49fd575ee68c89e8be4d260064184389a5b77517cddd99ffb"
SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
SRC_URI[once_cell-1.15.0.sha256sum] = "e82dad04139b71a90c080c8463fe0dc7902db5192d939bd0950f074d014339e1"
SRC_URI[parking_lot-0.11.2.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
SRC_URI[parking_lot_core-0.8.5.sha256sum] = "d76e8e1493bcac0d2766c42737f34458f1c8c50c0d23bcb24ea953affb273216"
SRC_URI[paste-0.1.18.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
SRC_URI[paste-impl-0.1.18.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
SRC_URI[pbkdf2-0.10.1.sha256sum] = "271779f35b581956db91a3e55737327a03aa051e90b1c47aeb189508533adfd7"
SRC_URI[proc-macro-hack-0.5.19.sha256sum] = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5"
SRC_URI[proc-macro2-1.0.46.sha256sum] = "94e2ef8dbfc347b10c094890f778ee2e36ca9bb4262e86dc99cd217e35f3470b"
SRC_URI[pyo3-0.15.2.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
SRC_URI[pyo3-build-config-0.15.2.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
SRC_URI[pyo3-macros-0.15.2.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
SRC_URI[pyo3-macros-backend-0.15.2.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
SRC_URI[quote-1.0.21.sha256sum] = "bbe448f377a7d6961e30f5955f9b8d106c3f5e449d493ee1b125c1d43c2b5179"
SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
SRC_URI[sha2-0.10.6.sha256sum] = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
SRC_URI[subtle-2.4.1.sha256sum] = "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
SRC_URI[syn-1.0.102.sha256sum] = "3fcd952facd492f9be3ef0d0b7032a6e442ee9b361d4acc2b1d0c4aaa5f613a1"
SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
SRC_URI[unicode-ident-1.0.4.sha256sum] = "dcc811dc4066ac62f84f11307873c4850cb653bfa9b1719cee2bd2204a4bc5dd"
SRC_URI[unindent-0.1.10.sha256sum] = "58ee9362deb4a96cef4d437d1ad49cffc9b9e92d202b6995674e928ce684f112"
SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
SRC_URI[zeroize-1.5.7.sha256sum] = "c394b5bd0c6f669e7275d9c20aa90ae064cb22e75a1cad54e1b34088034b149f"
ERROR: python3-bcrypt-4.1.1-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-bcrypt/4.1.1/temp/log.do_fetch.1909875
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb:do_fetch) failed with exit code '1'

--===============0694085461278091453==--

