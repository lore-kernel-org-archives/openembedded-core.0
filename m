Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B24C54E83
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1303.1721071146400217605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Kb/S+Mza;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2wNtl6R9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d59292-c70371b8-f339-486b-ba84-fb6bba77714e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FFOm9NX1WTAV6y4mj7vXu5WgWV+K60m162Hv21IDJHI=;
	b=Kb/S+MzafO/ZZdTtG1zJz3WkoQwcu9LCt5U1sB1HxO/g4+Hj2L5C/83wFMY0qANX
	pDiD9l6MoRDbBweZYtUzkkDtGGtTKA7vMaIYqYxf2p6LZ5rL7Yf7khXwesueilm+wKc
	wKROm1Yp/fV/CEu6httHdF8xsCCCHlOM263/5Cc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FFOm9NX1WTAV6y4mj7vXu5WgWV+K60m162Hv21IDJHI=;
	b=2wNtl6R9GbeIhdAH6xgAYFm+X7juzV5rGnI3VFGFNzWYjO2KXJiXgZyks8JlHoH7
	7/nDci7A49I0T/QlFh6NXqeGPC7kNGNxKS48aaAYf3tUf92gC3+cG+USDeHAPHs8vgJ
	2k9V6RcV0q+VWWGMZp/8C8i9Bk0n8Dg1VMi00NxY=
Content-Type: multipart/mixed; boundary="===============7822810191861702110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.40.2 FAILED
Message-ID: <01010190b7d59292-c70371b8-f339-486b-ba84-fb6bba77714e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201964

--===============7822810191861702110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.40.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.40.1-2.40.2.patch
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
From 8e5eeb0dac64e381cf3fdcb13a64884065932ef9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 08:15:46 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.40.1 -> 2.40.2

---
 ...linux-libuuid_2.40.1.bb => util-linux-libuuid_2.40.2.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                 | 2 +-
 .../util-linux/util-linux/avoid_parallel_tests.patch        | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch           | 4 ++--
 .../util-linux/display_testname_for_subtest.patch           | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch         | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.1.bb => util-linux-libuuid_2.40.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0f5f838e84..d2c1231375 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,4 +40,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
+SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 8ea00dbb95..5253fb16c8 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 90a36e0a1c89764ef086bfd66953d91e63e8211f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 651ef2b..2a8012e 100644
+index af86e1e..0375d29 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 74abdc2038..f87ec0cefd 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 609f03277bc317927daabab562b483149e399287 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23594ff..651ef2b 100644
+index 82d0e4b..af86e1e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 871b0b2d30..4d6de8bb42 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 74a50735fae5b30aa0acbf1d0dfb9248d4b6b511 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..e2086a0178 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 7a8dacb06c41b124fd4644b0bb3d805c237a8829 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 50ab8d0..7e2340d 100644
+index 54e0fd4..ee2d553 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -64,6 +64,7 @@ tmpfiles_DATA =
+@@ -65,6 +65,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
-- 
2.44.0


--===============7822810191861702110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.40.1-2.40.2.patch"

