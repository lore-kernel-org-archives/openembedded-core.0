Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8305.1794115345268111178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 21:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fTH8SAg1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AhbAE5fz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1b99b98a3-64044f0c-9724-40a6-98b0-ee333d0809e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZmInd3j8tIXr/fHNmexuNsNfT9JAoDFNQEuC0ZdqHds=;
	b=fTH8SAg1Y+13m5Av0eDn6P/+z1FI32TSh983o74CDTeea9A8L39vFd5L0llmidFI
	slSKKZyuRobfUa+4VLZNeQUrwr6mMNQEeI/VEEJWllVplz7qLPqsS7q7gVUiZIRN3ET
	Fj+OC+HVzjYJc+ymq0IslEzSNXN2DPfBasaRsKAw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZmInd3j8tIXr/fHNmexuNsNfT9JAoDFNQEuC0ZdqHds=;
	b=AhbAE5fzIX0f6L17QCpm4PI63m3ZMwQHuDazjGjEvQLmvi5coNvVpfEqc6txH5cp
	8wk0USjX0/WzA6pqMXAuNtYcOEzrbvUCAnmJnUXOf0RckIkMpAR3GDGNcnGzQ//iJVr
	u+1FerbT4xQCXPpbLUZc2+INM2mdJUe5e1KVS5ss=
Content-Type: multipart/mixed; boundary="===============8625184525385289766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.1.3 SUCCEEDED
Message-ID: <010101a1b99b98a3-64044f0c-9724-40a6-98b0-ee333d0809e6-000000@us-west-2.amazonses.com>
Date: Sun, 8 Nov 2026 05:22:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.08-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 05:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249748

--===============8625184525385289766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.1.0-7.1.3.patch
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
From 237704daaa9c1f62530aabb50d676c482bcc4c4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 8 Nov 2026 05:16:44 +0000
Subject: [PATCH] python3-pbr: upgrade 7.1.0 -> 7.1.3

7.1.3
-----

7.1.2
-----

7.1.1
-----
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.3.bb
index 7fc227e6bb..e11dbe6398 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.3.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "9a4a85b84e906337708009af0b5f5cdabeeb72d4dc213c9e97974da54fd9acc5"
-- 
2.47.1


--===============8625184525385289766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 740280 to 741067 (+0%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.1.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info

--===============8625184525385289766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pbr-changelog.txt"

7.1.3
-----

7.1.2
-----

7.1.1
-----

--===============8625184525385289766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.1.0-7.1.3.patch"

RnJvbSAyMzc3MDRkYWFhOWMxZjYyNTMwYWFiYjUwZDY3NmM0ODJiY2M0YzRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOCBOb3YgMjAyNiAwNToxNjo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGJyOiB1cGdyYWRlIDcuMS4wIC0+IDcuMS4zCgo3LjEuMwotLS0tLQoKNy4xLjIKLS0t
LS0KCjcuMS4xCi0tLS0tCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wYnJfNy4xLjAuYmIgPT4g
cHl0aG9uMy1wYnJfNy4xLjMuYmJ9ICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1wYnJfNy4xLjAuYmIgPT4gcHl0aG9uMy1wYnJfNy4xLjMuYmJ9ICg4MyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83
LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4xLjMu
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBicl83LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBicl83LjEuMy5iYgppbmRleCA3ZmMyMjdlNmJiLi5lMTFkYmU2
Mzk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJy
XzcuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJf
Ny4xLjMuYmIKQEAgLTEzLDQgKzEzLDQgQEAgUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMtc2V0
dXB0b29scyIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNjZlY2UzYTJmNWM0ZjA1ZTVmMzc1NjkyMTNlNzU1MTkzZjZlMDBiOGFh
MzYxYmZiMTkwNTMzZWE4ZWU4YjEwYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5YTRhODViODRl
OTA2MzM3NzA4MDA5YWYwYjVmNWNkYWJlZWI3MmQ0ZGMyMTNjOWU5Nzk3NGRhNTRmZDlhY2M1Igot
LSAKMi40Ny4xCgo=

--===============8625184525385289766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.3.dist-info

--===============8625184525385289766==--
