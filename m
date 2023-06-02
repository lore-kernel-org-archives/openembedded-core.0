Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE16CA9EA2
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7529.1685693432018974057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b78D8MGi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b288a88-c09803b1-73cd-4876-b8f2-dcf2cc06c462-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0CZmykwEMeIXHYr9Mcwb9mvkEsW21inWxOiRx0mkaY4=;
	b=b78D8MGi1uu6rKnIxat3FONcFjSn9z/SX8MyEdPCLk5FMpGvWHJOoJl2Y6f6AZyr
	1tbXGYhyb1Ua8uEwo5MPBI6qYdzDdC3V7v3ATUUmbCn3mUT4CTxx0c35Yxv1XJ1Rbpc
	A3KevuIf8vvfr2MPW1IYCoiKp0ZPcPKi4QassD6Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0CZmykwEMeIXHYr9Mcwb9mvkEsW21inWxOiRx0mkaY4=;
	b=B0KEqMtBmJ9B2/4idNHUk4VSJlRxFxaaPXwvJhxW8FddzfqjX4nCntR0Iv/yka9c
	PFH/kA4qNe5Dg4jcehHaWGvYiRQtYOhWe4StKcmGhI2ip3LqrTGBrBzGxQh7ynEE9Bl
	1Ue0f5LWStSlnSIwnqnLH5jHVCMh2KofZdy2aZBY=
Content-Type: multipart/mixed; boundary="===============3043709674546774837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to cf4ec7f35521eb54d72ce0c92ce65b2249171cbd
 SUCCEEDED
Message-ID: <010101887b288a88-c09803b1-73cd-4876-b8f2-dcf2cc06c462-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182233

--===============3043709674546774837==
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
--===============3043709674546774837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA2YmJhOTI5Mjk5YWMwNmU1OWFkZWNiOGFiYTRlMmVhZjhlM2Q3MGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMzo0Nzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCA2N2FjOTdiOTYzLi5jYTc2MjUxZDdhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2tt
c2N1YmUuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3Mzgx
MjcwZGQ2MzFmYiIKIAotU1JDUkVWID0gIjM0NTExMTQ4MWQ2NTRiMzhhNzJiNWMzNjI5MTUxZGM3
NGY3YTgyYmMiCitTUkNSRVYgPSAiY2Y0ZWM3ZjM1NTIxZWI1NGQ3MmNlMGM5MmNlNjViMjI0OTE3
MWNiZCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1
YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMg
PSAiMSIKIAotLSAKMi4zOS4yCgo=

--===============3043709674546774837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4577539 to 4577537 (-0%)

--===============3043709674546774837==--

