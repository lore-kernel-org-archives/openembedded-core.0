Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EC0C6FA83
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12467.1662040787969075085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RqbeYvtY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182f959c898-b11ae085-7294-4b55-b371-a6978329ad8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dTWWO7Jbr7c6Usw/+q25NVnFCWpWgPOKcwqLoeaBL68=;
	b=RqbeYvtYdBduYwDzmSLJVAsu887PXq3pj20I/NiX1ELVa7JqZsNt5fejbRIUog8X
	R50GOUT2ZFe1noaeRzuqSwyYg3l8JNQwmY9MrOOrohjnUy54GhmLS6cpI++xK0aFLR4
	0999L7BN3BMrDpPUrxFQnk/v5rjHTQLKxIjU/BJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dTWWO7Jbr7c6Usw/+q25NVnFCWpWgPOKcwqLoeaBL68=;
	b=hnC3svHKUBxfHDmrVR4PBhuJXBc8tOAlbBPL0crqk2BpCTFPklnMriqN1DR5LJYX
	sfDIy9/vl/zyH3hYWbcnH8zetP02XOuR/KByazPx5fkv1dXdNdSH4yqXWSWOIPtgtPP
	H+gCE7w67nAjhsGaFmS/qaJgaHgfdLXhO+sShatQ=
Content-Type: multipart/mixed; boundary="===============3428769944175135330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 221 SUCCEEDED
Message-ID: 
 <01010182f959c898-b11ae085-7294-4b55-b371-a6978329ad8f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170213

--===============3428769944175135330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *221* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-220-221.patch
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
--===============3428769944175135330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 122 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3428769944175135330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1060074 to 1060658 (+0%)
packages/core2-32-poky-linux/diffoscope: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-220.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-221.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "220" to "221"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-220.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-221.dist-info

--===============3428769944175135330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-220-221.patch"

RnJvbSBkZTQwNTdlOGJmMzgxZTkzMzliNWZlNTYxZTBiMmEwYWQ0YTg5ODE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzozMDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjIwIC0+IDIyMQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMjAuYmIgPT4gZGlmZm9zY29wZV8yMjEuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIyMC5iYiA9PiBkaWZmb3Njb3BlXzIy
MS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjIwLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIyMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIwLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIxLmJiCmluZGV4IGRjNTU2NDc3
ZmEuLmM4MDEyMDBkN2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyMS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3ODczZTEzYWM4YjExYjYzNGVlMzQ5MGI3MGIwNTZjNmE2YmFlOWNmYjc5NGQ2YmE3Y2I0
M2U3Nzk3YjJhODI5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdiMTcyNGU5YjFlNWFjNjU5N2Nh
YzA3ZDBhY2QyNjYxZGIxYmNmMGQ2YTliMmU4N2JlMjFiNWUzODA2YmU5ZjgiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zMS4xCgo=

--===============3428769944175135330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-220.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-221.dist-info

--===============3428769944175135330==--

