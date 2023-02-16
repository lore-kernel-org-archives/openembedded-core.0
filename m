Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C34EC677F1
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10291.1676508397408299456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X7POFXQ6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018657b0023a-5bfd7404-d0f6-4d4b-a936-b638f02a9493-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N4BW4Kz+MxjDDE7FClvoy4p0fw0oC9uLOdYt0p4G5DI=;
	b=X7POFXQ6wBv2VFGWdAxAIBHmdoCT3RLEqp8qlvI/ey0ko70aPdOeEPicZKpGmIWT
	qO37eRG5CTvRTfC67hWIMgzgrGJeQ8mOAZpd7PKeIRUqptFx9kybiBCaHvgqxqt4Cgw
	AEBEVTD+g3htBAnws7RMNGhe6zc+8oLK7KR377gE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N4BW4Kz+MxjDDE7FClvoy4p0fw0oC9uLOdYt0p4G5DI=;
	b=CRdAC+TgXbaCUrtm1spO1w4t4B4iRzRgcMX6CFgMnpZV3Q6I2BcY2JN6qHCnnzG2
	aZfK/7Xu59tpFq9JEFzSaKOzNG6pk3zIlq4KddahhY9gQA59hZqq5vhT6trtTyNAfsb
	0WLZO6hnDDXGjI/kkYrZb6cql4+U+QsyDesSZdGE=
Content-Type: multipart/mixed; boundary="===============2643528552641574686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.4.4 SUCCEEDED
Message-ID: <0101018657b0023a-5bfd7404-d0f6-4d4b-a936-b638f02a9493-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177268

--===============2643528552641574686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dos2unix* to *7.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.4.3-7.4.4.patch
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
--===============2643528552641574686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 177868 to 178108 (+0%)
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 194047 to 195604 (+1%)
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 192350 to 192420 (+0%)
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix/dos2unix: PKGV changed from 7.4.3 [default] to 7.4.4 [default]
packages/core2-32-poky-linux/dos2unix: PV changed from "7.4.3" to "7.4.4"
packages/core2-32-poky-linux/dos2unix: PKGV changed from 7.4.3 [default] to 7.4.4 [default]

--===============2643528552641574686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.4.3-7.4.4.patch"

RnJvbSAxNzE1Y2Q0ZDZkMDU5ZTI3ZWIyYTIyNzcyMTg4ZWZlODJmNWQ2NTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTYgRmViIDIwMjMgMDA6MjI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
b3MydW5peDogdXBncmFkZSA3LjQuMyAtPiA3LjQuNAoKLS0tCiAuLi4ve2RvczJ1bml4XzcuNC4z
LmJiID0+IGRvczJ1bml4XzcuNC40LmJifSAgfCAyOCArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC97ZG9zMnVuaXhfNy40LjMuYmIgPT4gZG9zMnVuaXhf
Ny40LjQuYmJ9ICg1MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVu
aXgvZG9zMnVuaXhfNy40LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3My
dW5peF83LjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDUxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy40LjQuYmIKaW5kZXggMGQ3MWMzOGJkMS4u
ZmY2ODFjMDQ5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9z
MnVuaXhfNy40LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVu
aXhfNy40LjQuYmIKQEAgLTEsMyArMSwyNyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJ
TkcudHh0CisjICsrKyBDT1BZSU5HLnR4dAorIyBAQCAtMSw4ICsxLDggQEAKKyMgIFRoZSBkb3My
dW5peCBwYWNrYWdlIGlzIGRpc3RyaWJ1dGVkIHVuZGVyIEZyZWVCU0Qgc3R5bGUgbGljZW5zZS4K
KyMgLVNlZSBhbHNvIGh0dHA6Ly93d3cuZnJlZWJzZC5vcmcvY29weXJpZ2h0L2ZyZWVic2QtbGlj
ZW5zZS5odG1sCisjICtTZWUgYWxzbyBodHRwczovL3d3dy5mcmVlYnNkLm9yZy9jb3B5cmlnaHQv
ZnJlZWJzZC1saWNlbnNlLmh0bWwKKyMgIC0tLS0tLS0tCisjICAKKyMgLUNvcHlyaWdodCAoQykg
MjAwOS0yMDIyICBFcndpbiBXYXRlcmxhbmRlcgorIyArQ29weXJpZ2h0IChDKSAyMDA5LTIwMjMg
IEVyd2luIFdhdGVybGFuZGVyCisjICBDb3B5cmlnaHQgKEMpIDE5OTggQ2hyaXN0aWFuIFd1cmxs
CisjICBDb3B5cmlnaHQgKEMpIDE5OTggQmVybmQgSm9oYW5uZXMgV3VlYmJlbgorIyAgQ29weXJp
Z2h0IChDKSAxOTk0LTE5OTUgQmVuamFtaW4gTGluLgorIyAKKyMKKwogU1VNTUFSWSA9ICJDb252
ZXJ0IHRleHQgZmlsZSBsaW5lIGVuZGluZ3MgYmV0d2VlbiBDUkxGIGFuZCBMRiIKIERFU0NSSVBU
SU9OID0gIlRoZSBEb3MydW5peCBwYWNrYWdlIGluY2x1ZGVzIHV0aWxpdGllcyBkb3MydW5peCBh
bmQgXAogdW5peDJkb3MgdG8gY29udmVydCBwbGFpbiB0ZXh0IGZpbGVzIGluIERPUyBvciBNYWMg
Zm9ybWF0IHRvIFVuaXggXApAQCAtNiwxMiArMzAsMTIgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3dh
dGVybGFuLmhvbWUueHM0YWxsLm5sL2RvczJ1bml4Lmh0bWwiCiBTRUNUSU9OID0gInN1cHBvcnQi
CiAKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORy50eHQ7bWQ1PTk2NDFmYzRhZjdiNTY0NjQ2ZjUzM2YzOTExMDc0YjdhIgorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy50eHQ7bWQ1PTM3ZjcyMjQ2Y2UyYWEyZmNlOTQ4
MmMxMGIxZjJiNTAyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdC5jb2RlLnNmLm5ldC9wL2RvczJ1
bml4L2RvczJ1bml4O2JyYW5jaD1tYXN0ZXIiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9
ICJkb3MydW5peC0oP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIAotU1JDUkVWID0gImRhZTZkNGJi
YzQyZDAzZmFiYjg5Y2RlNjVlZDg5ZjIyYTE2NWQxNmUiCitTUkNSRVYgPSAiYjU2YTU4NTg0ZDNm
ZWYwNzIwNDI1YWUxNTRjMmE0ZDgwZTZhZjZjNSIKIAogUyA9ICIke1dPUktESVJ9L2dpdC9kb3My
dW5peCIKIAotLSAKMi4zNy4zCgo=

--===============2643528552641574686==--

