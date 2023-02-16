Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5013EC77B6E
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10147.1676508396335718441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KSZS9saP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657aff610-cac36c6c-9074-44b5-9589-3dd88d02c739-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4H3gHuaJGySUZ6LIUpv88HxBqXieqVmFMI7PZJAMIwA=;
	b=KSZS9saPyCpMg5V3r2SbbKijGbr1rX2oKEExkF12VDEtCXveWPOFeFbDj+J69nM+
	ZwYK385hqxMMWKFHwPe/jnwqoHsXhDi7ffDR7ZkRb0YjQ069k8MAK3TCw/K2jRDN06g
	1+Nsn/m/i3GkYFnWby+mmMnmGpwYx+LHrdEhSqu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4H3gHuaJGySUZ6LIUpv88HxBqXieqVmFMI7PZJAMIwA=;
	b=YLvGbhAcKDYMbIWTM6rHAwHltfSlwXWicKeCIpvoU7LOx2hN0WjBFNrcfsgHyJx3
	jrfgjU/U04HeoPBabWXSBvNuw8fXYSnOEDLCUx+hpE22RamrgMacIw0EhSLkbl12UUk
	FyiI3bpUTzBB0RHLzeFhGWl9Fj3ENink4fgbIpUU=
Content-Type: multipart/mixed; boundary="===============9012751200640253332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.20.1 FAILED
Message-ID: <0101018657aff610-cac36c6c-9074-44b5-9589-3dd88d02c739-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177232

--===============9012751200640253332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.20.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.20-1.20.1.patch
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
--===============9012751200640253332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.20-1.20.1.patch"

RnJvbSA1YzdhODkxZjkxMTg5NWQ3MDEzMzI2N2E4NTVhNjI2YWZmMDdjOWFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6MDU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMjAgLT4gMS4yMC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nby97Z28tMS4yMC5pbmMgPT4gZ28tMS4yMC4xLmluY30gICAgICAgICB8IDIgKy0KIC4u
Li9nby97Z28tcnVudGltZV8xLjIwLmJiID0+IGdvLXJ1bnRpbWVfMS4yMC4xLmJifSAgICAgICAg
ICAgICB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvLTEuMjAuaW5jID0+IGdvLTEuMjAu
MS5pbmN9ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1ydW50aW1l
XzEuMjAuYmIgPT4gZ28tcnVudGltZV8xLjIwLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nby9nby0xLjIwLjEuaW5jCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLmluYwpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL2dvLTEuMjAuMS5pbmMKaW5kZXggMTM5ZjhkMWYzYy4uYWEzZTJkYWRmMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjEuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19V
UkkgKz0gIlwKICAgICBmaWxlOi8vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3Qt
aGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXIt
YnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaCBcCiAiCi1TUkNfVVJJ
W21haW4uc2hhMjU2c3VtXSA9ICIzYTI5ZmYwNDIxYmVhZjYzMjkyOTJiOGE0NjMxMWM5ZmJmMDZj
ODAwMDc3Y2VkZGVmNWZiN2Y4ZDViMWFjZTMzIgorU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAi
YjVjMWEzYWY1MmMzODVhNmQxYzc2YWVkNTM2MWNmMjY0NTkwMjM5ODBkMDMyMGRlNzY1OGJhZTM5
MTU4MzFhMiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1l
XzEuMjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjIwLjEuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby1ydW50aW1lXzEuMjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by1ydW50aW1lXzEuMjAuMS5iYgotLSAKMi4zNy4zCgo=

--===============9012751200640253332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.bb:1: Could not include required file go-1.20.inc
ERROR: Parsing halted due to errors, see error messages above

--===============9012751200640253332==--

