Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA32C63707
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.24558.1665871392776365023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Zof11KmO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac3c92-073efb28-c2c3-4cc3-91fb-e2e5032ef551-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lXEIno1PQwF0PlrOnJb/1HwUT9Lg0UkVk/QU7YHyJg4=;
	b=Zof11KmOsMPC8/9zrg8GsqRjZF28X+1Hg2vM0Zt1iXHSIIkI4Ln3z7JsSr04XmLi
	75Me5luGD4FffRgPcyELfwu0qgOYKoY85WFEt8bkg67j6JmD5ieFXwsxdJ0XYeDTG3J
	EN9Wtfo2hkutRVqOCpMAOu73o4fPcSDdMAT3J8YE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lXEIno1PQwF0PlrOnJb/1HwUT9Lg0UkVk/QU7YHyJg4=;
	b=ea1DfOaPzHd+Y4wULc2A3gcdVNRwbRJyutW/z7ScYhpWCemx7wjfsXQ/I6cJt0Pt
	qzbDY4B1u8QsDuWaSUBvwp14md7N5kaTsnkyCDS9ownbzZf8/tBasBPuDu6UCJjcP7s
	rQRqn/sk2VygsERDE7z2WIUNMobh8xFhRTz1/tTE=
Content-Type: multipart/mixed; boundary="===============4794809952884417743=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xkeyboard-config: upgrading to 2.37 SUCCEEDED
Message-ID: <01010183ddac3c92-073efb28-c2c3-4cc3-91fb-e2e5032ef551-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171815

--===============4794809952884417743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xkeyboard-config* to *2.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkeyboard-config-upgrade-2.36-2.37.patch
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
--===============4794809952884417743==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkeyboard-config-upgrade-2.36-2.37.patch"

RnJvbSA5NTg2M2MzMmU5Zjc2OGRkNjI3ZjUwMWU1MWVlYmNkZGZhNzliNDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6MDQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2V5Ym9hcmQtY29uZmlnOiB1cGdyYWRlIDIuMzYgLT4gMi4zNwoKLS0tCiAuLi4ve3hrZXlib2Fy
ZC1jb25maWdfMi4zNi5iYiA9PiB4a2V5Ym9hcmQtY29uZmlnXzIuMzcuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi4zNi5iYiA9
PiB4a2V5Ym9hcmQtY29uZmlnXzIuMzcuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3hrZXlib2FyZC1jb25maWdfMi4zNi5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5Ym9hcmQtY29uZmlnXzIuMzcuYmIKc2ltaWxhcml0
eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hr
ZXlib2FyZC1jb25maWdfMi4zNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3hrZXlib2FyZC1jb25maWdfMi4zNy5iYgppbmRleCA5ZTZkMTdjNzgwLi5mM2Q5YWM5
MjIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGtleWJvYXJk
LWNvbmZpZ18yLjM2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5
Ym9hcmQtY29uZmlnXzIuMzcuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5TRSA9ICJNSVQgJiBN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0wZTdmMjFjYTdkYjk3
NWM2MzQ2N2QyZTc2MjRhMTJmOSIKIAogU1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlk
dWFsL2RhdGEveGtleWJvYXJkLWNvbmZpZy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjFmMWJiMTI5MmExNjFkNTIwYTM0ODVkMzc4NjA5Mjc3ZDEwOGNkMDdjZGUw
MzI3YzE2ODExZmY1NGMzZTE1OTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWIxMzgzYTVhYzRi
NjIxMGQ3YzczMDJiOWQ2ZmFiMDUyYWJkZjUxYzVkMmM5YjU1ZjFmNzc5OTk3YmE2OGM2YyIKIAog
U0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAidXRpbC1tYWNyb3MgbGlieHNsdC1uYXRp
dmUiCi0tIAoyLjMxLjEKCg==

--===============4794809952884417743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xkeyboard-config: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config: SRC_URI changed from "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.36.tar.xz" to "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.37.tar.xz"
packages/core2-32-poky-linux/xkeyboard-config: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-dev: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-dev: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-doc: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGSIZE changed from 37835 to 38934 (+3%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGSIZE changed from 104594 to 104391 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGSIZE changed from 109350 to 109237 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGSIZE changed from 85043 to 84980 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGSIZE changed from 89779 to 89680 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGSIZE changed from 89852 to 89705 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGSIZE changed from 23273 to 23149 (-1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGSIZE changed from 82439 to 83991 (+2%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGSIZE changed from 85310 to 85316 (+0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGSIZE changed from 89256 to 90399 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGSIZE changed from 86482 to 86409 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGSIZE changed from 84617 to 85718 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGSIZE changed from 96674 to 96549 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGSIZE changed from 87578 to 87492 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGSIZE changed from 83830 to 83768 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGSIZE changed from 90580 to 91799 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGSIZE changed from 86132 to 86037 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGSIZE changed from 86888 to 86784 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGSIZE changed from 86479 to 86824 (+0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGSIZE changed from 105856 to 107219 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGSIZE changed from 81535 to 84064 (+3%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGSIZE changed from 102792 to 104088 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGSIZE changed from 85262 to 86300 (+1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGSIZE changed from 86483 to 86322 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGSIZE changed from 106158 to 106005 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGSIZE changed from 87857 to 87811 (-0%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-src: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-src: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PKGV changed from 2.36 [default] to 2.37 [default]
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config: PV changed from "2.36" to "2.37"
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config: PKGSIZE changed from 3401070 to 3367968 (-1%)
packages/core2-32-poky-linux/xkeyboard-config/xkeyboard-config: PKGV changed from 2.36 [default] to 2.37 [default]

--===============4794809952884417743==--

