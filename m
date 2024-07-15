Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E09CC54722
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:16 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1361.1721071146299283167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HxfHXUs0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WfROTygO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d5994c-dd9b0ed3-94a5-4b2e-879b-e9b8967b543c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=avaXDQ0VyvN2hGKkOWpu668RZbuetVrw4AMJYArjnOQ=;
	b=HxfHXUs0N6h/SOsZHpjdGiq4SYFOO95nbwGRc28Dr2bdYQ0yWr66Mc/my0F9jbeO
	ChWHWO/k8NdSgF+/TOzvkRVKaH+Pog5hoS0rHyCdcVSgcNsukKbw95EfNq52kAtQyHO
	6i/4K10vj0+XsrQoOmJCBh+hMAABDody1/xj2yjo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=avaXDQ0VyvN2hGKkOWpu668RZbuetVrw4AMJYArjnOQ=;
	b=WfROTygOzEgTLEGseMe2DSWqljbgeAEYiglyIPe1pjMvB50LnJJPpEnQ/3vryJNm
	eo5HKpL05JwlkLrk6dvnEBscfZ67f4yRwSF5i/0eMayhK1xDnwtR2y9aaolVuOTXze7
	kHs/8/vUr1yoCOtTGopZcFPu09ZcEyQvZxDELjzA=
Content-Type: multipart/mixed; boundary="===============8924151047878686650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.7.6 SUCCEEDED
Message-ID: <01010190b7d5994c-dd9b0ed3-94a5-4b2e-879b-e9b8967b543c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202008

--===============8924151047878686650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysstat* to *12.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.7.5-12.7.6.patch
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
From 09df27d21a7c4a43f05007ea297387e842460a2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 12:36:46 +0000
Subject: [PATCH] sysstat: upgrade 12.7.5 -> 12.7.6

---
 .../0001-configure.in-remove-check-for-chkconfig.patch     | 7 ++-----
 .../sysstat/{sysstat_12.7.5.bb => sysstat_12.7.6.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.5.bb => sysstat_12.7.6.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 84383f955f..8bd2a77e80 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
+From 722d518c561eb350f79f85f30a395d8ecf58c173 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48b9a31..cedeb43 100644
+index 22bd663d..29f96a07 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
@@ -26,6 +26,3 @@ index 48b9a31..cedeb43 100644
  
  # Check for systemd
  AC_CHECK_PROG(PKG_CONFIG, pkg-config, pkg-config)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb b/meta/recipes-extended/sysstat/sysstat_12.7.6.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.5.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.6.bb
index d598d5366f..ea94ebf0aa 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "2d7682f26f42cef9127b123e319349b330c4ab8f"
+SRCREV = "3e3ec9b2c69940503723e3c2ffc1965a8a3484e3"
 S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
-- 
2.44.0


--===============8924151047878686650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.7.5-12.7.6.patch"

RnJvbSAwOWRmMjdkMjFhN2M0YTQzZjA1MDA3ZWEyOTczODdlODQyNDYwYTJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTI6MzY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNzdGF0OiB1cGdyYWRlIDEyLjcuNSAtPiAxMi43LjYKCi0tLQogLi4uLzAwMDEtY29uZmlndXJl
LmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29uZmlnLnBhdGNoICAgICB8IDcgKystLS0tLQogLi4u
L3N5c3N0YXQve3N5c3N0YXRfMTIuNy41LmJiID0+IHN5c3N0YXRfMTIuNy42LmJifSAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3tzeXNzdGF0XzEyLjcuNS5iYiA9
PiBzeXNzdGF0XzEyLjcuNi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3It
Y2hrY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdC8w
MDAxLWNvbmZpZ3VyZS5pbi1yZW1vdmUtY2hlY2stZm9yLWNoa2NvbmZpZy5wYXRjaAppbmRleCA4
NDM4M2Y5NTVmLi44YmQyYTc3ZTgwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29u
ZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXQvMDAw
MS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDE1OTBjYzYxNGFhZjBmYjgxY2Q4MDQ0MTRkNmM5ZDVhOTIyNzM1MmMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcyMmQ1MThjNTYxZWIzNTBmNzlmODVmMzBhMzk1
ZDhlY2Y1OGMxNzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXZW5saW4gS2FuZyA8
d2VubGluLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgNSBOb3YgMjAxOSAxNjoxNjo0
NCArMDgwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IHJlbW92ZSBjaGVjayBmb3Ig
Y2hrY29uZmlnCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFdlbmxpbiBLYW5nIDx3
ZW5saW4ua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYwotaW5kZXggNDhiOWEzMS4uY2VkZWI0MyAxMDA2NDQKK2luZGV4IDIyYmQ2NjNkLi4yOWY5
NmEwNyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
NDIsNyArNDIsOCBAQCBBQ19TVUJTVChWRVJfSlNPTikKQEAgLTI2LDYgKzI2LDMgQEAgaW5kZXgg
NDhiOWEzMS4uY2VkZWI0MyAxMDA2NDQKICAKICAjIENoZWNrIGZvciBzeXN0ZW1kCiAgQUNfQ0hF
Q0tfUFJPRyhQS0dfQ09ORklHLCBwa2ctY29uZmlnLCBwa2ctY29uZmlnKQotLS0gCi0xLjkuMQot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcu
NS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy42LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNz
dGF0L3N5c3N0YXRfMTIuNy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lz
c3RhdC9zeXNzdGF0XzEyLjcuNi5iYgppbmRleCBkNTk4ZDUzNjZmLi5lYTk0ZWJmMGFhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcuNi5iYgpAQCAt
MTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3lzc3RhdC9zeXNzdGF0
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKIAogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9YTIzYTc0YjNmNGNhZjk2MTYyMzA3ODlkOTQyMTdhY2IiCiAK
LVNSQ1JFViA9ICIyZDc2ODJmMjZmNDJjZWY5MTI3YjEyM2UzMTkzNDliMzMwYzRhYjhmIgorU1JD
UkVWID0gIjNlM2VjOWIyYzY5OTQwNTAzNzIzZTNjMmZmYzE5NjVhOGEzNDg0ZTMiCiBTID0gIiR7
V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTICs9ICJiYXNlLXBhc3N3ZCIKLS0gCjIuNDQuMAoK

--===============8924151047878686650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PKGSIZE changed from 10966 to 15535 (+42%)

--===============8924151047878686650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysstat: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 2499680 to 2500888 (+0%)
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-dev: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 259534 to 261201 (+1%)
packages/core2-64-poky-linux/sysstat/sysstat-doc: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PKGSIZE changed from 18532 to 18499 (-0%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PKGSIZE changed from 15159 to 15176 (+0%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ka: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ka: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PKGSIZE changed from 10966 to 15535 (+42%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1912635 to 1922345 (+1%)
packages/core2-64-poky-linux/sysstat/sysstat-src: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-src: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.7.5 [default] to 12.7.6 [default]
packages/core2-64-poky-linux/sysstat/sysstat: PV changed from "12.7.5" to "12.7.6"
packages/core2-64-poky-linux/sysstat/sysstat: PKGV changed from 12.7.5 [default] to 12.7.6 [default]

--===============8924151047878686650==--

