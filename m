Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00297C3DA66
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1281.1715794338438560651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fF1yUYuH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WFSzO1/p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe776-f79d295c-6774-4b3a-b404-f91ab62447ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KFOygW00mcUyZnQbHtUI6CfQnMnHqdB42Foki2NXVdc=;
	b=fF1yUYuHxjjpQJHepoyRQ2ChV0tKKTmcuk1INZEvvXysG1BvynW52/f7dzsMv7hp
	YaSfbPybj0gJx4/IHNPdSpZnTexgbhHFpfkVEUIBJuO+RHYU1J7CEZe1I4o752qcnpf
	awyrfBzvvjbUQkjbe5okQPrH2/lwcFX+UwjagfCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KFOygW00mcUyZnQbHtUI6CfQnMnHqdB42Foki2NXVdc=;
	b=WFSzO1/pSN+OH5Tb3apTvKNCsa21P+a4CAiEZ6H8uoGZijCRu/iYgwPywg1zqGwg
	XUCBvd4N+IPsR+dZqYWgvVnb7+bawH4e2jFw1AVvrpO5qebx1MpF1Yv+jl9HGXqLXgW
	5t9V7O/Bo7UA2NywoJvigAtrOyf2vlmrsI2BhZI4=
Content-Type: multipart/mixed; boundary="===============5490394723518021473=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python: upgrading to 0.8.5 FAILED
Message-ID: <0101018f7d4fe776-f79d295c-6774-4b3a-b404-f91ab62447ca-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199377

--===============5490394723518021473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng-python* to *0.8.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-python-upgrade-0.8.4-0.8.5.patch
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
From 66fcab0d356c559735a42fbf17cb1b11ff200209 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 16:35:49 +0000
Subject: [PATCH] libcap-ng-python: upgrade 0.8.4 -> 0.8.5

---
 .../files/fix-issues-with-swig-4-2.patch      | 32 -------------------
 ...hon_0.8.4.bb => libcap-ng-python_0.8.5.bb} |  0
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  6 ++--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb} (100%)

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
diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
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
-- 
2.44.0


--===============5490394723518021473==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-upgrade-0.8.4-0.8.5.patch"

RnJvbSA2NmZjYWIwZDM1NmM1NTk3MzVhNDJmYmYxN2NiMWIxMWZmMjAwMjA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6MzU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmctcHl0aG9uOiB1cGdyYWRlIDAuOC40IC0+IDAuOC41CgotLS0KIC4uLi9maWxlcy9m
aXgtaXNzdWVzLXdpdGgtc3dpZy00LTIucGF0Y2ggICAgICB8IDMyIC0tLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLmhvbl8wLjguNC5iYiA9PiBsaWJjYXAtbmctcHl0aG9uXzAuOC41LmJifSB8ICAwCiBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyAgfCAgNiArKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2ZpbGVzL2ZpeC1pc3N1
ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy97bGliY2FwLW5nLXB5dGhvbl8wLjguNC5iYiA9PiBsaWJjYXAtbmctcHl0aG9uXzAuOC41
LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcv
ZmlsZXMvZml4LWlzc3Vlcy13aXRoLXN3aWctNC0yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliY2FwLW5nL2ZpbGVzL2ZpeC1pc3N1ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZmI0MjRmZTcyNS4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvZmlsZXMvZml4LWlzc3Vlcy13aXRoLXN3aWctNC0y
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzIgKzAsMCBAQAotRnJvbSAzNTVlYWRhMmQyMDg4
NjI4N2NmZmMxNmUzMDQwODdkZDZmNjZhZTM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogU3RldmUgR3J1YmIgPGF1c2VhcmNoLjFAZ21haWwuY29tPgotRGF0ZTogVGh1LCA0IEphbiAy
MDI0IDE1OjA2OjI5IC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBweXRob24gZ2xvYmFs
IGV4Y2VwdGlvbiBoYW5kbGVyIHNpbmNlIGl0cyBkZXByZWNhdGVkCi0KLVVwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9zdGV2ZWdydWJiL2xpYmNhcC1uZy9jb21t
aXQvMzA0NTNiNjU1Mzk0OGNkMDVjNDM4ZjlmNTA5MDEzZTNiYjg0ZjI1Yl0KLVNpZ25lZC1vZmYt
Ynk6IEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+Ci0tLS0KLSBiaW5kaW5ncy9z
cmMvY2Fwbmdfc3dpZy5pIHwgNyAtLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9iaW5kaW5ncy9zcmMvY2Fwbmdfc3dpZy5pIGIvYmluZGluZ3Mv
c3JjL2NhcG5nX3N3aWcuaQotaW5kZXggZmNkYWYxOC4uZmE4NWUxMyAxMDA2NDQKLS0tLSBhL2Jp
bmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkKLSsrKyBiL2JpbmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkK
LUBAIC0zMCwxMyArMzAsNiBAQAotIAotICV2YXJhcmdzKDE2LCBzaWduZWQgY2FwYWJpbGl0eSA9
IDApIGNhcG5nX3VwZGF0ZXY7Ci0gCi0tJWV4Y2VwdChweXRob24pIHsKLS0gICRhY3Rpb24KLS0g
IGlmIChyZXN1bHQgPCAwKSB7Ci0tICAgIFB5RXJyX1NldEZyb21FcnJubyhQeUV4Y19PU0Vycm9y
KTsKLS0gICAgcmV0dXJuIE5VTEw7Ci0tICB9Ci0tfQotICNlbmRpZgotIAotICVkZWZpbmUgX19z
aWduZWRfXwotLS0gCi0yLjQzLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25fMC44LjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8wLjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1w
eXRob25fMC44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9s
aWJjYXAtbmctcHl0aG9uXzAuOC41LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1u
Zy9saWJjYXAtbmcuaW5jCmluZGV4IDg0NWI3YzJmMGEuLjg3NTMzN2I5NTQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC03LDExICs3LDkgQEAg
TElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyICYgTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3
OWJhZTE5ZiBcCiAJCSAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0
YWFlMmRiZDg5YjY4YjA2IgogCi1TUkNfVVJJID0gImh0dHBzOi8vcGVvcGxlLnJlZGhhdC5jb20v
c2dydWJiL2xpYmNhcC1uZy9saWJjYXAtbmctJHtQVn0udGFyLmd6IFwKLSAgICAgICAgICAgZmls
ZTovL2ZpeC1pc3N1ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaCBcCi0gICAgICAgICAgICIKK1NSQ19V
UkkgPSAiaHR0cHM6Ly9wZW9wbGUucmVkaGF0LmNvbS9zZ3J1YmIvbGliY2FwLW5nL2xpYmNhcC1u
Zy0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2ODU4MWQzYjM4ZTc1NTNj
YjZmNmRkZjc4MTNiMWZjOTllNTI4NTZmMjE0MjFmN2I0NzdjZTVhYmQyNjA1YThhIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjNiYTUyOTRkMWNiZGZhOThhZmFhY2ZiYzAwYjZhZjllZDJiODNlOGEy
MTgxNzE4NWRmZDg0NGNjOGM3YWM2ZmYiCiAKIEVYVFJBX09FQ09ORjphcHBlbmQ6Y2xhc3MtdGFy
Z2V0ID0gIiAtLXdpdGgtY2FwYWJpbGl0eV9oZWFkZXI9JHtTVEFHSU5HX0lOQ0RJUn0vbGludXgv
Y2FwYWJpbGl0eS5oIgogRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIC0t
d2l0aC1jYXBhYmlsaXR5X2hlYWRlcj0ke1NUQUdJTkdfSU5DRElSfS9saW51eC9jYXBhYmlsaXR5
LmgiCi0tIAoyLjQ0LjAKCg==

