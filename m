Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711DCC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.5194.1668517535893207063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M/HTELQB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101847b652454-fdbf61e7-bc97-40c2-bf70-0bee6c89701e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AOhiVxUA5RnBMnaWB4P1NXTIQFbJjFr5bqMzSi+mjmU=;
	b=M/HTELQBFNzesVJP8rHNr8kfFNbQ4tj//BXVmK8q/kqZ5C5acjKMtxsuV3lSFFos
	lLuOK4QIKhy4SdgFQ6whPXrGuVr6moLCt59bNoOKrNQU4HXbRgSVbiq99Sv+LFuTCNv
	7ktuim7A40sYC6bmVKA5jxJbMEQGcC/18z4HUxYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AOhiVxUA5RnBMnaWB4P1NXTIQFbJjFr5bqMzSi+mjmU=;
	b=YBgWPfjDYouaHWJr3Nd9AjyTfGkal0Qe90NIMTlK4VZhXr/Z0nR+HkWqP9PDtxPm
	xXwyw1rZJxfUbfZ4BHWsFkaRrfHxZDAIuj0HThmJE1niwtrCX8yMl7dfVc9S6dNQj7Y
	gYPd8LF/3VCRajl5IKFnJUYohrgTPJgcglhDGUoU=
Content-Type: multipart/mixed; boundary="===============5263930103007402139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 226 SUCCEEDED
Message-ID: <010101847b652454-fdbf61e7-bc97-40c2-bf70-0bee6c89701e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173329

--===============5263930103007402139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *226* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-224-226.patch
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
--===============5263930103007402139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-224-226.patch"

RnJvbSAxZTc5NzdiMTFkZjgzY2Y3NTRiMDQ5YTllY2FkMDRjMTNmMWM3NGEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6NDE6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIyNCAtPiAyMjYKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjI0LmJiID0+IGRpZmZvc2NvcGVfMjI2LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMjQuYmIgPT4gZGlmZm9zY29wZV8y
MjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyNi5iYgppbmRleCA1ZDYzNGI4
MDczLi42ZTlkNWY0NTA1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjYuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMTkyMGViZGNhNDBlODVmMDE5YTg0ZTAyMjBlNGE3OWYwMGZmZGFmYzBmNzhlMWYxZTIy
MTkxMjNkNWMwOGRmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZGJkYzVkY2NkYzExMGI2N2Nk
NTc0MThlNGQ3MTAzOTc3MTdjMjY1MmM4MzNiYTA0Mzc4N2Q4M2E4ZjYwZTFlIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzEuMQoK

--===============5263930103007402139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-226.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/html.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-226.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============5263930103007402139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1666 targets, 49 skipped, 0 masked, 0 errors.
Removing 139 recipes from the core2-32 sysroot...done.
Removing 145 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5263930103007402139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376339 to 1386582 (+1%)
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-226.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "224" to "226"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-226.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 224 [default] to 226 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "224" to "226"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-226.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============5263930103007402139==--

