Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9739DC4708A
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24531.1665871392234762595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cwqAGY9v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac3e38-b57318cd-22f9-4102-9fd7-f04ba0a026c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6VkyWW/vw4buZ9j9T/M+vzCXhUcHG0297iDZW7uan/o=;
	b=cwqAGY9vvaiIOr9u7iXtPnXhInSdEjdPO9keeuJZAC7qFmdikV2WV8hoPrtAmTZ/
	U7d0MjthTdLce8Monc5jigRHfr/n8CwAdBDqKz/SzgXW77lD/qh60/yTcVUw4zFOZuF
	9U1Fo7PsCONku01+4HWU6P7VRY1wEXY6kqAcuOH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6VkyWW/vw4buZ9j9T/M+vzCXhUcHG0297iDZW7uan/o=;
	b=f0+zzkHljWWKrkLXUyDBeePsP1ogalrC0731bOY4wOhPEyZdaaU9byxBZwhgFkp6
	0QiquC4HnLeNt4zjFg+wg9tntfAAHCMb/XjN73gHPDw0n+mSzkDX0FFgyadY8QZyQqP
	2oulXPnQGh1A6flu9IDXKQ7A82Vi790yoAuW1w+o=
Content-Type: multipart/mixed; boundary="===============7066649463958474713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3e38-b57318cd-22f9-4102-9fd7-f04ba0a026c9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171831

--===============7066649463958474713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.20.3-1.20.4.patch
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
--===============7066649463958474713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.20.3-1.20.4.patch"

RnJvbSBiNGU0YjM1YWE2NGQ2ZmU2YjMyNDE2YmEwNTNmNTNkYzFjZTAzMmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTg6NDg6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5OiB1cGdyYWRlIDEuMjAuMyAtPiAxLjIwLjQKCi0tLQog
Li4udWdpbnMtdWdseV8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIw
LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEu
MjAuNC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIwLjMuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIwLjQuYmIK
c2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yMC4zLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWds
eV8xLjIwLjQuYmIKaW5kZXggYWQ3Yjg0YjVhYi4uOTRiOGM4ZTJjZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlf
MS4yMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjAuNC5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNFTlNFX0ZM
QUdTID0gImNvbW1lcmNpYWwiCiBTUkNfVVJJID0gIiBcCiAgICAgICAgICAgICBodHRwczovL2dz
dHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLXVnbHkvZ3N0LXBsdWdpbnMt
dWdseS0ke1BWfS50YXIueHogXAogICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjhjYWEyMDc4OWEwOWMzMDRiNDljZjU2M2QzM2NjYTk0MjFiMTg3NWI4NGZjYzE4N2U0YTM4NWZh
MDFkNmFlZmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWM5ZWM2YmFiOTY1MTdlNDM4YjNmOWJh
ZTBjZWI4NGQzNDM2ZjNkYTliYmUxODBjZjRkMjhlMzJhNzI1MWI1OSIKIAogUyA9ICIke1dPUktE
SVJ9L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0iCiAKLS0gCjIuMzEuMQoK

--===============7066649463958474713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-xingmux: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-xingmux: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.20.3 [default] to 1.20.4 [default]

--===============7066649463958474713==--

