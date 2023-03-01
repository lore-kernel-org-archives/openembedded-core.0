Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D48C7EE3A
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.24039.1677681914651374190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=duwTb1Ro;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101869da27581-f4b7af60-cbf2-4459-8855-0f5c5b09357b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pQq0vQsED1jZ3bRpHgtp5WWzfZO9OLvAvFL3p/bLzHs=;
	b=duwTb1RoIY0hOIhskzNEW67mF2VTNgall46TSxXMikQVho6WVXqqYJnu0iR3VEdd
	0WIYCWZ4oZmlvqza7jLWLkEh764Fsyjy8uDW59Yz69idQm3NBDSIZEViHaZEU9oKHo5
	ULcaMoqFYHo1NolCtoTXrqY2zHSJg7A9ugOUZLP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pQq0vQsED1jZ3bRpHgtp5WWzfZO9OLvAvFL3p/bLzHs=;
	b=ZiMseAD4Qm4Cp3eZl7+Fbn9Kv/YMlINXl7vAx3P/1z3a509NgdoeCaaYJ+umpzfN
	QindNjgt4r9VHdEpAwcB86VZBCPJxxCKSC/IbTsUMjanqX2Gu9ML+pbC1J0ao6Nsvgh
	K1+fpxNBou6dNLHsUyIPcyX7/b5MbSj1JNXfigVE=
Content-Type: multipart/mixed; boundary="===============1271820317458475777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 0.9.76 SUCCEEDED
Message-ID: <010101869da27581-f4b7af60-cbf2-4459-8855-0f5c5b09357b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177927

--===============1271820317458475777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmicrohttpd* to *0.9.76* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-0.9.75-0.9.76.patch
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
--===============1271820317458475777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.75.tar.gz" to "https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.76.tar.gz"
packages/core2-32-poky-linux/libmicrohttpd: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 218475 to 507918 (+132%)
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1165304 to 1165303 (-0%)
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 0.9.75 [default] to 0.9.76 [default]
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "0.9.75" to "0.9.76"
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 0.9.75 [default] to 0.9.76 [default]

--===============1271820317458475777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-0.9.75-0.9.76.patch"

RnJvbSBhY2M1YTg0MDg5MGVmZmJjZGNjMTNlMzQ5NTQ5YTc4ODhkZDU1OGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDozODoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1pY3JvaHR0cGQ6IHVwZ3JhZGUgMC45Ljc1IC0+IDAuOS43NgoKLS0tCiAuLi4ve2xpYm1pY3Jv
aHR0cGRfMC45Ljc1LmJiID0+IGxpYm1pY3JvaHR0cGRfMC45Ljc2LmJifSAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL3tsaWJtaWNyb2h0dHBkXzAuOS43NS5i
YiA9PiBsaWJtaWNyb2h0dHBkXzAuOS43Ni5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMC45Ljc1LmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzAuOS43Ni5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJt
aWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMC45Ljc1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMC45Ljc2LmJiCmluZGV4IDA0M2Zl
ZDM2N2MuLjdiZDY2ZjYzY2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1p
Y3JvaHR0cGQvbGlibWljcm9odHRwZF8wLjkuNzUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzAuOS43Ni5iYgpAQCAtNyw3ICs3LDcgQEAg
U0VDVElPTiA9ICJuZXQiCiBERVBFTkRTID0gImZpbGUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS9saWJtaWNyb2h0dHBkLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTI3ODkwN2E2ZjU3MWIzOTFhYWI5NjQ0ZmQ2NDZhNTEwOGVkOTczMTFlYzY2ZjYzNTlj
ZWJiZWRiMGE0ZTNiYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMGIxNTQ3YjVhNDJhNmMwZjcy
NGU4ZTFjMWNiNWNlOWM0YzM1ZmI0OTVlN2Q3ODBiOTkzMGQzNTAxMWNlYjRjIgogCiBpbmhlcml0
IGF1dG90b29scyBsaWJfcGFja2FnZSBwa2djb25maWcgZ2V0dGV4dAogCi0tIAoyLjM5LjIKCg==

--===============1271820317458475777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 218475 to 507918 (+132%)

--===============1271820317458475777==--

