Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A5DC88CB4
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.7544.1685693435602470771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XFQARTDm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b288cd9-58273c04-6be1-4d59-b53d-473cf623b7ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ZRkpnAuVLxQo5dBuB7ktCm8+bLJD9vKFEtK9Xfr+hI4=;
	b=XFQARTDm66bbOGQvhd7+ff3+dfDzJOK+R8JSjyyyJ2cQkYaYuxQ2Ik5wTxOELouS
	VrNjxXdE4NMXhDJWWs5ljp2wzd/0CowZ3+Qx9Sn3P9M3cn1QHpLrcZnltiB25tNE84F
	SVDY/mg3wuHKwh/4RFJh8rxXYEO3X9k0kN7flXz8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ZRkpnAuVLxQo5dBuB7ktCm8+bLJD9vKFEtK9Xfr+hI4=;
	b=MDXCS5qsJi696zBdZN6XGr2egirprYnZEp9htAeEAdqhqSncX3zuGlHUZQIuPan7
	ERdT8x+rRoeUB6D7VF3U1TPlfNmbkzHHr38pr0zs+K4p0YUIVD9ncyvFUSmpNhVERHF
	o91iwUhYzllCVNOENkiHYKP6b53FBB4kBJZHdh4A=
Content-Type: multipart/mixed; boundary="===============7212670065620779018=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-mouse: upgrading to 1.9.5 SUCCEEDED
Message-ID: <010101887b288cd9-58273c04-6be1-4d59-b53d-473cf623b7ad-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182248

--===============7212670065620779018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-mouse* to *1.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-mouse-upgrade-1.9.4-1.9.5.patch
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
--===============7212670065620779018==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-mouse-upgrade-1.9.4-1.9.5.patch"

RnJvbSA5MmRiYzlhNGQzNGE4Y2QwNjA4MmUwYTNkMDBlMDM5MDRkM2U4YjFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMjoxMjoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
ODYtaW5wdXQtbW91c2U6IHVwZ3JhZGUgMS45LjQgLT4gMS45LjUKCi0tLQogLi4udXNlXzEuOS40
LmJiID0+IHhmODYtaW5wdXQtbW91c2VfMS45LjUuYmJ9IHwgMjQgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3t4Zjg2LWlucHV0LW1vdXNlXzEu
OS40LmJiID0+IHhmODYtaW5wdXQtbW91c2VfMS45LjUuYmJ9ICgzMyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjQu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1tb3VzZV8x
LjkuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDMzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1tb3VzZV8xLjkuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjUuYmIK
aW5kZXggMTkxOTg3NDk0ZS4uMWM0YWJmY2Q2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjUuYmIKQEAg
LTEsMyArMSwyMyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJ
TkcKKyMgQEAgLTEsNSArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMDQtMjAwNSwgMjAwOC0y
MDEwLCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorIyAtQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KKyMgK0NvcHlyaWdodCAoYykgMjAwNCwgMjAyMiwgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxp
YXRlcy4KKyMgIENvcHlyaWdodCAyMDEyIFJlZCBIYXQsIEluYy4KKyMgIAorIyAgUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWlu
aW5nIGEKKyMgCisjCisKIHJlcXVpcmUgeG9yZy1kcml2ZXItaW5wdXQuaW5jCiAKIFNVTU1BUlkg
PSAiWC5PcmcgWCBzZXJ2ZXIgLS0gbW91c2UgaW5wdXQgZHJpdmVyIgpAQCAtOCw3ICsyOCw3IEBA
IGZ1bmN0aW9ucyBhcyBhIHBvaW50ZXIgaW5wdXQgZGV2aWNlLCBhbmQgbWF5IGJlIHVzZWQgYXMg
dGhlIFggc2VydmVyJ3MgXAogY29yZSBwb2ludGVyLiBNdWx0aXBsZSBtaWNlIGFyZSBzdXBwb3J0
ZWQgYnkgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIHRoaXMgXAogZHJpdmVyLiIKIAotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTBlYTlmOTBkNzJiNmQ5MzI3ZGVkZTVmZmRi
MmE1MTAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMjEzYTY5MDUz
ZGZmZTliY2FiOTRhYmY2MDAxM2QzMyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmNmY4NTUx
ZmMyMzhhYmRkZGNmOWYzODkwNjU2NGMxZjhjN2RhY2IwYWQ5NDdjZmMxMTA0ODdhZWZiZDhkNGMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGZkZThhZTliNDQzNTJlMmEyMDg1ODRjMzY1MjhlZTNl
ZDEzY2Y1ZmU0NDE3MjA4YTk3ODVkYWNjZWZkOTk2OCIKIFhPUkdfRFJJVkVSX0NPTVBSRVNTT1Ig
PSAiLnRhci54eiIKLS0gCjIuMzkuMgoK

--===============7212670065620779018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-mouse: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-mouse-1.9.4.tar.xz" to "https://www.x.org/releases//individual/driver/xf86-input-mouse-1.9.5.tar.xz"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dbg: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dbg: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PKGSIZE changed from 1694 to 1673 (-1%)
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-doc: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-doc: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-locale: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-locale: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-src: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-src: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-staticdev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-staticdev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse: PKGV changed from 1.9.4 [default] to 1.9.5 [default]

--===============7212670065620779018==--

