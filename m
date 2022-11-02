Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592D2C64E77
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.880.1667349634889530602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SE5337jt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85c61-e0089c97-6745-4e8b-bdfa-1eb52bb88141-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JqF2Ncu+TFuyRDaIHZci1VL4OEDBbTC6sJCs8f41Rx0=;
	b=SE5337jtIyORUjrZBWDz4Q3quQqjzzDSMQtaKgv284SKhqyzjoswOdXdaVh5GhTy
	8shNvr1i9/Y9WR04jZSDMQa/T80ZxicXWpJxy0em6Ffifm4CZVHPVWRSwtlNbNf9py4
	HyPO29u1jutMS1EVUKiXlAaedzE+c7NcBgV7XjqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JqF2Ncu+TFuyRDaIHZci1VL4OEDBbTC6sJCs8f41Rx0=;
	b=NwhDnNLytqgXWOaUVQKcy5m7XS8TfgeRMQyExJ+ph78ixZo1+oBnrL4dqa7zwzS2
	fNej0biNuJ/8Tz/nfiPbK3iJaqiSeMbGAVGgk1GvYExkfN8B8meFoMIGIvn0DI5WTNQ
	4rn4yxYzjVFnrK+dgQ2GRETCj2euA9LfUohUL7DE=
Content-Type: multipart/mixed; boundary="===============8437740926595852490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.96.4 SUCCEEDED
Message-ID: <0101018435c85c61-e0089c97-6745-4e8b-bdfa-1eb52bb88141-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172452

--===============8437740926595852490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.96.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.96.3-4.96.4.patch
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
--===============8437740926595852490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lsof: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-dbg: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-dbg: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-dev: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-dev: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-doc: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-doc: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-doc: PKGSIZE changed from 123981 to 124103 (+0%)
packages/core2-32-poky-linux/lsof/lsof-locale: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-locale: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-src: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-src: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof-staticdev: PV changed from "4.96.3" to "4.96.4"
packages/core2-32-poky-linux/lsof/lsof: PKGV changed from 4.96.3 [default] to 4.96.4 [default]
packages/core2-32-poky-linux/lsof/lsof: PV changed from "4.96.3" to "4.96.4"

--===============8437740926595852490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.96.3-4.96.4.patch"

RnJvbSBjNWJhYWJiYjJiZTc2OWRmMjUxNDQ4MDIwZmMwMWRlNDdmZGE4ZjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMjo0ODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45Ni4zIC0+IDQuOTYuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi97bHNvZl80Ljk2LjMuYmIgPT4gbHNvZl80Ljk2LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xzb2Yve2xzb2ZfNC45Ni4zLmJiID0+IGxzb2ZfNC45Ni40LmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45Ni4zLmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjQuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45Ni40LmJiCmlu
ZGV4IGMzMmZjZDU1ODMuLmJkZDg4M2QwY2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2xzb2ZfNC45Ni4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2xzb2ZfNC45Ni40LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly8wMFJFQURNRTtiZWdpbmxpbmU9NjQ1O2VuZGxpbmU9Njc5O21kNT05NjRkZjI3NWQyNjQyOQog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbHNvZi1vcmcvbHNvZjticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1ob3N0LWluZm9ybWF0
aW9uLnBhdGNoIgotU1JDUkVWID0gImVlYzEwZmFjOGY1NzU0NGUyNmZmMDBiZjQxYTJkYzA5YzU2
MDQ5YmYiCitTUkNSRVYgPSAiNjY5YzMzYTI1M2U0MTRmZWI2MGZiYmNmMjk4NGMyNWRjNDEzY2Q3
NSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zMS4xCgo=

--===============8437740926595852490==--

