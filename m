Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4614.1794032732320568287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z6Q2lG/b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nG/N1ves;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1b4af0511-d8ebef7b-ec24-41c2-adff-07b58707203e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032731;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H4dZNf5ciJ3sq/bYrxn2fMkdk2n2G8sPaNcFPZDtLio=;
	b=Z6Q2lG/bNb3H3rWz6+i25eIJ5LjpLzLazI68QKcZIgkhh1HDA1Pv5Vs9PO47RyPC
	r0RSA+Q0zvLCHKvInZxB25G+3Sv2+qKkKIK+KoVgv7JyklUoJ+ETWPCvXRMcIpm59Ek
	cS1tgnJUqBKAC/dvDfnk4pvRkwahl9WBZj+0YpOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032731;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H4dZNf5ciJ3sq/bYrxn2fMkdk2n2G8sPaNcFPZDtLio=;
	b=nG/N1vesxpwt97n7iW2hofZedBwsQ7JS9KRiPEJsFN9BoTuiRurZfYDwUCvBhOvK
	iMGgE+yZ46BERe2YrAuCpUVRuSghPodcH0pG+zXmo386CjNrhW1lTVEqt8QCmlfZzeQ
	/LHpY3OYEgzA9dpbOcWD8gRyQT2Brj1c9cmgit/4=
Content-Type: multipart/mixed; boundary="===============3223674640165829176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.10 SUCCEEDED
Message-ID: <010101a1b4af0511-d8ebef7b-ec24-41c2-adff-07b58707203e-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249726

--===============3223674640165829176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.8-3.10.patch
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
From 2ce84a68fdff1de50bd651cf8fea201cfd1a626b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:41:42 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.8 -> 3.10

---
 .../{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.10.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.10.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.10.bb
index b9fdf6347e..a6227c3e33 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e19ea13a4cca355"
+SRC_URI[sha256sum] = "69349c0e738c93e9efa501397091f49ad302ae686293effd05d7755c06f88ef0"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============3223674640165829176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.10.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 49029 to 52415 (+7%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 41996 to 42521 (+1%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.8" to "3.10"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============3223674640165829176==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.8-3.10.patch"

RnJvbSAyY2U4NGE2OGZkZmYxZGU1MGJkNjUxY2Y4ZmVhMjAxY2ZkMWE2MjZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNTo0MTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnBvaW50ZXI6IHVwZ3JhZGUgMy44IC0+IDMuMTAKCi0tLQogLi4uL3tweXRob24z
LWpzb25wb2ludGVyXzMuOC5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMTAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29ucG9pbnRlcl8zLjguYmIg
PT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEwLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjguYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xMC5iYgppbmRleCBiOWZkZjYzNDdlLi5h
NjIyN2MzZTMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtanNvbnBvaW50ZXJfMy44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1qc29ucG9pbnRlcl8zLjEwLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MzJiMTVjODQzYjdhMzI5MTMwZjRlMjY2YTI4
MWViYjMiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTYyN2EyNTU2NDEzOTBiZmI0ZDUxZDRjZmJiOTA2NDgwNzhhZTg1NWI0NTgwNGVm
N2UxOWVhMTNhNGNjYTM1NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2OTM0OWMwZTczOGM5M2U5
ZWZhNTAxMzk3MDkxZjQ5YWQzMDJhZTY4NjI5M2VmZmQwNWQ3NzU1YzA2Zjg4ZWYwIgogCiBTUkNf
VVJJICs9ICIgXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4xCgo=

--===============3223674640165829176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============3223674640165829176==--
