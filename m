Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B066FC3ABC0
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.20166.1744723971524445995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TIPXv/vI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CYshaI39;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019639a752ee-ff11b952-71e3-43e8-809b-96004c5883d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LJyuibYoJUZde/SWwfewKO0ARDRML4IhrPlSUmXChT8=;
	b=TIPXv/vIyKT0lDWi7L5nkDmCqqNtTGKdwLi1zK5FQUYbh4h/A+njPFZjNrh3XOOS
	AQLTsxiLYbtZcXsNWYqNB8m+MkMDO/CJGwft60B8pk+N0LtOlG0KelsvWxck8wzlH1E
	onyBCK25Tc58ARC4d6v/DPQ79EX/qxZb/sM3KCCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LJyuibYoJUZde/SWwfewKO0ARDRML4IhrPlSUmXChT8=;
	b=CYshaI39zMJorvtITNzw9MswVMhV+sE7+t9TcFQQoU1gcpGx4U7CM4VuOtQF/em7
	DEtI3W04wMknSLR/s0DQZFdE4ovNk6Tp/p3ro5oLX6FN8q2u+GKdslk5xIVs021LTZc
	dvQQ/fsAOcVxALnNis+2RyBVHt6Cx0eba2y9E5QM=
Content-Type: multipart/mixed; boundary="===============8858765235613220144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.1 SUCCEEDED
Message-ID: <0101019639a752ee-ff11b952-71e3-43e8-809b-96004c5883d7-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214922

--===============8858765235613220144==
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
From 48895c81b3d43710f78bc371f33dae54d52ce101 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 10:31:19 +0000
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
index d923437a2a..1d80f2aab5 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From 1b514ab2e878216426acc493eeab96088576faf9 Mon Sep 17 00:00:00 2001
+From b1a0fec4792147fcd5bbf869b592768de834293b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Mar 2025 18:10:08 -0700
 Subject: [PATCH] Make bt_field_blob_get_length return size_t instead of
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index c2b76b1ed5..16216811bc 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From bcd7c805fb4fe17e66f207ff937b6b1e76adc0b4 Mon Sep 17 00:00:00 2001
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
index 87f94fb087..9123dfb9da 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From 38ae4e62a1868010e0bda9d984a7f73da0961aee Mon Sep 17 00:00:00 2001
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
index 7ac7582ad7..687a1c126d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From 11693388fe6caf985132a1e62821b59cf99dfec4 Mon Sep 17 00:00:00 2001
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


--===============8858765235613220144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.0-2.1.1.patch"

