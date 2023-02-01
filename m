Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63966C7EE25
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30353.1675272854130532536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NYzrocMq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b1c86-f57c7985-5025-41c9-a9e9-f0e185578e0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DFOZuNqu+fnV6wxDiCBWroy5Tq76PsBLwHpvFa6i834=;
	b=NYzrocMqsT+UIWVlH+z5YsNeF9QDLQIA8nujs+ErkYHZ6/Xx/DlOaLDu1G3w8i+Z
	WicsSuh71Gh3zvA4g5X1ErY2lWQo9uOyn4kZTANewkKGph/gO4K7vtmRb794VI4IHUk
	jbU1Uf56oQbW6hl80J7+GRCEJLfet+329J2xb/RM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DFOZuNqu+fnV6wxDiCBWroy5Tq76PsBLwHpvFa6i834=;
	b=gLUtjzB9H77xtSpvs5B90J/aSHQafnDGWMXMSzonyHIA01rbwK2ZONj+qfpY/Aue
	cCMQzw0Q1pYXSVzZ8Qr0oT4cOJ/IE7C9TD6D7L1T7/dNr4HIX6hH0UQ+oA8++365EHI
	GOgelUJnHj4Oawal7v7JxQIUZVWRhEadjysPOeUk=
Content-Type: multipart/mixed; boundary="===============2455875784899655228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 2.1.2 SUCCEEDED
Message-ID: <010101860e0b1c86-f57c7985-5025-41c9-a9e9-f0e185578e0c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176585

--===============2455875784899655228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markupsafe* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-2.1.1-2.1.2.patch
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
--===============2455875784899655228==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-2.1.1-2.1.2.patch"

RnJvbSBkNDMwNGRmZDA1MjdmZTMyY2ZjNWMxMTgwODM5NmNiZWEzZDdkZTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMTozMDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya3Vwc2FmZTogdXBncmFkZSAyLjEuMSAtPiAyLjEuMgoKLS0tCiAuLi57cHl0aG9u
My1tYXJrdXBzYWZlXzIuMS4xLmJiID0+IHB5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hcmt1cHNhZmVfMi4xLjEu
YmIgPT4gcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMi4xLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMi4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJiCmluZGV4IDA1NDRkZDFi
ODMuLmY0ZjBhZDJkZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFH
RSA9ICJodHRwOi8vZ2l0aHViLmNvbS9taXRzdWhpa28vbWFya3Vwc2FmZSIKIExJQ0VOU0UgPSAi
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PWZmZWZmYTU5YzkwYzljNGEwMzNjNzU3NGY4ZjNmYjc1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiN2Y5MTE5N2NjOWU0OGY5ODlkMTJlNGU2ZmJjNDY0OTVjNDQ2NjM2ZGZjODFiOWNjZjUwYmIw
ZWM3NGI5MWQ0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYmNhYmM4YzJiMjYwMzZkNjJkNGM3
NDYzODFhNmY3Y2Y2MGFhZmNjNjUzMTk4YWQ2NzgzMDY5ODZiMDk0NTBkIgogCiBQWVBJX1BBQ0tB
R0UgPSAiTWFya3VwU2FmZSIKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwotLSAKMi4zNy4zCgo=

--===============2455875784899655228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markupsafe: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-markupsafe: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 7991 to 8090 (+1%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 58809 to 58871 (+0%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "2.1.1" to "2.1.2"
Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.11/site-packages/MarkupSafe-2.1.1.dist-info moved to /usr/lib/python3.11/site-packages/MarkupSafe-2.1.2.dist-info

--===============2455875784899655228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.11/site-packages/MarkupSafe-2.1.1.dist-info moved to /usr/lib/python3.11/site-packages/MarkupSafe-2.1.2.dist-info

--===============2455875784899655228==--

