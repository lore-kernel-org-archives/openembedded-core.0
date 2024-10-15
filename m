Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2602D1F9B2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.11854.1728994543542050850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NaJWqDLl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2kAYBKBE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010192901b4fce-9a29c9ed-6175-4b13-9d2a-c240222f2571-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b5bneR5wO0EF4n3ISMixQMA0KUf2IVHuz+8blTWfGkY=;
	b=NaJWqDLlgBhyVWhKlrhrue7Jsv3comeBQfzsYVHtn25JGnsB9+c0mikLbm+rsG78
	yoncITMww38Qtq2E69687xctb0EiBOC0DCsMNN2Mz/Vaxm1gnXKM62DJG/JqmsAVJK4
	I/Im0GpcpNusuxSYnuZ4Rxdre1ixSHGQAv09RBuY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b5bneR5wO0EF4n3ISMixQMA0KUf2IVHuz+8blTWfGkY=;
	b=2kAYBKBEg6dmQT0n0mwVYKaG4O5aswJM9yhVpOC+6Uw39VG0kPn8ZhOtIIb0lgAE
	figSQJd82J3xD8t299tZ8YxNMaarvMpRByhH6TcHcbe7wEYzT7PjGgkc8JJnE7MRJBQ
	c0Vev7HZsnW5n771qvXawvl8XHNnizGoAE3kWB0s=
Content-Type: multipart/mixed; boundary="===============8425865959645780661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] subversion: upgrading to 1.14.4 SUCCEEDED
Message-ID: <01010192901b4fce-9a29c9ed-6175-4b13-9d2a-c240222f2571-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205860

--===============8425865959645780661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *subversion* to *1.14.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-subversion-upgrade-1.14.3-1.14.4.patch
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
From 43cc1eb3244569eb64ddb5f15d2d6fdb03ecc8c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 09:20:36 +0000
Subject: [PATCH] subversion: upgrade 1.14.3 -> 1.14.4

---
 .../subversion/subversion/serfmacro.patch                 | 8 +++++---
 .../{subversion_1.14.3.bb => subversion_1.14.4.bb}        | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.3.bb => subversion_1.14.4.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..c53089460d 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From 1d277f27108aa03c2a1d328a1787027da7516c46 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 7 Dec 2016 13:54:18 +0000
+Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
+
 The existing sed expression can match expressions like
 --sysroot=/some/path/xxx-linux/ which clearly isn't intended and injects
 incorrect paths into LDFLAGS.
@@ -26,6 +31,3 @@ index 0a549b3..3a069ac 100644
            break
          else
            AC_MSG_RESULT([no])
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.4.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.3.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.4.bb
index 1cf4e1734b..0f453db247 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440"
+SRC_URI[sha256sum] = "44ead116e72e480f10f123c914bb6f9f8c041711c041ed7abff1b8634a199e3c"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.44.1


--===============8425865959645780661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-subversion-upgrade-1.14.3-1.14.4.patch"

RnJvbSA0M2NjMWViMzI0NDU2OWViNjRkZGI1ZjE1ZDJkNmZkYjAzZWNjOGMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDk6MjA6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dWJ2ZXJzaW9uOiB1cGdyYWRlIDEuMTQuMyAtPiAxLjE0LjQKCi0tLQogLi4uL3N1YnZlcnNpb24v
c3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2ggICAgICAgICAgICAgICAgIHwgOCArKysrKy0tLQog
Li4uL3tzdWJ2ZXJzaW9uXzEuMTQuMy5iYiA9PiBzdWJ2ZXJzaW9uXzEuMTQuNC5iYn0gICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24ve3N1YnZlcnNpb25fMS4x
NC4zLmJiID0+IHN1YnZlcnNpb25fMS4xNC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0
Y2gKaW5kZXggNTA3ZGUwZjA4Yi4uYzUzMDg5NDYwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gK
QEAgLTEsMyArMSw4IEBACitGcm9tIDFkMjc3ZjI3MTA4YWEwM2MyYTFkMzI4YTE3ODcwMjdkYTc1
MTZjNDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CitEYXRlOiBXZWQsIDcgRGVjIDIwMTYgMTM6NTQ6MTggKzAwMDAK
K1N1YmplY3Q6IFtQQVRDSF0gc3VidmVyc2lvbjogRml4IGlzc3VlcyBpbiBMREZMQUdTIHNlZCBt
YW5pcHVsYXRpb24KKwogVGhlIGV4aXN0aW5nIHNlZCBleHByZXNzaW9uIGNhbiBtYXRjaCBleHBy
ZXNzaW9ucyBsaWtlCiAtLXN5c3Jvb3Q9L3NvbWUvcGF0aC94eHgtbGludXgvIHdoaWNoIGNsZWFy
bHkgaXNuJ3QgaW50ZW5kZWQgYW5kIGluamVjdHMKIGluY29ycmVjdCBwYXRocyBpbnRvIExERkxB
R1MuCkBAIC0yNiw2ICszMSwzIEBAIGluZGV4IDBhNTQ5YjMuLjNhMDY5YWMgMTAwNjQ0CiAgICAg
ICAgICAgIGJyZWFrCiAgICAgICAgICBlbHNlCiAgICAgICAgICAgIEFDX01TR19SRVNVTFQoW25v
XSkKLS0tIAotMi43LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZl
cnNpb24vc3VidmVyc2lvbl8xLjE0LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVy
c2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVyc2lvbi9zdWJ2ZXJzaW9uXzEuMTQuMy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0
LjQuYmIKaW5kZXggMWNmNGUxNzM0Yi4uMGY0NTNkYjI0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjQuYmIKQEAgLTEyLDcg
KzEyLDcgQEAgU1JDX1VSSSA9ICIke0FQQUNIRV9NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0u
dGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9zZXJmbWFjcm8ucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDllZmQ0NTFhMDk0MzVmN2U4NTczNTc0Yzcx
YzdiNzFiMTk0ZDg0NDg5MGZhNDljZDYxZDIyNjJlYTFhNDQwIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjQ0ZWFkMTE2ZTcyZTQ4MGYxMGYxMjNjOTE0YmI2ZjlmOGMwNDE3MTFjMDQxZWQ3YWJmZjFi
ODYzNGExOTllM2MiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnZXR0ZXh0IHB5dGhv
bjNuYXRpdmUKIAotLSAKMi40NC4xCgo=

--===============8425865959645780661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/subversion: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion: SRC_URI changed from "https://archive.apache.org/dist/subversion/subversion-1.14.3.tar.bz2 file://serfmacro.patch" to "https://archive.apache.org/dist/subversion/subversion-1.14.4.tar.bz2 file://serfmacro.patch"
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGSIZE changed from 14515528 to 14519184 (+0%)
packages/core2-64-poky-linux/subversion/subversion-dbg: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-dev: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-dev: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-doc: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-doc: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-de: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-de: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-es: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-es: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-it: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-it: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-src: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-src: PKGSIZE changed from 19958533 to 19964705 (+0%)
packages/core2-64-poky-linux/subversion/subversion-src: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion-staticdev: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion-staticdev: PV changed from "1.14.3" to "1.14.4"
packages/core2-64-poky-linux/subversion/subversion: PKGV changed from 1.14.3 [default] to 1.14.4 [default]
packages/core2-64-poky-linux/subversion/subversion: PV changed from "1.14.3" to "1.14.4"

--===============8425865959645780661==--

