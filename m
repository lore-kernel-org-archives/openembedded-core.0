Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2947C25B5C
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1143.1714579217241263645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NGv+NKrz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=p6RQ0Dho;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e298d6-b2d2dddd-fc45-4b6a-91d0-4a8aadf34dd1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fvws0m5Epeu0lss/pHNlCXwtwwPUQs/M96LnLzwhX4w=;
	b=NGv+NKrzfr75icq65SkHAFsqcYPJiCOOJRCZcMjkvONPGjFrPV3MJ3AE4W1PWhk3
	DcpAxu+2S55sXPDqlhLLVnyX1qT4z8Qkf+O8VJxtg+xQAHtv5SIM+k/9Dg2VydHvW+o
	ke97ZBJWDev+q50kq28WGOaXxFUy5JgFlncGcsaE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fvws0m5Epeu0lss/pHNlCXwtwwPUQs/M96LnLzwhX4w=;
	b=p6RQ0Dho9dLbpVFvN5NWNr5PmyyNrnPMxD8Z+X1T1ArFUMg2c2jwt69tlGxJzY5C
	YjT+9EvC6DUgVuxQPqRNTDLr91bA1RU/JJIpk9CyrNgwzwlTWJXohAsVj6WpRJODz5/
	UWQ4mAtyUlfsqnGAOr+vd5BLwJKh9q71B5igcRMw=
Content-Type: multipart/mixed; boundary="===============0182943950410181192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python: upgrading to 0.8.5 FAILED
Message-ID: <0101018f34e298d6-b2d2dddd-fc45-4b6a-91d0-4a8aadf34dd1-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198880

--===============0182943950410181192==
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
From 872cfc7b244c4f236bba6fac3ac953b179801484 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 14:53:09 +0000
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


--===============0182943950410181192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-upgrade-0.8.4-0.8.5.patch"

RnJvbSA4NzJjZmM3YjI0NGM0ZjIzNmJiYTZmYWMzYWM5NTNiMTc5ODAxNDg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNDo1MzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZy1weXRob246IHVwZ3JhZGUgMC44LjQgLT4gMC44LjUKCi0tLQogLi4uL2ZpbGVzL2Zp
eC1pc3N1ZXMtd2l0aC1zd2lnLTQtMi5wYXRjaCAgICAgIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4uaG9uXzAuOC40LmJiID0+IGxpYmNhcC1uZy1weXRob25fMC44LjUuYmJ9IHwgIDAKIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jICB8ICA2ICsrLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvZmlsZXMvZml4LWlzc3Vl
cy13aXRoLXN3aWctNC0yLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
LW5nL3tsaWJjYXAtbmctcHl0aG9uXzAuOC40LmJiID0+IGxpYmNhcC1uZy1weXRob25fMC44LjUu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9m
aWxlcy9maXgtaXNzdWVzLXdpdGgtc3dpZy00LTIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvZmlsZXMvZml4LWlzc3Vlcy13aXRoLXN3aWctNC0yLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmYjQyNGZlNzI1Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9maWxlcy9maXgtaXNzdWVzLXdpdGgtc3dpZy00LTIu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMiArMCwwIEBACi1Gcm9tIDM1NWVhZGEyZDIwODg2
Mjg3Y2ZmYzE2ZTMwNDA4N2RkNmY2NmFlMzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBTdGV2ZSBHcnViYiA8YXVzZWFyY2guMUBnbWFpbC5jb20+Ci1EYXRlOiBUaHUsIDQgSmFuIDIw
MjQgMTU6MDY6MjkgLTA1MDAKLVN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHB5dGhvbiBnbG9iYWwg
ZXhjZXB0aW9uIGhhbmRsZXIgc2luY2UgaXRzIGRlcHJlY2F0ZWQKLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3N0ZXZlZ3J1YmIvbGliY2FwLW5nL2NvbW1p
dC8zMDQ1M2I2NTUzOTQ4Y2QwNWM0MzhmOWY1MDkwMTNlM2JiODRmMjViXQotU2lnbmVkLW9mZi1i
eTogQW51aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4KLS0tLQotIGJpbmRpbmdzL3Ny
Yy9jYXBuZ19zd2lnLmkgfCA3IC0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL2JpbmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkgYi9iaW5kaW5ncy9z
cmMvY2Fwbmdfc3dpZy5pCi1pbmRleCBmY2RhZjE4Li5mYTg1ZTEzIDEwMDY0NAotLS0tIGEvYmlu
ZGluZ3Mvc3JjL2NhcG5nX3N3aWcuaQotKysrIGIvYmluZGluZ3Mvc3JjL2NhcG5nX3N3aWcuaQot
QEAgLTMwLDEzICszMCw2IEBACi0gCi0gJXZhcmFyZ3MoMTYsIHNpZ25lZCBjYXBhYmlsaXR5ID0g
MCkgY2FwbmdfdXBkYXRldjsKLSAKLS0lZXhjZXB0KHB5dGhvbikgewotLSAgJGFjdGlvbgotLSAg
aWYgKHJlc3VsdCA8IDApIHsKLS0gICAgUHlFcnJfU2V0RnJvbUVycm5vKFB5RXhjX09TRXJyb3Ip
OwotLSAgICByZXR1cm4gTlVMTDsKLS0gIH0KLS19Ci0gI2VuZGlmCi0gCi0gJWRlZmluZSBfX3Np
Z25lZF9fCi0tLSAKLTIuNDMuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8wLjguNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9uXzAuOC41LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5
dGhvbl8wLjguNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy1weXRob25fMC44LjUuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5n
L2xpYmNhcC1uZy5pbmMKaW5kZXggODQ1YjdjMmYwYS4uODc1MzM3Yjk1NCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMKQEAgLTcsMTEgKzcsOSBAQCBM
SUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgJiBMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk0ZDU1ZDUxMmE5YmEzNmNhYTliN2RmMDc5
YmFlMTlmIFwKIAkJICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9ZTNlZGEwMWQ5ODE1ZjhkMjRh
YWUyZGJkODliNjhiMDYiCiAKLVNSQ19VUkkgPSAiaHR0cHM6Ly9wZW9wbGUucmVkaGF0LmNvbS9z
Z3J1YmIvbGliY2FwLW5nL2xpYmNhcC1uZy0ke1BWfS50YXIuZ3ogXAotICAgICAgICAgICBmaWxl
Oi8vZml4LWlzc3Vlcy13aXRoLXN3aWctNC0yLnBhdGNoIFwKLSAgICAgICAgICAgIgorU1JDX1VS
SSA9ICJodHRwczovL3Blb3BsZS5yZWRoYXQuY29tL3NncnViYi9saWJjYXAtbmcvbGliY2FwLW5n
LSR7UFZ9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4NTgxZDNiMzhlNzU1M2Ni
NmY2ZGRmNzgxM2IxZmM5OWU1Mjg1NmYyMTQyMWY3YjQ3N2NlNWFiZDI2MDVhOGEiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiM2JhNTI5NGQxY2JkZmE5OGFmYWFjZmJjMDBiNmFmOWVkMmI4M2U4YTIx
ODE3MTg1ZGZkODQ0Y2M4YzdhYzZmZiIKIAogRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFzcy10YXJn
ZXQgPSAiIC0td2l0aC1jYXBhYmlsaXR5X2hlYWRlcj0ke1NUQUdJTkdfSU5DRElSfS9saW51eC9j
YXBhYmlsaXR5LmgiCiBFWFRSQV9PRUNPTkY6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgLS13
aXRoLWNhcGFiaWxpdHlfaGVhZGVyPSR7U1RBR0lOR19JTkNESVJ9L2xpbnV4L2NhcGFiaWxpdHku
aCIKLS0gCjIuNDQuMAoK

