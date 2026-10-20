Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1925.1792480405737057435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N5S1bwyw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VByATbbw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1582865c3-2151d2be-5cde-489b-9c70-885e5b3d969f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F2gbj+NvcwN2zz84iYLZTftDCukXo0Xyc4VobTSlTuc=;
	b=N5S1bwywJ3b4tZMq2leC4rtIlG0xoKXHa8UwVcCn7AV86Kbk0eWzmjKsxOintgPm
	ARU3V7qdbUfGctwF9zlwNqA4LERjPyBhnFxyMBATTThLBnXtFv3LiOllY/s/IWPhbpL
	Q2kVL7tQMnzmJvCq1PhUidJOgvv+GxqVV6RZ1uB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F2gbj+NvcwN2zz84iYLZTftDCukXo0Xyc4VobTSlTuc=;
	b=VByATbbwxeM06HQl1/rPqNqzmgQTA6lnqzKx0TMZp+ba1VTkNjwdJ6XG6RcYrGNW
	59HTYZ+TQtXqc6Y8G6/JGDvewh1UGH7FlQ8LV7lKhFY32mVmSbYN8fHUcCo36ndQgCE
	q7gaoW06tZ8rlp2x1WC6y0IMPAFaOi9u6q8RZ/PE=
Content-Type: multipart/mixed; boundary="===============5782718976238844536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.4 SUCCEEDED
Message-ID: <010101a1582865c3-2151d2be-5cde-489b-9c70-885e5b3d969f-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248229

--===============5782718976238844536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.2.1-3.4.patch
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
From 169308bd7b62852e50f7464d7286da2285c79d2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:24:26 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.2.1 -> 3.4

---
 ...{python3-jsonpointer_3.2.1.bb => python3-jsonpointer_3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.2.1.bb => python3-jsonpointer_3.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
index 16a393ad28..1fa8ce7551 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "47c846513b3a4ec46eecef1105207fba075e2a3659048e362bd7daff0fc33342"
+SRC_URI[sha256sum] = "e57015ae65af3821c6a3976069860789cf326103f38b22b2178d41d021adad25"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============5782718976238844536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.2.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.4.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 24138 to 32058 (+33%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.2.1" to "3.4"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 32814 to 38215 (+16%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.2.1 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.2.1" to "3.4"
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/WHEEL was removed

--===============5782718976238844536==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.2.1-3.4.patch"

RnJvbSAxNjkzMDhiZDdiNjI4NTJlNTBmNzQ2NGQ3Mjg2ZGEyMjg1Yzc5ZDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6MjQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuMi4xIC0+IDMuNAoKLS0tCiAuLi57cHl0aG9u
My1qc29ucG9pbnRlcl8zLjIuMS5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuNC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25wb2ludGVyXzMuMi4x
LmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy40LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjIuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjQuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy40LmJiCmluZGV4IDE2YTM5M2Fk
MjguLjFmYThjZTc1NTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1qc29ucG9pbnRlcl8zLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy40LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MzJiMTVjODQzYjdhMzI5MTMwZjRl
MjY2YTI4MWViYjMiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBzZXR1cHRvb2xzMwogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDdjODQ2NTEzYjNhNGVjNDZlZWNlZjExMDUyMDdmYmEwNzVlMmEzNjU5
MDQ4ZTM2MmJkN2RhZmYwZmMzMzM0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNTcwMTVhZTY1
YWYzODIxYzZhMzk3NjA2OTg2MDc4OWNmMzI2MTAzZjM4YjIyYjIxNzhkNDFkMDIxYWRhZDI1Igog
CiBTUkNfVVJJICs9ICIgXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4xCgo=

--===============5782718976238844536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 24138 to 32058 (+33%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 32814 to 38215 (+16%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.2.1.dist-info/WHEEL was removed

--===============5782718976238844536==--
