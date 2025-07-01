Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DBDC83F0C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1425.1751386807795013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GcXsNM97;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J+N8SjTv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6c9db2c-7885d712-df9b-4db1-8e1d-a0d2f3e2a30c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PVVOk4Smh2QYkAIJsbQcHdO6te3P6DItUGl0r+PfJmQ=;
	b=GcXsNM97hmxOu7AVNlBwiW8eE1v9WU3O0aHATjjaktWuU0GNE5c/v9d5zt1964T+
	1pdJnmKS9mAd0uUNXd94mNEnw57scL9UJa98h0a3H+UCOkjhvGGL49MSiUzrS4aCOc9
	Y8Q9FjOFrAv8HzY9V52F2UEku5YeQRKFIOE7w2KQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PVVOk4Smh2QYkAIJsbQcHdO6te3P6DItUGl0r+PfJmQ=;
	b=J+N8SjTv5jltZoBc71qhqecNOGgxg5kTK5MDE+c8oQTTGEmrQmvppmsaH+9+4Oa+
	WFwz0/b/u8nC5mEc9KN7nrWHipbL64nJ12SlxJNbXPSfPAIUF7lSu6Sq0CzeLhs22c+
	YG19y7vE4hqTXCO1VWtDtYhEKaz1jwFg6p1S7QzA=
Content-Type: multipart/mixed; boundary="===============5259461427394955645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.14.0 SUCCEEDED
Message-ID: <01010197c6c9db2c-7885d712-df9b-4db1-8e1d-a0d2f3e2a30c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219608

--===============5259461427394955645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pciutils* to *3.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pciutils-upgrade-3.13.0-3.14.0.patch
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
From 0c7026654501a68531c0344f80e8761d93ee4679 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:18:51 +0000
Subject: [PATCH] pciutils: upgrade 3.13.0 -> 3.14.0

---
 .../pciutils/{pciutils_3.13.0.bb => pciutils_3.14.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.13.0.bb => pciutils_3.14.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
index 6478722838..a267ea34b7 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926"
+SRC_URI[sha256sum] = "e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.47.1


--===============5259461427394955645==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pciutils-upgrade-3.13.0-3.14.0.patch"

RnJvbSAwYzcwMjY2NTQ1MDFhNjg1MzFjMDM0NGY4MGU4NzYxZDkzZWU0Njc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzoxODo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBj
aXV0aWxzOiB1cGdyYWRlIDMuMTMuMCAtPiAzLjE0LjAKCi0tLQogLi4uL3BjaXV0aWxzL3twY2l1
dGlsc18zLjEzLjAuYmIgPT4gcGNpdXRpbHNfMy4xNC4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWJzcC9wY2l1dGlscy97cGNpdXRpbHNfMy4xMy4wLmJiID0+IHBjaXV0aWxzXzMuMTQu
MC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0
aWxzXzMuMTMuMC5iYiBiL21ldGEvcmVjaXBlcy1ic3AvcGNpdXRpbHMvcGNpdXRpbHNfMy4xNC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ic3AvcGNp
dXRpbHMvcGNpdXRpbHNfMy4xMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3BjaXV0
aWxzL3BjaXV0aWxzXzMuMTQuMC5iYgppbmRleCA2NDc4NzIyODM4Li5hMjY3ZWEzNGI3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuMTMuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuMTQuMC5iYgpAQCAtMTIsNyAr
MTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NTE0MTkyNjBh
YTk1NDQ5OWY3YWJhYWJhYTg4MmJiZSIKIERFUEVORFMgPSAibWFrZS1uYXRpdmUiCiAKIFNSQ19V
UkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9zb2Z0d2FyZS91dGlscy9wY2l1dGlscy9wY2l1dGls
cy0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzdmMTFmNzgyOTg1MDI2MzRk
MWFmNTAzMDhmMTVhNTc4ODYyOWY2Y2Y0NWNiYTM3NmY1MDA5YWVhNGNiNDkyNiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJlNzcxMzQwOTg4MjgxMzk5MWQyMjY5ZDEyNWU0MGRhZDFmNTRhMDE5YTUy
Yjc4YjM5NjI5NDFjMWQ0YTZmODZmIgogCiBpbmhlcml0IG11bHRpbGliX2hlYWRlciBwa2djb25m
aWcgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============5259461427394955645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.13.0", added "/usr/lib/libpci.so.3.14.0"
Changes to packages/core2-64-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.13.0 to libpci.so.3.14.0
  /usr/lib/libpci.so.3.13.0 moved to /usr/lib/libpci.so.3.14.0

--===============5259461427394955645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pciutils: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.13.0.tar.xz" to "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.14.0.tar.xz"
packages/core2-64-poky-linux/pciutils: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/libpci: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.13.0", added "/usr/lib/libpci.so.3.14.0"
packages/core2-64-poky-linux/pciutils/libpci: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PKGSIZE changed from 799384 to 827080 (+3%)
packages/core2-64-poky-linux/pciutils/pciutils-dbg: FILELIST: removed "/usr/lib/.debug/libpci.so.3.13.0", added "/usr/lib/.debug/libpci.so.3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-dev: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 106460 to 114830 (+8%)
packages/core2-64-poky-linux/pciutils/pciutils-dev: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-doc: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 40372 to 42373 (+5%)
packages/core2-64-poky-linux/pciutils/pciutils-doc: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-ids: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-ids: PKGSIZE changed from 331812 to 348602 (+5%)
packages/core2-64-poky-linux/pciutils/pciutils-ids: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-locale: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-locale: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-src: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 448080 to 464891 (+4%)
packages/core2-64-poky-linux/pciutils/pciutils-src: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-staticdev: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils-staticdev: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils: PV changed from "3.13.0" to "3.14.0"
packages/core2-64-poky-linux/pciutils/pciutils: PKGSIZE changed from 186597 to 194789 (+4%)
packages/core2-64-poky-linux/pciutils/pciutils: PKGV changed from 3.13.0 [default] to 3.14.0 [default]
Changes to packages/core2-64-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.13.0 to libpci.so.3.14.0
  /usr/lib/libpci.so.3.13.0 moved to /usr/lib/libpci.so.3.14.0

--===============5259461427394955645==--

