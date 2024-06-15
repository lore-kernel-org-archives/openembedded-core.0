Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0123DC3DA4B
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18619.1718475800277294624
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eKAeR9Rw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=y0qdrxzm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101901d23bb07-3603ff89-4303-4d1c-9eae-6b87a977ff9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9/mK5kwVBrdtiHDpEyeTjMfOR6GRuwtMcasBhamJ8Cc=;
	b=eKAeR9RwkLOHqKLCpcbsIlYJynnUmF8A3zCEhsEVqHqwXk9CyIOSQQDl89r+PGSc
	j+5mvqIj+p+28C5CyXuWi0sjEiXfn2rybFTZg87FMDrBqdk2kWuAjn2yHUE1hYoycMk
	SthTSKvycVai1QBEybJQl4WKmCXVut7zv5dJBd04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9/mK5kwVBrdtiHDpEyeTjMfOR6GRuwtMcasBhamJ8Cc=;
	b=y0qdrxzmTiLH2caF8PBvLo7lEynehhcdkCMyZ6QW5HgodAUbcq+4gYkhSQJPDtDa
	Z9WQoWE6Oj00NVQXWnGiczsCJarf4QYiXKgsVD8c3FxtN937NXBPmUaw7vDR1KVb93C
	iMph8KAreUilCuo8dXMi2snP8bKo/gvSDgefdESc=
Content-Type: multipart/mixed; boundary="===============8542753291754823177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] logrotate: upgrading to 3.22.0 SUCCEEDED
Message-ID: <010101901d23bb07-3603ff89-4303-4d1c-9eae-6b87a977ff9d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200715

--===============8542753291754823177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *logrotate* to *3.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-logrotate-upgrade-3.21.0-3.22.0.patch
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
From 07f37ea4f520371926b9514d572c6bce5b621f75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 11:32:26 +0000
Subject: [PATCH] logrotate: upgrade 3.21.0 -> 3.22.0

---
 .../logrotate/{logrotate_3.21.0.bb => logrotate_3.22.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.21.0.bb => logrotate_3.22.0.bb} (98%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
similarity index 98%
rename from meta/recipes-extended/logrotate/logrotate_3.21.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.22.0.bb
index 10a6149abc..ac14f30051 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516"
+SRC_URI[sha256sum] = "42b4080ee99c9fb6a7d12d8e787637d057a635194e25971997eebbe8d5e57618"
 
 CVE_STATUS_GROUPS = "CVE_STATUS_RECIPE"
 CVE_STATUS_RECIPE = "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.44.0


--===============8542753291754823177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-logrotate-upgrade-3.21.0-3.22.0.patch"

RnJvbSAwN2YzN2VhNGY1MjAzNzE5MjZiOTUxNGQ1NzJjNmJjZTViNjIxZjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTE6MzI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
b2dyb3RhdGU6IHVwZ3JhZGUgMy4yMS4wIC0+IDMuMjIuMAoKLS0tCiAuLi4vbG9ncm90YXRlL3ts
b2dyb3RhdGVfMy4yMS4wLmJiID0+IGxvZ3JvdGF0ZV8zLjIyLjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbG9ncm90YXRlL3tsb2dyb3RhdGVfMy4yMS4wLmJiID0+IGxvZ3Jv
dGF0ZV8zLjIyLjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xv
Z3JvdGF0ZS9sb2dyb3RhdGVfMy4yMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjEuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMi4w
LmJiCmluZGV4IDEwYTYxNDlhYmMuLmFjMTRmMzAwNTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjEuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbG9ncm90YXRlL2xvZ3JvdGF0ZV8zLjIyLjAuYmIKQEAgLTE0LDcgKzE0LDcg
QEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFy
Lnh6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjhmYTEyMDE1ZTNiODQxNWMxMjFmYzljMGNhNTNhYTg3MmY3YjA3
MDJmNTQzYWZkYTdlMzJiNmM0OTAwZjY1MTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDJiNDA4
MGVlOTljOWZiNmE3ZDEyZDhlNzg3NjM3ZDA1N2E2MzUxOTRlMjU5NzE5OTdlZWJiZThkNWU1NzYx
OCIKIAogQ1ZFX1NUQVRVU19HUk9VUFMgPSAiQ1ZFX1NUQVRVU19SRUNJUEUiCiBDVkVfU1RBVFVT
X1JFQ0lQRSA9ICJDVkUtMjAxMS0xNTQ4IENWRS0yMDExLTE1NDkgQ1ZFLTIwMTEtMTU1MCIKLS0g
CjIuNDQuMAoK

--===============8542753291754823177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/logrotate/logrotate-ptest: FILELIST: added "/usr/lib/logrotate/ptest/test-0111.sh /usr/lib/logrotate/ptest/test-0109.sh /usr/lib/logrotate/ptest/test-config.111.in /usr/lib/logrotate/ptest/test-config.112.in /usr/lib/logrotate/ptest/test-config.110.in /usr/lib/logrotate/ptest/test-config.109.in /usr/lib/logrotate/ptest/test-0094.sh /usr/lib/logrotate/ptest/test-0110.sh /usr/lib/logrotate/ptest/test-config.94.in /usr/lib/logrotate/ptest/test-0112.sh"

--===============8542753291754823177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/logrotate: SRC_URI changed from "https://github.com/logrotate/logrotate/releases//download/3.21.0/logrotate-3.21.0.tar.xz file://run-ptest" to "https://github.com/logrotate/logrotate/releases//download/3.22.0/logrotate-3.22.0.tar.xz file://run-ptest"
packages/core2-64-poky-linux/logrotate: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-dbg: PKGSIZE changed from 168568 to 173744 (+3%)
packages/core2-64-poky-linux/logrotate/logrotate-dbg: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-dbg: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-dev: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-dev: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-doc: PKGSIZE changed from 28716 to 28941 (+1%)
packages/core2-64-poky-linux/logrotate/logrotate-doc: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-doc: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-locale: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-locale: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-ptest: PKGSIZE changed from 192161 to 204040 (+6%)
packages/core2-64-poky-linux/logrotate/logrotate-ptest: FILELIST: added "/usr/lib/logrotate/ptest/test-config.110.in /usr/lib/logrotate/ptest/test-config.111.in /usr/lib/logrotate/ptest/test-config.112.in /usr/lib/logrotate/ptest/test-0110.sh /usr/lib/logrotate/ptest/test-config.109.in /usr/lib/logrotate/ptest/test-0094.sh /usr/lib/logrotate/ptest/test-0109.sh /usr/lib/logrotate/ptest/test-config.94.in /usr/lib/logrotate/ptest/test-0112.sh /usr/lib/logrotate/ptest/test-0111.sh"
packages/core2-64-poky-linux/logrotate/logrotate-ptest: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-ptest: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-src: PKGSIZE changed from 189968 to 196095 (+3%)
packages/core2-64-poky-linux/logrotate/logrotate-src: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-src: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate-staticdev: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate-staticdev: PV changed from "3.21.0" to "3.22.0"
packages/core2-64-poky-linux/logrotate/logrotate: PKGSIZE changed from 90267 to 90273 (+0%)
packages/core2-64-poky-linux/logrotate/logrotate: PKGV changed from 3.21.0 [default] to 3.22.0 [default]
packages/core2-64-poky-linux/logrotate/logrotate: PV changed from "3.21.0" to "3.22.0"

--===============8542753291754823177==--

