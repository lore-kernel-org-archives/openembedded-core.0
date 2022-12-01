Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE45C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.46780.1669908628799254305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZHPrVTLO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010184ce4f81b0-00f48146-4eda-42a4-aa3b-093989f70c7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aKC/Wzc3CVPEcUjKnYKo7e1PK3MPdmQCueze+PMvWYE=;
	b=ZHPrVTLOE5AEjUrJvLK3Dvo5teWoM0NQmlp7WLTuoTpaojJiFcwnWKo21eZ4zY1k
	LEMaibsPJeUjEkdj899IwraFC6js2sBIB6gtQaqwg3q3aPdYswGGWOjbnaczEeFcvlh
	lHQdQ+cLIwMYVHE3UM7oc1TdH7P5gHM16W7smEW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aKC/Wzc3CVPEcUjKnYKo7e1PK3MPdmQCueze+PMvWYE=;
	b=DbVJtfvY9VHm9kgP1m/tDyVkIR0A2RFP38Fnc40ELubdc7Amu2oj5gthx8K/gyVh
	zr+S73Jr8ZqDTFDnG6CDf1B3aJqp6X0bzax1T/mLLB570oI9u4gFYSKxtKXwQhBDDsu
	BqPP2+YMzFtGyhmqd+fjHt4hi4anVQJ4RpkhfNnE=
Content-Type: multipart/mixed; boundary="===============5249415468054935655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 227 SUCCEEDED
Message-ID: <01010184ce4f81b0-00f48146-4eda-42a4-aa3b-093989f70c7c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174187

--===============5249415468054935655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *227* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-224-227.patch
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
--===============5249415468054935655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376339 to 1386666 (+1%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-227.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/html.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py"
packages/core2-32-poky-linux/diffoscope: PV changed from "224" to "227"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 224 [default] to 227 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-227.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-227.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============5249415468054935655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-227.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-227.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============5249415468054935655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-224-227.patch"

RnJvbSBkMWY0YzI0YzkwNzUxNDFhN2M4YmRlMTFmZDkyZWNkZGMyMjZhN2RiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxNDowMzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjI0IC0+IDIyNwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMjQuYmIgPT4gZGlmZm9zY29wZV8yMjcuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIyNC5iYiA9PiBkaWZmb3Njb3BlXzIy
Ny5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjI0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIyNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjI0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjI3LmJiCmluZGV4IDVkNjM0Yjgw
NzMuLjU5NGZjN2E2ODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyNy5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxOTIwZWJkY2E0MGU4NWYwMTlhODRlMDIyMGU0YTc5ZjAwZmZkYWZjMGY3OGUxZjFlMjIx
OTEyM2Q1YzA4ZGZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3MjdiNjRkZDc4MjU0ZTRlNTNi
ZWIyZDI1NDFiNGYwOTMzYjYwMWZhNGNhMzQ5NjBkMGM5YWJhZTVjYmI2YTkiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zMS4xCgo=

--===============5249415468054935655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1669 targets, 49 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5249415468054935655==--

