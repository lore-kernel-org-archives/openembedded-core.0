Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6B0C7EE43
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12296.1678895725912462232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c3N/DKg2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbba19-46a58ff6-af66-44bc-a01e-cc0f36f4198e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FFa78wFvhTIME8p9NnA/2ZMNViKgXI1l0OT09Dm82wU=;
	b=c3N/DKg2Kkk/kUoi8reBXf/uLFGeTexHSuyswezzv+JaOX9qrgTNAkKHNhxaSCRL
	Q61Iv1a4lUlktO1tyz+LGBgNLEkKuA5J5vMIcdiKZTQsZG2eZB2wbmReIIUVEf53BYr
	tErymCaJkxBnfPrhe6o2IcRkTp2JTU8mD32eLJ48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FFa78wFvhTIME8p9NnA/2ZMNViKgXI1l0OT09Dm82wU=;
	b=V6gs8XLp5bfCB0HwNKc/AQpwm8+5ec4+clsdQrNJvywX9RT8fihnejsez0UdWgDz
	6I8JXoU+GXQuDhg0LM0H09YRISIDpegRhaGtHkNZEqH2zuD39sgp0OwaTf1AkwSxyEk
	0JuikPfzBbxpoh886nj+wFBL7Q1Vpw+o9lIsP4GI=
Content-Type: multipart/mixed; boundary="===============8231319512948112652=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.20.2 FAILED
Message-ID: <01010186e5fbba19-46a58ff6-af66-44bc-a01e-cc0f36f4198e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178594

--===============8231319512948112652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.20.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.20.1-1.20.2.patch
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
--===============8231319512948112652==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.20.1-1.20.2.patch"

RnJvbSA0OTUyNWM3ODQ4ZDk4OGUwYmE4Y2ZiODhiZTYwNTEwYWE1MjlhOTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6NDU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMjAuMSAtPiAxLjIwLjIKCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL3tnby0xLjIwLjEuaW5jID0+IGdvLTEuMjAuMi5pbmN9ICAgICAgIHwgMiArLQog
Li4uL2dvL3tnby1ydW50aW1lXzEuMjAuMS5iYiA9PiBnby1ydW50aW1lXzEuMjAuMi5iYn0gICAg
ICAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tMS4yMC4xLmluYyA9PiBnby0x
LjIwLjIuaW5jfSAoODklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVu
dGltZV8xLjIwLjEuYmIgPT4gZ28tcnVudGltZV8xLjIwLjIuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjEuaW5jIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLTEuMjAuMi5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuMS5pbmMKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjIuaW5jCmluZGV4IGFhM2UyZGFkZjEuLjc3NGE5
YTAwODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjEuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjIuaW5jCkBAIC0xNSw0ICsx
NSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRn
by5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vMDAw
OS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaCBc
CiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICJiNWMxYTNhZjUyYzM4NWE2ZDFjNzZhZWQ1
MzYxY2YyNjQ1OTAyMzk4MGQwMzIwZGU3NjU4YmFlMzkxNTgzMWEyIgorU1JDX1VSSVttYWluLnNo
YTI1NnN1bV0gPSAiNGQwZTI4NTBkMTk3YjRkZGFkM2JkYjAxOTYzMDAxNzlkMDk1YmIzYWVmZDRk
ZmJjM2IzNjcwMmMzNzI4ZjhhYiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby1ydW50aW1lXzEuMjAuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50
aW1lXzEuMjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4yMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjIwLjIuYmIKLS0gCjIuMzkuMgoK

--===============8231319512948112652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.1.bb:1: Could not include required file go-1.20.1.inc
ERROR: Parsing halted due to errors, see error messages above

--===============8231319512948112652==--

