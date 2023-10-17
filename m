Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D252DCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 15:46:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.221540.1697557560772620827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 08:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z5TGfmwi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B247A240007;
	Tue, 17 Oct 2023 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697557559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wyKoVOG0Nx/tBo52R78ekQGIDUlohfx5Ei4hbTkobv8=;
	b=Z5TGfmwiCGPVNlem0QzVKjcEt0v9myLB4iwXGQnLOpsEIouhiCjyEeNup736SDSSdScYdP
	35L3P4+0owGRTK4Abb0Myl2yM3JBwwkp72YkD746T9D2fU+jNWL23X3/zNT2d22BGKBcAi
	b9FX8re5HjzU0tqgg4KSr31FaivmtdEoHqh100cU51P8OXioxNSEfn2y7GHRnY+Nm4t50n
	RVUhZ29aJknF+rq+zKG7zXUy740++/wZoOzd5FJj5W97SA+UldNHbcWFsOjVJ15ntEAu7A
	F/TDgkdqCd7BBjvd2mCmnlUCB7voL7uopUg+jFb3eP8azlafJiEtKb4SJBezGw==
Content-Type: multipart/mixed; boundary="------------xsye9u2Og0GdAEX92ogha4Tb"
Message-ID: <cf924d75-68ee-4a34-aa9b-dea215a1a581@bootlin.com>
Date: Tue, 17 Oct 2023 17:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 0/4] patchtest: add to oe-core
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016194458.2243201-1-tgamblin@baylibre.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189342

This is a multi-part message in MIME format.
--------------xsye9u2Og0GdAEX92ogha4Tb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Trevor

On 16.10.23 at 21:44, Trevor Gamblin wrote:
> Add the patchtest core tools and supporting scripts to
> openembedded-core. This will enable users to validate their changes
> locally against the repository before submission to the mailing list,
> reducing maintainer overhead and encouraging more consistent use of
> important patch tags and information. Note that there are a few elements
> of the tooling that are still under development, namely the
> patchtest-send-results script, which is currently hard-coded to mail
> test results to test-list@lists.yoctoproject.org (and only that list),
> while in the future it may be adjusted to directly reply to user
> submissions.
>
> A scripts/patchtest.README file is included for basic instructions on
> how to use patchtest, as well as for submitting fixes should any bugs be
> identified. The Yocto Project Contributor Guide will receive a single,
> corresponding patch to provide similar details on why and how to use
> patchtest. Finally, the patchtest layer itself will be reduced to only
> those pieces that are required for building the core-image-patchtest
> image, which makes special adjustments to kernel configurations and
> initscripts that are only suitable for automation, and therefore outside
> the scope of most contributors' usage.
>
> Trevor Gamblin (4):
>    patchtest/requirements.txt: update
>    patchtest: add supporting modules
>    patchtest: add scripts to oe-core
>    patchtest: set default repo and testdir targets
>
>   meta/lib/patchtest/data.py          | 100 ++++++++++++
>   meta/lib/patchtest/patch.py         |  73 +++++++++
>   meta/lib/patchtest/repo.py          | 185 ++++++++++++++++++++++
>   meta/lib/patchtest/requirements.txt |   2 +
>   meta/lib/patchtest/utils.py         | 179 +++++++++++++++++++++
>   scripts/patchtest                   | 233 ++++++++++++++++++++++++++++
>   scripts/patchtest-get-branch        |  92 +++++++++++
>   scripts/patchtest-get-series        | 125 +++++++++++++++
>   scripts/patchtest-send-results      |  93 +++++++++++
>   scripts/patchtest-setup-sharedir    |  95 ++++++++++++
>   scripts/patchtest.README            | 156 +++++++++++++++++++
>   11 files changed, 1333 insertions(+)
>   create mode 100644 meta/lib/patchtest/data.py
>   create mode 100644 meta/lib/patchtest/patch.py
>   create mode 100644 meta/lib/patchtest/repo.py
>   create mode 100644 meta/lib/patchtest/utils.py
>   create mode 100755 scripts/patchtest
>   create mode 100755 scripts/patchtest-get-branch
>   create mode 100755 scripts/patchtest-get-series
>   create mode 100755 scripts/patchtest-send-results
>   create mode 100755 scripts/patchtest-setup-sharedir
>   create mode 100644 scripts/patchtest.README

Thanks for this!

I tried "patchtest --patch" with the attached patch, which had its 
"Signed-off-by" line intentionally removed.
However, it didn't find the issue (see the attached log).

Did I miss anything in the way I use it?
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--------------xsye9u2Og0GdAEX92ogha4Tb
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-brief-yoctoprojectqs-use-new-CDN-mirror-for-sstate.patch"
Content-Disposition: attachment;
 filename*0="0001-brief-yoctoprojectqs-use-new-CDN-mirror-for-sstate.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSAyZTFkNDNhZjg5NjcyMmE4Nzg4YmUxMDJkZjFiOTc1ODE5ZWNmNjc4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3Bk
