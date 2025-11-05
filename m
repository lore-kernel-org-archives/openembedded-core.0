Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54204CD3444
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2352.1762384576133441754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kU8AS56T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sL09TM2j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564eb941-fa6f9139-de48-4b11-aff7-040cee0419d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sWHFQiWndgUeX6Zxk4JiTfZqXQ3J7WOi8jMuNbG7LhQ=;
	b=kU8AS56TBUTcAmzOEUmqP3dPA6szKw1ncWaQzr9mFLSfhqZe7LyTqBiu90rFgpxo
	ZRKsWjAj7fLJk+OmiTEiXBdkw3+KPavZ+7w/ToVu2jx2kYkGLK+JGcBNL/+4JSr8Tyg
	R63sB/W1uLUM7DIqXooHFpxjDTGXmpw/7wIDhYow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sWHFQiWndgUeX6Zxk4JiTfZqXQ3J7WOi8jMuNbG7LhQ=;
	b=sL09TM2jqtZ+raaNZtiAvHvyXi4DyY2ntR2hlY4loOYq5VYDW1RtDpSlXGchQiGw
	Pb8ty5G8tNWgDo9mcrPuM6cT2eEJtMKzDsgbVXs9joq5W/InZeA/XV4HAm5PDuOe0mB
	nxZ83GQCVxiI2n39dbVzybmsPqQSfgaeZa5ebKwM=
Content-Type: multipart/mixed; boundary="===============4622873328388865115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 9.2.2 SUCCEEDED
Message-ID: <0101019a564eb941-fa6f9139-de48-4b11-aff7-040cee0419d3-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225851

--===============4622873328388865115==
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
From fd02a69f165c1fa07a7999549e1972ac8b42d8fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:56:31 +0000
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


--===============4622873328388865115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 366908 (+50%)
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info/licenses, added "/usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/deprecation.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py /usr/lib/python3.13/site-packages
 /setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc /usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/py.typed /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc"
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

--===============4622873328388865115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2833788 to 2834128 (+0%)
packages/x86-64-v3-poky-linux/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.3.1.tar.gz;downloadfilename=setuptools_scm-8.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-9.2.2.tar.gz;downloadfilename=setuptools_scm-9.2.2.tar.gz"
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
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 8.3.1 [default] to 9.2.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info -> /usr/lib/python3.13/site-packages/setuptools_scm-9.2.2.dist-info, added "/usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_node_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/deprecation.cpython-313.pyc /usr/bin/setuptools-scm /usr/lib/python3.13/site-packages/setuptools_scm/_integration/setup_cfg.py /usr/lib/python3.13/site-packages/setuptools_scm/_requirement_cls.py /usr/lib/python3.13/site-packages/setuptools_scm/_node_utils.py /usr/lib/python3.13/site-packages/setuptools_scm/_compat.py /usr/lib/pytho
 n3.13/site-packages/setuptools_scm/_integration/deprecation.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/setup_cfg.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/_integration/__pycache__/version_inference.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/__pycache__/_requirement_cls.cpython-313.pyc /usr/lib/python3.13/site-packages/setuptools_scm/py.typed"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 244584 to 366908 (+50%)
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

--===============4622873328388865115==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-8.3.1-9.2.2.patch"

RnJvbSBmZDAyYTY5ZjE2NWMxZmEwN2E3OTk5NTQ5ZTE5NzJhYzhiNDJkOGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzo1NjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1zY206IHVwZ3JhZGUgOC4zLjEgLT4gOS4yLjIKCi0tLQogLi4uLXNl
dHVwdG9vbHMtc2NtXzguMy4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fOS4yLjIuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xzLXNj
bV84LjMuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzkuMi4yLmJifSAoODklKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV84LjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXNjbV85LjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fOC4zLjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV85LjIuMi5iYgppbmRleCA4MWUwNGRkZWE1Li4xNzVkYTM0MTc5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fOC4zLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMt
c2NtXzkuMi4yLmJiCkBAIC02LDcgKzYsNyBAQCBhcmd1bWVudCBvciBpbiBhIFNDTSBtYW5hZ2Vk
IGZpbGUuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT04MzhjMzY2ZjY5YjcyYzVkZjA1Yzk2ZGZmNzliMzVmMiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjNkNTU1ZTkyYjc1ZGFjZDAzN2QzMmJhZmRmOTRmOTdhZjUxZWEyOWFlOGM3YjIz
NGNmOTRiN2E1YmQyNDJhNjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWM2NzRhYjQ2NjU2ODZh
MDg4N2Q3ZTI0YzAzYWIyNWYyNDIwMWMyMTNlODJlYTY4OWQyZjNlMTY5ZWY3ZWY1NyIKIAogUFlQ
SV9QQUNLQUdFID0gInNldHVwdG9vbHNfc2NtIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdF
ID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDcuMQoK

--===============4622873328388865115==--

