Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B361C6FA82
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.12470.1662040787974605602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nzXFcllA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010182f959c945-139beb92-d7d3-492e-8069-4f5a0d4278d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x3qMh3V26lxCuqcRldVHyZ0foLoCGALZNdsHiD+AKB8=;
	b=nzXFcllAKbx9fNekaHBTmJ2fTHHVbd+d7dGCuVzwluYmGrtrp4kFWpiunVaE9vy2
	SHU8cTQBLpnf5jXSiyqn1adhr/Zf+98vtaC8mBC35ep/uFVpAISS0HY8rn8IJCjPF3Q
	jMSUMgIFJBy75fn+lymUGwV9XJ0+rAZCMhkIF7BY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x3qMh3V26lxCuqcRldVHyZ0foLoCGALZNdsHiD+AKB8=;
	b=F55DSqWGQLge5SnbGG6HSsWiWSM6NiQgqfQVCn/6UA4J/CwhvwngDSjkwTvk9n++
	YO/kMUkVqIQ/y36f4R2XpXDdhuEbJU33ngIjdSTUtseNr1v/uyxxm0CwDLasRtCngF2
	cJqX4NMeJkGdIIMgmC78zlb2e5We6ZSQ4M42xRgs=
Content-Type: multipart/mixed; boundary="===============4368068352452056634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.4.1 SUCCEEDED
Message-ID: 
 <01010182f959c945-139beb92-d7d3-492e-8069-4f5a0d4278d5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170211

--===============4368068352452056634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjitterentropy* to *3.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.4.0-3.4.1.patch
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
--===============4368068352452056634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.4.0-3.4.1.patch"

RnJvbSA0MzY0NTk0OThjNmRiZmU1YmJlOTY1MDIzZWI0YzI1ZWU0MGVlM2Y0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzo0MTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmppdHRlcmVudHJvcHk6IHVwZ3JhZGUgMy40LjAgLT4gMy40LjEKCi0tLQogLi4uL3tsaWJqaXR0
ZXJlbnRyb3B5XzMuNC4wLmJiID0+IGxpYmppdHRlcmVudHJvcHlfMy40LjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS97bGliaml0dGVyZW50cm9weV8z
LjQuMC5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNC4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVyZW50cm9weV8z
LjQuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVy
ZW50cm9weV8zLjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlfMy40LjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVy
ZW50cm9weV8zLjQuMS5iYgppbmRleCAxZDI5MWNjMzU3Li4zZmI4YzZiMTQ3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlf
My40LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJq
aXR0ZXJlbnRyb3B5XzMuNC4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0YTg3MTgwOTA4NTQwNjIwY2UzNjRiNWU2OWIzYjAzIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuYnNkO21kNT02NmE1Y2VkYWY2MmM0
YjI2MzcwMjVmMDQ5ZjliODI2ZiBcCiAgICAgICAgICAgICAgICAgICAgICIKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9zbXVlbGxlckREL2ppdHRlcmVudHJvcHktbGlicmFyeS5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIyZTUwMTljZmU2MzAzOGZhYWE0
MDVjZTUzNzE1ZWZmZTRlYTU4MGU0IgorU1JDUkVWID0gIjQ1NDRlMTEzMjAxMzhhYzAyNzk3YWY4
MTc2NmY0NDc2YTcxYmIwOWYiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiAjIHJlbW92ZSBhdCBu
ZXh0IHZlcnNpb24gdXBncmFkZSBvciB3aGVuIG91dHB1dCBjaGFuZ2VzCi0tIAoyLjMxLjEKCg==

--===============4368068352452056634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libjitterentropy: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.4.0", added "/usr/lib/.debug/libjitterentropy.so.3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 48272 to 48364 (+0%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 27915 to 29072 (+4%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 3731 to 4204 (+13%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 107839 to 109257 (+1%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.0", added "/usr/lib/libjitterentropy.so.3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.4.0" to "3.4.1"
Changes to packages/core2-32-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.0 to libjitterentropy.so.3.4.1
  /usr/lib/libjitterentropy.so.3.4.0 moved to /usr/lib/libjitterentropy.so.3.4.1

--===============4368068352452056634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 3731 to 4204 (+13%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.0", added "/usr/lib/libjitterentropy.so.3.4.1"
Changes to packages/core2-32-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.0 to libjitterentropy.so.3.4.1
  /usr/lib/libjitterentropy.so.3.4.0 moved to /usr/lib/libjitterentropy.so.3.4.1

--===============4368068352452056634==--

