Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1501D5C0C0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17179.1765872132136240971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gxrgk+5E;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dkpTT/78;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e84fa-5227ee08-1819-4419-a060-3d94a48b02f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=17C/mniMwOK/I8MdUf9Bk4drq/Lv+veWUpaqWKeAptg=;
	b=Gxrgk+5EXKR6XbVmdiUYfWfgQHoT8F7dZwSYPY5Dn6D1Ve4xHXB+gzpYg430hqmW
	PlAZ32qkMfCtsiQArz1oN+40b0k3RSyeHQLMQVjJ7WSkgV4QHux1lFIM6yxwPOgOW18
	kixpyQYN1sQnGhLzYHg3cOSjBmFHScpyo8DfPtio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=17C/mniMwOK/I8MdUf9Bk4drq/Lv+veWUpaqWKeAptg=;
	b=dkpTT/78uc0yyJQsihi4pXumWW+R1MkIpWRreRBEu9wQstDNBYpUbibJxcJ8aaM6
	LrKK+uAdvP4wRMitCpr5ohRvW/mr7EfBIePHBglZcT8fHeDh8VNo5FqHOLHhlw9UR72
	UVZ6dO8sGsMNeAwTdUC44Z0zMRhRe9bewKnVM4wQ=
Content-Type: multipart/mixed; boundary="===============8620632966348831658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniconfig: upgrading to 2.3.0 SUCCEEDED
Message-ID: <0101019b262e84fa-5227ee08-1819-4419-a060-3d94a48b02f0-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227805

--===============8620632966348831658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-iniconfig* to *2.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iniconfig-upgrade-2.1.0-2.3.0.patch
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
From 68eef4802a124c8f49a2f630cd378af98724a612 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:50:37 +0000
Subject: [PATCH] python3-iniconfig: upgrade 2.1.0 -> 2.3.0

---
 .../{python3-iniconfig_2.1.0.bb => python3-iniconfig_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_2.1.0.bb => python3-iniconfig_2.3.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
index d9b31aea4a..1937285c3b 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/iniconfig/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
 
-SRC_URI[sha256sum] = "3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7"
+SRC_URI[sha256sum] = "c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-- 
2.47.1


--===============8620632966348831658==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iniconfig-upgrade-2.1.0-2.3.0.patch"

RnJvbSA2OGVlZjQ4MDJhMTI0YzhmNDlhMmY2MzBjZDM3OGFmOTg3MjRhNjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6NTA6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWluaWNvbmZpZzogdXBncmFkZSAyLjEuMCAtPiAyLjMuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaW5pY29uZmlnXzIuMS4wLmJiID0+IHB5dGhvbjMtaW5pY29uZmlnXzIuMy4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWluaWNvbmZpZ18yLjEuMC5i
YiA9PiBweXRob24zLWluaWNvbmZpZ18yLjMuMC5iYn0gKDc3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjMuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaW5pY29uZmlnXzIuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMy4wLmJiCmluZGV4IGQ5YjMxYWVhNGEuLjE5
MzcyODVjM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbmljb25maWdfMi4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWluaWNvbmZpZ18yLjMuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2luaWNvbmZpZy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNzNhZjRiNWYxZjNhODczMWU1ZGVm
NzBlOGMxMjU0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2FiYmQyZTMwYjM2NzMzZmVlNzhm
OWM3ZjczMDhmMmQwMDUwZTg4ZjAwODdmZDI1YzI2NDVmNjNjNzczZTFjNyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjNzYzMTVjNzdkYjA2ODY1MGQ0OWM1YjU2MzE0Nzc0YTc4MDRkZjE2ZmVlNDQw
MmMxZjE5ZDZkMTVkOGM0NzMwIgogCiBERVBFTkRTICs9ICJweXRob24zLWhhdGNoLXZjcy1uYXRp
dmUiCiAKLS0gCjIuNDcuMQoK

--===============8620632966348831658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: FILELIST: directory renamed /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/WHEEL /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/WHEEL /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/METADATA /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/top_level.txt"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PKGSIZE changed from 26913 to 35410 (+32%)
Changes to packages/x86-64-v3-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info moved to /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info
  /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/top_level.txt was added

--===============8620632966348831658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-iniconfig: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.1.0.tar.gz;downloadfilename=iniconfig-2.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iniconfig/iniconfig-2.3.0.tar.gz;downloadfilename=iniconfig-2.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dbg: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dev: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-dev: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-doc: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-doc: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-locale: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-locale: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-src: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-src: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig-staticdev: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PKGV changed from 2.1.0 [default] to 2.3.0 [default]
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PV changed from "2.1.0" to "2.3.0"
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: PKGSIZE changed from 26913 to 35410 (+32%)
packages/x86-64-v3-poky-linux/python3-iniconfig/python3-iniconfig: FILELIST: directory renamed /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/METADATA /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info/WHEEL", added "/usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/top_level.txt /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/METADATA /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/WHEEL"
Changes to packages/x86-64-v3-poky-linux/python3-iniconfig (sysroot):
  /usr/lib/python3.13/site-packages/iniconfig-2.1.0.dist-info moved to /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info
  /usr/lib/python3.13/site-packages/iniconfig-2.3.0.dist-info/top_level.txt was added

--===============8620632966348831658==--

