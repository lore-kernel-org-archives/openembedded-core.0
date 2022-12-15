Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACECC77B7C
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.144506.1671136352048836677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TU+na1PW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d1d0e-e0caf50e-deca-4a4d-87be-7c27f6562045-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eOpilXcXdnn1kREB0n0DIitWF4dVcTGUGXA12pcxbYk=;
	b=TU+na1PWDcZ9P+IQ7XI7ylAOcCkF5JLdyT+f+RDSOSDj8jJsq1mJo8Y/aoCarRC0
	BOMEP8uGxk/+scO4+kSIuWuRf+WLwWHFuILM+EmRNDopCHqcqVut2J9oWdxzpSt/viU
	dsH2AdaxHESDEaNEX3vMf+o/kpl7fa0Ac42zcEgA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eOpilXcXdnn1kREB0n0DIitWF4dVcTGUGXA12pcxbYk=;
	b=WSGYtnu7khJj3gHd5KIwZ+MzloccGkPPIny9/JRAkO7gcN9Yw1wuORpWtBFDSoi7
	dpI/YLcJvuzF6KSR+kKaCq7JWS9RWa1chrcNZkGZnq7ek3Aymld1ajrHgFF6zZfZPHy
	/fKgTuP8FOn3SwuKQ3Ti++1ZsuAQrO1MG4HGCzL8=
Content-Type: multipart/mixed; boundary="===============9007427671409022741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedepend: upgrading to 1.0.8 SUCCEEDED
Message-ID: <01010185177d1d0e-e0caf50e-deca-4a4d-87be-7c27f6562045-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174702

--===============9007427671409022741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *makedepend* to *1.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedepend-upgrade-1.0.7-1.0.8.patch
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
--===============9007427671409022741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/makedepend: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend: SRC_URI changed from "https://www.x.org/releases//individual/util/makedepend-1.0.7.tar.gz" to "https://www.x.org/releases//individual/util/makedepend-1.0.8.tar.gz"
packages/core2-32-poky-linux/makedepend: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PKGSIZE changed from 79700 to 79520 (-0%)
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-dev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-dev: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-doc: PKGSIZE changed from 9519 to 9539 (+0%)
packages/core2-32-poky-linux/makedepend/makedepend-doc: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-doc: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-locale: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-locale: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-src: PKGSIZE changed from 80994 to 80831 (-0%)
packages/core2-32-poky-linux/makedepend/makedepend-src: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-src: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend-staticdev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend-staticdev: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/makedepend/makedepend: PKGSIZE changed from 42448 to 38352 (-10%)
packages/core2-32-poky-linux/makedepend/makedepend: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/makedepend/makedepend: PV changed from "1.0.7" to "1.0.8"

--===============9007427671409022741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedepend-upgrade-1.0.7-1.0.8.patch"

RnJvbSBmZWQ2ZGQ2NmU3NWExMzYwNjM1YThlOTI3Y2E2YzhmZGUxNmVhMTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTY6NDk6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YWtlZGVwZW5kOiB1cGdyYWRlIDEuMC43IC0+IDEuMC44CgotLS0KIC4uLi94b3JnLXV0aWwve21h
a2VkZXBlbmRfMS4wLjcuYmIgPT4gbWFrZWRlcGVuZF8xLjAuOC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXV0aWwve21ha2VkZXBlbmRfMS4wLjcuYmIgPT4gbWFrZWRl
cGVuZF8xLjAuOC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjcuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy11dGlsL21ha2VkZXBlbmRfMS4wLjguYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC43LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjgu
YmIKaW5kZXggMTJkZWEwMTJkYy4uYWQ3NjlkZTIwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC43LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXV0aWwvbWFrZWRlcGVuZF8xLjAuOC5iYgpAQCAtMTcsNCArMTcsNCBA
QCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9NDNhNmVkYTM0YjQ4ZWU4MjFiM2I2NmY0Zjc1M2NlNGYiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIxN2MxYWRmMDI4NGFhZWU0NzNhYmZmZjBlOGQzZTc1NDc3MDYxNWUxMjc1
ZjJhMDA0M2I5ZDk3YTAwZWQ1Y2M5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3NWYwZDJiMTk2
YmZkYzc0MGFhYjlmMDJiYjQ4Y2I3YTk3ZTRkZmVhMDExYTdiNDY4ZWQ1NjQ4ZDAwMTllNTQiCi0t
IAoyLjM3LjMKCg==

--===============9007427671409022741==--

