Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF85BE7719A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.33385.1734254985283714179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rag0oYHo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FBWz5TKN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6fe22-691b8ba7-2da9-4ef3-bd1b-0547ba2c8df7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N2/Z/fUIwpjifPSj57Z+q/TW/sJFSfJi0BzqHieOFag=;
	b=Rag0oYHoEM89X+TADk3XaLLtxOXTgy/o5YED1OrCfyOJsq9/2kielblS7e6wa5H8
	42WQFChnlEJTMAICFNIoi5UMAC4sGTcOfw8wbRmcaDOvBcAS1cwd4Yqc8ZUH/n6H6m7
	PNblakmtMuJZqBFB1PmDSBzG42hi0Z+gkT5fBNA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N2/Z/fUIwpjifPSj57Z+q/TW/sJFSfJi0BzqHieOFag=;
	b=FBWz5TKNDkz9WYLAUpvH3L1d8VG7zmLYtxbPqjdMyK5NQ0BKOZmfKZX/GJFcAsFo
	mib2J4g/lMBMkRB4kTppwRp32oc97f3ccvsj0BSouYsGX1raZrNomxsQ3drS1WT4crY
	CslwBkP2HkLfWXg6yYolq0WaPVV9UjNiGD06Zq20=
Content-Type: multipart/mixed; boundary="===============5336777451262696475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] subversion: upgrading to 1.14.5 SUCCEEDED
Message-ID: <01010193c9a6fe22-691b8ba7-2da9-4ef3-bd1b-0547ba2c8df7-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208723

--===============5336777451262696475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *subversion* to *1.14.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-subversion-upgrade-1.14.4-1.14.5.patch
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
From d39146c279f7096a33fe41f02861dbd98f3f56f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:34:25 +0000
Subject: [PATCH] subversion: upgrade 1.14.4 -> 1.14.5

---
 .../subversion/subversion/serfmacro.patch                 | 8 +++++---
 .../{subversion_1.14.4.bb => subversion_1.14.5.bb}        | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.4.bb => subversion_1.14.5.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..960862d391 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From e92b9b440b2ceb338d2554247d35c099c22e0976 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.4.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.4.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 0f453db247..c8a2e12f4f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.4.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "44ead116e72e480f10f123c914bb6f9f8c041711c041ed7abff1b8634a199e3c"
+SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.44.1


--===============5336777451262696475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/subversion: SRC_URI changed from "https://archive.apache.org/dist/subversion/subversion-1.14.4.tar.bz2 file://serfmacro.patch" to "https://archive.apache.org/dist/subversion/subversion-1.14.5.tar.bz2 file://serfmacro.patch"
packages/core2-64-poky-linux/subversion: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-dbg: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGSIZE changed from 15692760 to 15693096 (+0%)
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-dev: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-dev: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-doc: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-doc: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-de: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-de: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-es: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-es: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-it: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-it: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-src: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-src: PKGSIZE changed from 19964705 to 19965211 (+0%)
packages/core2-64-poky-linux/subversion/subversion-src: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion-staticdev: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion-staticdev: PKGV changed from 1.14.4 [default] to 1.14.5 [default]
packages/core2-64-poky-linux/subversion/subversion: PV changed from "1.14.4" to "1.14.5"
packages/core2-64-poky-linux/subversion/subversion: PKGV changed from 1.14.4 [default] to 1.14.5 [default]

--===============5336777451262696475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-subversion-upgrade-1.14.4-1.14.5.patch"

RnJvbSBkMzkxNDZjMjc5ZjcwOTZhMzNmZTQxZjAyODYxZGJkOThmM2Y1NmYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6MzQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dWJ2ZXJzaW9uOiB1cGdyYWRlIDEuMTQuNCAtPiAxLjE0LjUKCi0tLQogLi4uL3N1YnZlcnNpb24v
c3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2ggICAgICAgICAgICAgICAgIHwgOCArKysrKy0tLQog
Li4uL3tzdWJ2ZXJzaW9uXzEuMTQuNC5iYiA9PiBzdWJ2ZXJzaW9uXzEuMTQuNS5iYn0gICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24ve3N1YnZlcnNpb25fMS4x
NC40LmJiID0+IHN1YnZlcnNpb25fMS4xNC41LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0
Y2gKaW5kZXggNTA3ZGUwZjA4Yi4uOTYwODYyZDM5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gK
QEAgLTEsMyArMSw4IEBACitGcm9tIGU5MmI5YjQ0MGIyY2ViMzM4ZDI1NTQyNDdkMzVjMDk5YzIy
ZTA5NzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CitEYXRlOiBXZWQsIDcgRGVjIDIwMTYgMTM6NTQ6MTggKzAwMDAK
K1N1YmplY3Q6IFtQQVRDSF0gc3VidmVyc2lvbjogRml4IGlzc3VlcyBpbiBMREZMQUdTIHNlZCBt
YW5pcHVsYXRpb24KKwogVGhlIGV4aXN0aW5nIHNlZCBleHByZXNzaW9uIGNhbiBtYXRjaCBleHBy
ZXNzaW9ucyBsaWtlCiAtLXN5c3Jvb3Q9L3NvbWUvcGF0aC94eHgtbGludXgvIHdoaWNoIGNsZWFy
bHkgaXNuJ3QgaW50ZW5kZWQgYW5kIGluamVjdHMKIGluY29ycmVjdCBwYXRocyBpbnRvIExERkxB
R1MuCkBAIC0yNiw2ICszMSwzIEBAIGluZGV4IDBhNTQ5YjMuLjNhMDY5YWMgMTAwNjQ0CiAgICAg
ICAgICAgIGJyZWFrCiAgICAgICAgICBlbHNlCiAgICAgICAgICAgIEFDX01TR19SRVNVTFQoW25v
XSkKLS0tIAotMi43LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZl
cnNpb24vc3VidmVyc2lvbl8xLjE0LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVy
c2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVyc2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0
LjUuYmIKaW5kZXggMGY0NTNkYjI0Ny4uYzhhMmUxMmY0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjUuYmIKQEAgLTEyLDcg
KzEyLDcgQEAgU1JDX1VSSSA9ICIke0FQQUNIRV9NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0u
dGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9zZXJmbWFjcm8ucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NGVhZDExNmU3MmU0ODBmMTBmMTIzYzkxNGJi
NmY5ZjhjMDQxNzExYzA0MWVkN2FiZmYxYjg2MzRhMTk5ZTNjIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU3OGEyOWU3NzY2YjhiN2IzNTQ0OTdkMDhmNzFhNTU2NDFhYmM1MzY3NWNlMTg3NTU4NDc4
MWFhZTM1NjQ0YTEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnZXR0ZXh0IHB5dGhv
bjNuYXRpdmUKIAotLSAKMi40NC4xCgo=

--===============5336777451262696475==--

