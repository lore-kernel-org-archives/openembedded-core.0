Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E532C6FA9E
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.10525.1663251513460482458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h0rLNyQh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101834184037c-2beb29e3-a75a-4483-82ad-219e522bdf4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4Mj1yXTYYFkyrdh+mvmjMj3Rnq4Ab6Jk43JqlUZvYpA=;
	b=h0rLNyQhwqXRg7zvqstYlxYgmp27YnWfLxr6+rc9gRp9u7Ojtu9/nrRfnGagPdvZ
	Nq7tHdN4twirpwF3c1BiGE94MpH3IPQTsN4eFsMYvhxJxnf5qJjqjnW7J2+UEvrXTWN
	XSLPDrifk1yR6YXVjCZ910XRqaOX2OhAvB3CmrjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4Mj1yXTYYFkyrdh+mvmjMj3Rnq4Ab6Jk43JqlUZvYpA=;
	b=ZuqqMwGGFq9p1Iu1+2kix5xlCWqTconPiTCuWyUBed4mlvQ+74xS839PbtImyE+U
	zQNGQjI2ocYjxcZEe7jDr166AeYO2FWNq703WrWVsS/Y91ImwAQ0X52/1oUFXz5WbSH
	pyPi9YtVgqL7Y3iY7rtk+koyHkkKMOkTvmC2KHuQ=
Content-Type: multipart/mixed; boundary="===============5378596724213103950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.49.0 SUCCEEDED
Message-ID: 
 <010101834184037c-2beb29e3-a75a-4483-82ad-219e522bdf4d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170751

--===============5378596724213103950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.49.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.48.0-1.49.0.patch
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
--===============5378596724213103950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.22.0", added "/usr/lib/libnghttp2.so.14.23.0"
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.22.0 to libnghttp2.so.14.23.0
  /usr/lib/libnghttp2.so.14.22.0 moved to /usr/lib/libnghttp2.so.14.23.0

--===============5378596724213103950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/nghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases/download/v1.48.0/nghttp2-1.48.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases/download/v1.49.0/nghttp2-1.49.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch"
packages/core2-32-poky-linux/nghttp2: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.22.0", added "/usr/lib/libnghttp2.so.14.23.0"
packages/core2-32-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/libnghttp2: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.22.0", added "/usr/lib/.debug/libnghttp2.so.14.23.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 462772 to 463624 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 206660 to 207176 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 179794 to 179861 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1005413 to 1006030 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2: PV changed from "1.48.0" to "1.49.0"
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.22.0 to libnghttp2.so.14.23.0
  /usr/lib/libnghttp2.so.14.22.0 moved to /usr/lib/libnghttp2.so.14.23.0

--===============5378596724213103950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.48.0-1.49.0.patch"

RnJvbSA4MjIwY2Y2OGRmZjRlZTJiZGE1YTYzMmQ4NDkwOTgzZjg0ZDA5MTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTM6NDE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Z2h0dHAyOiB1cGdyYWRlIDEuNDguMCAtPiAxLjQ5LjAKCi0tLQogLi4uL25naHR0cDIve25naHR0
cDJfMS40OC4wLmJiID0+IG5naHR0cDJfMS40OS4wLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmdodHRwMi97bmdodHRwMl8xLjQ4LjAuYmIgPT4gbmdodHRwMl8xLjQ5
LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9u
Z2h0dHAyXzEuNDguMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8x
LjQ5LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNDguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNDkuMC5iYgppbmRleCA0ZmYzYWI4MjliLi5iN2JjZDBl
Y2UwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS40
OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjQ5LjAu
YmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgaHR0cHM6Ly9naXRodWIuY29t
L25naHR0cDIvbmdodHRwMi9yZWxlYXNlcy9kb3dubG9hZC92JHtQVn0vbmdodHRwMi0ke1BWfS50
YXIueHogXAogICAgIGZpbGU6Ly8wMDAxLWZldGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMu
cGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ3ZDhmMzBlZTRmMWJjNjIxNTY2ZDEw
MzYyY2ExYjNhYzgzYTMzNWM2M2RhNzE0NDk0N2M4MDY3NzJkMDE2ZTQiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYjBjZmQ0OTJiYmYwYjEzMWM0NzJlOGY2NTAxYzlmNGVlODJiNTFiNjgxMzBmNDdi
Mjc4YzBiN2M5ODQ4YTY2ZSIKIAogaW5oZXJpdCBjbWFrZSBtYW5wYWdlcyBweXRob24zbmF0aXZl
CiBQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9ICIiCi0tIAoyLjMxLjEKCg==

--===============5378596724213103950==--

