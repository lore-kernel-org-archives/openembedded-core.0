Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E9C7EE36
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30351.1675272853861999610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b9qMbsmV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b1c7f-dbbe538d-b4c1-4ed5-bbfc-83a088a93f7f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CJDAlB2hpYkkPDZKH54NU15KQhFNBb1Z2pV0DNDEuNs=;
	b=b9qMbsmVzD91gegMIrQ+x4TYkDuaVNoJIrNUHGSrYXcfhz4Rt7Q4tChPEsTVF/6L
	jUK8B2sqICvuXH1ul8zh2alFqnmyXR/jPn32VPbtW/jBuBq37z4L0yhXiK0npK1kXIW
	4lwr2fjMUwgj6QvPz2lv4GSC9N5+DDIZh8RfuifE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CJDAlB2hpYkkPDZKH54NU15KQhFNBb1Z2pV0DNDEuNs=;
	b=EZILz913a49Pvz8wVQiYsV6Jw7mudq6lqMG1k/lLAar0oV8oLNeEdp6OQ0AO/vbI
	pryvmG3pP/ubiv5Uj6u+GhKMus+B0hCX22sVILyuu6rZ6QXtKNbw0D4inZwJGxpoPGz
	A9PUSnud/mpFySIhARhCVYyN06p+QjAadMUGJQK0=
Content-Type: multipart/mixed; boundary="===============0446045961847491490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.1 SUCCEEDED
Message-ID: <010101860e0b1c7f-dbbe538d-b4c1-4ed5-bbfc-83a088a93f7f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176584

--===============0446045961847491490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.12-2023.1.patch
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
--===============0446045961847491490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.12.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.1.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.12" to "2023.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.12 [default] to 2023.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/opp/opp.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/bootph.yaml"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 294053 to 294712 (+0%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.12" to "2023.1"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/bootph.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/opp was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/opp/opp.yaml was added
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/WHEEL was removed

--===============0446045961847491490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.12-2023.1.patch"

RnJvbSBlNWI3MTNmMmQ4ODVlOWZhY2FkZDhkODE4Y2M3NDA5ZmRlMTFjMjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMToxNjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMi4xMiAtPiAyMDIzLjEKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjIuMTIuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEy
LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy4xLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEyLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuMS5iYgppbmRleCA5ZDg2MDExMWMx
Li45NzY3Yzk1ZDMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZHRzY2hlbWFfMjAyMi4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy4xLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhlcml0IHB5
cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjUzMmQ0MzNhOTE1ZTUwN2Q0YjQyNmI3ZWY1N2E2NzMwZDIzYzA5MzhiNjgy
ZmI0ODY2ZjlkZmE4MGE1OGVjNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZmM4YzI2OWU0YzU3
ZTlkMDA4YWY3YjMyY2QzM2I3N2FmZDRlYTFhYzk1NTJiY2ZhOTZiNDFiOWUwYzUyNTg2IgogCiBE
RVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRTOiR7UE59
ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVtYSBweXRob24zLXJmYzM5
ODciCi0tIAoyLjM3LjMKCg==

--===============0446045961847491490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/opp/opp.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/bootph.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/bootph.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/opp was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/opp/opp.yaml was added
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info/WHEEL was removed

--===============0446045961847491490==--

