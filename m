Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358A2C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:40:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3779.1784007593187500346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IDfe7Udr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SePLR+Pk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f5f238944-eb215c3c-3eb1-423d-8325-16b17c0eb16f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784007592;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mQ9zbM0BlY1eYxGSyeNhvRrs++sBl6zWQ98IX3b9cBk=;
	b=IDfe7Udr9HqmaFJnKPXwRdWm2gnHMKjz2LTZO+HTkYh1VszFUFquPcQAcjAS7fpZ
	z9Vh0Z0TM9QjkWcI6LdE19ziSFcDMS+9cO53B2chanDwiL97ERKsYC1syNjf902gkMM
	ajfhVN7M6BTA78vzgrent1qlGvKLZf7JDDPecwH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784007592;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mQ9zbM0BlY1eYxGSyeNhvRrs++sBl6zWQ98IX3b9cBk=;
	b=SePLR+PkRS+OqARJwpfpK+erGS39dROIKU4jDQ3hm04GlbRd4fAMGWnc57o9iBtV
	sAUbYIDCic9sOqmPWuCcMa5vWXPCX3+8qvNq4KQO82KC2QpYAyUnx3XbgqU/E/8Rb35
	i+epKZ3sLaStqBcWuiB/7KutNIfooxZCwcYPJMsE=
Content-Type: multipart/mixed; boundary="===============4142885561254825566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.6 SUCCEEDED
Message-ID: <0101019f5f238944-eb215c3c-3eb1-423d-8325-16b17c0eb16f-000000@us-west-2.amazonses.com>
Date: Tue, 14 Jul 2026 05:39:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.14-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 05:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240867

--===============4142885561254825566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.5-4.0.6.patch
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
From c595463d5f37ef24734e961f7fdb40c4449889d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 14 Jul 2026 05:33:39 +0000
Subject: [PATCH] ruby: upgrade 4.0.5 -> 4.0.6

---
 .../0001-Don-t-save-the-original-name-and-timestamp.patch     | 2 +-
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch   | 2 +-
 ...01-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch     | 2 +-
 ...lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...5-Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 2 +-
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch           | 2 +-
 .../0007-Skip-test_rm_r_no_permissions-test-under-root.patch  | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.6.bb}   | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.6.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index b5bcfab924..f910d159d0 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
+From c7d4076da435de5788cb349a1af26b76e1b823d0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index e00ce7bb73..00735d067b 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
+From b828fec85c8001132da30d22cee8362710daaa26 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 8ae4202e60..2ab9070ffc 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
+From 0e7b4887f21883492df2741327c0954c1930e457 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index e2b4804..0b7d868 100644
+index 8558ed8..230702d 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index af4f768442..c30a3080c5 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
+From dfb8f9962e614e02d099c60a96072d9be8a8d8d1 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 5c038a50cc..e9fb35feb5 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
+From e70fd65f1c5ce63d036d8409a4447a94ce421d0b Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 0ba10724cb..526485ba0e 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
+From 8e6001ddb1ba2e5be1b55f375834042f87aea92e Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 4a10f861dc..c941126efb 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
+From 6d6783a33dade299fae39269a8a2bf6aa4bb8681 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 92439ffd7a..82d20ee1ff 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
+From 8d6b0c944cb16b2f2dad631f9c65cfb52179c386 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index cb77fffe56..045735048a 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
+From b92a8a8945559cf30289505037e92d70fc38e001 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.5.bb b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.5.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.6.bb
index a0981bf622..3e9381ba63 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39159817911c88958e"
+SRC_URI[sha256sum] = "837d299e8f7ddf2be31a229a7a7e019d354979825117989acb3b32b1a9be262a"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============4142885561254825566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.5-4.0.6.patch"

