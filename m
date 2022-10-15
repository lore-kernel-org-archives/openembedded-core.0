Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD793C64EC9
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.24560.1665871393671369955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ys9CqReG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac30e0-96bef455-d24d-4e70-86af-40bf4f0d8656-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9tEikZPeCawvw9VANrZ/UqGHurdcAooa00yeWJVNe88=;
	b=Ys9CqReGAZxLGgrQQujstZSRiJWM8zMBW0pAIcNCbVX9SRzD+VXk88SHrtt6BYSp
	KFxiewHGbzDEqlb1BNVcoXOVfv4I0TlZoPCr8S7+RFD6pwsAbDYs+IgIqVKYy2HA+BM
	2V4mh/ypone5PUHKH5W2KALsIedc/hMUioZjRHgY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9tEikZPeCawvw9VANrZ/UqGHurdcAooa00yeWJVNe88=;
	b=GSUb6UmCh+nCSkUlG3VOkhkdPjs4ouSAHhL6CKlPoZlIFvfXdXh5csI4cDfN/fnq
	iBa00LBIWhAa48hZ7Pte2gifsD+kuNr++hfarcCigXDrHb7bQA0knsiwPwMHjarKTfM
	dROjIwwJqatQsN8rXy00ksHQyEC9Vkr1EMowX2oE=
Content-Type: multipart/mixed; boundary="===============8072190090340898152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458 SUCCEEDED
Message-ID: <01010183ddac30e0-96bef455-d24d-4e70-86af-40bf4f0d8656-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171766

--===============8072190090340898152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *dfc3b6ecda84d21418fb4408b39c5c71db4c6458* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============8072190090340898152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda

--===============8072190090340898152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAxMGI3ZjU2ZGNhMjhjYWJlYTAwYzA5YjlmMTM4NDk5YzA5N2RmOWMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6MTg6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAwYmI5NGFiOTNhLi5kNjg1NDZmMDE1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJkN2IzNDNmZDI2Mjg4MDk5NGYwNDFj
ZTIzMzU0NDJlN2JkMTA3MWY1IgorU1JDUkVWID0gImRmYzNiNmVjZGE4NGQyMTQxOGZiNDQwOGIz
OWM1YzcxZGI0YzY0NTgiCiAKIFBWID0gIjAuMStnaXQke1NSQ1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============8072190090340898152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+d7b343fd26 [default] to 0.1+gitAUTOINC+dfc3b6ecda [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 229664 to 229088 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 210197 to 210191 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+dfc3b6ecda
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+dfc3b6ecda"

--===============8072190090340898152==--

