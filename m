Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD86EC3276A
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.6461.1660589820592686918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MJ3YMzJQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182a2ddc72a-fb4145a5-e146-4119-b452-17bd9e0d2c14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dRuN51tUfzUbQTZsu5ocYMp+i9GEpMaqhxPfqHvdmKo=;
	b=MJ3YMzJQKarI4g346X1OOwkaQWwVFxWmGi3F+JRZnGnaStemAVFPon9GdEiPCPwO
	G2lmNRMZ+NhDT1v0kaDhc3cSwcbdyTkZrg6bYufJsNjED9WZt3EiG+XH1mkHCV9NcVa
	PIRe+DFh7/c3c9EvQPY6wqw+Edz1JA01lH4+bna4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dRuN51tUfzUbQTZsu5ocYMp+i9GEpMaqhxPfqHvdmKo=;
	b=fMcPmTVtqGBpAmXT+ToA691fBjvbtWQEn+cyk6vMVnPrbmcKIgW/5dbb9xoSyr0b
	JjFSqb3/evJBHXbHovYVV+TReJZa/hUSLNI8w3FfepUfr4KqWOagZTcXB7vR5mdxXSP
	Kv+hQ00kb0dd8fGGjdohRNVEtuQ/I8PtQsyVG7bE=
Content-Type: multipart/mixed; boundary="===============8645264926541434029=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.8.1 SUCCEEDED
Message-ID: 
 <01010182a2ddc72a-fb4145a5-e146-4119-b452-17bd9e0d2c14-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169370

--===============8645264926541434029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.8-2022.8.1.patch
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
--===============8645264926541434029==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.8-2022.8.1.patch"

RnJvbSA1MmMxYjA4OWE2NWRhZjEwNThjMDQyNTEyMTcyOGU1NDIwNDJiMDA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6MDA6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjIuOCAtPiAyMDIyLjguMQoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIyLjguYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjIu
OC5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjIuOC4xLmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44LjEu
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4xLmJiCmluZGV4IGU4Yzhh
YzZmOTIuLjM4ZjY0NmU1MGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4xLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMWJlZmU3YzlmNzRjZWEyNDhhOGI1MjRjZjYxODVhYzQ4OTEyYTVi
MmFhZTk2ODU0ZDc3Y2I5NDU4NDQzM2NhNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZTU2YTk5
MjA5NDQyMjNkNmY5M2ZkNTFhZGExOWRkOGRiNTU0YWM5MTgyZWY1MmMxYzVjOWQ0OTY2YWIzMGFh
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVtYSBweXRob24z
LXJmYzM5ODciCi0tIAoyLjMxLjEKCg==

--===============8645264926541434029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.1.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.8" to "2022.8.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.8 [default] to 2022.8.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 241896 to 243478 (+1%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/bus/qemu,platform.yaml"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.8" to "2022.8.1"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/bus was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/bus/qemu,platform.yaml was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/WHEEL was removed

--===============8645264926541434029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/bus/qemu,platform.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/bus was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/bus/qemu,platform.yaml was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info/WHEEL was removed

--===============8645264926541434029==--

