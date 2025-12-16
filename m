Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F01D5CC95
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17195.1765872154046813139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=u9PO3Hiv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PfwNcFZH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ebd5e-2cafc9d7-eedf-4ec3-aab9-4ac5d9710ddb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+sElZBfQRyyGEvLnPrPJQ/WHPfDJyG+cHpgh1clR7h8=;
	b=u9PO3Hiv6n75YddVsL2kUwQCEGxzhd1R1gua9boljg8NXnK2ex4VeO2in6ikqEHY
	5k+zTgnqaz7EhR/m8NTlziBQK2eUbkDVERUmmPGyxLXsDcUebhOFyECD2DhO7sOwCSH
	Q4kVLROFNA1G0gYLHItP+baTl+VJF1H+88zdP2/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+sElZBfQRyyGEvLnPrPJQ/WHPfDJyG+cHpgh1clR7h8=;
	b=PfwNcFZHEPUPQ5Ilp8O2rxrcahURXKOqTsEuSEEYg203k8AcK1WHUGOxbqLCsdpq
	jrGSxrbuB66+588ACWo9g2OCaEGJmtKYJCZ8HDgL4uDeaB4SIdaT5TusXzzF/D2W2n5
	4WgWfqYisSfiIJb3Jst8D+4siEG+zu0HGeohiM6M=
Content-Type: multipart/mixed; boundary="===============1670987202443856169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.7.9 SUCCEEDED
Message-ID: <0101019b262ebd5e-2cafc9d7-eedf-4ec3-aab9-4ac5d9710ddb-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227854

--===============1670987202443856169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysstat* to *12.7.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.7.8-12.7.9.patch
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
From 4ef165f9a8751fc53ee4b8fd4deeb41120d300a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 03:09:15 +0000
Subject: [PATCH] sysstat: upgrade 12.7.8 -> 12.7.9

---
 .../0001-configure.in-remove-check-for-chkconfig.patch     | 7 ++-----
 .../sysstat/{sysstat_12.7.8.bb => sysstat_12.7.9.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.8.bb => sysstat_12.7.9.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 84383f955f..431a60aee1 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
+From f41b0253d1583f7e1286fa2f29393c3d3f5183b4 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48b9a31..cedeb43 100644
+index 8b5f9b73..910ebd5a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
@@ -26,6 +26,3 @@ index 48b9a31..cedeb43 100644
  
  # Check for systemd
  AC_CHECK_PROG(PKG_CONFIG, pkg-config, pkg-config)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.8.bb b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.8.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.9.bb
index 2194dfc956..3a06078e0e 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "5841596edf7f5e53288cb56400e0c0c1da5f2415"
+SRCREV = "b8f987807e7c7ba5c1b2ca8b7b1e9d80e61bce6c"
 
 DEPENDS += "base-passwd"
 
-- 
2.47.1


--===============1670987202443856169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.7.8-12.7.9.patch"

RnJvbSA0ZWYxNjVmOWE4NzUxZmM1M2VlNGI4ZmQ0ZGVlYjQxMTIwZDMwMGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDM6MDk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNzdGF0OiB1cGdyYWRlIDEyLjcuOCAtPiAxMi43LjkKCi0tLQogLi4uLzAwMDEtY29uZmlndXJl
LmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29uZmlnLnBhdGNoICAgICB8IDcgKystLS0tLQogLi4u
L3N5c3N0YXQve3N5c3N0YXRfMTIuNy44LmJiID0+IHN5c3N0YXRfMTIuNy45LmJifSAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3tzeXNzdGF0XzEyLjcuOC5iYiA9
PiBzeXNzdGF0XzEyLjcuOS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3It
Y2hrY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdC8w
MDAxLWNvbmZpZ3VyZS5pbi1yZW1vdmUtY2hlY2stZm9yLWNoa2NvbmZpZy5wYXRjaAppbmRleCA4
NDM4M2Y5NTVmLi40MzFhNjBhZWUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3lzc3RhdC9zeXNzdGF0LzAwMDEtY29uZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29u
ZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXQvMDAw
MS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDE1OTBjYzYxNGFhZjBmYjgxY2Q4MDQ0MTRkNmM5ZDVhOTIyNzM1MmMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY0MWIwMjUzZDE1ODNmN2UxMjg2ZmEyZjI5Mzkz
YzNkM2Y1MTgzYjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXZW5saW4gS2FuZyA8
d2VubGluLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgNSBOb3YgMjAxOSAxNjoxNjo0
NCArMDgwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IHJlbW92ZSBjaGVjayBmb3Ig
Y2hrY29uZmlnCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFdlbmxpbiBLYW5nIDx3
ZW5saW4ua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYwotaW5kZXggNDhiOWEzMS4uY2VkZWI0MyAxMDA2NDQKK2luZGV4IDhiNWY5YjczLi45MTBl
YmQ1YSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
NDIsNyArNDIsOCBAQCBBQ19TVUJTVChWRVJfSlNPTikKQEAgLTI2LDYgKzI2LDMgQEAgaW5kZXgg
NDhiOWEzMS4uY2VkZWI0MyAxMDA2NDQKICAKICAjIENoZWNrIGZvciBzeXN0ZW1kCiAgQUNfQ0hF
Q0tfUFJPRyhQS0dfQ09ORklHLCBwa2ctY29uZmlnLCBwa2ctY29uZmlnKQotLS0gCi0xLjkuMQot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcu
OC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy45LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNz
dGF0L3N5c3N0YXRfMTIuNy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lz
c3RhdC9zeXNzdGF0XzEyLjcuOS5iYgppbmRleCAyMTk0ZGZjOTU2Li4zYTA2MDc4ZTBlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcuOC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcuOS5iYgpAQCAt
MTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3lzc3RhdC9zeXNzdGF0
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZwogCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hMjNhNzRiM2Y0Y2FmOTYxNjIzMDc4OWQ5NDIxN2FjYiIK
IAotU1JDUkVWID0gIjU4NDE1OTZlZGY3ZjVlNTMyODhjYjU2NDAwZTBjMGMxZGE1ZjI0MTUiCitT
UkNSRVYgPSAiYjhmOTg3ODA3ZTdjN2JhNWMxYjJjYThiN2IxZTlkODBlNjFiY2U2YyIKIAogREVQ
RU5EUyArPSAiYmFzZS1wYXNzd2QiCiAKLS0gCjIuNDcuMQoK

--===============1670987202443856169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sysstat: SRC_URI changed from "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag=v12.7.8 file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch" to "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag=v12.7.9 file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch"
packages/x86-64-v3-poky-linux/sysstat: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 2754408 to 2752904 (-0%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-dev: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 264544 to 265661 (+0%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-be: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-be: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ka: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ka: PKGSIZE changed from 21880 to 22727 (+4%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ka: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1973874 to 1973649 (-0%)
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat-src: FILELIST: directory renamed /usr/src/debug/sysstat/12.7.8 -> /usr/src/debug/sysstat/12.7.9
packages/x86-64-v3-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.7.8 [default] to 12.7.9 [default]
packages/x86-64-v3-poky-linux/sysstat/sysstat: PV changed from "12.7.8" to "12.7.9"
packages/x86-64-v3-poky-linux/sysstat/sysstat: PKGSIZE changed from 1053035 to 1050331 (-0%)
packages/x86-64-v3-poky-linux/sysstat/sysstat: PKGV changed from 12.7.8 [default] to 12.7.9 [default]

--===============1670987202443856169==--

