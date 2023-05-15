Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0865BC8300C
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.3702.1684186746276514777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gfQ6Tpp7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188215a6090-5906c6b7-80c5-442a-8c30-634b7d5d7bf7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=elzmLc1QP7eAss7gPz+T4aZJzWzMuZ48+0IEwFVpHWg=;
	b=gfQ6Tpp7hpQG4MHn6jacblpe7UuhCU9BH9oXrTCO8QWyCbC8crx81l3Rw3xuvbvA
	fvsbzBPKhXN23jHR/o7S9qLv40t4fnGXIl5w/VSVTC620OLBVNubLjSQ7o00uVWY/Ss
	kaf3lNmAp4nN+x78YpZumZD5CY1K3/FVy/1xvYLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=elzmLc1QP7eAss7gPz+T4aZJzWzMuZ48+0IEwFVpHWg=;
	b=gpHtb5FX6tOMmpurZ5THj0nmFaz+AWTjjFk422zLpk/2qly6YFoXzgHvQX2lmQ6R
	3kXZqCEi8vHRXVxFJiv5ZbhRSq58Uh0KyttjqpePL5Yp1rWq7rq/4bKFc6QTZ19xsjx
	vd6lk0c+BmLz79XshpSw750ols+G1x2KiZRN19MY=
Content-Type: multipart/mixed; boundary="===============0922964577076303701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2023.05.03 SUCCEEDED
Message-ID: <01010188215a6090-5906c6b7-80c5-442a-8c30-634b7d5d7bf7-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181372

--===============0922964577076303701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2023.05.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch
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
--===============0922964577076303701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.02.13.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.05.03.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5858 to 5910 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6871 to 6923 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]

--===============0922964577076303701==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch"

RnJvbSAyOTJjNzVmOWRjMzBlOWNmODc4YjNkZjhlMjE0M2Q5ZDBjMjUxMGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6MDI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDIzLjAyLjEzIC0+IDIwMjMuMDUuMDMKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDIzLjAyLjEzLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjMuMDUuMDMu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyMy4wMi4xMy5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMy4wMi4xMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wNS4wMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjMuMDIuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wNS4wMy5iYgppbmRleCBjZTYwMTU0ZjFlLi5jZDNmNTJmYzc2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjMuMDIuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmZTgxZThhODY5NGRjNDc1M2E0NTA4N2ExYzRjN2UxYjQ4ZGVlNWE1OWY1
Zjc5NmNlMzc0ZWE1NTBmMGIyZTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYyNTRkMDhhYjM3
NjVhZWFlMmI4NTYyMjJlMTFhOTVkNDRhZWY1MTlhNjY2Mzg3N2M3MWVmNjhmYWU0YzhjMTIiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjM5LjIKCg==

--===============0922964577076303701==--

