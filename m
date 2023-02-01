Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F236C7EE29
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30356.1675272854710616487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Kh8VzeXn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b1969-a935e825-6448-4fd9-919d-9800eb3e85e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0GntD00jVybBGZHczLQ5rBUhCGc4LzEeFYBcn4RJAew=;
	b=Kh8VzeXnSx7rwS8jSUmhEsztojZT1h29EF0ulXYgqxxmXemqi49wwS7kG2+0u0wB
	5l7Oexp0qLupZNu4km0YzqcKCMltRNjQ10z84W0IGqlZol3k7MZgtIaL4B7mEnMiutI
	Q4qWxw7dBXr06Z8BF7fCiYFDp+B90AksSExA9I94=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0GntD00jVybBGZHczLQ5rBUhCGc4LzEeFYBcn4RJAew=;
	b=TV2miK8BYCtZIGMafgakM5PsQcDzjsmtHbE7Fzq6XlfqL5BfdktucJwLWJYhO1tr
	FP+yez5zFBZhviZxDHBJzwujc8KzpSRdYbtk/H+kRRkK+wOdcnsNQaCLxNIN7QRPulH
	r2bgbsa/0i4mPR3qd0+IldziypizGwz77djSrgUE=
Content-Type: multipart/mixed; boundary="===============6744852983124169646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.19.5 FAILED
Message-ID: <010101860e0b1969-a935e825-6448-4fd9-919d-9800eb3e85e5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176581

--===============6744852983124169646==
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
--===============6744852983124169646==
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
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.19.4.bb:4: Could not include required file go-1.19.4.inc
ERROR: Parsing halted due to errors, see error messages above

--===============6744852983124169646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.19.4-1.19.5.patch"

RnJvbSBmMWVjODdiNTMwMGZmNDg0MDJmNDI2NDlhN2JmNmExOWUyYWE1ZDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODo0ODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
LXJ1bnRpbWU6IHVwZ3JhZGUgMS4xOS40IC0+IDEuMTkuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28ve2dvLTEuMTkuNC5pbmMgPT4gZ28tMS4xOS41LmluY30gICAgICAgfCAyICstCiAu
Li4vZ28ve2dvLXJ1bnRpbWVfMS4xOS40LmJiID0+IGdvLXJ1bnRpbWVfMS4xOS41LmJifSAgICAg
ICAgICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby0xLjE5LjQuaW5jID0+IGdvLTEu
MTkuNS5pbmN9ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1ydW50
aW1lXzEuMTkuNC5iYiA9PiBnby1ydW50aW1lXzEuMTkuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNC5pbmMgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ28vZ28tMS4xOS41LmluYwpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4xOS40LmluYwpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNS5pbmMKaW5kZXggNDkzNDliYTZlYy4uMjdhZjAw
YmMwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNC5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNS5pbmMKQEAgLTE1LDQgKzE1
LDQgQEAgU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly8wMDAxLXNyYy1jbWQtZGlzdC1idWlsZGdv
LmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0Y2ggXAogICAgIGZpbGU6Ly9maWx0
ZXItYnVpbGQtcGF0aHMucGF0Y2ggXAogIgotU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiZWRh
NzRkYjRhYzQ5NDgwMGEzZTY2ZWU3ODRlNDk1YmZiYjliOGU1MzVkZjkyNGE4YjAxYjFhODAyOGI3
ZjM2OCIKK1NSQ19VUklbbWFpbi5zaGEyNTZzdW1dID0gIjhlNDg2ZThlODVhMjgxZmM1Y2UzZjBi
ZWRjNWI5ZDJkYmY2Mjc2ZDdkYjBiMjVkM2VjMDM0ZjMxM2RhMDM3NWYiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjE5LjQuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tcnVudGltZV8xLjE5LjUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMTkuNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLXJ1bnRpbWVfMS4xOS41LmJi
Ci0tIAoyLjM3LjMKCg==

--===============6744852983124169646==--