RnJvbSA0ODg5NWM4MWIzZDQzNzEwZjc4YmMzNzFmMzNkYWU1NGQ1MmNlMTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTA6MzE6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YWJlbHRyYWNlMjogdXBncmFkZSAyLjEuMCAtPiAyLjEuMQoKLS0tCiAuLi5maWVsZF9ibG9iX2dl
dF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaCB8ICAyICstCiAuLi4vMDAwMS1N
YWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaCAgICAgICB8ICA2ICsrLS0tLQog
Li4uMDEtdGVzdHMtZml4LXRlc3QtYXBwbGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2ggfCAg
NSArLS0tLQogLi4uLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3Rvcnku
cGF0Y2ggfCAxMSArKysrLS0tLS0tLQogLi4uL3tiYWJlbHRyYWNlMl8yLjEuMC5iYiA9PiBiYWJl
bHRyYWNlMl8yLjEuMS5iYn0gICAgfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
e2JhYmVsdHJhY2UyXzIuMS4wLmJiID0+IGJhYmVsdHJhY2UyXzIuMS4xLmJifSAoOTklKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtl
LWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtYnRfZmllbGRf
YmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2gKaW5kZXggZDkyMzQz
N2EyYS4uMWQ4MGYyYWFiNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9i
YWJlbHRyYWNlMi8wMDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXpl
X3QtaW5zdGVhZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRy
YWNlMi8wMDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5z
dGVhZC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFiNTE0YWIyZTg3ODIxNjQyNmFjYzQ5
M2VlYWI5NjA4ODU3NmZhZjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIxYTBmZWM0
NzkyMTQ3ZmNkNWJiZjg2OWI1OTI3NjhkZTgzNDI5M2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBNYXIg
MjAyNSAxODoxMDowOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGJ0X2ZpZWxkX2Jsb2Jf
Z2V0X2xlbmd0aCByZXR1cm4gc2l6ZV90IGluc3RlYWQgb2YKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGli
LWlkZW50aWNhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIv
MDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaAppbmRleCBjMmI3NmIx
ZWQ1Li4xNjIxNjgxMWJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2Jh
YmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFn
ZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1Njk4NjE5
MGU0YjBjMTA5NDVjZTZhYWE3Y2ExMGQ2YmQ4YTI2YTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiY2Q3YzgwNWZiNGZlMTdlNjZmMjA3ZmY5MzdiNmIxZTc2YWRjMGI0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5j
b20+CiBEYXRlOiBNb24sIDkgTWFyIDIwMjAgMjE6MTA6MzUgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gTWFrZSBtYW5wYWdlcyBtdWx0aWxpYiBpZGVudGljYWwKQEAgLTE2LDcgKzE2LDcgQEAgaW5k
ZXggODhmYjEzY2UyLi4yNzg1OGI3MjAgMTAwNjQ0CiAtLS0gYS9kb2MvbWFuL2FzY2lpZG9jLWF0
dHJzLmNvbmYuaW4KICsrKyBiL2RvYy9tYW4vYXNjaWlkb2MtYXR0cnMuY29uZi5pbgogQEAgLTQs
OCArNCw4IEBACi0KKyAKICBbYXR0cmlidXRlc10KICAjIGRlZmF1bHQgdmFsdWVzCiAtc3lzdGVt
X3BsdWdpbl9wYXRoPSJATElCRElSQC9iYWJlbHRyYWNlMi9wbHVnaW5zIgpAQCAtMjYsNSArMjYs
MyBAQCBpbmRleCA4OGZiMTNjZTIuLjI3ODU4YjcyMCAxMDA2NDQKICBiYWJlbHRyYWNlX3ZlcnNp
b249IkBQQUNLQUdFX1ZFUlNJT05AIgogIGVuYWJsZV9kZWJ1Z19pbmZvPSJARU5BQkxFX0RFQlVH
X0lORk9fVkFMQCIKICBkZWZyZHBvcnQ9NTM0NAotLS0gCi0yLjM0LjEKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1maXgtdGVzdC1h
cHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNv
bW1vbi5wYXRjaAppbmRleCA4N2Y5NGZiMDg3Li45MTIzZGZiOWRhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3QtYXBw
bGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAt
Y29tbW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxZGM4MWYyNzI4NTVkOTRlNmE3OGY3
ZDEwZWE5NTI3NDVkOTkxYWE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOGFlNGU2
MmExODY4MDEwZTBiZGE5ZDk4NGE3ZjczZGEwOTYxYWVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQmluIExhbiA8YmluLmxhbi5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAx
MSBNYXIgMjAyNSAxNzoxOToxMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBUZXN0czogZml4IHRl
c3QgYXBwbGljYXRpb25zIGluIGNwcC1jb21tb24gYXJlIG5lZWRlZCB0bwpAQCAtMTI0LDYgKzEy
NCwzIEBAIGluZGV4IDAwMDAwMDAwMC4uOGM2NWRhYTk0CiArc291cmNlICIkVVRJTFNTSCIKICsK
ICsiJHtCVF9URVNUU19CVUlMRERJUn0vY3BwLWNvbW1vbi90ZXN0LXV1aWQiICIkQlRfVEVTVFNf
QlQyX0JJTiIKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVj
dG9yeS5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10
ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5wYXRjaAppbmRleCA3YWM3NTgy
YWQ3Li42ODdhMWMxMjZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2Jh
YmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3Rz
LXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBhdGNoCkBAIC0xLDExICsxLDExIEBA
Ci1Gcm9tIDMyNDk0YjE3MjZhODgxODgzY2I2ZDMxN2FiNzZkMWVjM2YxZmE3NDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDExNjkzMzg4ZmU2Y2FmOTg1MTMyYTFlNjI4MjFiNTljZjk5
ZGZlYzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCaW4gTGFuIDxiaW4ubGFuLmNu
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDUgTWFyIDIwMjUgMTA6NTE6MTEgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHNldCB0aGUgY29ycmVjdCBkaXJlY3Rvcnkgb2YgcGx1Z2lu
IHNoYXJlZCBsaWJyYXJ5CiAKLVRoZSBwbHVnaW4gc2hhcmVkIGxpYnJhcmllcyBhcmUgcHV0IGlu
IHRlc3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIHdoZW4gCi1idWlsZGluZyBpbiBhIGhvc3QuIHRl
c3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIGlzIG5vdCBleGlzdCB3aGVuIGNyb3NzIAotYnVpbGQu
IFRoZSBwbHVnaW4gc2hhcmVkIGxpYnJhcmllcyBhcmUgcHV0IGluIHRlc3QtcGx1Z2lucy1wbHVn
aW5zIAorVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5z
LXBsdWdpbnMvLmxpYnMgd2hlbgorYnVpbGRpbmcgaW4gYSBob3N0LiB0ZXN0LXBsdWdpbnMtcGx1
Z2lucy8ubGlicyBpcyBub3QgZXhpc3Qgd2hlbiBjcm9zcworYnVpbGQuIFRoZSBwbHVnaW4gc2hh
cmVkIGxpYnJhcmllcyBhcmUgcHV0IGluIHRlc3QtcGx1Z2lucy1wbHVnaW5zCiBkaXJlY3Rvcnkg
d2hlbiBjcm9zcyBidWlsZC4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBz
cGVjaWZpY10KQEAgLTI1LDYgKzI1LDMgQEAgaW5kZXggZjgzZTQyYmFhLi45MzkyMzYzOTMgMTAw
NzU1CiAgCiAtIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMiICIke0JUX1RF
U1RTX0JVSUxERElSfS9saWIvdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMiCiArIiR7QlRfVEVT
VFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMiICIke0JUX1RFU1RTX0JVSUxERElSfS9saWIv
dGVzdC1wbHVnaW5zLXBsdWdpbnMiCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4xLmJiCmlu
ZGV4IGE5YTNhOTk2MWIuLmZlY2M2MzlhOWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMl8yLjEuMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gImdp
dDovL2dpdC5lZmZpY2lvcy5jb20vYmFiZWx0cmFjZS5naXQ7YnJhbmNoPXN0YWJsZS0yLjE7cHJv
dG9jb2w9aHR0cAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3Qt
cGx1Z2luLWRpcmVjdG9yeS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtYnRf
ZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNSRVYgPSAiZTYxZDQxZmYzYzNhYzZhMTIzOTMwZDRlNjBjZjcxMGZmOWVh
MThlMCIKK1NSQ1JFViA9ICI3ZjJmOGNkNmRhYzQ5N2NiYjQ2NmVmYjMxMjE5YjUzMWM2MjAxM2Y1
IgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPjIoXC5cZCspKykkIgog
CiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Ny4xCgo=

--===============8858765235613220144==
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
workspace            = "tmp-auh-upgrades:07a040351c5ee4db1182feadeaf7d59ccb22aac7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 558 Local 547 Mirrors 0 Missed 11 Current 273 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 287 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 292 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 293 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 294 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 309 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 323 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 324 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 327 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 335 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 336 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 338 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 341 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 351 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 354 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 357 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 361 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 362 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 363 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 364 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 371 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 382 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 383 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 388 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 410 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 413 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 452 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/grep/3.11/temp/log.do_packagedata_setscene.2143835
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 463 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 469 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 475 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 515 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 540 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 560 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 645 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 658 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 662 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 682 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 716 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 757 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1137 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_recipe_qa)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_recipe_qa: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 774 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running task 1428 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1454 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe babeltrace2-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe babeltrace2-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 831 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
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
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace2-2.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2279 of 2279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2279 tasks of which 2255 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

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

--===============8858765235613220144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 75678832 to 75655264 (-0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424265 to 424839 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGSIZE changed from 8510067 to 8508348 (-0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.1.0 [default] to 2.1.1 [default]

--===============8858765235613220144==--

