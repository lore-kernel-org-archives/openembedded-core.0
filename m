Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAF5C2D0CE
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1240.1715794337546557322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VwsTw/9y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RhJJ2yb8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe026-fface2c3-a3ee-4efd-8ac7-4250f1fedeae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3jYjapqWQ7gzs5o9duPgwcqpC8RGi/5HZWTIyUrUCpE=;
	b=VwsTw/9yWDXmvY652c/2eD+/6I4WU7YclW+dus5KAcHlzgrslBrfWbIoD3yFYwBD
	A6sTWuLhxo9KqBWmqAKnLUQ5Kh7LQe1YIW5jeE9NB4qAszWC2RZ5V11O5SXMh4r5PxR
	mzdHD7jC3ipCbQB+tkguGHC99UDTGfQcKIRcLbSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3jYjapqWQ7gzs5o9duPgwcqpC8RGi/5HZWTIyUrUCpE=;
	b=RhJJ2yb87s3TlmE8rxa2iG2UvayfFElQm9rOiOraP9J0EAAqHS1X9fIHss+P6Tha
	DMAJnJtW4Wy0myW3ySQ1dSy54FsmIXKdORlwfbEUHiEKNLTGyamC06JZWxSrmV2C4Xd
	5PUKjAzHfgEesmzuGHJMj1UFTQiFvMhPMKB6pe9c=
Content-Type: multipart/mixed; boundary="===============6647927767398976969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.18.1 FAILED
Message-ID: <0101018f7d4fe026-fface2c3-a3ee-4efd-8ac7-4250f1fedeae-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199348

--===============6647927767398976969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-rpds-py* to *0.18.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.18.0-0.18.1.patch
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
From 3ceceb3fd760bdb5b2ce8c2d40fe7e37bb332ab0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 10:09:27 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.18.0 -> 0.18.1

---
 .../python/python3-rpds-py-crates.inc         | 37 -------------------
 ...py_0.18.0.bb => python3-rpds-py_0.18.1.bb} |  2 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.18.0.bb => python3-rpds-py_0.18.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index b9048bde51..7e1f0f4749 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -41,40 +41,3 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
 "
 
-SRC_URI[archery-1.1.0.sha256sum] = "487955f60962765486ce000015a3492ca45c34a2ebbf12bc0aa2b5110ca6e7d2"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
-SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
-SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
-SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
-SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
-SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[smallvec-1.11.0.sha256sum] = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
-SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
-SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
-SRC_URI[triomphe-0.1.9.sha256sum] = "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
-SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
index cece2cb8cc..c6e88d88d7 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "42821446ee7a76f5d9f71f9e33a4fb2ffd724bb3e7f93386150b61a43115788d"
+SRC_URI[sha256sum] = "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
 
 require ${BPN}-crates.inc
 
-- 
2.44.0


--===============6647927767398976969==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.18.0-0.18.1.patch"

