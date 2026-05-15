Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7E4CD5BB4
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34834.1778851235157759110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jis204z0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Of/AV6bT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbc334-d9d14f95-6fdf-4af2-a877-af815b76e7f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ISJoIUA9edYymRTYtf20AIvpzgRW7tEYAQ0ABsYIzE0=;
	b=jis204z0Mh6rZp31b0trBckGioakcSzhNNE3OrL+07X8D7y83aIklwtafHJd8+3b
	2F5AJ/NA3x/yJljfrKycXo95qjGpTFFEC6OCS/MIuATpIQbr1hHFCkrLzYIuV40qhGk
	nm3NFb2zyO+JNyaMhAFRjiNK31AXfw4yWCQRGrSs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ISJoIUA9edYymRTYtf20AIvpzgRW7tEYAQ0ABsYIzE0=;
	b=Of/AV6bTrNlsoveuZ01Iu9kMRtLc1AiGcv+DX7VFjBwRcPfjJz2nqILVSQVLrXvC
	iebRxXYygNFGrYE6JdopNOfNcWzlrwQ+GuajiM6Pdke8a/OrInrmuyGE5LvYcRhNP4B
	bQS/eLZxvmwyqeTzj+nqt2LiP1u77NM84kxKVguk=
Content-Type: multipart/mixed; boundary="===============7355593545823984094=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.4 SUCCEEDED
Message-ID: <0101019e2bcbc334-d9d14f95-6fdf-4af2-a877-af815b76e7f0-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237129

--===============7355593545823984094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.3-4.0.4.patch
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
From cdada8395ac1cf61dfac8b938d7770d16a50495f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:27:28 +0000
Subject: [PATCH] ruby: upgrade 4.0.3 -> 4.0.4

---
 .../0001-Don-t-save-the-original-name-and-timestamp.patch   | 2 +-
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch   | 2 +-
 ...b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch         | 2 +-
 ...0007-Skip-test_rm_r_no_permissions-test-under-root.patch | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.3.bb => ruby_4.0.4.bb} | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.3.bb => ruby_4.0.4.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 2c48ca184d..19090617aa 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 73edbaf1a89e05e92f91ed97348a65c4ce740cea Mon Sep 17 00:00:00 2001
+From 443043dffba7ab8db419d5cef4a00be7b66ce6c3 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 3bf80b1613..8ba103d03e 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From f2ea81d4707614309cda02be59dd6ccbde9b2441 Mon Sep 17 00:00:00 2001
+From 8d6bc67c8129c40e9ca487f5c92348698c80471f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 32d55cde9f..c694a5461a 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 875543f1bc5da190543e2696a47cfaaf939e1549 Mon Sep 17 00:00:00 2001
+From cce8a5b0c4f5c1ba136c13459eda6e7f6faf0808 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 11aec87934..6efae44cf7 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From c460fce052e04a8126f5e0554f68359ef986c5f8 Mon Sep 17 00:00:00 2001
+From b41cba03df86b649fb4ceea55791977d6bb810a7 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 863960839d..17faace32e 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3a335538594d0eb3da6155a64b473a46fd06ce76 Mon Sep 17 00:00:00 2001
+From 17cefb934ab3210187610092cd66a7ba35655721 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 2c1f857d75..74ce96cca1 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From e94b898d11e3bd5c412aa3b772040870cddf36c7 Mon Sep 17 00:00:00 2001
+From c1e822312eb48a2a9ebfab809a81e428db81a2db Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 746d102292..5001a521f6 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From f21e09b9c8f5975887cd85e3ec4dcf9838f62575 Mon Sep 17 00:00:00 2001
+From 7b758ead8afd23a5eb3e5f1a97b2340f4967c930 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 503f0a4..5d33b09 100644
+index 2db9352..925b7a0 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1705,7 +1705,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index cdfa2144d7..cc9c3eabb9 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2a18efc076a20bc270215a802d72618ad0605f91 Mon Sep 17 00:00:00 2001
+From a97719b00b74e3612412f6900410cf74774226a0 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 93b7406858..7ec98b5c46 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From 4a48511f45606eff4e03f004fb6aea6f8ccd1eaf Mon Sep 17 00:00:00 2001
+From 9834f7fc3313059ff8e361fc91f1037135bbe03a Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.3.bb b/meta/recipes-devtools/ruby/ruby_4.0.4.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.3.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.4.bb
index 56f167379c..2c16411760 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.4.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "77964acc370d5c8375b9502e5ba6c13c03ef91ab9eb9f521c84fb42b9c9a6b0f"
+SRC_URI[sha256sum] = "f35f6edfa3dabb3f723f9d0cf1906c6512ae77f4e412ab1e68cc6e91d230fa80"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============7355593545823984094==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.3-4.0.4.patch"

