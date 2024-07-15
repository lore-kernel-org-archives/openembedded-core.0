Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9EC54E71
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1301.1721071146295337061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UCLOcErq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kJY+LTyV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190b7d5921b-9d2cb2d2-e1af-4268-a00a-05191051081e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L6xWVTEpAuGDbWqRyZN4c7b+bKLjMummjHFsFGUJOQw=;
	b=UCLOcErq4f6YM97WKrfgqqp55nVclssk5gQkb/s9lMc6CItGKtuF0umQ/xNyEk5r
	6djegW/AGgbgZue44Y839hXUjx8KsXAgao7rO/KXd1GdZjlHzZNr/GX3RS6xjRaGqY3
	rF6ywMkXrwrt+0HCYA/ATinQostsfOfcV6b0fzwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L6xWVTEpAuGDbWqRyZN4c7b+bKLjMummjHFsFGUJOQw=;
	b=kJY+LTyVQPv2itTzBcOLu2f8fD2H5nxxs3+Pn1/JOFDrKldfoglnneKI0/0zZKWQ
	jJTGdInKWCGhyfgIXTaKuSfMzMoy+4M434REvYZkKqrV8GWHjTFyxaK/bQjbr8X9HKP
	tVxAj4uyBoWxRZn3OWUDWNjQUS4t/tv6Lvu90OtU=
Content-Type: multipart/mixed; boundary="===============7085034757431626525=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.40.2 FAILED
Message-ID: <01010190b7d5921b-9d2cb2d2-e1af-4268-a00a-05191051081e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201965

--===============7085034757431626525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.40.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.40.1-2.40.2.patch
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
From 6c786ca774157e701356a8f747d7e9a63e114146 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 08:34:11 +0000
Subject: [PATCH] util-linux: upgrade 2.40.1 -> 2.40.2

---
 meta/recipes-core/util-linux/util-linux.inc                 | 2 +-
 .../util-linux/util-linux/avoid_parallel_tests.patch        | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch           | 4 ++--
 .../util-linux/display_testname_for_subtest.patch           | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch         | 6 +++---
 .../{util-linux_2.40.1.bb => util-linux_2.40.2.bb}          | 0
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.40.1.bb => util-linux_2.40.2.bb} (100%)

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
index 8ea00dbb95..e764a0ef50 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 57f89698b65073765ceee03744dbda1691042542 Mon Sep 17 00:00:00 2001
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
index 74abdc2038..4379702399 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 591ede4546ebcd099c8ee35b358e64de4519a4ee Mon Sep 17 00:00:00 2001
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
index 871b0b2d30..87ba0e8ac5 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 1c6ff7a0e7b42e23a69efed3ab878d3d2c21a2cb Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..1bb9b7269d 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 57815105c418db4798dd7c87320e36b018a45211 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.2.bb
-- 
2.44.0


--===============7085034757431626525==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.40.1-2.40.2.patch"

