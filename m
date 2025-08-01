Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB7CCA0EF8
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.88800.1754057267128198881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NGfUmUvZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LDK8sKQN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019865f62490-21852ff0-a04d-43ab-b646-85376afac4be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hPw7+HDdFxYKbeFrsp1IYFejqXybNiBeVOyuNWgsZ14=;
	b=NGfUmUvZHwK+XcXV5YA1WQR/YDjjdUkUaHQ6Gtwx/1YB0vHtnXmpjFBfeBE0rFJ5
	tDiCjt4SJM6KP0LDBooBwaczrh5sAU3OBTtQvGyM5UnmNr+aIrBzDwN8YdS+7TA4KEY
	f07dBGSHo+UFZuuGEFhsANv3vjuKPVp2+GZo6NKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hPw7+HDdFxYKbeFrsp1IYFejqXybNiBeVOyuNWgsZ14=;
	b=LDK8sKQN0aIuxuznKZjqLciWGviLRwYIDyFb4JymGJm8vKClYjdrzZNoQ1B9tQ0W
	i2XBDBPAatoG82TTO76WS+gHQVVtWkbEhav6PIogu1e+Hsr+y/WfJoxbbfJT0jG00u9
	QRZLchK6qsgu3Q3ELFOuMgKSAk3PHANyxl84QPxE=
Content-Type: multipart/mixed; boundary="===============6635158919615260508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.2 SUCCEEDED
Message-ID: <0101019865f62490-21852ff0-a04d-43ab-b646-85376afac4be-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221323

--===============6635158919615260508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *babeltrace2* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.1.1-2.1.2.patch
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
From f604f502e38e9c57cf554062a71ef16712a9b027 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 12:19:02 +0000
Subject: [PATCH] babeltrace2: upgrade 2.1.1 -> 2.1.2

---
 ...field_blob_get_length-return-size_t-instead-.patch |  4 ++--
 .../0001-Make-manpages-multilib-identical.patch       |  6 ++----
 ...01-tests-fix-test-applications-in-cpp-common.patch |  5 +----
 .../0001-tests-set-the-correct-plugin-directory.patch | 11 ++++-------
 .../{babeltrace2_2.1.1.bb => babeltrace2_2.1.2.bb}    |  2 +-
 5 files changed, 10 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.1.1.bb => babeltrace2_2.1.2.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
index 4dffa7bfa5..286cd58836 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From a73cef80a0d4129f74ab2e160a15693235aad4d1 Mon Sep 17 00:00:00 2001
+From a23ec3754802d5793edd73cefab94fccb6e9a7be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Mar 2025 18:10:08 -0700
 Subject: [PATCH] Cast result of bt_field_blob_get_length to size_t in
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cpp-common/bt2/field.hpp b/src/cpp-common/bt2/field.hpp
-index 8b291f7a..3a7d30a4 100644
+index 8b291f7a1..3a7d30a4f 100644
 --- a/src/cpp-common/bt2/field.hpp
 +++ b/src/cpp-common/bt2/field.hpp
 @@ -1136,7 +1136,7 @@ public:
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index c2b76b1ed5..41e1ad7f0a 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From 5b8ed38da0500c5f1eed8a32ed9a15e64c539f13 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Mon, 9 Mar 2020 21:10:35 +0000
 Subject: [PATCH] Make manpages multilib identical
@@ -16,7 +16,7 @@ index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
 @@ -4,8 +4,8 @@
-
+ 
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -26,5 +26,3 @@ index 88fb13ce2..27858b720 100644
  babeltrace_version="@PACKAGE_VERSION@"
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
--- 
-2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
index 87f94fb087..14677d42ff 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From dbf89e24b7e4ce977bb8ced38c36e5fdd311efbe Mon Sep 17 00:00:00 2001
 From: Bin Lan <bin.lan.cn@windriver.com>
 Date: Tue, 11 Mar 2025 17:19:11 +0800
 Subject: [PATCH] Tests: fix test applications in cpp-common are needed to
@@ -124,6 +124,3 @@ index 000000000..8c65daa94
 +source "$UTILSSH"
 +
 +"${BT_TESTS_BUILDDIR}/cpp-common/test-uuid" "$BT_TESTS_BT2_BIN"
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
index 7ac7582ad7..09ceb4fb99 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From e5edaa197903a4c1b87fcacd87ecc85497106387 Mon Sep 17 00:00:00 2001
 From: Bin Lan <bin.lan.cn@windriver.com>
 Date: Wed, 5 Mar 2025 10:51:11 +0800
 Subject: [PATCH] tests: set the correct directory of plugin shared library
 
-The plugin shared libraries are put in test-plugins-plugins/.libs when 
-building in a host. test-plugins-plugins/.libs is not exist when cross 
-build. The plugin shared libraries are put in test-plugins-plugins 
+The plugin shared libraries are put in test-plugins-plugins/.libs when
+building in a host. test-plugins-plugins/.libs is not exist when cross
+build. The plugin shared libraries are put in test-plugins-plugins
 directory when cross build.
 
 Upstream-Status: Inappropriate [oe specific]
