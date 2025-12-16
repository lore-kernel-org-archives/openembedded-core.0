Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38579D5C0DB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PWGHdDWQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lSM4CKkq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e8a8b-9737767d-5567-48e5-988a-e499eb253502-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4/QFRybhub5wf1idQmlQWGNFD4mhOZ0RvDoUVLRLzzQ=;
	b=PWGHdDWQ8v5EEqSH0o6MtBFLMvlAPn4+ldZXTx32++WmefopGODxCGst7gTkERBK
	ouSjhiPyoaYr0tV8Z0IIMiAHa270iG7IjJfveZ9UMCcBJnzOC50Q6z/nDEV4ntaill5
	5bJcffywLR+UC9lo7h7kxoDhcztKShXnT5HhI+vI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4/QFRybhub5wf1idQmlQWGNFD4mhOZ0RvDoUVLRLzzQ=;
	b=lSM4CKkqMEdQ8c/UHQSEPqbM8pyZThW8DQKZlWw/TzZVD2CqpNxaLTxSMTBgH8cF
	YJhjRmdFnYufuROSfILrvPVc0l4Dl9wabiSrrZabbHGH0yAg7gimA7DFPpmZ/c33wKH
	7MGyFraIuIlEeuhgkX1qqHhu9vRzGfmTkIs27ehY=
Content-Type: multipart/mixed; boundary="===============8186717492053148698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-build-locked: upgrading to 0.3.7 SUCCEEDED
Message-ID: <0101019b262e8a8b-9737767d-5567-48e5-988a-e499eb253502-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227808

--===============8186717492053148698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-build-locked* to *0.3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-build-locked-upgrade-0.3.5-0.3.7.patch
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
From 4aff10a30b038119e74c3df94d3b835a04d33b2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:36:21 +0000
Subject: [PATCH] python3-pdm-build-locked: upgrade 0.3.5 -> 0.3.7

---
 ...-build-locked_0.3.5.bb => python3-pdm-build-locked_0.3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-build-locked_0.3.5.bb => python3-pdm-build-locked_0.3.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
rename to meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
index e8f2ad0e93..3844934d93 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pdm-project/pdm-build-locked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf551ca6adb7f6844201"
+SRC_URI[sha256sum] = "53428268284125532413434ebfeb8e7a287525516cc5a0a055d63ba63b207165"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8186717492053148698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info -> /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-build-locked (sysroot):
  /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info moved to /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info

--===============8186717492053148698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-build-locked: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_build_locked/pdm_build_locked-0.3.5.tar.gz;downloadfilename=pdm_build_locked-0.3.5.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_build_locked/pdm_build_locked-0.3.7.tar.gz;downloadfilename=pdm_build_locked-0.3.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dbg: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dbg: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dev: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dev: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-doc: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-doc: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-locale: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-locale: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-src: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-src: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-staticdev: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-staticdev: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PV changed from "0.3.5" to "0.3.7"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PKGV changed from 0.3.5 [default] to 0.3.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info -> /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PKGSIZE changed from 37224 to 38876 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm-build-locked (sysroot):
  /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.5.dist-info moved to /usr/lib/python3.13/site-packages/pdm_build_locked-0.3.7.dist-info

--===============8186717492053148698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-build-locked-upgrade-0.3.5-0.3.7.patch"

RnJvbSA0YWZmMTBhMzBiMDM4MTE5ZTc0YzNkZjk0ZDNiODM1YTA0ZDMzYjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6MzY6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1idWlsZC1sb2NrZWQ6IHVwZ3JhZGUgMC4zLjUgLT4gMC4zLjcKCi0tLQogLi4u
LWJ1aWxkLWxvY2tlZF8wLjMuNS5iYiA9PiBweXRob24zLXBkbS1idWlsZC1sb2NrZWRfMC4zLjcu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG0tYnVpbGQt
bG9ja2VkXzAuMy41LmJiID0+IHB5dGhvbjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuNy5iYn0gKDgw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRt
LWJ1aWxkLWxvY2tlZF8wLjMuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1wZG0tYnVpbGQtbG9ja2VkXzAuMy43LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYnVpbGQtbG9j
a2VkXzAuMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuNy5iYgppbmRleCBlOGYyYWQwZTkzLi4zODQ0OTM0ZDkz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJ1
aWxkLWxvY2tlZF8wLjMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuNy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS1idWlsZC1sb2NrZWQiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE5Mzgy
Y2RmOWMxNDNkZjRmMDBiOWNhYTBiNjBjNzVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWIy
ZjM4MWUwMGQ3OTg0MWQ0NmJlMmU2OTA5YzI2NTAzOGI5ZmE5NTFkZTJiZjU1MWNhNmFkYjdmNjg0
NDIwMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1MzQyODI2ODI4NDEyNTUzMjQxMzQzNGViZmVi
OGU3YTI4NzUyNTUxNmNjNWEwYTA1NWQ2M2JhNjNiMjA3MTY1IgogCiBpbmhlcml0IHB5cGkgcHl0
aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============8186717492053148698==--