RnJvbSA2Yzc4NmNhNzc0MTU3ZTcwMTM1NmE4Zjc0N2Q3ZTlhNjNlMTE0MTQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDg6MzQ6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiB1cGdyYWRlIDIuNDAuMSAtPiAyLjQwLjIKCi0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4v
dXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICB8
IDQgKystLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRj
aCAgICAgICAgICAgfCA0ICsrLS0KIC4uLi91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9y
X3N1YnRlc3QucGF0Y2ggICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoICAgICAgICAgfCA2ICsrKy0tLQogLi4uL3t1dGls
LWxpbnV4XzIuNDAuMS5iYiA9PiB1dGlsLWxpbnV4XzIuNDAuMi5iYn0gICAgICAgICAgfCAwCiA2
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4XzIuNDAuMS5iYiA9PiB1dGls
LWxpbnV4XzIuNDAuMi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC5pbmMKaW5kZXggMGY1ZjgzOGU4NC4uZDJjMTIzMTM3NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCkBAIC00MCw0ICs0MCw0IEBAIFNS
Q19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01B
Sk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAgIGZpbGU6Ly9mY250bC1sb2NrLmMgXAog
ICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OWU2NzZhYTUzY2NiNDRiNmMz
OWYwZmZlMDFhOGZhMjc0ODkxYzkxYmVmMTQ3NDc1MmZhZDkyNDYxZGVmMjRmIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImQ3OGIzN2E2NmY1OTIyZDcwZWRmM2JkZmIwMWE2YjMzZDM0ZWQzYzNjYWZk
NjYyODIwM2IyYTJiNjdjOGU4YjMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gK
aW5kZXggOGVhMDBkYmI5NS4uZTc2NGEwZWY1MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90
ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGE1OGI0MTUwZjY5MzJkZTM2Yzk2MmVh
NjU3NzEzYmNmNGVhNDRiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTdmODk2OThi
NjUwNzM3NjVjZWVlMDM3NDRkYmRhMTY5MTA0MjU0MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogTW9uLCAx
NCBKdW4gMjAyMSAxNDowMDozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBB
ZGQgcHRlc3QKQEAgLTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDY1MWVmMmIuLjJhODAx
MmUgMTAwNjQ0CitpbmRleCBhZjg2ZTFlLi4wMzc1ZDI5IDEwMDY0NAogLS0tIGEvY29uZmlndXJl
LmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMSw3ICsxMSw3IEBAIEFDX0NPTkZJR19NQUNS
T19ESVIoW200XSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAppbmRleCA3NGFiZGMyMDM4
Li40Mzc5NzAyMzk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwMzg3ZDcxNTE2Yzk3ODg5OWNmZDU1NmNhNTEyZjUzMGEyMTJiNGE5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1OTFlZGU0NTQ2ZWJjZDA5OWM4ZWUzNWIzNThlNjRk
ZTQ1MTlhNGVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbCBCbHVuZGVsbCA8
cGJAcGJjbC5uZXQ+CiBEYXRlOiBNb24sIDI0IFNlcCAyMDEyIDA3OjI0OjUxICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEVuc3VyZSB0aGF0ICR7c2JpbmRpcn0gaXMgcmVzcGVj
dGVkCkBAIC0xNCw3ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29u
ZmlndXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDIz
NTk0ZmYuLjY1MWVmMmIgMTAwNjQ0CitpbmRleCA4MmQwZTRiLi5hZjg2ZTFlIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMTAsNyArMTEwLDEwIEBA
IEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1l
X2Zvcl9zdWJ0ZXN0LnBhdGNoCmluZGV4IDg3MWIwYjJkMzAuLjg3YmEwZThhYzUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3Ru
YW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0NTQ1MGQwMzM5Y2Q3ZWUyN2Y1M2MwZjJmYWMxY2M3NGVkOWJiZmI4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYzZmZjdhMGU3YjQyZTIzYTY5ZWZlZDNhYjg3OGQz
ZDJjMjFhMmNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0
dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzcGxheSB0ZXN0bmFtZSBmb3Igc3VidGVzdApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCmlu
ZGV4IDczNDU5MjZiODguLjFiYjliNzI2OWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGY5YmU3M2MzZTJiMGE0ZjA5MjM5NTBkY2IwNThiZTg1ZDNlZThlZDcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDU3ODE1MTA1YzQxOGRiNDc5OGRkN2M4NzMyMGUzNmIwMThhNDUyMTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3Jl
YUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVj
dDogW1BBVENIXSBEZWZpbmUgVEVTVFMgdmFyaWFibGUKQEAgLTEwLDEwICsxMCwxMCBAQCBVcHN0
cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAog
ZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDUwYWI4ZDAuLjdl
MjM0MGQgMTAwNjQ0CitpbmRleCA1NGUwZmQ0Li5lZTJkNTUzIDEwMDY0NAogLS0tIGEvTWFrZWZp
bGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtNjQsNiArNjQsNyBAQCB0bXBmaWxlc19EQVRB
ID0KK0BAIC02NSw2ICs2NSw3IEBAIHRtcGZpbGVzX0RBVEEgPQogIGRpc3RfYmFzaGNvbXBsZXRp
b25fREFUQSA9CiAgY2hlY2tfUFJPR1JBTVMgPQogIGRpc3RfY2hlY2tfU0NSSVBUUyA9CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC4xLmJi
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDAuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4XzIuNDAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4XzIuNDAuMi5iYgotLSAKMi40NC4wCgo=

