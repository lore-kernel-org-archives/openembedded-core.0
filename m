Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE9DD172CE
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29051.1769951564325005732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jd+cWE6V;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ILlg+elm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955a67a-fb3a7650-bfd2-4184-87e3-40646efeb8db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dt7/BKYsS0uqwWjmsObfvRPHarFA+KyR4hFUHoWdmew=;
	b=jd+cWE6VO2qqXaiKVnT+OMxAoc1Tx3vovHuH5sHru3JbMLLkgIpVaTsPCQU/Merw
	s9y3PRohj/8xW9bVztOX6F8HFbzx2+Ticnf1zwtjr3yPGLX+wO4lNSmu0isbYVC8mXI
	WfEwJiRyyvK+QLAKVJJwLW373+4YgQyISbQiBNy0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dt7/BKYsS0uqwWjmsObfvRPHarFA+KyR4hFUHoWdmew=;
	b=ILlg+elmxHdAN83DCx0MjAa1V0pHy5n4jEiTjH2um7zMF+ioIueSW47lcGzLvQSw
	ulW860iniVDt2fqe0sLW3W0VxUPqMWzx3LcTjGq0lprLEJkjmEMal+Fe+dVGmJpcxt9
	fC+6o90OEmQQ1CpphHSuN6nu+MYxs96D36Ea3C/4=
Content-Type: multipart/mixed; boundary="===============7627748666261274212=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.7 SUCCEEDED
Message-ID: <0101019c1955a67a-fb3a7650-bfd2-4184-87e3-40646efeb8db-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230282

--===============7627748666261274212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.6-2.4.7.patch
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
From 764cd20662dbaab667f1b4022bac503a575c96c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:45:50 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.6 -> 2.4.7

---
 ...ython3-pdm-backend_2.4.6.bb => python3-pdm-backend_2.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.6.bb => python3-pdm-backend_2.4.7.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
index 95d8e3e4a4..d542909c50 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532"
+SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============7627748666261274212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info

--===============7627748666261274212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.6.tar.gz;downloadfilename=pdm_backend-2.4.6.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.7.tar.gz;downloadfilename=pdm_backend-2.4.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.6" to "2.4.7"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.6 [default] to 2.4.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 837163 to 837610 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info

--===============7627748666261274212==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.6-2.4.7.patch"

RnJvbSA3NjRjZDIwNjYyZGJhYWI2NjdmMWI0MDIyYmFjNTAzYTU3NWM5NmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODo0NTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtLWJhY2tlbmQ6IHVwZ3JhZGUgMi40LjYgLT4gMi40LjcKCi0tLQogLi4ueXRob24z
LXBkbS1iYWNrZW5kXzIuNC42LmJiID0+IHB5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjcuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG0tYmFja2VuZF8yLjQu
Ni5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC43LmJifSAoODElKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQu
Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNy5iYgppbmRleCA5
NWQ4ZTNlNGE0Li5kNTQyOTA5YzUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC43LmJiCkBAIC00LDcgKzQsNyBA
QCBMSUNFTlNFID0gIk1JVCIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGE1NjQyOTdiM2M1YjYyOWE1MjhiOTJmZDhmZjYx
ZWEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZGQ5Y2Q1ODFhNGYxOGQ1N2ZmNTA2YTViM2Fh
ZDdjOGRmMzFlNTk0OWI2ZmQ4NTRiYmMzNGMzODEwN2U0NTMyIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImE1MDlkMDgzODUwMzc4Y2U5MTlkNDFlN2EyZmFkZGZjNTdhMTc2NGQzNzY5MTNjNjY3MzEx
MjVkNmIxNDExMGYiCiAKIGluaGVyaXQgcHlwaSBweXRob25fcGVwNTE3CiAKLS0gCjIuNDcuMQoK

--===============7627748666261274212==--