RnJvbSBjNTk1NDYzZDVmMzdlZjI0NzM0ZTk2MWY3ZmRiNDBjNDQ0OTg4OWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTQgSnVsIDIwMjYgMDU6MzM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC41IC0+IDQuMC42CgotLS0KIC4uLi8wMDAxLURvbi10LXNhdmUtdGhl
LW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCAgICAgfCAyICstCiAuLi4vMDAwMS1l
eHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCAgIHwgMiAr
LQogLi4uMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNj
di5wYXRjaCB8IDQgKystLQogLi4uL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhl
LWxpbmstb2YtbGlicnVieS5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1y
ZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCAgICAgfCAyICstCiAuLi5saWItbWttZi5y
Yi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgMiArLQog
Li4uNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5w
YXRjaCB8IDIgKy0KIC4uLi9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJs
ZS5wYXRjaCAgICAgICAgICAgfCAyICstCiAuLi4vMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJt
aXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggIHwgMiArLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1Ynkve3J1YnlfNC4wLjUuYmIgPT4gcnVieV80LjAuNi5iYn0gICB8IDIgKy0KIDEwIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC41LmJiID0+IHJ1YnlfNC4wLjYuYmJ9
ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAx
LURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1u
YW1lLWFuZC10aW1lc3RhbXAucGF0Y2gKaW5kZXggYjViY2ZhYjkyNC4uZjkxMGQxNTlkMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUt
dGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQt
dGltZXN0YW1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlZmQzYTZkMGYwY2VmNGIyMzEz
YTEwNmYxYTAwZTdkNGE1OTdkNTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjN2Q0
MDc2ZGE0MzVkZTU3ODhjYjM0OWExYWYyNmI3NmUxYjgyM2QwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERh
dGU6IEZyaSwgMjcgRmViIDIwMjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9u
J3Qgc2F2ZSB0aGUgb3JpZ2luYWwgbmFtZSBhbmQgdGltZXN0YW1wCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0
aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0
Y2gKaW5kZXggZTAwY2U3YmI3My4uMDA3MzVkMDY3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1l
eHRlcm5hbC1nZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gN2MxZjExNDE2NDk5Y2U3Y2QxZTY4NzQ4NDBkZjI0OThlOTIy
YWI3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjgyOGZlYzg1YzgwMDExMzJkYTMw
ZDIyY2VlODM2MjcxMGRhYWEyNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRG
LTg/cT9BbmRyPUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRl
OiBNb24sIDMwIFNlcCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1r
OiBmaXggY3Jvc3MtY29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1Mx
LWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVz
bC1yaXNjdi5wYXRjaAppbmRleCA4YWU0MjAyZTYwLi4yYWI5MDcwZmZjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdf
UzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1m
b3ItbXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGI2NjY4MmRiODdhOTJk
MjBjNWVmMGEwMGVhNmVlZjQxNTI2ZDBjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGU3YjQ4ODdmMjE4ODM0OTJkZjI3NDEzMjdjMDk1NGMxOTMwZTQ1NyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUs
IDI1IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzog
RGVmaW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CkBAIC0xNCw3ICsxNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdm1fZHVtcC5jIGIvdm1fZHVt
cC5jCi1pbmRleCBlMmI0ODA0Li4wYjdkODY4IDEwMDY0NAoraW5kZXggODU1OGVkOC4uMjMwNzAy
ZCAxMDA2NDQKIC0tLSBhL3ZtX2R1bXAuYwogKysrIGIvdm1fZHVtcC5jCiBAQCAtNDAsNiArNDAs
MTEgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1P
YmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJy
dWJ5LnBhdGNoCmluZGV4IGFmNGY3Njg0NDIuLmMzMGEzMDgwYzUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5r
LW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZTFjYjcwNmE4NjUzYzYzMjQxOTgwM2Y4ZDM2ZjNkZDJkNzg3ZmFjZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGZiOGY5OTYyZTYxNGUwMmQwOTljNjBhOTYwNzJk
OWJlOGE4ZDhkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExh
cnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6
NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBv
ZiBsaWJydWJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1
bWVudGF0aW9uLnBhdGNoCmluZGV4IDVjMDM4YTUwY2MuLmU5ZmIzNWZlYjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVj
aWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA4NDc2OTUzYjczNWZhYmFkODU3ZGRmZTc4ZGQzZmZjYmVmNDAy
OGM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNzBmZDY1ZjFjNWNlNjNkMDM2ZDg0
MDlhNDQ0N2E5NGNlNDIxZDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0
aWFuIEhvZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAx
NyAxNTowNDozNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2li
bGUgZG9jdW1lbnRhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJh
dGVkLU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1r
bWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAppbmRl
eCAwYmExMDcyNGNiLi41MjY0ODViYTBlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1p
bi1nZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQt
TS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZhNmQ0MGQxZjdlZWQ1YmU5ODFjMDM0YzNm
MzZiZDRhM2I1ZWZhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGU2MDAxZGRiMWJh
MmU1YmUxYjU1ZjM3NTgzNDA0MmY4N2FlYTkyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1oLmRlPgogRGF0ZTogVHVlLCAxMCBP
Y3QgMjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBsaWIvbWttZi5yYjogc29y
dCBsaXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0ZWQgTWFrZWZpbGUKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9k
dWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhp
bmctNzg0MjI1LXRvby5wYXRjaAppbmRleCA0YTEwZjg2MWRjLi5jOTQxMTI2ZWZiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJl
cHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hh
bmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNjUzODFi
YzYxNmZhMjgxYTU4YjM3NjFjMzM2MjBjNDY1ODg0Y2E4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2ZDY3ODNhMzNkYWRlMjk5ZmFlMzkyNjlhOGEyYmY2YWE0YmI4NjgxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFu
Lm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVw
cm9kdWNpYmxlLnBhdGNoCmluZGV4IDkyNDM5ZmZkN2EuLjgyZDIwZWUxZmYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJv
ZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYt
TWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQw
MjM2ZDE2YjY0MGIwYzUyMmE1NTBiNjI4Y2JmYjZlZTBjZGM5NzIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDhkNmIwYzk0NGNiMTZiMmYyZGFkNjMxZjljNjVjZmI1MjE3OWMzODYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0Bk
ZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lv
bnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRj
aAppbmRleCBjYjc3ZmZmZTU2Li4wNDU3MzUwNDhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVz
dC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGNjYjQwYjQ3MTVhYmZiNmM1M2Q0MzFiZjQyMWNjZmJjZGJj
NGZmOTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI5MmE4YTg5NDU1NTljZjMwMjg5
NTA1MDM3ZTkyZDcwZmMzOGUwMDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKaWF5
aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCA3IEp1
bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgdGVzdF9ybV9yX25v
X3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieV80LjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnlfNC4wLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieV80LjAuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieV80LjAuNi5iYgppbmRleCBhMDk4MWJmNjIyLi4zZTkzODFiYTYzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC41LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjYuYmIKQEAgLTQ4LDcgKzQ4LDcgQEAg
ZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIg
bGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZDYxNDkwNzlhNjNmOGFlMWQz
MjZjOWZhNjVjNjAxOWJhMmRjMzE1NWVhZTdiMzkxNTk4MTc5MTFjODg5NThlIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjgzN2QyOTllOGY3ZGRmMmJlMzFhMjI5YTdhN2UwMTlkMzU0OTc5ODI1MTE3
OTg5YWNiM2IzMmIxYTliZTI2MmEiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09O
RklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9
IgotLSAKMi40Ny4xCgo=

