Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D73C54E76
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.144500.1671136351640128072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eP4sjFOK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d196b-8623df1d-eefc-4f26-9dcb-bd953fb62227-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W/Isgz/wGxhtuebXkw9Kjfmq/AddQT4hw0YZkb5RW/Q=;
	b=eP4sjFOKjrlGn+8jTF3qsMWc0/TP+Hw7GGtJf1F86/0xlQUDOtCeLOcWSQq0aSz0
	hr+STygaMroeXCIEMFa3ugYut8PXudxAUgRK/eOJC5ApZ9ioU9ib6FTiQZZOLaYNxbM
	de5laBVk1rz8undRAH0rh9O5skmFsWXVQpU2/KSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W/Isgz/wGxhtuebXkw9Kjfmq/AddQT4hw0YZkb5RW/Q=;
	b=YjvCH3JEE3nqUU6qbG+HiP9yX+DdWR0ExIVPCvhMjKSOlALyCU6tXoL/asMDwPkI
	CvCAvgCPs0PLMN0PO/QSKqDa5l1z8CfVuuAauzZBWipCeI/cjpkWum7XQq6y7T2vkyi
	ratJv0nuE+Usi6Gmd1xM0dca3Q6nuVmJAyGk6RFQ=
Content-Type: multipart/mixed; boundary="===============8394451344532556372=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 345111481d654b38a72b5c3629151dc74f7a82bc
 SUCCEEDED
Message-ID: <01010185177d196b-8623df1d-eefc-4f26-9dcb-bd953fb62227-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174682

--===============8394451344532556372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *345111481d654b38a72b5c3629151dc74f7a82bc* has Succeeded.

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
--===============8394451344532556372==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSAzMGQ5OWRjNzZmNjViNTFkYjFiNjU1MGJiZWUzMWVhNjQyNzI1NDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTU6MDE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggNmVkOTdkZmFmZS4uYjJjMTBlMDlmYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9rbXNjdWJlLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4MTI3MGRkNjMxZmIiCiAK
LVNSQ1JFViA9ICIzYmY2ZWUxYTAyMzM0Mzg2ZDg3Y2ZlMzU2YzNiZmIwYjI0ZTFmZWQ4IgorU1JD
UkVWID0gIjM0NTExMTQ4MWQ2NTRiMzhhNzJiNWMzNjI5MTUxZGM3NGY3YTgyYmMiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNjdWJlO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLS0gCjIu
MzcuMwoK

--===============8394451344532556372==--

