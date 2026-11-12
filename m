Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7363.1794460832629339379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uapXuRct;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MolY9Bbw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1ce335068-8a8ee8db-f18d-4094-aaaf-f6f48c9e6e75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T1Jm9ZnzQKzzPULPY2xD7LqVVGBMPOXLqMWTdihqzSc=;
	b=uapXuRct1EcQXYsB0p3tCTlblHHiXJk7DoBfcdJwhJZxggqakI+lCFc9LPEe74HH
	7bWd4pLNRd+koJ5uaqRxmaAx3W9SbXvXUxyjdTPecuBqILExOHZUJck8wFcJEQpKE8y
	l4Ffmp381gycCI2extyLgq+8TOme8HQ6eLvlpj3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T1Jm9ZnzQKzzPULPY2xD7LqVVGBMPOXLqMWTdihqzSc=;
	b=MolY9Bbwv6kLBNocS5RbafhrteuAFfbcAgF8hSOArG1MYFiEseki8wRl+yt24P4N
	Y7IllRZibfd6rf2RZ72sMJHH+RvJVtMzO2myU4mHptp4DxZWvLwW+m/ZWSGujraqVfk
	M7BxItZXp7oRfJUQtAK5MUrazgNQx7GNzNjmxlP8=
Content-Type: multipart/mixed; boundary="===============4407337019229330675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.12 SUCCEEDED
Message-ID: <010101a1ce335068-8a8ee8db-f18d-4094-aaaf-f6f48c9e6e75-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250069

--===============4407337019229330675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.8-3.12.patch
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
From 1d53e8ce060c9c696f9e227ef1204afc85a5c060 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 12 Nov 2026 05:19:05 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.8 -> 3.12

---
 .../{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.12.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.12.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.12.bb
index b9fdf6347e..c9a836c0f2 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e19ea13a4cca355"
+SRC_URI[sha256sum] = "7a3dcc11b64053eaa9c549e85e413f8d40a075215f793a331bed9182a14251ae"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============4407337019229330675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.12.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 49029 to 54827 (+12%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.8" to "3.12"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 41996 to 42954 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============4407337019229330675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 49029 to 54827 (+12%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.12.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============4407337019229330675==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.8-3.12.patch"

RnJvbSAxZDUzZThjZTA2MGM5YzY5NmY5ZTIyN2VmMTIwNGFmYzg1YTVjMDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTIgTm92IDIwMjYgMDU6MTk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuOCAtPiAzLjEyCgotLS0KIC4uLi97cHl0aG9u
My1qc29ucG9pbnRlcl8zLjguYmIgPT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEyLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJi
ID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy4xMi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMTIuYmIKc2lt
aWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWpzb25wb2ludGVyXzMuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMTIuYmIKaW5kZXggYjlmZGY2MzQ3ZS4u
YzlhODM2YzBmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWpzb25wb2ludGVyXzMuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xMi5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3YTMyOTEzMGY0ZTI2NmEy
ODFlYmIzIgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE2MjdhMjU1NjQxMzkwYmZiNGQ1MWQ0Y2ZiYjkwNjQ4MDc4YWU4NTViNDU4MDRl
ZjdlMTllYTEzYTRjY2EzNTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2EzZGNjMTFiNjQwNTNl
YWE5YzU0OWU4NWU0MTNmOGQ0MGEwNzUyMTVmNzkzYTMzMWJlZDkxODJhMTQyNTFhZSIKIAogU1JD
X1VSSSArPSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============4407337019229330675==--
