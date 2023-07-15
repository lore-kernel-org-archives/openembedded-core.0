Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E885EC2FC00
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.6029.1689456454858457749
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W/ow0Vk2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101895b73a995-7d6481df-ae6e-498d-b143-a07bee22db09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cmsk1jmloovfAljpITVTsQfCQpE2IpXRyDXA1sPhyQQ=;
	b=W/ow0Vk2pkdudLBafq55rleWWgns+3vX8VejrYkpXqgxBJsoIngd1I8c2ilGYTcN
	44F5ToDjZaxudVAyWu4BcR5ilMZKVK8CH6u1QVV6S4UB97YKiCoR5y9xT4WFPMKJ5gq
	wivqUBGw1ItaVoE1Kn9P2Y2OL3+voIL/tUHkeCVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cmsk1jmloovfAljpITVTsQfCQpE2IpXRyDXA1sPhyQQ=;
	b=g94/eucQ4b2GGbg5J/OQfiHl2GZ5wjUZ9TJ9AFICgsRrq6w/22nPFlAEjZSBwEUp
	HIOuKnwpBdF5uZk9krK6dXJTWblQ73ZmK1hj9FuOqa5T5bR1pFWo0DkkVmvqN6mk+ct
	MUduEbAb97IuvlgaZnfwVnE+QWDo8Ja13/xIAjN4=
Content-Type: multipart/mixed; boundary="===============0805959483461823020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.6.1 SUCCEEDED
Message-ID: <010101895b73a995-7d6481df-ae6e-498d-b143-a07bee22db09-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184345

--===============0805959483461823020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.4-2023.6.1.patch
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

-- >8 --
From 620764b723245f46fc1a7d88eafa3be4da3de00b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:00:26 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.4 -> 2023.6.1

---
 ...{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2023.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
index f87563facd..38ff2714f2 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "6daefb8f54403b4d82961b3346571200571747ab01950fd36c1f69950fa7a8cf"
+SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.39.2


--===============0805959483461823020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.4.tar.gz;downloadfilename=dtschema-2023.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.6.1.tar.gz;downloadfilename=dtschema-2023.6.1.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2023.4" to "2023.6.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2023.4 [default] to 2023.6.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 299315 to 299334 (+0%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/__pycache__/schema.cpython-311.pyc /usr/lib/python3.11/site-packages/dtschema/schema.py /usr/lib/python3.11/site-packages/dtschema/__pycache__/validator.cpython-311.pyc /usr/lib/python3.11/site-packages/dtschema/validator.py /usr/lib/python3.11/site-packages/dtschema/fixups.py /usr/lib/python3.11/site-packages/dtschema/__pycache__/fixups.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema/fixups.py was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/fixups.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/schema.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/validator.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/schema.py was added
  /usr/lib/python3.11/site-packages/dtschema/validator.py was added
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/WHEEL was removed

--===============0805959483461823020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/__pycache__/schema.cpython-311.pyc /usr/lib/python3.11/site-packages/dtschema/validator.py /usr/lib/python3.11/site-packages/dtschema/fixups.py /usr/lib/python3.11/site-packages/dtschema/schema.py /usr/lib/python3.11/site-packages/dtschema/__pycache__/fixups.cpython-311.pyc /usr/lib/python3.11/site-packages/dtschema/__pycache__/validator.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema/fixups.py was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/fixups.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/schema.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/__pycache__/validator.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/dtschema/schema.py was added
  /usr/lib/python3.11/site-packages/dtschema/validator.py was added
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info/WHEEL was removed

--===============0805959483461823020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.4-2023.6.1.patch"

RnJvbSA2MjA3NjRiNzIzMjQ1ZjQ2ZmMxYTdkODhlYWZhM2JlNGRhM2RlMDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MDA6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNCAtPiAyMDIzLjYuMQoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjMu
NC5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy42LjEu
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiCmluZGV4IGY4NzU2
M2ZhY2QuLjM4ZmYyNzE0ZjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNmRhZWZiOGY1NDQwM2I0ZDgyOTYxYjMzNDY1NzEyMDA1NzE3NDdh
YjAxOTUwZmQzNmMxZjY5OTUwZmE3YThjZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkOWRjMTFj
ZWE2YTQ2YWUyZWU1YWM0YTVhMWM3ZGE3Y2IzNzA0NDE3Y2IzOTA4ODE4MjA0NjBmN2M2MWViNzg0
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVtYSBweXRob24z
LXJmYzM5ODciCi0tIAoyLjM5LjIKCg==

--===============0805959483461823020==--

