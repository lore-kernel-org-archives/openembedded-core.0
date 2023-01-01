Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD81C54EBF
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20172.1672605966749946133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jxo3Z+lz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101856f159e8c-6f428f1f-c335-412b-b06d-e280a9293ade-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LLdcv1pawTWuLqeamaOpHQ5z3Y6q/oaSaZS58DFOHt8=;
	b=Jxo3Z+lzkIxhU12ytaD08gnJcPwI1OJPmW8GDSKBWQSJdIn4iR9r/4CcfurYSgW8
	N1akna3eGFSY4rzahbO9bPd6DxUToRNXky+31jQExmrF8tmRrfbUythGEpXhMYcVYd8
	vo/tGFhOrEngPUHp4+u3tqBNDi4Qj0UpqM/6W30w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LLdcv1pawTWuLqeamaOpHQ5z3Y6q/oaSaZS58DFOHt8=;
	b=K6UsENQn2vdOc954K8jmnfCwbO7eCFqixpnb2yZuUalRldtsRThBhCa1e9xfPV8c
	FRfVSWIE6QYL6p8Q4sx1QCFV+hdQi0mx83EilX44Ki/97ypkRc7F4+4qSAe9CFDlfsR
	pjypyvpRsbBxLD/56GdrS9vtoXyZcPktysznRBXk=
Content-Type: multipart/mixed; boundary="===============4240269801175702113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.12 SUCCEEDED
Message-ID: <010101856f159e8c-6f428f1f-c335-412b-b06d-e280a9293ade-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175249

--===============4240269801175702113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.11-2022.12.patch
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
--===============4240269801175702113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.11-2022.12.patch"

RnJvbSBhZDhjOGYxODEwMDllMDE3MDEyNTcwMWQ4MWQ0NmQ2Y2Y2YWU3MTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwODo0OTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMi4xMSAtPiAyMDIyLjEyCgotLS0KIC4uLntweXRo
b24zLWR0c2NoZW1hXzIwMjIuMTEuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEyLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyMi4x
MS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjIuMTIuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi4xMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTIuYmIKaW5kZXggZmQ4N2Ri
MmMyYi4uOWQ4NjAxMTFjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTIuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVy
aXQgcHlwaSBzZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4MjVlNTFiOGJiODJhMmQ0ODMzZDE1YzI1ZmYyYjlhM2Y1YTUzYjM2
YTQ5MGQ3YzRiNmIxMzYwMzdlODIzMzIwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1MzJkNDMz
YTkxNWU1MDdkNGI0MjZiN2VmNTdhNjczMGQyM2MwOTM4YjY4MmZiNDg2NmY5ZGZhODBhNThlYzYi
CiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6
JHtQTn0gKz0gInB5dGhvbjMtcnVhbWVsLXlhbWwgcHl0aG9uMy1qc29uc2NoZW1hIHB5dGhvbjMt
cmZjMzk4NyIKLS0gCjIuMzcuMwoK

--===============4240269801175702113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info
  /usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml was added

--===============4240269801175702113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.11.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.12.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 290863 to 294053 (+1%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.11" to "2022.12"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info
  /usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml was added

--===============4240269801175702113==--

