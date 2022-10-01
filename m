Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46C5C4707A
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.475.1664643225699483255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bzp07+63;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477e545-043caa76-a43a-4e34-a693-58a66d18ba50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KFZkxyTkLoOPtrSTfwaJ+TEdDe4BKmZy0fhT4TdVe3k=;
	b=bzp07+63gJTyyDhNm3KT3oxXVDmvz43xVt/4EH7Tpbcco4scU7Ezz6Y5Tz/5sHO5
	C3GMfsq/bVUhvLzZAtvCXHtNCHa8KxuECfAHZvjafll6zQjj1N0HAKyv7Uyipho1Xnw
	QI4syy3GS8wtKoz4Y/5+SSSh5MiYlQvL/x1+srVM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KFZkxyTkLoOPtrSTfwaJ+TEdDe4BKmZy0fhT4TdVe3k=;
	b=Eb4+4K5fluMBfL2wveut96MpGNAMsLv1Qs/dqu8r9iAf/QM9BE+o2Htd5CkytQVb
	KEtjs/XsFEQniHxAJ4LTEjQ4y8W8rHVbfgNUTOdoXmiFYhP5K3Nf4JzTKiBX6r9YLvy
	lZRo3SeubsGQa0Ds+7rFf4O6byKrILoHWy3WnhTQ=
Content-Type: multipart/mixed; boundary="===============1608610790443482279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 223 SUCCEEDED
Message-ID: 
 <010101839477e545-043caa76-a43a-4e34-a693-58a66d18ba50-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171331

--===============1608610790443482279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *223* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-221-223.patch
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
--===============1608610790443482279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-223.dist-info

--===============1608610790443482279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1060658 to 1060814 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "221" to "223"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 221 [default] to 223 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-221.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-223.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-223.dist-info

--===============1608610790443482279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============1608610790443482279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-221-223.patch"

RnJvbSAzZDAzNDNlNzY3ZjgzYjcxNjMwYjdjZDE4YTkzMmU5MzdjZWUzMjg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNTowNDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjIxIC0+IDIyMwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMjEuYmIgPT4gZGlmZm9zY29wZV8yMjMuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIyMS5iYiA9PiBkaWZmb3Njb3BlXzIy
My5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjIxLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIyMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIxLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIzLmJiCmluZGV4IGM4MDEyMDBk
N2MuLmQ4ZjFjNmRhMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyMy5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YjE3MjRlOWIxZTVhYzY1OTdjYWMwN2QwYWNkMjY2MWRiMWJjZjBkNmE5YjJlODdiZTIx
YjVlMzgwNmJlOWY4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzODFjNzdiZTkzMjYwODRiYWQ1
NjgzZjQyNTZhMjczZDZlZWRjNWJhMTIyMzhjZjkwMTE1NTE5N2Y1NWRjMzUiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zMS4xCgo=

--===============1608610790443482279==--

