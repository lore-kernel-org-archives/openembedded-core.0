Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4B4C7115D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.144495.1671136351044977237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eOSNCseT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185177d107d-e25ff268-b933-45fa-b0f5-c4afafd94377-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6asKqSyoZuQp4heFH4YJCxMb9yHg31bSeI+X2Lcpw+w=;
	b=eOSNCseTmVWP6GPvJ8DEL5N+gvPq18TR21hJadxvwNtKCIuNwC4aaE9W+nz7ybTu
	DVGzKEfjC4jBT6hsPDEAnFGNgOFHiu/jUFGFEw+z3OzDjQkq5H8TrvJDd8IDFPqPqs0
	48tkYvIlHNYT1dXaBfbBNZEekmgUwbDDidpOWaZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6asKqSyoZuQp4heFH4YJCxMb9yHg31bSeI+X2Lcpw+w=;
	b=j/+9ObdmpXeIC/uzTZgHo5pJQl3FLtZIT2RVPfyw5L99yK5AuXFfNSIVtAgTAaMx
	c9nQjHvyzTrccPGO9OQr7bdQ8fJA9mP0SrqTWWpaqYtPUik2hb/loFqOjf+/VLcbOly
	reJVMudIhHOCnQ7RfhxHgk47DEl0LcvRuZXu+kuc=
Content-Type: multipart/mixed; boundary="===============6916314299445235322=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.15.1 SUCCEEDED
Message-ID: <01010185177d107d-e25ff268-b933-45fa-b0f5-c4afafd94377-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174632

--===============6916314299445235322==
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
--===============6916314299445235322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librepo: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 625916 to 645996 (+3%)
packages/core2-32-poky-linux/librepo/librepo-dbg: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-dev: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dev: PKGSIZE changed from 124414 to 129119 (+4%)
packages/core2-32-poky-linux/librepo/librepo-dev: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-doc: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-doc: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-locale: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-locale: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-src: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-src: PKGSIZE changed from 705968 to 721690 (+2%)
packages/core2-32-poky-linux/librepo/librepo-src: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo-staticdev: PV changed from "1.14.5" to "1.15.1"
packages/core2-32-poky-linux/librepo/librepo: PKGV changed from 1.14.5 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/librepo/librepo: PKGSIZE changed from 310496 to 322784 (+4%)
packages/core2-32-poky-linux/librepo/librepo: PV changed from "1.14.5" to "1.15.1"

--===============6916314299445235322==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.14.5-1.15.1.patch"

RnJvbSAxNTllYmY5YmYyMGVlOWQwYTNhOWYyMTFiMDM0M2Q2NWQyZGYyZjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6MzI6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyZXBvOiB1cGdyYWRlIDEuMTQuNSAtPiAxLjE1LjEKCi0tLQogLi4uL2xpYnJlcG8ve2xpYnJl
cG9fMS4xNC41LmJiID0+IGxpYnJlcG9fMS4xNS4xLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8ve2xpYnJlcG9fMS4xNC41LmJiID0+IGxpYnJlcG9fMS4x
NS4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBv
L2xpYnJlcG9fMS4xNC41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVw
b18xLjE1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjE0LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4xNS4xLmJiCmluZGV4IDQ2Y2ZjZTUzZmYuLjJj
OGQ2ZmM3MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJl
cG9fMS4xNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9f
MS4xNS4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9y
cG0tc29mdHdhcmUtbWFuYWdlbWVudC9saWJyZXBvLmdpdDticmFuY2g9bWFzdGVyO3ByCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA0LVNldC1ncGdtZS12YXJpYWJsZXMtd2l0aC1wa2ctY29uZmlnLW5v
dC13aXRoLWNtYWtlLW0ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJmNGI5MTVi
ZTVlMDRlODgyNjMwOTdmNjVhZGRmY2FjNTkxOWZlZjQxIgorU1JDUkVWID0gIjVmNGRlNGE0ZTg1
ODQ1ZDQxODRmYmQzMGMwM2ZmOGE4ZWM3ZGY0YWYiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAK
LS0gCjIuMzcuMwoK

--===============6916314299445235322==--

