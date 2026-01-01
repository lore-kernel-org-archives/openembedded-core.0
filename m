Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42E4EED609
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102971.1767267473386009610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XUWaQUu+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Em7VFrR2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b795994e2-95b516ae-4270-4adb-8764-9409d61c80e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ryAHU1LH0s+SgBtyLbBP5whC/igActNmmfSoX7TfreM=;
	b=XUWaQUu+Qtaji2InyKpkRnwpDQTjUwibk6cZzRet7ZTU/BnrNGFtcHYxkajlNI++
	edd1XHiHXWPutkEWItoBf0ZUHghECjIPg7iOBo99hjFO8bcKTCfckfpsKMn9FaXsv2e
	p1y39j/X6yBQEvhcsR1YRgGFK+0RKjiKbXOrnBwk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ryAHU1LH0s+SgBtyLbBP5whC/igActNmmfSoX7TfreM=;
	b=Em7VFrR2Re9Vz1pCQVmP1Nqdkf21gmfompXFM8AYVSpI64XeGm5ctXRe6e1i0IGo
	SzPaRXoJ27NLXRgnZk5UXEmgubjOKbJTFo2wjwekzrW3vSiPrT/BxDI8vKRw8BzpmrV
	rtxyUeRE3zR0rHFNNSFBHUrFrn0sueLcjVDsx+8w=
Content-Type: multipart/mixed; boundary="===============1582204346567410159=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 7.2.1 SUCCEEDED
Message-ID: <0101019b795994e2-95b516ae-4270-4adb-8764-9409d61c80e4-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228774

--===============1582204346567410159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-psutil* to *7.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-7.1.3-7.2.1.patch
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
From 672a285a84c31ac0cc7e8330ba69ac0c5e68132e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:00:22 +0000
Subject: [PATCH] python3-psutil: upgrade 7.1.3 -> 7.2.1

