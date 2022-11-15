Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1297BC6370C
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.5192.1668517535801270784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WgTctnE9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101847b6522dc-50396b2b-5594-4b53-ad5f-3011d9ffa179-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2wRLoq9vDRofIeAOeKh/8xxqRBSNEqsohmwab48sDT8=;
	b=WgTctnE9iDNisG6hq34g+uDCjv4fTRWS4H6z/FGT/vNHRDfBLtfcIgUl8rga+EIZ
	Gw5kZXUpcUvV2m8o/UxzNXu9IQBWoQXgZekxXsyjP458452cmykxqwBkioE8tsgBPSb
	U1lgrlll87YZ7FvW3aYO5Jnd83OpOIu1XtJa7H88=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2wRLoq9vDRofIeAOeKh/8xxqRBSNEqsohmwab48sDT8=;
	b=LW0QGt9OvWjMP+YP6ej+HNUaOfjCaELVG4ygJiCIoynb/IFV5RCjRSO95SyEJWU9
	9u6Ct1HJhFFWqXv1QtOIW5rcGMO837gFVrvGUAkCPJq2M46WwK9rVsbVqrOzoDTYKUS
	j0CdVjYw+2tdLgdyKZceqLghGOra57+3T63tz/Mg=
Content-Type: multipart/mixed; boundary="===============1069661134174785533=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 71eb7b6880c842da2c2414f2be9468e9fd95d525
 SUCCEEDED
Message-ID: <010101847b6522dc-50396b2b-5594-4b53-ad5f-3011d9ffa179-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173325

--===============1069661134174785533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *71eb7b6880c842da2c2414f2be9468e9fd95d525* has Succeeded.

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
--===============1069661134174785533==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA2NzY4MzU3ZGQ0ZmU1MDMxODIwNTI5NjQ5ZTRjNzI5Y2JmNGQ4OWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTA6NTI6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCA4ZDY2ZGY0ZTA5Li4zZWM3NThiYWMyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gIjFjZDcxNjE4MGNmYjZlZjBjMWZjNTQ3MDI0NjBlZjQ5ZTUxMTU3OTEi
CitTUkNSRVYgPSAiNzFlYjdiNjg4MGM4NDJkYTJjMjQxNGYyYmU5NDY4ZTlmZDk1ZDUyNSIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============1069661134174785533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880

--===============1069661134174785533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+1cd716180c [default] to 1.0+gitrAUTOINC+71eb7b6880 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 23007 to 22875 (-1%)
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+71eb7b6880"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+71eb7b6880

--===============1069661134174785533==--

