Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B632DC77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.13516.1681581683731219745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=O28UE1oc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187861430d2-8ae678ea-add6-4c0f-af35-22d656ea1deb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581683;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AiPVpKTboGUoChifmhx4hWUHUoMN9dfArFtj4SBFIQU=;
	b=O28UE1oc1ne7URn5MulLHzQCUyZQW3yREt7yv/ptksIXtPKzNNpcRURhc/31/1Ff
	mujdcBYMLdd8hvAowEPzqKWrXXIMgl8dgGyyWI6vNzxS0L3MFfQQVV54xYk25uhDTmk
	/pcuyVX9FPIetKek7T0TG2vqHzexRDXlsmkF26/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581683;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AiPVpKTboGUoChifmhx4hWUHUoMN9dfArFtj4SBFIQU=;
	b=mo9fZoHJ6/MOO/C+YQT7SPU2vXQYPC4093qOa0j5rCz7QQU66zxBTMu6yE4Wf9HH
	Fp44IWD3hHvKxXXEEMHRUC0vcNkwkcyCtyAavM2IDJgwmuYNocgpBclH4cU6QGHsN2v
	H6ssT6b5yxTKv6mpuDEZHhBI0V+p5t17M4J49ybo=
Content-Type: multipart/mixed; boundary="===============3115004095530367859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.1 SUCCEEDED
Message-ID: <01010187861430d2-8ae678ea-add6-4c0f-af35-22d656ea1deb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180023

--===============3115004095530367859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.0-2.1.patch
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
--===============3115004095530367859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.0-2.1.patch"

RnJvbSA4YTQ2ZTRiMzQ0ZTgzMWMwOWUzMDYzNGFjNTc3OWVmZDQ4NDhmZmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDY6NTE6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjAgLT4gMi4xCgotLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMC5iYiA9PiBvZm9ub18yLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4wLmJiID0+IG9mb25vXzIuMS5iYn0gKDk1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMC5iYiBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zv
bm9fMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25v
XzIuMS5iYgppbmRleCBhZmQ0M2QyNmYzLi4wZWNhYzllMTFjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJ
ID0gIlwKICAgICBmaWxlOi8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVf
UkVUUlktbWFjcm8tY29weS5wYXRjaCBcCiAgICAgZmlsZTovLzAwMDItbWJpbS1GaXgtYnVpbGQt
d2l0aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaCBcCiAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYjBhMzFiZjRkOGZmMzAzMGM0YWVmOWY4NDEzZGY5OTljNTRkZjlkYjJm
ZjBhMWQzZWMxNzEwZTBhOWQxYTQ5ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MjkxM2RjY2U5
YTE1Y2FjMjE3NGRhY2EyNDk0NTc3MTZhMGVjMDM2ODc4ZDIyMDM1ZTgzYWYwZTE5ZTc5YzUyIgog
CiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQgc3lzdGVtZCBnb2JqZWN0
LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjM5LjIKCg==

--===============3115004095530367859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ofono: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.0.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.1.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch"
packages/core2-32-poky-linux/ofono/ofono-dbg: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 5172960 to 5176296 (+0%)
packages/core2-32-poky-linux/ofono/ofono-dbg: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-dev: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-dev: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-doc: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-doc: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-locale: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-locale: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-src: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-src: PKGSIZE changed from 4953733 to 4956221 (+0%)
packages/core2-32-poky-linux/ofono/ofono-src: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-staticdev: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono-tests: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono-tests: PV changed from "2.0" to "2.1"
packages/core2-32-poky-linux/ofono/ofono: PKGV changed from 2.0 [default] to 2.1 [default]
packages/core2-32-poky-linux/ofono/ofono: PV changed from "2.0" to "2.1"

--===============3115004095530367859==--

