Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471CBC4167B
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.867.1667349636197359638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g2Bs88+d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c86224-1682dbae-e8b0-4d0c-be81-9538f284d03e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3fHnKGS6XxRtJm8TdkP98BiDJw31kKcNMDBHtNwY20U=;
	b=g2Bs88+dM5gDBnK1WTYlfZ3F3CXfxWbxbg4WQts7SedSfjZu49d2FuF+o+AcJpU2
	TMketNWvYXRoXpYnvxsFQSwObRJFEArdhI3AmFZVIFiCOyDqKFthkAC5wg/H/zbyHZq
	dh/qdbHVN3ml4ufiWofXFzv/zkO5mWVIEColpYE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3fHnKGS6XxRtJm8TdkP98BiDJw31kKcNMDBHtNwY20U=;
	b=k+/EqT/Gbxxz8HzGAV6tTK0tqPxJ7cdf0r6q11LPt12VkUDij8gMY0KK4bzTsBJ3
	emmlXcJZ6+v2vm7XMzG3/m7sQyeqG+BeNJZdtPYlxoF18+kWXC6MpvI7ZHvcXOGy/CV
	UJmKSfd9u3wkBUmVywTAfc9UEPM4nF9Pe90+d6V8=
Content-Type: multipart/mixed; boundary="===============7244530735955969737=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedepend: upgrading to 1.0.7 SUCCEEDED
Message-ID: <0101018435c86224-1682dbae-e8b0-4d0c-be81-9538f284d03e-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172503

--===============7244530735955969737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *makedepend* to *1.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedepend-upgrade-1.0.6-1.0.7.patch
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
--===============7244530735955969737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/makedepend: SRC_URI changed from "https://www.x.org/releases//individual/util/makedepend-1.0.6.tar.gz" to "https://www.x.org/releases//individual/util/makedepend-1.0.7.tar.gz"
packages/core2-32-poky-linux/makedepend: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PKGSIZE changed from 78208 to 79700 (+2%)
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-dbg: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-dev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-dev: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-doc: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-doc: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-locale: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-locale: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-src: PKGSIZE changed from 80217 to 80994 (+1%)
packages/core2-32-poky-linux/makedepend/makedepend-src: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-src: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend-staticdev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend-staticdev: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/makedepend/makedepend: PKGSIZE changed from 38352 to 42448 (+11%)
packages/core2-32-poky-linux/makedepend/makedepend: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/makedepend/makedepend: PV changed from "1.0.6" to "1.0.7"

--===============7244530735955969737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/makedepend/makedepend: PKGSIZE changed from 38352 to 42448 (+11%)

--===============7244530735955969737==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedepend-upgrade-1.0.6-1.0.7.patch"

RnJvbSA5NmI3OTg3MTE1M2ZiNmFlYzZmOWY5MDRjNTI0MmY2MjViMTA5YzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNzozNzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
a2VkZXBlbmQ6IHVwZ3JhZGUgMS4wLjYgLT4gMS4wLjcKCi0tLQogLi4uL3hvcmctdXRpbC97bWFr
ZWRlcGVuZF8xLjAuNi5iYiA9PiBtYWtlZGVwZW5kXzEuMC43LmJifSAgICAgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXV0aWwve21ha2VkZXBlbmRfMS4wLjYuYmIgPT4gbWFrZWRl
cGVuZF8xLjAuNy5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy11dGlsL21ha2VkZXBlbmRfMS4wLjcuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC42LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjcu
YmIKaW5kZXggMjc2MGVkZDE3My4uMTJkZWEwMTJkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC42LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXV0aWwvbWFrZWRlcGVuZF8xLjAuNy5iYgpAQCAtMTcsNSArMTcsNCBA
QCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9NDNhNmVkYTM0YjQ4ZWU4MjFiM2I2NmY0Zjc1M2NlNGYiCiAKLVNSQ19VUklb
bWQ1c3VtXSA9ICI4YTU4MzA1NWM4NDkxNDA2MGMzNWI2YzJmOTYzZmMwNyIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI4NDVmNjcwOGZjODUwYmY1M2Y1YjFkMGZiNDM1MmM0ZmVhYjM5NDlmMTQwYjI2
ZjcxYjIyZmFiYTM1NGMzMzY1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE3YzFhZGYwMjg0YWFl
ZTQ3M2FiZmZmMGU4ZDNlNzU0NzcwNjE1ZTEyNzVmMmEwMDQzYjlkOTdhMDBlZDVjYzkiCi0tIAoy
LjMxLjEKCg==

--===============7244530735955969737==--

