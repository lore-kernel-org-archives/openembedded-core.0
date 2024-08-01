Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DFAC5479B
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75500.1722536830652338405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=An/5pzrs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Ym+z8EVv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f322c12-dcc0e93b-de84-42b5-8ed0-2c5bcda7048f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qmbOfKOBIvuuV7+Y3uEs43WEwDFosJzYcH2Qiu3xHT8=;
	b=An/5pzrsDyv+35pwzLT3mWr5D+4u4EdIy2th+j3awfAtVpy9a+ouko62CE2fkexy
	4q+diR5I8SXttSE+7+4j0yjgVtJbrtwFEkuMS6uLmQwdrOabsZEcQxaCGiL/djegriM
	lI9YUeMGssKBw7YrcRasocXFkrDop4PUjAIy8bXk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qmbOfKOBIvuuV7+Y3uEs43WEwDFosJzYcH2Qiu3xHT8=;
	b=Ym+z8EVvndKBBLUwT3vdGHtXN/RDuZCIlp+KH/KWVG6rCnv/AOYT8KnWdG8IxJbB
	3TTX50Cc1PFFPwKBtWbwi6J36YrpOeHCl6lI6fGUfd6BN+on21VuKGHgsFvgaR8pJzm
	bsRZSTTKOTnKOElYjoO6D4BK3t2kNG+6jDji4fXU=
Content-Type: multipart/mixed; boundary="===============1439141177487440051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.290.0 SUCCEEDED
Message-ID: <010101910f322c12-dcc0e93b-de84-42b5-8ed0-2c5bcda7048f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202840

--===============1439141177487440051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.3.290.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.283.0-1.3.290.0.patch
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
From eb5f81dd954e0d459665f3d9592559e74460c078 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 13:47:12 +0000
Subject: [PATCH] glslang: upgrade 1.3.283.0 -> 1.3.290.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.3.283.0.bb => glslang_1.3.290.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.283.0.bb => glslang_1.3.290.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 5001d63144..b3c7796fc0 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From fc33f1cf032a15c07044ef932bc991c346d62d62 Mon Sep 17 00:00:00 2001
+From 156ccaae3289a7804c628a74ca41a1a2689daa4c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index e4690f09..8e660bc5 100644
+index 8d4b1e9c..717c6d47 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -233,6 +233,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -235,6 +235,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
index b58bd1e956..d6ee46de1e 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "e8dd0b6903b34f1879520b444634c75ea2deedf5"
+SRCREV = "fa9c3deb49e035a8abcabe366f26aac010f6cbfb"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.44.0


--===============1439141177487440051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.14.2.0 /usr/lib/libSPVRemapper.so.14.2.0 /usr/lib/libglslang.so.14.2.0 /usr/lib/libglslang-default-resource-limits.so.14.2.0", added "/usr/lib/libglslang-default-resource-limits.so.14.3.0 /usr/lib/libglslang.so.14.3.0 /usr/lib/libSPVRemapper.so.14.3.0 /usr/lib/libSPIRV.so.14.3.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.2.0 to libglslang-default-resource-limits.so.14.3.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.2.0 to libglslang.so.14.3.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.2.0 to libSPIRV.so.14.3.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.2.0 to libSPVRemapper.so.14.3.0
  /usr/lib/libglslang-default-resource-limits.so.14.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.3.0
  /usr/lib/libglslang.so.14.2.0 moved to /usr/lib/libglslang.so.14.3.0
  /usr/lib/libSPIRV.so.14.2.0 moved to /usr/lib/libSPIRV.so.14.3.0
  /usr/lib/libSPVRemapper.so.14.2.0 moved to /usr/lib/libSPVRemapper.so.14.3.0

