Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E3ECD11C2
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1762384579487837860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0sfJytZA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gfrtzU3z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ec403-8e2ef69e-f637-48bb-ae82-441049497372-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ymjtwGZWCX3fKif3hLzTDGCU3NiFZt9v1ivQOo1cN4k=;
	b=0sfJytZA1O4iC78gPjvmk/0N65LUg/TcPp7Lb42jN3ak+MBX12U6N8VQMzpQpqce
	HmvbRNrkqkQo023xmDKq2qPaGpKsxZyolxafZTOTppfYMi/pBJlcNqiryMntHbVy7M7
	x2s/pUAz7k0CqjNYQ621q+ZtQw8TRA9d6uFEnF9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ymjtwGZWCX3fKif3hLzTDGCU3NiFZt9v1ivQOo1cN4k=;
	b=gfrtzU3zW8RUaV/3qzaOSNLzXdj/cEKpXsXNqKPZD/mOWKGbHQsRujfQAdBsU3Z1
	t495EMLg0inZC1qlH3ev0rpQPWZBwZq5HNgZgAeNCOh/KLG/cIy4ZCoytOj8p7PgKNH
	zmiQDlRZPgT99ZvC3YZX48/qZhwkqVwNl8od5aSs=
Content-Type: multipart/mixed; boundary="===============1982620931605382997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 685 SUCCEEDED
Message-ID: <0101019a564ec403-8e2ef69e-f637-48bb-ae82-441049497372-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225860

--===============1982620931605382997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *685* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-679-685.patch
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
From bc4e8a4ba8d260e84a28be350505561bc36d919e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:46:04 +0000
Subject: [PATCH] less: upgrade 679 -> 685

---
 meta/recipes-extended/less/{less_679.bb => less_685.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_679.bb => less_685.bb} (95%)

diff --git a/meta/recipes-extended/less/less_679.bb b/meta/recipes-extended/less/less_685.bb
similarity index 95%
rename from meta/recipes-extended/less/less_679.bb
rename to meta/recipes-extended/less/less_685.bb
index 613c71f571..904980a72f 100644
--- a/meta/recipes-extended/less/less_679.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
+SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============1982620931605382997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-679-685.patch"

RnJvbSBiYzRlOGE0YmE4ZDI2MGU4NGEyOGJlMzUwNTA1NTYxYmMzNmQ5MTllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODo0NjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxl
c3M6IHVwZ3JhZGUgNjc5IC0+IDY4NQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97
bGVzc182NzkuYmIgPT4gbGVzc182ODUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xl
c3Mve2xlc3NfNjc5LmJiID0+IGxlc3NfNjg1LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xlc3MvbGVzc182ODUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182NzkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sZXNzL2xlc3NfNjg1LmJiCmluZGV4IDYxM2M3MWY1NzEuLjkwNDk4MGE3MmYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc5LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjg1LmJiCkBAIC0yOSw3ICsyOSw3IEBAIFNS
Q19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vJHtCUE59LyR7QlBOfS0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWI2ODgyMGMzNGZhOGEwYWY2YjBlMDFiNzRmMDI5
OGJjZGQ0MGEwNDg5YzYxNjQ5YjQ3MDU4OTA4YTE1M2Q3OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNzAxMDQxZTc2N2U2OTdlZTQyMGNlMDgyNTY0MWNlZGM4ZjIwYjUxNTc2YWJlOTlkOTJjMTY2
NmQzMzJlOWRjIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rz
b2Z0d2FyZS5jb20vbGVzcy9kb3dubG9hZC5odG1sIgogCi0tIAoyLjQ3LjEKCg==

--===============1982620931605382997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/less: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-679.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-685.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/less/less-dbg: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-dbg: PKGSIZE changed from 927496 to 937240 (+1%)
packages/x86-64-v3-poky-linux/less/less-dev: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-dev: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-doc: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-doc: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-doc: PKGSIZE changed from 115972 to 118802 (+2%)
packages/x86-64-v3-poky-linux/less/less-locale: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-locale: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: PKGSIZE changed from 11254655 to 11254037 (-0%)
packages/x86-64-v3-poky-linux/less/less-src: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-src: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-staticdev: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-staticdev: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less: PKGSIZE changed from 295176 to 299480 (+1%)

--===============1982620931605382997==--

