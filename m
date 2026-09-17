Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5771FC982D7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33830.1789629010607829941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KIRga23f;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I6q5WCEx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0ae33902f-fececd8f-f278-488b-b1f9-00d3234240df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8z1SzuIAjF7vPoXkG02njScwSKCecWcldFzPmZOWi8E=;
	b=KIRga23fUnkLA6vA5NOWrIWiUoBk9S19Sl4Xpht8U17HmoSAAeIacgdoAwsea/l5
	TbHhjc6S1nW6txSnvZV5KTUqZZCVjEKQ3bBGSufijzN+Zva0twlKVx4E+YEyT3i+sOj
	0UOuhzMy+dVNynFpuDnEuo6qj6WSLwUOS4gb+tZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8z1SzuIAjF7vPoXkG02njScwSKCecWcldFzPmZOWi8E=;
	b=I6q5WCExXRlRyHyLZHS5s30XY80cNW2Bm8XFdNcAHPeHxV0myMNswHmwEvPnKhYd
	mz5fZL9GKpP9tr3C0/TPx3xZ0RRtSDVLB5dx166W++e7fqufiM+V5zkSdyA81fiDY8G
	sBC61Jt9J4zZggyOE4nCwkKIorntp7T71A1gyG8M=
Content-Type: multipart/mixed; boundary="===============2530387000379833937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-build-locked: upgrading to 0.3.8 SUCCEEDED
Message-ID: <010101a0ae33902f-fececd8f-f278-488b-b1f9-00d3234240df-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246032

--===============2530387000379833937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-build-locked* to *0.3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-build-locked-upgrade-0.3.7-0.3.8.patch
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
From 1a99f89bff82f3a67f784d019f83cf393752c79b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 05:57:21 +0000
Subject: [PATCH] python3-pdm-build-locked: upgrade 0.3.7 -> 0.3.8

---
 ...-build-locked_0.3.7.bb => python3-pdm-build-locked_0.3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-build-locked_0.3.7.bb => python3-pdm-build-locked_0.3.8.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
rename to meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
index 8189bc7e56..2b707a0a93 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pdm-project/pdm-build-locked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "53428268284125532413434ebfeb8e7a287525516cc5a0a055d63ba63b207165"
+SRC_URI[sha256sum] = "c2a608b288ed08618228880c2e6d6a616049c25eeb71786d06d1061d129764ba"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============2530387000379833937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info -> /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PKGSIZE changed from 41405 to 47924 (+16%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm-build-locked (sysroot):
  /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info

--===============2530387000379833937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-build-locked: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_build_locked/pdm_build_locked-0.3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_build_locked/pdm_build_locked-0.3.8.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dbg: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dbg: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dev: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-dev: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-doc: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-doc: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-locale: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-locale: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-src: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-src: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-staticdev: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked-staticdev: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PKGSIZE changed from 41405 to 47924 (+16%)
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/python3-pdm-build-locked/python3-pdm-build-locked: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info -> /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-build-locked (sysroot):
  /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm_build_locked-0.3.8.dist-info

--===============2530387000379833937==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-build-locked-upgrade-0.3.7-0.3.8.patch"

RnJvbSAxYTk5Zjg5YmZmODJmM2E2N2Y3ODRkMDE5ZjgzY2YzOTM3NTJjNzliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDU6NTc6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1idWlsZC1sb2NrZWQ6IHVwZ3JhZGUgMC4zLjcgLT4gMC4zLjgKCi0tLQogLi4u
LWJ1aWxkLWxvY2tlZF8wLjMuNy5iYiA9PiBweXRob24zLXBkbS1idWlsZC1sb2NrZWRfMC4zLjgu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG0tYnVpbGQt
bG9ja2VkXzAuMy43LmJiID0+IHB5dGhvbjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuOC5iYn0gKDc4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRt
LWJ1aWxkLWxvY2tlZF8wLjMuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1wZG0tYnVpbGQtbG9ja2VkXzAuMy44LmJiCnNpbWlsYXJpdHkgaW5kZXggNzglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYnVpbGQtbG9j
a2VkXzAuMy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuOC5iYgppbmRleCA4MTg5YmM3ZTU2Li4yYjcwN2EwYTkz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJ1
aWxkLWxvY2tlZF8wLjMuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtLWJ1aWxkLWxvY2tlZF8wLjMuOC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS1idWlsZC1sb2NrZWQiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE5Mzgy
Y2RmOWMxNDNkZjRmMDBiOWNhYTBiNjBjNzVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTM0
MjgyNjgyODQxMjU1MzI0MTM0MzRlYmZlYjhlN2EyODc1MjU1MTZjYzVhMGEwNTVkNjNiYTYzYjIw
NzE2NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjMmE2MDhiMjg4ZWQwODYxODIyODg4MGMyZTZk
NmE2MTYwNDljMjVlZWI3MTc4NmQwNmQxMDYxZDEyOTc2NGJhIgogCiBpbmhlcml0IHB5cGkgcHl0
aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============2530387000379833937==--

