Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065AED60042
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4781.1731964601435238992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TuI1fh7J;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QMKegj7A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101934122ae9c-beb0ac73-9840-4e08-b143-10c170c1b409-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=StkkO1tPO1bgWKTw8l5/AeD4y92x+mqqLdz3DeWROKU=;
	b=TuI1fh7JObjW7sIuYfE2a0T1BIQj6m1YhQJ4gsSJQmLOq71F9krwENl8WKH8LZyr
	/jKca7t7zwUYJKNWXa23AW86mb+pq/jbNB+dkodGLD1EeLTNofu7PxVexSXjO3kqNVi
	kB1wn4x8oZ56V2hzGUttJGB4+BJnkbvV9TzfKmh0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=StkkO1tPO1bgWKTw8l5/AeD4y92x+mqqLdz3DeWROKU=;
	b=QMKegj7AsvG8SU76vOt7jknyDIO6IRw0NJcBGrEXnKYlSacotX5WoUXrjB7KHyRy
	LfYktSBw4m+nMcRtCfqCV6AJrIbrKYjQbKDFTTA+wGxFs5BowYSvsZak+6iso55Gd+n
	KaD8SL/kgxng/PEFioL4HtJgUTkajLOtKzb87PU8=
Content-Type: multipart/mixed; boundary="===============0895703096617703001=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] chrpath: upgrading to 0.18 SUCCEEDED
Message-ID: <010101934122ae9c-beb0ac73-9840-4e08-b143-10c170c1b409-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207256

--===============0895703096617703001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *chrpath* to *0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-chrpath-upgrade-0.16-0.18.patch
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
From af20ccf304002823261d1abccdd91ae1aceedbe6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 07:51:54 +0000
Subject: [PATCH] chrpath: upgrade 0.16 -> 0.18

---
 meta/recipes-devtools/chrpath/chrpath/standarddoc.patch      | 5 +----
 .../chrpath/{chrpath_0.16.bb => chrpath_0.18.bb}             | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/chrpath/{chrpath_0.16.bb => chrpath_0.18.bb} (85%)

diff --git a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
index 3d303fbc6f..b22e1f5f9b 100644
--- a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
+++ b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
@@ -1,4 +1,4 @@
-From 285b5fbf1d6b25ff55d305c17edf4d327bf19dd3 Mon Sep 17 00:00:00 2001
+From cc3219f01501904daec28d48e450f628f644bc3c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 5 Jul 2011 23:42:29 +0100
 Subject: [PATCH] chrpath: Ensure the package respects the docdir variable
@@ -27,6 +27,3 @@ index b50ad21..5f7e861 100644
  doc_DATA = AUTHORS COPYING ChangeLog INSTALL NEWS README
  
  bin_PROGRAMS = chrpath
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
similarity index 85%
rename from meta/recipes-devtools/chrpath/chrpath_0.16.bb
rename to meta/recipes-devtools/chrpath/chrpath_0.18.bb
index d33c7837a1..c4abc11e8f 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://standarddoc.patch"
 
-SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
-SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
+SRC_URI[sha256sum] = "f09c49f0618660ca11fc6d9580ddde904c7224d4c6d0f6f2d1f9bcdc9102c9aa"
 
 inherit autotools
 
@@ -21,4 +20,5 @@ CHRPATH_BIN:class-native = "${B}/chrpath"
 PROVIDES:append:class-native = " chrpath-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
+S = "${WORKDIR}/chrpath"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============0895703096617703001==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-chrpath-upgrade-0.16-0.18.patch"

