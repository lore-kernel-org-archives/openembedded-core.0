Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F38CA0EF2
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11410.1755263221863431685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aLKtzxxF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R3Y4ys14;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add7581b-41b808f1-f0c5-4de8-aaa7-4dc723386ae2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2usxuc2tL3rE0IzFVPkP9gd9Ezb1zkSzXPcm6ZEIn+s=;
	b=aLKtzxxF2PsvkGC8Z+V9gPG2IXJboMIct912CRFeSH/h2WBsebkrcHC27U7i0V1V
	C4WQEquUwKx2vR9UqnUv1Rhr28r39RXdqo/ido95bmAVLmYrVGLfgNOOl4hrnvuNooT
	H23VmSgDjxGjv8hd1qJFeUcMDDZR0ONtKeEs18Kg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2usxuc2tL3rE0IzFVPkP9gd9Ezb1zkSzXPcm6ZEIn+s=;
	b=R3Y4ys14O87rzPDfbBt6+3hcGkkVGzcSkOF0Q1DLgnXrSy/mDkuKL1DjxC7ADpLn
	sCZwDrNPX13hoXqGwQKld8woFH2TeC9JBDNgYlNge1Jy8ULZ4UdJizRrLsKtcor03Pt
	C0JhrmTVVXbWqopVo4nOIBWthrzkyL+b8MW21Plw=
Content-Type: multipart/mixed; boundary="===============7631873342619306855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 9.1.1 SUCCEEDED
Message-ID: <01010198add7581b-41b808f1-f0c5-4de8-aaa7-4dc723386ae2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221917

--===============7631873342619306855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *9.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-8.3.1-9.1.1.patch
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
From 78fef6f7e186f889e3c50ea4008de7bc76d2192a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:27:26 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 8.3.1 -> 9.1.1

---
 ...-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.1.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_9.1.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_9.1.1.bb
index 81e04ddea5..9434dded31 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_9.1.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
+SRC_URI[sha256sum] = "9b47bba73d1dcf0074b043f0ece0c4e485d87e0a73803c9176797ab68d0c3015"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============7631873342619306855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 355009 (+45%)
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info, added "/usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycac
 he__/version_inference.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/py.typed"
Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
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
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info
  /usr/bin was added
  /usr/bin/setuptools-scm was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
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

--===============7631873342619306855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2831421 to 2831761 (+0%)
packages/core2-64-poky-linux/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.3.1.tar.gz;downloadfilename=setuptools_scm-8.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-9.1.1.tar.gz;downloadfilename=setuptools_scm-9.1.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "8.3.1" to "9.1.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 355009 (+45%)
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info, added "/usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py 
 /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/py.typed"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "8.3.1" to "9.1.1"
Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
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
  /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-9.1.1.dist-info
  /usr/bin was added
  /usr/bin/setuptools-scm was added
  /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py was added
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

--===============7631873342619306855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-8.3.1-9.1.1.patch"

RnJvbSA3OGZlZjZmN2UxODZmODg5ZTNjNTBlYTQwMDhkZTdiYzc2ZDIxOTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6Mjc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDguMy4xIC0+IDkuMS4xCgotLS0KIC4uLi1z
ZXR1cHRvb2xzLXNjbV84LjMuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzkuMS4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fOC4zLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV85LjEuMS5iYn0gKDg5JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1zY21fOS4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMy4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOS4xLjEuYmIKaW5kZXggODFlMDRkZGVhNS4uOTQzNGRkZWQzMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMy4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV85LjEuMS5iYgpAQCAtNiw3ICs2LDcgQEAgYXJndW1lbnQgb3IgaW4gYSBTQ00gbWFuYWdl
ZCBmaWxlLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRmZjc5YjM1ZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzZDU1NWU5MmI3NWRhY2QwMzdkMzJiYWZkZjk0Zjk3YWY1MWVhMjlhZThjN2Iy
MzRjZjk0YjdhNWJkMjQyYTYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjliNDdiYmE3M2QxZGNm
MDA3NGIwNDNmMGVjZTBjNGU0ODVkODdlMGE3MzgwM2M5MTc2Nzk3YWI2OGQwYzMwMTUiCiAKIFBZ
UElfUEFDS0FHRSA9ICJzZXR1cHRvb2xzX3NjbSIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FH
RSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============7631873342619306855==--

