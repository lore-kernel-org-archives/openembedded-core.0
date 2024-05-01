Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC6FC25B75
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1142.1714579217171597751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JMC6BEti;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=i6fj9A5/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f34e298d3-f3f4bede-a332-4c75-a8e6-17f34c1a98e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=izYIatG2VwRbsg1G0qWHSnrFPHyiB0bhdH/480XAV04=;
	b=JMC6BEtiD2xKoaluF5C+NxHTz5+k0ha4/rTe5NUqFAder8MH4WP2qY1m7lmp8aP0
	NAu5YmkQboq8OLIprrSz0p/pqPwWX+x4XHCKm1sKgaiQ3SYnZYo+jePwAXfGe2bnhy0
	IAJqrdAWKFaxkfzzaZYlEIJtvhEX+AtgCK/Vzynk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=izYIatG2VwRbsg1G0qWHSnrFPHyiB0bhdH/480XAV04=;
	b=i6fj9A5/lLYI4uPxcra+9dBBn1Zp7+cya6Od3I9XvoUoOx7LO0fcJdN6IWLe4paW
	j8uv6LGJ6Uqt0DRWWI51QfGKObnikLcFpABN1+Et3CY1YGpTQoisJQ6cT64WHAMfbYb
	CXTw9g7HTGcB6OHsUIhGV/+o+G1QRr9mebc7phqc=
Content-Type: multipart/mixed; boundary="===============2873777940336452955=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng: upgrading to 0.8.5 SUCCEEDED
Message-ID: <0101018f34e298d3-f3f4bede-a332-4c75-a8e6-17f34c1a98e9-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198876

--===============2873777940336452955==
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
From d04980a27de936cab3e5d81dfd74b848cf746f6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 15:02:59 +0000
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


--===============2873777940336452955==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-upgrade-0.8.4-0.8.5.patch"

