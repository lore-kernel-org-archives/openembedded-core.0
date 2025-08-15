Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2238ACA0EF2
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11406.1755263217886317834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T02S/ZXM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iYk8bs2o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add77d2b-fc1658b0-eaca-4862-a12e-a566bdf93e43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jywDui9JhdRSmPflvY8/qHHAZpwc+nM0lTLYuDlk/bw=;
	b=T02S/ZXMquyeEOVCTwCYUPH19qLtKOC7BO9CcEYy7NshSiRfSG5nTQPD3fRLDYgh
	APEcm11k9RVYnSvvg4amLzGx6JvyOEtubDm7FLUYKXgRmSdLUjVs7uVJ3JQWqU0SYVr
	s56KcHE7YmHD4N/IWjwsCJ94m3iSsJa1y2YWUVNk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jywDui9JhdRSmPflvY8/qHHAZpwc+nM0lTLYuDlk/bw=;
	b=iYk8bs2oOP+6OW3dAqKOHvgTDrbXQyluVI+Yh12sfIJ+oZzTpz71l1S2VSNK3Hau
	m6S4becEJJt1fWvrh0Vot5PPhn22iKsvwXHhXWndrfV5x8RUFST8odyeEGPIBy0rUrg
	XaggqJqQSISxyYLvhYDYHWY9DrbkatOoKViwBLfA=
Content-Type: multipart/mixed; boundary="===============1242895591159703829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.2 SUCCEEDED
Message-ID: <01010198add77d2b-fc1658b0-eaca-4862-a12e-a566bdf93e43-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221945

--===============1242895591159703829==
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
From bd23a258399966bfb8e82d2480d3224b81ab1b7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 11:50:21 +0000
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
index 4dffa7bfa5..4c69b7c279 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From a73cef80a0d4129f74ab2e160a15693235aad4d1 Mon Sep 17 00:00:00 2001
+From 5f10a2155bb02d7342c1f00f2ad68b07a081829b Mon Sep 17 00:00:00 2001
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
index c2b76b1ed5..6cf83500ca 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From ed6f73a5cb31f4eec0d5908e6bab12670ff5030e Mon Sep 17 00:00:00 2001
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
index 87f94fb087..fb38a7ac7f 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From d239087c06e73f557111523cde157df4e5220fb3 Mon Sep 17 00:00:00 2001
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
index 7ac7582ad7..8166e16720 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From 634d20f9e1ea41eda96e59dba5d15bb49528ea59 Mon Sep 17 00:00:00 2001
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


--===============1242895591159703829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2"

