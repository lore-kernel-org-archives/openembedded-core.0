Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F61DC54EB7
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1269.1710522011395964736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N0soV7Ts;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eAxPKZzD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e430e8bf8-f5f9bc71-38dc-46be-aedf-2a6eb3b51a23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q0Ht4VnvsQbVtyyH++IJHP3q/rfST40ZQ9rjXBmqQh0=;
	b=N0soV7TsRHv6SshcFiJJZLROJAhCkVutm6fRug0+WtpnB1wC3djnGFyoZtw86lL/
	mgiMZCnRlu7kjyWvR3dU6V0HzhABzrxGdGhkvABuYCdqDfpzSTd4aTge2rEJI0auwmB
	DvnDdz4uDdJNkcVth779qNimQVCN+8UohfGiXHzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q0Ht4VnvsQbVtyyH++IJHP3q/rfST40ZQ9rjXBmqQh0=;
	b=eAxPKZzD9Jfm7xodvF44lzs2SG5HAk5m4hBvMItMlvgsl7cwfDq0N2uOP9E1TVgA
	4qPzP3VfglCMSOaZDB0azgJftbLNamXf9F6yXctOIoqJKKh/LLrOI7rvKag56C9RA6R
	Pg5OtL0Lgmn1MPs5EISAAwnCH+ZAoHqfeCdBiDHo=
Content-Type: multipart/mixed; boundary="===============2562432148220975901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.21 SUCCEEDED
Message-ID: <0101018e430e8bf8-f5f9bc71-38dc-46be-aedf-2a6eb3b51a23-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197158

--===============2562432148220975901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcomps* to *0.1.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.20-0.1.21.patch
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
From cbc96b459115e0d1794df5113be5a2c7b96b9036 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 06:08:48 +0000
Subject: [PATCH] libcomps: upgrade 0.1.20 -> 0.1.21

---
 ...Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 9 +++------
 .../libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb}  | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6cd052889a..7658af2a3c 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,7 +1,7 @@
-From 32447a79e24f8e7e9e0150eb747f34116d63ef38 Mon Sep 17 00:00:00 2001
+From 975ace691a9f7b33471829697db14baa75306c80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH 2/2] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index f813af4..9eebb6c 100644
+index d22b84e..ad67309 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -85,7 +85,7 @@ IF (SKBUILD)
@@ -22,6 +22,3 @@ index f813af4..9eebb6c 100644
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
index 1f59c5ea1e..91170dfbed 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "854fbb9fe733b774981e1ffcf825b2d2ce0f8072"
+SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============2562432148220975901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcomps: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-src: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-src: PKGSIZE changed from 816687 to 816714 (+0%)
packages/core2-64-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps: PKGV changed from 0.1.20 [default] to 0.1.21 [default]

--===============2562432148220975901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.20-0.1.21.patch"

RnJvbSBjYmM5NmI0NTkxMTVlMGQxNzk0ZGY1MTEzYmU1YTJjN2I5NmI5MDM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDY6MDg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb21wczogdXBncmFkZSAwLjEuMjAgLT4gMC4xLjIxCgotLS0KIC4uLkRvLW5vdC1zZXQtUFlU
SE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIHwgOSArKystLS0tLS0KIC4u
Li9saWJjb21wcy97bGliY29tcHNfMC4xLjIwLmJiID0+IGxpYmNvbXBzXzAuMS4yMS5iYn0gIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL3tsaWJjb21wc18wLjEuMjAuYmIg
PT4gbGliY29tcHNfMC4xLjIxLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJjb21wcy9saWJjb21wcy8wMDAyLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExf
RElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNv
bXBzL2xpYmNvbXBzLzAwMDItRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmlu
Zy1weXRob24ucGF0Y2gKaW5kZXggNmNkMDUyODg5YS4uNzY1OGFmMmEzYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzLzAwMDItRG8tbm90LXNldC1Q
WVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzLzAwMDItRG8tbm90LXNldC1QWVRIT05fSU5T
VEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDMy
NDQ3YTc5ZTI0ZjhlN2U5ZTAxNTBlYjc0N2YzNDExNmQ2M2VmMzggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDk3NWFjZTY5MWE5ZjdiMzM0NzE4Mjk2OTdkYjE0YmFhNzUzMDZjODAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MjI6MDkgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSCAyLzJdIERvIG5vdCBzZXQgUFlUSE9OX0lOU1RBTExfRElSIGJ5IHJ1bm5p
bmcgcHl0aG9uLgorU3ViamVjdDogW1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJ
UiBieSBydW5uaW5nIHB5dGhvbi4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtv
ZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CkBAIC0xMCw3ICsxMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliY29tcHMvc3Jj
L3B5dGhvbi9zcmMvQ01ha2VMaXN0cy50eHQgYi9saWJjb21wcy9zcmMvcHl0aG9uL3NyYy9DTWFr
ZUxpc3RzLnR4dAotaW5kZXggZjgxM2FmNC4uOWVlYmI2YyAxMDA2NDQKK2luZGV4IGQyMmI4NGUu
LmFkNjczMDkgMTAwNjQ0CiAtLS0gYS9saWJjb21wcy9zcmMvcHl0aG9uL3NyYy9DTWFrZUxpc3Rz
LnR4dAogKysrIGIvbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvQ01ha2VMaXN0cy50eHQKIEBAIC04
NSw3ICs4NSw3IEBAIElGIChTS0JVSUxEKQpAQCAtMjIsNiArMjIsMyBAQCBpbmRleCBmODEzYWY0
Li45ZWViYjZjIDEwMDY0NAogIAogICAgICBJTlNUQUxMKEZJTEVTICR7cHljb21wc19TUkNESVJ9
L2xpYmNvbXBzL19faW5pdF9fLnB5IERFU1RJTkFUSU9OICR7UFlUSE9OX0lOU1RBTExfRElSfS9s
aWJjb21wcykKICAgICAgI0lOU1RBTEwoRklMRVMgJHtweWNvbXBzX1NSQ0RJUn0vdGVzdHMvX190
ZXN0LnB5IERFU1RJTkFUSU9OCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjIwLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzXzAuMS4yMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjIw
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4x
LjIxLmJiCmluZGV4IDFmNTljNWVhMWUuLjkxMTcwZGZiZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJjb21wcy9saWJjb21wc18wLjEuMjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzXzAuMS4yMS5iYgpAQCAtOCw3ICs4LDcgQEAg
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmNv
bXBzLmdpdDticmFuY2g9bWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovLzAwMDItRG8tbm90LXNl
dC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ1JFViA9ICI4NTRmYmI5ZmU3MzNiNzc0OTgxZTFmZmNmODI1YjJkMmNlMGY4MDcy
IgorU1JDUkVWID0gIjJlOTczY2UyMjY5OGRkNjRmNDcyMTgwZTNhNjg5NzU1MjY4ZmIwNmIiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDIuMAoK

--===============2562432148220975901==--

