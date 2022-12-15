Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937BBC77B6E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.144511.1671136352944564764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d3nC+8Mi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185177d1e07-db316ecb-9bc6-4e03-a24e-853d51f77975-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pJIcYirKoW+PVJDn8g4bv3GLKd6tRdFKnMgqv56DnOM=;
	b=d3nC+8MiVIn7kKvsfnWnAG6B5+82dzj8J3A25OKZ31CR0GXqHaXcQfHU8RolZ3El
	RIAJWTlto16NUfScJdZfg9eVS5iQKGDHbc8P9MIPRp3F+RfXhkAK5VC6+jYBLr4mLIA
	5HXBo5k5NS21ybe1aZmh6lDgokKuG0RmYHF7aZ+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pJIcYirKoW+PVJDn8g4bv3GLKd6tRdFKnMgqv56DnOM=;
	b=KOu7m1DZRU2DGQNvPI/pATb32mZbuvTEnDdYqE4TMGL26swGPN/Fhz+0nWYGDfPg
	LQmURyOko/8EyxqKT+8QusSiC4StP8JBZkVrNaCIfu3Vd5MEKmXw/nEn9HyNJXNOuJE
	guH5ySg8RjjvWigtST/q6v4UDHAtxor8GNZxGeJI=
Content-Type: multipart/mixed; boundary="===============9179723705084545451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 228 SUCCEEDED
Message-ID: <01010185177d1e07-db316ecb-9bc6-4e03-a24e-853d51f77975-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174715

--===============9179723705084545451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *228* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-224-228.patch
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
--===============9179723705084545451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-224-228.patch"

RnJvbSA3ZTNhYzBiZGU2Nzk3NzdhMjQ0YmJmZGQ3YThlNDFkOTQ0YWEwYjQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTk6NDQ6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIyNCAtPiAyMjgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjI0LmJiID0+IGRpZmZvc2NvcGVfMjI4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMjQuYmIgPT4gZGlmZm9zY29wZV8y
MjguYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMjguYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyOC5iYgppbmRleCA1ZDYzNGI4
MDczLi4wZmY4ZWJjMWY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjguYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMTkyMGViZGNhNDBlODVmMDE5YTg0ZTAyMjBlNGE3OWYwMGZmZGFmYzBmNzhlMWYxZTIy
MTkxMjNkNWMwOGRmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZjVkNjU2ZWI2Njk5ZjBmY2Qw
NzcxNDZkMmFmNDQzMDdjMzRiYTkxOTBjN2I1MzFkMGU1YWNjYzhhZWVmODY5IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzcuMwoK

--===============9179723705084545451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 224 [default] to 228 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-228.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376339 to 1391830 (+1%)
packages/core2-32-poky-linux/diffoscope: PV changed from "224" to "228"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-228.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 224 [default] to 228 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-228.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============9179723705084545451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============9179723705084545451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-228.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-228.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============9179723705084545451==--

