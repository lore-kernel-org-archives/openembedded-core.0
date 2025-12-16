Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76086D5E129
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17192.1765872145451731656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gxal8wwV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jZiPO6vc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262e9c09-5a7a7cdf-c783-430f-a403-e5b641a3bc64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SGPfsSFXMTWn9vD0s28XcZxhbgv6Ck0Ei6d1FSvFJog=;
	b=gxal8wwVkGRufYNPqLxcY4Kdocp+UBqKdpYVs2FZRPFrsX2MGs2ZQT9KxmwEyfJn
	4iXe18LPV48gUNN0atpkKAZRf3LWmTvek4IBMDK/YH6AFdue9bMxf2Rv16ex27fxhxX
	LUTsAB3MRq83NsNzbnLTTVDcYoMk7DD4XG/pBijw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SGPfsSFXMTWn9vD0s28XcZxhbgv6Ck0Ei6d1FSvFJog=;
	b=jZiPO6vc99JYYkEN7DENkS2cx2AAWBmWGxeYC9MKhJbeXBQ1XdNSX5Q5LkT76xDU
	L/dVra7nNYlR/ORM4xjgpGK4DTeYYxnDgwrIcagMCCt1UFbi+IXI9Lve4EdwW8QldNg
	6ZEVVAYssvwP2b7dMHb+d36RDyEdevsqF9BZRLsk=
Content-Type: multipart/mixed; boundary="===============4732626665988129884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.30.0 SUCCEEDED
Message-ID: <0101019b262e9c09-5a7a7cdf-c783-430f-a403-e5b641a3bc64-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227823

--===============4732626665988129884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.30.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.27.1-0.30.0.patch
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
From 8bfc5d252494d60a1743755011e2164f25b049ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:16:15 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.27.1 -> 0.30.0

---
 .../python/python3-rpds-py-crates.inc         | 76 ++++++++++---------
 ...py_0.27.1.bb => python3-rpds-py_0.30.0.bb} |  2 +-
 2 files changed, 41 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.27.1.bb => python3-rpds-py_0.30.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index a0b669df2d..c9e354ac04 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,53 +2,57 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.1 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/cc/1.2.25 \
+    crate://crates.io/archery/1.2.2 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/cc/1.2.48 \
+    crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.6 \
-    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/libc/0.2.177 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.1 \
-    crate://crates.io/pyo3-build-config/0.25.1 \
-    crate://crates.io/pyo3-ffi/0.25.1 \
-    crate://crates.io/pyo3-macros/0.25.1 \
-    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/pyo3/0.27.2 \
+    crate://crates.io/pyo3-build-config/0.27.2 \
+    crate://crates.io/pyo3-ffi/0.27.2 \
+    crate://crates.io/pyo3-macros/0.27.2 \
+    crate://crates.io/pyo3-macros-backend/0.27.2 \
     crate://crates.io/python3-dll-a/0.2.14 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/rpds/1.1.1 \
+    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/rpds/1.2.0 \
+    crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.101 \
-    crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/triomphe/0.1.14 \
-    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/syn/2.0.111 \
+    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/triomphe/0.1.15 \
+    crate://crates.io/unicode-ident/1.0.22 \
     crate://crates.io/unindent/0.2.4 \
 "
 
-SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[cc-1.2.25.sha256sum] = "d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951"
+SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
+SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
-SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
-SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
-SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
-SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
+SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
+SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
+SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
+SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
+SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
+SRC_URI[rpds-1.2.0.sha256sum] = "9e75f485e819d4d3015e6c0d55d02a4fd3db47c1993d9e603e0361fba2bffb34"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[triomphe-0.1.14.sha256sum] = "ef8f7726da4807b58ea5c96fdc122f80702030edc33b35aff9190a51148ccc85"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[triomphe-0.1.15.sha256sum] = "dd69c5aa8f924c7519d6372789a74eac5b94fb0f8fcf0d4a97eb0bfc3e785f39"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
index dfaffb6546..bef2cf52d2 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "26a1c73171d10b7acccbded82bf6a586ab8203601e565badc74bbbf8bc5a10f8"
+SRC_URI[sha256sum] = "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============4732626665988129884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: FILELIST: removed "/usr/lib/python3-rpds-py/ptest/tests/requirements.in /usr/lib/python3-rpds-py/ptest/tests/requirements.txt", added "/usr/lib/python3-rpds-py/ptest/tests/test_stack.py"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 30026 to 33645 (+12%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info -> /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info

