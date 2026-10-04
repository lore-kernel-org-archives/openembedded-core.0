Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14835CA5FEF
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 05:24:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18574.1791091480045421445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 22:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LNEZfrkC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uWQlWQbL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1055f118d-eae00941-7798-4074-a83d-c867585dbd1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791091479;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F4/hu+ku0qXx1sBwDEgOntnaLviY5lPVpzYyXFGlydE=;
	b=LNEZfrkCQXW/1gG03DbJA0trw0FatwZwYiorSLb0fgvMEbq20CggRaXI4aXYkuKC
	nG3AdpNrtG52d3cQiEzBCsSSRobDvPON8r2tZOgejTiuznBeXgoXUoC8E3MwpN2wces
	pG/aCeNWv/c/cbvv8/Ig9GYg7ukORUJNk0HvP2qs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791091479;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F4/hu+ku0qXx1sBwDEgOntnaLviY5lPVpzYyXFGlydE=;
	b=uWQlWQbLp7TJFySG5ZtXtgQflsSOjHIGq3lkWSvqjDYJRZ3+mYXGbkl/sNifgJlk
	+fa9BVxQwAIRD3QSxlNvNX01q04stAqNa1kyXLy+oxDaMe5YMsKXrxxEgBnpZfzqUow
	F1fe7nqsav82rxjDh8dy8WfDm+Vd6UPo8ohyj7Yo=
Content-Type: multipart/mixed; boundary="===============4876235368050608488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2026.5 SUCCEEDED
Message-ID: <010101a1055f118d-eae00941-7798-4074-a83d-c867585dbd1e-000000@us-west-2.amazonses.com>
Date: Sun, 4 Oct 2026 05:24:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.04-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247186

--===============4876235368050608488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2026.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2026.4-2026.5.patch
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
From e0a7c6fec77948f3c9605bcb9309c163329ab409 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 4 Oct 2026 05:07:14 +0000
Subject: [PATCH] python3-pytz: upgrade 2026.4 -> 2026.5

---
 .../python/{python3-pytz_2026.4.bb => python3-pytz_2026.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.4.bb => python3-pytz_2026.5.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.4.bb b/meta/recipes-devtools/python/python3-pytz_2026.5.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.4.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.5.bb
index 4a2eda07a6..4e210050df 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.4.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.5.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
+SRC_URI[sha256sum] = "fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============4876235368050608488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info

--===============4876235368050608488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2026.4-2026.5.patch"

RnJvbSBlMGE3YzZmZWM3Nzk0OGYzYzk2MDViY2I5MzA5YzE2MzMyOWFiNDA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNCBPY3QgMjAyNiAwNTowNzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDI2LjQgLT4gMjAyNi41CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0el8yMDI2LjQuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjYuNS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDI2LjQuYmIgPT4gcHl0
aG9uMy1weXR6XzIwMjYuNS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjUuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8y
MDI2LjUuYmIKaW5kZXggNGEyZWRhMDdhNi4uNGUyMTAwNTBkZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi40LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjYuNS5iYgpAQCAtNyw3ICs3
LDcgQEAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAogUFRF
U1RfUFlURVNUX0RJUiA9ICJweXR6L3Rlc3RzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDY0
MzAzNjQ1YmFmYWZkNzI0MTg4OTgzNjhiMjQyOTQ1OGY3MDljZjFlYjZhMTUzNzJmYmNjMzk2YjY0
ZGE2MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYTIzNzI0YjljNDg2NTQzYjlmZjU0YTMyN2Vl
NzU2OWFjODNhZGU1NGJiOWFmZDBmYzE4Njc2NjIwNDAxYzg2IgogCiBSREVQRU5EUzoke1BOfTpj
bGFzcy10YXJnZXQgKz0gIlwKICAgICBweXRob24zLWRhdGV0aW1lIFwKLS0gCjIuNDcuMQoK

--===============4876235368050608488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytz: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PV changed from "2026.4" to "2026.5"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2026.4 [default] to 2026.5 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1039895 to 1039294 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.5.dist-info

--===============4876235368050608488==--

