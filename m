Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8A1C54E69
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2090.1706810404602702708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V2lwerFQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cjk2J075;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d65d3f399-56b6fc43-6f60-486b-a958-a45a73613dd7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mw5ZlvXRkmK8rw4XjKj75TqZK1vJZ8MGqbewakHTmzE=;
	b=V2lwerFQy4EHsku2Y//k6zZqUPiQZ0051S0wRJp7AWo10wfR1ui4y0NDGsuv9Jcy
	L7HQmDlEOlUT7MY5nNnLO7nhi1aasalO0oodcEChXtacsPy9x2F8tzn8LfAwOGlooJh
	g3QNbnK8+6aEYRCi6tAsJY+3rFUE+A9QzTXhtMQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mw5ZlvXRkmK8rw4XjKj75TqZK1vJZ8MGqbewakHTmzE=;
	b=cjk2J075m4zMKcChdX4zQ/7hamOdPLxsYvIW3XxiPw03R/v7QNBo6JelZ3b1NiME
	/iW/IC8gki2u1U7ObMt8ZqiyfiOIEdZIHQfMKchb7B7iL2ZYP5K8Sm2ZQV8fBVT9y4M
	lU2lsoy6EOtOFZxxLwGvlm2lk6afN7z6/RWdSuOw=
Content-Type: multipart/mixed; boundary="===============7809682046777593257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-serializinghtml: upgrading to 1.1.10
 SUCCEEDED
Message-ID: <0101018d65d3f399-56b6fc43-6f60-486b-a958-a45a73613dd7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194638

--===============7809682046777593257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-serializinghtml* to *1.1.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-serializinghtml-upgrade-1.1.9-.patch
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
From 1a85de1158df8cee532c83960a26e0a659978d68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:36:30 +0000
Subject: [PATCH] python3-sphinxcontrib-serializinghtml: upgrade 1.1.9 ->
 1.1.10

---
 ...1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
index fbf0c3c9b2..b13bc82977 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 
-SRC_URI[sha256sum] = "0c64ff898339e1fac29abd2bf5f11078f3ec413cfe9c046d3120d7ca65530b54"
+SRC_URI[sha256sum] = "93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c158e8436a2c4511f"
 
 PYPI_PACKAGE = "sphinxcontrib-serializinghtml"
 
-- 
2.42.0


--===============7809682046777593257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/WHEEL was removed

--===============7809682046777593257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-serializinghtml/sphinxcontrib_serializinghtml-1.1.9.tar.gz;downloadfilename=sphinxcontrib_serializinghtml-1.1.9.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-serializinghtml/sphinxcontrib_serializinghtml-1.1.10.tar.gz;downloadfilename=sphinxcontrib_serializinghtml-1.1.10.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dbg: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dbg: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dev: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-doc: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-doc: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-locale: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-locale: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-src: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-src: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-staticdev: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-staticdev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PKGSIZE changed from 132530 to 132688 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/WHEEL was removed

--===============7809682046777593257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-serializinghtml-upgrade-1.1.9-.patch"

RnJvbSAxYTg1ZGUxMTU4ZGY4Y2VlNTMyYzgzOTYwYTI2ZTBhNjU5OTc4ZDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODozNjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWw6IHVwZ3JhZGUgMS4xLjkgLT4KIDEu
MS4xMAoKLS0tCiAuLi4xLjEuOS5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItc2VyaWFsaXpp
bmdodG1sXzEuMS4xMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNwaGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1sXzEuMS45LmJiID0+IHB5dGhvbjMtc3Bo
aW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWxfMS4xLjEwLmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLXNlcmlh
bGl6aW5naHRtbF8xLjEuOS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhjb250cmliLXNlcmlhbGl6aW5naHRtbF8xLjEuMTAuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNw
aGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1sXzEuMS45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWxf
MS4xLjEwLmJiCmluZGV4IGZiZjBjM2M5YjIuLmIxM2JjODI5NzcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLXNlcmlhbGl6aW5n
aHRtbF8xLjEuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWxfMS4xLjEwLmJiCkBAIC0zLDcgKzMsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5zcGhpbngtZG9jLm9yZyIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzJhODRhYzVj
ZDNiYmQxMGM0ZDQ3OTIzM2FkNTg4YjYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwYzY0ZmY4
OTgzMzllMWZhYzI5YWJkMmJmNWYxMTA3OGYzZWM0MTNjZmU5YzA0NmQzMTIwZDdjYTY1NTMwYjU0
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkzZjNmNWRjNDU4YjkxYjE5MmZlMTBjMzk3ZTMyNGYy
NjJjZjE2M2Q3OWYzMjgyYzE1OGU4NDM2YTJjNDUxMWYiCiAKIFBZUElfUEFDS0FHRSA9ICJzcGhp
bnhjb250cmliLXNlcmlhbGl6aW5naHRtbCIKIAotLSAKMi40Mi4wCgo=

--===============7809682046777593257==--

