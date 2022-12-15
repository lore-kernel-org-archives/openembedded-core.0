Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9D2C677F0
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.144507.1671136352060885879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Kt0Z7iix;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010185177d17f2-adf03d29-0ed3-42fd-9bce-c70fc4090d04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qQDBPneJdDXraxS148jIZJuWzbUV9S2YW/0sSP0ke3g=;
	b=Kt0Z7iixUzR0qkFeTKf2dkpLyVLp2QWXU5cS2MlVxfWn93BsZpqahSrpN1AOJgph
	Plfda3M2USbiIR0lyyiNHf/FmZ+FDwcl1Dekj/LRmyDbC0G6MiRVazDg313E+jubw5h
	VglKdxxXTkYSv8en+arC1J9XlzH8BqnQsNVHx/Lk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qQDBPneJdDXraxS148jIZJuWzbUV9S2YW/0sSP0ke3g=;
	b=NVn/Bk7kMGKtqYbg3Av18NF4JAQilxuuoocnlNTMOKwnsGhcLP7Wa9WS+4Tv54st
	t/qMFCw+KLCswe1u6rBlF3LirxyTzhLcdnPI3ZIGSXbI86zsv4qQq2ZN7IWfwqgDKNU
	7ZyE+grxgusOxO4O5JA0KkD4GKvRH1xBiQE2zUUY=
Content-Type: multipart/mixed; boundary="===============4432834974091360850=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] logrotate: upgrading to 3.21.0 SUCCEEDED
Message-ID: <01010185177d17f2-adf03d29-0ed3-42fd-9bce-c70fc4090d04-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174666

--===============4432834974091360850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *logrotate* to *3.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-logrotate-upgrade-3.20.1-3.21.0.patch
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
--===============4432834974091360850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/logrotate: SRC_URI changed from "https://github.com/logrotate/logrotate/releases//download/3.20.1/logrotate-3.20.1.tar.xz" to "https://github.com/logrotate/logrotate/releases//download/3.21.0/logrotate-3.21.0.tar.xz"
packages/core2-32-poky-linux/logrotate: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGSIZE changed from 148940 to 150036 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-dev: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-dev: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGSIZE changed from 28425 to 28716 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-doc: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-locale: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-locale: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGSIZE changed from 188300 to 189968 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-src: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PV changed from "3.20.1" to "3.21.0"
packages/core2-32-poky-linux/logrotate/logrotate: PKGV changed from 3.20.1 [default] to 3.21.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate: PV changed from "3.20.1" to "3.21.0"

--===============4432834974091360850==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-logrotate-upgrade-3.20.1-3.21.0.patch"

RnJvbSA5YzVhNjcxYWJlYjJmNzQ2YzQyYmQyZmI5ZDQ1YzM4YTU1NzMzN2Y0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTM6MDc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
b2dyb3RhdGU6IHVwZ3JhZGUgMy4yMC4xIC0+IDMuMjEuMAoKLS0tCiAuLi4vbG9ncm90YXRlL3ts
b2dyb3RhdGVfMy4yMC4xLmJiID0+IGxvZ3JvdGF0ZV8zLjIxLjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbG9ncm90YXRlL3tsb2dyb3RhdGVfMy4yMC4xLmJiID0+IGxvZ3Jv
dGF0ZV8zLjIxLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xv
Z3JvdGF0ZS9sb2dyb3RhdGVfMy4yMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjAuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xvZ3JvdGF0ZS9sb2dyb3RhdGVfMy4yMS4w
LmJiCmluZGV4IDAzNGMzN2I0MjkuLjRlNGVhMTA2MjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjAuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbG9ncm90YXRlL2xvZ3JvdGF0ZV8zLjIxLjAuYmIKQEAgLTEyLDcgKzEyLDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkLyR7UFZ9LyR7QlB9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0MmY2ZDZl
MThlY2VmZmE0OWE0YmFjZDkzMzY4NmQzZTQyOTMxY2ZjY2ZiNjk0ZDdmNjM2OWI3MDRlNWQwOTQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGZhMTIwMTVlM2I4NDE1YzEyMWZjOWMwY2E1M2FhODcy
ZjdiMDcwMmY1NDNhZmRhN2UzMmI2YzQ5MDBmNjUxNiIKIAogIyBUaGVzZSBDVkVzIGFyZSBkZWJp
YW4sIGdlbnRvbyBvciBTVVNFIHNwZWNpZmljIG9uIHRoZSB3YXkgbG9ncm90YXRlIHdhcyBpbnN0
YWxsZWQvdXNlZAogQ1ZFX0NIRUNLX0lHTk9SRSArPSAiQ1ZFLTIwMTEtMTU0OCBDVkUtMjAxMS0x
NTQ5IENWRS0yMDExLTE1NTAiCi0tIAoyLjM3LjMKCg==

--===============4432834974091360850==--

