Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557D0C04FE2
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.844.1686887485470054927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LTzrFh0+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c2544dc8-42778264-e49a-4f4a-aa0d-8a60fe66d7c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yrKSRduKvm2BYjGU4m1DLWn3OAk4rIZ0iNYxJQ7Rafo=;
	b=LTzrFh0+6kPOXxkZmvgpYVBSs6fnoXWeC5dZNcsuZ5KKigQ9OfACMmqgv+CBmgee
	9A6+9z7WZ6PUF9NnqnF4ogCQTzGr10Z65R80heQGWkEl0cftl+sjh04XtOfmcPqUCqF
	+ITX2aId3eT1gvOLkMF0WTyEXx4BS9yyi3/dUUXA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yrKSRduKvm2BYjGU4m1DLWn3OAk4rIZ0iNYxJQ7Rafo=;
	b=GtVSwWkoW4WjWjR8uI1TA/o3AsiKAXpHtZhqW9IIqSg8FdhU+ageU3F4gqpOs3IH
	Alz1CA3+J/8Q5Z0GYCRaEKsLLhbe/7U8J6WkunSywuIsC2FjJZuU4tb3prwve9SEHyu
	GcpiUKh4/xyjSPv7nuDEOt2fzcvN72AoaMcEf8rM=
Content-Type: multipart/mixed; boundary="===============0325258306981675629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-ust: upgrading to 2.13.6 SUCCEEDED
Message-ID: <01010188c2544dc8-42778264-e49a-4f4a-aa0d-8a60fe66d7c6-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182958

--===============0325258306981675629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-ust* to *2.13.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-ust-upgrade-2.13.5-2.13.6.patch
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
From 2229e2530f829c30595eadd03fc360518a0c54ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 22:30:13 +0000
Subject: [PATCH] lttng-ust: upgrade 2.13.5 -> 2.13.6

---
 .../lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
index 916408bff0..424b0fa645 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
+SRC_URI[sha256sum] = "e7e04596dd73ac7aa99e27cd000f949dbb0fed51bd29099f9b08a25c1df0ced5"
 
 CVE_PRODUCT = "ust"
 
-- 
2.39.2


--===============0325258306981675629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-ust: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust: SRC_URI changed from "https://lttng.org/files/lttng-ust/lttng-ust-2.13.5.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch" to "https://lttng.org/files/lttng-ust/lttng-ust-2.13.6.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGSIZE changed from 3935740 to 3938712 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PKGSIZE changed from 220412 to 221689 (+1%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGSIZE changed from 108533 to 109060 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGSIZE changed from 1525185 to 1526182 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PKGV changed from 2.13.5 [default] to 2.13.6 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PV changed from "2.13.5" to "2.13.6"
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PKGV changed from 2.13.5 [default] to 2.13.6 [default]

--===============0325258306981675629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-ust-upgrade-2.13.5-2.13.6.patch"

RnJvbSAyMjI5ZTI1MzBmODI5YzMwNTk1ZWFkZDAzZmMzNjA1MThhMGM1NGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjI6MzA6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy11c3Q6IHVwZ3JhZGUgMi4xMy41IC0+IDIuMTMuNgoKLS0tCiAuLi4vbHR0bmcve2x0dG5n
LXVzdF8yLjEzLjUuYmIgPT4gbHR0bmctdXN0XzIuMTMuNi5iYn0gICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy11c3RfMi4xMy41LmJiID0+IGx0dG5nLXVzdF8y
LjEzLjYuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy11c3RfMi4xMy41LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy11c3Rf
Mi4xMy42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTMuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy11c3RfMi4xMy42LmJiCmluZGV4IDkxNjQwOGJmZjAuLjQyNGIwZmE2
NDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTMu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXVzdF8yLjEzLjYuYmIK
QEAgLTM0LDcgKzM0LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRu
Zy11c3QvbHR0bmctdXN0LSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1N
YWtlZmlsZS5hbS11cGRhdGUtcnBhdGgtbGluay5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImYxZDdiYjQ5ODRhM2RjNWRhY2QzYjdiY2I0YzEwYzA0YjA0MWIw
ZWVjZDdjYmExZmVmM2Q4Zjg2YWZmMDJiZDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTdlMDQ1
OTZkZDczYWM3YWE5OWUyN2NkMDAwZjk0OWRiYjBmZWQ1MWJkMjkwOTlmOWIwOGEyNWMxZGYwY2Vk
NSIKIAogQ1ZFX1BST0RVQ1QgPSAidXN0IgogCi0tIAoyLjM5LjIKCg==

--===============0325258306981675629==--