--===============5490394723518021473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-f886a03a8464694e7e43ba845d61fe6067d3d803"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f886a03a8464694e7e43ba845d61fe6067d3d803"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 192 Local 107 Mirrors 0 Missed 85 Current 261 (55% match, 81% complete)
Removing 6 stale sstate objects for arch x86_64...done.
Removing 21 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 302 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 324 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 346 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 365 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 368 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: Running noexec task 429 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 461 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 506 of 1306 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running noexec task 568 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 600 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 604 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 687 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 693 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 694 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 695 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 696 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_fetch)
NOTE: Running task 697 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: Running task 718 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 719 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 746 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: Running task 747 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 748 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 749 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 752 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 753 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 754 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 756 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 447 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 757 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 758 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 759 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 760 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 761 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 762 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 763 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 764 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 765 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 766 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 767 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Started
NOTE: Running task 768 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 771 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: Running task 775 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_fetch)
NOTE: Running setscene task 449 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 451 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 780 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 781 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 784 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 786 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_unpack)
NOTE: recipe python3-3.12.3-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 789 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe python3-3.12.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 790 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Started
NOTE: Running task 794 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 795 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 847 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 848 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 849 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: Running task 850 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe python3-3.12.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 889 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_fetch)
NOTE: Running task 890 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 986 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_patch: Started
NOTE: Running task 988 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 990 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_patch)
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe openssl-3.3.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: Running task 994 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_populate_lic)
NOTE: Running task 995 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_populate_lic unihash changed to 0ffb428b0642eba2cc76bcb95f6b533589729397a7ccaab812b377cbbbb6f89b
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_deploy_source_date_epoch unihash changed to a8774b7d78c4d12302c25846447c2182e99ece2cc55f17f7b1d5648851be59ca
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1002 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_patch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Failed
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1006 tasks of which 939 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515163518.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515163518.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-native-0.8.4-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz
ERROR: libcap-ng-native-0.8.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz\' has sha256 checksum \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' when \'3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz')
ERROR: libcap-ng-0.8.4-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz
ERROR: libcap-ng-0.8.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz\' has sha256 checksum \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' when \'3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.4/temp/log.do_fetch.3901496
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libcap-ng/0.8.4/temp/log.do_fetch.3902475
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'

--===============5490394723518021473==--

