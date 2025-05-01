Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBAAC5AE59
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1816.1746113628549843091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FHRUS1Ix;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ttIZbyuq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7ba4db-699f0b0c-0267-4b11-929e-916564b07b34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NekO2KyHD81Xe8KGmfXvrqkUqKxPPS1IOSxF//eGUhA=;
	b=FHRUS1IxysfS0HiKNQX4Hmg61vFSgPeZTB84z+6x4dtwU1uIgG135jquvGLByJi/
	ndrSz0pKINGBodCf0OzMEpDe/b0u2pqaIktZG3+pw3oRyGjBy/ITzvjG6FIzqPZHAiq
	D1Qlq3JBCOGCK2kGVAN0i5DAOe5NGaBIAdy0ogTE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NekO2KyHD81Xe8KGmfXvrqkUqKxPPS1IOSxF//eGUhA=;
	b=ttIZbyuquNBWHuXleNm6CTYfF6YaflSoPA4ztISgMf8/Efc7DOHUkBFGhmy8cYhI
	pSUyui6rt2dSucjnCl4Hw/qcr2kEtwk3DTC/7aEd+ydxSzcIigmS48lMPVtXvp3UZyp
	bHB+Tm7YBbvOb/scPHrJfRzwql68I79H6E/yNUeo=
Content-Type: multipart/mixed; boundary="===============5622989089262986062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.1 SUCCEEDED
Message-ID: <010101968c7ba4db-699f0b0c-0267-4b11-929e-916564b07b34-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215875

--===============5622989089262986062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *babeltrace2* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.1.0-2.1.1.patch
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
From 89807e87878275094673fc56a16acc7d3e69bd68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:17:09 +0000
Subject: [PATCH] babeltrace2: upgrade 2.1.0 -> 2.1.1

---
 ...field_blob_get_length-return-size_t-instead-.patch |  2 +-
 .../0001-Make-manpages-multilib-identical.patch       |  6 ++----
 ...01-tests-fix-test-applications-in-cpp-common.patch |  5 +----
 .../0001-tests-set-the-correct-plugin-directory.patch | 11 ++++-------
 .../{babeltrace2_2.1.0.bb => babeltrace2_2.1.1.bb}    |  2 +-
 5 files changed, 9 insertions(+), 17 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.1.0.bb => babeltrace2_2.1.1.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
index d923437a2a..601dd49782 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From 1b514ab2e878216426acc493eeab96088576faf9 Mon Sep 17 00:00:00 2001
+From c35176fb0e81cd64fae209b5227ff085c8be6c15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Mar 2025 18:10:08 -0700
 Subject: [PATCH] Make bt_field_blob_get_length return size_t instead of
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index c2b76b1ed5..d06607ea99 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From 7de42eb4599e6413c8858e06c777193f13c62699 Mon Sep 17 00:00:00 2001
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
index 87f94fb087..6498fcb7ed 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From 8534ec2fcf6e70a68c12fda00a450ab86cde2712 Mon Sep 17 00:00:00 2001
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
index 7ac7582ad7..56118f583a 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From b726ae139c21c8124748b69a40486c9bb8c96c5c Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index a9a3a9961b..fecc639a9e 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://0001-tests-set-the-correct-plugin-directory.patch \
            file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
            "
-SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
+SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============5622989089262986062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.0-2.1.1.patch"

