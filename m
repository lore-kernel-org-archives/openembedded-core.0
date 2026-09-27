Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A16C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 05:16:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32514.1790486186613176541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 22:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A/uhCOrP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rY+HtY6I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0e14b063a-29b7e176-ebbe-4f10-9116-2f8b6219a789-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790486185;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=fxsK5CT6nFPPLP/KflINe8R4JYtXL5W4ytcme7LcW9Y=;
	b=A/uhCOrPu6Ls3JMR5LPhe77CMKasuMpARYl8UREqfecrv2s38Me/Mw3OlkkY4GIA
	x7EDeq6EJRbLqmA6XewqNoTUFWSb3/xUn1yZJWm9zsUxD8++1YoQtg7Hozj9U3TTjth
	P1I4ibd10HCMdRhpFbxmhiU5DL0ci6nSTeOR6MNE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790486185;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=fxsK5CT6nFPPLP/KflINe8R4JYtXL5W4ytcme7LcW9Y=;
	b=rY+HtY6ITZN/xHS2SVweNtnU+gJqIPwMNck+99e2sshwoLg7+u4tpumuwb95ygjF
	JaE92B2hYFowGLSj8vxgdom9/A+98+hgDy6AAegfGdjlAKDVYBWuS8CVFv5dyTmXD5F
	PRjO63459LY756gRz6eawWqhQM5T2NZ5LBhD+8GM=
Content-Type: multipart/mixed; boundary="===============0872200094145221223=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk-doc: upgrading to 1.37.0 SUCCEEDED
Message-ID: <010101a0e14b063a-29b7e176-ebbe-4f10-9116-2f8b6219a789-000000@us-west-2.amazonses.com>
Date: Sun, 27 Sep 2026 05:16:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.27-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 05:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246647

--===============0872200094145221223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk-doc* to *1.37.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk-doc-upgrade-1.36.1-1.37.0.patch
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
From 0ebdd1129a8385033318f3555f4ced319cfe800d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 27 Sep 2026 05:16:22 +0000
Subject: [PATCH] gtk-doc: upgrade 1.36.1 -> 1.37.0

