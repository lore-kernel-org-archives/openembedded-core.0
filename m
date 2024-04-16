Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D117C531DA
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13470.1713248052687708924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e0mA/Dy/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QpPYEflf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58aa51a-2a710a9b-6cba-44b3-8e81-f567444da83f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T1Iizrae+lO5rKpmHsyhliQlD+dtBDhrdFlp1VUR3kM=;
	b=e0mA/Dy/O1BrgO2wqakQBm0JSmYeeSWqItgdWW5DK2bf5sN6SnjPE8/vJl4e44iB
	bkiVHjr9cznoYNJpoSqdzNLMPrS3ppGv/kBO3dlB/Dad6t0kToQ0jaIStSVJF52Cgwi
	4A1srYtUzLV5KeYIR0VMcXF9XdDIJoJZkHBx+xUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T1Iizrae+lO5rKpmHsyhliQlD+dtBDhrdFlp1VUR3kM=;
	b=QpPYEflfCtN7cMNk9UgFMW/7+XEGofJaaPsJTzHKSLsplUq9lg9bs/OpiyMO7mE5
	giarCxs4stPy9O/EzK+DUBb2C+H4ZNdvt2gtQl7/NSMxT8GlH2LBiTm40bEHupTCMz5
	zxrZzO7atyZmaOjVgw/hVTjEADMKhjTyaJe3XHlo=
Content-Type: multipart/mixed; boundary="===============4946502988961229111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.45.3 SUCCEEDED
Message-ID: <0101018ee58aa51a-2a710a9b-6cba-44b3-8e81-f567444da83f-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198429

--===============4946502988961229111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.45.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.45.1-3.45.3.patch
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
From 4c1afe4e3bf3e65634c9232d5882604af1ca8d92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 06:00:21 +0000
Subject: [PATCH] sqlite3: upgrade 3.45.1 -> 3.45.3

---
 .../sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.45.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 50612feb25..03d70bbd38 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a"
+SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.42.0


--===============4946502988961229111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2024/sqlite-autoconf-3450100.tar.gz" to "http://www.sqlite.org/2024/sqlite-autoconf-3450300.tar.gz"
packages/core2-64-poky-linux/sqlite3: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 679067 to 680298 (+0%)
packages/core2-64-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/libsqlite3: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 5993848 to 5994712 (+0%)
packages/core2-64-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 10569618 to 10581443 (+0%)
packages/core2-64-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/sqlite3-src: PV changed from "3.45.1" to "3.45.3"
packages/core2-64-poky-linux/sqlite3/sqlite3: PKGV changed from 3.45.1 [default] to 3.45.3 [default]
packages/core2-64-poky-linux/sqlite3/sqlite3: PV changed from "3.45.1" to "3.45.3"

--===============4946502988961229111==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.45.1-3.45.3.patch"

RnJvbSA0YzFhZmU0ZTNiZjNlNjU2MzRjOTIzMmQ1ODgyNjA0YWYxY2E4ZDkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDY6MDA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDUuMSAtPiAzLjQ1LjMKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQ1LjEuYmIgPT4gc3FsaXRlM18zLjQ1LjMuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDUuMS5iYiA9PiBzcWxpdGUzXzMuNDUu
My5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQ1LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQ1
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40NS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQ1LjMuYmIKaW5kZXggNTA2MTJmZWIyNS4uMDNkNzBiYmQzOCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40NS4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNDUuMy5iYgpAQCAt
NCw1ICs0LDUgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNC9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDljMjc4NDFiN2E1
OTMyYzk4OTc2NTFlMjBiODZjNzAxZGQ3NDA1NTY5ODliMDFjYTU5NmZjZmEzZDQ5YTBhIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImIyODA5Y2E1MzEyNGMxOWM2MGY0MmJmNjI3NzM2ZWFlMDExYWZk
Y2MyMDViYjQ4MjcwYTVlZTlhMzgxOTE1MzEiCiAKLS0gCjIuNDIuMAoK

--===============4946502988961229111==--

