Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A8EC27C52
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129518.1692086042269091048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e8BY8r+M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OxnuBMEw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f830029d-aeff1f8d-d13e-41fa-aefe-9dc835c0e4df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0neCgni/kvlzKI0kWjKvhsHWfQV+cgG6ItuZhDr6xVc=;
	b=e8BY8r+MrfQiZ9C9Tlwl0H1oi8IeC+ws4M3O0JLa74fmb6S2MVIk8fsXXgtFHAee
	WeNL8VfXqK5hop2PFr+w08Y7cvmcLjdd8P3vgZwI5L2Hnt5Uf1BuEb7YUM984hZ2nqM
	pUGnyN5mYu2ELqCK5qP4av+LqaY+8RFuvbm5Oq5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0neCgni/kvlzKI0kWjKvhsHWfQV+cgG6ItuZhDr6xVc=;
	b=OxnuBMEwcjllqOAQJ4Ks2/6q+0w9C+EkruvDlOimwsl5fwVBgrUSgj0UKxAy7PBY
	8oOOHGV7H4CHBbaTPRCqqFZkg+JO6EFla4bWI6SnUmtjEO7CJejJd5gpvssG56EqML0
	tsD0cblH8YzNn26j4v97uG0wZkbXz3kU/CCSiYF0=
Content-Type: multipart/mixed; boundary="===============4584667777856483282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <01010189f830029d-aeff1f8d-d13e-41fa-aefe-9dc835c0e4df-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186007

--===============4584667777856483282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch
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
From 3f282c9869969799176425cab1f0ee0db9665400 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 07:02:09 +0000
Subject: [PATCH] glslang: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
-- 
2.39.2


--===============4584667777856483282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSAzZjI4MmM5ODY5OTY5Nzk5MTc2NDI1Y2FiMWYwZWUwZGI5NjY1NDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMDc6MDI6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjUwLjEKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI1MC4xLmJifSAgICAgICAgfCAw
CiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuMy4yNTAuMC5iYiA9PiBn
bHNsYW5nXzEuMy4yNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1
MC4xLmJiCi0tIAoyLjM5LjIKCg==

--===============4584667777856483282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.250.0" to "1.3.250.1"

--===============4584667777856483282==--

