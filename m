Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99155CAC585
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.89817.1756850203853434954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=r/VeLOvk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IVS84blY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101990c6eaaae-287f19a4-67ba-4ad1-b5a6-be391cd147af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JrA0/ZyzknVgldTdZ6J320G90i6oZLjOPJQC9qRNvAk=;
	b=r/VeLOvkZelhlTTZS0PQyZreiKU1TGWbhqmkMlYzZm6mwKuAIDLrX/+Tvms5mFuY
	Wf5wd2LJtFp9S73dOF9uyNW06HrNCc50kiqQRmNJZkOqkisJ6kK+cC3JvhUTTVGEARm
	QL7PGQWz8oabyjqtmI6aeSdAUrWCV/CJpJVwkzwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JrA0/ZyzknVgldTdZ6J320G90i6oZLjOPJQC9qRNvAk=;
	b=IVS84blYQkeBZdJ5i4zbYdwE3GxTA89wavLS2aZERg8E6F57hAQPfeYz7IdJEezr
	7Wu6NJcX+aan7CuQqe3bNxRl2I0OqTIpnHNOoK+tqoPE5vETISMXRccTr+dYCgJVvZP
	7kAJih20BROrINbNapGe9xBfhSbovFUzMJWNVUAk=
Content-Type: multipart/mixed; boundary="===============6816210300531571599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.0.6 SUCCEEDED
Message-ID: <010101990c6eaaae-287f19a4-67ba-4ad1-b5a6-be391cd147af-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222825

--===============6816210300531571599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.0.5-1.0.6.patch
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
From 4694e24b1490c3af6f75ac0906743dfddaaf70ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:12:47 +0000
Subject: [PATCH] appstream: upgrade 1.0.5 -> 1.0.6

---
 .../appstream/appstream/0001-remove-hardcoded-path.patch      | 4 ++--
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch      | 2 +-
 ...Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb}      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 03ac5eb05b..b85c4fd01b 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 7372848f22d7edc01e40b0533047b34f41f6cf71 Mon Sep 17 00:00:00 2001
+From 03e13b308c7a7931035fd8587c946a3e1ba49afb Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 7e89ab0..c34ea74 100644
+index ee5b179..8a06e75 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -194,10 +194,10 @@ endif
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 71c9aadbc9..52e605bbd1 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 43afdff090c4cbb2d3b4025a38b25a718c8f16b5 Mon Sep 17 00:00:00 2001
+From bb34e3be24466c7a56b8f55c57348c6ffd8966bf Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index e522a92e14..197b58c7f4 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From c36b6226479a20ebd910f355deddb9d5c7571213 Mon Sep 17 00:00:00 2001
+From c9c6f276653c0a172fce671219b9faf791212e1e Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f2..5ab2d0ec 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.0.5.bb b/meta/recipes-support/appstream/appstream_1.0.6.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.5.bb
rename to meta/recipes-support/appstream/appstream_1.0.6.bb
index bb293f76e2..62761380f5 100644
--- a/meta/recipes-support/appstream/appstream_1.0.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.6.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "ce0ed29e89abd5f0cf790ea87d792f1967c3413060beb30e63a979578d975121"
+SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============6816210300531571599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.0.5-1.0.6.patch"

