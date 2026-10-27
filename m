Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12847.1793079635255571593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 22:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gfi7Ux4H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i01uphvy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a17bdfea06-1bd5edad-caea-452a-8ee4-47f1c3d97ab8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793079634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zorzwb/BD1YFQMhQoqV7xGXDRxMpptP49+6O5HkFrNg=;
	b=Gfi7Ux4H7wBx9oK2NHwxBZJghAOwP8LQuIgIuNTtC7ErRRKd7Vq3FLss2m5Ph9xj
	QICibxRL0na4eVpjdGcAROnqy0hTAsr2KdE+SucS/5hZAZd37QP97WuGxT9Spg5RRlk
	V0tuw7YrliGrDeHapNydCwpNzX7ntGKlpOK8cQgs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793079634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zorzwb/BD1YFQMhQoqV7xGXDRxMpptP49+6O5HkFrNg=;
	b=i01uphvy6inf4D75ZfNQQS/nSRsIlTtbwBaV713++f1kndjE9ofT5mHk/Z6dOSks
	SZ6knMsiIhJuzcOqrqeoVRiPfnG5S9cyLPAytmMx6y48o1CiMuit7IcMX3yDAifpbI8
	U91HczNxs6kfmAz36AxTQ2nuK0gh5jJtjDGb1yMs=
Content-Type: multipart/mixed; boundary="===============1078438498893626112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.6 SUCCEEDED
Message-ID: <010101a17bdfea06-1bd5edad-caea-452a-8ee4-47f1c3d97ab8-000000@us-west-2.amazonses.com>
Date: Tue, 27 Oct 2026 05:40:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.27-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248707

--===============1078438498893626112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.4-3.6.patch
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
From 41ab32e6e6003746390ccca2ea620f9502bc9ebe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 27 Oct 2026 05:31:09 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.4 -> 3.6

---
 .../{python3-jsonpointer_3.4.bb => python3-jsonpointer_3.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.4.bb => python3-jsonpointer_3.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.6.bb
index 1fa8ce7551..c8119b901d 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "e57015ae65af3821c6a3976069860789cf326103f38b22b2178d41d021adad25"
+SRC_URI[sha256sum] = "82e839a3ba3a9e2b54394fda8b3d276c2459d80408d06ef9a6fbc369d7544ffc"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============1078438498893626112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.4.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.6.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 32058 to 37715 (+18%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.4" to "3.6"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.4 [default] to 3.6 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 38215 to 39916 (+4%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.4" to "3.6"
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info

--===============1078438498893626112==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.4-3.6.patch"

RnJvbSA0MWFiMzJlNmU2MDAzNzQ2MzkwY2NjYTJlYTYyMGY5NTAyYmM5ZWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjcgT2N0IDIwMjYgMDU6MzE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuNCAtPiAzLjYKCi0tLQogLi4uL3tweXRob24z
LWpzb25wb2ludGVyXzMuNC5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuNi5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29ucG9pbnRlcl8zLjQuYmIg
PT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjYuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuNC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjYuYmIKc2ltaWxh
cml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWpzb25wb2ludGVyXzMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuNi5iYgppbmRleCAxZmE4Y2U3NTUxLi5jODEx
OWI5MDFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
anNvbnBvaW50ZXJfMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1qc29ucG9pbnRlcl8zLjYuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0zMmIxNWM4NDNiN2EzMjkxMzBmNGUyNjZhMjgxZWJi
MyIKIAogaW5oZXJpdCBweXBpIHB0ZXN0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJlNTcwMTVhZTY1YWYzODIxYzZhMzk3NjA2OTg2MDc4OWNmMzI2MTAzZjM4YjIyYjIxNzhk
NDFkMDIxYWRhZDI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgyZTgzOWEzYmEzYTllMmI1NDM5
NGZkYThiM2QyNzZjMjQ1OWQ4MDQwOGQwNmVmOWE2ZmJjMzY5ZDc1NDRmZmMiCiAKIFNSQ19VUkkg
Kz0gIiBcCiAJZmlsZTovL3J1bi1wdGVzdCBcCi0tIAoyLjQ3LjEKCg==

--===============1078438498893626112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 32058 to 37715 (+18%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.6.dist-info

--===============1078438498893626112==--
