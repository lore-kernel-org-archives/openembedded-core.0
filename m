Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A53EC7618E
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.145828.1673805743513601849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RnE3zY4K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185b698c1b5-1d5ae2d2-7133-4430-a40a-08981c62d3b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dk8RhXYLoCPcLynosTovW2PTMLtgjzvqWrb0Mc5WoDI=;
	b=RnE3zY4Kaxco51eUYEAuLOV0oy9VLsVWPkN+83pBjKg2Pl8hV2VNp9qdHbIGiilm
	ec5bjQVvMA1dZoyRhnXbWWaXIvl8MPWdqJZOt8Azl0+YBRHizrSGAn0gkTSWyCKNTd9
	VdssTW71Styaj0NfVi5ySzTIg5GcH0Pw3wgdxpzY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dk8RhXYLoCPcLynosTovW2PTMLtgjzvqWrb0Mc5WoDI=;
	b=L4c6DGaaqsywCkMMkqD/D6ten/xUnkID88LP8oQ//88H7sx9RQhewOIFjxQmrNEV
	a8X42pCgR3/1bWYIhbRQ4X9cDKTnJzPj6h42vxrmxnkF8q4ef5VRswiUJdcttC7At5f
	jXtkCkl2tS1HhhYXnFo1e3auBQgQiKmqWSKw1jd8=
Content-Type: multipart/mixed; boundary="===============6143694764167645455=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.19.5 FAILED
Message-ID: <01010185b698c1b5-1d5ae2d2-7133-4430-a40a-08981c62d3b8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175901

--===============6143694764167645455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.19.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.19.4-1.19.5.patch
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
--===============6143694764167645455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.19.4.bb:1: Could not include required file go-1.19.4.inc
ERROR: Parsing halted due to errors, see error messages above

--===============6143694764167645455==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.19.4-1.19.5.patch"

RnJvbSBkYmRlMjZkZTk5Yjk3NzZlZjAzNzAwOGIwMTNmMDgwMWY3MWQzODQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDc6NTg6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMTkuNCAtPiAxLjE5LjUKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL3tnby0xLjE5LjQuaW5jID0+IGdvLTEuMTkuNS5pbmN9ICAgICAgIHwgMiArLQog
Li4uL2dvL3tnby1ydW50aW1lXzEuMTkuNC5iYiA9PiBnby1ydW50aW1lXzEuMTkuNS5iYn0gICAg
ICAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tMS4xOS40LmluYyA9PiBnby0x
LjE5LjUuaW5jfSAoODklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVu
dGltZV8xLjE5LjQuYmIgPT4gZ28tcnVudGltZV8xLjE5LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjQuaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLTEuMTkuNS5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNC5pbmMKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjUuaW5jCmluZGV4IDQ5MzQ5YmE2ZWMuLjI3YWYw
MGJjMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjUuaW5jCkBAIC0xNSw0ICsx
NSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwMS1zcmMtY21kLWRpc3QtYnVpbGRn
by5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vZmls
dGVyLWJ1aWxkLXBhdGhzLnBhdGNoIFwKICIKLVNSQ19VUklbbWFpbi5zaGEyNTZzdW1dID0gImVk
YTc0ZGI0YWM0OTQ4MDBhM2U2NmVlNzg0ZTQ5NWJmYmI5YjhlNTM1ZGY5MjRhOGIwMWIxYTgwMjhi
N2YzNjgiCitTUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICI4ZTQ4NmU4ZTg1YTI4MWZjNWNlM2Yw
YmVkYzViOWQyZGJmNjI3NmQ3ZGIwYjI1ZDNlYzAzNGYzMTNkYTAzNzVmIgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4xOS40LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4xOS41LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjE5LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMTkuNS5i
YgotLSAKMi4zNy4zCgo=

--===============6143694764167645455==--