@@ -25,6 +25,3 @@ index f83e42baa..939236393 100755
  
 -"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
 +"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index 8bab7f677a..a56676e854 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://0001-tests-set-the-correct-plugin-directory.patch \
            file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
            "
-SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
+SRCREV = "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 inherit autotools pkgconfig ptest python3targetconfig
-- 
2.47.1


--===============6635158919615260508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.1-2.1.2.patch"

RnJvbSBmNjA0ZjUwMmUzOGU5YzU3Y2Y1NTQwNjJhNzFlZjE2NzEyYTliMDI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMjoxOTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
YmVsdHJhY2UyOiB1cGdyYWRlIDIuMS4xIC0+IDIuMS4yCgotLS0KIC4uLmZpZWxkX2Jsb2JfZ2V0
X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNoIHwgIDQgKystLQogLi4uLzAwMDEt
TWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2ggICAgICAgfCAgNiArKy0tLS0K
IC4uLjAxLXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoIHwg
IDUgKy0tLS0KIC4uLi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5
LnBhdGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLi97YmFiZWx0cmFjZTJfMi4xLjEuYmIgPT4gYmFi
ZWx0cmFjZTJfMi4xLjIuYmJ9ICAgIHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy97YmFiZWx0cmFjZTJfMi4xLjEuYmIgPT4gYmFiZWx0cmFjZTJfMi4xLjIuYmJ9ICg5OSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1h
a2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1idF9maWVs
ZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaAppbmRleCA0ZGZm
YTdiZmE1Li4yODZjZDU4ODM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1idF9maWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNp
emVfdC1pbnN0ZWFkLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVs
dHJhY2UyLzAwMDEtTWFrZS1idF9maWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1p
bnN0ZWFkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTczY2VmODBhMGQ0MTI5Zjc0YWIy
ZTE2MGExNTY5MzIzNWFhZDRkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTIzZWMz
NzU0ODAyZDU3OTNlZGQ3M2NlZmFiOTRmY2NiNmU5YTdiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIE1h
ciAyMDI1IDE4OjEwOjA4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIENhc3QgcmVzdWx0IG9mIGJ0
X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aCB0byBzaXplX3QgaW4KQEAgLTI0LDcgKzI0LDcgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jcHAt
Y29tbW9uL2J0Mi9maWVsZC5ocHAgYi9zcmMvY3BwLWNvbW1vbi9idDIvZmllbGQuaHBwCi1pbmRl
eCA4YjI5MWY3YS4uM2E3ZDMwYTQgMTAwNjQ0CitpbmRleCA4YjI5MWY3YTEuLjNhN2QzMGE0ZiAx
MDA2NDQKIC0tLSBhL3NyYy9jcHAtY29tbW9uL2J0Mi9maWVsZC5ocHAKICsrKyBiL3NyYy9jcHAt
Y29tbW9uL2J0Mi9maWVsZC5ocHAKIEBAIC0xMTM2LDcgKzExMzYsNyBAQCBwdWJsaWM6CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1t
YW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0
Y2gKaW5kZXggYzJiNzZiMWVkNS4uNDFlMWFkN2YwYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRl
bnRpY2FsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIv
MDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNTY5ODYxOTBlNGIwYzEwOTQ1Y2U2YWFhN2NhMTBkNmJkOGEyNmEzOSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWI4ZWQzOGRhMDUwMGM1ZjFlZWQ4YTMyZWQ5YTE1ZTY0
YzUzOWYxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhsbWFuIDxq
cHVobG1hbkBtdmlzdGEuY29tPgogRGF0ZTogTW9uLCA5IE1hciAyMDIwIDIxOjEwOjM1ICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgbWFucGFnZXMgbXVsdGlsaWIgaWRlbnRpY2FsCkBAIC0x
Niw3ICsxNiw3IEBAIGluZGV4IDg4ZmIxM2NlMi4uMjc4NThiNzIwIDEwMDY0NAogLS0tIGEvZG9j
L21hbi9hc2NpaWRvYy1hdHRycy5jb25mLmluCiArKysgYi9kb2MvbWFuL2FzY2lpZG9jLWF0dHJz
LmNvbmYuaW4KIEBAIC00LDggKzQsOCBAQAotCisgCiAgW2F0dHJpYnV0ZXNdCiAgIyBkZWZhdWx0
IHZhbHVlcwogLXN5c3RlbV9wbHVnaW5fcGF0aD0iQExJQkRJUkAvYmFiZWx0cmFjZTIvcGx1Z2lu
cyIKQEAgLTI2LDUgKzI2LDMgQEAgaW5kZXggODhmYjEzY2UyLi4yNzg1OGI3MjAgMTAwNjQ0CiAg
YmFiZWx0cmFjZV92ZXJzaW9uPSJAUEFDS0FHRV9WRVJTSU9OQCIKICBlbmFibGVfZGVidWdfaW5m
bz0iQEVOQUJMRV9ERUJVR19JTkZPX1ZBTEAiCiAgZGVmcmRwb3J0PTUzNDQKLS0tIAotMi4zNC4x
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEt
dGVzdHMtZml4LXRlc3QtYXBwbGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3QtYXBwbGlj
YXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2gKaW5kZXggODdmOTRmYjA4Ny4uMTQ2NzdkNDJmZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRl
c3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1maXgtdGVzdC1hcHBs
aWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWRjODFm
MjcyODU1ZDk0ZTZhNzhmN2QxMGVhOTUyNzQ1ZDk5MWFhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZGJmODllMjRiN2U0Y2U5NzdiYjhjZWQzOGMzNmU1ZmRkMzExZWZiZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJpbiBMYW4gPGJpbi5sYW4uY25Ad2luZHJpdmVyLmNv
bT4KIERhdGU6IFR1ZSwgMTEgTWFyIDIwMjUgMTc6MTk6MTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gVGVzdHM6IGZpeCB0ZXN0IGFwcGxpY2F0aW9ucyBpbiBjcHAtY29tbW9uIGFyZSBuZWVkZWQg
dG8KQEAgLTEyNCw2ICsxMjQsMyBAQCBpbmRleCAwMDAwMDAwMDAuLjhjNjVkYWE5NAogK3NvdXJj
ZSAiJFVUSUxTU0giCiArCiArIiR7QlRfVEVTVFNfQlVJTERESVJ9L2NwcC1jb21tb24vdGVzdC11
dWlkIiAiJEJUX1RFU1RTX0JUMl9CSU4iCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3Jy
ZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2Jh
YmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0
Y2gKaW5kZXggN2FjNzU4MmFkNy4uMDljZWI0ZmI5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1wbHVn
aW4tZGlyZWN0b3J5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0
cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5wYXRjaApA
QCAtMSwxMSArMSwxMSBAQAotRnJvbSAzMjQ5NGIxNzI2YTg4MTg4M2NiNmQzMTdhYjc2ZDFlYzNm
MWZhNzQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNWVkYWExOTc5MDNhNGMxYjg3
ZmNhY2Q4N2VjYzg1NDk3MTA2Mzg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQmlu
IExhbiA8YmluLmxhbi5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA1IE1hciAyMDI1IDEw
OjUxOjExICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBzZXQgdGhlIGNvcnJlY3QgZGly
ZWN0b3J5IG9mIHBsdWdpbiBzaGFyZWQgbGlicmFyeQogCi1UaGUgcGx1Z2luIHNoYXJlZCBsaWJy
YXJpZXMgYXJlIHB1dCBpbiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyB3aGVuIAotYnVpbGRp
bmcgaW4gYSBob3N0LiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyBpcyBub3QgZXhpc3Qgd2hl
biBjcm9zcyAKLWJ1aWxkLiBUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1dCBpbiB0
ZXN0LXBsdWdpbnMtcGx1Z2lucyAKK1RoZSBwbHVnaW4gc2hhcmVkIGxpYnJhcmllcyBhcmUgcHV0
IGluIHRlc3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIHdoZW4KK2J1aWxkaW5nIGluIGEgaG9zdC4g
dGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgaXMgbm90IGV4aXN0IHdoZW4gY3Jvc3MKK2J1aWxk
LiBUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1dCBpbiB0ZXN0LXBsdWdpbnMtcGx1
Z2lucwogZGlyZWN0b3J5IHdoZW4gY3Jvc3MgYnVpbGQuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCkBAIC0yNSw2ICsyNSwzIEBAIGluZGV4IGY4M2U0MmJh
YS4uOTM5MjM2MzkzIDEwMDc1NQogIAogLSIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvdGVzdC1w
bHVnaW5zIiAiJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucy1wbHVnaW5zLy5s
aWJzIgogKyIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvdGVzdC1wbHVnaW5zIiAiJHtCVF9URVNU
U19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucy1wbHVnaW5zIgotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMS5iYiBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRy
YWNlMl8yLjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRy
YWNlMl8yLjEuMi5iYgppbmRleCA4YmFiN2Y2NzdhLi5hNTY2NzZlODU0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjIuYmIKQEAgLTE0LDcgKzE0LDcg
QEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQuZWZmaWNpb3MuY29tL2JhYmVsdHJhY2UuZ2l0O2JyYW5j
aD1zdGFibGUtMi4xO3Byb3RvY29sPWh0dHAKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMt
c2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1NYWtlLWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3Rl
YWQtLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjdmMmY4Y2Q2ZGFjNDk3Y2JiNDY2
ZWZiMzEyMTliNTMxYzYyMDEzZjUiCitTUkNSRVYgPSAiZDBlOTQ2YTcxZmFmNWYwYzJkN2YxZmI1
YjkyYTM2OTk4M2U5Y2YxMCIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZl
cj4yKFwuXGQrKSspJCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHB0ZXN0IHB5dGhv
bjN0YXJnZXRjb25maWcKLS0gCjIuNDcuMQoK

--===============6635158919615260508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 74488256 to 74490696 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424839 to 425589 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 25560786 to 25556820 (-0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2: SRC_URI changed from "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.1 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch" to "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.2 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch"

--===============6635158919615260508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata"

--===============6635158919615260508==--

