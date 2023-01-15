Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039A9C67871
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.145842.1673805745284686271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UNi247vG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185b698c9d9-288c7244-d195-4814-b81b-0ce83a0d3b46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gIE0afWmcjEL0wlPW4gk1ljVOFJF4E0yNauBreVBbtw=;
	b=UNi247vGP40RBPe3hoXkDTp4+PoXtGEATQ4fQfdXKOX9aAcrH8c4WkJw5k/tf+ci
	EHCxEiwyuP8DF85qHNwZBg5kBMAP2Gn4UtAbxCl3pg8vyJWvy9A7eqk2NW0eapeBese
	Sy7FrFlf6WECo3sMn1p/FeMTFu2aUWuCq73Km+ls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gIE0afWmcjEL0wlPW4gk1ljVOFJF4E0yNauBreVBbtw=;
	b=a65BClaZinpXRa2/GrpOAr3yPOv8DgY03xp1t9CE0cPlQL+3l8BTQsoY6nkUoHPw
	MSgyO7FLKpwS2hX0bAzlo9N/3gMmoSyJlZnpMZoOnDWMo6hdMdMhkCvLWzxHTj4OX0N
	WLm3s0nkSEQoIJdKDnI76VaHedaOJhBTd3Yzgk3w=
Content-Type: multipart/mixed; boundary="===============6151450382494381334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 232 SUCCEEDED
Message-ID: <01010185b698c9d9-288c7244-d195-4814-b81b-0ce83a0d3b46-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175942

--===============6151450382494381334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *232* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-230-232.patch
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
--===============6151450382494381334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1388149 to 1389544 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "230" to "232"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 230 [default] to 232 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-230.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-232.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "230" to "232"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-230.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-232.dist-info

--===============6151450382494381334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-230-232.patch"

RnJvbSA2NTA4MDgxZjU1ZDViY2U4OTI5NzY5MmVlODNkMzUwOWU4NzA3NzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTg6MDA6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIzMCAtPiAyMzIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjMwLmJiID0+IGRpZmZvc2NvcGVfMjMyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMzAuYmIgPT4gZGlmZm9zY29wZV8y
MzIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMzIuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzMi5iYgppbmRleCA0OTZlZDll
NjAyLi5lMDdjZTlkYTc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjMwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTM1OTA4YzE1YmIwMDYwNThmNzRjMmQ0ZjJiZTNiMWFjN2NmNjJjODcyY2ZiZDI5NTAx
MTRhOGE3MDVkODEwOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZmQxMGI0NjVkMzU2NmU2ZjY1
YmRjMDBiNmE4MTRmZjEyOTkwMGEyZjRmOWY0YmFlOTIyMDY5NDY3MjE0MDgyIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzcuMwoK

--===============6151450382494381334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-230.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-232.dist-info

--===============6151450382494381334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6151450382494381334==--