ZW5hY2tlckBib290bGluLmNvbT4KRGF0ZTogVHVlLCAxNyBPY3QgMjAyMyAxNTowNzowOSAr
MDIwMApTdWJqZWN0OiBbUEFUQ0hdIGJyaWVmLXlvY3RvcHJvamVjdHFzOiB1c2UgbmV3IENE
TiBtaXJyb3IgZm9yIHNzdGF0ZQoKUmVjb21tZW5kZWQgaW5zdGVhZCBvZiB0aGUgWW9jdG8g
UHJvamVjdCBtaXJyb3IsIGJlY2F1c2UgZXhwZWN0ZWQKdG8gYmUgZmFzdGVyLiBNYWtlIHN1
cmUgeW91IG9ubHkgc2V0IG9uZSBzdWNoIG1pcnJvci4KCkNDOiByaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnCi0tLQogZG9jdW1lbnRhdGlvbi9icmllZi15b2N0b3Byb2pl
Y3Rxcy9pbmRleC5yc3QgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL2JyaWVmLXlvY3Rv
cHJvamVjdHFzL2luZGV4LnJzdCBiL2RvY3VtZW50YXRpb24vYnJpZWYteW9jdG9wcm9qZWN0
cXMvaW5kZXgucnN0CmluZGV4IDBjY2ZmY2NjNjAuLmRmOGQ3NWVkYzIgMTAwNjQ0Ci0tLSBh
L2RvY3VtZW50YXRpb24vYnJpZWYteW9jdG9wcm9qZWN0cXMvaW5kZXgucnN0CisrKyBiL2Rv
Y3VtZW50YXRpb24vYnJpZWYteW9jdG9wcm9qZWN0cXMvaW5kZXgucnN0CkBAIC0yNTQsNyAr
MjU0LDcgQEAgYW4gZW50aXJlIExpbnV4IGRpc3RyaWJ1dGlvbiwgaW5jbHVkaW5nIHRoZSB0
b29sY2hhaW4sIGZyb20gc291cmNlLgogICAgICAgICAgQkJfU0lHTkFUVVJFX0hBTkRMRVIg
PSAiT0VFcXVpdkhhc2giCiAgICAgICAgICBCQl9IQVNIU0VSVkUgPSAiYXV0byIKICAgICAg
ICAgIEJCX0hBU0hTRVJWRV9VUFNUUkVBTSA9ICJoYXNoc2Vydi55b2N0by5pbzo4Njg3Igot
ICAgICAgICAgU1NUQVRFX01JUlJPUlMgPz0gImZpbGU6Ly8uKiBodHRwczovL3NzdGF0ZS55
b2N0b3Byb2plY3Qub3JnL2FsbC9QQVRIO2Rvd25sb2FkZmlsZW5hbWU9UEFUSCIKKyAgICAg
ICAgIFNTVEFURV9NSVJST1JTID89ICJmaWxlOi8vLiogaHR0cDovL2Nkbi5qc2RlbGl2ci5u
ZXQveW9jdG8vc3N0YXRlL2FsbC9QQVRIO2Rvd25sb2FkZmlsZW5hbWU9UEFUSCIKIAogIy4g
KipTdGFydCB0aGUgQnVpbGQ6KiogQ29udGludWUgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1h
bmQgdG8gYnVpbGQgYW4gT1MKICAgIGltYWdlIGZvciB0aGUgdGFyZ2V0LCB3aGljaCBpcyBg
YGNvcmUtaW1hZ2Utc2F0b2BgIGluIHRoaXMgZXhhbXBsZToKLS0gCjIuMzQuMQoK
--------------xsye9u2Og0GdAEX92ogha4Tb
Content-Type: text/x-log; charset=UTF-8; name="patchtest.log"
Content-Disposition: attachment; filename="patchtest.log"
Content-Transfer-Encoding: base64

VGVzdGluZyBwYXRjaCAvaG9tZS9taWtlL3dvcmsvZ2l0L2dpdC55b2N0b3Byb2plY3Qub3Jn
L3lvY3RvLWRvY3MvZG9jdW1lbnRhdGlvbi8wMDAxLWJyaWVmLXlvY3RvcHJvamVjdHFzLXVz
ZS1uZXctQ0ROLW1pcnJvci1mb3Itc3N0YXRlLnBhdGNoCk5vbmVUeXBlOiBOb25lCk5vbmUK
Tm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpOb25lCk5vbmVUeXBlOiBOb25l
Ck5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpOb25lCk5vbmVUeXBl
OiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpOb25lCk5v
bmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpO
b25lCk5vbmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTog
Tm9uZQpOb25lCk5vbmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25l
VHlwZTogTm9uZQpOb25lCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmFuIDE4IHRlc3RzIGluIDAuNDAz
cwoKT0sKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpOb25lCk5vbmVUeXBl
OiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpOb25lCk5v
bmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTogTm9uZQpO
b25lCk5vbmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25lVHlwZTog
Tm9uZQpOb25lCk5vbmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9uZQpOb25l
VHlwZTogTm9uZQpOb25lCk5vbmVUeXBlOiBOb25lCk5vbmUKTm9uZVR5cGU6IE5vbmUKTm9u
ZQpOb25lVHlwZTogTm9uZQpOb25lCk5vbmVUeXBlOiBOb25lCk5vbmUKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpSYW4gMTggdGVzdHMgaW4gMC40NzBzCgpPSwoK

--------------xsye9u2Og0GdAEX92ogha4Tb--

