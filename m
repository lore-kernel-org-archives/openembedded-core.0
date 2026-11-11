Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3724.1794377110875382733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rhtuY6Un;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HooymQSl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1c935d0e8-dfa86278-b0f1-420c-b10c-94443c174044-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xgI2pwpIvgah+lYXbR6aHFYslBNAL/49vk+YvdeEqLo=;
	b=rhtuY6Un8Nqbdqc5TWD48ViCeedenGWjQRaBMTDDTX8k4lYvAtF96KPdF5n8Gd8n
	Te480WCnCGLWvTZSW260xc5xPWYaj9BfN3IWCgFucN/pP/osQPbdl6GNehfTZD8dtB9
	PAOGbLnEhAsYi6oO0oPbeFD79yNsas9DWGaRS88k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xgI2pwpIvgah+lYXbR6aHFYslBNAL/49vk+YvdeEqLo=;
	b=HooymQSlnb0oEvo02VESoN6fHb/SHhTyIl29h875ndQBGE0QmRlieqY7xVA8ZNej
	jxgyyZ22Zv+SE8ifHQSIVcS6V9QribgOkTKROyc445IakikJww+RtZVZZucGgyLFaOu
	JyD+dzbqzIFVtVOai7AH+vZEsyd+jRH/gYPZSwOQ=
Content-Type: multipart/mixed; boundary="===============8518632577949711928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.11 SUCCEEDED
Message-ID: <010101a1c935d0e8-dfa86278-b0f1-420c-b10c-94443c174044-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249958

--===============8518632577949711928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.8-3.11.patch
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
From 23511e0ad0d7b9e328d53666f5e3501bd798448a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:30:17 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.8 -> 3.11

---
 .../{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.11.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.11.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.11.bb
index b9fdf6347e..ed1d780373 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e19ea13a4cca355"
+SRC_URI[sha256sum] = "dac052acf401e2079cd3f4495b334cdaf073d74706992a7b2b6987c9ae2cf73f"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============8518632577949711928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.8-3.11.patch"

RnJvbSAyMzUxMWUwYWQwZDdiOWUzMjhkNTM2NjZmNWUzNTAxYmQ3OTg0NDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MzA6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuOCAtPiAzLjExCgotLS0KIC4uLi97cHl0aG9u
My1qc29ucG9pbnRlcl8zLjguYmIgPT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjExLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJi
ID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy4xMS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMTEuYmIKc2lt
aWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWpzb25wb2ludGVyXzMuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMTEuYmIKaW5kZXggYjlmZGY2MzQ3ZS4u
ZWQxZDc4MDM3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWpzb25wb2ludGVyXzMuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xMS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3YTMyOTEzMGY0ZTI2NmEy
ODFlYmIzIgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE2MjdhMjU1NjQxMzkwYmZiNGQ1MWQ0Y2ZiYjkwNjQ4MDc4YWU4NTViNDU4MDRl
ZjdlMTllYTEzYTRjY2EzNTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFjMDUyYWNmNDAxZTIw
NzljZDNmNDQ5NWIzMzRjZGFmMDczZDc0NzA2OTkyYTdiMmI2OTg3YzlhZTJjZjczZiIKIAogU1JD
X1VSSSArPSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============8518632577949711928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============8518632577949711928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.11.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 49029 to 53187 (+8%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.8 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 41996 to 42556 (+1%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.8" to "3.11"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.11 [default]
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/AUTHORS was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/WHEEL was removed

--===============8518632577949711928==--
