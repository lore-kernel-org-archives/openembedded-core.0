Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B559DC54ED0
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.75745.1722536825246102002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gVvep9x5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YbT/W6U2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101910f324288-6f7b09a9-e197-4f00-8f08-6fbaea822b73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HiYa0QnMxSgVSiEBfTnG9ezLiZJWriJ3VJ/Ok4Fr4/4=;
	b=gVvep9x5KUAMXpMusLApkdMwMOayL+8dlPlj2lSZ8J8aVSrlcIrt4y6+Aj3keqIY
	d+78xko3Aqeu6HDwgZJqdY+rrYR1jkqa+aVaPtZ4PLNXoTzhNZVz05l4pDd7DfjndCd
	l16C7BQraS5YWAC4oAxK7B1PuN5XQriUd331e7lw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HiYa0QnMxSgVSiEBfTnG9ezLiZJWriJ3VJ/Ok4Fr4/4=;
	b=YbT/W6U24KFAGs6+uVxXW3evap/TvH+pvsJPdvx7FsOZdVnDhqHxOlN+T2GyzRGW
	ky5uyThN5iwjVeDmDEIPONyS51ABNefhB50lKFTi1EYPVP6kByCefCC1ozl8i1EkcKJ
	e5rwETarR2JZUlUV0pnoE0OVD720JLDQFWH/+kuo=
Content-Type: multipart/mixed; boundary="===============3145727471116927361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnl: upgrading to 3.10.0 SUCCEEDED
Message-ID: <010101910f324288-6f7b09a9-e197-4f00-8f08-6fbaea822b73-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202876

--===============3145727471116927361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnl* to *3.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnl-upgrade-3.9.0-3.10.0.patch
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
From dab4d5a32e81ec4f6c5bd75a6c76c5cfc13773c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:35:30 +0000
Subject: [PATCH] libnl: upgrade 3.9.0 -> 3.10.0

---
 meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.10.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.9.0.bb
rename to meta/recipes-support/libnl/libnl_3.10.0.bb
index b2825374cf..4691c6554f 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb"
+SRC_URI[sha256sum] = "49b3e2235fdb58f5910bbb3ed0de8143b71ffc220571540502eb6c2471f204f5"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.44.0


--===============3145727471116927361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 71910 to 100590 (+40%)

--===============3145727471116927361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnl-upgrade-3.9.0-3.10.0.patch"

RnJvbSBkYWI0ZDVhMzJlODFlYzRmNmM1YmQ3NWE2Yzc2YzVjZmMxMzc3M2MyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzozNTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5sOiB1cGdyYWRlIDMuOS4wIC0+IDMuMTAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJubC97bGlibmxfMy45LjAuYmIgPT4gbGlibmxfMy4xMC4wLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYm5sL3tsaWJubF8zLjkuMC5iYiA9PiBsaWJubF8zLjEwLjAuYmJ9ICg5NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvbGlibmxfMy45LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJubC9saWJubF8zLjEwLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvbGlibmxfMy45
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm5sL2xpYm5sXzMuMTAuMC5i
YgppbmRleCBiMjgyNTM3NGNmLi40NjkxYzY1NTRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJubC9saWJubF8zLjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJubC9saWJubF8zLjEwLjAuYmIKQEAgLTE4LDcgKzE4LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhV
Ql9CQVNFX1VSSX0vZG93bmxvYWQvJHtCUE59JHtAZC5nZXRWYXIoJ1BWJykucmVwbGFjZSgnLics
J18nKX0KICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImFlZDUwNzAwNGQ3MjhhNWNmMTFlYWI0OGNhNGJmOWU2ZTE4NzQ0
NDRlMzM5MzliOWQzZGZlZDI1MDE4ZWU5YmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDliM2Uy
MjM1ZmRiNThmNTkxMGJiYjNlZDBkZTgxNDNiNzFmZmMyMjA1NzE1NDA1MDJlYjZjMjQ3MWYyMDRm
NSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS90aG9tMzExLyR7QlBO
fS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy9saWJubCg/
UDxwdmVyPi4rKSIKLS0gCjIuNDQuMAoK

--===============3145727471116927361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnl: SRC_URI changed from "https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz file://run-ptest" to "https://github.com/thom311/libnl/releases/download/libnl3_10_0/libnl-3.10.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/libnl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-cli: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-cli: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-dbg: PKGSIZE changed from 3954648 to 4095464 (+4%)
packages/core2-64-poky-linux/libnl/libnl-dbg: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-dbg: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-dev: PKGSIZE changed from 291075 to 293648 (+1%)
packages/core2-64-poky-linux/libnl/libnl-dev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-dev: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-doc: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-doc: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-genl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-genl: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-idiag: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-idiag: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-locale: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-locale: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-nf: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-nf: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 71910 to 100590 (+40%)
packages/core2-64-poky-linux/libnl/libnl-ptest: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-ptest: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-route: PKGSIZE changed from 595665 to 603857 (+1%)
packages/core2-64-poky-linux/libnl/libnl-route: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-route: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-src: PKGSIZE changed from 2940032 to 2977781 (+1%)
packages/core2-64-poky-linux/libnl/libnl-src: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-src: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-staticdev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-staticdev: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-xfrm: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-xfrm: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl: PV changed from "3.9.0" to "3.10.0"

--===============3145727471116927361==--

