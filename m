Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507A7CD37A7
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15620.1777645536402545244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=36pQoKZ5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eBDQoKzh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee52d6-7b2cc556-18c4-4443-a446-a3de7bd5ac29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645540;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yPR26idf9AteVm6eq2NWJsQFpjLIjj2g5RFZUL5nvV8=;
	b=36pQoKZ5iWkAl94rxaqDZ7v3X476glP7PRSe9YLMlXpOMardtWv9otHPd1J+nOU3
	ItrlqwiewPAgDcio/okeJTeW/nDm9ULpug99+dZMXiTRmbHhPH0t2D1qbPiStRwmO5q
	ttUHoTeE56j2tVagAMh7jfwCFTxm3z5JSe0RjkAg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645540;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yPR26idf9AteVm6eq2NWJsQFpjLIjj2g5RFZUL5nvV8=;
	b=eBDQoKzh+vw7sqiZy+pkBmlnV2I7vMfvVW/qjNe6xuE93CP815iN7N6nVRWl+1A/
	5OTA8ti67f7s3Z70JGTtyIHNC2xYyLjG/JhdE9GF9maUmJB/Dcjb01AH158OFWS22+K
	anhSVFvpFRlIk/7gHXwQg/gn/u/kwDYK9LRPuhS8=
Content-Type: multipart/mixed; boundary="===============2256996693081569391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.1.1 SUCCEEDED
Message-ID: <0101019de3ee52d6-7b2cc556-18c4-4443-a446-a3de7bd5ac29-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236236

--===============2256996693081569391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.0.0-3.1.1.patch
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
From 08129909ddcf0a6bb05ec3d0cf226e4391507dcf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:24:25 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.0.0 -> 3.1.1

---
 ...ython3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
index 0a23dc3100..ddc8e256a4 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "2b2d729f2091522d61c3b31f82e11870f60b68f43fbc705cb76bf4b832af59ef"
+SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============2256996693081569391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info

--===============2256996693081569391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.0.0.tar.gz;downloadfilename=jsonpointer-3.0.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.1.1.tar.gz;downloadfilename=jsonpointer-3.1.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 13171 to 12837 (-3%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29746 to 29602 (-0%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info

--===============2256996693081569391==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.0.0-3.1.1.patch"

RnJvbSAwODEyOTkwOWRkY2YwYTZiYjA1ZWMzZDBjZjIyNmU0MzkxNTA3ZGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODoyNDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnBvaW50ZXI6IHVwZ3JhZGUgMy4wLjAgLT4gMy4xLjEKCi0tLQogLi4ueXRob24z
LWpzb25wb2ludGVyXzMuMC4wLmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy4xLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29ucG9pbnRlcl8zLjAu
MC5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjAuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5iYgppbmRleCAw
YTIzZGMzMTAwLi5kZGM4ZTI1NmE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJiCkBAIC01LDcgKzUsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MzJiMTVjODQzYjdh
MzI5MTMwZjRlMjY2YTI4MWViYjMiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBzZXR1cHRvb2xzMwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmIyZDcyOWYyMDkxNTIyZDYxYzNiMzFmODJlMTE4NzBm
NjBiNjhmNDNmYmM3MDVjYjc2YmY0YjgzMmFmNTllZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
YjgwMWM3ZGIzM2E5MDQwMjRmNjAwNGQ1MjZkY2M1M2JiYjhhNGEwZjRlMzJiZmQxMGJlYWRmNjBh
ZGYxOTAwIgogCiBTUkNfVVJJICs9ICIgXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4x
Cgo=

--===============2256996693081569391==--