--===============0182943950410181192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (918 cached, 2 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9992db5c078bedfc974d462af197506050c941e0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9992db5c078bedfc974d462af197506050c941e0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 194 Local 106 Mirrors 0 Missed 88 Current 259 (54% match, 80% complete)
Removing 7 stale sstate objects for arch core2-64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 21 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 294 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 358 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 367 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 368 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running noexec task 438 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 448 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: Running task 505 of 1306 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: Running noexec task 567 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 599 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 603 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 686 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 692 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 693 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 694 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 695 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 696 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_fetch)
NOTE: Running task 717 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 718 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: Running task 745 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: Running task 746 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_fetch)
NOTE: Running task 747 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 748 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 749 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: Running task 750 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running setscene task 447 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running setscene task 448 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 752 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 753 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_unpack)
NOTE: Running task 754 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 757 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 758 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 759 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: Running task 760 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 762 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 763 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 764 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: Running task 765 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 449 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 451 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 769 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: Running task 770 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 779 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 781 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 782 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 784 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe python3-3.12.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 785 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Started
NOTE: Running task 786 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 790 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: Running task 791 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 793 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe python3-3.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 797 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 798 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: Running task 799 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 800 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 849 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_patch: Started
NOTE: recipe python3-3.12.3-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Started
NOTE: Running task 850 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: Running task 888 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 984 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe openssl-3.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 986 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 993 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa unihash changed to 58ce1859ea7968d1a3d706cce9e426d2317663488e43e356d8137c1672c78188
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa unihash changed to cbb581f27f67b8f26be94a3fd385d8826401ac77d31c020192b2d59c4d231132
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 997 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_patch)
NOTE: Running task 999 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: Running task 1002 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: Running task 1004 of 1306 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 1006 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_collect_spdx_deps)
NOTE: Running task 1008 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 1009 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_fetch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Started
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 1010 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_unpack)
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1011 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_patch)
NOTE: Running noexec task 1013 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_configure)
NOTE: Running noexec task 1014 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_compile)
NOTE: Running task 1015 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_install)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Succeeded
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
NOTE: Running task 1016 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1017 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_populate_lic)
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Succeeded
NOTE: Running task 1033 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.39+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.39+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1034 of 1306 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_configure)
NOTE: recipe glibc-2.39+git-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Failed
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Failed
NOTE: recipe glibc-2.39+git-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1034 tasks of which 956 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501145217.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501145217.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.8.4-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz
ERROR: libcap-ng-0.8.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz\' has sha256 checksum \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' when \'3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz')
ERROR: libcap-ng-native-0.8.4-r0 do_fetch: Checksum failure fetching https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz
ERROR: libcap-ng-native-0.8.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz\' has sha256 checksum \'68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a\' when \'3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libcap-ng/0.8.4/temp/log.do_fetch.729690
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.4/temp/log.do_fetch.729688
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'

--===============0182943950410181192==--

