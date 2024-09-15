Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC474C35FF0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.115642.1726410841450043218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iiZYDwvo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pNAcZq62;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adab0-5897d089-9c63-4daf-b44e-d949dbec57bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j18scS+4pYGnXemelL86nl8kVCAoaVFBcHSR15K66nk=;
	b=iiZYDwvoqEOuLjpdLW8R6YCZaOoCEuMUwOBw1SVYhSWcI/Tqt2c1CBGCut6AU86X
	um84ZR6Va43XkNEeH6guWnwEW+KonVQtHIaC/gt9rNbU7tBvjIqnCvXFeuE5uonznCR
	rbzllpYbVWMps3SzDdb9TTLJJExL83QcmZ7ZfDBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j18scS+4pYGnXemelL86nl8kVCAoaVFBcHSR15K66nk=;
	b=pNAcZq62t1yjYwIoCtWQFhKv5tvDRmSn+9q77/6i0Ap7OhYLLJRFtyV7U9VV0xxX
	bIu9dWvx+ZJySX53zDeCFEsipWpP0kLmm1nFCCuyBuFcI/iuxbrXR3wugVlU/AQuWTG
	WnQ/8vWMd02OiIHHaCY7SZY8lGDjstkkDxi65Omc=
Content-Type: multipart/mixed; boundary="===============4348472746961229882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.3.5 SUCCEEDED
Message-ID: <01010191f61adab0-5897d089-9c63-4daf-b44e-d949dbec57bf-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204547

--===============4348472746961229882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *3.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.3.4-3.3.5.patch
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
From e08f915f81c8df7b6a53b7e09461ea33b91e9b6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 09:40:15 +0000
Subject: [PATCH] ruby: upgrade 3.3.4 -> 3.3.5

---
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch   | 2 +-
 ...b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch         | 2 +-
 meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index bd8f736247..b9ed131e4f 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From b74950d4f06bbfb91b2e68044147a226c15f4639 Mon Sep 17 00:00:00 2001
+From 7a15cc9f1ad8a3fc79e84d6c0372ee534b299df8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index bc1744da82..f4ffd0ffc1 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f4edf72c76bc06fa92c61f6cb9163cc777912a1f Mon Sep 17 00:00:00 2001
+From 0747e343a30e450c0a34913e3e5021d34719da35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 6f95685917..9450eb9412 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e6267676addd27f3c02667116185211d711ef940 Mon Sep 17 00:00:00 2001
+From 377946b7f1cf73037b882f2c32bdf3e165fbebca Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index abbbd35702..d0ca706aff 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 09a6df0d32e2177406ed391e536c0c7c4b503c5d Mon Sep 17 00:00:00 2001
+From 3883c1e3b562b489373d124db43959eb944608bd Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index f08aaf555f..dfea0cdc4c 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From f491fff7d006954c1c51eb7a513a85bdbab0fe5a Mon Sep 17 00:00:00 2001
+From f9e99c783b725a1271c2e367bc9fb07aa03c2bbd Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 5570cdfcaa..7725a69028 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 91304f26dd4153ecae752ea875eec9ce2d5d3963 Mon Sep 17 00:00:00 2001
+From ddae03fd694cb4f8844ba2b35f3c46f7dd499205 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 05ce483..5f2dbd1 100644
+index d6eac7f..4b2e95e 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1698,7 +1698,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 8a1daba7bd..0c450b16fe 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 42f8019e62f392f5bc09c25e90cc63123eb764fe Mon Sep 17 00:00:00 2001
+From 050455b42d31b2708dc4a6471c5fae2bf8d13c2a Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.4.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.5.bb
index d39b7ae520..5a7b8137aa 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "fe6a30f97d54e029768f2ddf4923699c416cdbc3a6e96db3e2d5716c7db96a34"
+SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.44.0


--===============4348472746961229882==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.3.4-3.3.5.patch"

