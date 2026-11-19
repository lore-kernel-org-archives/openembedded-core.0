Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9339.1795068809918775847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 22:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=seXGaUlV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=puAncY6v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1f2704ef7-c6e2b39c-c6c2-42e3-b7a9-14a6b7e31c63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795068809;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NE2pjTSfssBYIiDTzDgOnjSNyiUTVYpxgOp9Uws5J1Q=;
	b=seXGaUlV97MbyKmcCO84MfSlTVfdK/gDZgOzrq6M/bgzGZQIWIvO0O4ZQKV3KYvJ
	3Amb2hEhFJokQ0/coBFPTwv441BwxN7+q4Asj9G9/XsYPDO1H8hEmFXz/QMWPunEPlp
	4wdRfOjsv3R9p0yzNHbRS1De5yE4Dtp+D2ivb5LY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795068809;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NE2pjTSfssBYIiDTzDgOnjSNyiUTVYpxgOp9Uws5J1Q=;
	b=puAncY6vO4+YET5dX1KrTWG3UXP63rMp1pDOeUZxnH1/UwsNrdgiDLqOeyRAv9uB
	kXpa/5QgicTlRgjr4XCuNrY0SDSSVVxfdyaF72RbMIeI9pWry5rhLBZ8HC3tKoxaj2J
	vpbCYteuW5U850lU21i3Wkkf2ZnuCvg865njwqbQ=
Content-Type: multipart/mixed; boundary="===============3712047847951435569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.10 SUCCEEDED
Message-ID: <010101a1f2704ef7-c6e2b39c-c6c2-42e3-b7a9-14a6b7e31c63-000000@us-west-2.amazonses.com>
Date: Thu, 19 Nov 2026 06:13:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250646

--===============3712047847951435569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.9-4.0.10.patch
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
From 417be9dd953cc257067040d6a30d20edc913cccb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 19 Nov 2026 05:26:00 +0000
Subject: [PATCH] ruby: upgrade 4.0.9 -> 4.0.10

---
 ...Avoid-build-time-race-condition-when-cross-compiling.patch | 2 +-
 .../0001-Don-t-save-the-original-name-and-timestamp.patch     | 4 ++--
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch   | 2 +-
 ...01-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch     | 2 +-
 ...lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...5-Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 2 +-
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch           | 2 +-
 .../0007-Skip-test_rm_r_no_permissions-test-under-root.patch  | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.9.bb => ruby_4.0.10.bb}  | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.9.bb => ruby_4.0.10.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
index f56511c4fb..00ed4230d9 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From da35533d51a51810f08d469d4c213387683919ac Mon Sep 17 00:00:00 2001
+From 6f1ab506444a407aaa4f64accbc0ca452596a54d Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Fri, 31 Jul 2026 13:15:37 +0100
 Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index f3ef90ccb7..d2d49cc64c 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 50214e465cf7ed0e61a9bddf40776ea02ea016a6 Mon Sep 17 00:00:00 2001
