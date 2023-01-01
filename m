Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC32C54EBC
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20658.1672605966253083226
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jj5KPcWN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101856f159c4f-5894c4ab-1848-4a8f-9b0a-72680aba72a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U9xpRz/LmA0NjZwkqsca3rExWxogkzFfqzpFeeKJbZg=;
	b=Jj5KPcWNAwzbzJVrwlkZ2AK1cJbANPrERaw4vs2U7XPnvU3RfdkaC+wohjcujJyk
	EXCTgh2vTvF0EybCQO+qkpAwskr7SpMBB+mesBBmnj4ADnxpSSlrZiJj/iZgeTOPLhp
	au/CImGFNsCwRCuC6/UPLnJyaaJO3xuzIbFbrbLw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U9xpRz/LmA0NjZwkqsca3rExWxogkzFfqzpFeeKJbZg=;
	b=HZ3Ujr+YQQoAByRRYg/ARgEoB5HE5lqfDfWW+HncWVrGtR60f/uet/3AKVstOxru
	BHbNWw4quFQ4pzBYXEl3GBorjZSk7wnNbcHHVsOenS2hkg8hKfZ9ysfnRhd47kTk7A/
	esXzMMy6I3diAhn5E702x+Wo2FIfOOZJW6RXaxSo=
Content-Type: multipart/mixed; boundary="===============0725709133379863793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.15.1 SUCCEEDED
Message-ID: <010101856f159c4f-5894c4ab-1848-4a8f-9b0a-72680aba72a5-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175240

--===============0725709133379863793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.14.5-1.15.1.patch
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
--===============0725709133379863793==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.14.5-1.15.1.patch"

RnJvbSAwNzMyOGUyYTg1OThmNmEwY2JjM2Q0YjhlOTRkZTFmNTgxYmE3ZThlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzoyOTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlcG86IHVwZ3JhZGUgMS4xNC41IC0+IDEuMTUuMQoKLS0tCiAuLi4vbGlicmVwby97bGlicmVw
b18xLjE0LjUuYmIgPT4gbGlicmVwb18xLjE1LjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbGlicmVwby97bGlicmVwb18xLjE0LjUuYmIgPT4gbGlicmVwb18xLjE1
LjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8v
bGlicmVwb18xLjE0LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJyZXBv
XzEuMTUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGlicmVwby9saWJyZXBvXzEuMTQuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjE1LjEuYmIKaW5kZXggNDZjZmNlNTNmZi4uMmM4
ZDZmYzcxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVw
b18xLjE0LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18x
LjE1LjEuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Jw
bS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYnJlcG8uZ2l0O2JyYW5jaD1tYXN0ZXI7cHIKICAgICAg
ICAgICAgZmlsZTovLzAwMDQtU2V0LWdwZ21lLXZhcmlhYmxlcy13aXRoLXBrZy1jb25maWctbm90
LXdpdGgtY21ha2UtbS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImY0YjkxNWJl
NWUwNGU4ODI2MzA5N2Y2NWFkZGZjYWM1OTE5ZmVmNDEiCitTUkNSRVYgPSAiNWY0ZGU0YTRlODU4
NDVkNDE4NGZiZDMwYzAzZmY4YThlYzdkZjRhZiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAot
LSAKMi4zNy4zCgo=

--===============0725709133379863793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librepo: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 625916 to 645996 (+3%)
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dbg: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-dev: PKGSIZE changed from 124414 to 129119 (+4%)
packages/core2-32-poky-linux/librepo/librepo-dev: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dev: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-doc: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-doc: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-locale: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-locale: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-src: PKGSIZE changed from 705968 to 721690 (+2%)
packages/core2-32-poky-linux/librepo/librepo-src: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-src: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-staticdev: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo: PKGSIZE changed from 310496 to 322784 (+4%)
packages/core2-32-poky-linux/librepo/librepo: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo: PV changed from "1.14.5" to "1.15.1"

--===============0725709133379863793==--

