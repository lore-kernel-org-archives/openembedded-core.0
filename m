Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73748C63709
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20175.1672605966904197789
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f1sPFEB0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f159e63-520fe375-7a68-4aae-b3ef-6f4a2132ea80-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ACM0ZJi10g/eLLpCmUWUYPSUymlQbQuy+ewB0iBoGUs=;
	b=f1sPFEB0AsZGR8VD9HtHJ1Q0uMIgUiuFVpbeK24kKHPzMWJHBgzaxy+EJnT2/1uO
	CI6XQ1ANnvBgG1+lQVMX+IQVdAcuQ/BUbXPL67LIUkeL+tQ0lO5SYwMpn8fUNSR12+M
	il+y809Qo6IW/v3mggbku5adh003DGYCKHx3gxXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ACM0ZJi10g/eLLpCmUWUYPSUymlQbQuy+ewB0iBoGUs=;
	b=eWJSJj7XY298DQXtSX5ISRvZ5tdFKPv5gnGutVlc4kEleu+wbkAgV1RGf04xGrbi
	eQRyl/i/6B3wIL0ovCd/dsqRVOwI0gPDAITS65DQGzJMtCRjvmOO/m7uUuGMOZPK80A
	NGsLy/PbnQdWiGgWJ2yOxXTnnDekCJ0leu+/8WOU=
Content-Type: multipart/mixed; boundary="===============3512508279603177806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-vcs: upgrading to 0.3.0 SUCCEEDED
Message-ID: <010101856f159e63-520fe375-7a68-4aae-b3ef-6f4a2132ea80-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175252

--===============3512508279603177806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-vcs* to *0.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-vcs-upgrade-0.2.0-0.3.0.patch
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
--===============3512508279603177806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 19120 to 27472 (+44%)
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info, added "/usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info
  /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py was added

--===============3512508279603177806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatch-vcs: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.3.0.tar.gz"
packages/core2-32-poky-linux/python3-hatch-vcs: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PV changed from "0.2.0" to "0.3.0"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info -> /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info, added "/usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc"
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 19120 to 27472 (+44%)
packages/core2-32-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PV changed from "0.2.0" to "0.3.0"
Changes to packages/core2-32-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.2.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info
  /usr/lib/python3.11/site-packages/hatch_vcs/metadata_hook.py was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/metadata_hook.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/__pycache__/vcs_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/hatch_vcs/vcs_utils.py was added

--===============3512508279603177806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-vcs-upgrade-0.2.0-0.3.0.patch"

RnJvbSBjZDQ2Mjc2ZjE3N2ZmZjZiODljMGEwZDZmZjUyODI4ZmI5NjcxZDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwOTowNDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2gtdmNzOiB1cGdyYWRlIDAuMi4wIC0+IDAuMy4wCgotLS0KIC4uLi97cHl0aG9u
My1oYXRjaC12Y3NfMC4yLjAuYmIgPT4gcHl0aG9uMy1oYXRjaC12Y3NfMC4zLjAuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2gtdmNzXzAuMi4wLmJi
ID0+IHB5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC12Y3NfMC4yLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1oYXRjaC12Y3NfMC4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oYXRjaC12Y3NfMC4zLjAuYmIKaW5kZXggY2NhMmM0OWQyYi4uYjRk
YjEwZTc2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWhhdGNoLXZjc18wLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhlcml0IHB5cGkgcHl0
aG9uX2hhdGNobGluZwogCiBQWVBJX1BBQ0tBR0UgPSAiaGF0Y2hfdmNzIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTkxM2Q3MzNiMzRlZWM5YmIwMzQ1ZDA2MjZjYTMyMTY1YTRhZDJkZTE1ZDFj
ZTY0M2MzNmQwOWNhOTA4YWJmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZWM1MTA3Y2ZjZTQ4
MmM2N2Y4YmM5NmYxOGJiYzMyMGM5YWEwZDA2ODE4MGUxNGFkMzE3YmJlZTVhMTUzZmVlIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuMzcuMwoK

--===============3512508279603177806==--

