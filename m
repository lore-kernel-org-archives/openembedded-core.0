Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD3BC369CC
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20158.1744723967768625174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YdkrruwI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mnYv1XBR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019639a75d4c-77961948-9463-4fca-970e-a7db37babf74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qp7V9ivsnMMaCKj/jc2e5zjKY/3xt/Tso2LU5cwOdr0=;
	b=YdkrruwI/Ge2bdUMBA0elOUTc9zaTjB1NncTIj/gUaAroxxJoOWIniAZCDObgr7z
	JJ5kBaZUyCnoxQcPT+wyilsk9i/LASnQjWswpJpn61zKk8XOCFSd+2MEveETH6x6U78
	EQUIh7cNOmvr+SERNU1KfgHm43p1YctttL0Agzeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qp7V9ivsnMMaCKj/jc2e5zjKY/3xt/Tso2LU5cwOdr0=;
	b=mnYv1XBR+i5NyhoiyX4N0fugGUzY4tk02ZoSqTXyC9S9baiwRkgxRYkba06zHFcV
	1/Sr2AnQ814p4jNmHKUrlYF+2dEXbYcLKKBxSKkedyjsOSA2MVU2rE7gt3zsV3XCi+A
	DSBy0g16DmWZkRcgpn9852zrQcKL5KXZby9a8yXw=
Content-Type: multipart/mixed; boundary="===============2080665981457551867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.22 SUCCEEDED
Message-ID: <0101019639a75d4c-77961948-9463-4fca-970e-a7db37babf74-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214932

--===============2080665981457551867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.21-5.22.patch
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
From 0290a48e9d730934398aaf5b492bceb97da70737 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 12:52:12 +0000
Subject: [PATCH] debianutils: upgrade 5.21 -> 5.22

---
 .../debianutils/{debianutils_5.21.bb => debianutils_5.22.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.21.bb => debianutils_5.22.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.21.bb b/meta/recipes-support/debianutils/debianutils_5.22.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.21.bb
rename to meta/recipes-support/debianutils/debianutils_5.22.bb
index e0485b24a3..6c66e31072 100644
--- a/meta/recipes-support/debianutils/debianutils_5.21.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.22.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
+SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============2080665981457551867==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.21-5.22.patch"

RnJvbSAwMjkwYTQ4ZTlkNzMwOTM0Mzk4YWFmNWI0OTJiY2ViOTdkYTcwNzM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTI6NTI6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjIxIC0+IDUuMjIKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjIxLmJiID0+IGRlYmlhbnV0aWxzXzUuMjIuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMjEuYmIgPT4gZGViaWFu
dXRpbHNfNS4yMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIxLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4yMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIxLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjIyLmJiCmluZGV4IGUwNDg1YjI0YTMuLjZjNjZlMzEwNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMi5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImFlMDAyYjQ5OGYyZTMxMGM5MzRhMGIz
ZjA5OTJlODMzOTFmMTA4YzciCitTUkNSRVYgPSAiNTI4ZmFjNWM3NDQ4OTg5ZjMzYzU0NTk5YWU2
ZTRjMmI4NGQ0MWUyMSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQ3LjEKCg==

--===============2080665981457551867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 94056 to 94192 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 33339 to 33368 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.21 [default] to 5.22 [default]

--===============2080665981457551867==--

