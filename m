Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7550ACA9EC6
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:38:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4311.1791610673470007170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 22:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G6cclvd8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mLV0vWfV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a12451554c-186e1319-d0df-4000-82aa-22b3a5cc0d85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791610672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nvPu6c94rYEoGbKWZYefNsBVvyYc88765SXozJqPvdk=;
	b=G6cclvd8PIZMt1XWJMoUaqt6eaRnrWrqPsUxx61JAtCCOBvQSfJ1zytfJJndHruB
	cNuWgCt1tTmhViOHG2+btofwMyLLjyItr3b/oOK7KAQ6SkrmD/HV4KqU3mlT7VETjKf
	gRcwJaCZHk0EPx5/4ZclyISlHjXSMsfXnaChmahw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791610672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nvPu6c94rYEoGbKWZYefNsBVvyYc88765SXozJqPvdk=;
	b=mLV0vWfVAyTLl7hRZ7QFz1QgPg49qYI/DqspB18owXvZiYlyTM061JB46POYDN5/
	Om6Mm90bJo/M3oPdWZ9h0us+Gmrq/jfxJTSLY7vRT773Yl/A6OuACR5HKxhziXRp6g1
	FweIDe6NWr5fqsQG/+t32SvBy4Z8qf2k3atrPoUE=
Content-Type: multipart/mixed; boundary="===============9000730972625038270=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 3.11 SUCCEEDED
Message-ID: <010101a12451554c-186e1319-d0df-4000-82aa-22b3a5cc0d85-000000@us-west-2.amazonses.com>
Date: Sat, 10 Oct 2026 05:37:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 05:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247490

--===============9000730972625038270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-3.0-3.11.patch
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
From 1bd0c311d8c598886a10b705aabfd1b3cdb1238c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 10 Oct 2026 05:09:39 +0000
Subject: [PATCH] python3-pycparser: upgrade 3.0 -> 3.11

---
 ...arser_3.0.bb => python3-pycparser_3.11.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_3.0.bb => python3-pycparser_3.11.bb} (32%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta/recipes-devtools/python/python3-pycparser_3.11.bb
similarity index 32%
rename from meta/recipes-devtools/python/python3-pycparser_3.0.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.11.bb
index ea7b7cc14b..464a69bac5 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.11.bb
@@ -1,9 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  pycparser -- A C parser in Python
+#  
+# -Copyright (c) 2008-2022, Eli Bendersky
+# +Copyright (c) 2008-2027, Eli Bendersky
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without modification,
+# 
+#
+
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c453675224ee9a35b46135214d26c055"
 
-SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
+SRC_URI[sha256sum] = "d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============9000730972625038270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-3.0-3.11.patch"

RnJvbSAxYmQwYzMxMWQ4YzU5ODg4NmExMGI3MDVhYWJmZDFiM2NkYjEyMzhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjYgMDU6MDk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3BhcnNlcjogdXBncmFkZSAzLjAgLT4gMy4xMQoKLS0tCiAuLi5hcnNlcl8zLjAu
YmIgPT4gcHl0aG9uMy1weWNwYXJzZXJfMy4xMS5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3BhcnNlcl8zLjAuYmIg
PT4gcHl0aG9uMy1weWNwYXJzZXJfMy4xMS5iYn0gKDMyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFyc2VyXzMuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMy4xMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDMyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHljcGFyc2VyXzMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Y3BhcnNlcl8zLjExLmJiCmluZGV4IGVhN2I3Y2MxNGIuLjQ2NGE2OWJhYzUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJz
ZXJfMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNw
YXJzZXJfMy4xMS5iYgpAQCAtMSw5ICsxLDMwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NI
S1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRo
ZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3
IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVk
ZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZp
YSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNv
cHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElD
RU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIHB5Y3BhcnNlciAtLSBB
IEMgcGFyc2VyIGluIFB5dGhvbgorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMDgtMjAyMiwgRWxp
IEJlbmRlcnNreQorIyArQ29weXJpZ2h0IChjKSAyMDA4LTIwMjcsIEVsaSBCZW5kZXJza3kKKyMg
IEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4g
c291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24sCisj
IAorIworCiBTVU1NQVJZID0gIlBhcnNlciBvZiB0aGUgQyBsYW5ndWFnZSwgd3JpdHRlbiBpbiBw
dXJlIFB5dGhvbiIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9lbGliZW4vcHljcGFy
c2VyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT05NzYxYzNmZmVlN2JhOTljNjBkY2EwNDA4ZmQzMjYyYiIKK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM0NTM2NzUyMjRlZTlhMzViNDYxMzUyMTRk
MjZjMDU1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjAwZjQ5ZDIxNzMwNGE1OTAyYWMzYzM3
ZTEyODFjOWZlOTRlNGQwNDg5ZGU2NDNhOTUwNGM1Y2RmZGZjNmIyOSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkODc1ZjA5YzM1MDdkMDBlMWFiYTBlZWNjNmRjYWRjMTM1MmYzMGZmZjA5ZGM2YmZm
MmYxYzI5MzVlOTdjMmJjIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============9000730972625038270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.11.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "3.0" to "3.11"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 3.0 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 474185 to 493431 (+4%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/WHEEL was removed

--===============9000730972625038270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycparser-3.0.dist-info/WHEEL was removed

--===============9000730972625038270==--

