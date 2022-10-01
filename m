Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DE3C4167B
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.340.1664643225650789206
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YqhGeXzs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101839477d430-07074b99-8b98-4dfc-bc60-9cfe4b02c678-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+U4O9Vux+qUVzBQxH0/vC6XU+1nYlCvii8jfkO2Tivw=;
	b=YqhGeXzsc0pX6Xq7kayaihK5fOxXSw7bPEE4aJyCVKs2/Yp9ERtXBRR0Uq0Fpoc6
	Ig2WtUA3g8QI0ITKACQzHTXwo89nFOh2ObXfdIatF5zmlky+y7f+OVVhx6bvoyCaies
	vnjKQiA1MN63SroRFQF0m59vvr+W0/M57P79zp8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+U4O9Vux+qUVzBQxH0/vC6XU+1nYlCvii8jfkO2Tivw=;
	b=aLeVJQ7xG15xFZTcYdsOie/qkQgDWcg3pCpyLbDsJ/LdCeWb/YBtoFzZxVe1qNSz
	uvbZAoAHXDpeLdSy1iD2Lkqv/EgIpSxCakpxpL1LXYH7VLmAPYJeEtVbK+Ky6ohH7HZ
	enHpbnLf9/R0rkNltOeaP2Ktk+Q/gIzYtHUzwL6c=
Content-Type: multipart/mixed; boundary="===============5625991867050105517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
Message-ID: 
 <010101839477d430-07074b99-8b98-4dfc-bc60-9cfe4b02c678-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171253

--===============5625991867050105517==
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
--===============5625991867050105517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpid-upgrade-2.0.33-2.0.34.patch"

RnJvbSA4YjQzY2I3NTU5Y2UyN2M4YjdlNGFjNmMyNzVmMDFjMjJiMTkxMTEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNTo1MDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
cGlkOiB1cGdyYWRlIDIuMC4zMyAtPiAyLjAuMzQKCi0tLQogbWV0YS9yZWNpcGVzLWJzcC9hY3Bp
ZC97YWNwaWRfMi4wLjMzLmJiID0+IGFjcGlkXzIuMC4zNC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
YnNwL2FjcGlkL3thY3BpZF8yLjAuMzMuYmIgPT4gYWNwaWRfMi4wLjM0LmJifSAoNjYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4wLjMzLmJiIGIvbWV0YS9y
ZWNpcGVzLWJzcC9hY3BpZC9hY3BpZF8yLjAuMzQuYmIKc2ltaWxhcml0eSBpbmRleCA2NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC9hY3BpZC9hY3BpZF8yLjAuMzMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4wLjM0LmJiCmluZGV4IDcwOTRiYTI2NjIu
LjFlMGE2ZDVmMjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4w
LjMzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYWNwaWQvYWNwaWRfMi4wLjM0LmJiCkBAIC0z
LDQgKzMsNCBAQCByZXF1aXJlIGFjcGlkLmluYwogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9OGNhNDNjYmM4NDJjMjMzNmU4MzU5MjZjMjE2NmMyOGIgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vYWNwaWQuaDtlbmRsaW5lPTI0O21kNT0zMjRhOWNmMjI1YWU2OWRk
YWFkMWJmOWQ5NDIxMTViNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA4NTZmNzFiM2ViMzRh
MWI2NjNkMGE4ZTYzNjNkZmNiYzUxOWU2M2Q4NDczMzA0OTg4OTg2NThlMjk3MmRiZTgiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMmQwOTVjOGNmY2JjODQ3Y2FlYzc0NmQ2MmNkYzhkMGJmZjFlYzFi
YzcyZWY3YzY3NGM3MjFlMDRkYTZhYjMzMyIKLS0gCjIuMzEuMQoK

--===============5625991867050105517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpid/acpid-dbg: PKGSIZE changed from 204072 to 207048 (+1%)
packages/core2-32-poky-linux/acpid/acpid-dbg: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-dbg: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-dev: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-dev: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-doc: PKGSIZE changed from 66152 to 66886 (+1%)
packages/core2-32-poky-linux/acpid/acpid-doc: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-doc: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-locale: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-locale: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-src: PKGSIZE changed from 169188 to 172541 (+2%)
packages/core2-32-poky-linux/acpid/acpid-src: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-src: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid-staticdev: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid-staticdev: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid/acpid: PKGSIZE changed from 95854 to 101010 (+5%)
packages/core2-32-poky-linux/acpid/acpid: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid/acpid: PKGV changed from 2.0.33 [default] to 2.0.34 [default]
packages/core2-32-poky-linux/acpid: SRC_URI changed from "https://downloads.sourceforge.net/acpid2/acpid-2.0.33.tar.xz file://init file://acpid.service" to "https://downloads.sourceforge.net/acpid2/acpid-2.0.34.tar.xz file://init file://acpid.service"
packages/core2-32-poky-linux/acpid: PV changed from "2.0.33" to "2.0.34"
packages/core2-32-poky-linux/acpid: PKGV changed from 2.0.33 [default] to 2.0.34 [default]

--===============5625991867050105517==--

