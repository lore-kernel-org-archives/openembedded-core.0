Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69CACA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9085.1791437149190725688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 22:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RS5R4kCd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pq9E3YDi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a119f98fce-0bf9c046-2e3d-447a-9b5e-a313d3670128-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791437148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/lfrz5pkPQ52iXqtv7SUdD3mSlI9Z2sYbaqKRJlWE3g=;
	b=RS5R4kCdSCYdceAZxdACS8GsIdtTkMW+QSKnLdwe7CzLLlGvWDYViLHLZQULuugx
	zBRL0HrU5nSsWd72aLqHPP1YmG3BIrHbeXlC0XGubJZUNFPL8h1cxs7Em+ocFeXkRiA
	QS+uUFmSDZyVzxgbJcBdCDYPQReA3XKXSwmq81Dc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791437148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/lfrz5pkPQ52iXqtv7SUdD3mSlI9Z2sYbaqKRJlWE3g=;
	b=pq9E3YDibS8trGAD7/RdTqMqH88IY7S6dyfKkRCdP9XUrZHSySkeP2pJ+u3z8ve6
	E5VFNQTVIOipxeVfYiDgxAPexJZ8RxoJUIzjrpgRX8zdvsnCIT0pPtUuF057ObJJ5lD
	mgz7dpTMVNCOQX0IjmBuHUgWeDrcFX3bKNtxTNuA=
Content-Type: multipart/mixed; boundary="===============7428927317938067735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.2.0 SUCCEEDED
Message-ID: <010101a119f98fce-0bf9c046-2e3d-447a-9b5e-a313d3670128-000000@us-west-2.amazonses.com>
Date: Thu, 8 Oct 2026 05:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.08-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 05:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247406

--===============7428927317938067735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.1.1-3.2.0.patch
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
From a0a8546463e8f33c28400a3447c660bac983d70f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 8 Oct 2026 05:07:03 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.1.1 -> 3.2.0

---
 ...ython3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb => python3-jsonpointer_3.2.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.2.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.2.0.bb
index ddc8e256a4..9ed5231dc9 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
+SRC_URI[sha256sum] = "807db557622fbe07a0d49e19cf4795a269d55eee5ba345fb9959d148eba5ef94"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============7428927317938067735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.1.1-3.2.0.patch"

RnJvbSBhMGE4NTQ2NDYzZThmMzNjMjg0MDBhMzQ0N2M2NjBiYWM5ODNkNzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOCBPY3QgMjAyNiAwNTowNzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnBvaW50ZXI6IHVwZ3JhZGUgMy4xLjEgLT4gMy4yLjAKCi0tLQogLi4ueXRob24z
LWpzb25wb2ludGVyXzMuMS4xLmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy4yLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29ucG9pbnRlcl8zLjEu
MS5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMi4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjIu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjIuMC5iYgppbmRleCBk
ZGM4ZTI1NmE0Li45ZWQ1MjMxZGM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMi4wLmJiCkBAIC01LDcgKzUsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MzJiMTVjODQzYjdh
MzI5MTMwZjRlMjY2YTI4MWViYjMiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBzZXR1cHRvb2xzMwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGI4MDFjN2RiMzNhOTA0MDI0ZjYwMDRkNTI2ZGNjNTNi
YmI4YTRhMGY0ZTMyYmZkMTBiZWFkZjYwYWRmMTkwMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4
MDdkYjU1NzYyMmZiZTA3YTBkNDllMTljZjQ3OTVhMjY5ZDU1ZWVlNWJhMzQ1ZmI5OTU5ZDE0OGVi
YTVlZjk0IgogCiBTUkNfVVJJICs9ICIgXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4x
Cgo=

--===============7428927317938067735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 20463 (+59%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info

--===============7428927317938067735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.2.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 12837 to 20463 (+59%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.1.1 [default] to 3.2.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29602 to 32505 (+10%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.1.1" to "3.2.0"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.2.0.dist-info

--===============7428927317938067735==--

