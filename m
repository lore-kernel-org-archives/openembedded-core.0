Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE6EC77B7E
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12291.1678895725245672049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mpnCoGM9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010186e5fbc0ba-7425d7ac-88f4-4bf0-921f-6109bc9eaddf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sGX+5C845+y/rn4weqHT9ksVnmnx0LOSMz+GQgCM9Hk=;
	b=mpnCoGM9rsu8zNPd0ezuvn53YaP+z9PzmGPZgnef43LMfM/CuD7dO4/pCY4mWGXk
	bILSszpzElxHODLLIy7yQbLD9PMHQtJ5gJB7Gyg85X0tjpe4hINNBVltmNhKhS7Myfx
	cVINd2j/ebBeda9wUXbb6cTicxRO3N863DXKT9dc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sGX+5C845+y/rn4weqHT9ksVnmnx0LOSMz+GQgCM9Hk=;
	b=qr2ljWwg1TeV065mitFEJEgzO9SujpIJKdpS0otqrbB1le7nLKUDmHJt3JGJWUtQ
	uR5TLXYI0d0kjdvkQsH8DSkAy/P5uVmlvslwQBOBn15FjUAF2LOSEvc/ui0LiEOVU6q
	mqDccR3xvJR3A1rRndN/SZ0dK0bJ/p3N7+Z9Kp8c=
Content-Type: multipart/mixed; boundary="===============6986241782207021926=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 14e7ef53ec35d0fb19a0396d3ad701c83fa240a5
 SUCCEEDED
Message-ID: <01010186e5fbc0ba-7425d7ac-88f4-4bf0-921f-6109bc9eaddf-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178616

--===============6986241782207021926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *14e7ef53ec35d0fb19a0396d3ad701c83fa240a5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============6986241782207021926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec

--===============6986241782207021926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+0f4a875b05 [default] to 1.0+gitrAUTOINC+14e7ef53ec [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+14e7ef53ec
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+14e7ef53ec"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048227971 to 2048490407 (+0%)

--===============6986241782207021926==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBkMjFkNWM5OTg5NzY3ZDg2MGI5MDkzYzZmNDUzNzhjNjk5ZmVhNjM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTI6NTQ6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCA3OGI0Nzk4NWJjLi4xZDA5NzcxODc4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gIjBmNGE4NzViMDVmZWI0NDQyNmEyZDQzMTQ2ZjVlM2M2ZWE1ZjgwMzgi
CitTUkNSRVYgPSAiMTRlN2VmNTNlYzM1ZDBmYjE5YTAzOTZkM2FkNzAxYzgzZmEyNDBhNSIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============6986241782207021926==--