RnJvbSA4OTgwN2U4Nzg3ODI3NTA5NDY3M2ZjNTZhMTZhY2M3ZDNlNjliZDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzoxNzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
YmVsdHJhY2UyOiB1cGdyYWRlIDIuMS4wIC0+IDIuMS4xCgotLS0KIC4uLmZpZWxkX2Jsb2JfZ2V0
X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAxLU1h
a2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoICAgICAgIHwgIDYgKystLS0tCiAu
Li4wMS10ZXN0cy1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaCB8ICA1
ICstLS0tCiAuLi4vMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5w
YXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4ve2JhYmVsdHJhY2UyXzIuMS4wLmJiID0+IGJhYmVs
dHJhY2UyXzIuMS4xLmJifSAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy97
YmFiZWx0cmFjZTJfMi4xLjAuYmIgPT4gYmFiZWx0cmFjZTJfMi4xLjEuYmJ9ICg5OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2Ut
YnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1idF9maWVsZF9i
bG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaAppbmRleCBkOTIzNDM3
YTJhLi42MDFkZDQ5NzgyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2Jh
YmVsdHJhY2UyLzAwMDEtTWFrZS1idF9maWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVf
dC1pbnN0ZWFkLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJh
Y2UyLzAwMDEtTWFrZS1idF9maWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0
ZWFkLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWI1MTRhYjJlODc4MjE2NDI2YWNjNDkz
ZWVhYjk2MDg4NTc2ZmFmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzM1MTc2ZmIw
ZTgxY2Q2NGZhZTIwOWI1MjI3ZmYwODVjOGJlNmMxNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIE1hciAy
MDI1IDE4OjEwOjA4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgYnRfZmllbGRfYmxvYl9n
ZXRfbGVuZ3RoIHJldHVybiBzaXplX3QgaW5zdGVhZCBvZgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWIt
aWRlbnRpY2FsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8w
MDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCmluZGV4IGMyYjc2YjFl
ZDUuLmQwNjYwN2VhOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFi
ZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5wYWdl
cy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2OTg2MTkw
ZTRiMGMxMDk0NWNlNmFhYTdjYTEwZDZiZDhhMjZhMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDdkZTQyZWI0NTk5ZTY0MTNjODg1OGUwNmM3NzcxOTNmMTNjNjI2OTkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNv
bT4KIERhdGU6IE1vbiwgOSBNYXIgMjAyMCAyMToxMDozNSArMDAwMAogU3ViamVjdDogW1BBVENI
XSBNYWtlIG1hbnBhZ2VzIG11bHRpbGliIGlkZW50aWNhbApAQCAtMTYsNyArMTYsNyBAQCBpbmRl
eCA4OGZiMTNjZTIuLjI3ODU4YjcyMCAxMDA2NDQKIC0tLSBhL2RvYy9tYW4vYXNjaWlkb2MtYXR0
cnMuY29uZi5pbgogKysrIGIvZG9jL21hbi9hc2NpaWRvYy1hdHRycy5jb25mLmluCiBAQCAtNCw4
ICs0LDggQEAKLQorIAogIFthdHRyaWJ1dGVzXQogICMgZGVmYXVsdCB2YWx1ZXMKIC1zeXN0ZW1f
cGx1Z2luX3BhdGg9IkBMSUJESVJAL2JhYmVsdHJhY2UyL3BsdWdpbnMiCkBAIC0yNiw1ICsyNiwz
IEBAIGluZGV4IDg4ZmIxM2NlMi4uMjc4NThiNzIwIDEwMDY0NAogIGJhYmVsdHJhY2VfdmVyc2lv
bj0iQFBBQ0tBR0VfVkVSU0lPTkAiCiAgZW5hYmxlX2RlYnVnX2luZm89IkBFTkFCTEVfREVCVUdf
SU5GT19WQUxAIgogIGRlZnJkcG9ydD01MzQ0Ci0tLSAKLTIuMzQuMQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWZpeC10ZXN0LWFw
cGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29t
bW9uLnBhdGNoCmluZGV4IDg3Zjk0ZmIwODcuLjY0OThmY2I3ZWQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1maXgtdGVzdC1hcHBs
aWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3QtYXBwbGljYXRpb25zLWluLWNwcC1j
b21tb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFkYzgxZjI3Mjg1NWQ5NGU2YTc4Zjdk
MTBlYTk1Mjc0NWQ5OTFhYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg1MzRlYzJm
Y2Y2ZTcwYTY4YzEyZmRhMDBhNDUwYWI4NmNkZTI3MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBCaW4gTGFuIDxiaW4ubGFuLmNuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEx
IE1hciAyMDI1IDE3OjE5OjExICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFRlc3RzOiBmaXggdGVz
dCBhcHBsaWNhdGlvbnMgaW4gY3BwLWNvbW1vbiBhcmUgbmVlZGVkIHRvCkBAIC0xMjQsNiArMTI0
LDMgQEAgaW5kZXggMDAwMDAwMDAwLi44YzY1ZGFhOTQKICtzb3VyY2UgIiRVVElMU1NIIgogKwog
KyIke0JUX1RFU1RTX0JVSUxERElSfS9jcHAtY29tbW9uL3Rlc3QtdXVpZCIgIiRCVF9URVNUU19C
VDJfQklOIgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0
b3J5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRl
c3RzLXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBhdGNoCmluZGV4IDdhYzc1ODJh
ZDcuLjU2MTE4ZjU4M2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFi
ZWx0cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMt
c2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2gKQEAgLTEsMTEgKzEsMTEgQEAK
LUZyb20gMzI0OTRiMTcyNmE4ODE4ODNjYjZkMzE3YWI3NmQxZWMzZjFmYTc0MCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjcyNmFlMTM5YzIxYzgxMjQ3NDhiNjlhNDA0ODZjOWJiOGM5
NmM1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJpbiBMYW4gPGJpbi5sYW4uY25A
d2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgNSBNYXIgMjAyNSAxMDo1MToxMSArMDgwMAogU3Vi
amVjdDogW1BBVENIXSB0ZXN0czogc2V0IHRoZSBjb3JyZWN0IGRpcmVjdG9yeSBvZiBwbHVnaW4g
c2hhcmVkIGxpYnJhcnkKIAotVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4g
dGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgd2hlbiAKLWJ1aWxkaW5nIGluIGEgaG9zdC4gdGVz
dC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgaXMgbm90IGV4aXN0IHdoZW4gY3Jvc3MgCi1idWlsZC4g
VGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5zLXBsdWdp
bnMgCitUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1dCBpbiB0ZXN0LXBsdWdpbnMt
cGx1Z2lucy8ubGlicyB3aGVuCitidWlsZGluZyBpbiBhIGhvc3QuIHRlc3QtcGx1Z2lucy1wbHVn
aW5zLy5saWJzIGlzIG5vdCBleGlzdCB3aGVuIGNyb3NzCitidWlsZC4gVGhlIHBsdWdpbiBzaGFy
ZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5zLXBsdWdpbnMKIGRpcmVjdG9yeSB3
aGVuIGNyb3NzIGJ1aWxkLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNw
ZWNpZmljXQpAQCAtMjUsNiArMjUsMyBAQCBpbmRleCBmODNlNDJiYWEuLjkzOTIzNjM5MyAxMDA3
NTUKICAKIC0iJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucyIgIiR7QlRfVEVT
VFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyIKICsiJHtCVF9URVNU
U19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucyIgIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi90
ZXN0LXBsdWdpbnMtcGx1Z2lucyIKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjAuYmIgYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjEuYmIKaW5k
ZXggYTlhM2E5OTYxYi4uZmVjYzYzOWE5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyXzIuMS4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0LmVmZmljaW9zLmNvbS9iYWJlbHRyYWNlLmdpdDticmFuY2g9c3RhYmxlLTIuMTtwcm90
b2NvbD1odHRwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1w
bHVnaW4tZGlyZWN0b3J5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS1idF9m
aWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaCBcCiAgICAg
ICAgICAgICIKLVNSQ1JFViA9ICJlNjFkNDFmZjNjM2FjNmExMjM5MzBkNGU2MGNmNzEwZmY5ZWEx
OGUwIgorU1JDUkVWID0gIjdmMmY4Y2Q2ZGFjNDk3Y2JiNDY2ZWZiMzEyMTliNTMxYzYyMDEzZjUi
CiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+MihcLlxkKykrKSQiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjQ3LjEKCg==

