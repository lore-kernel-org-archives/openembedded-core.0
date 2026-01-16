Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BFDD47CC3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1431.1768526746413650279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GwyQ7O2M;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JMmvYczs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc4689f01-267b835e-524c-4773-b97e-358573df8070-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DDa8iRUmzyVuQmOpsYz5eqGAS5JUZBldbYzxCrUDayo=;
	b=GwyQ7O2MN+2C1ffuNfU78kfh+u8+RpiiWQNJuSY30puiUMajDmKRmG1eUGKvSGdj
	dr+GnYJVqTxgCqECDMoij0fTvG8g5pQ7TfmPLE+IOdhoCt+enHPY5PBUrUHOY1NM5I/
	HagqFLGzrjzR+LK3P1099V7LJ+Yog8ou2yMdXgLo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DDa8iRUmzyVuQmOpsYz5eqGAS5JUZBldbYzxCrUDayo=;
	b=JMmvYczsV+fNCFXrQWGC2IGHVf/WLC+N1b38KeRVXbhT/LCXV8W4d/6cUvxuT8y1
	x6whGm9DAPU/Shmhj0Tvirvn7vHPfHuM8AS05k0+tj3cDRlhDrRQ7P/H0EMODc8Whd1
	Fl1yoDLovHhGGcS+6NqTz109CG+wAUsPVwDQMMKI=
Content-Type: multipart/mixed; boundary="===============0905520972955215811=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 16.0 SUCCEEDED
Message-ID: <0101019bc4689f01-267b835e-524c-4773-b97e-358573df8070-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229473

--===============0905520972955215811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-15.0.1-16.0.patch
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
From 1fb2b5f4c2f84583e43c7b16629aa8bcb80d96cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 22:08:06 +0000
Subject: [PATCH] python3-websockets: upgrade 15.0.1 -> 16.0

---
 ...{python3-websockets_15.0.1.bb => python3-websockets_16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_15.0.1.bb => python3-websockets_16.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_15.0.1.bb b/meta/recipes-devtools/python/python3-websockets_16.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_15.0.1.bb
rename to meta/recipes-devtools/python/python3-websockets_16.0.bb
index 2e1b0f0919..0cad5569c0 100644
--- a/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
+SRC_URI[sha256sum] = "5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============0905520972955215811==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-15.0.1-16.0.patch"

RnJvbSAxZmIyYjVmNGMyZjg0NTgzZTQzYzdiMTY2MjlhYThiY2I4MGQ5NmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjI6MDg6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTUuMC4xIC0+IDE2LjAKCi0tLQogLi4ue3B5dGhv
bjMtd2Vic29ja2V0c18xNS4wLjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAu
MS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTYuMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNS4wLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNi4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTYuMC5iYgppbmRleCAyZTFiMGYw
OTE5Li4wY2FkNTU2OWMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2Vic29ja2V0c18xNS4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTYuMC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTE5MjRhNmFmNDQ5NWI4Y2ZhZWUxYjFk
YTg2OWI2ZjQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MjU0NGRlMDIwNzZiYWZiYTAzOGNlMDU1ZWU2NDEyZDY4
ZGExM2FiNDdmMGM2MGNhYjgyNzM0NmRlODI4ZGVlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVm
NjI2MWE1ZTU2ZThkNWM0MmE0NDk3YjM2NGVhMjRkOTRkOTU2M2U4ZmJkNDRlNzhhYzQwODc5YzYw
MTc5YjUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4x
Cgo=

--===============0905520972955215811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info -> /usr/lib/python3.13/site-packages/websockets-16.0.dist-info, added "/usr/lib/python3.13/site-packages/websockets/__pycache__/proxy.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets/proxy.py"
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/websockets/proxy.py was added
  /usr/lib/python3.13/site-packages/websockets/__pycache__/proxy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL was removed

--===============0905520972955215811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-15.0.1.tar.gz;downloadfilename=websockets-15.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.0.tar.gz;downloadfilename=websockets-16.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGSIZE changed from 24288 to 24312 (+0%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/15.0.1/src/websockets -> /usr/src/debug/python3-websockets/16.0/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGSIZE changed from 5767 to 5920 (+3%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "15.0.1" to "16.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info -> /usr/lib/python3.13/site-packages/websockets-16.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/websockets/proxy.py /usr/lib/python3.13/site-packages/websockets/__pycache__/proxy.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 15.0.1 [default] to 16.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1275473 to 1285191 (+1%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "15.0.1" to "16.0"
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/websockets-16.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/websockets/proxy.py was added
  /usr/lib/python3.13/site-packages/websockets/__pycache__/proxy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/websockets-15.0.1.dist-info/WHEEL was removed

--===============0905520972955215811==--

