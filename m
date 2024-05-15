Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCABC3DA70
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1285.1715794338690374338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i0sFgDdM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AR3ttRiE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe781-29ccd872-3e53-4d8b-931f-1a59f18114b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kRkDXKuOAB0+q7WZ5ZKmaxLxsfF90+ydU9I+n3Ugyio=;
	b=i0sFgDdMH5T3LNaDYsMFT2aqL6925SXD4irsAZsiMzQSs+Rxtmh98pAzrFCBAW4+
	6G2B1xMldkPXmZSUWn3tsq/wNACkDBV5qMvi3C+DDViV3MFIRtryFwswJFJvtwdvaUz
	arnvbkVaAoRe/xQPV0TnPQNk2XX9yr8GVt9oTN7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kRkDXKuOAB0+q7WZ5ZKmaxLxsfF90+ydU9I+n3Ugyio=;
	b=AR3ttRiEPL80cy1Qej6Td3mIzzN/EN5X0CKwUHeiYo17cIXWnnX7gIuJelx+SpG0
	ly2mYpvNQU8Na15OP9KtcwZm4HM3D1eQi4f4++ek+bHAKrt9+cqtpT+DCBDoNoXWBiD
	ICnxrlCh4tzqfIFiok7hO7GQRlPMpLT0qlKuXdSU=
Content-Type: multipart/mixed; boundary="===============3999023061502824502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng: upgrading to 0.8.5 SUCCEEDED
Message-ID: <0101018f7d4fe781-29ccd872-3e53-4d8b-931f-1a59f18114b4-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199375

--===============3999023061502824502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng* to *0.8.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-upgrade-0.8.4-0.8.5.patch
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
From 5c91f34d311c45557b4fa61e0abea447ec26695e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 16:46:33 +0000
Subject: [PATCH] libcap-ng: upgrade 0.8.4 -> 0.8.5

