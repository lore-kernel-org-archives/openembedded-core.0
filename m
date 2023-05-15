Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F069C87FF2
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.3776.1684186750882654436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RwOumZib;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a5d36-86139a0c-1323-4769-95a3-ee6e872e31ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2Q/7eVrJSYBbAa0oRYchRdYRbuUZs2yMDDyoybezDZI=;
	b=RwOumZibnKH4udwAM1BRXPfvGs84KcL4CccTW/yF2Q7qXGErqN5Fc6ogiehOU8SD
	pMcpZJY3Ij9PK6u20yyCbbGZjowBp77U+ObXGqTOB5/bJpWFng+g9iDEkSvvpiDK+CL
	SQ41phzPe9RlVeIu+6XbSkhR582GAtFrofiGp83U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2Q/7eVrJSYBbAa0oRYchRdYRbuUZs2yMDDyoybezDZI=;
	b=iiAU11aNFogF7p1AcMyxv/R5GkhNXwuVkuDE+FuLgaY51Fth5/uhr8hIr7EbF6DN
	zWBMoUbaxhZuRSrq3+jDhU93cufmkVcZdm+M7JkEqTM+5ZIPOtJKVFiILE8+ZMGD2IK
	Au21G3cm/qWm2m43QdWASuWXU0mO1jh9C7lUXnbw=
Content-Type: multipart/mixed; boundary="===============4457127497140640353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-mouse: upgrading to 1.9.5 SUCCEEDED
Message-ID: <01010188215a5d36-86139a0c-1323-4769-95a3-ee6e872e31ca-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181366

--===============4457127497140640353==
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
--===============4457127497140640353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-mouse: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-mouse-1.9.4.tar.xz" to "https://www.x.org/releases//individual/driver/xf86-input-mouse-1.9.5.tar.xz"
packages/core2-32-poky-linux/xf86-input-mouse: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dbg: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dbg: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PKGSIZE changed from 1694 to 1673 (-1%)
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-dev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-doc: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-doc: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-locale: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-locale: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-src: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-src: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-staticdev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse-staticdev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/xf86-input-mouse/xf86-input-mouse: PV changed from "1.9.4" to "1.9.5"

--===============4457127497140640353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-mouse-upgrade-1.9.4-1.9.5.patch"

RnJvbSA4N2I5MDk5MmE1MzdmN2Y1ZGZmN2JjYTU0N2I5N2E0MTAyZmI3ZTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6NDM6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Zjg2LWlucHV0LW1vdXNlOiB1cGdyYWRlIDEuOS40IC0+IDEuOS41CgotLS0KIC4uLnVzZV8xLjku
NC5iYiA9PiB4Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJifSB8IDI0ICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci97eGY4Ni1pbnB1dC1tb3VzZV8x
LjkuNC5iYiA9PiB4Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJifSAoMzMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS40
LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2Vf
MS45LjUuYmIKc2ltaWxhcml0eSBpbmRleCAzMyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjQuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJi
CmluZGV4IDE5MTk4NzQ5NGUuLjFjNGFiZmNkNjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS40LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJiCkBA
IC0xLDMgKzEsMjMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZ
SU5HCisjIEBAIC0xLDUgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA0LTIwMDUsIDIwMDgt
MjAxMCwgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4KKyMgLUFsbCByaWdodHMgcmVzZXJ2
ZWQuCisjICtDb3B5cmlnaHQgKGMpIDIwMDQsIDIwMjIsIE9yYWNsZSBhbmQvb3IgaXRzIGFmZmls
aWF0ZXMuCisjICBDb3B5cmlnaHQgMjAxMiBSZWQgSGF0LCBJbmMuCisjICAKKyMgIFBlcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhCisjIAorIworCiByZXF1aXJlIHhvcmctZHJpdmVyLWlucHV0LmluYwogCiBTVU1NQVJZ
ID0gIlguT3JnIFggc2VydmVyIC0tIG1vdXNlIGlucHV0IGRyaXZlciIKQEAgLTgsNyArMjgsNyBA
QCBmdW5jdGlvbnMgYXMgYSBwb2ludGVyIGlucHV0IGRldmljZSwgYW5kIG1heSBiZSB1c2VkIGFz
IHRoZSBYIHNlcnZlcidzIFwKIGNvcmUgcG9pbnRlci4gTXVsdGlwbGUgbWljZSBhcmUgc3VwcG9y
dGVkIGJ5IG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGlzIFwKIGRyaXZlci4iCiAKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTkwZWE5ZjkwZDcyYjZkOTMyN2RlZGU1ZmZk
YjJhNTEwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDIxM2E2OTA1
M2RmZmU5YmNhYjk0YWJmNjAwMTNkMzMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZjZmODU1
MWZjMjM4YWJkZGRjZjlmMzg5MDY1NjRjMWY4YzdkYWNiMGFkOTQ3Y2ZjMTEwNDg3YWVmYmQ4ZDRj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRmZGU4YWU5YjQ0MzUyZTJhMjA4NTg0YzM2NTI4ZWUz
ZWQxM2NmNWZlNDQxNzIwOGE5Nzg1ZGFjY2VmZDk5NjgiCiBYT1JHX0RSSVZFUl9DT01QUkVTU09S
ID0gIi50YXIueHoiCi0tIAoyLjM5LjIKCg==

--===============4457127497140640353==--