---
 .../python/{python3-psutil_7.1.3.bb => python3-psutil_7.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.1.3.bb => python3-psutil_7.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.1.3.bb b/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.1.3.bb
rename to meta/recipes-devtools/python/python3-psutil_7.2.1.bb
index 67d2080f21..0a9b073855 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74"
+SRC_URI[sha256sum] = "f7583aec590485b43ca601dd9cea0dcd65bd7bb21d30ef4ddbf4ea6b5ed1bdd3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============1582204346567410159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.1.3.tar.gz;downloadfilename=psutil-7.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.2.1.tar.gz;downloadfilename=psutil-7.2.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-psutil: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 91664 to 96424 (+5%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: FILELIST: directory renamed /usr/src/debug/python3-psutil/7.1.3/psutil -> /usr/src/debug/python3-psutil/7.2.1/psutil, directory renamed /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all -> /usr/src/debug/python3-psutil/7.2.1/psutil/arch/all, directory renamed /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix -> /usr/src/debug/python3-psutil/7.2.1/psutil/arch/posix, removed "/usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/proc.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/mem.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/init.h /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/net.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/disk.c", added "/usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/mem.c /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/net.c /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/proc.c /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/dis
 k.c /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/heap.c /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux/init.h"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 60553 to 63261 (+4%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed all items "/usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sunos.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_unicode.py /usr/lib/python3.13/site-packages/psutil/tests/test_aix.py /usr/lib/python3.13/site-packages/psutil/tests/test_bsd.py /usr/lib/python3.13/site-packages/psutil/tests/test_osx.py /usr/lib/python3.13/site-packages/psutil/tests/test_contracts.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_contracts.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_misc.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_osx.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__main__.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_posix.cpython-313.p
 yc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_aix.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_misc.py /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_memleaks.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_sunos.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_testutils.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_windows.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_process.py /usr/lib/python3.13/site-packages/psutil/tests/test_memleaks.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_unicode.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_connections.py /usr/lib/python3.13/site-packages/psutil/tests/test_process_all.py /usr/lib/python3.13/site-pack
 ages/psutil/tests/test_system.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_scripts.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_connections.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_bsd.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process_all.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_windows.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_system.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_testutils.py /usr/lib/python3.13/site-packages/psutil/tests/test_linux.py /usr/lib/python3.13/site-packages/psutil/tests/test_posix.py /usr/lib/python3.13/site-packages/psutil/tests/__init__.py /usr/lib/python3.13/site-packages/psutil/tests/__main__.py /usr/lib/python3.13/site-packages/psutil/tests/test_scripts.py /u
 sr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_linux.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1235052 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "7.1.3" to "7.2.1"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info -> /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/psutil/__pycache__/_ntuples.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/_ntuples.py"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGV changed from 7.1.3 [default] to 7.2.1 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 771052 to 776557 (+1%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PV changed from "7.1.3" to "7.2.1"
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info moved to /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info
  /usr/lib/python3.13/site-packages/psutil/_ntuples.py was added
  /usr/lib/python3.13/site-packages/psutil/__pycache__/_ntuples.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/psutil/tests was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__main__.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__main__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_aix.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_bsd.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_connections.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_contracts.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_linux.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_memleaks.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_misc.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_osx.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_posix.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process_all.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_scripts.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sunos.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_system.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_testutils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_unicode.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_windows.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_aix.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_bsd.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_connections.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_contracts.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_linux.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_memleaks.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_misc.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_osx.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_posix.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_process_all.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_process.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_scripts.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_sunos.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_system.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_testutils.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_unicode.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_windows.py was removed

--===============1582204346567410159==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-7.1.3-7.2.1.patch"

RnJvbSA2NzJhMjg1YTg0YzMxYWMwY2M3ZTgzMzBiYTY5YWMwYzVlNjgxMzJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODowMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDcuMS4zIC0+IDcuMi4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHN1dGlsXzcuMS4zLmJiID0+IHB5dGhvbjMtcHN1dGlsXzcuMi4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzcuMS4zLmJiID0+IHB5
dGhvbjMtcHN1dGlsXzcuMi4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNy4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzcuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxf
Ny4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
c3V0aWxfNy4yLjEuYmIKaW5kZXggNjdkMjA4MGYyMS4uMGE5YjA3Mzg1NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF83LjEuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzcuMi4xLmJiCkBA
IC0zLDcgKzMsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE5YzcyMTEzYTg0M2QwZDczMmEwYWMxYzIwMGQ4MWIxIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BzdXRpbC8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI2Yzg2MjgxNzM4ZDc3MzM1YWY3YWVjMjI4MzI4ZTk0NGIzMDkzMDg5OWVh
NzYwZWNmMzNhNGRiYTY2YmU1ZTc0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NTgzYWVjNTkw
NDg1YjQzY2E2MDFkZDljZWEwZGNkNjViZDdiYjIxZDMwZWY0ZGRiZjRlYTZiNWVkMWJkZDMiCiAK
IGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============1582204346567410159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1235052 to 0 (-100%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed all items "/usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_linux.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_process.py /usr/lib/python3.13/site-packages/psutil/tests/test_memleaks.py /usr/lib/python3.13/site-packages/psutil/tests/__init__.py /usr/lib/python3.13/site-packages/psutil/tests/__main__.py /usr/lib/python3.13/site-packages/psutil/tests/test_sunos.py /usr/lib/python3.13/site-packages/psutil/tests/test_misc.py /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_system.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_testutils.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_misc.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_windows.py /usr/
 lib/python3.13/site-packages/psutil/tests/__pycache__/test_contracts.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_contracts.py /usr/lib/python3.13/site-packages/psutil/tests/test_system.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sunos.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_windows.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_scripts.py /usr/lib/python3.13/site-packages/psutil/tests/test_linux.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_testutils.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_posix.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_aix.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_memleaks.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_process_all.py /usr/lib/pyt
 hon3.13/site-packages/psutil/tests/__pycache__/test_osx.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_posix.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__main__.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process_all.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_bsd.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_aix.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_bsd.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_connections.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_scripts.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_osx.py /usr/lib/python3.13/site-packages/psutil/tests/test_connections.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_uni
 code.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_unicode.py"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info -> /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info, added "/usr/lib/python3.13/site-packages/psutil/__pycache__/_ntuples.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/_ntuples.py"
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info moved to /usr/lib/python3.13/site-packages/psutil-7.2.1.dist-info
  /usr/lib/python3.13/site-packages/psutil/_ntuples.py was added
  /usr/lib/python3.13/site-packages/psutil/__pycache__/_ntuples.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/psutil/tests was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__main__.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/__main__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_aix.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_bsd.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_connections.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_contracts.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_linux.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_memleaks.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_misc.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_osx.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_posix.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process_all.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_process.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_scripts.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sunos.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_system.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_testutils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_unicode.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_windows.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_aix.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_bsd.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_connections.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_contracts.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_linux.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_memleaks.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_misc.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_osx.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_posix.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_process_all.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_process.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_scripts.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_sunos.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_system.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_testutils.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_unicode.py was removed
  /usr/lib/python3.13/site-packages/psutil/tests/test_windows.py was removed

--===============1582204346567410159==--

