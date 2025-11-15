Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D5CED250
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11937.1763224718180011512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KlSAFWu+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=X4jet5hl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a88622da1-6c111405-439c-4c4c-b8c6-15f2b122083e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MU4dD0/i2tEvwWo2/YQcnognsiG347L5fVtY67pxi2M=;
	b=KlSAFWu+8M2MM1lfLyeiBxnJ8yP7fp1a9h6L+Z2xMuWG6B0s7QZ2Z5wveFecD/gz
	UiXv+w2k3BEPTVFrqIRXG2NwWW+N0zV5nCKe7VfoZhbikcgh+llpGhcWKF2DTsz+CDw
	UTpOmE/Pi+f4eMnbcUVlyowYF9RRkC5Q8TAd6oeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MU4dD0/i2tEvwWo2/YQcnognsiG347L5fVtY67pxi2M=;
	b=X4jet5hlyIEHiJHnXWppx7YMx4iaJYdGFSZaccoUPloHVHFTD8V3nZ9LSr8MiSvp
	ZS7VLOURxuy6hMQYnZwQ/HRcDEEaXe3Cq6H9U2MDmjgwBGQ+vMxAmBSkALzlw+MYILA
	YTqKmhwfWy8n9YYL0H0IOnk5EvmDD5unEFNdH6Lc=
Content-Type: multipart/mixed; boundary="===============6185579507747999042=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.0.3 SUCCEEDED
Message-ID: <0101019a88622da1-6c111405-439c-4c4c-b8c6-15f2b122083e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226361

--===============6185579507747999042==
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
From 26bca24a927ef64c6e32224977e99f1d7411278e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:36:57 +0000
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


--===============6185579507747999042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.0.1.tar.gz;downloadfilename=pbr-7.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.0.3.tar.gz;downloadfilename=pbr-7.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
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
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 665044 to 702489 (+6%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.0.1" to "7.0.3"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.0.1 [default] to 7.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info, removed "/usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/core.py /usr/lib/python3.13/site-packages/pbr/util.py /usr/lib/python3.13/site-packages/pbr/tests/test_util.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc /usr/lib/pytho
 n3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/setupcfg.py /usr/lib/python3.13/site-packages/pbr/_compat/versions.py /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/easy_install.py"
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

--===============6185579507747999042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pbr-7.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pbr-7.0.3.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/pbr/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/__pycache__/core.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/util.py /usr/lib/python3.13/site-packages/pbr/tests/test_util.py /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_util.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/core.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_commands.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_commands.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pbr/tests/_compat/__pycache__/test_easy_install.cpython-313.pyc /us
 r/lib/python3.13/site-packages/pbr/_compat/__pycache__/versions.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/tests/test_setupcfg.py /usr/lib/python3.13/site-packages/pbr/_compat/versions.py /usr/lib/python3.13/site-packages/pbr/tests/_compat/test_easy_install.py /usr/lib/python3.13/site-packages/pbr/__pycache__/setupcfg.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/_compat/__pycache__/easy_install.cpython-313.pyc /usr/lib/python3.13/site-packages/pbr/setupcfg.py /usr/lib/python3.13/site-packages/pbr/_compat/easy_install.py /usr/lib/python3.13/site-packages/pbr/tests/__pycache__/test_setupcfg.cpython-313.pyc"
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

--===============6185579507747999042==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.0.1-7.0.3.patch"

RnJvbSAyNmJjYTI0YTkyN2VmNjRjNmUzMjIyNDk3N2U5OWYxZDc0MTEyNzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MzY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA3LjAuMSAtPiA3LjAuMwoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLXBicl83LjAuMS5iYiA9PiBweXRob24zLXBicl83LjAuMy5iYn0gICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBicl83LjAuMS5iYiA9PiBweXRob24z
LXBicl83LjAuMy5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGJyXzcuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBicl83LjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcuMC4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcuMC4zLmJiCmluZGV4
IDY4NzhmYTA5NjcuLmRlZTMyYWE4ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1wYnJfNy4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBicl83LjAuMy5iYgpAQCAtMTEsNCArMTEsNCBAQCBSREVQRU5EUzok
e1BOfSArPSAicHl0aG9uMy1waXAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNlY2JjYjExZDJiODU1MTU4OGVjODE2YjM3NTZi
MWViNDM5NDE4NmMzYjY4OWIxN2UwNDg1MGRmYzIwZjdlNTciCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYjQ2MDA0ZWMzMGE1MzI0NjcyNjgzZWM4NDhhZWQ5ZThmYzUwMGIwZDI2MWQ0MGEzMjI5YzJk
MmJiZmNlZGMyOSIKLS0gCjIuNDcuMQoK

--===============6185579507747999042==--

