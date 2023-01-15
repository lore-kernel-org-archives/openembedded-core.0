Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF69C761AF
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145711.1673805743381013069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IXQVCbd3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185b698c191-193cef60-2ad9-459d-9ac8-952172c2cc25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TlwGOJJIRB92R4bT5nztzypwAz9hmvNZfGebNGpAmgo=;
	b=IXQVCbd385nvqceSk8GIOmy8iStOPadwOwktn/Mx7VZTlqj0rviXZYpg9uz8BjkK
	mEHws/crlOCKg20oKxDvajyc8PlOt6f8IilJbXM4+RDMXASd9+ID5zgfT2LdsoQcauq
	MJEAbfldmH8AwXZIKLYRo66zbchdfSoFHLnYNICA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TlwGOJJIRB92R4bT5nztzypwAz9hmvNZfGebNGpAmgo=;
	b=APzT2fdxje3MdFum3j35Jg1pZkKsLZYD28XK7+nWdxxLdUAu4TE4x8raXqbvY8ug
	MsomXZQo/dMio5Qv5WFyLCA9bOf3MrEVmuh90BQlknXoKN3cCDdDIePoU0ASkjvGAN2
	5d2h3vQRZrDZvfMTBxLfkEyWqJt8xHx394en3shE=
Content-Type: multipart/mixed; boundary="===============7248013946297768687=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.19.5 FAILED
Message-ID: <01010185b698c191-193cef60-2ad9-459d-9ac8-952172c2cc25-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175894

--===============7248013946297768687==
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
--===============7248013946297768687==
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
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.19.4.bb:4: Could not include required file go-1.19.4.inc
ERROR: Parsing halted due to errors, see error messages above

--===============7248013946297768687==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.19.4-1.19.5.patch"

RnJvbSBhN2M2OTA4OTZiZjRiY2EyMDgyMDQ0MzViNDI5YzJmOGIwZmY4ZmYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDg6MDA6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjE5LjQgLT4gMS4xOS41CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by97Z28tMS4xOS40LmluYyA9PiBnby0xLjE5LjUuaW5jfSB8IDIgKy0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby97Z29fMS4xOS40LmJiID0+IGdvXzEuMTkuNS5iYn0gICB8IDAKIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28ve2dvLTEuMTkuNC5pbmMgPT4gZ28tMS4xOS41LmluY30gKDg5JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMTkuNC5iYiA9PiBnb18xLjE5LjUu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5
LjQuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNS5pbmMKc2ltaWxhcml0
eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTku
NC5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjUuaW5jCmlu
ZGV4IDQ5MzQ5YmE2ZWMuLjI3YWYwMGJjMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nby9nby0xLjE5LjQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0x
LjE5LjUuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAw
MS1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBh
dGNoIFwKICAgICBmaWxlOi8vZmlsdGVyLWJ1aWxkLXBhdGhzLnBhdGNoIFwKICIKLVNSQ19VUklb
bWFpbi5zaGEyNTZzdW1dID0gImVkYTc0ZGI0YWM0OTQ4MDBhM2U2NmVlNzg0ZTQ5NWJmYmI5Yjhl
NTM1ZGY5MjRhOGIwMWIxYTgwMjhiN2YzNjgiCitTUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICI4
ZTQ4NmU4ZTg1YTI4MWZjNWNlM2YwYmVkYzViOWQyZGJmNjI3NmQ3ZGIwYjI1ZDNlYzAzNGYzMTNk
YTAzNzVmIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMTkuNC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjUuYmIKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjUuYmIKLS0gCjIuMzcu
MwoK

--===============7248013946297768687==--

