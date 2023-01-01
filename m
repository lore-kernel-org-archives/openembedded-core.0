Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA35C6379F
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20657.1672605966184846856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VQpKumQV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f15a0ce-88b8aec3-7335-4c77-b877-561f448f3286-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g566HPaVZg5EXqSz1ixxVpTS6m5cmPMfoVEeZNo2/bQ=;
	b=VQpKumQVSfQzpYg6La8/urBtXm2JDXU46tWhI3CqdIWELj9RXfLLX3er5uPw+rIx
	IVfay0HGBdtyFJozDrZf0aezB7UtCP1H3hZCb8iq6vL19vnWw10AAYEEADlWq71utD9
	TRgQSk8KFQHFCzMjBYOi+EnStc5NWdQba2yWtDK8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g566HPaVZg5EXqSz1ixxVpTS6m5cmPMfoVEeZNo2/bQ=;
	b=XYUUAJes+jIxnHLssyCJZWRxw7g5swRbJQH1Xq1rErPk7YUcsm4RqgxVBdr4XQIq
	Fan3UsUV1odOsc2Aks5mj2RQ5Gr0XDuv/K6keOpMc2jdxitAlCBW3cdPD4RFDhFqA2p
	HE1unX1/zTGbNoZzRx8wZmhZblQSmPp7Ia7K8nzU=
Content-Type: multipart/mixed; boundary="===============2880691552082866095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.16.0 SUCCEEDED
Message-ID: <010101856f15a0ce-88b8aec3-7335-4c77-b877-561f448f3286-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175253

--===============2880691552082866095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch
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
--===============2880691552082866095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============2880691552082866095==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch"

RnJvbSBmOWQwOTkzMmI1OWJiNDAyMWU1Mjc1MjE5MGU5OWI5Y2JkZTQwODkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDoxNDo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lOiB1cGdyYWRlIDMuMTUuMCAtPiAzLjE2LjAKCi0tLQogLi4ubjMt
cHljcnlwdG9kb21lXzMuMTUuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjE2LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWVf
My4xNS4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21lXzMuMTYuMC5iYn0gKDM4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMTUuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0
b2RvbWVfMy4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xNS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMu
MTYuMC5iYgppbmRleCBjYWJlOTE4OWYyLi4xNWVlMzFjNjZhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTUuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTYu
MC5iYgpAQCAtMSw1ICsxLDUgQEAKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGlu
aGVyaXQgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxMzVkZGRhZDUwNDU5
MmJjYzE4YjBkMmQ5NWNlODZjM2E1ZWE4N2VjNjQ0N2VmMjVjZmVkZWExMmQ2MDE4YjgiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMGU0NWQyZDg1MmE2NmVjZmI5MDRmMDkwYzNmODdkYzBkZmI4OWE0
OTk1NzBhYmFkODU5MGYxMGQ5Y2ZmYjM1MCIKIAotLSAKMi4zNy4zCgo=

--===============2880691552082866095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.16.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1042020 to 1042016 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2772679 to 2772209 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2842699 to 2843277 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3634147 to 3634243 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============2880691552082866095==--