+From f40375621c30687ff9ac02c7631654e1c73c4c91 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
@@ -16,7 +16,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
-index 874c3ef..eb99a70 100755
+index 9af865c..a80c695 100755
 --- a/tool/rbinstall.rb
 +++ b/tool/rbinstall.rb
 @@ -173,7 +173,7 @@ def parse_args(argv = ARGV)
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 82642a32ef..8b65547a66 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From a7223627ee307d17aaefec37af91be8aa713d13f Mon Sep 17 00:00:00 2001
+From 60e01263e34e44c4d75f72436f00afb49dec6cad Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 1e8b4ce719..54d751b724 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 26cb483121c5c8c8842ff77e00ddff0a706002a8 Mon Sep 17 00:00:00 2001
+From 8f77d647b565035ecc85eaef3632c1445807c28a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index 8558ed8..230702d 100644
+index 6d2c40b..80df0bc 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index d76a31cdec..c3eab84158 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 1093a46b7a4b9e7981921ead5818bccd03e05830 Mon Sep 17 00:00:00 2001
+From dfae881bfd010af59cc74e4bbf4ab3ea71b43c6e Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 2ec279ab53..ad653d3d7a 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From bc9ead00cb7700381689be2362a8db9ceda9be40 Mon Sep 17 00:00:00 2001
+From 3d558a23e5138258861a85b2ab7a5de05eb575fb Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 9ee19ed3ab..b5a6f952c8 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From eec9acef646d6ed28a859e18461688520b2de1ba Mon Sep 17 00:00:00 2001
+From fcfa3f4b473731f53b0d4f1603afa514208a0a0a Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 0cf6ba62eb..4d45c82cc1 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From aff3fa8a85ae050bcb4cf6ff5cac5d4a93863643 Mon Sep 17 00:00:00 2001
+From deb94bfd6db6a0e6ccf084bd78eff28b597b117f Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index dfdab29d89..04c2b5234e 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From c8d3ce447197ce9fdb23b1f37b3b0cc161aa2791 Mon Sep 17 00:00:00 2001
+From 7530b33b238cdc21b71cd3f83024936597e28b61 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 95c2fc8bd5..eb610333cb 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From 7e2e3baece59ae73a15a7d28a6f3330eeb09851f Mon Sep 17 00:00:00 2001
+From 77eba1870995ac531cdbcca0b3fb6bdfb9173811 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.9.bb b/meta/recipes-devtools/ruby/ruby_4.0.10.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.9.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.10.bb
index 8c3f8fdf68..3151cbbccf 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.9.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.10.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
+SRC_URI[sha256sum] = "b53eef3371fa5d3e3b74340edcd015f06d5d8853968d4e539a5264fce41ed9f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============3712047847951435569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.4.0.9 /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.0.gemspec", added "/usr/lib/libruby.so.4.0.10 /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.3.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.9 to libruby.so.4.0.10
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.9 to libruby.so.4.0.10
  /usr/lib/ruby/gems/4.0.0/gems/json-2.18.0 moved to /usr/lib/ruby/gems/4.0.0/gems/json-2.18.3
  /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.3.gemspec
  /usr/lib/libruby.so.4.0.10 was added
  /usr/lib/libruby.so.4.0.9 was removed

--===============3712047847951435569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.9-4.0.10.patch"

