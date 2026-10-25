Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18336.1792905490719280353
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 22:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LEnBEI9b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vnN/lsL0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1717eacde-d04d8a7b-b6dd-443e-a673-4c47a6621afb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792905489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eo9inxps/5Wsp1225F9CA//8ySBuy8Xl8F+e1ksRU9Y=;
	b=LEnBEI9bGHF9t55LWaTeDaMvz6rE0wijrQvjn2QqCGvxyp1th24Y81YE00uE1CQe
	5cTunK4ZCy5hjVWUqCapXUX9QeiscSO/Y2P+gxH6ZyIhAztxfQx4HGGJXenhBqaX24v
	+o/hPG999KVHwBBNKE+F/0rwOLTQx2uOuOKiQzHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792905489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eo9inxps/5Wsp1225F9CA//8ySBuy8Xl8F+e1ksRU9Y=;
	b=vnN/lsL0WaDnqwXvsDFKMwVxxDxinO8JvnC302ay5Guj/krtXmgmBX0vpv93NNbF
	M4zWxCrC/70Vgie95+OOO1C+yn1+AuQvr12lDufWIKT3jXcY1HGTqwQSOLhb/ImNOS4
	YpNDPVmnlUQM6Ig3dRcewdZ01OVTkefqRZY37cRQ=
Content-Type: multipart/mixed; boundary="===============5125417821631309117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.5 SUCCEEDED
Message-ID: <010101a1717eacde-d04d8a7b-b6dd-443e-a673-4c47a6621afb-000000@us-west-2.amazonses.com>
Date: Sun, 25 Oct 2026 05:18:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248599

--===============5125417821631309117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.4-3.5.patch
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
From 84a4c7c624ed9676d35c77c10b951853a889f958 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 25 Oct 2026 05:14:31 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.4 -> 3.5

---
 .../{python3-jsonpointer_3.4.bb => python3-jsonpointer_3.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.4.bb => python3-jsonpointer_3.5.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
index 1fa8ce7551..dc39b0ea38 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "e57015ae65af3821c6a3976069860789cf326103f38b22b2178d41d021adad25"
+SRC_URI[sha256sum] = "81f28618a019cf1b011a6cf757439737972de1ccbeca2e1f86dfb4d661800792"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============5125417821631309117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.4.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.5.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 32058 to 34753 (+8%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.4" to "3.5"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.4 [default] to 3.5 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 38215 to 38437 (+1%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.4" to "3.5"
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info

--===============5125417821631309117==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.4-3.5.patch"

RnJvbSA4NGE0YzdjNjI0ZWQ5Njc2ZDM1Yzc3YzEwYjk1MTg1M2E4ODlmOTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjUgT2N0IDIwMjYgMDU6MTQ6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuNCAtPiAzLjUKCi0tLQogLi4uL3tweXRob24z
LWpzb25wb2ludGVyXzMuNC5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuNS5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29ucG9pbnRlcl8zLjQuYmIg
PT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjUuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuNC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjUuYmIKc2ltaWxh
cml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWpzb25wb2ludGVyXzMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuNS5iYgppbmRleCAxZmE4Y2U3NTUxLi5kYzM5
YjBlYTM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
anNvbnBvaW50ZXJfMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1qc29ucG9pbnRlcl8zLjUuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0zMmIxNWM4NDNiN2EzMjkxMzBmNGUyNjZhMjgxZWJi
MyIKIAogaW5oZXJpdCBweXBpIHB0ZXN0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJlNTcwMTVhZTY1YWYzODIxYzZhMzk3NjA2OTg2MDc4OWNmMzI2MTAzZjM4YjIyYjIxNzhk
NDFkMDIxYWRhZDI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZjI4NjE4YTAxOWNmMWIwMTFh
NmNmNzU3NDM5NzM3OTcyZGUxY2NiZWNhMmUxZjg2ZGZiNGQ2NjE4MDA3OTIiCiAKIFNSQ19VUkkg
Kz0gIiBcCiAJZmlsZTovL3J1bi1wdGVzdCBcCi0tIAoyLjQ3LjEKCg==

--===============5125417821631309117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.4.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.5.dist-info

--===============5125417821631309117==--
