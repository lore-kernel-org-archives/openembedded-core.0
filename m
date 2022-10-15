Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78835C6FA97
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.24532.1665871392641858706
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AU/tG7rP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac3e3e-dc9b52d0-f6a6-462f-9b0b-da521dbeb4e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vw0YqSNSu0eSOl8FkJJUe+KHfRWFkgGJh7WMgykAfto=;
	b=AU/tG7rPoYlSWsLGeVwQ/NRJTZ7tweTM8bSqxxgBuPFo4G0YIYzBbpP5Nck5v3X5
	JZ24tSDKltm8Dlh7IPvLrC/sJd+/9//uRH6vk5jK3egXuuycrl80fMJYLLxQU9d82yp
	OIF04S/VcmBzZcjK0DuskE/X2F8VpV/X2GNlzuP4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vw0YqSNSu0eSOl8FkJJUe+KHfRWFkgGJh7WMgykAfto=;
	b=azWpyR1MyfD2ZhhlI5jJf6MVnDzKsYtCI9hII4VcNzP/kmKE3iGZu7OxMlLyyW2c
	KCpHxwC7DbjrVR854f/87qPE05hfFD0bPGxMc4zilo00OW+DMgH8VGJlGpK6v9VRl8k
	3+SG8VFyT+sWExaLg68xhkolTygJDPOyxCESy9Sk=
Content-Type: multipart/mixed; boundary="===============3336965051548834816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3e3e-dc9b52d0-f6a6-462f-9b0b-da521dbeb4e3-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171855

--===============3336965051548834816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.20.3-1.20.4.patch
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
--===============3336965051548834816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.20.3-1.20.4.patch"

RnJvbSA4MjJkM2MwYWI1NjJjYmU1ZDhjYTNhN2I4MDAzZTI3YzkwZWI2Mzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTg6NDI6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kOiB1cGdyYWRlIDEuMjAuMyAtPiAxLjIwLjQKCi0tLQog
Li4udWdpbnMtZ29vZF8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIw
LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MjAuNC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIwLjMuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIwLjQuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yMC4zLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29v
ZF8xLjIwLjQuYmIKaW5kZXggMDIzNTkzNWE0YS4uNGE0NjcyOTkyZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Rf
MS4yMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1nb29kXzEuMjAuNC5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdvb2QvZ3N0
LXBsdWdpbnMtZ28KICAgICAgICAgICAgZmlsZTovLzAwMDEtcXQtaW5jbHVkZS1leHQtcXQtZ3N0
cXRnbC5oLWluc3RlYWQtb2YtZ3N0LWdsLWdzdGdsZi5wYXRjaCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY4ZjNjMjA2YmY1Y2RhYmMwMDk1MzkyMGI0N2IzNTc1YWYw
ZWYxNWU5Zjg3MWMwYjY5NjZmNmQwYWE1ODY4YjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjE2
MTMwZmJlNjMyZmE4NTQ3YzIxNDdhMGVmNTc1YjAxNDBmYjUyMTA2NWM1Y2IxMjFjNzJkZGJkMjNi
NjRkYSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKLS0gCjIu
MzEuMQoK

--===============3336965051548834816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 15861628 to 15867836 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGSIZE changed from 618448 to 622544 (+1%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 11410593 to 11420531 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.4.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.20.3" to "1.20.4"

--===============3336965051548834816==--