RnJvbSA0MTdiZTlkZDk1M2NjMjU3MDY3MDQwZDZhMzBkMjBlZGM5MTNjY2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMDU6MjY6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC45IC0+IDQuMC4xMAoKLS0tCiAuLi5Bdm9pZC1idWlsZC10aW1lLXJh
Y2UtY29uZGl0aW9uLXdoZW4tY3Jvc3MtY29tcGlsaW5nLnBhdGNoIHwgMiArLQogLi4uLzAwMDEt
RG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoICAgICB8IDQg
KystLQogLi4uLzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdl
bXMucGF0Y2ggICB8IDIgKy0KIC4uLjAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdf
UzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCA0ICsrLS0KIC4uLi9ydWJ5L3J1YnkvMDAwMi1PYmV5
LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggfCAyICstCiAuLi4vcnVieS8w
MDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggICAgIHwgMiAr
LQogLi4ubGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQt
TS5wYXRjaCB8IDIgKy0KIC4uLjUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4
aW5nLTc4NDIyNS10b28ucGF0Y2ggfCAyICstCiAuLi4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1z
cGVjcy1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICAgIHwgMiArLQogLi4uLzAwMDctU2tpcC10
ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC45LmJiID0+IHJ1YnlfNC4wLjEwLmJi
fSAgfCAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV80LjAuOS5iYiA9
PiBydWJ5XzQuMC4xMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtQXZvaWQtYnVpbGQtdGltZS1yYWNlLWNvbmRpdGlvbi13aGVuLWNy
b3NzLWNvbXBpbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
MS1Bdm9pZC1idWlsZC10aW1lLXJhY2UtY29uZGl0aW9uLXdoZW4tY3Jvc3MtY29tcGlsaW5nLnBh
dGNoCmluZGV4IGY1NjUxMWM0ZmIuLjAwZWQ0MjMwZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Bdm9pZC1idWlsZC10aW1lLXJhY2UtY29uZGl0aW9u
LXdoZW4tY3Jvc3MtY29tcGlsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1Bdm9pZC1idWlsZC10aW1lLXJhY2UtY29uZGl0aW9uLXdoZW4tY3Jvc3Mt
Y29tcGlsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYTM1NTMzZDUxYTUxODEwZjA4
ZDQ2OWQ0YzIxMzM4NzY4MzkxOWFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZjFh
YjUwNjQ0NGE0MDdhYWE0ZjY0YWNjYmMwY2E0NTI1OTZhNTRkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUGF1bCBCYXJrZXIgPHBhdWxAcGJhcmtlci5kZXY+CiBEYXRlOiBGcmksIDMx
IEp1bCAyMDI2IDEzOjE1OjM3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEF2b2lkIGJ1aWxkLXRp
bWUgcmFjZSBjb25kaXRpb24gd2hlbiBjcm9zcy1jb21waWxpbmcgZnJvbSBhCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3Jp
Z2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5w
YXRjaAppbmRleCBmM2VmOTBjY2I3Li5kMmQ0OWNjNjRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1h
bmQtdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1lLWFuZC10aW1lc3RhbXAucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDUwMjE0ZTQ2NWNmN2VkMGU2MWE5YmRkZjQwNzc2ZWEwMmVhMDE2
YTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY0MDM3NTYyMWMzMDY4N2ZmOWFjMDJj
NzYzMTY1NGUxYzczYzRjOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyNyBGZWIgMjAy
NiAxNjo1OToyNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBzYXZlIHRoZSBvcmlnaW5h
bCBuYW1lIGFuZCB0aW1lc3RhbXAKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hh
bmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rvb2wvcmJpbnN0
YWxsLnJiIGIvdG9vbC9yYmluc3RhbGwucmIKLWluZGV4IDg3NGMzZWYuLmViOTlhNzAgMTAwNzU1
CitpbmRleCA5YWY4NjVjLi5hODBjNjk1IDEwMDc1NQogLS0tIGEvdG9vbC9yYmluc3RhbGwucmIK
ICsrKyBiL3Rvb2wvcmJpbnN0YWxsLnJiCiBAQCAtMTczLDcgKzE3Myw3IEBAIGRlZiBwYXJzZV9h
cmdzKGFyZ3YgPSBBUkdWKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9z
cy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCmluZGV4IDgyNjQyYTMyZWYuLjhi
NjU1NDdhNjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
MS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNv
bXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE3
MjIzNjI3ZWUzMDdkMTdhYWVmZWMzN2FmOTFiZThhYTcxM2QxM2YgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDYwZTAxMjYzZTM0ZTQ0YzRkNzVmNzI0MzZmMDBhZmI0OWRlYzZjYWQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6
aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogTW9uLCAzMCBTZXAgMjAxOSAxNjo1
NzowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBleHRtazogZml4IGNyb3NzLWNvbXBpbGF0aW9u
IG9mIGV4dGVybmFsIGdlbXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJp
c2N2LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAu
Yy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKaW5kZXggMWU4
YjRjZTcxOS4uNTRkNzUxYjcyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wt
cmlzY3YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZt
X2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDI2Y2I0ODMxMjFjNWM4Yzg4NDJmZjc3ZTAwZGRmZjBhNzA2MDAy
YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhmNzdkNjQ3YjU2NTAzNWVjYzg1ZWFl
ZjM2MzJjMTQ0NTgwN2MyOGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNSBKYW4gMjAyMiAyMDoyOToxNCAt
MDgwMAogU3ViamVjdDogW1BBVENIXSB2bV9kdW1wLmM6IERlZmluZSBSRUdfUzEgYW5kIFJFR19T
MiBmb3IgbXVzbC9yaXNjdgpAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
IAogZGlmZiAtLWdpdCBhL3ZtX2R1bXAuYyBiL3ZtX2R1bXAuYwotaW5kZXggODU1OGVkOC4uMjMw
NzAyZCAxMDA2NDQKK2luZGV4IDZkMmM0MGIuLjgwZGYwYmMgMTAwNjQ0CiAtLS0gYS92bV9kdW1w
LmMKICsrKyBiL3ZtX2R1bXAuYwogQEAgLTQwLDYgKzQwLDExIEBACmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGlu
ay1vZi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAy
LU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAppbmRleCBkNzZhMzFj
ZGVjLi5jM2VhYjg0MTU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRo
ZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDEwOTNhNDZiN2E0
YjllNzk4MTkyMWVhZDU4MThiY2NkMDNlMDU4MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGRmYWU4ODFiZmQwMTBhZjU5Y2M3NGU0YmJmNGFiM2VhNzFiNDNjNmUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50
b3IuY29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5OjA3IC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2YgbGlicnVieQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNp
YmxlLWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCAy
ZWMyNzlhYjUzLi5hZDY1M2QzZDdhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1y
ZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmM5
ZWFkMDBjYjc3MDAzODE2ODliZTIzNjJhOGRiOWNlZGE5YmU0MCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gM2Q1NThhMjNlNTEzODI1ODg2MWE4NWIyYWI3YTVkZTA1ZWI1NzVmYiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFA
ZGViaWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1z
b3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmpl
Y3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggOWVlMTllZDNhYi4uYjVhNmY5NTJj
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1t
a21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQt
bGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGVlYzlhY2VmNjQ2ZDZlZDI4YTg1OWUxODQ2MTY4ODUyMGIyZGUxYmEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGZjZmEzZjRiNDczNzMxZjUzYjBkNGYxNjAzYWZhNTE0MjA4
YTBhMGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJl
aW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMg
aW4gZ2VuZXJhdGVkIE1ha2VmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4
NDIyNS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFy
ay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKaW5k
ZXggMGNmNmJhNjJlYi4uNGQ0NWM4MmNjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGlu
Zy03ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWZmM2ZhOGE4NWFlMDUwYmNiNGNmNmZmNWNhYzVk
NGE5Mzg2MzY0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGViOTRiZmQ2ZGI2YTBl
NmNjZjA4NGJkNzhlZmYyOGI1OTdiMTE3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92
IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXBy
b2R1Y2libGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
Ni1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAppbmRleCBk
ZmRhYjI5ZDg5Li4wNGMyYjUyMzRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNp
YmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjOGQzY2U0NDcxOTdjZTlmZGIyM2IxZjM3
YjNiMGNjMTYxYWEyNzkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NTMwYjMzYjIz
OGNkYzIxYjcxY2QzZjgzMDI0OTM2NTk3ZTI4YjYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwg
MSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNz
IHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9u
b19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKaW5kZXggOTVjMmZjOGJkNS4uZWI2
MTAzMzNjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3
LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9f
cGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3
ZTJlM2JhZWNlNTlhZTczYTE1YTdkMjhhNmYzMzMwZWViMDk4NTFmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA3N2ViYTE4NzA5OTVhYzUzMWNkYmNjYTBiM2ZiNmJkZmI5MTczODExIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcu
Y25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAog
U3ViamVjdDogW1BBVENIXSBTa2lwIHRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVy
IHJvb3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC4xMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQu
MC45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC4xMC5i
YgppbmRleCA4YzNmOGZkZjY4Li4zMTUxY2JiY2NmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnlfNC4wLjEwLmJiCkBAIC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5k
KCkgewogCiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYzM1MzUwNjgyZmYwNTBiNzk3MDJkNTdhZGU0NTE2ZTczMzYwNjNm
NTEwMTU1ZDE5ZmIyZmI1YjNmMzkwOTUxMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNTNlZWYz
MzcxZmE1ZDNlM2I3NDM0MGVkY2QwMTVmMDZkNWQ4ODUzOTY4ZDRlNTM5YTUyNjRmY2U0MWVkOWYx
IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMu
ZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============3712047847951435569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.9.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.10.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documen
 tation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18236160 to 18274032 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.9", added "/usr/lib/.debug/libruby.so.4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1615075 to 1615199 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10427815 to 10484184 (+1%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 41566586 to 41615683 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/io -> /usr/src/debug/ruby/4.0.10/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.9/ext/json/generator -> /usr/src/debug/ruby/4.0.10/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.10/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.9/internal -> /usr/src/debug/ruby/4.0.10/internal, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.10/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.9/ext/socket -> /usr/src/debug/ruby/4.0.10/ext/socket, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/fiber -> /usr/src/debug/ruby/4.0.10/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.10/.bundle/gems/fiddle-1.1.8/ext/fiddle, direc
 tory renamed /usr/src/debug/ruby/4.0.9 -> /usr/src/debug/ruby/4.0.10, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.10/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.10/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.9/ext/erb/escape -> /usr/src/debug/ruby/4.0.10/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.9/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.10/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.9/ext/psych -> /usr/src/debug/ruby/4.0.10/ext/psych, directory renamed /usr/src/debug/ruby/4.0.9/ext/ripper -> /usr/src/debug/ruby/4.0.10/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.9/gc/default -> /usr/src/debug/ruby/4.0.10/gc/default, directory renamed /usr/src/debug/ruby/4.0.9/prism/templates/src -> /usr/src/debug/ruby/4.0.10/prism/templates/src, directory renamed /usr/src/
 debug/ruby/4.0.9/prism -> /usr/src/debug/ruby/4.0.10/prism, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.10/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.10/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.10/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.9/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.10/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.9/ext/io/nonblock -> /usr/src/debug/ruby/4.0.10/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.9/gc -> /usr/src/debug/ruby/4.0.10/gc, directory renamed /usr/src/debug/ruby/4.0.9/ext/json/simd -> /usr/src/debug/ruby/4.0.10/ext/json/simd, directory renamed /usr/src/debug/ruby/4.
 0.9/include/ruby -> /usr/src/debug/ruby/4.0.10/include/ruby, directory renamed /usr/src/debug/ruby/4.0.9/ccan/list -> /usr/src/debug/ruby/4.0.10/ccan/list, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest -> /usr/src/debug/ruby/4.0.10/ext/digest, directory renamed /usr/src/debug/ruby/4.0.9/ext/coverage -> /usr/src/debug/ruby/4.0.10/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.9/ext/date -> /usr/src/debug/ruby/4.0.10/ext/date, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest/md5 -> /usr/src/debug/ruby/4.0.10/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.9/ext/fcntl -> /usr/src/debug/ruby/4.0.10/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.9/enc/trans -> /usr/src/debug/ruby/4.0.10/enc/trans, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.10/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/internal -> /usr/src/debug/ruby/4.0.10/include/ru
 by/internal, directory renamed /usr/src/debug/ruby/4.0.9/prism/util -> /usr/src/debug/ruby/4.0.10/prism/util, directory renamed /usr/src/debug/ruby/4.0.9/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.10/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.9/coroutine/amd64 -> /usr/src/debug/ruby/4.0.10/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.9/ext/objspace -> /usr/src/debug/ruby/4.0.10/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr/src/debug/ruby/4.0.10/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.9/ext/openssl -> /usr/src/debug/ruby/4.0.10/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.10/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.9/ext/monitor -> /usr/src/debug/ruby/4.0.10/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.9/ext/stringio -> /usr/src/d
 ebug/ruby/4.0.10/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.9/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.10/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.10/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.10/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.9/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.10/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.9/ext/continuation -> /usr/src/debug/ruby/4.0.10/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.9/ext/cgi/escape -> /usr/src/debug/ruby/4.0.10/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.10/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.9/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.10/ext/digest/sha2, directory renamed /usr/src
 /debug/ruby/4.0.9/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.10/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.9/ext/io/wait -> /usr/src/debug/ruby/4.0.10/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.9/enc -> /usr/src/debug/ruby/4.0.10/enc, directory renamed /usr/src/debug/ruby/4.0.9/ext/strscan -> /usr/src/debug/ruby/4.0.10/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.10/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.9/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.10/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.9/defs -> /usr/src/debug/ruby/4.0.10/defs, directory renamed /usr/src/debug/ruby/4.0.9/ext/etc -> /usr/src/debug/ruby/4.0.10/ext/etc, directory renamed /usr/src/debug/ruby/4.0.9/ext/zlib -> /usr/src/debug/ruby/4.0.10/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.9/include/
 ruby/internal/core -> /usr/src/debug/ruby/4.0.10/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.9/missing -> /usr/src/debug/ruby/4.0.10/missing, directory renamed /usr/src/debug/ruby/4.0.9/ext/json/parser -> /usr/src/debug/ruby/4.0.10/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.9/ext/io/console -> /usr/src/debug/ruby/4.0.10/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.10/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.9/enc/jis -> /usr/src/debug/ruby/4.0.10/enc/jis, directory renamed /usr/src/debug/ruby/4.0.9/ext -> /usr/src/debug/ruby/4.0.10/ext, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.10/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.10/.bundle/gems/rbs-3.10.0/ext/rbs_extension, direct
 ory renamed /usr/src/debug/ruby/4.0.9/ext/pty -> /usr/src/debug/ruby/4.0.10/ext/pty, directory renamed /usr/src/debug/ruby/4.0.9/ext/json/vendor -> /usr/src/debug/ruby/4.0.10/ext/json/vendor
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.9" to "4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35753385 to 35761234 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.4.0.9 /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.0.gemspec", added "/usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.3.gemspec /usr/lib/libruby.so.4.0.10"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.9 to libruby.so.4.0.10
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.9 to libruby.so.4.0.10
  /usr/lib/ruby/gems/4.0.0/gems/json-2.18.0 moved to /usr/lib/ruby/gems/4.0.0/gems/json-2.18.3
  /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/json-2.18.3.gemspec
  /usr/lib/libruby.so.4.0.10 was added
  /usr/lib/libruby.so.4.0.9 was removed

--===============3712047847951435569==--