RnJvbSA4ZTVlZWIwZGFjNjRlMzgxY2YzZmRjYjEzYTY0ODg0MDY1OTMyZWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDg6MTU6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgMi40MC4xIC0+IDIuNDAuMgoKLS0tCiAuLi5saW51
eC1saWJ1dWlkXzIuNDAuMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40MC4yLmJifSB8IDAK
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMgICAgICAgICAgICAg
ICAgIHwgMiArLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaCAgICAgICAgfCA0ICsrLS0KIC4uLi91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmln
dXJlLXNiaW5kaXIucGF0Y2ggICAgICAgICAgIHwgNCArKy0tCiAuLi4vdXRpbC1saW51eC9kaXNw
bGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCAgICAgICAgIHwgNiAr
KystLS0KIDYgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgve3V0aWwtbGludXgtbGlidXVpZF8y
LjQwLjEuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuNDAuMi5iYn0gKDEwMCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40
MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRf
Mi40MC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQwLjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDAuMi5iYgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggMGY1Zjgz
OGU4NC4uZDJjMTIzMTM3NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXguaW5jCkBAIC00MCw0ICs0MCw0IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9S
fS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAg
ICAgICAgIGZpbGU6Ly9mY250bC1sb2NrLmMgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1OWU2NzZhYTUzY2NiNDRiNmMzOWYwZmZlMDFhOGZhMjc0ODkxYzkxYmVmMTQ3
NDc1MmZhZDkyNDYxZGVmMjRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3OGIzN2E2NmY1OTIy
ZDcwZWRmM2JkZmIwMWE2YjMzZDM0ZWQzYzNjYWZkNjYyODIwM2IyYTJiNjdjOGU4YjMiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFy
YWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggOGVhMDBkYmI5NS4uNTI1M2ZiMTZj
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2
b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gZGE1OGI0MTUwZjY5MzJkZTM2Yzk2MmVhNjU3NzEzYmNmNGVhNDRiZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTBhMzZlMGExYzg5NzY0ZWYwODZiZmQ2Njk1M2Q5MWU2M2U4
MjExZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3Iu
ZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogTW9uLCAxNCBKdW4gMjAyMSAxNDowMDozMSArMDIwMAog
U3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBBZGQgcHRlc3QKQEAgLTE0LDcgKzE0LDcgQEAg
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKLWluZGV4IDY1MWVmMmIuLjJhODAxMmUgMTAwNjQ0CitpbmRleCBhZjg2ZTFlLi4w
Mzc1ZDI5IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBA
IC0xMSw3ICsxMSw3IEBAIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUt
c2JpbmRpci5wYXRjaAppbmRleCA3NGFiZGMyMDM4Li5mODdlYzBjZWZkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZp
Z3VyZS1zYmluZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzg3ZDcxNTE2Yzk3ODg5
OWNmZDU1NmNhNTEyZjUzMGEyMTJiNGE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2
MDlmMDMyNzdiYzMxNzkyN2RhYWJhYjU2MmI0ODMxNDllMzk5Mjg3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUGhpbCBCbHVuZGVsbCA8cGJAcGJjbC5uZXQ+CiBEYXRlOiBNb24sIDI0
IFNlcCAyMDEyIDA3OjI0OjUxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEVu
c3VyZSB0aGF0ICR7c2JpbmRpcn0gaXMgcmVzcGVjdGVkCkBAIC0xNCw3ICsxNCw3IEBAIFVwc3Ry
ZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1
cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDIzNTk0ZmYuLjY1MWVmMmIgMTAwNjQ0CitpbmRl
eCA4MmQwZTRiLi5hZjg2ZTFlIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25m
aWd1cmUuYWMKIEBAIC0xMTAsNyArMTEwLDEwIEBAIEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxh
eV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCmluZGV4IDg3
MWIwYjJkMzAuLjRkNmRlOGJiNDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1l
X2Zvcl9zdWJ0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTQ1MGQwMzM5Y2Q3ZWUy
N2Y1M2MwZjJmYWMxY2M3NGVkOWJiZmI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
NGE1MDczNWZhZTViMzBhYTBhY2JmMWQwZGZiOTI0OGQ0YjZiNTExIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRl
OiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzcGxh
eSB0ZXN0bmFtZSBmb3Igc3VidGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCmluZGV4IDczNDU5MjZiODguLmUyMDg2YTAxNzgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVz
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRl
c3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5YmU3M2MzZTJiMGE0ZjA5MjM5NTBkY2Iw
NThiZTg1ZDNlZThlZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdhOGRhY2IwNmM0
MWIxMjRmZDQ2NDRiMGJiM2Q4MDVjMjM3YTg4MjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBE
ZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBEZWZpbmUgVEVTVFMgdmFy
aWFibGUKQEAgLTEwLDEwICsxMCwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIv
TWFrZWZpbGUuYW0KLWluZGV4IDUwYWI4ZDAuLjdlMjM0MGQgMTAwNjQ0CitpbmRleCA1NGUwZmQ0
Li5lZTJkNTUzIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1A
QCAtNjQsNiArNjQsNyBAQCB0bXBmaWxlc19EQVRBID0KK0BAIC02NSw2ICs2NSw3IEBAIHRtcGZp
bGVzX0RBVEEgPQogIGRpc3RfYmFzaGNvbXBsZXRpb25fREFUQSA9CiAgY2hlY2tfUFJPR1JBTVMg
PQogIGRpc3RfY2hlY2tfU0NSSVBUUyA9Ci0tIAoyLjQ0LjAKCg==

--===============7822810191861702110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (916 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-969c1df084a7ffaa518467108605900f10c80063"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:969c1df084a7ffaa518467108605900f10c80063"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 148 Local 107 Mirrors 0 Missed 41 Current 148 (72% match, 86% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch core2-64...done.
Removing 11 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 172 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 173 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 178 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 179 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 180 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 202 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 220 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 221 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 222 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 223 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 225 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 256 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 257 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 285 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running task 196 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: Running task 278 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 464 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa)
NOTE: Running task 475 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running task 477 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running task 493 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 290 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 291 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 494 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 495 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_fetch)
NOTE: Running task 496 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 497 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_recipe_qa: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 509 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 545 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Started
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Started
NOTE: Running task 546 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_recipe_qa: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 577 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 594 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running noexec task 616 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: Running noexec task 644 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 647 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 648 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: Running setscene task 292 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 294 of 296 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: Running task 649 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa unihash changed to 1f02a07bb2015aa4a2c56257f006a022858101f9d356c1f0cbcc82f169c7c680
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 650 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: Running task 651 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 652 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running task 655 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_fetch)
NOTE: Running task 656 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: Running task 657 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 658 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 660 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
WARNING: util-linux-native-2.40.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.40.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz_bad-checksum_59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f
NOTE: Running task 663 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 702 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 713 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 714 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 716 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
WARNING: util-linux-native-2.40.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz - will attempt other sources if available
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 719 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 721 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 725 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_fetch)
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 728 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 729 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
WARNING: util-linux-native-2.40.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.40.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz_bad-checksum_59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 732 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: Running task 733 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_configure: Started
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 734 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 735 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 736 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_lic)
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 899 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 740 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 743 of 899 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_fetch: Failed
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 743 tasks of which 692 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715081511.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715081511.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.40.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz
ERROR: util-linux-native-2.40.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz\' has sha256 checksum \'59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f\' when \'d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.1/temp/log.do_fetch.3776739
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_fetch) failed with exit code '1'

--===============7822810191861702110==--