RnJvbSBlMDhmOTE1ZjgxYzhkZjdiNmE1M2I3ZTA5NDYxZWEzM2I5MWU5YjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDk6NDA6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuMy40IC0+IDMuMy41CgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9z
cy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgMiArLQogLi4uLXZtX2R1bXAu
Yy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCAyICstCiAu
Li4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAg
ICB8IDIgKy0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRh
dGlvbi5wYXRjaCAgIHwgMiArLQogLi4uYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggfCAyICstCiAuLi5NYXJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDYgKysrLS0tCiAuLi4vcnVieS9y
dWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICB8IDIgKy0K
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuMy40LmJiID0+IHJ1YnlfMy4zLjUu
YmJ9IHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjMuNC5iYiA9
PiBydWJ5XzMuMy41LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwt
Z2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1m
aXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRleCBiZDhmNzM2
MjQ3Li5iOWVkMTMxZTRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1j
cm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBiNzQ5NTBkNGYwNmJiZmI5MWIyZTY4MDQ0MTQ3YTIyNmMxNWY0NjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA3YTE1Y2M5ZjFhZDhhM2ZjNzllODRkNmMwMzcyZWU1MzRiMjk5
ZGY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0FuZHI9QzM9QTk9
MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1vbiwgMzAgU2VwIDIw
MTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZpeCBjcm9zcy1jb21w
aWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12
bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCmlu
ZGV4IGJjMTc0NGRhODIuLmY0ZmZkMGZmYzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZv
ci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNGVkZjcyYzc2YmMwNmZhOTJjNjFmNmNiOTE2M2Nj
Nzc3OTEyYTFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNzQ3ZTM0M2EzMGU0NTBj
MGEzNDkxM2UzZTUwMjFkMzQ3MTlkYTM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjUgSmFuIDIwMjIgMjA6
Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBEZWZpbmUgUkVHX1MxIGFu
ZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZv
ci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCmluZGV4IDZmOTU2ODU5MTcuLjk0NTBlYjk0MTIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxE
RkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVi
eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTYyNjc2NzZhZGRkMjdmM2MwMjY2NzExNjE4
NTIxMWQ3MTFlZjk0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzc3OTQ2YjdmMWNm
NzMwMzdiODgyZjJjMzJiZGYzZTE2NWZiZWJjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBU
aHUsIDUgTWF5IDIwMTYgMTA6NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZM
QUdTIGZvciB0aGUgbGluayBvZiBsaWJydWJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlv
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxk
LXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCmluZGV4IGFiYmJkMzU3MDIuLmQwY2E3
MDZhZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1y
ZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1
bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwOWE2ZGYwZDMyZTIxNzc0MDZl
ZDM5MWU1MzZjMGM3YzRiNTAzYzVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzODgz
YzFlM2I1NjJiNDg5MzczZDEyNGRiNDM5NTllYjk0NDYwOGJkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hyaXN0aWFuIEhvZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogRGF0
ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNDozNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSByZG9j
OiBidWlsZCByZXByb2R1Y2libGUgZG9jdW1lbnRhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmpl
Y3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5l
cmF0ZWQtTS5wYXRjaAppbmRleCBmMDhhYWY1NTVmLi5kZmVhMGNkYzRjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0
LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1m
aWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjQ5MWZmZjdk
MDA2OTU0YzFjNTFlYjdhNTEzYTg1YmRiYWIwZmU1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZjllOTljNzgzYjcyNWExMjcxYzJlMzY3YmM5ZmIwN2FhMDNjMmJiZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1oLmRl
PgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDogW1BBVENI
XSBsaWIvbWttZi5yYjogc29ydCBsaXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0ZWQgTWFr
ZWZpbGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1N
YXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9k
dWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRleCA1NTcwY2RmY2FhLi43
NzI1YTY5MDI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3Bl
Yy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA5MTMwNGYyNmRkNDE1M2VjYWU3NTJlYTg3NWVlYzljZTJkNWQzOTYzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkZGFlMDNmZDY5NGNiNGY4ODQ0YmEyYjM1ZjNjNDZm
N2RkNDk5MjA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJv
IDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAt
MDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTIs
MTAgKzEyLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0KICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9s
aWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9u
LnJiCi1pbmRleCAwNWNlNDgzLi41ZjJkYmQxIDEwMDY0NAoraW5kZXggZDZlYWM3Zi4uNGIyZTk1
ZSAxMDA2NDQKIC0tLSBhL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiArKysgYi9saWIv
cnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotQEAgLTE2OTgsNyArMTY5OCw5IEBAIGNsYXNzIEdl
bTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAtMTcwNyw3ICsx
NzA3LDkgQEAgY2xhc3MgR2VtOjpTcGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRp
b24KICAgICAgICAgICAgICAgICAgcmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNhdGlvbkV4Y2Vw
dGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgZGF0ZSBmb3JtYXQgaW4gc3Bl
Y2lmaWNhdGlvbjogI3tkYXRlLmluc3BlY3R9IikKICAgICAgICAgICAgICAgIGVuZApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3Mt
cmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2
LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDhhMWRhYmE3YmQuLjBjNDUw
YjE2ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1N
YWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDQyZjgwMTllNjJmMzkyZjViYzA5YzI1ZTkwY2M2MzEyM2ViNzY0ZmUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA1MDQ1NWI0MmQzMWIyNzA4ZGM0YTY0NzFj
NWZhZTJiZjhkMTNjMmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5h
c2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1
OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjMuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy41LmJiCmluZGV4IGQz
OWI3YWU1MjAuLjVhN2I4MTM3YWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnlfMy4zLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjMuNS5iYgpAQCAtNDcsNyArNDcsNyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsKIAogREVQ
RU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImZlNmEzMGY5N2Q1NGUwMjk3NjhmMmRkZjQ5MjM2OTljNDE2Y2RiYzNhNmU5NmRiM2Uy
ZDU3MTZjN2RiOTZhMzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzc4MWEzNTA0MjIyYzJmMjZj
YjRiOWViOWMxYTEyZGJmNDk0NGQzNjZjZTI0YTlmZjhjZjk5ZWNiY2U3NTE5NiIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElT
VFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ0LjAKCg==