--===============5622989089262986062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f44e605ae80a131865097ee69a96ba0f428d2d9a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 556 Local 546 Mirrors 0 Missed 10 Current 275 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 277 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 298 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 301 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 311 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 323 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 329 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 333 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 334 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 335 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa_setscene)
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 355 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 357 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 365 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 371 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 376 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 382 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 386 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 387 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_populate_lic_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 389 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 404 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 405 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 408 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 409 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 428 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 435 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 448 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/grep/3.11/temp/log.do_packagedata_setscene.4147719
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 453 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 504 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 525 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 526 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 529 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 614 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 616 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 645 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 681 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 687 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 689 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 722 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 728 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 757 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 759 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1160 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_fetch)
NOTE: recipe babeltrace2-2.1.1-r0: task do_fetch: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1444 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1468 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_deploy_source_date_epoch unihash changed to 342c27fddc2f48986287963f9ee17dd1d81d386edfe333d7582d6edb7447dba3
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1900 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace2-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2077 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: Running task 2197 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_collect_spdx_deps)
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2264 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_configure)
NOTE: recipe babeltrace2-2.1.1-r0: task do_configure: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe babeltrace2-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2266 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_compile)
NOTE: recipe babeltrace2-2.1.1-r0: task do_compile: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe babeltrace2-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2268 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_install)
NOTE: recipe babeltrace2-2.1.1-r0: task do_install: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_install_ptest_base)
NOTE: recipe babeltrace2-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2270 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package)
NOTE: Running task 2271 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_populate_sysroot)
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_packagedata)
NOTE: recipe babeltrace2-2.1.1-r0: task do_packagedata: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2273 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_create_spdx)
NOTE: Running task 2274 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package_write_ipk)
NOTE: Running task 2275 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package_write_deb)
NOTE: Running task 2276 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package_write_rpm)
NOTE: Running task 2277 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package_qa)
NOTE: recipe babeltrace2-2.1.1-r0: task do_create_spdx: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_deb: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_qa: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2278 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_create_package_spdx)
NOTE: recipe babeltrace2-2.1.1-r0: task do_create_package_spdx: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_package_qa unihash changed to c8d8ae39d5e3ef6f2ed00a17839bf54b924f4777955266f0ca841c3be21f967a
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2279 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2279 tasks of which 2256 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.12-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: grep-3.11-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5622989089262986062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 75663776 to 75640208 (-0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424265 to 424839 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.1.0 [default] to 2.1.1 [default]

--===============5622989089262986062==--

