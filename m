Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C58EED60A
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102970.1767267472746343773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XzgHiP1j;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EwQAe49C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b79599338-23591aaa-c228-4277-ac41-b2fae6792fb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wQ0ww5CyccQ54Wug3tSAZkgmow2TxwmRRyP3nd1igjs=;
	b=XzgHiP1jx8ldXo/Suw2KP5JLvn/yqSmTpYykInXZsfX9FdxhQ+CfocU7FWoZ+o+B
	q79OQ/Qiu3Bz3zhy1Vjfy5MIHNOkNAdNp3YI2nC4JpesQ52FvI2LmsOaeKHq8bFw2bb
	MgrZ4y7QHD5/cVLuj5Tw53DWE1b/TYDOugml72xQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wQ0ww5CyccQ54Wug3tSAZkgmow2TxwmRRyP3nd1igjs=;
	b=EwQAe49CY3dxG3YKnShLAIn864PKDv9+3QXAFirB0pL4etwJAz97tlecrPxgRMej
	x8uykW248rr4xw/X27gO10HZBEsGCmTtDlcl1XQcGMfI6rQLXaS2AfIjOYKtRHP82pH
	XypmsYQT38hUEICaSIJbhsO5JrNYgm7MXLQsKwd8=
Content-Type: multipart/mixed; boundary="===============4651130072929046459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.3 SUCCEEDED
Message-ID: <0101019b79599338-23591aaa-c228-4277-ac41-b2fae6792fb5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228771

--===============4651130072929046459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.2-2.26.3.patch
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
From 568f8e8c98ec7fdd2699204b0badc6bd278a010e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 07:53:50 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.2 -> 2.26.3

---
 .../python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb b/meta/recipes-devtools/python/python3-pdm_2.26.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.3.bb
index 13dd1ec0db..f72b03ae9e 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
+SRC_URI[sha256sum] = "30e17ed5b1697949ac509d8c8e1ad96160eab21c88dea4f1a6cf101bdb2787e5"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============4651130072929046459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.2.tar.gz;downloadfilename=pdm-2.26.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.3.tar.gz;downloadfilename=pdm-2.26.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.2" to "2.26.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/models/serializers.py", added "/usr/lib/python3.13/site-packages/pdm/misc/__init__.py /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.2 [default] to 2.26.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2252358 to 2268695 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.2" to "2.26.3"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info
  /usr/lib/python3.13/site-packages/pdm/misc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py was added
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was removed

--===============4651130072929046459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.2-2.26.3.patch"

RnJvbSA1NjhmOGU4Yzk4ZWM3ZmRkMjY5OTIwNGIwYmFkYzZiZDI3OGEwMTBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNzo1Mzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjYuMiAtPiAyLjI2LjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNi4yLmJiID0+IHB5dGhvbjMtcGRtXzIuMjYuMy5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNi4yLmJiID0+IHB5dGhv
bjMtcGRtXzIuMjYuMy5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNi4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMy5i
YgppbmRleCAxM2RkMWVjMGRiLi5mNzJiMDNhZTllIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMy5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTgyMDdmOGFhYmQ2OTEzYTI1ZWUwYjQ5ODVlNzllMTY1
MmUyZGIyNzQ5MTVmM2NjZjk0MDhlMzMxOTFlZGU0ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
MGUxN2VkNWIxNjk3OTQ5YWM1MDlkOGM4ZTFhZDk2MTYwZWFiMjFjODhkZWE0ZjFhNmNmMTAxYmRi
Mjc4N2U1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============4651130072929046459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info, removed "/usr/lib/python3.13/site-packages/pdm/models/serializers.py /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py /usr/lib/python3.13/site-packages/pdm/misc/__init__.py"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.3.dist-info
  /usr/lib/python3.13/site-packages/pdm/misc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py was added
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was removed

--===============4651130072929046459==--