RnJvbSA0Njk0ZTI0YjE0OTBjM2FmNmY3NWFjMDkwNjc0M2RmZGRhYWY3MGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMToxMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cHN0cmVhbTogdXBncmFkZSAxLjAuNSAtPiAxLjAuNgoKLS0tCiAuLi4vYXBwc3RyZWFtL2FwcHN0
cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaCAgICAgIHwgNCArKy0tCiAuLi4v
YXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCAgICAg
IHwgMiArLQogLi4uRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1R
dENvbmZpZy5wYXRjaCB8IDQgKystLQogLi4uL2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMC41LmJi
ID0+IGFwcHN0cmVhbV8xLjAuNi5iYn0gICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMC41LmJiID0+IGFwcHN0cmVhbV8xLjAuNi5iYn0gKDk0
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFt
LzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaAppbmRl
eCAwM2FjNWViMDViLi5iODVjNGZkMDFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUt
aGFyZGNvZGVkLXBhdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDczNzI4NDhmMjJkN2Vk
YzAxZTQwYjA1MzMwNDdiMzRmNDFmNmNmNzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDAzZTEzYjMwOGM3YTc5MzEwMzVmZDg1ODdjOTQ2YTNlMWJhNDlhZmIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBN
b24sIDEyIERlYyAyMDIyIDE1OjQyOjQyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBo
YXJkY29kZWQgcGF0aApAQCAtMTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW29lLXNwZWNpZmljXQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCA3ZTg5YWIwLi5jMzRlYTc0IDEwMDY0NAoraW5kZXggZWU1YjE3OS4uOGEwNmU3NSAxMDA2
NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTE5NCwxMCArMTk0
LDEwIEBAIGVuZGlmCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0v
YXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5w
YXRjaAppbmRleCA3MWM5YWFkYmM5Li41MmU2MDViYmQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAw
Mi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQzYWZk
ZmYwOTBjNGNiYjJkM2I0MDI1YTM4YjI1YTcxOGM4ZjE2YjUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGJiMzRlM2JlMjQ0NjZjN2E1NmI4ZjU1YzU3MzQ4YzZmZmQ4OTY2YmYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJjIEZlcmxhbmQgPG1hcmMuZmVybGFuZEBzb25h
dGVzdC5jb20+CiBEYXRlOiBGcmksIDI2IEp1bCAyMDI0IDE1OjQxOjAwIC0wNDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBidWlsZCBxdC90ZXN0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVIt
aW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1j
bWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaAppbmRleCBlNTIyYTkyZTE0Li4xOTdiNThjN2Y0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAw
MDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMt
Rml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzM2YjYyMjY0NzlhMjBlYmQ5MTBmMzU1ZGVkZGI5ZDVj
NzU3MTIxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzljNmYyNzY2NTNjMGExNzJm
Y2U2NzEyMTliOWZhZjc5MTIxMmUxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1h
cmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNvbmF0ZXN0LmNvbT4KIERhdGU6IE1vbiwgMjkgSnVs
IDIwMjQgMDk6MzU6NTEgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IFBBQ0tBR0VfUFJFRklY
X0RJUiBpbiBxdC9jbWFrZS9BcHBTdHJlYW1RdENvbmZpZy5jbWFrZS5pbgpAQCAtMzksNyArMzks
NyBAQCBTaWduZWQtb2ZmLWJ5OiBNYXJjIEZlcmxhbmQgPG1hcmMuZmVybGFuZEBzb25hdGVzdC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9xdC9jbWFrZS9BcHBTdHJlYW1RdENvbmZpZy5jbWFrZS5pbiBiL3F0L2NtYWtl
L0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCi1pbmRleCA2M2RmNjVmMi4uNWFiMmQwZWMgMTAw
NjQ0CitpbmRleCA2M2RmNjVmLi41YWIyZDBlIDEwMDY0NAogLS0tIGEvcXQvY21ha2UvQXBwU3Ry
ZWFtUXRDb25maWcuY21ha2UuaW4KICsrKyBiL3F0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNt
YWtlLmluCiBAQCAtMSw1ICsxLDUgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBz
dHJlYW0vYXBwc3RyZWFtXzEuMC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjYuYmIKaW5k
ZXggYmIyOTNmNzZlMi4uNjI3NjEzODBmNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC42LmJiCkBAIC0zMCw3ICszMCw3IEBAIFNSQ19VUkkg
PSAiIFwKIAlmaWxlOi8vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggXAogCWZpbGU6
Ly8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25m
aWcucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNlMGVkMjllODlhYmQ1ZjBjZjc5
MGVhODdkNzkyZjE5NjdjMzQxMzA2MGJlYjMwZTYzYTk3OTU3OGQ5NzUxMjEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZGI0NDM5ZGI2YTMzZGUzY2ExMDQxNDczNTAxNjEwODQ0ZGRmMWI3MmFlMjMw
MTZjMDUyNDJjNjgxYzM4MGI0ZCIKIAogUyA9ICIke1VOUEFDS0RJUn0vQXBwU3RyZWFtLSR7UFZ9
IgogCi0tIAoyLjQ3LjEKCg==

--===============6816210300531571599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.0.5", added "/usr/lib/.debug/libappstream.so.1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2433552 to 2433736 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGSIZE changed from 107632 to 108634 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGSIZE changed from 116880 to 117987 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGSIZE changed from 19246 to 39586 (+106%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGSIZE changed from 100489 to 121348 (+21%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGSIZE changed from 97682 to 98020 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGSIZE changed from 111318 to 112348 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGSIZE changed from 71938 to 72809 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 117575 to 117577 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 115448 to 116621 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGSIZE changed from 111804 to 112801 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGSIZE changed from 199157 to 199217 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGSIZE changed from 114034 to 115169 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 153898 to 153665 (-0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGSIZE changed from 102644 to 103553 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-src: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGSIZE changed from 98949 to 99147 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.5", added "/usr/lib/libappstream.so.1.0.6"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGSIZE changed from 1045213 to 1047826 (+0%)
packages/x86-64-v3-poky-linux/appstream: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/appstream: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.5.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.6.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-th"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.5 to libappstream.so.1.0.6
  /usr/lib/libappstream.so.1.0.5 moved to /usr/lib/libappstream.so.1.0.6
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.5 to libappstream.so.1.0.6
  /usr/lib/libappstream.so.1.0.5 moved to /usr/lib/libappstream.so.1.0.6

--===============6816210300531571599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGSIZE changed from 19246 to 39586 (+106%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGSIZE changed from 100489 to 121348 (+21%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.5", added "/usr/lib/libappstream.so.1.0.6"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-th"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.5 to libappstream.so.1.0.6
  /usr/lib/libappstream.so.1.0.5 moved to /usr/lib/libappstream.so.1.0.6
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.5 to libappstream.so.1.0.6
  /usr/lib/libappstream.so.1.0.5 moved to /usr/lib/libappstream.so.1.0.6

--===============6816210300531571599==--

