Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFAC3DA63
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:16 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.13467.1713248050761227067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WhQS6UDg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=daV/Brpu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58aa473-058c52dd-e4c2-41f8-9296-ced15414a967-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xz3w4blQHUKiGyGRNaMaaCTA9g3IhCZaEb59pYpbEro=;
	b=WhQS6UDgI5t87V2R0XixKbFNTQkbwRExjGrAdEkQ953kNkWQf0VL94vSJCRmC/6B
	WED/KneZZsK7seTeH/wJ224Z8j58hLokLiwabXoYvcBeNJlXbSWtOaUkefaVWA7hvB2
	ohAY7bKtI/dapoFLuPjIHvOxTwnkTqhHyBzAZa/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xz3w4blQHUKiGyGRNaMaaCTA9g3IhCZaEb59pYpbEro=;
	b=daV/BrpuIjleXbAUYLWdONrO0tPMU5r2sxXBnV4RYuMFfzQb6W1v2WDcrhc+tK+a
	75N0JHSUBrlaZjwUVELfSYAZ5z5noB8x+bGXIT5CZ82cYvfnSZYq018Lnzjo6g7xbfZ
	FflXwdS7WVhilZtM4jgKc7aKVZFGotO9Bx+bqlxM=
Content-Type: multipart/mixed; boundary="===============1767167717046941591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python: upgrading to 0.8.5 FAILED
Message-ID: <0101018ee58aa473-058c52dd-e4c2-41f8-9296-ced15414a967-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198419

--===============1767167717046941591==
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
From 7615280f9c3ff9318df85c0e9fa0ac6ebcdeb587 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 05:29:34 +0000
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
2.42.0


--===============1767167717046941591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-upgrade-0.8.4-0.8.5.patch"

RnJvbSA3NjE1MjgwZjljM2ZmOTMxOGRmODVjMGU5ZmEwYWM2ZWJjZGViNTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDU6Mjk6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
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
LmgiCi0tIAoyLjQyLjAKCg==

--===============1767167717046941591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0307c477feb2bc52e4469ae27e32d9cb33f0f625"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0307c477feb2bc52e4469ae27e32d9cb33f0f625"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 188 Local 100 Mirrors 0 Missed 88 Current 265 (53% match, 80% complete)
Removing 7 stale sstate objects for arch core2-64...done.
Removing 8 stale sstate objects for arch x86_64...done.
Removing 21 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 358 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 370 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 373 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 374 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 429 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 439 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 505 of 1305 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: Running noexec task 567 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 599 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 603 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 686 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 692 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 693 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 694 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 695 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_fetch)
NOTE: Running task 696 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: Running task 717 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 718 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running task 746 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: Running task 747 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: Running task 748 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 447 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: Running task 749 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 751 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 752 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 753 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 754 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_unpack)
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa unihash changed to 3b35531b73ecaba45f808769c237a3efdc7ba857254d129289bbceaef88bdaba
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 380 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 756 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running task 757 of 1305 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 759 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: Running task 761 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 762 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 763 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: Running task 764 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 765 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 766 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_patch)
NOTE: Running task 767 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: Running task 768 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 769 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: Running task 770 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.1-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: Running task 771 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 777 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 778 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 783 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 786 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 788 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_fetch: Started
NOTE: Running task 790 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: recipe python3-3.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 792 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: Running task 795 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 846 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Started
NOTE: Running task 848 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_recipe_qa)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 885 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 886 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa unihash changed to 4e51242db0f51475015fa1b6979f58ef4517285bb2301a286674bdecc3135e20
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: Running task 889 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: Running task 890 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: Running task 891 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 895 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 896 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: Running task 989 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_patch)
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 994 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 995 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb:do_populate_lic)
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 999 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-ng-python-0.8.5-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum failure encountered with download of https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz - will attempt other sources if available
WARNING: libcap-ng-0.8.4-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.4-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/libcap-ng-0.8.4.tar.gz_bad-checksum_68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a
NOTE: recipe python3-3.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe python3-3.12.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_fetch: Failed
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1011 tasks of which 940 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416052911.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416052911.txt [-s server]
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.4/temp/log.do_fetch.591798
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libcap-ng/0.8.4/temp/log.do_fetch.593359
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch) failed with exit code '1'

--===============1767167717046941591==--