GTK-Doc 1.37.0, 2026-09-26
==========================
- Don't annotate get_type() functions with G_GNUC_CONST.
- Build: add an option to not check for runtime dependencies at build time.
- Translation updates.
---
 ...code-paths-to-perl-python-in-scripts.patch |  2 +-
 ...an-option-to-not-check-for-runtime-d.patch | 56 -------------------
 .../gtk-doc/files/no-clobber.patch            |  2 +-
 .../gtk-doc/files/pkg-config-native.patch     |  2 +-
 .../{gtk-doc_1.36.1.bb => gtk-doc_1.37.0.bb}  |  3 +-
 5 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.36.1.bb => gtk-doc_1.37.0.bb} (90%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index c9d78145ff..1203b7e6ce 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 00a3a827aca9e053cb0d69bea50a61fece341f0f Mon Sep 17 00:00:00 2001
+From e069b394874be4a8ce55ee0e50b08deb5633b358 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch b/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
deleted file mode 100644
index 88ec64cdb3..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ffa3ed38663cc806f914691c63ca7d8fab959eef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 21 Jun 2026 11:11:04 +0200
-Subject: [PATCH] meson.build: add an option to not check for runtime
- dependencies at build time
-
-pygments and parametrized are run-time dependencies, and should
-not be enforced at build time as they are never actually used then.
-
-This is especially useful in cross-compilation, as the modules
-are checked in the python installation on the build host, and that
-has no relevance to the target environment that the build outputs
-will be executed in.
-
-https://gitlab.gnome.org/GNOME/gtk-doc/-/merge_requests/105
-Upstream-Status: Backport [link above]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build       | 9 ++++++---
- meson_options.txt | 6 ++++++
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 30f1520..e087cff 100644
---- a/meson.build
-+++ b/meson.build
-@@ -8,9 +8,12 @@ fs = import('fs')
- gnome = import('gnome')
- python = import('python')
- 
--required_python_modules = ['pygments']
--if get_option('tests')
--  required_python_modules += ['parameterized']
-+required_python_modules = []
-+if get_option('check_runtime_deps')
-+  required_python_modules = ['pygments']
-+  if get_option('tests')
-+    required_python_modules += ['parameterized']
-+  endif
- endif
- 
- python3 = python.find_installation('python3', modules: required_python_modules)
-diff --git a/meson_options.txt b/meson_options.txt
-index d44dbb4..84463b2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -21,3 +21,9 @@ option(
-   type: 'boolean', value: true,
-   description: 'Build the test suite (requires glib and the parameterized python module)'
- )
-+
-+option(
-+  'check_runtime_deps',
-+  type: 'boolean', value: true,
-+  description: 'Check for runtime dependencies during build configuration'
-+)
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index a9c7154fc4..6c92920b55 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From 01a52d8cf076e2692d947c8ed2681cb794eaa3c0 Mon Sep 17 00:00:00 2001
+From b2607b8ed3a3468fe3bae3b24577406feca1004f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index de16ea0cc6..a3bef8af8e 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 0800f184cffc837276ea65b86e4efc7942eb1d7e Mon Sep 17 00:00:00 2001
+From 2d704126396de04b99a4090e1f36ef7479748a81 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
similarity index 90%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
index dcdeebe258..52746a01f1 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
@@ -15,10 +15,9 @@ PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,glib-2.0"
 
 EXTRA_OEMESON = "-Dyelp_manual=false -Dcheck_runtime_deps=false"
 
-SRC_URI[archive.sha256sum] = "0e517a5f97069831181be177516bde8aa8b3922398f2bdb09e265d22aecadbc5"
+SRC_URI[archive.sha256sum] = "2facfb530ddcd20c03ed4758ef934e832626c393e2cacd23fc1249b7ed0e4246"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://no-clobber.patch \
-           file://0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 
-- 
2.47.1


--===============0872200094145221223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gtk-doc-changelog.txt"

GTK-Doc 1.37.0, 2026-09-26
==========================
- Don't annotate get_type() functions with G_GNUC_CONST.
- Build: add an option to not check for runtime dependencies at build time.
- Translation updates.

--===============0872200094145221223==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-doc-upgrade-1.36.1-1.37.0.patch"

RnJvbSAwZWJkZDExMjlhODM4NTAzMzMxOGYzNTU1ZjRjZWQzMTljZmU4MDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjcgU2VwIDIwMjYgMDU6MTY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGstZG9jOiB1cGdyYWRlIDEuMzYuMSAtPiAxLjM3LjAKCkdUSy1Eb2MgMS4zNy4wLCAyMDI2LTA5
LTI2Cj09PT09PT09PT09PT09PT09PT09PT09PT09Ci0gRG9uJ3QgYW5ub3RhdGUgZ2V0X3R5cGUo
KSBmdW5jdGlvbnMgd2l0aCBHX0dOVUNfQ09OU1QuCi0gQnVpbGQ6IGFkZCBhbiBvcHRpb24gdG8g
bm90IGNoZWNrIGZvciBydW50aW1lIGRlcGVuZGVuY2llcyBhdCBidWlsZCB0aW1lLgotIFRyYW5z
bGF0aW9uIHVwZGF0ZXMuCi0tLQogLi4uY29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3Jp
cHRzLnBhdGNoIHwgIDIgKy0KIC4uLmFuLW9wdGlvbi10by1ub3QtY2hlY2stZm9yLXJ1bnRpbWUt
ZC5wYXRjaCB8IDU2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9ndGstZG9jL2ZpbGVzL25vLWNs
b2JiZXIucGF0Y2ggICAgICAgICAgICB8ICAyICstCiAuLi4vZ3RrLWRvYy9maWxlcy9wa2ctY29u
ZmlnLW5hdGl2ZS5wYXRjaCAgICAgfCAgMiArLQogLi4uL3tndGstZG9jXzEuMzYuMS5iYiA9PiBn
dGstZG9jXzEuMzcuMC5iYn0gIHwgIDMgKy0KIDUgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA2MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ25v
bWUvZ3RrLWRvYy9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWFkZC1hbi1vcHRpb24tdG8tbm90LWNo
ZWNrLWZvci1ydW50aW1lLWQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRv
Yy97Z3RrLWRvY18xLjM2LjEuYmIgPT4gZ3RrLWRvY18xLjM3LjAuYmJ9ICg5MCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFyZG9j
b2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8tcGVybC1w
eXRob24taW4tc2NyaXB0cy5wYXRjaAppbmRleCBjOWQ3ODE0NWZmLi4xMjAzYjdlNmNlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1oYXJk
b2NvZGUtcGF0aHMtdG8tcGVybC1weXRob24taW4tc2NyaXB0cy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1oYXJkb2NvZGUtcGF0aHMtdG8t
cGVybC1weXRob24taW4tc2NyaXB0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDBhM2E4
MjdhY2E5ZTA1M2NiMGQ2OWJlYTUwYTYxZmVjZTM0MWYwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTA2OWIzOTQ4NzRiZTRhOGNlNTVlZTBlNTBiMDhkZWI1NjMzYjM1OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCAzMSBBdWcgMjAxNiAxNjo0NDo0NiArMDMwMAogU3ViamVj
dDogW1BBVENIXSBEbyBub3QgaGFyZG9jb2RlIHBhdGhzIHRvIHBlcmwvcHl0aG9uIGluIHNjcmlw
dHMuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLW1l
c29uLmJ1aWxkLWFkZC1hbi1vcHRpb24tdG8tbm90LWNoZWNrLWZvci1ydW50aW1lLWQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWFkZC1h
bi1vcHRpb24tdG8tbm90LWNoZWNrLWZvci1ydW50aW1lLWQucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDg4ZWM2NGNkYjMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1hZGQtYW4tb3B0aW9uLXRvLW5v
dC1jaGVjay1mb3ItcnVudGltZS1kLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTYgKzAsMCBA
QAotRnJvbSBmZmEzZWQzODY2M2NjODA2ZjkxNDY5MWM2M2NhN2Q4ZmFiOTU5ZWVmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KLURhdGU6IFN1biwgMjEgSnVuIDIwMjYgMTE6MTE6MDQgKzAyMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gbWVzb24uYnVpbGQ6IGFkZCBhbiBvcHRpb24gdG8gbm90IGNoZWNrIGZvciBydW50aW1l
Ci0gZGVwZW5kZW5jaWVzIGF0IGJ1aWxkIHRpbWUKLQotcHlnbWVudHMgYW5kIHBhcmFtZXRyaXpl
ZCBhcmUgcnVuLXRpbWUgZGVwZW5kZW5jaWVzLCBhbmQgc2hvdWxkCi1ub3QgYmUgZW5mb3JjZWQg
YXQgYnVpbGQgdGltZSBhcyB0aGV5IGFyZSBuZXZlciBhY3R1YWxseSB1c2VkIHRoZW4uCi0KLVRo
aXMgaXMgZXNwZWNpYWxseSB1c2VmdWwgaW4gY3Jvc3MtY29tcGlsYXRpb24sIGFzIHRoZSBtb2R1
bGVzCi1hcmUgY2hlY2tlZCBpbiB0aGUgcHl0aG9uIGluc3RhbGxhdGlvbiBvbiB0aGUgYnVpbGQg
aG9zdCwgYW5kIHRoYXQKLWhhcyBubyByZWxldmFuY2UgdG8gdGhlIHRhcmdldCBlbnZpcm9ubWVu
dCB0aGF0IHRoZSBidWlsZCBvdXRwdXRzCi13aWxsIGJlIGV4ZWN1dGVkIGluLgotCi1odHRwczov
L2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ3RrLWRvYy8tL21lcmdlX3JlcXVlc3RzLzEwNQotVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbbGluayBhYm92ZV0KLVNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBtZXNvbi5idWlsZCAgICAg
ICB8IDkgKysrKysrLS0tCi0gbWVzb25fb3B0aW9ucy50eHQgfCA2ICsrKysrKwotIDIgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBh
L21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDMwZjE1MjAuLmUwODdjZmYgMTAwNjQ0
Ci0tLS0gYS9tZXNvbi5idWlsZAotKysrIGIvbWVzb24uYnVpbGQKLUBAIC04LDkgKzgsMTIgQEAg
ZnMgPSBpbXBvcnQoJ2ZzJykKLSBnbm9tZSA9IGltcG9ydCgnZ25vbWUnKQotIHB5dGhvbiA9IGlt
cG9ydCgncHl0aG9uJykKLSAKLS1yZXF1aXJlZF9weXRob25fbW9kdWxlcyA9IFsncHlnbWVudHMn
XQotLWlmIGdldF9vcHRpb24oJ3Rlc3RzJykKLS0gIHJlcXVpcmVkX3B5dGhvbl9tb2R1bGVzICs9
IFsncGFyYW1ldGVyaXplZCddCi0rcmVxdWlyZWRfcHl0aG9uX21vZHVsZXMgPSBbXQotK2lmIGdl
dF9vcHRpb24oJ2NoZWNrX3J1bnRpbWVfZGVwcycpCi0rICByZXF1aXJlZF9weXRob25fbW9kdWxl
cyA9IFsncHlnbWVudHMnXQotKyAgaWYgZ2V0X29wdGlvbigndGVzdHMnKQotKyAgICByZXF1aXJl
ZF9weXRob25fbW9kdWxlcyArPSBbJ3BhcmFtZXRlcml6ZWQnXQotKyAgZW5kaWYKLSBlbmRpZgot
IAotIHB5dGhvbjMgPSBweXRob24uZmluZF9pbnN0YWxsYXRpb24oJ3B5dGhvbjMnLCBtb2R1bGVz
OiByZXF1aXJlZF9weXRob25fbW9kdWxlcykKLWRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4
dCBiL21lc29uX29wdGlvbnMudHh0Ci1pbmRleCBkNDRkYmI0Li44NDQ2M2IyIDEwMDY0NAotLS0t
IGEvbWVzb25fb3B0aW9ucy50eHQKLSsrKyBiL21lc29uX29wdGlvbnMudHh0Ci1AQCAtMjEsMyAr
MjEsOSBAQCBvcHRpb24oCi0gICB0eXBlOiAnYm9vbGVhbicsIHZhbHVlOiB0cnVlLAotICAgZGVz
Y3JpcHRpb246ICdCdWlsZCB0aGUgdGVzdCBzdWl0ZSAocmVxdWlyZXMgZ2xpYiBhbmQgdGhlIHBh
cmFtZXRlcml6ZWQgcHl0aG9uIG1vZHVsZSknCi0gKQotKwotK29wdGlvbigKLSsgICdjaGVja19y
dW50aW1lX2RlcHMnLAotKyAgdHlwZTogJ2Jvb2xlYW4nLCB2YWx1ZTogdHJ1ZSwKLSsgIGRlc2Ny
aXB0aW9uOiAnQ2hlY2sgZm9yIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGR1cmluZyBidWlsZCBjb25m
aWd1cmF0aW9uJwotKykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2Zp
bGVzL25vLWNsb2JiZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9u
by1jbG9iYmVyLnBhdGNoCmluZGV4IGE5YzcxNTRmYzQuLjZjOTI5MjBiNTUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL25vLWNsb2JiZXIucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvbm8tY2xvYmJlci5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMDFhNTJkOGNmMDc2ZTI2OTJkOTQ3YzhlZDI2ODFjYjc5NGVhYTNjMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjI2MDdiOGVkM2EzNDY4ZmUzYmFlM2IyNDU3
NzQwNmZlY2ExMDA0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBXZWQsIDIxIE1hciAyMDE4IDE0OjQ3OjI5
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGd0ay1kb2M6IGRvbid0IHJlZ2VuZXJhdGUgZ3RrLWRv
YyBpbiBkb19pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9m
aWxlcy9wa2ctY29uZmlnLW5hdGl2ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9j
L2ZpbGVzL3BrZy1jb25maWctbmF0aXZlLnBhdGNoCmluZGV4IGRlMTZlYTBjYzYuLmEzYmVmOGFm
OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL3BrZy1jb25m
aWctbmF0aXZlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL3Br
Zy1jb25maWctbmF0aXZlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwODAwZjE4NGNmZmM4
MzcyNzZlYTY1Yjg2ZTRlZmM3OTQyZWIxZDdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyZDcwNDEyNjM5NmRlMDRiOTlhNDA5MGUxZjM2ZWY3NDc5NzQ4YTgxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERh
dGU6IE1vbiwgNSBTZXAgMjAxNiAyMjoyNTo0NCArMDEwMAogU3ViamVjdDogW1BBVENIXSBVc2Ug
bmF0aXZlIHBrZy1jb25maWcgd2hlbiBsb29raW5nIGZvciBndGstZG9jLgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZ3RrLWRvY18xLjM2LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzYuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZ3RrLWRvY18xLjM3LjAuYmIKaW5k
ZXggZGNkZWViZTI1OC4uNTI3NDZhMDFmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2d0ay1kb2MvZ3RrLWRvY18xLjM2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1k
b2MvZ3RrLWRvY18xLjM3LjAuYmIKQEAgLTE1LDEwICsxNSw5IEBAIFBBQ0tBR0VDT05GSUdbdGVz
dHNdID0gIi1EdGVzdHM9dHJ1ZSwtRHRlc3RzPWZhbHNlLGdsaWItMi4wIgogCiBFWFRSQV9PRU1F
U09OID0gIi1EeWVscF9tYW51YWw9ZmFsc2UgLURjaGVja19ydW50aW1lX2RlcHM9ZmFsc2UiCiAK
LVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjBlNTE3YTVmOTcwNjk4MzExODFiZTE3NzUx
NmJkZThhYThiMzkyMjM5OGYyYmRiMDllMjY1ZDIyYWVjYWRiYzUiCitTUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9ICIyZmFjZmI1MzBkZGNkMjBjMDNlZDQ3NThlZjkzNGU4MzI2MjZjMzkzZTJj
YWNkMjNmYzEyNDliN2VkMGU0MjQ2IgogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtRG8tbm90LWhh
cmRvY29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL25vLWNsb2JiZXIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNv
bi5idWlsZC1hZGQtYW4tb3B0aW9uLXRvLW5vdC1jaGVjay1mb3ItcnVudGltZS1kLnBhdGNoIFwK
ICAgICAgICAgICAgIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcGtn
LWNvbmZpZy1uYXRpdmUucGF0Y2giCiAKLS0gCjIuNDcuMQoK

--===============0872200094145221223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dbg: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dbg: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dev: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-dev: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-doc: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-doc: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-locale: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-locale: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-src: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-src: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-staticdev: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc-staticdev: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc/gtk-doc: PKGV changed from 1.36.1 [default] to 1.37.0 [default]
packages/x86-64-v3-poky-linux/gtk-doc: PV changed from "1.36.1" to "1.37.0"
packages/x86-64-v3-poky-linux/gtk-doc: SRC_URI changed from "https://download.gnome.org/sources//gtk-doc/1.36/gtk-doc-1.36.1.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://no-clobber.patch file://0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch" to "https://download.gnome.org/sources//gtk-doc/1.37/gtk-doc-1.37.0.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://no-clobber.patch"
packages/x86-64-v3-poky-linux/gtk-doc: PKGV changed from 1.36.1 [default] to 1.37.0 [default]

--===============0872200094145221223==--