--===============4348472746961229882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_local_server.rb /usr/lib/ruby/ptest/test/test_bundled_gems.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_s3.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_local_ssl_server.rb"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/parsers -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/parsers, directory renamed /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11/exe -> /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/light -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/light, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml/tasks/rdoc -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/rdoc, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/validation -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/validation, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib, directory renamed /usr/lib/ruby/gems
 /3.3.0/gems/rss-0.3.0/lib/rss -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss/dublincore -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/dublincore, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/formatters -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/formatters, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml/tasks/tocs -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/tocs, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss/content -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/content, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss/maker -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/maker,
  directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/dtd -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/dtd, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml, removed "/usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec /usr/lib/libruby.so.3.3.4 /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec /usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem", added "/usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec /usr/bin/syntax_suggest.lock /usr/lib/libruby.so.3.3.5 /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem /usr/bin/typeprof.lock /usr/lib/ruby/gems/3.3.0
 /specifications/rexml-3.3.6.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb /usr/bin/rake.lock /usr/bin/rdbg.lock /usr/bin/racc.lock /usr/bin/rdoc.lock /usr/bin/bundler.lock /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem /usr/bin/bundle.lock /usr/bin/erb.lock /usr/bin/irb.lock /usr/bin/rbs.lock /usr/bin/ri.lock"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so.3.3.4 moved to /usr/lib/libruby.so.3.3.5
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem
  /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6
  /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 moved to /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1
  /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.0 moved to /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.1
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec
  /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so.3.3.4 moved to /usr/lib/libruby.so.3.3.5
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem
  /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6
  /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 moved to /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1
  /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.0 moved to /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.1
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec
  /usr/bin/bundle.lock was added
  /usr/bin/bundler.lock was added
  /usr/bin/erb.lock was added
  /usr/bin/irb.lock was added
  /usr/bin/racc.lock was added
  /usr/bin/rake.lock was added
  /usr/bin/rbs.lock was added
  /usr/bin/rdbg.lock was added
  /usr/bin/rdoc.lock was added
  /usr/bin/ri.lock was added
  /usr/bin/syntax_suggest.lock was added
  /usr/bin/typeprof.lock was added
  /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb was added

--===============4348472746961229882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.4.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 11163288 to 11166696 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.3.3.4", added "/usr/lib/.debug/libruby.so.3.3.5"
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1580222 to 1580288 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 18149641 to 18160550 (+0%)
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_local_server.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_s3.rb /usr/lib/ruby/ptest/test/rubygems/test_gem_remote_fetcher_local_ssl_server.rb /usr/lib/ruby/ptest/test/test_bundled_gems.rb"
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-src: PKGSIZE changed from 38230034 to 38230883 (+0%)
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.3.4" to "3.3.5"
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 26918936 to 26945034 (+0%)
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.3.4 [default] to 3.3.5 [default]
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/light -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/light, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/formatters -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/formatters, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss/dublincore -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/dublincore, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.
 0/lib/rss/content -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/content, directory renamed /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11/exe -> /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss/maker -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss/maker, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml/tasks/rdoc -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/rdoc, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/doc/rexml/tasks/tocs -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/tocs, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/dtd -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/dtd, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0/lib/rss -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1/lib/rss, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/parsers -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.
 6/lib/rexml/parsers, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 -> /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8/lib/rexml/validation -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/validation, removed "/usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec /usr/lib/libruby.so.3.3.4 /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem", added "/usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec /usr/bin/bundle.lock /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb /usr/lib/libruby.so.3.3.5 /usr/li
 b/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec /usr/bin/bundler.lock /usr/bin/irb.lock /usr/bin/erb.lock /usr/bin/rbs.lock /usr/bin/syntax_suggest.lock /usr/bin/ri.lock /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem /usr/bin/racc.lock /usr/bin/rake.lock /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec /usr/bin/rdbg.lock /usr/bin/rdoc.lock /usr/bin/typeprof.lock"
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.3.4" to "3.3.5"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so.3.3.4 moved to /usr/lib/libruby.so.3.3.5
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem
  /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6
  /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 moved to /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1
  /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.0 moved to /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.1
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec
  /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb was added
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.4 to libruby.so.3.3.5
  /usr/lib/libruby.so.3.3.4 moved to /usr/lib/libruby.so.3.3.5
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.2.8.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem
  /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.0.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rss-0.3.1.gem
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.2.8 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6
  /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.0 moved to /usr/lib/ruby/gems/3.3.0/gems/rss-0.3.1
  /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.0 moved to /usr/lib/ruby/gems/3.3.0/gems/uri-0.13.1
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.11.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/uri-0.13.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.2.8.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rss-0.3.1.gemspec
  /usr/bin/bundle.lock was added
  /usr/bin/bundler.lock was added
  /usr/bin/erb.lock was added
  /usr/bin/irb.lock was added
  /usr/bin/racc.lock was added
  /usr/bin/rake.lock was added
  /usr/bin/rbs.lock was added
  /usr/bin/rdbg.lock was added
  /usr/bin/rdoc.lock was added
  /usr/bin/ri.lock was added
  /usr/bin/syntax_suggest.lock was added
  /usr/bin/typeprof.lock was added
  /usr/lib/ruby/3.3.0/bundler/compact_index_client/parser.rb was added

--===============4348472746961229882==--