RnJvbSBhZjIwY2NmMzA0MDAyODIzMjYxZDFhYmNjZGQ5MWFlMWFjZWVkYmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDc6NTE6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
aHJwYXRoOiB1cGdyYWRlIDAuMTYgLT4gMC4xOAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y2hycGF0aC9jaHJwYXRoL3N0YW5kYXJkZG9jLnBhdGNoICAgICAgfCA1ICstLS0tCiAuLi4vY2hy
cGF0aC97Y2hycGF0aF8wLjE2LmJiID0+IGNocnBhdGhfMC4xOC5iYn0gICAgICAgICAgICAgfCA0
ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jaHJwYXRoL3tjaHJwYXRoXzAuMTYuYmIgPT4g
Y2hycGF0aF8wLjE4LmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jaHJwYXRoL2NocnBhdGgvc3RhbmRhcmRkb2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY2hycGF0aC9jaHJwYXRoL3N0YW5kYXJkZG9jLnBhdGNoCmluZGV4IDNkMzAzZmJjNmYuLmIy
MmUxZjVmOWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jaHJwYXRoL2NocnBh
dGgvc3RhbmRhcmRkb2MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NocnBhdGgv
Y2hycGF0aC9zdGFuZGFyZGRvYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjg1YjVmYmYx
ZDZiMjVmZjU1ZDMwNWMxN2VkZjRkMzI3YmYxOWRkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gY2MzMjE5ZjAxNTAxOTA0ZGFlYzI4ZDQ4ZTQ1MGY2MjhmNjQ0YmMzYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogVHVlLCA1IEp1bCAyMDExIDIzOjQyOjI5ICswMTAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGNocnBhdGg6IEVuc3VyZSB0aGUgcGFja2FnZSByZXNwZWN0cyB0aGUg
ZG9jZGlyIHZhcmlhYmxlCkBAIC0yNyw2ICsyNywzIEBAIGluZGV4IGI1MGFkMjEuLjVmN2U4NjEg
MTAwNjQ0CiAgZG9jX0RBVEEgPSBBVVRIT1JTIENPUFlJTkcgQ2hhbmdlTG9nIElOU1RBTEwgTkVX
UyBSRUFETUUKICAKICBiaW5fUFJPR1JBTVMgPSBjaHJwYXRoCi0tLSAKLTIuOC4xCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jaHJwYXRoL2NocnBhdGhfMC4xNi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jaHJwYXRoL2NocnBhdGhfMC4xOC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2hycGF0aC9jaHJwYXRo
XzAuMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jaHJwYXRoL2NocnBhdGhf
MC4xOC5iYgppbmRleCBkMzNjNzgzN2ExLi5jNGFiYzExZThmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2hycGF0aC9jaHJwYXRoXzAuMTYuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NocnBhdGgvY2hycGF0aF8wLjE4LmJiCkBAIC05LDggKzksNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01OTUzMGJkZjMzNjU5YjI5ZTczZDRhZGI5
ZjlmNjU1MiIKIFNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL2MvJHtCUE59LyR7QlBO
fV8ke1BWfS5vcmlnLnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9zdGFuZGFyZGRvYy5wYXRj
aCIKIAotU1JDX1VSSVttZDVzdW1dID0gIjJiZjhkMWQxZWUzNDVmYzhhNzkxNTU3NmY1NjQ5OTgy
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJiMGQ0YzU0YmFjMjk5MGUxYmRmODEzMmYyYzk0Nzdh
ZTc1Mjg1OWQ1MjNlMTQxZTcyYjNiMTFhMTJjMjZlN2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZjA5YzQ5ZjA2MTg2NjBjYTExZmM2ZDk1ODBkZGRlOTA0YzcyMjRkNGM2ZDBmNmYyZDFmOWJjZGM5
MTAyYzlhYSIKIAogaW5oZXJpdCBhdXRvdG9vbHMKIApAQCAtMjEsNCArMjAsNSBAQCBDSFJQQVRI
X0JJTjpjbGFzcy1uYXRpdmUgPSAiJHtCfS9jaHJwYXRoIgogUFJPVklERVM6YXBwZW5kOmNsYXNz
LW5hdGl2ZSA9ICIgY2hycGF0aC1yZXBsYWNlbWVudC1uYXRpdmUiCiBOQVRJVkVfUEFDS0FHRV9Q
QVRIX1NVRkZJWCA9ICIvJHtQTn0iCiAKK1MgPSAiJHtXT1JLRElSfS9jaHJwYXRoIgogQkJDTEFT
U0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40NC4xCgo=

--===============0895703096617703001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/chrpath/chrpath-doc: PKGSIZE changed from 53208 to 42988 (-19%)
packages/core2-64-poky-linux/chrpath/chrpath-src: PKGSIZE changed from 18394 to 21778 (+18%)
packages/core2-64-poky-linux/chrpath/chrpath: PKGSIZE changed from 18744 to 22840 (+22%)

--===============0895703096617703001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/chrpath/chrpath-dbg: PKGSIZE changed from 43632 to 47952 (+10%)
packages/core2-64-poky-linux/chrpath/chrpath-dbg: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-dbg: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath-dev: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-dev: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath-doc: PKGSIZE changed from 53208 to 42988 (-19%)
packages/core2-64-poky-linux/chrpath/chrpath-doc: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-doc: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath-locale: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-locale: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath-src: PKGSIZE changed from 18394 to 21778 (+18%)
packages/core2-64-poky-linux/chrpath/chrpath-src: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-src: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath-staticdev: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath-staticdev: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath/chrpath: PKGSIZE changed from 18744 to 22840 (+22%)
packages/core2-64-poky-linux/chrpath/chrpath: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath/chrpath: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-64-poky-linux/chrpath: PV changed from "0.16" to "0.18"
packages/core2-64-poky-linux/chrpath: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/c/chrpath/chrpath_0.16.orig.tar.gz file://standarddoc.patch" to "http://ftp.debian.org/debian/pool/main/c/chrpath/chrpath_0.18.orig.tar.gz file://standarddoc.patch"

--===============0895703096617703001==--

