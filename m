Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08796C87FDE
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3766.1684186747757284046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Aql9Cl3U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a608a-c8215340-5114-4feb-a167-ac1568c4f913-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5SlQAgLUJbSkyR453LRpErxt/ZOWeWZZ3SXlq55tpTE=;
	b=Aql9Cl3UobxzqCOrHAK0ADnBumr6iYtezzPFoXiPsSFgY5syB6RYLuuy7eQXiUYG
	+F8hi38BfzCNKhkPyMbWoKHzInidNA3J+i0hfb+MD5VBd6MwPe/4S4AYv74HiLm92+b
	/KyTQTIva/HGxcHoL595YaJ0V3Au0yh/D0hquMIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5SlQAgLUJbSkyR453LRpErxt/ZOWeWZZ3SXlq55tpTE=;
	b=r5OTbYEOk5nYg2UeLZBimvYXddZuA+rVmhyen6j2CA+CPO14w6fJE8GZityjj000
	695CXQ0/TcDYLxUq4yLylNxz6Q0zBLl8v/9bjx4q+zgYLVxjS+Ga05TG4h7ryNRaWTS
	OLJ6HmxqycACd6b4tCgjZ7z89TNe8B4P2POdoDac=
Content-Type: multipart/mixed; boundary="===============0043911885966023315=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.9 SUCCEEDED
Message-ID: <01010188215a608a-c8215340-5114-4feb-a167-ac1568c4f913-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181373

--===============0043911885966023315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.8-1.2.9.patch
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
--===============0043911885966023315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-conf: PKGSIZE changed from 155390 to 150084 (-3%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 2976616 to 2982620 (+0%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 441475 to 440459 (-0%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3395611 to 3404527 (+0%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.8.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.9.tar.bz2"
packages/core2-32-poky-linux/alsa-lib: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/libatopology: PV changed from "1.2.8" to "1.2.9"
packages/core2-32-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/core2-32-poky-linux/alsa-lib/libatopology: PKGSIZE changed from 129381 to 133477 (+3%)

--===============0043911885966023315==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.8-1.2.9.patch"

RnJvbSBkMDNhY2UxNmI5YTM4NGU1N2Y3MmMzMDAwNDI2MGI3ZDk3ZjZhMDE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6MDg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLWxpYjogdXBncmFkZSAxLjIuOCAtPiAxLjIuOQoKLS0tCiAuLi4vYWxzYS97YWxzYS1saWJf
MS4yLjguYmIgPT4gYWxzYS1saWJfMS4yLjkuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLWxpYl8xLjIuOC5iYiA9PiBhbHNhLWxpYl8xLjIu
OS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fs
c2EtbGliXzEuMi44LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8x
LjIuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi45LmJiCmluZGV4IGJmOTY4YzkyMGIuLmE4YmYwOTkw
NGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4y
LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuOS5i
YgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1hOTE2NDY3YjkxMDc2ZTYzMWRkOGVkYjc0MjQ3NjljNyBcCiAgICAgICAgICAgICAgICAgICAg
ICIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9s
aWIvJHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYWIwMWI3NGUzMzQyNWNh
OTljMmUzNmMwODQ0ZmQ2ODg4MjczMTkzYmQ4OTgyNDBmZThmOTNhY2NiY2JmMzQ3IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImRjOWM2NDNmZGM0Y2NmZDA1NzJjYzY4NTg1OGRkNDFlMDhhZmI1ODNm
MzA0NjBiMzE3ZTQxODgyNzVmNjE1YjIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwog
Ci0tIAoyLjM5LjIKCg==

--===============0043911885966023315==--

