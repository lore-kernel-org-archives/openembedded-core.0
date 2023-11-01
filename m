Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C8FC25B49
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8478.1698848703396694100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PmyGm2+W;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qpjVH5xz;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b4604a6-58ec8d99-3cd5-4bb1-82db-d4b20ade8c18-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FvBVLyT7dRRQs0gd7jWKHoyg2BFTp+lLq3+rDLbVbvU=;
	b=PmyGm2+W8NcQpqdScb+WKbl+qDIn/byeFgR5pEuSCe+yXotNX/cBiqwNmt4BPmlt
	ruJOqvUNct/CEXrniHy2h0vycwETW6fru8DniwEsXoEPHtorVXdi++N7rDaKBGheWKn
	t7n2l2dUfDSqE4oSn7dCGnGIP489RvIW4Bjxq9Mw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FvBVLyT7dRRQs0gd7jWKHoyg2BFTp+lLq3+rDLbVbvU=;
	b=qpjVH5xzEI3sPjt7QN0dJBTPaDz9Lg7OFSgczlPS+YJwQGmJlGytepMXcjYFiQ6h
	cjgyx6nEVF6b6U/7epGtmPCflQElb3L2ItanMuLFwq2yiy7ed9yXlQUfc0etUuADG48
	ZDtvL7wCeEeQfiurqPp77WaLwVRwADNyyIUaVo1A=
Content-Type: multipart/mixed; boundary="===============8000782263436460788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 23.3.1 SUCCEEDED
Message-ID: <0101018b8b4604a6-58ec8d99-3cd5-4bb1-82db-d4b20ade8c18-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189950

--===============8000782263436460788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *23.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-23.2.1-23.3.1.patch
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
From c42ff2160a5d144d7d57434f68b375e02972a587 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:10:43 +0000
Subject: [PATCH] python3-pip: upgrade 23.2.1 -> 23.3.1

---
 .../python/{python3-pip_23.2.1.bb => python3-pip_23.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_23.2.1.bb => python3-pip_23.3.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_23.2.1.bb b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_23.3.1.bb
index c92e2dbd57..3699bdf515 100644
--- a/meta/recipes-devtools/python/python3-pip_23.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "fb0bd5435b3200c602b5bf61d2d43c2f13c02e29c1707567ae7fbc514eb9faf2"
+SRC_URI[sha256sum] = "1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.39.2


--===============8000782263436460788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pip: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-23.2.1.tar.gz;downloadfilename=pip-23.2.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-23.3.1.tar.gz;downloadfilename=pip-23.3.1.tar.gz file://no_shebang_mangling.patch"
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PV changed from "23.2.1" to "23.3.1"
packages/core2-64-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pip-23.2.1.dist-info -> /usr/lib/python3.11/site-packages/pip-23.3.1.dist-info, removed "/usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/inject_securetransport.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/compat.py /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/__pycache__/compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_internal/utils/inject_securetransport.py", added "/usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_macos.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_ssl_constants.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_windows.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_openssl.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore
 /_api.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_windows.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_openssl.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_ssl_constants.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__init__.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_api.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_macos.py"
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGV changed from 23.2.1 [default] to 23.3.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 14261460 to 14425578 (+1%)
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip-23.2.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.3.1.dist-info
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_api.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__init__.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_macos.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_openssl.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__ was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_api.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_macos.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_openssl.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_ssl_constants.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_windows.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_ssl_constants.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_windows.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/inject_securetransport.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/inject_securetransport.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/__pycache__/compat.cpython-311.pyc was removed

--===============8000782263436460788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pip-23.2.1.dist-info -> /usr/lib/python3.11/site-packages/pip-23.3.1.dist-info, removed "/usr/lib/python3.11/site-packages/pip/_internal/utils/inject_securetransport.py /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/inject_securetransport.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/__pycache__/compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/compat.py", added "/usr/lib/python3.11/site-packages/pip/_vendor/truststore/__init__.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_openssl.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_ssl_constants.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_api.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_api.cpython-311.pyc /usr/lib/python3.1
 1/site-packages/pip/_vendor/truststore/_openssl.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_windows.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_macos.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_ssl_constants.py /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_windows.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_macos.py"
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.11/site-packages/pip-23.2.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.3.1.dist-info
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_api.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__init__.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_macos.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_openssl.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__ was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_api.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_macos.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_openssl.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_ssl_constants.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/__pycache__/_windows.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_ssl_constants.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/truststore/_windows.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/inject_securetransport.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/inject_securetransport.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/cachecontrol/__pycache__/compat.cpython-311.pyc was removed

--===============8000782263436460788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-23.2.1-23.3.1.patch"

RnJvbSBjNDJmZjIxNjBhNWQxNDRkN2Q1NzQzNGY2OGIzNzVlMDI5NzJhNTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToxMDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDIzLjIuMSAtPiAyMy4zLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1waXBfMjMuMi4xLmJiID0+IHB5dGhvbjMtcGlwXzIzLjMuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1waXBfMjMuMi4xLmJiID0+IHB5dGhv
bjMtcGlwXzIzLjMuMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjIuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1waXBfMjMuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjMuMi4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjMuMS5i
YgppbmRleCBjOTJlMmRiZDU3Li4zNjk5YmRmNTE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjMuMS5iYgpAQCAtMzMsNyArMzMsNyBAQCBp
bmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCiBTUkNfVVJJICs9ICJm
aWxlOi8vbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImZiMGJkNTQzNWIzMjAwYzYwMmI1YmY2MWQyZDQzYzJmMTNjMDJlMjljMTcwNzU2N2FlN2ZiYzUx
NGViOWZhZjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWZjYWEwNDEzMDhkMDFmMTQ1NzVmNmQw
ZDJlYTRiNzVhM2UyODcxZmU0ZjljNjk0OTc2ZjkwODc2OGUxNDE3NCIKIAogZG9faW5zdGFsbDph
cHBlbmQoKSB7CiAgICAgcm0gLWYgJHtEfS8ke2JpbmRpcn0vcGlwCi0tIAoyLjM5LjIKCg==

--===============8000782263436460788==--

