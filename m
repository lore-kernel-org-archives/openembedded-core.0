Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582D0CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 05:21:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22056.1791696102717050656
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 22:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uLb89c2a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y4UOEmRd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a12968e172-f59c5f31-eb4f-4097-b118-2d9757b88a97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791696101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FRn9M/kzyvVC0qRmRVBlsoHyeIk7FOkC82ItYm5tJSc=;
	b=uLb89c2ahvB2xE7m/aKPEPx3HrRM551R50EwPeVL/VLyJB2DCz2MiwlD8/693HTf
	ThUOSaTyhKMlJGMn85TX9L+Ztz+yccpyU0JxFC0JXce5llQcppNVR/l6jo4Oo3RSdOr
	m35Hm973nrkLca+gxVPsFj0iAwE5OA+f5ZuF73Yk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791696101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FRn9M/kzyvVC0qRmRVBlsoHyeIk7FOkC82ItYm5tJSc=;
	b=Y4UOEmRdofX+eyi95by5c6x9o5CqwGE7B6CYSl8GtTaDpc8+qQE+ljmC0vlcVF6g
	4mMFHgJMDjTwLjxNceIto36gK5JVizSjnzElMMtDvh6WF3NTUH42Uw0T/RNSCQyfdw8
	Ef7eSnITkuOpEcCUap5oFjXWR+rtJIa9ewHdKf08=
Content-Type: multipart/mixed; boundary="===============3327821437533497075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.2.1 SUCCEEDED
Message-ID: <010101a12968e172-f59c5f31-eb4f-4097-b118-2d9757b88a97-000000@us-west-2.amazonses.com>
Date: Sun, 11 Oct 2026 05:21:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 05:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247504

--===============3327821437533497075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.1.1-3.2.1.patch
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
From aa476b777a0fff674d359fe41d79a640931e5cb2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 11 Oct 2026 05:10:33 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.1.1 -> 3.2.1

---
 ...ython3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.2.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
index ddc8e256a4..52e6d9a2df 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
+SRC_URI[sha256sum] = "47c846513b3a4ec46eecef1105207fba075e2a3659048e362bd7daff0fc33342"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============3327821437533497075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.1.1-3.2.1.patch"

RnJvbSBhYTQ3NmI3NzdhMGZmZjY3NGQzNTlmZTQxZDc5YTY0MDkzMWU1Y2IyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTEgT2N0IDIwMjYgMDU6MTA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuMS4xIC0+IDMuMi4xCgotLS0KIC4uLnl0aG9u
My1qc29ucG9pbnRlcl8zLjEuMS5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMi4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnBvaW50ZXJfMy4x
LjEuYmIgPT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjIuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4y
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4yLjEuYmIKaW5kZXgg
ZGRjOGUyNTZhNC4uNTJlNmQ5YTJkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjIuMS5iYgpAQCAtNSw3ICs1LDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3
YTMyOTEzMGY0ZTI2NmEyODFlYmIzIgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBiODAxYzdkYjMzYTkwNDAyNGY2MDA0ZDUyNmRjYzUz
YmJiOGE0YTBmNGUzMmJmZDEwYmVhZGY2MGFkZjE5MDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NDdjODQ2NTEzYjNhNGVjNDZlZWNlZjExMDUyMDdmYmEwNzVlMmEzNjU5MDQ4ZTM2MmJkN2RhZmYw
ZmMzMzM0MiIKIAogU1JDX1VSSSArPSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcu
MQoK

--===============3327821437533497075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 21091 (+64%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29602 to 32814 (+11%)
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info

--===============3327821437533497075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.2.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 21091 (+64%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.1.1" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29602 to 32814 (+11%)
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info

--===============3327821437533497075==--

