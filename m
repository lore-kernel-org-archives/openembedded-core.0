Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC714C71132
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145440.1671136351924816749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RUIG4DuN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1254-1078f068-ca65-4560-8a14-458071f04382-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wqpRsIZNg0UDqBuhYSnfdGy5eJiPtvjiWMiSHcvvpnU=;
	b=RUIG4DuNWoP05icl42dDf5b2A7igyMb8A0TtZ1uEqMW8MmCN91HiudsGSBdV4rT4
	Q2prlq1HyjPgYshtSZ+krmHqLrdXoPaBvvefo7YuglkOR62qRjhQA+JLiXyuAFIzWi4
	XHJsZLUhVh2igcFpTEYsQoZfNc/cknMM8HMcya4E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wqpRsIZNg0UDqBuhYSnfdGy5eJiPtvjiWMiSHcvvpnU=;
	b=Jc95MTnyFAaGrd1DERELqLaz8g7JFaD/nJJYrNHSi/zwWePV0RTX/4vQIxS21zPY
	ayrEgGR2zqlIMk5uloFFuDuGgbY/47M8zZH51WyD0tyg59LAb8pr98TH+ezMzaU0UNw
	KqVvu6JKczlgJsJ1iH04SeoFRpdkJ3DU700I+BD4=
Content-Type: multipart/mixed; boundary="===============1633345020206396544=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-vcs: upgrading to 0.3.0 SUCCEEDED
Message-ID: <01010185177d1254-1078f068-ca65-4560-8a14-458071f04382-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174653

--===============1633345020206396544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-vcs* to *0.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-vcs-upgrade-0.2.0-0.3.0.patch
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
--===============1633345020206396544==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-vcs-upgrade-0.2.0-0.3.0.patch"

RnJvbSAwNTQ0OGY1YmFmZWUxZjk5MGI2YTNmMDdlNjI5ZjY1ODkzZDE4MDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTA6NTM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNoLXZjczogdXBncmFkZSAwLjIuMCAtPiAwLjMuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2gtdmNzXzAuMi4wLmJiID0+IHB5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNoLXZjc18wLjIuMC5i
YiA9PiBweXRob24zLWhhdGNoLXZjc18wLjMuMC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuMi4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLXZjc18wLjMuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2gtdmNzXzAuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJiCmluZGV4IGNjYTJjNDlkMmIuLmI0
ZGIxMGU3NjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oYXRjaC12Y3NfMC4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWhhdGNoLXZjc18wLjMuMC5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9oYXRjaGxpbmcKIAogUFlQSV9QQUNLQUdFID0gImhhdGNoX3ZjcyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjk5MTNkNzMzYjM0ZWVjOWJiMDM0NWQwNjI2Y2EzMjE2NWE0YWQyZGUxNWQx
Y2U2NDNjMzZkMDljYTkwOGFiZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2VjNTEwN2NmY2U0
ODJjNjdmOGJjOTZmMThiYmMzMjBjOWFhMGQwNjgxODBlMTRhZDMxN2JiZWU1YTE1M2ZlZSIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjM3LjMKCg==

--===============1633345020206396544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatch-vcs: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.3.0.tar.gz"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info, directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info/licenses, added "/usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 19319 to 27715 (+43%)
Changes to packages/core2-32-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info
  /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py was added

--===============1633345020206396544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info, added "/usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 19319 to 27715 (+43%)
Changes to packages/core2-32-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info
  /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py was added

--===============1633345020206396544==--

