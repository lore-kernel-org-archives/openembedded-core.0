Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6B3C65BA6
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24531.1665871392234762595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HxZnVVsF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=STY6JhZFsY4zC3vBOya9+vIeY0marpFRtbjrFOBQFYk=;
	b=HxZnVVsFBEkXxpfLsnnSNGWNg7N17v1/Pl+ztv82KQL60R0Xei85tPPXa+Wed/nz
	SL6PFPgDzfCx+kk8GC99oq763GJdcjtbQnc8+qimjt1ROcreoQ7o0kwXd2mqJd2wwiR
	8eMF1c7fzoSrTXFSZnXPPTKIipAi33bk9jSRLLNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=STY6JhZFsY4zC3vBOya9+vIeY0marpFRtbjrFOBQFYk=;
	b=IIS00YCMGJ3eKS1Egl5GiK7x+PxFRVhdKYOfCkxFLt4RhablUrE1Gdv4Lh66jXNO
	tUIesW3WczmL+TLhWSjI9riRiovG1YXXIoTnbauQReFx2EAVG8MtrLljSE5zYx39jTw
	a7Apo1OXFDgj+2mGNgAK+S7xJpD/TvGBWE89mfbQ=
Content-Type: multipart/mixed; boundary="===============5139940182932832020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
Message-ID: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171742

--===============5139940182932832020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpid* to *2.0.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpid-upgrade-2.0.33-2.0.34.patch
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
--===============5139940182932832020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpid-upgrade-2.0.33-2.0.34.patch"

RnJvbSA4NzNlYjgyN2NiYmMwMzJjODAzMDM2YzRmMzJlODRhZDVhYzQwYmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDU6NTA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
Y3BpZDogdXBncmFkZSAyLjAuMzMgLT4gMi4wLjM0CgotLS0KIG1ldGEvcmVjaXBlcy1ic3AvYWNw
aWQve2FjcGlkXzIuMC4zMy5iYiA9PiBhY3BpZF8yLjAuMzQuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWJzcC9hY3BpZC97YWNwaWRfMi4wLjMzLmJiID0+IGFjcGlkXzIuMC4zNC5iYn0gKDY2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2FjcGlkL2FjcGlkXzIuMC4zMy5iYiBiL21ldGEv
cmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4wLjM0LmJiCnNpbWlsYXJpdHkgaW5kZXggNjYlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4wLjMzLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtYnNwL2FjcGlkL2FjcGlkXzIuMC4zNC5iYgppbmRleCA3MDk0YmEyNjYy
Li4xZTBhNmQ1ZjI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2FjcGlkL2FjcGlkXzIu
MC4zMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL2FjcGlkL2FjcGlkXzIuMC4zNC5iYgpAQCAt
Myw0ICszLDQgQEAgcmVxdWlyZSBhY3BpZC5pbmMKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PThjYTQzY2JjODQyYzIzMzZlODM1OTI2YzIxNjZjMjhiIFwKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL2FjcGlkLmg7ZW5kbGluZT0yNDttZDU9MzI0YTljZjIyNWFlNjlk
ZGFhZDFiZjlkOTQyMTE1YjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwODU2ZjcxYjNlYjM0
YTFiNjYzZDBhOGU2MzYzZGZjYmM1MTllNjNkODQ3MzMwNDk4ODk4NjU4ZTI5NzJkYmU4IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjJkMDk1YzhjZmNiYzg0N2NhZWM3NDZkNjJjZGM4ZDBiZmYxZWMx
YmM3MmVmN2M2NzRjNzIxZTA0ZGE2YWIzMzMiCi0tIAoyLjMxLjEKCg==

--===============5139940182932832020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpid/acpid-dbg: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-dbg: PKGSIZE changed from 204072 to 207048 (+1%)
packages/core2-32-poky-linux/acpid/acpid-dbg: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-dev: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-dev: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-doc: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-doc: PKGSIZE changed from 66152 to 66886 (+1%)
packages/core2-32-poky-linux/acpid/acpid-doc: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-locale: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-locale: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-src: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-src: PKGSIZE changed from 169188 to 172541 (+2%)
packages/core2-32-poky-linux/acpid/acpid-src: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-staticdev: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-staticdev: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid: PKGSIZE changed from 95854 to 101010 (+5%)
packages/core2-32-poky-linux/acpid/acpid: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid: SRC_URI changed from "https://downloads.sourceforge.net/acpid2/acpid-2.0.33.tar.xz file://init file://acpid.service" to "https://downloads.sourceforge.net/acpid2/acpid-2.0.34.tar.xz file://init file://acpid.service"
packages/core2-32-poky-linux/acpid: PV changed from "2.0.33" to "2.0.34"

--===============5139940182932832020==--

