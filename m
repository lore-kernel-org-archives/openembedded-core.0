Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE471C64EC6
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30354.1675272854482428714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PwJhmxt6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b189e-a5b50a99-a065-41b2-95dc-7b48ab7c36fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uGPa7glMYUg0edhsxM8jN4g/gtI8+Xm9KFDCtFCbs9c=;
	b=PwJhmxt60fWVlZcKtGin5MoKvUobB6LoyCX/vwbpRtZulxSPcfjDvW+VgfGUcTLr
	cC+UxSB9vHAYfYnr5+uoj+soiTFABGx1YPDVsdtBLDRayxRxr2+b4kVz7RiWYWFas6C
	FzuseKnDyZ8ntf+X+i+AlGYEazjyevC+L6obK8Kc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uGPa7glMYUg0edhsxM8jN4g/gtI8+Xm9KFDCtFCbs9c=;
	b=KrxkC2SA3IlWUjTW8onBumYIAoiBcPLVwLqK5b9prBHmWsqHtnUxZyIj1cDBvOAh
	y83zbe25y8Wp0p8INKjfuoAEG2kmat0UcNhohMaWa+bhu7m/PQ+B1tUTc4aDRAELHW/
	g5F65B0BiOYuIctjnU0vpHyGfuL7uxHA/8CEd2e4=
Content-Type: multipart/mixed; boundary="===============5912639415726078081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.21.19 SUCCEEDED
Message-ID: <010101860e0b189e-a5b50a99-a065-41b2-95dc-7b48ab7c36fa-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176577

--===============5912639415726078081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.21.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.21.18-1.21.19.patch
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
--===============5912639415726078081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dpkg/dpkg-dbg: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dev: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-doc: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGSIZE changed from 295074 to 299302 (+1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGSIZE changed from 291013 to 294059 (+1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGSIZE changed from 655667 to 656731 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-src: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 995880 to 995904 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/dpkg: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/dpkg: PKGSIZE changed from 1479016 to 1478972 (-0%)
packages/core2-32-poky-linux/dpkg: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg: PKGV changed from 1.21.18 [default] to 1.21.19 [default]
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.21.18" to "1.21.19"
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.21.18 [default] to 1.21.19 [default]

--===============5912639415726078081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.21.18-1.21.19.patch"

RnJvbSBiNTE4ZjNhYzU1MDIwNjM4ZTZjMTA5ZDliNDljODVlNGJhZmFhODFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODozMzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRw
a2c6IHVwZ3JhZGUgMS4yMS4xOCAtPiAxLjIxLjE5CgotLS0KIC4uLi9kcGtnL2Rwa2cvMDAwMS1i
dWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaCB8IDIgKy0KIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kcGtnL3tkcGtnXzEuMjEuMTguYmIgPT4gZHBrZ18xLjIxLjE5LmJi
fSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL3tkcGtnXzEuMjEuMTguYmIgPT4g
ZHBrZ18xLjIxLjE5LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9y
ZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaAppbmRleCAxYjViODk2NDRmLi4xNjBhZGJi
ZTZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVp
bGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZy
b20tdGFyLWNmLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1NGNhMjBhMTgyNTNiY2YwOTE1
YjJlMjk4NWJiZWU3OWJmODgxZWJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNjhm
Y2YwZTIzYjkxZGNhN2ZlY2ZlZWNlYjFjNDI2N2UyOWU2ZjlkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUGF1bCBFZ2dsZXRvbiA8cGF1bC5lZ2dsZXRvbkBsaW51eC5taWNyb3NvZnQu
Y29tPgogRGF0ZTogVHVlLCAxNiBKdW4gMjAyMCAwMzo1NzoyNSArMDAwMAogU3ViamVjdDogW1BB
VENIXSBidWlsZC5jOiBpZ25vcmUgcmV0dXJuIG9mIDEgZnJvbSB0YXIgLWNmCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjEuMTguYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjEuMTkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjE4LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjEuMTkuYmIKaW5kZXggM2Ji
ODRhNDMzYS4uOGQwZWI0MGJkNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rw
a2cvZHBrZ18xLjIxLjE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2df
MS4yMS4xOS5iYgpAQCAtMTgsNiArMTgsNiBAQCBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlh
bi5vcmcvZHBrZy10ZWFtL2Rwa2cuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluCiAKIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtYnVpbGQuYy1pZ25vcmUt
cmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2giCiAKLVNSQ1JFViA9ICJlYmMyYzNkZWYzMzVh
YzM5MWIwMTAzMjNhYjY1YTMwMjY0OGYzZWM3IgorU1JDUkVWID0gIjJmMzEwNTI3OWUwZmIyMjU1
ZjM5YjJlOWExMWYxNTgzN2NhY2Q0NGIiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjM3
LjMKCg==

--===============5912639415726078081==--