--===============1242895591159703829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 74502424 to 74504872 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424839 to 425589 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 25560786 to 25556820 (-0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/babeltrace2: SRC_URI changed from "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.1 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch" to "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.2 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch"

--===============1242895591159703829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.1-2.1.2.patch"

RnJvbSBiZDIzYTI1ODM5OTk2NmJmYjhlODJkMjQ4MGQzMjI0YjgxYWIxYjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTE6NTA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YWJlbHRyYWNlMjogdXBncmFkZSAyLjEuMSAtPiAyLjEuMgoKLS0tCiAuLi5maWVsZF9ibG9iX2dl
dF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaCB8ICA0ICsrLS0KIC4uLi8wMDAx
LU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoICAgICAgIHwgIDYgKystLS0t
CiAuLi4wMS10ZXN0cy1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaCB8
ICA1ICstLS0tCiAuLi4vMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9y
eS5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4ve2JhYmVsdHJhY2UyXzIuMS4xLmJiID0+IGJh
YmVsdHJhY2UyXzIuMS4yLmJifSAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcve2JhYmVsdHJhY2UyXzIuMS4xLmJiID0+IGJhYmVsdHJhY2UyXzIuMS4yLmJifSAoOTklKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1N
YWtlLWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtYnRfZmll
bGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2gKaW5kZXggNGRm
ZmE3YmZhNS4uNGM2OWI3YzI3OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1z
aXplX3QtaW5zdGVhZC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJl
bHRyYWNlMi8wMDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3Qt
aW5zdGVhZC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE3M2NlZjgwYTBkNDEyOWY3NGFi
MmUxNjBhMTU2OTMyMzVhYWQ0ZDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVmMTBh
MjE1NWJiMDJkNzM0MmMxZjAwZjJhZDY4YjA3YTA4MTgyOWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBN
YXIgMjAyNSAxODoxMDowOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBDYXN0IHJlc3VsdCBvZiBi
dF9maWVsZF9ibG9iX2dldF9sZW5ndGggdG8gc2l6ZV90IGluCkBAIC0yNCw3ICsyNCw3IEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY3Bw
LWNvbW1vbi9idDIvZmllbGQuaHBwIGIvc3JjL2NwcC1jb21tb24vYnQyL2ZpZWxkLmhwcAotaW5k
ZXggOGIyOTFmN2EuLjNhN2QzMGE0IDEwMDY0NAoraW5kZXggOGIyOTFmN2ExLi4zYTdkMzBhNGYg
MTAwNjQ0CiAtLS0gYS9zcmMvY3BwLWNvbW1vbi9idDIvZmllbGQuaHBwCiArKysgYi9zcmMvY3Bw
LWNvbW1vbi9idDIvZmllbGQuaHBwCiBAQCAtMTEzNiw3ICsxMTM2LDcgQEAgcHVibGljOgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2Ut
bWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBh
dGNoCmluZGV4IGMyYjc2YjFlZDUuLjZjZjgzNTAwY2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlk
ZW50aWNhbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2Uy
LzAwMDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDU2OTg2MTkwZTRiMGMxMDk0NWNlNmFhYTdjYTEwZDZiZDhhMjZhMzkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVkNmY3M2E1Y2IzMWY0ZWVjMGQ1OTA4ZTZiYWIxMjY3
MGZmNTAzMGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8
anB1aGxtYW5AbXZpc3RhLmNvbT4KIERhdGU6IE1vbiwgOSBNYXIgMjAyMCAyMToxMDozNSArMDAw
MAogU3ViamVjdDogW1BBVENIXSBNYWtlIG1hbnBhZ2VzIG11bHRpbGliIGlkZW50aWNhbApAQCAt
MTYsNyArMTYsNyBAQCBpbmRleCA4OGZiMTNjZTIuLjI3ODU4YjcyMCAxMDA2NDQKIC0tLSBhL2Rv
Yy9tYW4vYXNjaWlkb2MtYXR0cnMuY29uZi5pbgogKysrIGIvZG9jL21hbi9hc2NpaWRvYy1hdHRy
cy5jb25mLmluCiBAQCAtNCw4ICs0LDggQEAKLQorIAogIFthdHRyaWJ1dGVzXQogICMgZGVmYXVs
dCB2YWx1ZXMKIC1zeXN0ZW1fcGx1Z2luX3BhdGg9IkBMSUJESVJAL2JhYmVsdHJhY2UyL3BsdWdp
bnMiCkBAIC0yNiw1ICsyNiwzIEBAIGluZGV4IDg4ZmIxM2NlMi4uMjc4NThiNzIwIDEwMDY0NAog
IGJhYmVsdHJhY2VfdmVyc2lvbj0iQFBBQ0tBR0VfVkVSU0lPTkAiCiAgZW5hYmxlX2RlYnVnX2lu
Zm89IkBFTkFCTEVfREVCVUdfSU5GT19WQUxAIgogIGRlZnJkcG9ydD01MzQ0Ci0tLSAKLTIuMzQu
MQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAx
LXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWZpeC10ZXN0LWFwcGxp
Y2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoCmluZGV4IDg3Zjk0ZmIwODcuLmZiMzhhN2FjN2Yg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10
ZXN0cy1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3QtYXBw
bGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFkYzgx
ZjI3Mjg1NWQ5NGU2YTc4ZjdkMTBlYTk1Mjc0NWQ5OTFhYTkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGQyMzkwODdjMDZlNzNmNTU3MTExNTIzY2RlMTU3ZGY0ZTUyMjBmYjMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCaW4gTGFuIDxiaW4ubGFuLmNuQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUdWUsIDExIE1hciAyMDI1IDE3OjE5OjExICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIFRlc3RzOiBmaXggdGVzdCBhcHBsaWNhdGlvbnMgaW4gY3BwLWNvbW1vbiBhcmUgbmVlZGVk
IHRvCkBAIC0xMjQsNiArMTI0LDMgQEAgaW5kZXggMDAwMDAwMDAwLi44YzY1ZGFhOTQKICtzb3Vy
Y2UgIiRVVElMU1NIIgogKwogKyIke0JUX1RFU1RTX0JVSUxERElSfS9jcHAtY29tbW9uL3Rlc3Qt
dXVpZCIgIiRCVF9URVNUU19CVDJfQklOIgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29y
cmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9i
YWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBh
dGNoCmluZGV4IDdhYzc1ODJhZDcuLjgxNjZlMTY3MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1
Z2luLWRpcmVjdG9yeS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVs
dHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2gK
QEAgLTEsMTEgKzEsMTEgQEAKLUZyb20gMzI0OTRiMTcyNmE4ODE4ODNjYjZkMzE3YWI3NmQxZWMz
ZjFmYTc0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjM0ZDIwZjllMWVhNDFlZGE5
NmU1OWRiYTVkMTViYjQ5NTI4ZWE1OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJp
biBMYW4gPGJpbi5sYW4uY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgNSBNYXIgMjAyNSAx
MDo1MToxMSArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogc2V0IHRoZSBjb3JyZWN0IGRp
cmVjdG9yeSBvZiBwbHVnaW4gc2hhcmVkIGxpYnJhcnkKIAotVGhlIHBsdWdpbiBzaGFyZWQgbGli
cmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgd2hlbiAKLWJ1aWxk
aW5nIGluIGEgaG9zdC4gdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgaXMgbm90IGV4aXN0IHdo
ZW4gY3Jvc3MgCi1idWlsZC4gVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4g
dGVzdC1wbHVnaW5zLXBsdWdpbnMgCitUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1
dCBpbiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyB3aGVuCitidWlsZGluZyBpbiBhIGhvc3Qu
IHRlc3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIGlzIG5vdCBleGlzdCB3aGVuIGNyb3NzCitidWls
ZC4gVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5zLXBs
dWdpbnMKIGRpcmVjdG9yeSB3aGVuIGNyb3NzIGJ1aWxkLgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQpAQCAtMjUsNiArMjUsMyBAQCBpbmRleCBmODNlNDJi
YWEuLjkzOTIzNjM5MyAxMDA3NTUKICAKIC0iJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3Qt
cGx1Z2lucyIgIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMtcGx1Z2lucy8u
bGlicyIKICsiJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucyIgIiR7QlRfVEVT
VFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMtcGx1Z2lucyIKLS0tIAotMi4zNC4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjEuYmIg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0
cmFjZTJfMi4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0
cmFjZTJfMi4xLjIuYmIKaW5kZXggOGJhYjdmNjc3YS4uYTU2Njc2ZTg1NCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4yLmJiCkBAIC0xNCw3ICsxNCw3
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmVmZmljaW9zLmNvbS9iYWJlbHRyYWNlLmdpdDticmFu
Y2g9c3RhYmxlLTIuMTtwcm90b2NvbD1odHRwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3Rz
LXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtTWFrZS1idF9maWVsZF9ibG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0
ZWFkLS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI3ZjJmOGNkNmRhYzQ5N2NiYjQ2
NmVmYjMxMjE5YjUzMWM2MjAxM2Y1IgorU1JDUkVWID0gImQwZTk0NmE3MWZhZjVmMGMyZDdmMWZi
NWI5MmEzNjk5ODNlOWNmMTAiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2
ZXI+MihcLlxkKykrKSQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBwdGVzdCBweXRo
b24zdGFyZ2V0Y29uZmlnCi0tIAoyLjQ3LjEKCg==

--===============1242895591159703829==--

