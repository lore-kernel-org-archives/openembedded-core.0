Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF4CA9EA5
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13797.1681581684288546984
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WYUTQ67r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018786143be3-038343df-f80c-4ddf-a0c7-d80895305d0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/lEEs46H5XnIvxSgeF05RoXvE3HkcY9z6WRoZYnYdJw=;
	b=WYUTQ67rslPF1Y02o6QU4sm0eoDSi9tY35aFIPWU9ivcfKBbOi0QIjaIVJjhqg/p
	MN3iY54uHH1THTW1xrEj04zxUpUehOsV8wf331D6oMgGVw3UzOhDj8EjV84FaUHLzYE
	H0KPGHgATF1lClesg8UrXRhFoL71Pch1O52CDPMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/lEEs46H5XnIvxSgeF05RoXvE3HkcY9z6WRoZYnYdJw=;
	b=QW8yEdM7zjgraLqSk+7E9VtcLP6kFHkEIEwhSXXxjAdjEsbUGT4ItsKSPfybHNcE
	iE8+mz19+vA9TX/Xui3PRvgRBDkHSodCqKJDUNzR+1mzqIx5+aUQrA0yh995l1PXCKJ
	qUBeg8GhqLvZ/e3c90pwAokh7HcnliVrZO73npDc=
Content-Type: multipart/mixed; boundary="===============3565668650326452580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to cf4ec7f35521eb54d72ce0c92ce65b2249171cbd
 SUCCEEDED
Message-ID: <0101018786143be3-038343df-f80c-4ddf-a0c7-d80895305d0e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180058

--===============3565668650326452580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *cf4ec7f35521eb54d72ce0c92ce65b2249171cbd* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
--===============3565668650326452580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSAxYzQyMzIzNmEwZWExYjgwZGRlOWU3OTM3Yjc4M2Q5ODY3Y2NlM2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTM6NTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggYjJjMTBlMDlmYi4uZTNjMDk4M2QyYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9rbXNjdWJlLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4MTI3MGRkNjMxZmIiCiAK
LVNSQ1JFViA9ICIzNDUxMTE0ODFkNjU0YjM4YTcyYjVjMzYyOTE1MWRjNzRmN2E4MmJjIgorU1JD
UkVWID0gImNmNGVjN2YzNTUyMWViNTRkNzJjZTBjOTJjZTY1YjIyNDkxNzFjYmQiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNjdWJlO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLS0gCjIu
MzkuMgoK

--===============3565668650326452580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4577539 to 4577537 (-0%)

--===============3565668650326452580==--