--===============4142885561254825566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/mldsa65_ca_cert.pem /usr/lib/ruby/ptest/test/rubygems/mldsa65_ssl_key.pem /usr/lib/ruby/ptest/test/rubygems/local_ssl_server_utilities.rb /usr/lib/ruby/ptest/test/rubygems/mldsa65_ssl_cert.pem /usr/lib/ruby/ptest/test/rubygems/mldsa65_client.pem"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2 -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1, directory renamed /usr/lib/ruby/gems/4.0.
 0/gems/net-imap-0.6.2/lib/net/imap/stringprep -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.0.gemspec /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.2.gem /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.1.gemspec /usr/lib/libruby.so.4.0.5 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib/tsort.rb /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.2.gemspec
 ", added "/usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.2.gemspec /usr/lib/ruby/4.0.0/bundler/plugin/unloaded_source.rb /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.2.gemspec /usr/lib/libruby.so.4.0.6 /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.4.1.gem /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.4.1.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.5 to libruby.so.4.0.6
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.5 to libruby.so.4.0.6
  /usr/lib/libruby.so.4.0.5 moved to /usr/lib/libruby.so.4.0.6
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16
  /usr/lib/ruby/gems/4.0.0/gems/error_highlight-0.7.1 moved to /usr/lib/ruby/gems/4.0.0/gems/error_highlight-0.7.2
  /usr/lib/ruby/gems/4.0.0/gems/openssl-4.0.0 moved to /usr/lib/ruby/gems/4.0.0/gems/openssl-4.0.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.1.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.2.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.2.gemspec
  /usr/lib/ruby/4.0.0/bundler/plugin/unloaded_source.rb was added
  /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.4.1.gem was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1 was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/BSDL was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/COPYING was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs/styles.css was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/Gemfile was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/authenticators.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/command_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_accessors.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_inheritance.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_type_coercion.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_version_defaults.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/data_encoding.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/deprecated_client_options.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/errors.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/esearch_result.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/fetch_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/flags.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser/parser_utils.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_reader.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl_adapter.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/anonymous_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/authentication_exchange.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/authenticators.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/client_adapter.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/cram_md5_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/digest_md5_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/external_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/gs2_header.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/login_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/oauthbearer_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/plain_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/protocol_adapters.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/scram_algorithm.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/scram_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/stringprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/xoauth2_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/search_result.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sequence_set.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/nameprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/saslprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/saslprep_tables.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/tables.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/trace.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/uidplus_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/vanished_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/LICENSE.txt was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/Rakefile was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/benchmarks.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/rdoc.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/rfcs.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/saslprep.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/string_prep_tables_generator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/README.md was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample/net-imap.rb was added
  /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.4.1.gemspec was added
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort was removed
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib was removed
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib/tsort.rb was removed
  /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.2.gem was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2 was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/BSDL was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/COPYING was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs/styles.css was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/Gemfile was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/authenticators.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/command_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_accessors.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_inheritance.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_type_coercion.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_version_defaults.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/connection_state.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/data_encoding.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/deprecated_client_options.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/errors.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/esearch_result.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/fetch_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/flags.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser/parser_utils.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_reader.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl_adapter.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/anonymous_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/authentication_exchange.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/authenticators.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/client_adapter.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/cram_md5_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/digest_md5_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/external_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/gs2_header.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/login_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/oauthbearer_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/plain_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/protocol_adapters.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/scram_algorithm.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/scram_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/stringprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/xoauth2_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/search_result.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sequence_set.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/nameprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/saslprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/saslprep_tables.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/tables.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/trace.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/uidplus_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/vanished_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/LICENSE.txt was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/Rakefile was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/benchmarks.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/rdoc.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/rfcs.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/saslprep.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/string_prep_tables_generator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/README.md was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample/net-imap.rb was removed
  /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.2.gemspec was removed
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/pccritic was removed
  /usr/bin/spdxtool was removed