RnJvbSAzY2VjZWIzZmQ3NjBiZGI1YjJjZThjMmQ0MGZlN2UzN2JiMzMyYWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTA6MDk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4xOC4wIC0+IDAuMTguMQoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi5weV8wLjE4LjAuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMTguMS5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzggZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ycGRzLXB5XzAuMTguMC5i
YiA9PiBweXRob24zLXJwZHMtcHlfMC4xOC4xLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCmluZGV4
IGI5MDQ4YmRlNTEuLjdlMWYwZjQ3NDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwpAQCAtNDEsNDAgKzQxLDMg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9t
c3ZjLzAuNDguMCBcCiAiCiAKLVNSQ19VUklbYXJjaGVyeS0xLjEuMC5zaGEyNTZzdW1dID0gIjQ4
Nzk1NWY2MDk2Mjc2NTQ4NmNlMDAwMDE1YTM0OTJjYTQ1YzM0YTJlYmJmMTJiYzBhYTJiNTExMGNh
NmU3ZDIiCi1TUkNfVVJJW2F1dG9jZmctMS4xLjAuc2hhMjU2c3VtXSA9ICJkNDY4ODAyYmFiMTdj
YmMwY2M1NzVlOWIwNTNmNDFlNzJhYTM2YmZhNmI3ZjU1ZTM1MjlmZmE0MzE2MWI5N2ZhIgotU1JD
X1VSSVtiaXRmbGFncy0xLjMuMi5zaGEyNTZzdW1dID0gImJlZjM4ZDQ1MTYzYzJmMWRkZTA5NGE3
ZGZkMzNjY2Y1OTVjOTI5MDVjOGY4ZjRmZGMxOGQwNmZiMTAzNzcxOGEiCi1TUkNfVVJJW2NmZy1p
Zi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTllM2NiYzAxMjBlZTU4
MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCi1TUkNfVVJJW2hlY2stMC40LjEuc2hhMjU2
c3VtXSA9ICI5NTUwNWMzOGI0NTcyYjJkOTEwY2VjYjAyODE1NjBmNTRiNDQwYTE5MzM2Y2JiY2Iy
N2JmNmNlNmFkYzZmNWE4IgotU1JDX1VSSVtpbmRvYy0yLjAuNC5zaGEyNTZzdW1dID0gIjFlMTg2
Y2ZiYWU4MDg0ZTUxM2RhZmY0MjQwYjQ3OTdlMzQyZjk4OGNlY2RhNGZiNmM5MzkxNTBmOTYzMTVm
ZDgiCi1TUkNfVVJJW2xpYmMtMC4yLjE0Ny5zaGEyNTZzdW1dID0gImI0NjY4ZmIwZWE4NjFjMWRm
MDk0MTI3YWM1ZjFkYTM0MDlhODIxMTZhNGJhNzRmY2EyZTU4ZWY5MjcxNTliYjMiCi1TUkNfVVJJ
W2xvY2tfYXBpLTAuNC4xMC5zaGEyNTZzdW1dID0gImMxY2M5NzE3YTIwYjFiYjIyMmYzMzNlNmE5
MmZkMzJmN2Q4YTE4ZGRjNWEzMTkxYTExYWY0NWRjYmY0ZGNkMTYiCi1TUkNfVVJJW21lbW9mZnNl
dC0wLjkuMC5zaGEyNTZzdW1dID0gIjVhNjM0YjFjNjFhOTU1ODViZDE1NjA3YzZhYjBjNGU1YjIy
NmU2OTVmZjI4MDBiYTBjZGNjZGRmMjA4YzQwNmMiCi1TUkNfVVJJW29uY2VfY2VsbC0xLjE4LjAu
c2hhMjU2c3VtXSA9ICJkZDhiNWRkMmFlNWVkNzE0NjJjNTQwMjU4YmVkY2I1MTk2NTEyM2FkN2U3
Y2NmNGI5YThjYWZhYTRhNjM1NzZkIgotU1JDX1VSSVtwYXJraW5nX2xvdC0wLjEyLjEuc2hhMjU2
c3VtXSA9ICIzNzQyYjJjMTAzYjlmMDZiYzlmZmYwYTM3ZmY0OTEyOTM1ODUxYmVlNmQzNmYzYzAy
YmNjNzU1YmNmZWMyMjhmIgotU1JDX1VSSVtwYXJraW5nX2xvdF9jb3JlLTAuOS44LnNoYTI1NnN1
bV0gPSAiOTNmMDBjODY1ZmU3Y2FiZjY1MDA4MWFmZmVjZDM4NzEwNzBmMjY3NjdlN2IyMDcwYTNm
ZmFlMTRjNjU0YjQ0NyIKLVNSQ19VUklbcHJvYy1tYWNybzItMS4wLjY2LnNoYTI1NnN1bV0gPSAi
MThmYjMxZGIzZjliZGRiMmVhODIxY2RlMzBhOWY3MDExN2UzZjExOTkzOGI1ZWU2MzBiNzQwM2Fh
NmUyZWFkOSIKLVNSQ19VUklbcHlvMy0wLjIwLjIuc2hhMjU2c3VtXSA9ICI5YTg5ZGM3YTU4NTBk
MGU5ODNiZTFlYzJhNDYzYTE3MWQyMDk5MDQ4N2MzY2ZjZDY4YjUzNjNmMWVlM2Q2ZmUwIgotU1JD
X1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjIwLjIuc2hhMjU2c3VtXSA9ICIwNzQyNmYwZDhmZTVh
NjAxZjI2MjkzZjMwMGFmZDFhN2IxZWQ1ZTc4YjJhNzA1ODcwYzVmMzA4OTNjNTE2M2JlIgotU1JD
X1VSSVtweW8zLWZmaS0wLjIwLjIuc2hhMjU2c3VtXSA9ICJkYmI3ZGVjMTdlMTc3NjZiNDZiY2E0
ZjFhNDIxNWE4NTAwNmI0YzJlY2RlMTIyMDc2YzU2MmRkMDU4ZGE2Y2YxIgotU1JDX1VSSVtweW8z
LW1hY3Jvcy0wLjIwLjIuc2hhMjU2c3VtXSA9ICIwNWY3MzhiNGU0MGQ1MGI1NzExOTU3ZjE0Mjg3
OGNmYTBmMjhlMDU0YWEwZWJkZmMzZmQxMzdhODQzZjc0ZWQzIgotU1JDX1VSSVtweW8zLW1hY3Jv
cy1iYWNrZW5kLTAuMjAuMi5zaGEyNTZzdW1dID0gIjBmYzkxMGQ0ODUxODQ3ODI3ZGFmOWQ2Y2Rk
NGE4MjNmYmRhYWI1Yjg4MTgzMjVjNWU5N2E4NmRhNzllODg4MWYiCi1TUkNfVVJJW3F1b3RlLTEu
MC4zMS5zaGEyNTZzdW1dID0gIjVmZThhNjVkNjlkZDA4MDgxODRlYmI1ZjgzNmFiNTI2YmIyNTlk
YjIzYzY1N2VmYTM4NzExYjEwNzJlZTQ3ZjAiCi1TUkNfVVJJW3JlZG94X3N5c2NhbGwtMC4zLjUu
c2hhMjU2c3VtXSA9ICI1Njc2NjRmMjYyNzA5NDczOTMwYTRiZjllNTFiZjJlYmYzMzQ4ZjJlNzQ4
Y2NjNTBkZWEyMDY0Njg1OGY4ZjI5IgotU1JDX1VSSVtycGRzLTEuMS4wLnNoYTI1NnN1bV0gPSAi
YTBlMTU1MTVkM2NlMzMxMzMyNGQ4NDI2MjllYTQ5MDVjMjVhMTNmODE5NTNlYWRiODhmODU1MTZm
NTkyOTBhNCIKLVNSQ19VUklbc2NvcGVndWFyZC0xLjEuMC5zaGEyNTZzdW1dID0gImQyOWFiMGM2
ZDNmYzBlZTkyZmU2NmUyZDk5ZjcwMGVhYjE3YThkNTdkMWMxZDNiNzQ4MzgwZmIyMGJhYTc4Y2Qi
Ci1TUkNfVVJJW3NtYWxsdmVjLTEuMTEuMC5zaGEyNTZzdW1dID0gIjYyYmI0ZmVlZTQ5ZmRkOWY3
MDdlZjgwMmUyMjM2NWEzNWRlNGI3YjI5OWRlNDc2M2Q0NGJmZWE4OTk0NDJmZjkiCi1TUkNfVVJJ
W3N0YXRpY19hc3NlcnRpb25zLTEuMS4wLnNoYTI1NnN1bV0gPSAiYTJlYjkzNDliNjQ0NGIzMjY4
NzJlMTQwZWIxY2Y1ZTdjNTIyMTU0ZDY5ZTdhMGZmYjBmYjgxYzA2YjM3NTQzZiIKLVNSQ19VUklb
c3luLTIuMC4zMi5zaGEyNTZzdW1dID0gIjIzOTgxNDI4NGZkNmYxYTRmZmU0Y2E4OTM5NTJjZGQ5
M2MyMjRiNmExNTcxYzlhOWVhZGQ2NzAyOTVjMGM5ZTIiCi1TUkNfVVJJW3RhcmdldC1sZXhpY29u
LTAuMTIuOS5zaGEyNTZzdW1dID0gImRmOGU3N2NiNzU3YTYxZjUxYjk0N2VjNGE3ZTM2NDZlZmQ4
MjViNzM1NjFkYjFjMjMyYThjY2I2MzllNjExYTAiCi1TUkNfVVJJW3RyaW9tcGhlLTAuMS45LnNo
YTI1NnN1bV0gPSAiMGVlZTgwOThhZmFkM2ZiMGM1NGE5MDA3YWFiNjgwNDU1ODQxMDUwM2FkNjc2
ZDQ2MzNmOWMyNTU5YTAwYWMwZiIKLVNSQ19VUklbdW5pY29kZS1pZGVudC0xLjAuMTEuc2hhMjU2
c3VtXSA9ICIzMDFhYmFhZTQ3NWFhOTE2ODdlYjgyNTE0YjMyOGFiNDdhMjExYTUzMzAyNmNiMjVm
YzNlNTE5Yjg2YWRmYzNjIgotU1JDX1VSSVt1bmluZGVudC0wLjIuMy5zaGEyNTZzdW1dID0gImM3
ZGU3ZDczZTE3NTQ0ODdjYjU4MzY0ZWU5MDZhNDk5OTM3YTBkZmFiZDg2YmNiOTgwZmE5OWVjOGM4
ZmEyY2UiCi1TUkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjQ4LjEuc2hhMjU2c3VtXSA9ICIwNWQ0
YjE3NDkwZjcwNDk5ZjIwYjllNzkxZGNmNmEyOTk3ODVjZThhZjRkNzA5MDE4MjA2ZGM1YjQ5NTNl
OTVmIgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjQ4LjAuc2hhMjU2c3VtXSA9
ICI5MWFlNTcyZTFiNzlkYmE4ODNlMGQzMTU0NzRkZjczMDVkMTJmNTY5YjQwMGZjZjkwNTgxYjA2
MDYyZjdlMWJjIgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjQ4LjAuc2hhMjU2c3Vt
XSA9ICJiMmVmMjdlMGQ3YmRmY2ZjN2I4NjhiMzE3YzFkMzJjNjQxYTZmZTQ2MjljMTcxYjg5Mjhj
N2IwOGQ5OGQ3Y2YzIgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNDguMC5zaGEyNTZzdW1d
ID0gIjYyMmExOTYyYTdkYjgzMGQ2ZmQwYTY5NjgzYzgwYTE4ZmRhMjAxODc5ZjBmNDQ3ZjA2NWEz
Yjc0NjdkYWEyNDEiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNDguMC5zaGEyNTZzdW1d
ID0gIjQ1NDJjNmUzNjRjZTIxYmY0NWQ2OWZkZDJhOGU0NTVmYTM4ZDMxNjE1OGNmZDQzYjNhYzFj
NWIxYjE5ZjhlMDAiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjQ4LjAuc2hhMjU2c3Vt
XSA9ICJjYTJiOGE2NjFmNzYyOGNiZDIzNDQwZTUwYjA1ZDcwNWRiMzY4NmY4OTRmYzk1ODA4MjA2
MjM2NTZhZjk3NGIxIgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNDguMC5zaGEy
NTZzdW1dID0gIjc4OTZkYmMxZjQxZTA4ODcyZTlkNWU4ZjhiYWE4ZmRkMjY3N2YyOTQ2OGM0ZTE1
NjIxMDE3NGVkYzdmN2I5NTMiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC40OC4wLnNo
YTI1NnN1bV0gPSAiMWE1MTVmNTc5OWZlNDk2MWNiNTMyZjk4M2NlMmIyMzA4MjM2NmI4OThlNTJm
ZmJjZTQ1OWM4NmY2N2M4Mzc4YSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMTguMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMTguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjE4
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRz
LXB5XzAuMTguMS5iYgppbmRleCBjZWNlMmNiOGNjLi5jNmU4OGQ4OGQ3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjE4LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4xOC4xLmJi
CkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcnBk
cy1weS8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTc3NjdmYTUzN2M0NTk2YzU0MTQxZjMyODgyYzRhOTg0IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNDI4MjE0NDZlZTdhNzZmNWQ5ZjcxZjllMzNhNGZiMmZmZDcyNGJiM2U3ZjkzMzg2
MTUwYjYxYTQzMTE1Nzg4ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYzQ4YjQ3OWQ1NDA3NzBj
ODExZmJkMWViOWJhMmJiNjY5NTE4NjNlNDQ4ZWZlYzJlMmMxMDI2MjUzMjhlOTJmIgogCiByZXF1
aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDQuMAoK

--===============6647927767398976969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-93e4a49c6fd6cd4df397f7fa8bc6812f0c2c0965"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:93e4a49c6fd6cd4df397f7fa8bc6812f0c2c0965"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 346 Local 333 Mirrors 0 Missed 13 Current 350 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 413 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 696 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 567 of 2000 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-maturin-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 647 of 2000 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_fetch)
NOTE: recipe python3-maturin-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 696 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-native-1.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 696 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 696 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 696 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 1979 tasks of which 1977 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515100907.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515100907.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_fetch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-rpds-py-0.18.1-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
SRC_URI[archery-1.1.0.sha256sum] = "487955f60962765486ce000015a3492ca45c34a2ebbf12bc0aa2b5110ca6e7d2"
SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
SRC_URI[smallvec-1.11.0.sha256sum] = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
SRC_URI[triomphe-0.1.9.sha256sum] = "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
ERROR: python3-rpds-py-0.18.1-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-rpds-py/0.18.1/temp/log.do_fetch.1879479
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_fetch) failed with exit code '1'

--===============6647927767398976969==--