--===============4732626665988129884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.27.1-0.30.0.patch"

RnJvbSA4YmZjNWQyNTI0OTRkNjBhMTc0Mzc1NTAxMWUyMTY0ZjI1YjA0OWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MTY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4yNy4xIC0+IDAuMzAuMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCA3NiArKysrKysrKysrLS0tLS0t
LS0tCiAuLi5weV8wLjI3LjEuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMzAuMC5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMC4yNy4x
LmJiID0+IHB5dGhvbjMtcnBkcy1weV8wLjMwLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKaW5k
ZXggYTBiNjY5ZGYyZC4uYzllMzU0YWMwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCkBAIC0yLDUzICsyLDU3
IEBACiAKICMgZnJvbSBDYXJnby5sb2NrCiBTUkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FyY2hlcnkvMS4yLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS40
LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMi4yNSBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXJjaGVyeS8xLjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjUu
MCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjQ4IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9maW5kLW1zdmMtdG9vbHMvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hlY2sv
MC41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC42IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9saWJjLzAuMi4xNzIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIu
MC43IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzcgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9j
ZWxsLzEuMjEuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjk1IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLzAuMjUuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1i
dWlsZC1jb25maWcvMC4yNS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjI1
LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjUuMSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjI1LjEgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjExLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3Byb2MtbWFjcm8yLzEuMC4xMDMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yNy4y
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI3LjIgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjcuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHlvMy1tYWNyb3MvMC4yNy4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jv
cy1iYWNrZW5kLzAuMjcuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHl0aG9uMy1kbGwtYS8w
LjIuMTQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40MCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcnBkcy8xLjEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4w
LjQyIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9ycGRzLzEuMi4wIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9ydXN0dmVyc2lvbi8xLjAuMjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NobGV4
LzEuMy4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjEwMSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by90cmlvbXBoZS8wLjEuMTQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQv
MS4wLjE4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjExMSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMy4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by90cmlvbXBoZS8wLjEuMTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQv
MS4wLjIyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuNCBcCiAiCiAKLVNS
Q19VUklbYXJjaGVyeS0xLjIuMS5zaGEyNTZzdW1dID0gImVhZTJlZDIxY2Q1NTAyMWYwNTcwN2E4
MDdhNWZjODU2OTVkYWZiOTg4MzI5MjFmNmNmYTA2ZGI2N2NhNWI4NjkiCi1TUkNfVVJJW2F1dG9j
ZmctMS40LjAuc2hhMjU2c3VtXSA9ICJhY2U1MGJhZGU4ZTYyMzRhYTE0MGQ5YTJmNTUyYmJlZTFk
YjRkMzUzZjY5YjgyMTdiYzUwMzQ5MGZjMWE5ZjI2IgotU1JDX1VSSVtjYy0xLjIuMjUuc2hhMjU2
c3VtXSA9ICJkMGZjODk3ZGMxZTg2NWNjNjdjMGUwNWE4MzZkOWQzZjFkZjNjYmU0NDJhYTRhOTQ3
M2IxOGUxMjYyNGE0OTUxIgorU1JDX1VSSVthcmNoZXJ5LTEuMi4yLnNoYTI1NnN1bV0gPSAiNzBl
MGE1Zjk5ZGZlYmI4N2JiMzQyZDBmNTNiYjkyYzgxODQyZTEwMGJiYjkxNTIyM2UzODM0OTU4MGU1
NDQxZCIKK1NSQ19VUklbYXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0
Y2U2ZWM4ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCitTUkNf
VVJJW2NjLTEuMi40OC5zaGEyNTZzdW1dID0gImM0ODFiZGJmMGVkM2I4OTJmNmY4MDYyODdkNzJh
Y2Q1MTViMzUyYTRlYzI3YTIwODQ4OWI4YzFiYzgzOTYzM2EiCitTUkNfVVJJW2ZpbmQtbXN2Yy10
b29scy0wLjEuNS5zaGEyNTZzdW1dID0gIjNhMzA3NjQxMGE1NWM5MDAxMWMyOThiMDRkMGNmYTc3
MGIwMGZhMDRlMWUzYzk3ZDNmNmM5ZGUxMDVhMDM4NDQiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hh
MjU2c3VtXSA9ICIyMzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNh
N2Q4MmZlMzM0NDliYmU1NWVhIgotU1JDX1VSSVtpbmRvYy0yLjAuNi5zaGEyNTZzdW1dID0gImY0
YzcyNDVhMDg1MDQ5NTU2MDU2NzBkYmYxNDFmY2VhYjk3NWYxNWNhMjE1NzA2OTZhZWJlOWQyZTcx
NTc2YmQiCi1TUkNfVVJJW2xpYmMtMC4yLjE3Mi5zaGEyNTZzdW1dID0gImQ3NTBhZjA0MmY3ZWY0
ZjcyNDMwNmRlMDI5ZDE4ODM2YzI2YzE3NjVhNTRhNmEzZjA5NGNiZDIzYTcyNjdmZmEiCitTUkNf
VVJJW2luZG9jLTIuMC43LnNoYTI1NnN1bV0gPSAiNzljZjVjOTNmOTMyMjhjZjhlZmIzYmEzNjI1
MzVmYjExMTk5YWM1NDhhMDljZTExN2M5YjFhZGMzMDMwZDcwNiIKK1NSQ19VUklbbGliYy0wLjIu
MTc3LnNoYTI1NnN1bV0gPSAiMjg3NGEyYWY0N2EyMzI1YzIwMDFhNmU2ZmFkOWIxNmE1M2I4MDIx
MDJiNTI4MTYzODg1MTcxY2Y5MmIxNTk3NiIKIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1
NnN1bV0gPSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0OWU5NzBj
ZWFmNDI2OTUyMDNmMjE4YSIKIFNSQ19VUklbb25jZV9jZWxsLTEuMjEuMy5zaGEyNTZzdW1dID0g
IjQyZjVlMTVjOTk1M2M1ZTRjY2NlZWIyZTczODJhNzE2NDgyYzM0NTE1MzE1ZjdiMDM1MzJiOGI0
ZTgzOTNkMmQiCi1TUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjExLjAuc2hhMjU2c3VtXSA9ICIz
NTBlOWI0OGNiYzZiMGUwMjhiMDQ3M2IxMTQ0NTRjNjMxNmU1NzMzNmVlMTg0Y2VhYjZlNTNmNzJj
MTc4YjNlIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuOTUuc2hhMjU2c3VtXSA9ICIwMmIzZTVl
NjhhM2ExYTAyYWFkM2VjNDkwYTk4MDA3Y2JjMTNjMzdjYmU4NGEzY2Q3YjhlNDA2ZDc2ZTdmNzc4
IgotU1JDX1VSSVtweW8zLTAuMjUuMS5zaGEyNTZzdW1dID0gIjg5NzBhNzhhZmUwNjI4YTNlMzQz
MDM3NmZjNWZkNzZiNmI0NWM0ZDQzMzYwZmZkNmNkZDQwYmRkZTcyYjY4MmEiCi1TUkNfVVJJW3B5
bzMtYnVpbGQtY29uZmlnLTAuMjUuMS5zaGEyNTZzdW1dID0gIjQ1OGViMGM1NWU3ZWNlMDE3YWRl
YmEzOGYyMjQ4ZmYzYWM2MTVlNTM2NjBkN2M3MWEyMzhkN2QyYTAxYzc1OTgiCi1TUkNfVVJJW3B5
bzMtZmZpLTAuMjUuMS5zaGEyNTZzdW1dID0gIjcxMTRmZTU0NTdjNjFiMjc2YWI3N2M1MDU1ZjIw
NjI5NWI4MTI2MDgwODM2NDRhNWM1YjI2NDBjMzEwMjU2NWMiCi1TUkNfVVJJW3B5bzMtbWFjcm9z
LTAuMjUuMS5zaGEyNTZzdW1dID0gImE4NzI1YzBhNjIyYjM3NGQ2Y2IwNTFkMTFhMDk4Mzc4NjQ0
OGY3Nzg1MzM2MTM5YzNjOTRmNWFhNmJlZjdlNTAiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tl
bmQtMC4yNS4xLnNoYTI1NnN1bV0gPSAiNDEwOTk4NGMyMjQ5MTA4NTM0M2MwNWIwZGJjNTRkZGM0
MDVjM2NmN2I0Mzc0ZmM1MzNmNWMzMzEzYTU3MmNjYyIKK1NSQ19VUklbcG9ydGFibGUtYXRvbWlj
LTEuMTEuMS5zaGEyNTZzdW1dID0gImY4NDI2N2IyMGExNmVhOTE4ZTQzYzZhODg0MzNjMmQ1NGZh
MTQ1YzkyYTgxMWI1YjA0N2NjYmUxNTM2NzQ0ODMiCitTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4x
MDMuc2hhMjU2c3VtXSA9ICI1ZWU5NWJjNGVmODdiOGQ1YmEzMmU4Yjc3MTRjY2M4MzQ4NjUyNzZl
YWIwYWVkNWM5OTU4ZDAwZWM0NWY0OWU4IgorU1JDX1VSSVtweW8zLTAuMjcuMi5zaGEyNTZzdW1d
ID0gImFiNTNjMDQ3ZmNkMWExZDJhODgyMGZlODRmMDVkNmJlNjllOTUyNmJlNDBjYjAzYjczZjg2
YjZiMDNlNmQ4N2QiCitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjcuMi5zaGEyNTZzdW1d
ID0gImI0NTU5MzMxMDdkZTg2NDJiNDQ4N2VkMjZkOTEyYzJkODk5ZGVjNjExNDg4NDIxNGEwYjNi
YjNiZTkyNjFlYTYiCitTUkNfVVJJW3B5bzMtZmZpLTAuMjcuMi5zaGEyNTZzdW1dID0gIjFjODVj
OWNiZmFkZGY2NTFiMTIyMTU5NDIwOWFlZDU3ZTllNWNmZjYzYzRkMTFkMWZlZWFkNTI5Yjg3MmEw
ODkiCitTUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjcuMi5zaGEyNTZzdW1dID0gIjBhNWIxMGM5YmY5
ODg4MTI1ZDkxN2ZiNGQyY2EyZDI1YzhkZjk0YzdhYjVhNTJlMTMzMTNhMDdlMDUwYTNiMDIiCitT
UkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yNy4yLnNoYTI1NnN1bV0gPSAiMDNiNTE3MjBk
MzE0ODM2ZTUzMzI3ZjU4NzFkNGMwY2ZiNGZiMzdjYzJjNGExMWNjNzE5MDdhODYzNDJjNDBmOSIK
IFNSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTQuc2hhMjU2c3VtXSA9ICJkMzgxZWYzMTNhZTcw
YjRkYTVmOTVmOGE0ZGU3NzNjNmFhNWNkMjhmNzNhZGVjNGI0YTMxZGY3MGI2Njc4MGQ4IgotU1JD
X1VSSVtxdW90ZS0xLjAuNDAuc2hhMjU2c3VtXSA9ICIxODg1YzAzOTU3MGRjMDBkY2I0ZmYwODdh
ODllMTg1ZmQ1NmJhZTIzNGRkYzdmMDU2YTk0NWJmMzY0NjcyNDhkIgotU1JDX1VSSVtycGRzLTEu
MS4xLnNoYTI1NnN1bV0gPSAiYTdmODlmNjU0ZDUxZmZmZGQ2MDI2Mjg5ZDA3ZDFmZDUyMzI0NGQ0
NmFlMGE4YmMyMmNhYTZkZDdmOWU4Y2IwYiIKK1NSQ19VUklbcXVvdGUtMS4wLjQyLnNoYTI1NnN1
bV0gPSAiYTMzOGNjNDFkMjdlNmNjNmRjZTZjZWZjMTNhMDcyOWRmYmI4MWMyNjJiMWY1MTkzMzE1
NzVkZDgwZWYzMDY3ZiIKK1NSQ19VUklbcnBkcy0xLjIuMC5zaGEyNTZzdW1dID0gIjllNzVmNDg1
ZTgxOWQ0ZDMwMTVlNmMwZDU1ZDAyYTRmZDNkYjQ3YzE5OTNkOWU2MDNlMDM2MWZiYTJiZmZiMzQi
CitTUkNfVVJJW3J1c3R2ZXJzaW9uLTEuMC4yMi5zaGEyNTZzdW1dID0gImIzOWNkZWYwZmE4MDBm
YzQ0NTI1Yzg0Y2NiNTRhMDI5OTYxYTgyMTVmOTYxOTc1MzYzNWE5YzBkMjUzOGQ0NmQiCiBTUkNf
VVJJW3NobGV4LTEuMy4wLnNoYTI1NnN1bV0gPSAiMGZkYTJmZjBkMDg0MDE5YmE0ZDdjNmYzNzFj
OTVkOGZkNzVjZTM1MjRjM2NiOGZiNjUzYTMwMjNmNjMyM2U2NCIKLVNSQ19VUklbc3luLTIuMC4x
MDEuc2hhMjU2c3VtXSA9ICI4Y2UyYjdmYzk0MWIzYTI0MTM4YTBhN2NmOGU4NThiZmM2YTk5MmU3
OTc4YTA2OGE1Yzc2MGRlYjBlZDQzY2FmIgotU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0wLjEzLjIu
c2hhMjU2c3VtXSA9ICJlNTAyZjc4Y2RiYjhiYTQ3MThmNTY2YzQxOGM1MmJjNzI5MTI2ZmZkMTZi
YWVlNWJhYTcxOGNmMjVkZDVhNjlhIgotU1JDX1VSSVt0cmlvbXBoZS0wLjEuMTQuc2hhMjU2c3Vt
XSA9ICJlZjhmNzcyNmRhNDgwN2I1OGVhNWM5NmZkYzEyMmY4MDcwMjAzMGVkYzMzYjM1YWZmOTE5
MGE1MTE0OGNjYzg1IgotU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xOC5zaGEyNTZzdW1dID0g
IjVhNWYzOTQwNGE1ZGE1MDcxMmE0YzFlZWNmMjVlOTBkZDYyYjYxMzUwMmI3ZTkyNWZkNGU0ZDE5
YjVjOTY1MTIiCitTUkNfVVJJW3N5bi0yLjAuMTExLnNoYTI1NnN1bV0gPSAiMzkwY2M5YTI5NGFi
NzFiZGIxYWEyZTk5ZDEzYmU5Yzc1M2NkMmQ3YmQ2NTYwYzc3MTE4NTk3NDEwYzRkMmU4NyIKK1NS
Q19VUklbdGFyZ2V0LWxleGljb24tMC4xMy4zLnNoYTI1NnN1bV0gPSAiZGY3ZjYyNTc3YzI1ZTA3
ODM0NjQ5ZmMzYjM5ZmFmZGM1OTdjMGEzNTI3ZGMxYzYwMTI5MjAxY2NmY2JhYTUwYyIKK1NSQ19V
UklbdHJpb21waGUtMC4xLjE1LnNoYTI1NnN1bV0gPSAiZGQ2OWM1YWE4ZjkyNGM3NTE5ZDYzNzI3
ODlhNzRlYWM1Yjk0ZmIwZjhmY2YwZDRhOTdlYjBiZmMzZTc4NWYzOSIKK1NSQ19VUklbdW5pY29k
ZS1pZGVudC0xLjAuMjIuc2hhMjU2c3VtXSA9ICI5MzEyZjdjNGY2ZmY5MDY5YjE2NTQ5ODIzNGNl
OGJlNjU4MDU5YzY3Mjg2MzM2NjdjNTI2ZTI3ZGMyY2YxZGY1IgogU1JDX1VSSVt1bmluZGVudC0w
LjIuNC5zaGEyNTZzdW1dID0gIjcyNjRlMTA3ZjU1M2NjYWU4NzlkMjFmYmVhMWQ2NzI0YWM3ODVl
OGMzYmZjNzYyMTM3OTU5YjU4MDI4MjZlZjMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjI3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjMwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMt
cHlfMC4yNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcnBkcy1weV8wLjMwLjAuYmIKaW5kZXggZGZhZmZiNjU0Ni4uYmVmMmNmNTJkMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNy4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAu
MzAuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9q
ZWN0L3JwZHMtcHkvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT03NzY3ZmE1MzdjNDU5NmM1NDE0MWYzMjg4MmM0YTk4NCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjI2YTFjNzMxNzFkMTBiN2FjY2NiZGVkODJiZjZhNTg2YWI4MjAzNjAx
ZTU2NWJhZGM3NGJiYmY4YmM1YTEwZjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGQ4ZmY3Y2Y5
MDAxNGFmMGMwZjc4N2VlYTM0Nzk0ZWJmNjQxNTI0MmVlMWQ2ZmE5MWVhYmE3MjVjYzQ0MWU4NCIK
IAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============4732626665988129884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.27.1.tar.gz;downloadfilename=rpds_py-0.27.1.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.4.0 crate://crates.io/cc/1.2.25 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.1 crate://crates.io/pyo3-build-config/0.25.1 crate://crates.io/pyo3-ffi/0.25.1 crate://crates.io/pyo3-macros/0.25.1 crate://crates.io/pyo3-macros-backend/0.25.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/uni
 ndent/0.2.4" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.30.0.tar.gz;downloadfilename=rpds_py-0.30.0.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/cc/1.2.48 crate://crates.io/find-msvc-tools/0.1.5 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.7 crate://crates.io/libc/0.2.177 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/pyo3/0.27.2 crate://crates.io/pyo3-build-config/0.27.2 crate://crates.io/pyo3-ffi/0.27.2 crate://crates.io/pyo3-macros/0.27.2 crate://crates.io/pyo3-macros-backend/0.27.2 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.42 crate://crates.io/rpds/1.2.0 crate://crates.io/rustversion/1.0.22 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.111 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/triomphe/0.1.15 crate://crates.io/unicode-ident/1
 .0.22 crate://crates.io/unindent/0.2.4"
packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 292672 to 289344 (-1%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: FILELIST: removed "/usr/lib/python3-rpds-py/ptest/tests/requirements.in /usr/lib/python3-rpds-py/ptest/tests/requirements.txt", added "/usr/lib/python3-rpds-py/ptest/tests/test_stack.py"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 30026 to 33645 (+12%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.27.1" to "0.30.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info -> /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.30.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 797210 to 801121 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.30.0.dist-info

--===============4732626665988129884==--

