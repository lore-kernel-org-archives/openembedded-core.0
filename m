Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E579C6786C
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.24540.1665871394580070695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fSKugzCO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac3e95-370df473-de32-42b1-82a9-cd6df137209e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sYuwf/QfyMo6W4nYYtBMrRh3Zq+AUgTDrQlmYrxS8o4=;
	b=fSKugzCO4m6amyutONnSreXw2ZNBIASNOouG6SZNLMrk0viMIpIYOb1EwFmUxrgH
	YLQU0HiGYNWkGEpOrKruOU04c+DBTg5fkiW/SjQPUPgVdoAfNwWvZITrHZqoPClM269
	9kNh8ITGss2VbkqkuVWpKVsH53LfAClJ6Srq/9u4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sYuwf/QfyMo6W4nYYtBMrRh3Zq+AUgTDrQlmYrxS8o4=;
	b=YMbm1Ouc3YGYb2MAlXrWgrlxs1yDoHE+yYxMP7DAEOxe4+nMmi4Bv1oHV4VMfsLD
	Ks44xcYsG8dA5iFGF4Z2AWGy+vcer2ioYGkVmm1ACNMftw8tjUlMMJi3GeTbcQyhzmF
	DYMoYzwuz1pIprtmEtzRTvm8IHvNsfVVEKZsJM4A=
Content-Type: multipart/mixed; boundary="===============2720901829298108708=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3e95-370df473-de32-42b1-82a9-cd6df137209e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171867

--===============2720901829298108708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.20.3-1.20.4.patch
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
--===============2720901829298108708==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.20.3-1.20.4.patch"

RnJvbSAxMGU1Y2RmMjlkOTU4MWI1YWNiNTI0Y2ZlMjgyNjlhMDA3ZGMyMTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTg6NTM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjAuMyAtPiAxLjIwLjQKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjIwLjQuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjAuNC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIwLjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjIwLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjIwLjQuYmIKaW5kZXggNTcwMjZiYTczYi4uYjUxNDk4OTg2NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjAuNC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGIzNDgxMjBlYWU5NTViOGNjNGRlMzU2
MGE3ZWEwNmUzNmQ2ZTFkZGJhYTk5YTdhZDk2YjU5ODQ2NjAxY2ZkYyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1ZWI0MTM2ZDAzZTJhNDk1ZjQ0OTljOGIyZTZkOWQzZTdiNWU3M2M1YThiOGFjZjky
MTNkNTdiYzZhN2JkM2MxIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgogUkRFUEVORFM6JHtQTn0gKz0gImdzdHJl
YW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgotLSAK
Mi4zMS4xCgo=

--===============2720901829298108708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGSIZE changed from 80784 to 81098 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-python: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: PV changed from "1.20.3" to "1.20.4"

--===============2720901829298108708==--