--===============4142885561254825566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.6.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera
 ted-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch"
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.5", added "/usr/lib/.debug/libruby.so.4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18129088 to 18155720 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/mldsa65_ca_cert.pem /usr/lib/ruby/ptest/test/rubygems/mldsa65_ssl_key.pem /usr/lib/ruby/ptest/test/rubygems/mldsa65_client.pem /usr/lib/ruby/ptest/test/rubygems/local_ssl_server_utilities.rb /usr/lib/ruby/ptest/test/rubygems/mldsa65_ssl_cert.pem"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10267138 to 10351033 (+1%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.5/ext/io/nonblock -> /usr/src/debug/ruby/4.0.6/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.5/ext/erb/escape -> /usr/src/debug/ruby/4.0.6/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.5/gc -> /usr/src/debug/ruby/4.0.6/gc, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/fiber -> /usr/src/debug/ruby/4.0.6/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.5/ext/strscan -> /usr/src/debug/ruby/4.0.6/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.5/ext/json/simd -> /usr/src/debug/ruby/4.0.6/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.5/ext/date -> /usr/src/debug/ruby/4.0.6/ext/date, directory renamed /usr/src/debug/ruby/4.0.5 -> /usr/src/debug/ruby/4.0.6, directory renamed /usr/src/debug/ruby/4.0.5/defs -> /usr/src/debug/ruby/4.0.6/defs, directory renamed /usr/src/debug/ruby/4.0.5/ext/ripper -> /usr/src/debug/ruby/4.0.6/ext/rip
 per, directory renamed /usr/src/debug/ruby/4.0.5/ext/io/wait -> /usr/src/debug/ruby/4.0.6/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.5/ext/cgi/escape -> /usr/src/debug/ruby/4.0.6/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.5/ext/psych -> /usr/src/debug/ruby/4.0.6/ext/psych, directory renamed /usr/src/debug/ruby/4.0.5/ext/stringio -> /usr/src/debug/ruby/4.0.6/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.5/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.6/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/io -> /usr/src/debug/ruby/4.0.6/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.5/ext/objspace -> /usr/src/debug/ruby/4.0.6/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.6/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.5/internal -> /usr/src/debug/ruby/4.0.6/internal, directory renamed /usr/src/debug/ruby/4.0.5/ext/zl
 ib -> /usr/src/debug/ruby/4.0.6/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.5/ext/socket -> /usr/src/debug/ruby/4.0.6/ext/socket, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby -> /usr/src/debug/ruby/4.0.6/include/ruby, directory renamed /usr/src/debug/ruby/4.0.5/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.6/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.5/enc -> /usr/src/debug/ruby/4.0.6/enc, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest/md5 -> /usr/src/debug/ruby/4.0.6/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.5/prism -> /usr/src/debug/ruby/4.0.6/prism, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.6/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.5/enc/trans -> /usr/src/debug/ruby/4.0.6/
 enc/trans, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.6/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.5/ccan/list -> /usr/src/debug/ruby/4.0.6/ccan/list, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.6/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.6/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.5/ext/etc -> /usr/src/debug/ruby/4.0.6/ext/etc, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.6/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.5/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.6/p
 rism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.5/missing -> /usr/src/debug/ruby/4.0.6/missing, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.5/gc/default -> /usr/src/debug/ruby/4.0.6/gc/default, directory renamed /usr/src/debug/ruby/4.0.5/ext/pty -> /usr/src/debug/ruby/4.0.6/ext/pty, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest -> /usr/src/debug/ruby/4.0.6/ext/digest, directory renamed /usr/src/debug/ruby/4.0.5/include/ruby/internal -> /usr/src/debug/ruby/4.0.6/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.5/enc/jis -> /usr/src/debug/ruby/4.0.6/enc/jis, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /
 usr/src/debug/ruby/4.0.6/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.5/ext/coverage -> /usr/src/debug/ruby/4.0.6/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.6/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.5/ext/json/parser -> /usr/src/debug/ruby/4.0.6/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.5/ext/json/vendor -> /usr/src/debug/ruby/4.0.6/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.6/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.6/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.5/ext/continuation -> /usr/src/debug/ruby/4.0.6/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.
 10.0/src, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.6/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0.5/ext -> /usr/src/debug/ruby/4.0.6/ext, directory renamed /usr/src/debug/ruby/4.0.5/prism/templates/src -> /usr/src/debug/ruby/4.0.6/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.5/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.6/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.6/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.5/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.6/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.5/ext/json/generator -> /usr/src/debug/ruby/4.0.6/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.5/coroutine/amd64 -> /usr/src/debug/ruby/4.0.6/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.5/ext/rbconfig/sizeof -> /usr/s
 rc/debug/ruby/4.0.6/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.6/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.6/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.5/ext/io/console -> /usr/src/debug/ruby/4.0.6/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.5/ext/monitor -> /usr/src/debug/ruby/4.0.6/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.6/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.5/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.6/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.5/prism/util -> /usr/src/debug/ruby/4.0.6/prism/util, directory renamed /usr/src/debug/ruby/4.0.5/ext/fcntl -> /usr/src/debug/
 ruby/4.0.6/ext/fcntl, removed "/usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509crl.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey_rsa.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509req.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkcs12.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_asn1.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_hmac.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_kdf.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ocsp.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_asn1.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_hmac.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_kdf.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ocsp.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkcs12.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey_dh.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_rand.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ts.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509.c /us
 r/src/debug/ruby/4.0.5/ext/openssl/ossl_x509attr.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ssl.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_bio.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509ext.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ssl.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_bio.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_digest.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkcs7.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509name.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509store.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_digest.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkcs7.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_cipher.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_cipher.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_bn.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_rand.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ts.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_bn.c /usr/src/debug/ruby/4.0.5/ext/openssl/o
 ssl.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509cert.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ns_spki.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_engine.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey_ec.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_provider.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ns_spki.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_provider.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_engine.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509revoked.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_config.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_ssl_session.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_x509.h /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_pkey_dsa.c /usr/src/debug/ruby/4.0.5/ext/openssl/ossl_config.c", added "/usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey_ec.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509ext.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509attr.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_engine.c /usr/src/debug/ruby/4.0
 .6/ext/openssl/ossl.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkcs12.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey_dh.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_provider.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_engine.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkcs12.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_provider.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_kdf.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509crl.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ns_spki.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ssl.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ns_spki.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509name.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_kdf.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ssl.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkcs7.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkcs7.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_bn.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509revoked
 .c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509cert.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_digest.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_bn.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ssl_session.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_digest.c /usr/src/debug/ruby/4.0.6/ext/openssl/openssl_missing.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_cipher.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_cipher.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509store.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_config.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_bio.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_config.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey_rsa.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey_dsa.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509req.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_bio.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ts.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ocsp.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey.c /usr/
 src/debug/ruby/4.0.6/ext/openssl/ossl_rand.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_hmac.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_asn1.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_hmac.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ocsp.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_pkey.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_rand.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_ts.c /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_x509.h /usr/src/debug/ruby/4.0.6/ext/openssl/ossl_asn1.c"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40714378 to 40760386 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1
 /lib/net/imap/response_parser, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2 -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1, directory renamed /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl -> /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.0.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.2.gem /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib/tsort.rb /usr/lib/libruby.so.4.0.5 /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.1.gemspec /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.2.gemspec
 ", added "/usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.2.gemspec /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.4.1.gem /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec /usr/lib/ruby/4.0.0/bundler/plugin/unloaded_source.rb /usr/lib/libruby.so.4.0.6 /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.4.1.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.2.gemspec"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35616581 to 35698977 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.5" to "4.0.6"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.5 [default] to 4.0.6 [default]
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.5 to libruby.so.4.0.6
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.5 to libruby.so.4.0.6
  /usr/lib/libruby.so.4.0.5 moved to /usr/lib/libruby.so.4.0.6
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16
  /usr/lib/ruby/gems/4.0.0/gems/error_highlight-0.7.1 moved to /usr/lib/ruby/gems/4.0.0/gems/error_highlight-0.7.2
  /usr/lib/ruby/gems/4.0.0/gems/openssl-4.0.0 moved to /usr/lib/ruby/gems/4.0.0/gems/openssl-4.0.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.1.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/error_highlight-0.7.2.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/openssl-4.0.2.gemspec
  /usr/lib/ruby/4.0.0/bundler/plugin/unloaded_source.rb was added
  /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.4.1.gem was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1 was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/BSDL was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/COPYING was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/docs/styles.css was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/Gemfile was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/authenticators.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/command_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_accessors.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_inheritance.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_type_coercion.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config/attr_version_defaults.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/config.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/connection_state.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/data_encoding.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/deprecated_client_options.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/errors.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/esearch_result.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/fetch_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/flags.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser/parser_utils.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_parser.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/response_reader.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl_adapter.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/anonymous_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/authentication_exchange.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/authenticators.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/client_adapter.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/cram_md5_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/digest_md5_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/external_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/gs2_header.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/login_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/oauthbearer_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/plain_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/protocol_adapters.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/scram_algorithm.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/scram_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/stringprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sasl/xoauth2_authenticator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/search_result.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/sequence_set.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/nameprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/saslprep.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/saslprep_tables.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/tables.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/stringprep/trace.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/uidplus_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/lib/net/imap/vanished_data.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/LICENSE.txt was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/Rakefile was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/benchmarks.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/rdoc.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/rfcs.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/saslprep.rake was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/rakelib/string_prep_tables_generator.rb was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/README.md was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample was added
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.4.1/sample/net-imap.rb was added
  /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.4.1.gemspec was added
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort was removed
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib was removed
  /usr/lib/ruby/4.0.0/bundler/vendor/tsort/lib/tsort.rb was removed
  /usr/lib/ruby/gems/4.0.0/cache/net-imap-0.6.2.gem was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2 was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/BSDL was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/COPYING was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/docs/styles.css was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/Gemfile was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/authenticators.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/command_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_accessors.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_inheritance.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_type_coercion.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config/attr_version_defaults.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/config.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/connection_state.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/data_encoding.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/deprecated_client_options.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/errors.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/esearch_result.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/fetch_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/flags.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser/parser_utils.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_parser.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/response_reader.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl_adapter.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/anonymous_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/authentication_exchange.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/authenticators.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/client_adapter.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/cram_md5_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/digest_md5_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/external_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/gs2_header.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/login_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/oauthbearer_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/plain_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/protocol_adapters.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/scram_algorithm.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/scram_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/stringprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sasl/xoauth2_authenticator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/search_result.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/sequence_set.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/nameprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/saslprep.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/saslprep_tables.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/tables.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/stringprep/trace.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/uidplus_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/lib/net/imap/vanished_data.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/LICENSE.txt was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/Rakefile was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/benchmarks.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/rdoc.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/rfcs.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/saslprep.rake was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/rakelib/string_prep_tables_generator.rb was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/README.md was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample was removed
  /usr/lib/ruby/gems/4.0.0/gems/net-imap-0.6.2/sample/net-imap.rb was removed
  /usr/lib/ruby/gems/4.0.0/specifications/net-imap-0.6.2.gemspec was removed
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/pccritic was removed
  /usr/bin/spdxtool was removed

--===============4142885561254825566==--

