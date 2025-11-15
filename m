Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD738CED620
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11929.1763224712422590111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=s/zWO176;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bDd0DKhu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a88624fc5-4a142f91-d680-4982-abda-c8443caa2f9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+oYEbalqVJiw9U/KU9iSr6nbTi7GAUcxyPagDC13XTg=;
	b=s/zWO176J6VJlnb78uHQuy6Zhca2gyiRANSU1WPPad9z7k8jZZ7ZIrybD54fQds2
	UCoIBPvFD5r/wukuEFW/fYZvr7DPMmtPOS4PDfAS0T4XKD14N1kAONYjldr2eUZmmM+
	h16wxopL5TOb9CH+b3fvXVcK6mlUZJdWKI29JYBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+oYEbalqVJiw9U/KU9iSr6nbTi7GAUcxyPagDC13XTg=;
	b=bDd0DKhufkS4RjtFGvFayF8Ii71dFZdvh0ADD5musM3zH/hlQjZBrKFvy99JLsNF
	wXIFF2Bo4wlKjea9jY9WlMxP2m+GsSk8TOOfBKgjDQ6LiSKNIxcgO59aDsDVvO3WNJM
	Ieq0LI949VrdD9IOlG+ODECv7tYpUIt0YnV7Aa5c=
Content-Type: multipart/mixed; boundary="===============8476982561876519959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 9.2.2 SUCCEEDED
Message-ID: <0101019a88624fc5-4a142f91-d680-4982-abda-c8443caa2f9a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226378

--===============8476982561876519959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *9.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-8.3.1-9.2.2.patch
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
From 8c1e9d8cd1d46a1cd07fd9ce2e34f143b2049ca2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:22:37 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 8.3.1 -> 9.2.2

---
 ...-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
index 81e04ddea5..175da34179 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
+SRC_URI[sha256sum] = "1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8476982561876519959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-8.3.1-9.2.2.patch"

RnJvbSA4YzFlOWQ4Y2QxZDQ2YTFjZDA3ZmQ5Y2UyZTM0ZjE0M2IyMDQ5Y2EyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MjI6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDguMy4xIC0+IDkuMi4yCgotLS0KIC4uLi1z
ZXR1cHRvb2xzLXNjbV84LjMuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzkuMi4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fOC4zLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV85LjIuMi5iYn0gKDg5JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1zY21fOS4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMy4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOS4yLjIuYmIKaW5kZXggODFlMDRkZGVhNS4uMTc1ZGEzNDE3OSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMy4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV85LjIuMi5iYgpAQCAtNiw3ICs2LDcgQEAgYXJndW1lbnQgb3IgaW4gYSBTQ00gbWFuYWdl
ZCBmaWxlLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRmZjc5YjM1ZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzZDU1NWU5MmI3NWRhY2QwMzdkMzJiYWZkZjk0Zjk3YWY1MWVhMjlhZThjN2Iy
MzRjZjk0YjdhNWJkMjQyYTYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjNjc0YWI0NjY1Njg2
YTA4ODdkN2UyNGMwM2FiMjVmMjQyMDFjMjEzZTgyZWE2ODlkMmYzZTE2OWVmN2VmNTciCiAKIFBZ
UElfUEFDS0FHRSA9ICJzZXR1cHRvb2xzX3NjbSIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FH
RSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============8476982561876519959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2833788 to 2834128 (+0%)
packages/x86-64-v3-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.3.1.tar.gz;downloadfilename=setuptools_scm-8.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-9.2.2.tar.gz;downloadfilename=setuptools_scm-9.2.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "8.3.1" to "9.2.2"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 366908 (+50%)
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info, added "/usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py /usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/py.typed /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc /usr/
 lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "8.3.1" to "9.2.2"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/py.typed was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py was added
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info
  /usr/bin was added
  /usr/bin/setuptools-scm was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/py.typed was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py was added

--===============8476982561876519959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info/licenses, added "/usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/py.typed /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_
 scm/_compat.py /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 366908 (+50%)
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/py.typed was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py was added
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info
  /usr/bin was added
  /usr/bin/setuptools-scm was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/setuptools_scm/py.typed was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py was added

--===============8476982561876519959==--

