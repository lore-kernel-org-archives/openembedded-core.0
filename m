Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4FCA1013
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.5729.1693650553507364878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RYX++jYk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i12H9ar7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a5570886e-b713d6ca-135e-4562-be6a-cd5e04b83874-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fjjvjzuzfmMAlFkRfn2E2h086J/mz+l9YoG4DHQlE4o=;
	b=RYX++jYkDTdqq3R354wgNqquyDUXug06Hr+qNvWLGx7kvfd1KVv+3qbpHmiFfAAD
	NGNNtIFyqUNyJ64cw3U47+s1/zLJcrrJPqnH/VajLiKC3/aHlBFj1Z059ya5NrxXRm1
	8MQXkOXIY/2PT4e1i3zheW4Z6ItWijjn8MeJSVS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fjjvjzuzfmMAlFkRfn2E2h086J/mz+l9YoG4DHQlE4o=;
	b=i12H9ar7MH+Pjlx0F2g3SWXhtmsD09YUMLKnHeAhL8UW1IJzO3PfaKMmmNpL81qa
	WqX876d1CAV18L8KS9y7RPROo9yYE/nyeQnDOTUBR/BczmCSpMRVeMqC35wAhrS2bq6
	DQgMZgpVIuel5skgEK+XIZy7wOdWsQr+wlPei96w=
Content-Type: multipart/mixed; boundary="===============3589010173000742268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.7 SUCCEEDED
Message-ID: <0101018a5570886e-b713d6ca-135e-4562-be6a-cd5e04b83874-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187065

--===============3589010173000742268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch
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
From 2c6915289386244d278576e992d82a4bbee87bc4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 14:54:31 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.6.1 -> 2023.7

---
 ...{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.7.bb
index 0c2c156ec4..c1dc3e019a 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
+SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============3589010173000742268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.6.1.tar.gz;downloadfilename=dtschema-2023.6.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.7.tar.gz;downloadfilename=dtschema-2023.7.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 299330 to 299324 (-0%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============3589010173000742268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============3589010173000742268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch"

RnJvbSAyYzY5MTUyODkzODYyNDRkMjc4NTc2ZTk5MmQ4MmE0YmJlZTg3YmM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNDo1NDozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMy42LjEgLT4gMjAyMy43CgotLS0KIC4uLntweXRo
b24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyMy42
LjEuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcuYmIKaW5kZXggMGMyYzE1
NmVjNC4uYzFkYzNlMDE5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVy
aXQgcHlwaSBzZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkOWRjMTFjZWE2YTQ2YWUyZWU1YWM0YTVhMWM3ZGE3Y2IzNzA0NDE3
Y2IzOTA4ODE4MjA0NjBmN2M2MWViNzg0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRlN2NkNzNh
MzUyNDRjZjc2YThjZGQ5OTE5YmJlYjMxZjM2MmFhNTc0NGYzYzc2YzgwZTBlNjEyNDg5ZGQwYzAi
CiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6
JHtQTn0gKz0gIlwKLS0gCjIuMzkuMgoK

--===============3589010173000742268==--