RnJvbSBjZGFkYTgzOTVhYzFjZjYxZGZhYzhiOTM4ZDc3NzBkMTZhNTA0OTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6Mjc6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC4zIC0+IDQuMC40CgotLS0KIC4uLi8wMDAxLURvbi10LXNhdmUtdGhl
LW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCAgIHwgMiArLQogLi4uLzAwMDEtZXh0
bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggfCAyICstCiAu
Li4tdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRj
aCB8IDIgKy0KIC4uLi9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJy
dWJ5LnBhdGNoICAgIHwgMiArLQogLi4uL3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJs
ZS1kb2N1bWVudGF0aW9uLnBhdGNoICAgfCAyICstCiAuLi5iLW1rbWYucmItc29ydC1saXN0LW9m
LW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaCB8IDIgKy0KIC4uLk1hcmstR2Vtc3Bl
Yy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIHwgNiArKystLS0K
IC4uLi9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCAgICAg
ICAgIHwgMiArLQogLi4uMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVu
ZGVyLXJvb3QucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV80
LjAuMy5iYiA9PiBydWJ5XzQuMC40LmJifSB8IDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3tydWJ5XzQuMC4zLmJiID0+IHJ1YnlfNC4wLjQuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhlLW9y
aWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1lLWFuZC10aW1lc3RhbXAu
cGF0Y2gKaW5kZXggMmM0OGNhMTg0ZC4uMTkwOTA2MTdhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUt
YW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA3M2VkYmFmMWE4OWUwNWU5MmY5MWVkOTczNDhhNjVjNGNlNzQw
Y2VhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NDMwNDNkZmZiYTdhYjhkYjQxOWQ1
Y2VmNGEwMGJlN2I2NmNlNmMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjcgRmViIDIw
MjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qgc2F2ZSB0aGUgb3JpZ2lu
YWwgbmFtZSBhbmQgdGltZXN0YW1wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdl
bXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4
LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKaW5kZXggM2JmODBiMTYx
My4uOGJhMTAzZDAzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jv
c3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZjJlYTgxZDQ3MDc2MTQzMDljZGEwMmJlNTlkZDZjY2JkZTliMjQ0MSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOGQ2YmM2N2M4MTI5YzQwZTljYTQ4N2Y1YzkyMzQ4Njk4YzgwNDcx
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbmRyPUMzPUE5PTIw
RHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBNb24sIDMwIFNlcCAyMDE5
IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBmaXggY3Jvc3MtY29tcGls
YXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11
c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1f
ZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAppbmRl
eCAzMmQ1NWNkZTlmLi5jNjk0YTU0NjFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODc1NTQzZjFiYzVkYTE5MDU0M2UyNjk2YTQ3Y2ZhYWY5
MzllMTU0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2NlOGE1YjBjNGY1YzFiYTEz
NmMxMzQ1OWVkYTZlN2Y2ZmFmMDgwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI1IEphbiAyMDIyIDIwOjI5
OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzogRGVmaW5lIFJFR19TMSBhbmQg
UkVHX1MyIGZvciBtdXNsL3Jpc2N2CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3It
dGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAppbmRleCAxMWFlYzg3OTM0Li42ZWZhZTQ0Y2Y3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZM
QUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1Ynku
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM0NjBmY2UwNTJlMDRhODEyNmY1ZTA1NTRmNjgz
NTllZjk4NmM1ZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI0MWNiYTAzZGY4NmI2
NDlmYjRjZWVhNTU3OTE5NzdkNmJiODEwYTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3IuY29tPgogRGF0ZTogVGh1
LCA1IE1heSAyMDE2IDEwOjU5OjA3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE9iZXkgTERGTEFH
UyBmb3IgdGhlIGxpbmsgb2YgbGlicnVieQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1y
ZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCA4NjM5NjA4MzlkLi4xN2ZhYWNl
MzJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRv
Yy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1l
bnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2EzMzU1Mzg1OTRkMGViM2RhNjE1
NWE2NGI0NzNhNDZmZDA2Y2U3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTdjZWZi
OTM0YWIzMjEwMTg3NjEwMDkyY2Q2NmE3YmEzNTY1NTcyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGViaWFuLm9yZz4KIERhdGU6
IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmRvYzog
YnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0
LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2gKaW5kZXggMmMxZjg1N2Q3NS4uNzRjZTk2Y2NhMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1v
Zi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU5NGI4OThkMTFl
M2JkNWM0MTJhYTNiNzcyMDQwODcwY2RkZjM2YzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGMxZTgyMjMxMmViNDhhMmE5ZWJmYWI4MDlhODFlNDI4ZGI4MWEyZGIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4K
IERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
bGliL21rbWYucmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2Vm
aWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFy
ay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVj
aWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKaW5kZXggNzQ2ZDEwMjI5Mi4uNTAw
MWE1MjFmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1
LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMt
cmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjIxZTA5YjljOGY1OTc1ODg3Y2Q4NWUzZWM0ZGNmOTgzOGY2MjU3NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2I3NThlYWQ4YWZkMjNhNWViM2U1ZjFhOTdiMjM0MGY0
OTY3YzkzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8
a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAz
MDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTEyLDEw
ICsxMiwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtkZWJpYW5dCiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGli
L3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5y
YgotaW5kZXggNTAzZjBhNC4uNWQzM2IwOSAxMDA2NDQKK2luZGV4IDJkYjkzNTIuLjkyNWI3YTAg
MTAwNjQ0CiAtLS0gYS9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgogKysrIGIvbGliL3J1
YnlnZW1zL3NwZWNpZmljYXRpb24ucmIKLUBAIC0xNzA1LDcgKzE3MDUsOSBAQCBjbGFzcyBHZW06
OlNwZWNpZmljYXRpb24gPCBHZW06OkJhc2ljU3BlY2lmaWNhdGlvbgorQEAgLTE3MTQsNyArMTcx
NCw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9u
CiAgICAgICAgICAgICAgICAgIHJhaXNlKEdlbTo6SW52YWxpZFNwZWNpZmljYXRpb25FeGNlcHRp
b24sCiAgICAgICAgICAgICAgICAgICAgICAgICJpbnZhbGlkIGRhdGUgZm9ybWF0IGluIHNwZWNp
ZmljYXRpb246ICN7ZGF0ZS5pbnNwZWN0fSIpCiAgICAgICAgICAgICAgICBlbmQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJl
cHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1N
YWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAppbmRleCBjZGZhMjE0NGQ3Li5jYzljM2Vh
YmI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFr
ZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAyYTE4ZWZjMDc2YTIwYmMyNzAyMTVhODAyZDcyNjE4YWQwNjA1ZjkxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhOTc3MTliMDBiNzRlMzYxMjQxMmY2OTAwNDEw
Y2Y3NDc3NDIyNmEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNo
aXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNTox
NyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9y
bV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0
LXVuZGVyLXJvb3QucGF0Y2gKaW5kZXggOTNiNzQwNjg1OC4uN2VjOThiNWM0NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25v
X3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11
bmRlci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YTQ4NTExZjQ1NjA2ZWZmNGUw
M2YwMDRmYjZhZWE2ZjhjY2QxZWFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ODM0
ZjdmYzMzMTMwNTlmZjhlMzYxZmM5MWYxMDM3MTM1YmJlMDNhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAogU3ViamVjdDogW1BBVENIXSBT
a2lwIHRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVyIHJvb3QKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjMuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjQuYmIKaW5kZXggNTZmMTY3Mzc5Yy4u
MmMxNjQxMTc2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80
LjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC40LmJiCkBA
IC00OCw3ICs0OCw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogCiBERVBFTkRTOmFwcGVu
ZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzc5
NjRhY2MzNzBkNWM4Mzc1Yjk1MDJlNWJhNmMxM2MwM2VmOTFhYjllYjlmNTIxYzg0ZmI0MmI5Yzlh
NmIwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMzVmNmVkZmEzZGFiYjNmNzIzZjlkMGNmMTkw
NmM2NTEyYWU3N2Y0ZTQxMmFiMWU2OGNjNmU5MWQyMzBmYTgwIgogCiBQQUNLQUdFQ09ORklHID8/
PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVS
RVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============7355593545823984094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera
 ted-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 17952568 to 17957360 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.3", added "/usr/lib/.debug/libruby.so.4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10252720 to 10267138 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40710188 to 40714509 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.4/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.3/internal -> /usr/src/debug/ruby/4.0.4/internal, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.4/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/generator -> /usr/src/debug/ruby/4.0.4/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/io -> /usr/src/debug/ruby/4.0.4/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.4/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.3/ext/socket -> /usr/src/debug/ruby/4.0.4/ext/socket, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/fiber -> /usr/src/debug/ruby/4.0.4/include/ruby/fiber, directory ren
 amed /usr/src/debug/ruby/4.0.3/ext/erb/escape -> /usr/src/debug/ruby/4.0.4/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.3/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.4/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.4/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.3/ext/psych -> /usr/src/debug/ruby/4.0.4/ext/psych, directory renamed /usr/src/debug/ruby/4.0.3/gc/default -> /usr/src/debug/ruby/4.0.4/gc/default, directory renamed /usr/src/debug/ruby/4.0.3/ext/ripper -> /usr/src/debug/ruby/4.0.4/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.3/prism -> /usr/src/debug/ruby/4.0.4/prism, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.4/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.3 -> /usr/src/debug/ruby/4.0.4, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/incl
 ude/rbs/util -> /usr/src/debug/ruby/4.0.4/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.4/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.3/prism/templates/src -> /usr/src/debug/ruby/4.0.4/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/nonblock -> /usr/src/debug/ruby/4.0.4/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.4/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.3/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.4/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby -> /usr/src/debug/ruby/4.0.4/include/ruby, directory renamed /usr/src/debug/ruby/4.0.3/ccan/list -> /usr/src/debug/ruby/4.0.4/ccan/list, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/
 simd -> /usr/src/debug/ruby/4.0.4/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.3/gc -> /usr/src/debug/ruby/4.0.4/gc, directory renamed /usr/src/debug/ruby/4.0.3/enc/trans -> /usr/src/debug/ruby/4.0.4/enc/trans, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/md5 -> /usr/src/debug/ruby/4.0.4/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.3/ext/fcntl -> /usr/src/debug/ruby/4.0.4/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.3/ext/coverage -> /usr/src/debug/ruby/4.0.4/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.3/ext/date -> /usr/src/debug/ruby/4.0.4/ext/date, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest -> /usr/src/debug/ruby/4.0.4/ext/digest, directory renamed /usr/src/debug/ruby/4.0.3/coroutine/amd64 -> /usr/src/debug/ruby/4.0.4/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.3/ext/objspace -> /usr/src/debug/ruby/4.0.4/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/syslog-0.3.0/ext/syslog -
 > /usr/src/debug/ruby/4.0.4/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal -> /usr/src/debug/ruby/4.0.4/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.3/prism/util -> /usr/src/debug/ruby/4.0.4/prism/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/monitor -> /usr/src/debug/ruby/4.0.4/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.3/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.4/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.4/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr/src/debug/ruby/4.0.4/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.3/ext/openssl -> /usr/src/debug/ruby/4.0.4/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.4/include
 /ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.4/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.3/ext/stringio -> /usr/src/debug/ruby/4.0.4/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.3/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.4/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.4/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0.3/ext/cgi/escape -> /usr/src/debug/ruby/4.0.4/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.4/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.3/ext/continuation -> /usr/src/debug/ruby/4.0.4/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/wait -> /usr/src/debug/ruby/4.0.4/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.
 4/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.4/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.4/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.3/enc -> /usr/src/debug/ruby/4.0.4/enc, directory renamed /usr/src/debug/ruby/4.0.3/ext/strscan -> /usr/src/debug/ruby/4.0.4/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/parser -> /usr/src/debug/ruby/4.0.4/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.4/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.3/missing -> /usr/src/debug/ruby/4.0.4/missing, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.4/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.3/ext/etc -> 
 /usr/src/debug/ruby/4.0.4/ext/etc, directory renamed /usr/src/debug/ruby/4.0.3/ext/zlib -> /usr/src/debug/ruby/4.0.4/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.3/defs -> /usr/src/debug/ruby/4.0.4/defs, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/console -> /usr/src/debug/ruby/4.0.4/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.4/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.4/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.4/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.3/enc/jis -> /usr/src/debug/ruby/4.0.4/enc/jis, directory renamed /usr/src/debug/ruby/4.0.3/ext -> /usr/src/debug/ruby/4.0.4/ext, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/vendor -> /usr/src/debu
 g/ruby/4.0.4/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.3/ext/pty -> /usr/src/debug/ruby/4.0.4/ext/pty
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35496152 to 35514836 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec /usr/lib/libruby.so.4.0.3", added "/usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt /usr/lib/libruby.so.4.0.4"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.3" to "4.0.4"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.4
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.4
  /usr/lib/libruby.so.4.0.3 moved to /usr/lib/libruby.so.4.0.4
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt was added
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundle was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundler was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6 was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundle was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundler was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec was removed

--===============7355593545823984094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec /usr/lib/libruby.so.4.0.3", added "/usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt /usr/lib/libruby.so.4.0.4"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.4
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.4
  /usr/lib/libruby.so.4.0.3 moved to /usr/lib/libruby.so.4.0.4
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt was added
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundle was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundler was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6 was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundle was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundler was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec was removed

--===============7355593545823984094==--

