Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFD8CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2358.1762384577889138897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uBIV84Xd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=N9MRoarz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564e9f95-fd9e33c3-0d4c-4cb0-845b-d7514870ff4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5ZPqJIEyriz+OEaEI6iboga4w5GiktF/JrQrqfqWeBs=;
	b=uBIV84Xd9sMq/QYHtPG75gN5MAGZ/GuHLhygJnW8StcHaC9bbSLrg3EWvXYJdB7O
	cCgCXVJVqTgMW7w3tAjuhwl63ih4EdEB7/1YUbFCC1Mjd/O9Yj41dNIymEYo6dzuM5H
	H9wJi5wAh4ULK4lnn0WbgbK7BuZj9pOA8wpn34Co=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5ZPqJIEyriz+OEaEI6iboga4w5GiktF/JrQrqfqWeBs=;
	b=N9MRoarzBBH7uex3JWZySkzySHGheDr1HpLl06thKPVEO4O0OtPY6lZ95uVCFXmG
	z8Kg0vZqB1GO4l8gDyBuHpC5sh1RD24UZtUJteRGf7q5TryWSdqg/j4zTkokiveN2x9
	Fm+NXswsjmBqOJLiR2bvY3/kRe0xVkseJJdoh824=
Content-Type: multipart/mixed; boundary="===============2842694506505051461=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.0.3 SUCCEEDED
Message-ID: <0101019a564e9f95-fd9e33c3-0d4c-4cb0-845b-d7514870ff4a-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225830

--===============2842694506505051461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.0.1-7.0.3.patch
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
From e80739418f91e2ac63f92c83ddd57187d3e07a30 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:18:00 +0000
Subject: [PATCH] python3-pbr: upgrade 7.0.1 -> 7.0.3

---
 .../python/{python3-pbr_7.0.1.bb => python3-pbr_7.0.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.0.1.bb => python3-pbr_7.0.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.0.1.bb b/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.0.1.bb
rename to meta/recipes-devtools/python/python3-pbr_7.0.3.bb
index 6878fa0967..dee32aa885 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN} += "python3-pip"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57"
+SRC_URI[sha256sum] = "b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29"
-- 
2.47.1


--===============2842694506505051461==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.0.1-7.0.3.patch"

RnJvbSBlODA3Mzk0MThmOTFlMmFjNjNmOTJjODNkZGQ1NzE4N2QzZTA3YTMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzoxODowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGJyOiB1cGdyYWRlIDcuMC4xIC0+IDcuMC4zCgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtcGJyXzcuMC4xLmJiID0+IHB5dGhvbjMtcGJyXzcuMC4zLmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGJyXzcuMC4xLmJiID0+IHB5dGhvbjMt
cGJyXzcuMC4zLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYnJfNy4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcGJyXzcuMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4wLjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4wLjMuYmIKaW5kZXgg
Njg3OGZhMDk2Ny4uZGVlMzJhYTg4NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBicl83LjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGJyXzcuMC4zLmJiCkBAIC0xMSw0ICsxMSw0IEBAIFJERVBFTkRTOiR7
UE59ICs9ICJweXRob24zLXBpcCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2VjYmNiMTFkMmI4NTUxNTg4ZWM4MTZiMzc1NmIx
ZWI0Mzk0MTg2YzNiNjg5YjE3ZTA0ODUwZGZjMjBmN2U1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJiNDYwMDRlYzMwYTUzMjQ2NzI2ODNlYzg0OGFlZDllOGZjNTAwYjBkMjYxZDQwYTMyMjljMmQy
YmJmY2VkYzI5IgotLSAKMi40Ny4xCgo=

--===============2842694506505051461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/pbr/util.py /usr/lib/python3.13/site-packages/pbr/core.py /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/test_util.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py", added "/usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc /usr/lib/python
 3.13/site-packages/pbr/_compat/easy_install.py /usr/lib/python3.13/site-packages/pbr/_compat/versions.py /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/setupcfg.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py"
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info moved to /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info
  /usr/lib/python3.13/site-packages/pbr/_compat/easy_install.py was added
  /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/_compat/versions.py was added
  /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/setupcfg.py was added
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py was added
  /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py was added
  /usr/lib/python3.13/site-packages/pbr/core.py was removed
  /usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py was removed
  /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/test_util.py was removed
  /usr/lib/python3.13/site-packages/pbr/util.py was removed

--===============2842694506505051461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.0.1.tar.gz;downloadfilename=pbr-7.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.0.3.tar.gz;downloadfilename=pbr-7.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 665044 to 702489 (+6%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/pbr/core.py /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py /usr/lib/python3.13/site-packages/pbr/util.py /usr/lib/python3.13/site-packages/pbr/tests/test_util.py", added "/usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc /us
 r/lib/python3.13/site-packages/pbr/_compat/versions.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/setupcfg.py /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/easy_install.py /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py"
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info moved to /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info
  /usr/lib/python3.13/site-packages/pbr/_compat/easy_install.py was added
  /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/_compat/versions.py was added
  /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/setupcfg.py was added
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py was added
  /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py was added
  /usr/lib/python3.13/site-packages/pbr/core.py was removed
  /usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py was removed
  /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pbr/tests/test_util.py was removed
  /usr/lib/python3.13/site-packages/pbr/util.py was removed

--===============2842694506505051461==--

