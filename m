Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ED5C25B0C
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3941.1659679409726112129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QZhgP6x/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101826c9a0241-cb5ec687-e053-4f25-abaa-5de7dec0f666-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V3jvfrTNY0X+whWrmt6b6iR12xT8alzo1pe9+cYFxc4=;
	b=QZhgP6x/TJUu0CHooMvUrWikvScYLg0jJHgB25B7xoeNo56GV3kzFfyPYwp7TYax
	6fvowjz4u/JAepl8XiWEzIqKZWfxNOAfeJ+8PXfr66X8WCJ0eLl5Pr6jz7gs1ntUNEb
	QkFtI9VDr4XSI9eaP28Lw+ArWxk9isXxN2pBo9l4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V3jvfrTNY0X+whWrmt6b6iR12xT8alzo1pe9+cYFxc4=;
	b=f71N+qNdXI14asW4EseQQnxAznAasmvIF7sb4tGSnOE4tdqqqho2YyfJYHD7z0Lo
	3r6+q83Go9o1oRGXqS7SQZeLZFn84Un+n4F418qySW6V7GYNrgTJR2iN+7nsJW0rrq8
	M59VBJ3aYtyrQJOHvwMQ7BXulZHrbrWG4GtMsy2k=
Content-Type: multipart/mixed; boundary="===============8854071521441248918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 220 SUCCEEDED
Message-ID: 
 <010101826c9a0241-cb5ec687-e053-4f25-abaa-5de7dec0f666-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168926

--===============8854071521441248918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *220* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-218-220.patch
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
--===============8854071521441248918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-218.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-220.dist-info

--===============8854071521441248918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1059299 to 1060074 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "218" to "220"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 218 [default] to 220 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-218.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-220.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "218" to "220"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-218.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-220.dist-info

--===============8854071521441248918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-218-220.patch"

RnJvbSAxMjRmYzdhYmZlNWQ1ZmExYWNjNWY4ODRiMzVlZTg3ZDg5YzAxYmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwNDoyMTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjE4IC0+IDIyMAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMTguYmIgPT4gZGlmZm9zY29wZV8yMjAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIxOC5iYiA9PiBkaWZmb3Njb3BlXzIy
MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjE4LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIyMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjE4LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIwLmJiCmluZGV4IGVjZWJhNDcx
ODYuLmRjNTU2NDc3ZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2ODA1NmU2ZDUzODJiZmUxNjY2MmM2MGQ0N2JmNzEwYWE3YjBlZjQzYmZkZTExNzJmYWQ2
OTRiYzQ4NzI3OWUzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4NzNlMTNhYzhiMTFiNjM0ZWUz
NDkwYjcwYjA1NmM2YTZiYWU5Y2ZiNzk0ZDZiYTdjYjQzZTc3OTdiMmE4MjkiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zMS4xCgo=

--===============8854071521441248918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-32 sysroot...done.
Removing 120 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8854071521441248918==--

