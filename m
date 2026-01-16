Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DB7D47CD5
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1465.1768526743272598335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D0JbhjQK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PTRbIixK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc4689c4f-08d99eba-e013-4bd5-903f-a3e6ccff87b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gEKq6K8qRcjd/s4fBM6bYY7w3U3+ptqCxqMk4OKor/E=;
	b=D0JbhjQKyMF7WUCaRllgAr62aLpJ6aiPG+gMa3yiRswqQMcRVd51ff5m1u77I+/5
	lEZ5FWmCfM2VPMS0gfk1J1VVuT9mJQ7qdjhGQ6Z5ev2EtVlH9/5oJVrZBthTQHcynjy
	BbHlcuPd3CoeMYWP1cBMUQ2RAhzG3XnSHYoZ65P4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gEKq6K8qRcjd/s4fBM6bYY7w3U3+ptqCxqMk4OKor/E=;
	b=PTRbIixKc7SLclkR9b9PjRg+XgUPUkBiok1wsKnWoUKa6oOGvLH709F7yH/aZ5OS
	y4mmBDM3om37oaXBePkxjMR9OuJEU/FGyz/BCYb981YWAgVCtNSz+hSwbbnX9AnQuQ/
	2y/RFWkUxSKMGQ2jzzrynbUCKBUnedTrRSZMTV8U=
Content-Type: multipart/mixed; boundary="===============2130008177139863418=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.4 SUCCEEDED
Message-ID: <0101019bc4689c4f-08d99eba-e013-4bd5-903f-a3e6ccff87b5-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229467

--===============2130008177139863418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.2-2.26.4.patch
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
From 73e18b64aff9186225a64d844d7731284fb90159 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:47:21 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.2 -> 2.26.4

---
 .../python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.2.bb => python3-pdm_2.26.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.4.bb
index 13dd1ec0db..de4a7618d4 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
+SRC_URI[sha256sum] = "d1030f6bd8e9449b5791e7768f1a856cc54617ee7b00f56fa1a843a84ad77f6e"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============2130008177139863418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info, removed "/usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/models/serializers.py", added "/usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/misc/__init__.py /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info
  /usr/lib/python3.13/site-packages/pdm/misc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py was added
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was removed

--===============2130008177139863418==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.2-2.26.4.patch"

RnJvbSA3M2UxOGI2NGFmZjkxODYyMjVhNjRkODQ0ZDc3MzEyODRmYjkwMTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6NDc6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI2LjIgLT4gMi4yNi40CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjYuMi5iYiA9PiBweXRob24zLXBkbV8yLjI2LjQuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjYuMi5iYiA9PiBweXRo
b24zLXBkbV8yLjI2LjQuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjQu
YmIKaW5kZXggMTNkZDFlYzBkYi4uZGU0YTc2MThkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjQuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4MjA3ZjhhYWJkNjkxM2EyNWVlMGI0OTg1ZTc5ZTE2
NTJlMmRiMjc0OTE1ZjNjY2Y5NDA4ZTMzMTkxZWRlNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDEwMzBmNmJkOGU5NDQ5YjU3OTFlNzc2OGYxYTg1NmNjNTQ2MTdlZTdiMDBmNTZmYTFhODQzYTg0
YWQ3N2Y2ZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============2130008177139863418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.2.tar.gz;downloadfilename=pdm-2.26.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.4.tar.gz;downloadfilename=pdm-2.26.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.2" to "2.26.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.2 [default] to 2.26.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2252358 to 2269333 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/models/serializers.py", added "/usr/lib/python3.13/site-packages/pdm/misc/__init__.py /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.4.dist-info
  /usr/lib/python3.13/site-packages/pdm/misc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__init__.py was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__ was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/__pycache__/sysconfig_patcher.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/misc/sysconfig_patcher.py was added
  /usr/lib/python3.13/site-packages/pdm/models/__pycache__/serializers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pdm/models/serializers.py was removed

--===============2130008177139863418==--