--===============7085034757431626525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-342e4500c9b55f4b96e0ee35d031ffb0b06fd2cb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:342e4500c9b55f4b96e0ee35d031ffb0b06fd2cb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 706 Local 263 Mirrors 0 Missed 443 Current 331 (37% match, 57% complete)
Removing 98 stale sstate objects for arch qemux86_64...done.
Removing 130 stale sstate objects for arch core2-64...done.
Removing 43 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 358 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 466 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 470 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 477 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 490 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 499 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 528 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 530 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 531 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.39+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 541 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 552 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 562 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 570 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 586 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 592 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 608 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 630 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 643 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 653 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 654 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 686 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 689 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 752 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 753 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 767 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 770 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 776 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 782 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 790 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 793 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 795 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 800 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 810 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 811 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 829 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-native-9.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 845 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.45.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 860 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 870 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-native-9.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 876 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 878 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 880 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_create_spdx_setscene)
NOTE: Running setscene task 881 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 892 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 903 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 906 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-markupsafe-native-2.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 907 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe git-native-2.45.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 917 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe bc-native-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 926 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 930 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-native-32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 935 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe bc-native-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 939 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 946 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe kmod-native-32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 964 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 966 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe perlcross-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-native-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 972 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-native-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 974 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-native-1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 976 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 978 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe curl-native-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe perlcross-native-1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-native-1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 981 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 982 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 984 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe nettle-native-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perlcross-native-1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 994 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 997 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 999 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1003 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1004 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1007 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.43.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1013 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1016 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1037 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1018 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-native-24.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1019 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/itstool/itstool_2.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1024 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1029 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-24.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1030 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1031 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-native-2.12.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe itstool-native-2.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.12.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe itstool-native-2.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 195 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_unpack)
NOTE: Running task 208 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-native-2.45.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.45.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1035 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot_setscene)
NOTE: Running task 265 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Started
NOTE: Running task 359 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa)
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 471 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 477 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 481 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running task 483 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 504 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: Running task 506 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 512 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe git-native-2.45.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 520 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: Running task 522 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 524 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 548 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_recipe_qa: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe git-native-2.45.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 550 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1037 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 551 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: Running task 552 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: recipe python3-build-native-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-24.1-r0: task do_fetch: Started
NOTE: Running task 557 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 558 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa unihash changed to c6a1106396b6960e636a3028c19013f79a94f2b9c2fd57fe11073cf41d6df2d2
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-24.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.40.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 559 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch)
NOTE: Running task 560 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_patch)
NOTE: Running task 561 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: Running task 562 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 563 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 564 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 565 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: Running task 566 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running task 567 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 568 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 569 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: Running task 594 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.1.bb:do_unpack)
NOTE: Running task 595 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
WARNING: util-linux-libuuid-native-2.40.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.40.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz_bad-checksum_59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f
NOTE: recipe python3-packaging-native-24.1-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.1-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-24.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.40.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 603 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 604 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_patch)
NOTE: Running task 606 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.1.bb:do_patch)
NOTE: Running task 607 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 630 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_patch)
NOTE: recipe util-linux-native-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 637 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.43.0.bb:do_fetch)
NOTE: Running task 638 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 640 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: Running task 642 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running task 643 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.1-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.2.1-r0: task do_patch: Started
WARNING: util-linux-libuuid-native-2.40.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz - will attempt other sources if available
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.1-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Started
NOTE: Running task 670 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.40.2-r0: task do_unpack: Started
NOTE: Running task 674 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_fetch: Succeeded
NOTE: Running task 678 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 681 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 683 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 685 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.43.0.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 686 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: Running task 725 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_fetch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_unpack: Succeeded
NOTE: Running task 726 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.43.0.bb:do_patch)
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Succeeded
NOTE: Running task 730 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 733 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe libxml2-native-2.12.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 734 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe libxml2-native-2.12.8-r0: task do_fetch: Succeeded
NOTE: Running task 736 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.43.0-r0: task do_patch: Succeeded
NOTE: Running task 740 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa)
NOTE: Running task 741 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Started
NOTE: Running task 743 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-native-2.12.8-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 744 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: Running task 748 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa unihash changed to dc85e7190dfa5a6f2492319f3a288c60ed611e20eb9df69e2f9c1cfc645036aa
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.12.8-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 749 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
WARNING: util-linux-libuuid-native-2.40.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.40.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz_bad-checksum_59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f
NOTE: Running task 750 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: Running task 751 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 752 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_patch)
NOTE: Running task 753 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch)
NOTE: Running task 754 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_patch)
NOTE: Running task 755 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 756 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: Running task 759 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 760 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.12.8-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: Running task 762 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 765 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.4.0.bb:do_fetch)
NOTE: recipe libxml2-native-2.12.8-r0: task do_patch: Succeeded
NOTE: Running task 790 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_generate_toolchain_file)
NOTE: Running task 793 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe python3-setuptools-native-69.5.1-r0: task do_patch: Succeeded
NOTE: Running task 794 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_unpack)
WARNING: util-linux-libuuid-2.40.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz - will attempt other sources if available
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Started
NOTE: recipe python3-3.12.4-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe meson-native-1.4.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 795 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 796 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe python3-3.12.4-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 798 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 799 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Succeeded
NOTE: Running task 800 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: Running task 801 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 814 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 820 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 824 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: Running task 827 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 830 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe meson-native-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.4.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 833 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe meson-native-1.4.0-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 835 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
WARNING: util-linux-libuuid-2.40.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.40.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz_bad-checksum_59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f
NOTE: recipe meson-native-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.4.0.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: Running task 842 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe meson-native-1.4.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 846 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: Running task 852 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 853 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: Running task 856 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe qemu-native-9.0.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 859 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 860 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: Running task 861 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 864 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 865 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe python3-3.12.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: Running task 866 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 872 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 875 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 880 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.12.8-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_fetch: Succeeded
NOTE: Running task 881 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: Running task 883 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: Running task 884 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: Running task 889 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 890 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: Running task 891 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: recipe libxml2-2.12.8-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_unpack)
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Started
NOTE: Running task 894 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_patch)
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Succeeded
NOTE: Running task 899 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe python3-3.12.4-r0: task do_patch: Succeeded
NOTE: Running task 904 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: Running task 906 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 908 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 909 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libxml2-2.12.8-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: Running task 926 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe libxml2-2.12.8-r0: task do_patch: Succeeded
NOTE: Running task 944 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Succeeded
NOTE: Running task 951 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_fetch)
NOTE: Running task 962 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: Running task 968 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: Running task 969 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.5-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Started
NOTE: Running task 970 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.5-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_unpack)
NOTE: Running task 973 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.5-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 975 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 992 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_fetch)
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: Running task 994 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_fetch: Started
NOTE: Running task 1007 of 2786 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: Running task 1009 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1013 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1014 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1015 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: Running task 1016 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1019 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.5-r0: task do_patch: Started
NOTE: Running task 1020 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 1022 of 2786 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_fetch: Failed
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.5-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Succeeded
NOTE: recipe qemu-native-9.0.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_fetch
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1023 tasks of which 860 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715081845.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715081845.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.40.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz
ERROR: util-linux-libuuid-native-2.40.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz\' has sha256 checksum \'59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f\' when \'d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz')
ERROR: util-linux-libuuid-2.40.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz
ERROR: util-linux-libuuid-2.40.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/downloads/util-linux-2.40.1.tar.xz\' has sha256 checksum \'59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f\' when \'d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.1/temp/log.do_fetch.3966649
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.1/temp/log.do_fetch.3969452
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch) failed with exit code '1'

--===============7085034757431626525==--

