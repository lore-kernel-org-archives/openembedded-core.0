Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6F1C64EC0
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.859.1667349632543835204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GrPHwjfa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85905-f9bdfb64-1168-4a10-96fa-b38785cf9619-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LDtdV4KxIUxiDuYz6xBqJsSwJ45/z7IexeHPxxsBk84=;
	b=GrPHwjfaPk36BBlmc15uqZdJDl1bTv25tBaKt+0wXxLes+Ygg+34kvEM7lVePx5A
	97+RZDIKOPSw+t6bpePGiAS1vzY56BC5C/Qy6bZYHktm4q5UnpFliJfegMDG/5sdIiK
	rtpFFnze6xvvu/BfjTTSpbakjO07ZA4LI9D12vW0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LDtdV4KxIUxiDuYz6xBqJsSwJ45/z7IexeHPxxsBk84=;
	b=NZQXkf9w0ThEG6BWbzz4ec43eaexThlja8qZSsgRVGIuOdd32GopZ2zB8nKrGVZJ
	IZNWNTklK/KMQffjVffNZ6XdMYrsaT9Zvpq838kXV5ckdTPzuLLqhhuW3/m9aZ9unWq
	zli17cWEWPbG9FjYry/GMq7kel6EF6jdcFfofeD4=
Content-Type: multipart/mixed; boundary="===============0528336971770725268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 5.11.0 SUCCEEDED
Message-ID: <0101018435c85905-f9bdfb64-1168-4a10-96fa-b38785cf9619-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172432

--===============0528336971770725268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pbr* to *5.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-5.10.0-5.11.0.patch
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
--===============0528336971770725268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pbr: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.10.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.11.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "5.10.0" to "5.11.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 695446 to 699422 (+1%)
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGV changed from 5.10.0 [default] to 5.11.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PV changed from "5.10.0" to "5.11.0"
Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.11/site-packages/pbr-5.10.0.dist-info moved to /usr/lib/python3.11/site-packages/pbr-5.11.0.dist-info

--===============0528336971770725268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.11/site-packages/pbr-5.10.0.dist-info moved to /usr/lib/python3.11/site-packages/pbr-5.11.0.dist-info

--===============0528336971770725268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-5.10.0-5.11.0.patch"

RnJvbSAyZmJlNTc4MzQyOWVhZDY1ZWNiNDEwYzI3MTRjMDg1Nzc3NzVhNTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDozOTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGJyOiB1cGdyYWRlIDUuMTAuMCAtPiA1LjExLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wYnJfNS4xMC4wLmJiID0+IHB5dGhvbjMtcGJyXzUuMTEuMC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYnJfNS4xMC4wLmJiID0+IHB5dGhv
bjMtcGJyXzUuMTEuMC5iYn0gKDMzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYnJfNS4xMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNS4xMC4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTEuMC5i
YgppbmRleCAwMjJmODM0OTAxLi4xNjk2N2Y2ZDE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTEuMC5iYgpAQCAtMSw0ICsxLDQgQEAKIGlu
aGVyaXQgc2V0dXB0b29sczMKIHJlcXVpcmUgcHl0aG9uLXBici5pbmMKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNmY2M0ZmY4ZTY5ODI1NmZjMTdlYTNmZjc5NjQ3OGIwNTA4NTI1ODVhYTViYWU3
OWVjZDA1YjJhYjdiMzliOWEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjk3YmM2Njk1YjJhZmYw
MjE0NDEzM2MyZTczOTlkNTg4NTIyM2Q0MmI3OTEyZmZhZWMyY2EzODk4ZTY3M2JmZSIKLS0gCjIu
MzEuMQoK

--===============0528336971770725268==--

