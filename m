Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1141C7113C
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.145435.1671136351362708133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hmot8C9V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185177d14e2-f4dd1f17-531d-4b65-b127-3b9305968ac4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/VFdX61mEQZYkkjUDKpvAGA+zgfzFmaZSv5C/gN3zOY=;
	b=hmot8C9Vf6fkFCl0yugoRN81zU5QqW1dAy263jClhAD/GAZwgxJ6NapO05v6bveY
	tUDTHbx+ivfGZdgOjjegXaXU/5apDE6aQsVLYm989tgkJBCBtTGAiB9c7tV12HloMJy
	YvcezdVzY3uwkcuoTLolafwyesYww/y5yxvqGvdA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/VFdX61mEQZYkkjUDKpvAGA+zgfzFmaZSv5C/gN3zOY=;
	b=fEyym7E/927wwA8M0XIAkTOZf+UxxliZaZ954Vt0FV2Iffg5idstfdGQJQtNbhKF
	IhMG94L0gjfQx7aV2s+8rdMf9ZmE/9ZOVTbPfO0h9KJBe1wIwgL+u/eM0CVipCP9+tA
	QaAleYIguZyvHXP2XKJWfFsW45MllpAcEE92P9bE=
Content-Type: multipart/mixed; boundary="===============3748280552285398656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.23.0 SUCCEEDED
Message-ID: <01010185177d14e2-f4dd1f17-531d-4b65-b127-3b9305968ac4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174649

--===============3748280552285398656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch
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
--===============3748280552285398656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch"

RnJvbSAxYTZlYzkzZjBiMjBlM2IzMWUyN2U0MWVkNWNmYjM4NGZhYzAyN2YzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6Mzc6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y2Fpcm86IHVwZ3JhZGUgMS4yMS4wIC0+IDEuMjMuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHljYWlyb18xLjIxLjAuYmIgPT4gcHl0aG9uMy1weWNhaXJvXzEuMjMuMC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y2Fpcm9fMS4yMS4wLmJi
ID0+IHB5dGhvbjMtcHljYWlyb18xLjIzLjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yMS4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yMy4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNhaXJvXzEuMjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yMy4wLmJiCmluZGV4IGI2OTIwNjc4MDkuLjUyMTRhMDVk
NTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNh
aXJvXzEuMjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljYWlyb18xLjIzLjAuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICJjYWlybyBweXRo
b24zIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L3B5Y2Fp
cm8tJHtQVn0udGFyLmd6IgogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9w
eWdvYmplY3QvcHljYWlyby9yZWxlYXNlcy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNTE5
MDdmMThhNTUyZGY5MzhhYTMzODY2NTdmZjRiNWE0OTM3ZGRlNzBlMTFhYTA0MmJjMjk3OTU3ZjRi
NzRiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjliNjFhYzgxODcyM2FkYzA0MzY3MzAxMzE3ZWIy
ZTgxNGE4MzUyMmYwN2JiZDFmNDA5YWYwZGFkYTQ2M2M0NGMiCiAKIFMgPSAiJHtXT1JLRElSfS9w
eWNhaXJvLSR7UFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============3748280552285398656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.21.0/pycairo-1.21.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.23.0/pycairo-1.23.0.tar.gz"
packages/core2-32-poky-linux/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 392132 to 392140 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 358648 to 360684 (+1%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 419917 to 423497 (+1%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============3748280552285398656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============3748280552285398656==--

