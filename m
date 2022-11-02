Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C48C65BDB
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.855.1667349632190420967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ePjdu+7c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c850e5-7596cbfb-0e71-4541-8c7d-2c6273e7977e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tUZ+a9gBjrraTB7xdBYtkzGeBbINGR0YA4dBQGgp3W4=;
	b=ePjdu+7cGIuG9MuJls4A8rgnq+P+R9F19jQiyEUvYnZ/mO7T7nGmr0AaRgjhtZSR
	mxYS6JSU0pGIQw0jowC+X72c5gpXy8dC7CrRNZdOgszKygT8bQmYyk0bAV6XjGtx9Qc
	BTrQrW/oezN6w+V6iD/w+cJ8/qY+36pRJ7f6Ac24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tUZ+a9gBjrraTB7xdBYtkzGeBbINGR0YA4dBQGgp3W4=;
	b=PGnhkQ8zkMwDvRpwyGStvxvcIlgBkmq56UyG2shWBQQ4kY+XJvmQqriTp2TX7CIt
	zKWZBjZVcB7VvFa8MFXKvk0tzeG6iiQ91b7RoXiy0K077r9xFj6AToWJEPze9SzP70Q
	5rynhUqhvqCZd5dQ/lHD/Y1TANL2FXAiIC6chpEs=
Content-Type: multipart/mixed; boundary="===============2811337157037969875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.5.0 SUCCEEDED
Message-ID: <0101018435c850e5-7596cbfb-0e71-4541-8c7d-2c6273e7977e-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172401

--===============2811337157037969875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *expat* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.4.9-2.5.0.patch
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
--===============2811337157037969875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/expat/expat-bin: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-bin: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-dbg: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-dbg: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-dbg: PKGSIZE changed from 1867104 to 1876252 (+0%)
packages/core2-32-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.8.9", added "/usr/lib/.debug/libexpat.so.1.8.10"
packages/core2-32-poky-linux/expat/expat-dev: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-dev: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-dev: PKGSIZE changed from 65148 to 65230 (+0%)
packages/core2-32-poky-linux/expat/expat-doc: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-doc: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-doc: PKGSIZE changed from 73875 to 75317 (+2%)
packages/core2-32-poky-linux/expat/expat-locale: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-locale: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-ptest: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-ptest: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-ptest: PKGSIZE changed from 1015006 to 1027294 (+1%)
packages/core2-32-poky-linux/expat/expat-src: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-src: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat-src: PKGSIZE changed from 1106678 to 1113920 (+1%)
packages/core2-32-poky-linux/expat/expat-staticdev: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat-staticdev: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
packages/core2-32-poky-linux/expat/expat: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat/expat: PKGSIZE changed from 173409 to 173410 (+0%)
packages/core2-32-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.8.9", added "/usr/lib/libexpat.so.1.8.10"
packages/core2-32-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_4_9/expat-2.4.9.tar.bz2 file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_5_0/expat-2.5.0.tar.bz2 file://run-ptest"
packages/core2-32-poky-linux/expat: PV changed from "2.4.9" to "2.5.0"
packages/core2-32-poky-linux/expat: PKGV changed from 2.4.9 [default] to 2.5.0 [default]
Changes to packages/core2-32-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.8.9 to libexpat.so.1.8.10
  /usr/lib/cmake/expat-2.4.9 moved to /usr/lib/cmake/expat-2.5.0
  /usr/lib/libexpat.so.1.8.10 was added
  /usr/lib/libexpat.so.1.8.9 was removed

--===============2811337157037969875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.4.9-2.5.0.patch"

RnJvbSBjYmJlNzAzZjJjMDk4NDM0NjdmMWMyZjc2YWFiZDk4NWUwOGZiZWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzowMDoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV4
cGF0OiB1cGdyYWRlIDIuNC45IC0+IDIuNS4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0
L3tleHBhdF8yLjQuOS5iYiA9PiBleHBhdF8yLjUuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9leHBhdC97ZXhwYXRfMi40LjkuYmIgPT4gZXhwYXRfMi41LjAuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi40LjkuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdF8yLjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjQuOS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi41LjAuYmIKaW5kZXggOTU2MWVkZDg0Zi4uYWE4
ZDQzOWQ1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi40Ljku
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi41LjAuYmIKQEAgLTE1LDcg
KzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvUl8ke1ZFUlNJ
T05fVEFHfS9leHBhdC0ke1BWfS50YXIuYnoyICBcCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzLyIKIFVQU1RSRUFNX0NIRUNL
X1JFR0VYID0gInJlbGVhc2VzL3RhZy9SXyg/UDxwdmVyPi4rKSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjdmNDRkMTQ2OWIxMTA3NzNhOTRiMGQ1YWJlZWVmZmFlZjc5ZjhiZDY0MDZiMDdlNTIz
OTRiY2Y0ODEyNjQzN2EiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmYwZTZlMDFmN2IzMDAyNWZh
MDVjODVmZGFkMWU1ZDBlYzdmZDM1ZDlmNjFiMjJmMzQ5OThkZTExOTY5ZmY2NyIKIAogRVhUUkFf
T0VDTUFLRTpjbGFzcy1uYXRpdmUgKz0gIi1ERVhQQVRfQlVJTERfRE9DUz1PRkYiCiAKLS0gCjIu
MzEuMQoK

--===============2811337157037969875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.8.9", added "/usr/lib/libexpat.so.1.8.10"
Changes to packages/core2-32-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.8.9 to libexpat.so.1.8.10
  /usr/lib/cmake/expat-2.4.9 moved to /usr/lib/cmake/expat-2.5.0
  /usr/lib/libexpat.so.1.8.10 was added
  /usr/lib/libexpat.so.1.8.9 was removed

--===============2811337157037969875==--

