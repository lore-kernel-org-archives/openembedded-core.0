Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B9DC83F09
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1424.1751386820097135076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i4tK+gKk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QV/a1xvQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca0c26-1f80ab35-3e54-41fe-81f8-d7521c5fdd97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X3h4N5IL/m89+JapUEc1dwv9dBxTyc+HDMbmAGN7k5M=;
	b=i4tK+gKkqt35WKqqc6EKbD1D1CRPcidrXhkIpLwHiOulU+XiwP0NbszrJmQhKtMz
	74g74cbqnMzqxKJNIkUVHOQ9q+RGW/ufCviAJt+vIVuIpJgWW+Oo6aAoKtGbQzgn03X
	wNb4YFSL9iV6In0yMSc6bJrixeq9iEjAj25JbRpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X3h4N5IL/m89+JapUEc1dwv9dBxTyc+HDMbmAGN7k5M=;
	b=QV/a1xvQA+Ee+Qa6qQZs+3dQPP39qi5s6t6Z48ze7K7aEkZemcCm9SUfc+gPDIV4
	ZSOwKhWDgGuH3vcjfeP3eWMWwZ31iaBHbfEx8VS3/1AthAZE7aD7nQ4PY6+ekWmMW2l
	E3fX2y0eGhTkHwfWIhQAkUjZAW7Ld1ZRe+yCOlg8=
Content-Type: multipart/mixed; boundary="===============0263453391984871098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 679 SUCCEEDED
Message-ID: <01010197c6ca0c26-1f80ab35-3e54-41fe-81f8-d7521c5fdd97-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219656

--===============0263453391984871098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *679* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-678-679.patch
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
From 3ba0d775e7a9bd32c87a9e4aff9d9d68ed31ca5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:46:00 +0000
Subject: [PATCH] less: upgrade 678 -> 679

---
 meta/recipes-extended/less/{less_678.bb => less_679.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_678.bb => less_679.bb} (95%)

diff --git a/meta/recipes-extended/less/less_678.bb b/meta/recipes-extended/less/less_679.bb
similarity index 95%
rename from meta/recipes-extended/less/less_678.bb
rename to meta/recipes-extended/less/less_679.bb
index 87ec6c92ca..613c71f571 100644
--- a/meta/recipes-extended/less/less_678.bb
+++ b/meta/recipes-extended/less/less_679.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4c085364f3028290d34647df27f56018c365dc4c0092ab7de74ed8fe89014fe7"
+SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============0263453391984871098==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-678-679.patch"

RnJvbSAzYmEwZDc3NWU3YTliZDMyYzg3YTllNGFmZjlkOWQ2OGVkMzFjYTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDo0NjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxl
c3M6IHVwZ3JhZGUgNjc4IC0+IDY3OQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97
bGVzc182NzguYmIgPT4gbGVzc182NzkuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xl
c3Mve2xlc3NfNjc4LmJiID0+IGxlc3NfNjc5LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc4LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xlc3MvbGVzc182NzkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NzguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sZXNzL2xlc3NfNjc5LmJiCmluZGV4IDg3ZWM2YzkyY2EuLjYxM2M3MWY1NzEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc4LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc5LmJiCkBAIC0yOSw3ICsyOSw3IEBAIFNS
Q19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vJHtCUE59LyR7QlBOfS0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGMwODUzNjRmMzAyODI5MGQzNDY0N2RmMjdmNTYw
MThjMzY1ZGM0YzAwOTJhYjdkZTc0ZWQ4ZmU4OTAxNGZlNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI5YjY4ODIwYzM0ZmE4YTBhZjZiMGUwMWI3NGYwMjk4YmNkZDQwYTA0ODljNjE2NDliNDcwNTg5
MDhhMTUzZDc4IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rz
b2Z0d2FyZS5jb20vbGVzcy9kb3dubG9hZC5odG1sIgogCi0tIAoyLjQ3LjEKCg==

--===============0263453391984871098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/less: PV changed from "678" to "679"
packages/core2-64-poky-linux/less: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-678.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-679.tar.gz file://run-ptest"
packages/core2-64-poky-linux/less/less-dbg: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-dbg: PKGSIZE changed from 927576 to 927568 (-0%)
packages/core2-64-poky-linux/less/less-dbg: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-dev: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-dev: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-doc: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-doc: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-locale: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-locale: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-ptest: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-ptest: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-src: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-src: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-staticdev: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-staticdev: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less: PKGV changed from 678 [default] to 679 [default]

--===============0263453391984871098==--

