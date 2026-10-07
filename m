Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42857CA600E
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:48:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1831.1791352120011365956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M6zGdUMF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2MOA2EEW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a114e81f6b-c5e98490-58fe-461a-b606-a6169bac27e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791352119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=siRwDalargv0ghOpaFYBh9qs5Ei7D/gGGJ8wvRN+4i0=;
	b=M6zGdUMFGzIGnQuWWSEiCfTXkAGLyD+8Ekkp3iEbq6yc3z9yI3tG3gtQtC/cTMbi
	nh0kV+P1o0k3zViHy03BIgarNhohAIkOOfbfKSpnisWkCt6RnZieEPIahTP8iQpegkV
	dd2PsviR766etMa4Vi3UhbXtjigjDgYaeY6Cx14I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791352119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=siRwDalargv0ghOpaFYBh9qs5Ei7D/gGGJ8wvRN+4i0=;
	b=2MOA2EEW2IE68STwTIHtR2oUqyjkz1nnT7ls8nyqRkarh6KLclThL8kmClkI+Xw9
	6mQDeUfJ+RcfEb3nfju+UMcNPF7X+gDQkAib5BadrEVBuXT++GNKU6jm3RAha/aoV3j
	P9mWJJ7c87aXZl6x0b4sKjqKUiNpg5g72ME/yTVU=
Content-Type: multipart/mixed; boundary="===============8250847587645300625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniconfig: upgrading to 2.3.1 SUCCEEDED
Message-ID: <010101a114e81f6b-c5e98490-58fe-461a-b606-a6169bac27e1-000000@us-west-2.amazonses.com>
Date: Wed, 7 Oct 2026 05:48:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.07-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247363

--===============8250847587645300625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-iniconfig* to *2.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iniconfig-upgrade-2.3.0-2.3.1.patch
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
From 9d14fe94b2e9037778e2c0daf422eabc430478c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 7 Oct 2026 05:29:54 +0000
Subject: [PATCH] python3-iniconfig: upgrade 2.3.0 -> 2.3.1

2.3.1
=====
---
 .../{python3-iniconfig_2.3.0.bb => python3-iniconfig_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_2.3.0.bb => python3-iniconfig_2.3.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
index 6933ac4935..a20ac8b3fe 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/iniconfig/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
 
-SRC_URI[sha256sum] = "c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730"
+SRC_URI[sha256sum] = "67f4b9c50da0dedf52af349e7749a80a9057a5031199791b906c3bb3ae878960"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============8250847587645300625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: FILELIST: directory renamed /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info -> /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info moved to /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info

--===============8250847587645300625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-iniconfig: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.3.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-iniconfig: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dev: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dev: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-doc: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-doc: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-locale: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-locale: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-src: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-src: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PV changed from "2.3.0" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PKGV changed from 2.3.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PKGSIZE changed from 42216 to 42615 (+1%)
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: FILELIST: directory renamed /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info -> /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PV changed from "2.3.0" to "2.3.1"
Changes to packages/x86-64-v3-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.14/site-packages/iniconfig-2.3.0.dist-info moved to /usr/lib/python3.14/site-packages/iniconfig-2.3.1.dist-info

--===============8250847587645300625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-iniconfig-changelog.txt"

2.3.1
=====

--===============8250847587645300625==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iniconfig-upgrade-2.3.0-2.3.1.patch"

RnJvbSA5ZDE0ZmU5NGIyZTkwMzc3NzhlMmMwZGFmNDIyZWFiYzQzMDQ3OGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAwNToyOTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW5pY29uZmlnOiB1cGdyYWRlIDIuMy4wIC0+IDIuMy4xCgoyLjMuMQo9PT09PQotLS0K
IC4uLi97cHl0aG9uMy1pbmljb25maWdfMi4zLjAuYmIgPT4gcHl0aG9uMy1pbmljb25maWdfMi4z
LjEuYmJ9ICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW5pY29u
ZmlnXzIuMy4wLmJiID0+IHB5dGhvbjMtaW5pY29uZmlnXzIuMy4xLmJifSAoNzglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbmljb25maWdfMi4z
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIu
My4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1pbmljb25maWdfMi4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbmljb25maWdfMi4zLjEuYmIKaW5kZXggNjkz
M2FjNDkzNS4uYTIwYWM4YjNmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMy4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01F
UEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvaW5pY29uZmlnLyIKIExJQ0VOU0UgPSAi
TUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGE3M2FmNGI1ZjFm
M2E4NzMxZTVkZWY3MGU4YzEyNTQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNzYzMTVjNzdk
YjA2ODY1MGQ0OWM1YjU2MzE0Nzc0YTc4MDRkZjE2ZmVlNDQwMmMxZjE5ZDZkMTVkOGM0NzMwIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjY3ZjRiOWM1MGRhMGRlZGY1MmFmMzQ5ZTc3NDlhODBhOTA1
N2E1MDMxMTk5NzkxYjkwNmMzYmIzYWU4Nzg5NjAiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0
dXB0b29scy1zY20tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============8250847587645300625==--