RnJvbSBkMDQ5ODBhMjdkZTkzNmNhYjNlNWQ4MWRmZDc0Yjg0OGNmNzQ2ZjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNTowMjo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZzogdXBncmFkZSAwLjguNCAtPiAwLjguNQoKLS0tCiAuLi4vZmlsZXMvZml4LWlzc3Vl
cy13aXRoLXN3aWctNC0yLnBhdGNoICAgICAgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyAgfCAgNiArKy0tCiAuLi57
bGliY2FwLW5nXzAuOC40LmJiID0+IGxpYmNhcC1uZ18wLjguNS5iYn0gfCAgMAogMyBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9maWxlcy9maXgtaXNzdWVzLXdpdGgt
c3dpZy00LTIucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcve2xp
YmNhcC1uZ18wLjguNC5iYiA9PiBsaWJjYXAtbmdfMC44LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9maWxlcy9maXgtaXNzdWVzLXdpdGgt
c3dpZy00LTIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvZmlsZXMvZml4
LWlzc3Vlcy13aXRoLXN3aWctNC0yLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCBmYjQyNGZlNzI1Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy9maWxlcy9maXgtaXNzdWVzLXdpdGgtc3dpZy00LTIucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwzMiArMCwwIEBACi1Gcm9tIDM1NWVhZGEyZDIwODg2Mjg3Y2ZmYzE2ZTMwNDA4N2RkNmY2
NmFlMzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBTdGV2ZSBHcnViYiA8YXVzZWFy
Y2guMUBnbWFpbC5jb20+Ci1EYXRlOiBUaHUsIDQgSmFuIDIwMjQgMTU6MDY6MjkgLTA1MDAKLVN1
YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHB5dGhvbiBnbG9iYWwgZXhjZXB0aW9uIGhhbmRsZXIgc2lu
Y2UgaXRzIGRlcHJlY2F0ZWQKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9n
aXRodWIuY29tL3N0ZXZlZ3J1YmIvbGliY2FwLW5nL2NvbW1pdC8zMDQ1M2I2NTUzOTQ4Y2QwNWM0
MzhmOWY1MDkwMTNlM2JiODRmMjViXQotU2lnbmVkLW9mZi1ieTogQW51aiBNaXR0YWwgPGFudWou
bWl0dGFsQGludGVsLmNvbT4KLS0tLQotIGJpbmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkgfCA3IC0t
LS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2Jp
bmRpbmdzL3NyYy9jYXBuZ19zd2lnLmkgYi9iaW5kaW5ncy9zcmMvY2Fwbmdfc3dpZy5pCi1pbmRl
eCBmY2RhZjE4Li5mYTg1ZTEzIDEwMDY0NAotLS0tIGEvYmluZGluZ3Mvc3JjL2NhcG5nX3N3aWcu
aQotKysrIGIvYmluZGluZ3Mvc3JjL2NhcG5nX3N3aWcuaQotQEAgLTMwLDEzICszMCw2IEBACi0g
Ci0gJXZhcmFyZ3MoMTYsIHNpZ25lZCBjYXBhYmlsaXR5ID0gMCkgY2FwbmdfdXBkYXRldjsKLSAK
LS0lZXhjZXB0KHB5dGhvbikgewotLSAgJGFjdGlvbgotLSAgaWYgKHJlc3VsdCA8IDApIHsKLS0g
ICAgUHlFcnJfU2V0RnJvbUVycm5vKFB5RXhjX09TRXJyb3IpOwotLSAgICByZXR1cm4gTlVMTDsK
LS0gIH0KLS19Ci0gI2VuZGlmCi0gCi0gJWRlZmluZSBfX3NpZ25lZF9fCi0tLSAKLTIuNDMuMgot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmlu
YyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCmluZGV4IDg0
NWI3YzJmMGEuLjg3NTMzN2I5NTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1u
Zy9saWJjYXAtbmcuaW5jCkBAIC03LDExICs3LDkgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxh
dGVyICYgTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiBcCiAJCSAgICBmaWxlOi8v
Q09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0YWFlMmRiZDg5YjY4YjA2IgogCi1TUkNf
VVJJID0gImh0dHBzOi8vcGVvcGxlLnJlZGhhdC5jb20vc2dydWJiL2xpYmNhcC1uZy9saWJjYXAt
bmctJHtQVn0udGFyLmd6IFwKLSAgICAgICAgICAgZmlsZTovL2ZpeC1pc3N1ZXMtd2l0aC1zd2ln
LTQtMi5wYXRjaCBcCi0gICAgICAgICAgICIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9wZW9wbGUucmVk
aGF0LmNvbS9zZ3J1YmIvbGliY2FwLW5nL2xpYmNhcC1uZy0ke1BWfS50YXIuZ3oiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI2ODU4MWQzYjM4ZTc1NTNjYjZmNmRkZjc4MTNiMWZjOTllNTI4NTZm
MjE0MjFmN2I0NzdjZTVhYmQyNjA1YThhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNiYTUyOTRk
MWNiZGZhOThhZmFhY2ZiYzAwYjZhZjllZDJiODNlOGEyMTgxNzE4NWRmZDg0NGNjOGM3YWM2ZmYi
CiAKIEVYVFJBX09FQ09ORjphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiAtLXdpdGgtY2FwYWJpbGl0
eV9oZWFkZXI9JHtTVEFHSU5HX0lOQ0RJUn0vbGludXgvY2FwYWJpbGl0eS5oIgogRVhUUkFfT0VD
T05GOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIC0td2l0aC1jYXBhYmlsaXR5X2hlYWRlcj0k
e1NUQUdJTkdfSU5DRElSfS9saW51eC9jYXBhYmlsaXR5LmgiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOC40LmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18w
LjguNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1u
Z18wLjguNS5iYgotLSAKMi40NC4wCgo=

--===============2873777940336452955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcap-ng: PV changed from "0.8.4" to "0.8.5"
packages/core2-64-poky-linux/libcap-ng: SRC_URI changed from "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.4.tar.gz file://fix-issues-with-swig-4-2.patch" to "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.5.tar.gz"
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

--===============2873777940336452955==--

