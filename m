Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A37CAC5B1
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30884.1757937276286159986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b1DKHMku;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SygwYQad;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a2976-4b459f61-9683-4105-a25c-649c1f4ee63a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jzXoI0ChEvW/tTmqXOvfThNTuiXMBbjFa8g1Wdn4A1E=;
	b=b1DKHMkukJqWRlWEFev5L8qOLc2dA0aAmRP2tSPwgUW2wsn1RzLtYZLnY1C0WL9w
	ISfAIGhWxbcf8llcG/aux4vIWathcHMiVbhpmY5GBFpmd8JZ+2ylK5qblFD43Q4dLR6
	/dNphqjif5UosfokbQO1KF5ShNzfZwabRA5kdgeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jzXoI0ChEvW/tTmqXOvfThNTuiXMBbjFa8g1Wdn4A1E=;
	b=SygwYQadzmTfhfQpM4DSq2oNOKtbidcni7sGCPtVXGfhDeFUAIrbJxbIosL5Eybg
	U6VpXRehSuwzO/nW9su28w1SubiqdznGr3Airem8JgnxJ9wScqXRY4Ge91dTqUoKfsV
	ZfXyrTNqQ3E5wO1qSihHnTsQjHBD3evKXXuys0sw=
Content-Type: multipart/mixed; boundary="===============1304112129759627919=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.2.0 SUCCEEDED
Message-ID: <010101994d3a2976-4b459f61-9683-4105-a25c-649c1f4ee63a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223425

--===============1304112129759627919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.1.3-2.2.0.patch
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
From 91a5e4eb1c22d5730751a268578435f4f74cfb36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:16:24 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.1.3 -> 2.2.0

---
 ...ython3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb b/meta/recipes-devtools/python/python3-poetry-core_2.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.2.0.bb
index 12c4751de8..95f7cfc1a2 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.2.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "0522a015477ed622c89aad56a477a57813cace0c8e7ff2a2906b7ef4a2e296a4"
+SRC_URI[sha256sum] = "b4033b71b99717a942030e074fec7e3082e5fde7a8ed10f02cd2413bdf940b1f"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============1304112129759627919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.1.3.tar.gz;downloadfilename=poetry_core-2.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.2.0.tar.gz;downloadfilename=poetry_core-2.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2494216 to 2540904 (+2%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.1.3" to "2.2.0"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: removed "/usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/METADATA /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/WHEEL"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed

--===============1304112129759627919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: removed "/usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/METADATA /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed

--===============1304112129759627919==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.1.3-2.2.0.patch"

RnJvbSA5MWE1ZTRlYjFjMjJkNTczMDc1MWEyNjg1Nzg0MzVmNGY3NGNmYjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MTY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIuMS4zIC0+IDIuMi4wCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8yLjEuMy5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4x
LjMuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8yLjIuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4y
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4yLjAuYmIKaW5kZXgg
MTJjNDc1MWRlOC4uOTVmN2NmYzFhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjIuMC5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDUyMmEwMTU0NzdlZDYyMmM4OWFhZDU2YTQ3
N2E1NzgxM2NhY2UwYzhlN2ZmMmEyOTA2YjdlZjRhMmUyOTZhNCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiNDAzM2I3MWI5OTcxN2E5NDIwMzBlMDc0ZmVjN2UzMDgyZTVmZGU3YThlZDEwZjAyY2Qy
NDEzYmRmOTQwYjFmIgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDcuMQoK

--===============1304112129759627919==--

