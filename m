Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53317C3ABA8
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.115389.1726410840436506994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eTdLskrB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZgB9tJy+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191f61ad68f-653d18e2-c7cf-4243-b28c-8429121b09c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1qWtr4b5fmvJJLd0NmvQ8UUAl6Kz2qFkmvB8lzj4Dk4=;
	b=eTdLskrBwSJl+jMj2VFNzokJnkPJbgmbs2U2Pm0uBNf3PTnZyq2ywX3lvl1/wRom
	GO5eufd15P8J1OMH1vysvbv+2YR+bltQZr1AJGS9uJ8gbwIkFLy0QFAoPjCcFJwRync
	UKbqomb/QkDT1k+r4zFQ9GJr8bWxSLIsLr59W284=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1qWtr4b5fmvJJLd0NmvQ8UUAl6Kz2qFkmvB8lzj4Dk4=;
	b=ZgB9tJy+7xwrKGacEEAiAHSTKof2KRNTERIWFpbuzQDws9q93RAiN5pAeAb76g9v
	fMMxsqSnxoPCm2KjQuidAyzh6aPoy0iQqRvHqvFYUNn/Jc6nYNbU0WKYHuhz0Hh6RFF
	FQzh3sRb4Ham/Yc3bhO/4wf9bedi/223ZmW0vpZA=
Content-Type: multipart/mixed; boundary="===============2204567954158663832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtry-tiny-perl: upgrading to 0.32 SUCCEEDED
Message-ID: <01010191f61ad68f-653d18e2-c7cf-4243-b28c-8429121b09c8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204514

--===============2204567954158663832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtry-tiny-perl* to *0.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtry-tiny-perl-upgrade-0.31-0.32.patch
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
From 3af301b0cda7043e510483bca3a2bc0d416a4114 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:09:42 +0000
Subject: [PATCH] libtry-tiny-perl: upgrade 0.31 -> 0.32

---
 .../perl/{libtry-tiny-perl_0.31.bb => libtry-tiny-perl_0.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtry-tiny-perl_0.31.bb => libtry-tiny-perl_0.32.bb} (91%)

diff --git a/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
similarity index 91%
rename from meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
rename to meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
index a3728d8435..d0714695b8 100644
--- a/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
+++ b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=5dc332c2d4aade55f5db244681000091"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Try-Tiny-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be"
+SRC_URI[sha256sum] = "ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0"
 
 S = "${WORKDIR}/Try-Tiny-${PV}"
 
-- 
2.44.0


--===============2204567954158663832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtry-tiny-perl: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-0.31.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-0.32.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libtry-tiny-perl: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-dbg: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-dbg: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-dev: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-dev: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-doc: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-doc: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-locale: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-locale: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-ptest: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-ptest: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-ptest: PKGSIZE changed from 30406 to 30665 (+1%)
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-src: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-src: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-staticdev: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl-staticdev: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/libtry-tiny-perl/libtry-tiny-perl: PKGSIZE changed from 21143 to 21142 (-0%)

--===============2204567954158663832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtry-tiny-perl-upgrade-0.31-0.32.patch"

RnJvbSAzYWYzMDFiMGNkYTcwNDNlNTEwNDgzYmNhM2EyYmMwZDQxNmE0MTE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MDk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cnktdGlueS1wZXJsOiB1cGdyYWRlIDAuMzEgLT4gMC4zMgoKLS0tCiAuLi4vcGVybC97bGli
dHJ5LXRpbnktcGVybF8wLjMxLmJiID0+IGxpYnRyeS10aW55LXBlcmxfMC4zMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidHJ5LXRpbnktcGVybF8wLjMxLmJiID0+IGxp
YnRyeS10aW55LXBlcmxfMC4zMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9saWJ0cnktdGlueS1wZXJsXzAuMzEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcGVybC9saWJ0cnktdGlueS1wZXJsXzAuMzIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidHJ5LXRpbnktcGVybF8w
LjMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0cnktdGlueS1w
ZXJsXzAuMzIuYmIKaW5kZXggYTM3MjhkODQzNS4uZDA3MTQ2OTViOCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidHJ5LXRpbnktcGVybF8wLjMxLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRyeS10aW55LXBlcmxfMC4zMi5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT01ZGMzMzJj
MmQ0YWFkZTU1ZjVkYjI0NDY4MTAwMDA5MSIKIAogU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9h
dXRob3JzL2lkL0UvRVQvRVRIRVIvVHJ5LVRpbnktJHtQVn0udGFyLmd6IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzMwMGQzMWQ4YTQwNzViMjZkOGY0NmNlODY0YTFkOTEzZTBlODQ2N2NlZWJh
NjY1NWQ1ZDJiMmUyMDZjMTFiZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZjJkNmNhYjBiYWQx
OGUzYWIxYzRlNjEyNWNjNWY2OTVjN2U0NTk4OTlmNTEyNDUxYzhmYTNlZjgzZmE3ZmMwIgogCiBT
ID0gIiR7V09SS0RJUn0vVHJ5LVRpbnktJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============2204567954158663832==--

