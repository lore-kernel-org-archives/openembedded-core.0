Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87157C7EE39
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.12297.1678895726020367521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d26X/9eA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010186e5fbb9bd-a459c74d-17c8-49a2-a5ab-994607360625-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IAe+V6YetYJDS9drTJtyn1zvPJIFMY0QViOH3o7nryE=;
	b=d26X/9eAib7PZU6u2PwodZ0bROEwIHkOflBLV5czcSVkgPuz46r1anvwonWC3z1h
	T9hWQSI2plJbAWDgi+ZnnZWdGE/pqQuU7sCFlhLrgTt2MWcZBY2dycnR2eH1ugD9fW5
	CVcuKFhrYHoXJ47tEKgujOhFb3V10L725UhpVc44=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IAe+V6YetYJDS9drTJtyn1zvPJIFMY0QViOH3o7nryE=;
	b=YIeRlm+EH67N7NLHKncRIcq58rPP7KCXw4MdyOQgAcw9miyR9raIDS99Ll1TUYEo
	JCMkfRS4cyK6WXWRjnOHQ5X9fSvpyWPu/goSW2+hOzzR80b8QSMMGSRT+D3ZxCh3RYM
	A0Qij645CoNyoAUhzCj3tSr8gcYIc14I3QfIeiFg=
Content-Type: multipart/mixed; boundary="===============8155916644569883812=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.20.2 FAILED
Message-ID: <01010186e5fbb9bd-a459c74d-17c8-49a2-a5ab-994607360625-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178598

--===============8155916644569883812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.20.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.20.1-1.20.2.patch
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
--===============8155916644569883812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.1.bb:1: Could not include required file go-1.20.1.inc
ERROR: Parsing halted due to errors, see error messages above

--===============8155916644569883812==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.20.1-1.20.2.patch"

RnJvbSA2MTYwOTNhMGJlYmY4NTM2NTIwOTQzNjU0YWJjYzhmMTRiYzFkMzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6NDg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjIwLjEgLT4gMS4yMC4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by97Z28tMS4yMC4xLmluYyA9PiBnby0xLjIwLjIuaW5jfSB8IDIgKy0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby97Z29fMS4yMC4xLmJiID0+IGdvXzEuMjAuMi5iYn0gICB8IDAKIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28ve2dvLTEuMjAuMS5pbmMgPT4gZ28tMS4yMC4yLmluY30gKDg5JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMjAuMS5iYiA9PiBnb18xLjIwLjIu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIw
LjEuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuMi5pbmMKc2ltaWxhcml0
eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAu
MS5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIwLjIuaW5jCmlu
ZGV4IGFhM2UyZGFkZjEuLjc3NGE5YTAwODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nby9nby0xLjIwLjEuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0x
LjIwLjIuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAw
OC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBh
dGNoIFwKICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHkt
bGlua2VkLWFyY2hlcy5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICJiNWMx
YTNhZjUyYzM4NWE2ZDFjNzZhZWQ1MzYxY2YyNjQ1OTAyMzk4MGQwMzIwZGU3NjU4YmFlMzkxNTgz
MWEyIgorU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiNGQwZTI4NTBkMTk3YjRkZGFkM2JkYjAx
OTYzMDAxNzlkMDk1YmIzYWVmZDRkZmJjM2IzNjcwMmMzNzI4ZjhhYiIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjIwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ28vZ29fMS4yMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ29fMS4yMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ28vZ29fMS4yMC4yLmJiCi0tIAoyLjM5LjIKCg==

--===============8155916644569883812==--

