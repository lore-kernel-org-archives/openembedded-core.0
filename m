Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF6C71155
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145434.1671136351237794782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fYPra4sD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d1082-36fc2a3f-d80c-476d-9e8d-89c2849741a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gh95cujfJrMCTMxwABg/dPmIJKGtfxA/rQtctL/9zUA=;
	b=fYPra4sDiTok352+HJl1MEDTtoG6n/7glndJSrYXY5hF0aBxuJbqTi6YQBFhl0vZ
	0vtBqMZsZpVoVEpX4xU93OfaHGlVqOA/P6XWQTbMCArURgirgW51W5ccaQsngQq6iLg
	awmjqiju4MlHn/KVrWIgLq/+u63VoUjFyuNigI9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gh95cujfJrMCTMxwABg/dPmIJKGtfxA/rQtctL/9zUA=;
	b=T114lnG1ZkerlK6m2lza0JZqFUneiasQ5XZoAePZS0HXn05hfunyRBQr1llYnunF
	Mt9e2dhYLl8B0mnauPlbkOr7z4PfLR08DBsISReJw5az8QuK5PP8RXfXXdTj5tlnOoc
	v4M1jqCdQNWrmqPdb6XKZjOgrGx1f9IEgKzUNgfE=
Content-Type: multipart/mixed; boundary="===============1172699589343496341=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.19.4 FAILED
Message-ID: <01010185177d1082-36fc2a3f-d80c-476d-9e8d-89c2849741a4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174635

--===============1172699589343496341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.19.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.19.3-1.19.4.patch
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
--===============1172699589343496341==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.19.3-1.19.4.patch"

RnJvbSBjMTY3MjhkYjBlOTgyZTc3OGUwYjg1YTA3NTYwYzRjZjA4NmUyMWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6MTk6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMTkuMyAtPiAxLjE5LjQKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL3tnby0xLjE5LjMuaW5jID0+IGdvLTEuMTkuNC5pbmN9ICAgICAgIHwgMiArLQog
Li4uL2dvL3tnby1ydW50aW1lXzEuMTkuMy5iYiA9PiBnby1ydW50aW1lXzEuMTkuNC5iYn0gICAg
ICAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tMS4xOS4zLmluYyA9PiBnby0x
LjE5LjQuaW5jfSAoODklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVu
dGltZV8xLjE5LjMuYmIgPT4gZ28tcnVudGltZV8xLjE5LjQuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjMuaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLTEuMTkuNC5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuMy5pbmMKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjQuaW5jCmluZGV4IDEyNDVmYWJhOTMuLjQ5MzQ5
YmE2ZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjMuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjQuaW5jCkBAIC0xNSw0ICsx
NSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwMS1zcmMtY21kLWRpc3QtYnVpbGRn
by5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vZmls
dGVyLWJ1aWxkLXBhdGhzLnBhdGNoIFwKICIKLVNSQ19VUklbbWFpbi5zaGEyNTZzdW1dID0gIjE4
YWMyNjNlMzkyMTBiY2Y2OGQ4NWY0MzcwZTk3ZmIxNzM0MTY2OTk1YTFmNjNmYjM4YjRmNmUwN2Q5
MGQyMTIiCitTUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICJlZGE3NGRiNGFjNDk0ODAwYTNlNjZl
ZTc4NGU0OTViZmJiOWI4ZTUzNWRmOTI0YThiMDFiMWE4MDI4YjdmMzY4IgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4xOS4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4xOS40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjE5LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMTkuNC5i
YgotLSAKMi4zNy4zCgo=

--===============1172699589343496341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.19.3.bb:4: Could not include required file go-1.19.3.inc
ERROR: Parsing halted due to errors, see error messages above

--===============1172699589343496341==--