---
 .../files/fix-issues-with-swig-4-2.patch      | 32 -------------------
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  6 ++--
 ...{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} |  0
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
deleted file mode 100644
index fb424fe725..0000000000
--- a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 355eada2d20886287cffc16e304087dd6f66ae37 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <ausearch.1@gmail.com>
-Date: Thu, 4 Jan 2024 15:06:29 -0500
-Subject: [PATCH] Remove python global exception handler since its deprecated
-
-Upstream-Status: Backport [https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bindings/src/capng_swig.i | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/bindings/src/capng_swig.i b/bindings/src/capng_swig.i
-index fcdaf18..fa85e13 100644
---- a/bindings/src/capng_swig.i
-+++ b/bindings/src/capng_swig.i
-@@ -30,13 +30,6 @@
- 
- %varargs(16, signed capability = 0) capng_updatev;
- 
--%except(python) {
--  $action
--  if (result < 0) {
--    PyErr_SetFromErrno(PyExc_OSError);
--    return NULL;
--  }
--}
- #endif
- 
- %define __signed__
--- 
-2.43.2
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 845b7c2f0a..875337b954 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://fix-issues-with-swig-4-2.patch \
-           "
+SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
+SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
-- 
2.44.0


--===============3999023061502824502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-upgrade-0.8.4-0.8.5.patch"

RnJvbSA1YzkxZjM0ZDMxMWM0NTU1N2I0ZmE2MWUwYWJlYTQ0N2VjMjY2OTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6NDY6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmc6IHVwZ3JhZGUgMC44LjQgLT4gMC44LjUKCi0tLQogLi4uL2ZpbGVzL2ZpeC1pc3N1
ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaCAgICAgIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMgIHwgIDYgKystLQogLi4u
e2xpYmNhcC1uZ18wLjguNC5iYiA9PiBsaWJjYXAtbmdfMC44LjUuYmJ9IHwgIDAKIDMgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvZmlsZXMvZml4LWlzc3Vlcy13aXRo
LXN3aWctNC0yLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3ts
aWJjYXAtbmdfMC44LjQuYmIgPT4gbGliY2FwLW5nXzAuOC41LmJifSAoMTAwJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvZmlsZXMvZml4LWlzc3Vlcy13aXRo
LXN3aWctNC0yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2ZpbGVzL2Zp
eC1pc3N1ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggZmI0MjRmZTcyNS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAtbmcvZmlsZXMvZml4LWlzc3Vlcy13aXRoLXN3aWctNC0yLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzIgKzAsMCBAQAotRnJvbSAzNTVlYWRhMmQyMDg4NjI4N2NmZmMxNmUzMDQwODdkZDZm
NjZhZTM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogU3RldmUgR3J1YmIgPGF1c2Vh
cmNoLjFAZ21haWwuY29tPgotRGF0ZTogVGh1LCA0IEphbiAyMDI0IDE1OjA2OjI5IC0wNTAwCi1T
dWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBweXRob24gZ2xvYmFsIGV4Y2VwdGlvbiBoYW5kbGVyIHNp
bmNlIGl0cyBkZXByZWNhdGVkCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9zdGV2ZWdydWJiL2xpYmNhcC1uZy9jb21taXQvMzA0NTNiNjU1Mzk0OGNkMDVj
NDM4ZjlmNTA5MDEzZTNiYjg0ZjI1Yl0KLVNpZ25lZC1vZmYtYnk6IEFudWogTWl0dGFsIDxhbnVq
Lm1pdHRhbEBpbnRlbC5jb20+Ci0tLS0KLSBiaW5kaW5ncy9zcmMvY2Fwbmdfc3dpZy5pIHwgNyAt
LS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9i
aW5kaW5ncy9zcmMvY2Fwbmdfc3dpZy5pIGIvYmluZGluZ3Mvc3JjL2NhcG5nX3N3aWcuaQotaW5k
ZXggZmNkYWYxOC4uZmE4NWUxMyAxMDA2NDQKLS0tLSBhL2JpbmRpbmdzL3NyYy9jYXBuZ19zd2ln
LmkKLSsrKyBiL2JpbmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkKLUBAIC0zMCwxMyArMzAsNiBAQAot
IAotICV2YXJhcmdzKDE2LCBzaWduZWQgY2FwYWJpbGl0eSA9IDApIGNhcG5nX3VwZGF0ZXY7Ci0g
Ci0tJWV4Y2VwdChweXRob24pIHsKLS0gICRhY3Rpb24KLS0gIGlmIChyZXN1bHQgPCAwKSB7Ci0t
ICAgIFB5RXJyX1NldEZyb21FcnJubyhQeUV4Y19PU0Vycm9yKTsKLS0gICAgcmV0dXJuIE5VTEw7
Ci0tICB9Ci0tfQotICNlbmRpZgotIAotICVkZWZpbmUgX19zaWduZWRfXwotLS0gCi0yLjQzLjIK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5p
bmMgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYwppbmRleCA4
NDViN2MyZjBhLi44NzUzMzdiOTU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAtbmcvbGliY2FwLW5nLmluYworKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAt
bmcvbGliY2FwLW5nLmluYwpAQCAtNywxMSArNyw5IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1s
YXRlciAmIExHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYgXAogCQkgICAgZmlsZTov
L0NPUFlJTkcuTElCO21kNT1lM2VkYTAxZDk4MTVmOGQyNGFhZTJkYmQ4OWI2OGIwNiIKIAotU1JD
X1VSSSA9ICJodHRwczovL3Blb3BsZS5yZWRoYXQuY29tL3NncnViYi9saWJjYXAtbmcvbGliY2Fw
LW5nLSR7UFZ9LnRhci5neiBcCi0gICAgICAgICAgIGZpbGU6Ly9maXgtaXNzdWVzLXdpdGgtc3dp
Zy00LTIucGF0Y2ggXAotICAgICAgICAgICAiCitTUkNfVVJJID0gImh0dHBzOi8vcGVvcGxlLnJl
ZGhhdC5jb20vc2dydWJiL2xpYmNhcC1uZy9saWJjYXAtbmctJHtQVn0udGFyLmd6IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNjg1ODFkM2IzOGU3NTUzY2I2ZjZkZGY3ODEzYjFmYzk5ZTUyODU2
ZjIxNDIxZjdiNDc3Y2U1YWJkMjYwNWE4YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYmE1Mjk0
ZDFjYmRmYTk4YWZhYWNmYmMwMGI2YWY5ZWQyYjgzZThhMjE4MTcxODVkZmQ4NDRjYzhjN2FjNmZm
IgogCiBFWFRSQV9PRUNPTkY6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgLS13aXRoLWNhcGFiaWxp
dHlfaGVhZGVyPSR7U1RBR0lOR19JTkNESVJ9L2xpbnV4L2NhcGFiaWxpdHkuaCIKIEVYVFJBX09F
Q09ORjphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiAtLXdpdGgtY2FwYWJpbGl0eV9oZWFkZXI9
JHtTVEFHSU5HX0lOQ0RJUn0vbGludXgvY2FwYWJpbGl0eS5oIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjguNC5iYiBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC44LjUuYmIKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdf
MC44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAt
bmdfMC44LjUuYmIKLS0gCjIuNDQuMAoK

--===============3999023061502824502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcap-ng: SRC_URI changed from "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz file://fix-issues-with-swig-4-2.patch" to "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.5.tar.gz"
packages/core2-64-poky-linux/libcap-ng: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 166944 to 167440 (+0%)
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dev: PKGSIZE changed from 5249 to 5214 (-1%)
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 80819 to 81067 (+0%)
packages/core2-64-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.8.4 [default] to 0.8.5 [default]
packages/core2-64-poky-linux/libcap-ng/libcap-ng: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.8.4 [default] to 0.8.5 [default]

--===============3999023061502824502==--

