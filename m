Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9E9D5CC84
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17396.1765872135892522841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J/mVkQ81;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iNDvu83f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e8e51-b1d3c647-7a00-4fef-a764-1a494820c170-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KH3c7k1Xt5TbfI8LCH4XNcsRg4y3DJFOjxjWLK6UmX0=;
	b=J/mVkQ817C+ooLfQBs9+BVDaYDrpiGL4tMFXqO3weKW5yW9Cg9RERHhrVvseIjG4
	F3LhFwfCR2kKFnVgucmQ/hrwgt7vyiY73sig3pD8z1NdvU6F3xMOcWcdYnl79pQH06E
	Y2i0X2DV+uo8cXShDNR27gxZoNzMuaxcST0r38xw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KH3c7k1Xt5TbfI8LCH4XNcsRg4y3DJFOjxjWLK6UmX0=;
	b=iNDvu83fNyKIRqy+yWk+0cSbN9YZ+yaYCeGtBz3HddFX130fYRPVWfflcaHIQjuw
	BsUQzVb0by9sU6BFd935L+o6tfDHOx/x+Xc5nzvs8QCBpTa7lzcQv4jIbx0ef/0nCfh
	t5rE5TY0qQriMlv9EcwczWJQJdwCcY/vbVtwdrMk=
Content-Type: multipart/mixed; boundary="===============4676367742469638428=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 7.1.3 SUCCEEDED
Message-ID: <0101019b262e8e51-b1d3c647-7a00-4fef-a764-1a494820c170-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227813

--===============4676367742469638428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-psutil* to *7.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-7.0.0-7.1.3.patch
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
From 6e84d3f1bdaddd3ddcf289db46a041659a89d900 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:47:48 +0000
Subject: [PATCH] python3-psutil: upgrade 7.0.0 -> 7.1.3

---
 .../python/{python3-psutil_7.0.0.bb => python3-psutil_7.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.0.0.bb => python3-psutil_7.1.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb b/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.0.0.bb
rename to meta/recipes-devtools/python/python3-psutil_7.1.3.bb
index a2af198083..67d2080f21 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "7be9c3eba38beccb6495ea33afd982a44074b78f28c434a1f51cc07fd315c456"
+SRC_URI[sha256sum] = "6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4676367742469638428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 121032 to 91664 (-24%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: added "/usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info -> /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info, removed "/usr/lib/python3.13/site-packages/psutil/_psutil_posix.abi3.so"
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info moved to /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py was added
  /usr/lib/python3.13/site-packages/psutil/_psutil_posix.abi3.so was removed

--===============4676367742469638428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-psutil: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.0.0.tar.gz;downloadfilename=psutil-7.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.1.3.tar.gz;downloadfilename=psutil-7.1.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: FILELIST: removed "/usr/lib/python3.13/site-packages/psutil/.debug/_psutil_posix.abi3.so"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 121032 to 91664 (-24%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: FILELIST: removed "/usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/proc.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/mem.c /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/net.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/mem.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/proc.c /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/net.c /usr/src/debug/python3-psutil/7.0.0/psutil/_psutil_common.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/users.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/disk.h /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/users.c /usr/src/debug/python3-psutil/7.0.0/psutil/_psutil_posix.c /usr/src/debug/python3-psutil/7.0.0/psutil/_psutil_common.c /usr/src/debug/python3-psutil/7.0.0/psutil/_psutil_linux.c /usr/src/debug/python3-psutil/7.0.0/psutil/arch/linux/disk.c", added "/usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/mem.c
  /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all/init.h /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/disk.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/init.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/net.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all/str.c /usr/src/debug/python3-psutil/7.1.3/psutil/_psutil_linux.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/init.h /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all/init.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all/pids.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/users.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/proc.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/all/errors.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/proc.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/pids.c /usr/src/debug/python3-psutil/7.1.3/psutil/arch/linux/init.h /usr/src/debug/python3-psutil/7.1.3/psutil/arch/posix/net.c"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 63785 to 60553 (-5%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: added "/usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1222429 to 1235052 (+1%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PV changed from "7.0.0" to "7.1.3"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGV changed from 7.0.0 [default] to 7.1.3 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info -> /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info, removed "/usr/lib/python3.13/site-packages/psutil/_psutil_posix.abi3.so"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 781685 to 771052 (-1%)
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-7.0.0.dist-info moved to /usr/lib/python3.13/site-packages/psutil-7.1.3.dist-info
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/test_sudo.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/psutil/tests/test_sudo.py was added
  /usr/lib/python3.13/site-packages/psutil/_psutil_posix.abi3.so was removed

--===============4676367742469638428==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-7.0.0-7.1.3.patch"

RnJvbSA2ZTg0ZDNmMWJkYWRkZDNkZGNmMjg5ZGI0NmEwNDE2NTlhODlkOTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NDc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBzdXRpbDogdXBncmFkZSA3LjAuMCAtPiA3LjEuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXBzdXRpbF83LjAuMC5iYiA9PiBweXRob24zLXBzdXRpbF83LjEuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBzdXRpbF83LjAuMC5iYiA9PiBw
eXRob24zLXBzdXRpbF83LjEuMy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzcuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF83LjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGls
XzcuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHN1dGlsXzcuMS4zLmJiCmluZGV4IGEyYWYxOTgwODMuLjY3ZDIwODBmMjEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNy4wLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF83LjEuMy5iYgpA
QCAtMyw3ICszLDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hOWM3MjExM2E4NDNkMGQ3MzJhMGFjMWMyMDBkODFiMSIK
IEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wc3V0aWwvIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiN2JlOWMzZWJhMzhiZWNjYjY0OTVlYTMzYWZkOTgyYTQ0MDc0Yjc4ZjI4
YzQzNGExZjUxY2MwN2ZkMzE1YzQ1NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2Yzg2MjgxNzM4
ZDc3MzM1YWY3YWVjMjI4MzI4ZTk0NGIzMDkzMDg5OWVhNzYwZWNmMzNhNGRiYTY2YmU1ZTc0Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEK
Cg==

--===============4676367742469638428==--

