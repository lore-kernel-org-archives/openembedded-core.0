Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4549CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28523.1792389776604905144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MRwJxgwQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wQtMFvM1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a152c180ce-4a3fd236-4e15-4270-8ffb-30f3e4ff55be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M69zrmcwwbqLev/mFIy7IIOAbkLbY/sJ6m3+i6ULWaQ=;
	b=MRwJxgwQuUOmsOfR4WZpCnMxxQ0/uMAXc4PlyZCink5b+QKMcuWezl72BcVwj1FA
	083neGkjhEW2q87BUMqtzWL6cVdZSCn8x8GEkHgrPTHMVdYnadzO2+1ddef6RMB+/as
	Uu/bw6wZsVyUK8emi11B/8qL9XN4XN1SRVaN4h04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M69zrmcwwbqLev/mFIy7IIOAbkLbY/sJ6m3+i6ULWaQ=;
	b=wQtMFvM14socW1JNY/ozHadKDImq5zXeV5m2MI1bRuQu+/1ARNdAjvhiOpahklZ+
	dHzLDTJd0y8BQ5PHLMEWVaGsBz1UDM+3Q+9rtvNFIFq8KL4RSUw+N0FncKX8+vATa4X
	KGYhy3IPdtpP5J5mwNZPAoVJ8+BtXKT/e1PWYXJI=
Content-Type: multipart/mixed; boundary="===============5825651811152037890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.3 SUCCEEDED
Message-ID: <010101a152c180ce-4a3fd236-4e15-4270-8ffb-30f3e4ff55be-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248125

--===============5825651811152037890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.1.1-3.3.patch
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
From c9ec1cc948962eef2138ce6cfd2ea376c86b4097 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:38:26 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.1.1 -> 3.3

---
 ...{python3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.3.bb
index ddc8e256a4..51c7377e12 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
+SRC_URI[sha256sum] = "2d851da328132043289a03df1dbb1577b901ad9cd22911f515d17875fbc1773a"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============5825651811152037890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 25874 (+102%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29602 to 33350 (+13%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/WHEEL was removed

--===============5825651811152037890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 25874 (+102%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.1.1" to "3.3"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.3 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29602 to 33350 (+13%)
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/WHEEL was removed

--===============5825651811152037890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.1.1-3.3.patch"

RnJvbSBjOWVjMWNjOTQ4OTYyZWVmMjEzOGNlNmNmZDJlYTM3NmM4NmI0MDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6Mzg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuMS4xIC0+IDMuMwoKLS0tCiAuLi57cHl0aG9u
My1qc29ucG9pbnRlcl8zLjEuMS5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMy5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25wb2ludGVyXzMuMS4x
LmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy4zLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4zLmJiCmluZGV4IGRkYzhlMjU2
YTQuLjUxYzczNzdlMTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4zLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MzJiMTVjODQzYjdhMzI5MTMwZjRl
MjY2YTI4MWViYjMiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBzZXR1cHRvb2xzMwogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMGI4MDFjN2RiMzNhOTA0MDI0ZjYwMDRkNTI2ZGNjNTNiYmI4YTRhMGY0
ZTMyYmZkMTBiZWFkZjYwYWRmMTkwMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyZDg1MWRhMzI4
MTMyMDQzMjg5YTAzZGYxZGJiMTU3N2I5MDFhZDljZDIyOTExZjUxNWQxNzg3NWZiYzE3NzNhIgog
CiBTUkNfVVJJICs9ICIgXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4xCgo=

--===============5825651811152037890==--

