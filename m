Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6693.1793597017633413497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 21:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pRIEYAy2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YpSpjix9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a19ab68a43-ca5d3390-e6a7-432c-b833-0f6975b95468-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793597016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aLjVCj5V/Gig7ELz1LVWY+A29Ywx00L8mAnMIS24Ucs=;
	b=pRIEYAy2rLqvLHzXCTOX6GtPQtKrp59g9Uj2NKx9xWPOf+JWQzygi5q/ZkSo2xvf
	9yIM2Q8NUvwDhH09Ge5v5IljYcpzoC9JYpXoAxBV9PSsPYlBute+mqkIuDmqGU4DY79
	E2gahLQRvhvilgd6Cu6PjCYkoxPtwE0KZMrETTrw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793597016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aLjVCj5V/Gig7ELz1LVWY+A29Ywx00L8mAnMIS24Ucs=;
	b=YpSpjix9sXoMJ2vBk1lLHvxggXS8x60QSMNgj78xB3NfDX3B78YPCrn0U/Z5+Pki
	JmGbqzRO5zFEyn8Wu/0TrC6Cuhym8h5ETbXImtNxgK/fxquwQXgLYA+EkwSUjytRGfP
	JeXoPNEGPZVgfVXSHyAygVmlp23aAtURm9kt8iVo=
Content-Type: multipart/mixed; boundary="===============8901186637447167499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.7 SUCCEEDED
Message-ID: <010101a19ab68a43-ca5d3390-e6a7-432c-b833-0f6975b95468-000000@us-west-2.amazonses.com>
Date: Mon, 2 Nov 2026 05:23:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 05:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249177

--===============8901186637447167499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.5-3.7.patch
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
From ff084056408bb76dbb4f5c7851f37d4600ed8359 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 2 Nov 2026 05:14:25 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.5 -> 3.7

---
 .../{python3-jsonpointer_3.5.bb => python3-jsonpointer_3.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.5.bb => python3-jsonpointer_3.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.7.bb
index dc39b0ea38..97d7a30d9f 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "81f28618a019cf1b011a6cf757439737972de1ccbeca2e1f86dfb4d661800792"
+SRC_URI[sha256sum] = "58734c45431c9a268df029a39bce8d57e8aebe32f1d58d28a17c9aa246e10929"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============8901186637447167499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.5.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.7.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 34753 to 39633 (+14%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.5 [default] to 3.7 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 38437 to 40030 (+4%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.5" to "3.7"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.5 [default] to 3.7 [default]
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info

--===============8901186637447167499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.5-3.7.patch"

RnJvbSBmZjA4NDA1NjQwOGJiNzZkYmI0ZjVjNzg1MWYzN2Q0NjAwZWQ4MzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMiBOb3YgMjAyNiAwNToxNDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnBvaW50ZXI6IHVwZ3JhZGUgMy41IC0+IDMuNwoKLS0tCiAuLi4ve3B5dGhvbjMt
anNvbnBvaW50ZXJfMy41LmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy43LmJifSAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25wb2ludGVyXzMuNS5iYiA9
PiBweXRob24zLWpzb25wb2ludGVyXzMuNy5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy41LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuNy5iYgpzaW1pbGFy
aXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtanNvbnBvaW50ZXJfMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy43LmJiCmluZGV4IGRjMzliMGVhMzguLjk3ZDdh
MzBkOWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1q
c29ucG9pbnRlcl8zLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWpzb25wb2ludGVyXzMuNy5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3YTMyOTEzMGY0ZTI2NmEyODFlYmIz
IgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjgxZjI4NjE4YTAxOWNmMWIwMTFhNmNmNzU3NDM5NzM3OTcyZGUxY2NiZWNhMmUxZjg2ZGZi
NGQ2NjE4MDA3OTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTg3MzRjNDU0MzFjOWEyNjhkZjAy
OWEzOWJjZThkNTdlOGFlYmUzMmYxZDU4ZDI4YTE3YzlhYTI0NmUxMDkyOSIKIAogU1JDX1VSSSAr
PSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============8901186637447167499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 34753 to 39633 (+14%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.7.dist-info

--===============8901186637447167499==--
