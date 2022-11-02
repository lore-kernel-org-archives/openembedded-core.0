Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B44C64EC4
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.871.1667349631673906006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NTGY6s6Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c857a5-39f715e0-5c93-4378-953b-d76e86996de4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s8mKDViWTcGZzV55nmhXscn92shKZRnPwe/B3I1f4v8=;
	b=NTGY6s6ZGmOQkZ+vbMo7dOax2XsCX69Vy9tMaPX3LX1IYsUiEs00Fm8HL2XGebUZ
	JBZ3SJn2efzdj2J0BGza3w85dCKUTmHtbBJNsRpaX+7iWO1qQfYmOcFQ9ZJ0cz+cP4q
	+HmpgN4pqrTht22o2lqLq7iSh/uVuHWim3DPAjQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s8mKDViWTcGZzV55nmhXscn92shKZRnPwe/B3I1f4v8=;
	b=Fvxztcd9HX3lWBZVyoVsebvH4TVkmhsPyaIeBwmQ1IBtdvkh/aGPDXQyyr0eSHIc
	5TBlc5Mixwumo3CMn0aV+i3S9nz2bbntaRbV5oUbMIFogojE7LQEtRwcG3BBt6s/zMD
	8f7BpoieIzJY3fP2okBerHc0SMUHZnc/5GIp2fog=
Content-Type: multipart/mixed; boundary="===============3799708281286000490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.3 SUCCEEDED
Message-ID: <0101018435c857a5-39f715e0-5c93-4378-953b-d76e86996de4-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172427

--===============3799708281286000490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.2-1.2.3.patch
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
--===============3799708281286000490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.3.tar.gz"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 665075 to 665085 (+0%)
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info

--===============3799708281286000490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info

--===============3799708281286000490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.2-1.2.3.patch"

RnJvbSBiMzc3OTEwODNiNWJkNGU0NTE1YTg5YmUyZjYzNTJhNmRiMTRmYmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDowNTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjIuMiAtPiAxLjIuMwoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLW1ha29fMS4yLjIuYmIgPT4gcHl0aG9uMy1tYWtvXzEuMi4zLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4yLjIuYmIgPT4gcHl0aG9u
My1tYWtvXzEuMi4zLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1ha29fMS4yLjMuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4yLjIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJi
CmluZGV4IGUzNzc0ZWU2MjEuLjEyYWNmZWU3NzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiCkBAIC04LDcgKzgsNyBAQCBQWVBJ
X1BBQ0tBR0UgPSAiTWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3MjQ4NjliMzYzYmE2MzBhMjcyYTVmODlm
NjhjMDcwMzUyMTM3YjhmZDE3NTc2NTAwMTdiN2UwNmZkYTE2M2YiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2ZkZTk2NDY2ZmNmZWVkYjBlZWQ5NGYxODdmMjBiMjNkODVlNGNiNDE0NDRiZTBlNTQy
ZTJjOGM2NWMzOTZjZCIKIAogUkRFUEVORFM6JHtQTn0gPSAiJHtQWVRIT05fUE59LWh0bWwgXAog
ICAgICAgICAgICAgICAgICAgJHtQWVRIT05fUE59LW1hcmt1cHNhZmUgXAotLSAKMi4zMS4xCgo=

--===============3799708281286000490==--

