Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2CEC77B60
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30004.1675272854805528539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OhwMVCFj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b19aa-cf86dc46-67a9-4de1-a62a-8e9b395dae83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7Ys3SbmgKChMXAkAygzheyRhvWOSfsqrh2lvtrnSDWQ=;
	b=OhwMVCFjopQniokY42x7q6hq6Iwl9xwgYpf8XX/wPs/AU64+vqOcUH+/0NYGiFAA
	bK/moeMEFu1o85iEqx2fP/IF0VmPEZqZBIk61eZCz4HMiTboAu35pXM5ShdleJy7sGf
	UYb8RMtUdG8ZNs6GRGcM/HGIEcmYc3KPik9NtqCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7Ys3SbmgKChMXAkAygzheyRhvWOSfsqrh2lvtrnSDWQ=;
	b=OHXM9/OuVGRMkOPdDqKOs7B3CjE0tonkChGNFVHVdATfxqpCF1Lx3PWGiLyuZPY1
	QR7x0B0mt2xgZ0RJL6CKZOSxwo0DFPj7PRXNznjX6TYsGuStN69D3Wz7CR2/roE4hFy
	ZaV9eR5Tq6Of7NZjMtEB9gplpD7A6b4M7GYR30JI=
Content-Type: multipart/mixed; boundary="===============1748053672039805930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.19.5 FAILED
Message-ID: <010101860e0b19aa-cf86dc46-67a9-4de1-a62a-8e9b395dae83-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176595

--===============1748053672039805930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.19.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.19.4-1.19.5.patch
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
--===============1748053672039805930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.19.4-1.19.5.patch"

RnJvbSA1YWY5NGRiZGJiMWU1ZjNkMGI1YTMxOWQxNDFlMmMyNWM0YTZhODM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODo1MToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
OiB1cGdyYWRlIDEuMTkuNCAtPiAxLjE5LjUKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dv
L3tnby0xLjE5LjQuaW5jID0+IGdvLTEuMTkuNS5pbmN9IHwgMiArLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL3tnb18xLjE5LjQuYmIgPT4gZ29fMS4xOS41LmJifSAgIHwgMAogMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9nby97Z28tMS4xOS40LmluYyA9PiBnby0xLjE5LjUuaW5jfSAoODklKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z29fMS4xOS40LmJiID0+IGdvXzEuMTkuNS5i
Yn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTku
NC5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4xOS41LmluYwpzaW1pbGFyaXR5
IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4xOS40
LmluYwpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNS5pbmMKaW5k
ZXggNDkzNDliYTZlYy4uMjdhZjAwYmMwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dvL2dvLTEuMTkuNC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEu
MTkuNS5pbmMKQEAgLTE1LDQgKzE1LDQgQEAgU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly8wMDAx
LXNyYy1jbWQtZGlzdC1idWlsZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0
Y2ggXAogICAgIGZpbGU6Ly9maWx0ZXItYnVpbGQtcGF0aHMucGF0Y2ggXAogIgotU1JDX1VSSVtt
YWluLnNoYTI1NnN1bV0gPSAiZWRhNzRkYjRhYzQ5NDgwMGEzZTY2ZWU3ODRlNDk1YmZiYjliOGU1
MzVkZjkyNGE4YjAxYjFhODAyOGI3ZjM2OCIKK1NSQ19VUklbbWFpbi5zaGEyNTZzdW1dID0gIjhl
NDg2ZThlODVhMjgxZmM1Y2UzZjBiZWRjNWI5ZDJkYmY2Mjc2ZDdkYjBiMjVkM2VjMDM0ZjMxM2Rh
MDM3NWYiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ29fMS4xOS40LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMTkuNS5iYgpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMTkuNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMTkuNS5iYgotLSAKMi4zNy4z
Cgo=

--===============1748053672039805930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.19.4.bb:1: Could not include required file go-1.19.4.inc
ERROR: Parsing halted due to errors, see error messages above

--===============1748053672039805930==--