--===============1439141177487440051==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSBlYjVmODFkZDk1NGUwZDQ1OTY2NWYzZDk1OTI1NTllNzQ0NjBjMDc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMzo0NzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI4My4wIC0+IDEuMy4yOTAuMAoKLS0tCiAuLi4vZ2xzbGFuZy9n
bHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoICB8IDYgKysrLS0t
CiAuLi4vZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjgzLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjkwLjAu
YmJ9ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuMy4y
ODMuMC5iYiA9PiBnbHNsYW5nXzEuMy4yOTAuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1w
a2ctY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8w
MDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAppbmRleCA1MDAxZDYzMTQ0Li5i
M2M3Nzk2ZmMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNs
YW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1j
b25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZjMzNmMWNmMDMyYTE1YzA3MDQ0ZWY5
MzJiYzk5MWMzNDZkNjJkNjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE1NmNjYWFl
MzI4OWE3ODA0YzYyOGE3NGNhNDFhMWEyNjg5ZGFhNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1
biwgNyBGZWIgMjAyMSAwMTozMDozOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnZW5lcmF0ZSBn
bHNsYW5nIHBrZy1jb25maWcKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKb3Nl
IFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2NDQg
Z2xzbGFuZy9nbHNsYW5nLnBjLmNtYWtlLmluCiAKIGRpZmYgLS1naXQgYS9nbHNsYW5nL0NNYWtl
TGlzdHMudHh0IGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotaW5kZXggZTQ2OTBmMDkuLjhlNjYw
YmM1IDEwMDY0NAoraW5kZXggOGQ0YjFlOWMuLjcxN2M2ZDQ3IDEwMDY0NAogLS0tIGEvZ2xzbGFu
Zy9DTWFrZUxpc3RzLnR4dAogKysrIGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotQEAgLTIzMyw2
ICsyMzMsOCBAQCBpZihHTFNMQU5HX0VOQUJMRV9JTlNUQUxMKQorQEAgLTIzNSw2ICsyMzUsOCBA
QCBpZihHTFNMQU5HX0VOQUJMRV9JTlNUQUxMKQogICAgICAgICAgaW5zdGFsbChUQVJHRVRTIE1h
Y2hpbmVJbmRlcGVuZGVudCBFWFBPUlQgZ2xzbGFuZy10YXJnZXRzKQogICAgICAgICAgaW5zdGFs
bChUQVJHRVRTIEdlbmVyaWNDb2RlR2VuIEVYUE9SVCBnbHNsYW5nLXRhcmdldHMpCiAgICAgIGVu
ZGlmKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdf
MS4zLjI4My4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMu
MjkwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI5MC4wLmJiCmluZGV4IGI1OGJkMWU5NTYu
LmQ2ZWU0NmRlMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2ds
c2xhbmdfMS4zLjI4My4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2ds
c2xhbmdfMS4zLjI5MC4wLmJiCkBAIC04LDcgKzgsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3
dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVmZXJlbmNlLUNvbXBpbGVyIgogTElD
RU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2UgJiBNSVQgJiBBcGFjaGUtMi4wICYg
R1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2ZkYTQ1ZmU4MDdkYzMiCiAKLVNSQ1JF
ViA9ICJlOGRkMGI2OTAzYjM0ZjE4Nzk1MjBiNDQ0NjM0Yzc1ZWEyZGVlZGY1IgorU1JDUkVWID0g
ImZhOWMzZGViNDllMDM1YThhYmNhYmUzNjZmMjZhYWMwMTBmNmNiZmIiCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2Jy
YW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ct
Y29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi40NC4wCgo=

--===============1439141177487440051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.14.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.2.0 /usr/lib/.debug/libSPIRV.so.14.2.0 /usr/lib/.debug/libSPVRemapper.so.14.2.0", added "/usr/lib/.debug/libSPVRemapper.so.14.3.0 /usr/lib/.debug/libglslang.so.14.3.0 /usr/lib/.debug/libSPIRV.so.14.3.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.3.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 87402960 to 87547928 (+0%)
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 276866 to 277788 (+0%)
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4947955 to 4961305 (+0%)
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.14.2.0 /usr/lib/libglslang-default-resource-limits.so.14.2.0 /usr/lib/libglslang.so.14.2.0 /usr/lib/libSPIRV.so.14.2.0", added "/usr/lib/libSPIRV.so.14.3.0 /usr/lib/libglslang.so.14.3.0 /usr/lib/libSPVRemapper.so.14.3.0 /usr/lib/libglslang-default-resource-limits.so.14.3.0"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 6508697 to 6512793 (+0%)
packages/core2-64-poky-linux/glslang: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.2.0 to libglslang-default-resource-limits.so.14.3.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.2.0 to libglslang.so.14.3.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.2.0 to libSPIRV.so.14.3.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.2.0 to libSPVRemapper.so.14.3.0
  /usr/lib/libglslang-default-resource-limits.so.14.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.3.0
  /usr/lib/libglslang.so.14.2.0 moved to /usr/lib/libglslang.so.14.3.0
  /usr/lib/libSPIRV.so.14.2.0 moved to /usr/lib/libSPIRV.so.14.3.0
  /usr/lib/libSPVRemapper.so.14.2.0 moved to /usr/lib/libSPVRemapper.so.14.3.0

--===============1439141177487440051==--

