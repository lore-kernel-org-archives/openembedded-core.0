Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABED4C32763
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.6460.1660589821042428320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DMuywYEp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182a2ddc934-16cd0f15-6288-478e-9673-af8acbd0fcc8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K21QwxhITisVJ9hU8r4dB6WVM4p61cGr+TlzzcnLU54=;
	b=DMuywYEpGOrj/Cp+z509F/XhPi2arNFNcB3l5FTE8NbAnLiCrGwwPJWeOc1Tzw6I
	79voajyroRS9CJ+VZ+Xw9vt1RB1NEAXmCugQnUayDSFpWf27vRvsNsLiGOdRu9XNBI4
	+yZzja8dJjYvjguFzF8Y6kFjxG0/hPmIj5Cw5/mc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K21QwxhITisVJ9hU8r4dB6WVM4p61cGr+TlzzcnLU54=;
	b=cYcMS7t9p9hlBbk5tPFA1DiLlxjHatgou6WZb49v6lD6O2073Cuw/ov0wQWgLcf7
	h1dbYtYy9aYhW3lDhHrm8ef7OFauwfDt7ykn4b4iKtMeulibP0QBjUPoyXvK/6PriZd
	/NWrxWki2VzJfbMMzhhDIEvRgY0XxRMxWQD1m3Jk=
Content-Type: multipart/mixed; boundary="===============5913779776869027976=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyelftools: upgrading to 0.29 SUCCEEDED
Message-ID: 
 <01010182a2ddc934-16cd0f15-6288-478e-9673-af8acbd0fcc8-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169379

--===============5913779776869027976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyelftools* to *0.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyelftools-upgrade-0.28-0.29.patch
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
--===============5913779776869027976==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyelftools-upgrade-0.28-0.29.patch"

RnJvbSBhM2Y2NThmNTMyMjgzNDMxZDFiZDYzOTJlNjFmMTQwZDExMTY4YjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6NDA6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5ZWxmdG9vbHM6IHVwZ3JhZGUgMC4yOCAtPiAwLjI5CgotLS0KIC4uLi97cHl0aG9u
My1weWVsZnRvb2xzXzAuMjguYmIgPT4gcHl0aG9uMy1weWVsZnRvb2xzXzAuMjkuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHllbGZ0b29sc18wLjI4LmJi
ID0+IHB5dGhvbjMtcHllbGZ0b29sc18wLjI5LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMjguYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHllbGZ0b29sc18wLjI5LmJiCnNpbWls
YXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWVsZnRvb2xzXzAuMjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMjkuYmIKaW5kZXggMGNlZGRjYjY4YS4uMjE5
OWU5ZmY4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5ZWxmdG9vbHNfMC4yOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHllbGZ0b29sc18wLjI5LmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVs
L3B5dGhvbiIKIExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT01Y2UyYTJiMDdmY2EzMjZiYzdjMTQ2ZDEwMTA1Y2NmYyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjUzZTU2MDljYWMwMTY0NzFkNDBiZDg4ZGM0MTBjZDkwNzU1OTQyYzI1ZTU4YTYx
MDIxY2ZkZjdhYmRmZWFjZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWM3NjE1OTZhYWZhMTZl
MjgyYTMxZGUxODg3MzdlNTQ4NTU1MjQ2OWFjNjNiNjBjZmNjY2YyMjI2M2ZkMjRmZiIKIAogUFlQ
SV9QQUNLQUdFID0gInB5ZWxmdG9vbHMiCiAKLS0gCjIuMzEuMQoK

--===============5913779776869027976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyelftools: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.28.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.29.tar.gz"
packages/core2-32-poky-linux/python3-pyelftools: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-dev: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-dev: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-doc: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-doc: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-locale: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-locale: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-src: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-src: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1009771 to 1133249 (+12%)
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: PKGV changed from 0.28 [default] to 0.29 [default]
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: PV changed from "0.28" to "0.29"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pyelftools-0.28.dist-info -> /usr/lib/python3.10/site-packages/pyelftools-0.29.dist-info, added "/usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/datatype_cpp.cpython-310.pyc /usr/lib/python3.10/site-packages/elftools/dwarf/dwarf_util.py /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/dwarf_util.cpython-310.pyc /usr/lib/python3.10/site-packages/elftools/dwarf/datatype_cpp.py"
Changes to packages/core2-32-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.10/site-packages/pyelftools-0.28.dist-info moved to /usr/lib/python3.10/site-packages/pyelftools-0.29.dist-info
  /usr/lib/python3.10/site-packages/elftools/dwarf/datatype_cpp.py was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/dwarf_util.py was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/datatype_cpp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/dwarf_util.cpython-310.pyc was added

--===============5913779776869027976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pyelftools-0.28.dist-info -> /usr/lib/python3.10/site-packages/pyelftools-0.29.dist-info, added "/usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/dwarf_util.cpython-310.pyc /usr/lib/python3.10/site-packages/elftools/dwarf/datatype_cpp.py /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/datatype_cpp.cpython-310.pyc /usr/lib/python3.10/site-packages/elftools/dwarf/dwarf_util.py"
packages/core2-32-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1009771 to 1133249 (+12%)
Changes to packages/core2-32-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.10/site-packages/pyelftools-0.28.dist-info moved to /usr/lib/python3.10/site-packages/pyelftools-0.29.dist-info
  /usr/lib/python3.10/site-packages/elftools/dwarf/datatype_cpp.py was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/dwarf_util.py was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/datatype_cpp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/elftools/dwarf/__pycache__/dwarf_util.cpython-310.pyc was added

--===============5913779776869027976==--

