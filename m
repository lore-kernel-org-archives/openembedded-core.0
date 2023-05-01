Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F07C7EE2A
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.107416.1682976348797068934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BbtyccHg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9351726-50544ecc-f037-46fd-9c24-dbf0a7ed7f1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qh0hpzWR35o7emMqk2hgTX/DqWYAsLwc1e4grpWuSRI=;
	b=BbtyccHg+o+taiY3UekAgu+Cj8uWhhy8ZRGudN/lzB4wFNKfHB0Ld6ydzHvKZvRi
	c5157rk1p6euqN7LEGKmuoPDzZ73kQ2MFFH1MhjglFYjxjs+n3qVJ15lRpaCO/inHGp
	f9fwm+XP8n00Ggqaif3ww09vO2J6kTjVWUeO0IW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qh0hpzWR35o7emMqk2hgTX/DqWYAsLwc1e4grpWuSRI=;
	b=FAQwBsana8eRkA26hGu0An/YdN7JPhTgb/uUvPuFF4/ulUGIkL/eGxIzsJNPw0+V
	awtFXJM11I0jcTOnGBWOb78Yd6rsB73473AlKnApZG6KD5eeDDJLcYs6dj0sXYeooUy
	V8YdGE7cJhKtTVU1pgQmgJPrIV263Bg5sg07jsLY=
Content-Type: multipart/mixed; boundary="===============4824624925928892007=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20230416 SUCCEEDED
Message-ID: <01010187d9351726-50544ecc-f037-46fd-9c24-dbf0a7ed7f1d-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180589

--===============4824624925928892007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mobile-broadband-provider-info* to *20230416* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20221107-2023.patch
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
--===============4824624925928892007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 518766 to 521960 (+1%)
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]

--===============4824624925928892007==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20221107-2023.patch"

RnJvbSA5YzRkYWFmOTg2NmJiNjljNjYyNjU4MzdmOGM5MmMxNDVjNzcyOGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwNjo1NDo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbzogdXBncmFkZSAyMDIyMTEwNyAtPiAyMDIzMDQx
NgoKLS0tCiAuLi4vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYiAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9i
aWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5m
b19naXQuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJv
dmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fZ2l0LmJiCmluZGV4IGU4
MDJiY2VlMTguLmE0MDMwYjdiMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mb19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5i
YgpAQCAtNSw4ICs1LDggQEAgU0VDVElPTiA9ICJuZXR3b3JrIgogTElDRU5TRSA9ICJQRCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTg3OTY0NTc5YjJhOGVjZTRiYzY3
NDRkMmRjOWE4YjA0IgogCi1TUkNSRVYgPSAiMjJhNWRlM2VmNjM3OTkwY2UwMzE0MWY3ODZmYmRi
MzI3ZTljNWEzZiIKLVBWID0gIjIwMjIxMTA3IgorU1JDUkVWID0gImFhZTdjNjg2NzFkMjI1ZTZk
MzUyMjQ2MTNkNWI5ODE5MmI5YjJmZmUiCitQViA9ICIyMDIzMDQxNiIKIFBFID0gIjEiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2JpbGUtYnJvYWRiYW5kLXBy
b3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotLSAKMi4zOS4yCgo=

--===============4824624925928892007==--

