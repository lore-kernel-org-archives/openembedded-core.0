Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB7EC83F24
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1426.1751386807841302544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YTUn7zsd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=p9ba3GG5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6c9ea31-b430a47c-82c8-49b5-9031-c1d642a7fbdd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0crEWrdO8WFLOBuylKPIWkl9iVQr3WDuPs0FL0L8m1I=;
	b=YTUn7zsdT9x9//PAuoqjfxwQi/KPO2M5l0N/yskkKsfUX7S6NyVSZEoEJXbKiZd9
	oUtzdbnVJH+idCf2AEW/U57YjHlXpxnO1KzrK8fKNmYoqxNRL0mbgBQhWVcTjlLcNCa
	JaIH7Jv+avYj7ImpP8swGAuaK9WRjsi1UK9zGq4Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0crEWrdO8WFLOBuylKPIWkl9iVQr3WDuPs0FL0L8m1I=;
	b=p9ba3GG59PkR+jx6dANom74QJ4xMBKW36/z9hx8HBpk6vOVQEBr/hd7WogjV/Nk9
	sDCM02Yc4CRweDehqRC6inBqp5/olIOpvb8K6qYBh7vDVL6ddLR2HcKC3vc3/ZtB97f
	nRJuuI3aAa0ng0psUL5Q0UuqTAO+jUZIzdeUHhxE=
Content-Type: multipart/mixed; boundary="===============7638183582564571720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.47.2 FAILED
Message-ID: <01010197c6c9ea31-b430a47c-82c8-49b5-9031-c1d642a7fbdd-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219630

--===============7638183582564571720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *e2fsprogs* to *1.47.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-e2fsprogs-upgrade-1.47.1-1.47.2.patch
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
From 4dbac8b588c2bdee8109d160f771b38c5b406fe2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:19:32 +0000
Subject: [PATCH] e2fsprogs: upgrade 1.47.1 -> 1.47.2

---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/mkdir_p.patch         |  4 +-
 .../e2fsprogs/e2fsprogs/ptest.patch           |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 +--
 .../e2fsprogs/remove.ldconfig.call.patch      |  2 +-
 ...2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} |  5 +--
 7 files changed, 9 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
deleted file mode 100644
index 01ab9d5afb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 22 Nov 2024 12:36:32 +0000
-Subject: [PATCH] libext2fs: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `e2fsprogs` fails the build so only typedef int bool
-for __STDC_VERSION__ <= 201710L (C17)
-
-    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
-    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
-      113 | typedef int bool;
-          | ^~~~~~~
-
-https://github.com/tytso/e2fsprogs/issues/202
-
-Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ext2fs/tdb.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
-index b07b2917..98dc95d8 100644
---- a/lib/ext2fs/tdb.c
-+++ b/lib/ext2fs/tdb.c
-@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
- #endif
- #endif
- 
-+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef int bool;
-+#endif
- 
- #include "tdb.h"
- 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 4cd1098597..5d1f7a8d77 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
+From df7c807f080a1b0c365d4e85b0d13576e82be64d Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index 2dbeba1095..93860eb5c0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,4 +1,4 @@
-From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
+From 2dcae87535cce2f34c56507813557441c1ac1420 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Tue, 7 Mar 2017 14:53:19 -0800
 Subject: [PATCH] e2fsprogs: expand @mkdir_p@
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 131caef3..ca448d97 100644
+index 1f676040..8be0c1e0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index f4e1057a36..27475787da 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,4 +1,4 @@
-From 25db5ac7469cedd043a04bcf49ce7553979fbb32 Mon Sep 17 00:00:00 2001
+From eb2a32a44b0a0659aa299920543e8d6e2fcc5cb1 Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
 Date: Sat, 18 Apr 2015 17:58:17 +0300
 Subject: [PATCH] e2fsprogs: add ptest
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 4ba150e27d..50c9dd0226 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
+From 5729961c87c94437fe870de673ea33556a1dc9f6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 909c1df3..0842369e 100644
+index 8acb56a4..dd150536 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2530,7 +2530,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
index 307088d42b..ba8da93f8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
@@ -1,4 +1,4 @@
-From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
+From 15b4fa741a24a2417dedf3bd3b43bddc29e38d8e Mon Sep 17 00:00:00 2001
 From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
 Date: Wed, 30 Jan 2013 15:22:04 +0200
 Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbake
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
index 022b016f12..2c4d83e8ae 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
@@ -4,14 +4,11 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-libext2fs-fix-std-c23-build-failure.patch \
-           "
-SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "b571b9b4240739a982e8bca62cfc914a3b50190a"
+SRCREV = "258a6b34ad841562bf6f4880ff748ec07ab3d5f9"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.47.1


--===============7638183582564571720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.47.1-1.47.2.patch"

RnJvbSA0ZGJhYzhiNTg4YzJiZGVlODEwOWQxNjBmNzcxYjM4YzViNDA2ZmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODoxOTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGUy
ZnNwcm9nczogdXBncmFkZSAxLjQ3LjEgLT4gMS40Ny4yCgotLS0KIC4uLi1saWJleHQyZnMtZml4
LXN0ZC1jMjMtYnVpbGQtZmFpbHVyZS5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Li1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaCB8ICAyICstCiAuLi4v
ZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rpcl9wLnBhdGNoICAgICAgICAgfCAgNCArLQogLi4uL2Uy
ZnNwcm9ncy9lMmZzcHJvZ3MvcHRlc3QucGF0Y2ggICAgICAgICAgIHwgIDIgKy0KIC4uLi9lMmZz
cHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2ggICB8ICA2ICstLQogLi4uL2UyZnNw
cm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaCAgICAgIHwgIDIgKy0KIC4uLjJmc3Byb2dz
XzEuNDcuMS5iYiA9PiBlMmZzcHJvZ3NfMS40Ny4yLmJifSB8ICA1ICstLQogNyBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzLzAwMDEtbGliZXh0MmZz
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZTJmc3Byb2dzL3tlMmZzcHJvZ3NfMS40Ny4xLmJiID0+IGUyZnNwcm9nc18xLjQ3LjIu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9l
MmZzcHJvZ3MvMDAwMS1saWJleHQyZnMtZml4LXN0ZC1jMjMtYnVpbGQtZmFpbHVyZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzLzAwMDEtbGliZXh0MmZz
LWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAxYWI5ZDVhZmIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2UyZnNwcm9ncy9lMmZzcHJvZ3MvMDAwMS1saWJleHQyZnMtZml4LXN0ZC1jMjMtYnVpbGQtZmFp
bHVyZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gNzJkY2VmMDJi
ZWU5OTI0YzRkNWIzZGM2ZTdlZjRkMDdiZWNlYmNjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVpdGJhdW0uY29tPgotRGF0ZTogRnJpLCAyMiBO
b3YgMjAyNCAxMjozNjozMiArMDAwMAotU3ViamVjdDogW1BBVENIXSBsaWJleHQyZnM6IGZpeCAt
c3RkPWMyMyBidWlsZCBmYWlsdXJlCi0KLWdjYy0xNSBzd2l0Y2hlZCB0byAtc3RkPWMyMyBieSBk
ZWZhdWx0OgotCi0gICAgaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdpdDthPWNvbW1p
dGRpZmY7aD01NWUzYmQzNzZiMjIxNGUyMDBmYTc2ZDEyYjY3ZmYyNTliMDZjMjEyCi0KLUFzIGEg
cmVzdWx0IGBlMmZzcHJvZ3NgIGZhaWxzIHRoZSBidWlsZCBzbyBvbmx5IHR5cGVkZWYgaW50IGJv
b2wKLWZvciBfX1NURENfVkVSU0lPTl9fIDw9IDIwMTcxMEwgKEMxNykKLQotICAgIC4uLy4uLy4u
L2xpYi9leHQyZnMvdGRiLmM6MTEzOjEzOiBlcnJvcjogdHdvIG9yIG1vcmUgZGF0YSB0eXBlcyBp
biBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzCi0gICAgLi4vLi4vLi4vbGliL2V4dDJmcy90ZGIuYzox
MTM6MTogd2FybmluZzogdXNlbGVzcyB0eXBlIG5hbWUgaW4gZW1wdHkgZGVjbGFyYXRpb24KLSAg
ICAgIDExMyB8IHR5cGVkZWYgaW50IGJvb2w7Ci0gICAgICAgICAgfCBefn5+fn5+Ci0KLWh0dHBz
Oi8vZ2l0aHViLmNvbS90eXRzby9lMmZzcHJvZ3MvaXNzdWVzLzIwMgotCi1VcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vdHl0c28vZTJmc3Byb2dzL2NvbW1pdC80
OWZkMDRkNzdiMzI0NGM2YzY5OTBiZTQxMTQyMTY4ZWVmMzczYWVmXQotU2lnbmVkLW9mZi1ieTog
UnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1MaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yL1owQjYwSmhkdlQ5YnBTUTZANmY5MTkwM2U4OWRhCi1TaWduZWQtb2ZmLWJ5OiBU
aGVvZG9yZSBUcydvIDx0eXRzb0BtaXQuZWR1PgotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGxpYi9leHQyZnMvdGRiLmMgfCAyICsrCi0gMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvbGliL2V4dDJmcy90ZGIu
YyBiL2xpYi9leHQyZnMvdGRiLmMKLWluZGV4IGIwN2IyOTE3Li45OGRjOTVkOCAxMDA2NDQKLS0t
LSBhL2xpYi9leHQyZnMvdGRiLmMKLSsrKyBiL2xpYi9leHQyZnMvdGRiLmMKLUBAIC0xMTAsNyAr
MTEwLDkgQEAgc3RhdGljIGNoYXIgKnJlcF9zdHJkdXAoY29uc3QgY2hhciAqcykKLSAjZW5kaWYK
LSAjZW5kaWYKLSAKLSsjaWYgZGVmaW5lZCBfX1NURENfXyAmJiBkZWZpbmVkIF9fU1REQ19WRVJT
SU9OX18gJiYgX19TVERDX1ZFUlNJT05fXyA8PSAyMDE3MTBMCi0gdHlwZWRlZiBpbnQgYm9vbDsK
LSsjZW5kaWYKLSAKLSAjaW5jbHVkZSAidGRiLmgiCi0gCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJvZ3MtZml4LW1pc3NpbmctY2hl
Y2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Uy
ZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3Byb2dzLWZpeC1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNz
aW9uLWRlbmllZC5wYXRjaAppbmRleCA0Y2QxMDk4NTk3Li41ZDFmN2E4ZDc3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJvZ3MtZml4
LW1pc3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL2UyZnNwcm9ncy1maXgtbWlzc2luZy1j
aGVjay1mb3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFj
NzA3OGZkYTZkMjNmMWQ4MGIwZDk1YWMzZTkwODM2NDc0OWUxODggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGRmN2M4MDdmMDgwYTFiMGMzNjVkNGU4NWIwZDEzNTc2ZTgyYmU2NGQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxMCBBdWcgMjAxNiAxMToxOTo0NCArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBGaXggbWlzc2luZyBjaGVjayBmb3IgcGVybWlzc2lvbiBkZW5pZWQuCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rp
cl9wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtk
aXJfcC5wYXRjaAppbmRleCAyZGJlYmExMDk1Li45Mzg2MGViNWMwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rpcl9wLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL21rZGlyX3AucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxNDNhOTAwMTk5YzViYjEwYjI4ZjNmYzhmNGQzNmJiYjZm
ZmRkNWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJkY2FlODc1MzVjY2UyZjM0YzU2
NTA3ODEzNTU3NDQxYzFhYzE0MjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb2Ug
U2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDcgTWFyIDIwMTcgMTQ6
NTM6MTkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dzOiBleHBhbmQgQG1rZGlyX3BA
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDEzMWNhZWYzLi5jYTQ0OGQ5
NyAxMDA2NDQKK2luZGV4IDFmNjc2MDQwLi44YmUwYzFlMCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtOTM4LDYgKzkzOCw4IEBAIEFDX1NVQlNUKFBB
Q0tBR0UpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNw
cm9ncy9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzL3B0ZXN0LnBhdGNoCmluZGV4IGY0ZTEwNTdhMzYuLjI3NDc1Nzg3ZGEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNWRiNWFjNzQ2OWNlZGQwNDNhMDRiY2Y0OWNlNzU1Mzk3
OWZiYjMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYjJhMzJhNDRiMGEwNjU5YWEy
OTk5MjA1NDNlOGQ2ZTJmY2M1Y2IxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1p
dHJ5IEVyZW1pbi1Tb2xlbmlrb3YgPGRtaXRyeV9lcmVtaW5AbWVudG9yLmNvbT4KIERhdGU6IFNh
dCwgMTggQXByIDIwMTUgMTc6NTg6MTcgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dz
OiBhZGQgcHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mv
ZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJm
c3Byb2dzL2UyZnNwcm9ncy9xdWlldC1kZWJ1Z2ZzLnBhdGNoCmluZGV4IDRiYTE1MGUyN2QuLjUw
YzlkZDAyMjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Uy
ZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYjY2Yzk3M2UwMDRlMGM0NThlZjI3NWI0MWFjMmQ4ZDlmZjMzZDI5ZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNTcyOTk2MWM4N2M5NDQzN2ZlODcwZGU2NzNlYTMzNTU2YTFkYzlm
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBpbnRlbC5jb20+CiBEYXRlOiBNb24sIDIzIERlYyAyMDEzIDEzOjM4OjM0ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGUyZnNwcm9nczogc2lsZW5jZSBkZWJ1Z2ZzCkBAIC0xMywxMCArMTMsMTAg
QEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2RlYnVnZnMvZGVidWdmcy5jIGIvZGVidWdmcy9kZWJ1Z2ZzLmMKLWluZGV4IDkwOWMxZGYz
Li4wODQyMzY5ZSAxMDA2NDQKK2luZGV4IDhhY2I1NmE0Li5kZDE1MDUzNiAxMDA2NDQKIC0tLSBh
L2RlYnVnZnMvZGVidWdmcy5jCiArKysgYi9kZWJ1Z2ZzL2RlYnVnZnMuYwotQEAgLTI1MjksNyAr
MjUyOSw3IEBAIHN0YXRpYyBpbnQgc291cmNlX2ZpbGUoY29uc3QgY2hhciAqY21kX2ZpbGUsIGlu
dCBzc19pZHgpCitAQCAtMjUzMCw3ICsyNTMwLDcgQEAgc3RhdGljIGludCBzb3VyY2VfZmlsZShj
b25zdCBjaGFyICpjbWRfZmlsZSwgaW50IHNzX2lkeCkKICAJCWNwID0gc3RyY2hyKGJ1ZiwgJ1xy
Jyk7CiAgCQlpZiAoY3ApCiAgCQkJKmNwID0gMDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3JlbW92ZS5sZGNvbmZpZy5jYWxsLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcmVtb3ZlLmxkY29uZmln
LmNhbGwucGF0Y2gKaW5kZXggMzA3MDg4ZDQyYi4uYmE4ZGE5M2Y4ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcmVtb3ZlLmxkY29uZmlnLmNh
bGwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3Mv
cmVtb3ZlLmxkY29uZmlnLmNhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk3MjA4Njkz
NWQ2YzdmNmU2MDMwMDRmZDdmOTRiZDEzYTY1ZjQ3MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDE1YjRmYTc0MWEyNGEyNDE3ZGVkZjNiZDNiNDNiZGRjMjllMzhkOGUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZWkgRGludSA8YW5kcmVpLmFkcmlhbnguZGludUBp
bnRlbC5jb20+CiBEYXRlOiBXZWQsIDMwIEphbiAyMDEzIDE1OjIyOjA0ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFdoZW4gL2V0Yy9sZC5zby5jYWNoZSBpcyB3cml0ZWFibGUgYnkgdXNlciBydW5u
aW5nIGJpdGJha2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mv
ZTJmc3Byb2dzXzEuNDcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzXzEuNDcuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMi5iYgppbmRleCAw
MjJiMDE2ZjEyLi4yYzRkODNlOGFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4yLmJiCkBAIC00LDE0ICs0LDExIEBAIFNSQ19VUkkg
Kz0gImZpbGU6Ly9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vcHRlc3QucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vbWtkaXJfcC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYmV4dDJm
cy1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDX1VS
STphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lMmZzcHJvZ3Mt
Zml4LW1pc3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL3F1aWV0LWRlYnVnZnMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9
ICJiNTcxYjliNDI0MDczOWE5ODJlOGJjYTYyY2ZjOTE0YTNiNTAxOTBhIgorU1JDUkVWID0gIjI1
OGE2YjM0YWQ4NDE1NjJiZjZmNDg4MGZmNzQ4ZWMwN2FiM2Q1ZjkiCiBVUFNUUkVBTV9DSEVDS19H
SVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrXC5cZCsoXC5cZCspKikkIgogCiBFWFRSQV9PRUNP
TkYgKz0gIi0tbGliZGlyPSR7YmFzZV9saWJkaXJ9IC0tc2JpbmRpcj0ke2Jhc2Vfc2JpbmRpcn0g
XAotLSAKMi40Ny4xCgo=

--===============7638183582564571720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b9b8832383b6a363460fce53ab62c978d57bcecf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b9b8832383b6a363460fce53ab62c978d57bcecf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 484 Local 238 Mirrors 0 Missed 246 Current 328 (49% match, 69% complete)
Removing 45 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 67 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 427 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 452 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 511 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 529 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 541 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 557 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 558 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 564 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 629 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 636 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 645 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 659 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 672 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 681 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 684 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 685 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 695 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 697 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 707 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 732 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 733 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 734 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 735 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 736 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 744 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 746 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 747 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 752 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 764 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 770 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 776 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 394 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 780 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 781 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 782 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 469 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 470 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 530 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 607 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 617 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running setscene task 788 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 621 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running task 629 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 631 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 633 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 635 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 642 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 651 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 669 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 670 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: Running setscene task 789 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: Running task 672 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: Running task 686 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 690 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: Running task 750 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: Running task 751 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 752 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 767 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running setscene task 790 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: Running task 769 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 803 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: Running task 824 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: Running task 829 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 830 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 836 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running task 838 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa unihash changed to 44052ef2629b0f80642d40462f31244348633ebe4046ceaff336ef46c71d48d9
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running setscene task 753 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 839 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 840 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 841 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 843 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 844 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 845 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_fetch)
NOTE: Running task 846 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 847 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: Running task 849 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_fetch)
NOTE: Running task 851 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 852 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: Running task 853 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 854 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Started
NOTE: Running noexec task 856 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 857 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 858 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Succeeded
NOTE: Running task 860 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 862 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 864 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: Running task 866 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_unpack)
NOTE: Running task 867 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 868 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_unpack)
NOTE: Running task 871 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: Running task 872 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 902 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: Running task 904 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 914 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 928 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: Running task 947 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: Running task 949 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 955 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: Running task 958 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libffi-3.5.1-r0: task do_patch: Started
NOTE: Running task 961 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 962 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 963 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 970 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_patch)
NOTE: Running task 976 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: Running task 977 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: Running task 979 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 981 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: Running task 983 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 1006 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: Running task 1012 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: Running task 1013 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe python3-3.13.5-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: Running task 1014 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_unpack)
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1019 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 1026 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: Running task 1028 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 1031 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 1034 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: Running task 1057 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running task 1059 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: Running task 1067 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: Running task 1070 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: Running task 1071 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_patch: Started
NOTE: Running task 1077 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: Running task 1080 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: Running task 1083 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: Running task 1092 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1094 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: Running task 1096 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: Running task 1099 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_patch)
NOTE: Running task 1104 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: Running task 1105 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 1107 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1108 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: Running task 1110 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: Running task 1114 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1116 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: Running task 1118 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1119 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 1122 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: Running task 1123 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 1125 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 1131 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1132 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1133 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: Running task 1134 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1135 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: Running task 1138 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: Running task 1139 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: Running task 1141 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 1146 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: Running task 1149 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1150 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: Running task 1157 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1158 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1160 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: Running task 1161 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1162 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: Running task 1169 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa)
NOTE: Running task 1170 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1173 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_fetch)
NOTE: Running task 1174 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch unihash changed to 30823ae2e47bd97f3faa0dd95a80e1baa52d233e9cf834e71befc20298cbaafe
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_recipe_qa: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Started
NOTE: recipe diffutils-3.12-r0: task do_fetch: Started
NOTE: recipe diffutils-3.12-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa unihash changed to 8e3d525347f7651f64df8bfba0cdb79cda640354c14911fd7258561f8dcc7e92
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 1188 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure)
NOTE: Running task 1190 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1191 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: Running task 1192 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1193 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_fetch)
NOTE: Running task 1194 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: Running task 1196 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: Running task 1201 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1202 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: Running task 1204 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1219 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 1220 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: Running task 1221 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1222 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe shadow-4.17.4-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1228 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1230 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1241 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1242 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1243 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe diffutils-3.12-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1244 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1245 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1246 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1247 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1248 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_unpack)
NOTE: Running task 1249 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: Running task 1273 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1277 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1281 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: Running task 1285 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1286 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: Running task 1290 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe diffutils-3.12-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1297 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1315 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1316 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe diffutils-3.12-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1320 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1321 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1322 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: Running task 1323 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe diffutils-3.12-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1334 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: Running task 1337 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: Running task 1340 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1341 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 1354 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: Running task 1361 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Succeeded
NOTE: Running task 1366 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_configure)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1374 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_patch)
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: Running task 1375 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_patch: Started
NOTE: Running task 1377 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1383 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1385 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: Running task 1407 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1410 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1412 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: Running task 1417 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: Running task 1420 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1422 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 1426 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_warn_musl)
NOTE: Running task 1427 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: Running task 1428 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1449 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1479 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1482 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1488 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: Running task 1490 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1492 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_populate_lic: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_patch)
NOTE: Running task 1496 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch unihash changed to e95dfb4e5ffe294697a0e633df18820bf1d432c35e2abf30a880d743b004b79d
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_populate_lic: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_lic unihash changed to 4a56dfae6ad43822818ad13e7098312db152a8b9a2991867708a3623e620443a
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: Running task 1503 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1508 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_compile)
NOTE: recipe glibc-2.41+git-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_install: Succeeded
NOTE: Running task 1513 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1514 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_configure)
NOTE: recipe libarchive-native-3.8.1-r0: task do_configure: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_compile)
NOTE: recipe libarchive-native-3.8.1-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_install)
NOTE: recipe libarchive-native-3.8.1-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1518 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1519 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.193-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.193-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_configure)
NOTE: recipe elfutils-native-0.193-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.193-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_compile)
NOTE: recipe elfutils-native-0.193-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.193-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_install)
NOTE: recipe elfutils-native-0.193-r0: task do_install: Started
NOTE: recipe elfutils-native-0.193-r0: task do_install: Succeeded
NOTE: Running task 1523 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.193-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.193-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1524 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1525 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: Running task 1527 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1528 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1530 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe glibc-2.41+git-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_install)
NOTE: recipe glibc-2.41+git-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1534 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1535 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
NOTE: Running task 1536 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1537 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: Running task 1538 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1539 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 8ebc0dd21d85f9248bb00daff206ca13926b191bdcf163ce7de42d1a64c9608d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to 14cb00e2e55a1cea571133e653c9aae26b193e17a3eb73aa4daf563f1ac565a4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: Running setscene task 804 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running task 1541 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to 5905b40c1527609cb0fe44e61252861e2254e6c9959157cbbca4732d1ff135a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package unihash changed to 9514955c58367f6c13b9065d84c4ab04b40e2bfbe25001d93131cbc431be7660
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx became valid
NOTE: Running setscene task 791 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1554 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1558 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package)
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_configure)
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_compile)
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_install)
NOTE: recipe libgcc-15.1.0-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1562 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_multilib_install)
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1563 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1565 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_configure)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package unihash changed to 1df55af1a6b248a47c051a8cc495d5ef86cb4084ad25fce874875103c415eb72
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx became valid
NOTE: Running setscene task 781 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1568 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package)
NOTE: Running task 1570 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.1.0-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package unihash changed to de23e93ccb314a56408e76e500bfdf99a339973cfe913215389427efe958381b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata became valid
NOTE: Running setscene task 783 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1573 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1574 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1582 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1585 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1586 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1588 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1589 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1591 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1592 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1593 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1594 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1595 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1596 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1597 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1598 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1599 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1601 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1602 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1604 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: Running task 1605 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_configure)
NOTE: Running task 1607 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Started
NOTE: Running task 1608 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_configure: Started
NOTE: Running task 1609 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1610 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Started
NOTE: Running task 1611 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Started
NOTE: Running task 1612 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Started
NOTE: Running task 1613 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: Running task 1614 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1616 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1622 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe openssl-3.5.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1625 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile)
NOTE: Running task 1626 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1628 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: Running task 1629 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_compile)
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1631 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1634 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1635 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_install)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1637 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: Running task 1642 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1644 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: Running task 1645 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package unihash changed to ee467fff204fee3fc6eebf037af8165a77839b7d24e7ea673d99401ec3910cff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata became valid
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running setscene task 667 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1646 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: Running task 1647 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: Running task 1648 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1649 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: Running task 1650 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: Running task 1652 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libffi-3.5.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1653 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1654 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1655 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Started
NOTE: Running task 1657 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1658 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1659 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: Running task 1661 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libffi-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.5.1-r0: task do_install: Started
NOTE: Running task 1667 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1668 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1670 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_configure)
NOTE: recipe libpcre2-10.45-r0: task do_configure: Started
NOTE: recipe libffi-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 1672 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_install)
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Succeeded
NOTE: Running task 1673 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Succeeded
NOTE: Running task 1675 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_package)
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Started
NOTE: Running task 1679 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package)
NOTE: recipe libffi-3.5.1-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1680 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1682 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Succeeded
NOTE: Running task 1683 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Started
NOTE: Running task 1685 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running task 1686 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 8c8f542ac238f2e2c7e0326729d4772e05573474584d21eeb840df4c6026191a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1689 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1690 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 59b7861646ba6975c5e25e96b54f871c3f12519a0388e5d64a41b47ba496a6c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package unihash changed to 085de84b8dcd330d169e485fb7ac773dbd91457d61680d4db10418cdf9a2f2a2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx became valid
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_package unihash changed to 83a2b11b8eaa2cb9de1314c06661840a79381a953c2d16d79eb857a239b77dcd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx became valid
NOTE: recipe xz-5.8.1-r0: task do_configure: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package unihash changed to 037bcf70f67b5cc228063a022abe2f259ccadcb18d5dbf6807f3dd4dc2446867
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx became valid
NOTE: Running setscene task 792 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running task 1691 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure_ptest_base)
NOTE: Running task 1692 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: Running task 1693 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: Running task 1694 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1695 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1696 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package unihash changed to 28aa3becdc4dad215d9587bd655b31507e6d0f6a05988e3edb2d9ad4d51e812c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx became valid
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running task 1698 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: Running task 1702 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1703 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: Running task 1705 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1706 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: Running task 1707 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1708 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1710 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1713 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1714 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1715 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_configure: Started
NOTE: Running task 1716 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1718 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1720 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1721 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 5591132145b6147a09c2b699859bd4cbba418c383a431b1f99f6ac163ff9c001
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_configure: Succeeded
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1722 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile_ptest_base)
NOTE: Running task 1723 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: Running task 1724 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_compile)
NOTE: Running task 1725 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.45-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1726 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1728 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to cda3435e5f82b94349e40cc69843366227432b84df1c173ccd29dd2ad7173105
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to a39fd702217777eff8ffa8d31f942a742366a7e1a075bc2c9b7e5399a661f3b2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running setscene task 784 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: Running task 1729 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install)
NOTE: Running task 1730 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: Running task 1731 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_install: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1734 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1737 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: Running task 1739 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe shadow-4.17.4-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1744 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe xz-5.8.1-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install_ptest_base)
NOTE: Running task 1746 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1750 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xz-5.8.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe libpcre2-10.45-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_install)
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 1754 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libpcre2-10.45-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1756 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1757 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe libpcre2-10.45-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1760 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Started
NOTE: Running task 1770 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe diffutils-3.12-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1772 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Succeeded
NOTE: Running task 1774 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1775 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: Running task 1779 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 6a034abe3f27b7586276ae31796f1904f49ba6adbf21b06b72bafc80b8d14d19
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to 7332e339b3d70dfdef1fc935cbf66e4e33aa20278094a7e04186a1ab4db10012
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running task 1780 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: Running task 1781 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: Running task 1783 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: Running task 1786 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to 897110ead704a695245ea0870c7011c2453bf6b0752f418f744d8a0dfaa09af6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package unihash changed to b44eb1deb6e698090286b7607a07614ce564e14595f9af0c07624ddc65618828
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package unihash changed to 8cf79070acd407a13fd504188d7ae67c39898f26b0c57db3a8907759ed71da21
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running setscene task 746 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 796 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx_setscene)
NOTE: Running task 1788 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1789 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: Running task 1790 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1798 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package)
NOTE: Running task 1799 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to dcac0aa3286182305e20d7947fd4fd5d94e112a9936db75346fe7e0e772c6ab1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: Running task 1802 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: Running task 1804 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1805 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: Running task 1806 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1807 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1808 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: Running task 1810 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1813 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: Running task 1814 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1815 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1816 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: Running task 1818 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package unihash changed to 1d763ee7c439e9fcf431eab9d3db4abc4690f88421dd5b77c543568d90b7231a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running task 1822 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure: Started
NOTE: recipe shadow-4.17.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1826 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_compile)
NOTE: recipe shadow-4.17.4-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package unihash changed to 9edca1f31c8653da8c55e9aae85f91c0f35c0b424d39eb4e0372fee908c44279
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to b5505b1c0dbe268e31658ef48452ee29a7a8295f7177e87b7083d8a4d2508eaf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to f6ccd10c2a4fdbcd1963eca9741c4f3d53ab26b93655a33cdd5e02993fe81e62
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running task 1829 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: Running task 1830 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package unihash changed to ca19fa47c622dfdb59dd19eb0a3c430dea440aeb7427b225607bd420efbc6b7e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata became valid
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: Running task 1831 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1833 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to 3ab57c742b7b76b9d96748c9a13b9ab13ce70772c8c5282aa7b532fb0f9167c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 411cb8c51615341ac9a8859390d9caad2aa5a1fe1e83f332d6efcf07a1f811b2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to 5fc472d147e1b172d4cbba8e86e5631f596a2b6802d9a3ced9b38bea253db780
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running task 1838 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1840 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1842 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 1844 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 39e76d509fa81263a9a0ac0b8335dff53be1efab99bb3516def161520aa63c1b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_compile: Succeeded
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running task 1845 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_install)
NOTE: Running task 1846 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: Running task 1847 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe shadow-4.17.4-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1855 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1862 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1869 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1870 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_configure)
NOTE: Running noexec task 1871 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_compile)
NOTE: Running task 1872 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_install)
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe shadow-4.17.4-r0: task do_install: Succeeded
NOTE: Running task 1875 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe shadow-4.17.4-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to 0052cc69cd1d83b7d4560956fab4d93bbe2b299466521671de849070c52b3167
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1876 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1878 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1880 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: Running task 1881 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to aa1b113b7d791d53c9121cf85a983d61e3f20bd347cc1bf742216f9461dc43d6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx became valid
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running task 1882 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1899 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: Running task 1912 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1915 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1920 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1921 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: Running task 1922 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1924 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_collect_spdx_deps)
NOTE: Running task 1925 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1926 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe shadow-4.17.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package unihash changed to 93a1241c747f05fd150c9b4e8ab475a5c56dc67c5525a5ee7d7cd03b485aebf0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1930 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1932 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Succeeded
NOTE: Running task 1934 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Succeeded
NOTE: Running task 1935 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1938 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1940 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to 4c293991c88ace8fced61bc00e529b7dba2bcdc5fb06c97cef9ca55fae5cf01d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package unihash changed to 5da78d5cedb1d4c1bbdc9b6578bc54c001d89505622f78a8e2bda65371548984
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx became valid
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running setscene task 776 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running task 1941 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: Running task 1943 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1945 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 40f0b5c482bbe139d443035aae48bdfb809f959abdb34276e1aaeb09f0a2fa35
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to d3a38c239963ce7a5fdd9682f22773aea066e4f51a7d83df633f5560f1c5917a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1953 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1954 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe openssl-3.5.0-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 0e055104c7d5147fab2424dc6c852853585d6c2a93534f200891edcde35a39a2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: recipe openssl-3.5.0-r0: task do_install: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running task 1955 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1957 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to f9a12daaa2a8b273ca2a0ae427632d2d64a58024efdc5b56ce426dc5e0e8c9a4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running task 1958 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure_ptest_base)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1959 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile)
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffutils-3.12-r0: task do_compile: Succeeded
NOTE: Running task 1962 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1963 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install)
NOTE: recipe diffutils-3.12-r0: task do_install: Started
NOTE: recipe diffutils-3.12-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1965 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package)
NOTE: recipe diffutils-3.12-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1968 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: Running task 1970 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1972 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1973 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1975 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_configure)
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure)
NOTE: Running task 1978 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Started
NOTE: recipe bash-5.2.37-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure)
NOTE: recipe util-linux-2.41-r0: task do_configure: Started
NOTE: recipe diffutils-3.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package unihash changed to ec01219bf3c99d27fe9cfd1a1812115fb8a0c87b75f2120b7ba4dbe00674dc3d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx became valid
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx_setscene)
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 60b07c71febf4eff7a32e81ae337f5ab1519a46d4f5b0f61ad6de55d9afe1b9f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe findutils-4.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1986 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_compile: Started
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1988 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package)
NOTE: Running task 1989 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_compile)
NOTE: recipe readline-8.2.13-r0: task do_compile: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Succeeded
NOTE: Running task 1992 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_compile)
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1994 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to adfaaa90a8831b65e9470b5025386c4a4b0a03e842f3059a87c64b2f3c7ff6ce
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: recipe readline-8.2.13-r0: task do_compile: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_install: Succeeded
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running task 1995 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_install)
NOTE: Running task 1996 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure_ptest_base)
NOTE: Running task 1997 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_install)
NOTE: Running task 1998 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: Running task 1999 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Started
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe readline-8.2.13-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2000 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2001 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_collect_spdx_deps)
NOTE: Running task 2005 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 2006 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Started
NOTE: Running task 2008 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2009 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package)
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Started
NOTE: recipe python3-3.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2.13-r0: task do_install: Succeeded
NOTE: Running task 2011 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2012 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package)
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2.13-r0: task do_package: Started
NOTE: recipe python3-3.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2013 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_configure)
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_configure: Started
NOTE: Running task 2014 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 2015 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe gawk-5.3.2-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Running task 2017 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package unihash changed to 0caffb295b4a4654ff953604403598823e3b7516f4ee0376df624697c716ab10
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata became valid
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe readline-8.2.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package unihash changed to c2bdf111f23796801c78c56f3042d9d55470d88f7e89f45f4acd3be3bddbd111
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata became valid
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running setscene task 763 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: Running task 2018 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package unihash changed to 18dd755deb229ed8656e328db03f3351b4da0ae46ca0f98adcccbbfb9d5c624d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata became valid
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2025 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile)
NOTE: recipe coreutils-9.7-r0: task do_compile: Started
NOTE: recipe openssl-3.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package unihash changed to 689e0fa4ff8624bc9284a573d212e72bbff8181ce408027363b3b059d7fdab4e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to ac96f0f44b20b46d2d25fd9b3b81249351ae327da48cd2062e6b2afbfdbcc00a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa became valid
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2027 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2029 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running task 2030 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.13.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.13.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2034 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: Setscene tasks completed
NOTE: Running task 2035 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2037 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile)
NOTE: recipe bash-5.2.37-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 43918fb141751d699cb8552f47c73d5bd1c59a33208e0e19570b202853f20aed
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to b3d7c46ac17e46aa57f490e4c7a190e7279992ed909d0ca28f372bbe57e47596
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.7-r0: task do_compile: Succeeded
NOTE: Running task 2040 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2041 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install)
NOTE: recipe coreutils-9.7-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2042 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2043 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile)
NOTE: recipe util-linux-2.41-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_compile: Succeeded
NOTE: Running task 2044 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2046 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2047 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package)
NOTE: recipe coreutils-9.7-r0: task do_package: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2049 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2050 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile)
NOTE: recipe gawk-5.3.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.41-r0: task do_compile: Succeeded
NOTE: Running task 2051 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2053 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install)
NOTE: recipe util-linux-2.41-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2055 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package)
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2058 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install)
NOTE: recipe gawk-5.3.2-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2060 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure: Started
NOTE: recipe gawk-5.3.2-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package unihash changed to 4a2ecdc5b1b5ab55f1b4eb15f0939fbe5de84b4a14b4af4cb4c60c0681cf38cd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb became valid
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 2064 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package)
NOTE: recipe gawk-5.3.2-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package unihash changed to 256026fccf9e2ccf6e86643a32f23b7c95d980fb0b2701f2ef7a563ce8e950c0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm unihash changed to e80ca4bda9f166e0bde1526e62f26bde57978402376e8ccb63efac6854696914
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.13.5-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package: Succeeded
NOTE: Running task 2073 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package unihash changed to c14c1640b530ea4001f386ac6ecadca3b32be803947b01b62b45cc092f821fd0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.13.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2074 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_compile)
NOTE: recipe python3-3.13.5-r0: task do_compile: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure: Succeeded
NOTE: Running task 2076 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2077 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_compile: Started
NOTE: recipe perl-5.40.2-r0: task do_compile: Succeeded
NOTE: Running task 2078 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2079 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package unihash changed to e6e8743e66df444229dce8c5260481fa50196abed690cfede32262de94301673
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2082 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_compile: Succeeded
NOTE: Running task 2083 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_compile_ptest_base)
NOTE: recipe python3-3.13.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2084 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_install)
NOTE: recipe python3-3.13.5-r0: task do_install: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| cd ./util ; make subst
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/util'
| echo "/* fake dirpaths.h for config.h */" > dirpaths.h
| gcc  -c  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/include -O2 -pipe ../../sources/e2fsprogs-1.47.2/util/subst.c -o subst.o
| gcc   -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefin
 ed -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -o subst subst.o
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/util'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: 'util/subst.conf' is up to date.
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: 'lib/config.h' is up to date.
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| ./util/subst -f ./util/subst.conf ../sources/e2fsprogs-1.47.2/lib/dirpaths.h.in lib/dirpaths.h
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| cd .; CONFIG_FILES=./lib/ext2fs/ext2_types.h ./config.status
| config.status: creating ./lib/ext2fs/ext2_types.h
| config.status: creating lib/config.h
| config.status: lib/config.h is unchanged
| config.status: executing po-directories commands
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| ../../util/subst -f ../../util/subst.conf ../../../sources/e2fsprogs-1.47.2/lib/et/compile_et.sh.in compile_et
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/chmod +x compile_et
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| ../../util/subst -f ../../util/subst.conf ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/ext2_err.et.in ext2_err.et
| _ET_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/lib/ext2fs/../et ../et/compile_et ext2_err.et
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| _ET_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/lib/support/../et ../et/compile_et ../../../sources/e2fsprogs-1.47.2/lib/support/prof_err.et
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| make libs
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'util/subst.conf' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/config.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/dirpaths.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/ext2fs/ext2_types.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[2]: 'compile_et' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[2]: 'ext2_err.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| make[2]: 'prof_err.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| making all in lib/et
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make -s real-subdirs
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/et/error_message.c -o error_message.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/et/et_name.c -o et_name.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/et/init_et.c -o init_et.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/et/com_right.c -o com_right.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/et/com_err.c -o com_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/et_name.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/et/et_name.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/init_et.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/et/init_et.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/com_err.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/et/com_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/com_right.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/et/com_right.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/error_messa
 ge.o -c ../../../sources/e2fsprogs-1.47.2/lib/et/error_message.c
| (if test -r libcom_err.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libcom_err.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libcom_err.a libcom_err.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libcom_err.a error_message.o et_name.o init_et.o com_err.o com_right.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libcom_err.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/et | sed -e 's;lib/;;'`/libcom_err.a libcom_err.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libcom_err.so.2.1 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
| 	-Wl,-soname,libcom_err.so.2 error_message.o et_name.o init_et.o com_err.o com_right.o )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv elfshared/libcom_err.so.2.1 .
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libcom_err.so.2.1 ../libcom_err.so ../libcom_err.so.2
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/et | sed -e 's;lib/;;'`/libcom_err.so.2.1 libcom_err.so.2.1)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libcom_err.so.2.1 libcom_err.so)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libcom_err.so.2.1 libcom_err.so.2)
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| making all in lib/ss
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ss'
| ../../util/subst -f ../../util/subst.conf ../../../sources/e2fsprogs-1.47.2/lib/ss/mk_cmds.sh.in mk_cmds
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/chmod +x mk_cmds
| make -s real-subdirs
| _ET_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/lib/ss/../et ../et/compile_et ../../../sources/e2fsprogs-1.47.2/lib/ss/ss_err.et
| _ET_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/lib/ss/../et ../et/compile_et ../../../sources/e2fsprogs-1.47.2/lib/ss/ss_err.et
| DIR=../../../sources/e2fsprogs-1.47.2/lib/ss _SS_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/lib/ss ./mk_cmds ../../../sources/e2fsprogs-1.47.2/lib/ss/std_rqs.ct
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c std_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/invocation.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/help.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/execute_cmd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/listen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/parse.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/error.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/prompt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/request_tbl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/list_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/pager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/data.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/requests.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ss/get_readline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ss_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/std_rqs.o -c std_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/data.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/data.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/ss_err.o -c ss_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/prompt.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/prompt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/requests.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/requests.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/error.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/error.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/invocation.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/invocation.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/parse.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/parse.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/execute_cmd.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/execute_cmd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/request_tbl.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/request_tbl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/get_readline.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/get_readline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/list_rqs.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/list_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/help.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/help.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/pager.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/pager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfs
 hared/listen.o -c ../../../sources/e2fsprogs-1.47.2/lib/ss/listen.c
| (if test -r libss.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libss.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libss.a libss.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libss.a ss_err.o std_rqs.o invocation.o help.o execute_cmd.o listen.o parse.o error.o prompt.o request_tbl.o list_rqs.o pager.o requests.o data.o get_readline.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libss.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ss | sed -e 's;lib/;;'`/libss.a libss.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libss.so.2.0 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
| 	-Wl,-soname,libss.so.2 ss_err.o std_rqs.o invocation.o help.o execute_cmd.o listen.o parse.o error.o prompt.o request_tbl.o list_rqs.o pager.o requests.o data.o get_readline.o -lcom_err -ldl)
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv elfshared/libss.so.2.0 .
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libss.so.2.0 ../libss.so ../libss.so.2
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ss | sed -e 's;lib/;;'`/libss.so.2.0 libss.so.2.0)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libss.so.2.0 libss.so)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libss.so.2.0 libss.so.2)
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ss'
| making all in lib/e2p
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/e2p'
| make -s real-subdirs
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/feature.c -o feature.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fgetflags.c -o fgetflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fsetflags.c -o fsetflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fgetversion.c -o fgetversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fsetversion.c -o fsetversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/getflags.c -o getflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/getversion.c -o getversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/hashstr.c -o hashstr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/iod.c -o iod.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/ls.c -o ls.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/mntopts.c -o mntopts.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/ljs.c -o ljs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/parse_num.c -o parse_num.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/pe.c -o pe.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/pf.c -o pf.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/ps.c -o ps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/pe.o -c ../
 ../../sources/e2fsprogs-1.47.2/lib/e2p/pe.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/pf.o -c ../
 ../../sources/e2fsprogs-1.47.2/lib/e2p/pf.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getflags.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/getflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getversion.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/getversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/parse_num.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/parse_num.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ps.o -c ../
 ../../sources/e2fsprogs-1.47.2/lib/e2p/ps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetversion
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fsetversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetversion
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fgetversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetflags.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fsetflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetflags.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fgetflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mntopts.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/e2p/mntopts.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/iod.o -c ..
 /../../sources/e2fsprogs-1.47.2/lib/e2p/iod.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/hashstr.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/e2p/hashstr.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ljs.o -c ..
 /../../sources/e2fsprogs-1.47.2/lib/e2p/ljs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/setflags.c -o setflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/setversion.c -o setversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/uuid.c -o uuid.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/ostype.c -o ostype.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/percent.c -o percent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/crypto_mode.c -o crypto_mode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fgetproject.c -o fgetproject.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/fsetproject.c -o fsetproject.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/feature.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/e2p/feature.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/encoding.c -o encoding.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/e2p/errcode.c -o errcode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/percent.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/e2p/percent.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/setversion.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/setversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ostype.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/e2p/ostype.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/uuid.o -c .
 ./../../sources/e2fsprogs-1.47.2/lib/e2p/uuid.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/setflags.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/setflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crypto_mode
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/crypto_mode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/errcode.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/e2p/errcode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/encoding.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/encoding.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetproject
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fgetproject.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetproject
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/e2p/fsetproject.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ls.o -c ../
 ../../sources/e2fsprogs-1.47.2/lib/e2p/ls.c
| (if test -r libe2p.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libe2p.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libe2p.a libe2p.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libe2p.a feature.o fgetflags.o fsetflags.o fgetversion.o fsetversion.o getflags.o getversion.o hashstr.o iod.o ls.o ljs.o mntopts.o parse_num.o pe.o pf.o ps.o setflags.o setversion.o uuid.o ostype.o percent.o crypto_mode.o fgetproject.o fsetproject.o encoding.o errcode.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libe2p.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/e2p | sed -e 's;lib/;;'`/libe2p.a libe2p.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libe2p.so.2.3 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
| 	-Wl,-soname,libe2p.so.2 feature.o fgetflags.o fsetflags.o fgetversion.o fsetversion.o getflags.o getversion.o hashstr.o iod.o ls.o ljs.o mntopts.o parse_num.o pe.o pf.o ps.o setflags.o setversion.o uuid.o ostype.o percent.o crypto_mode.o fgetproject.o fsetproject.o encoding.o errcode.o )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv elfshared/libe2p.so.2.3 .
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libe2p.so.2.3 ../libe2p.so ../libe2p.so.2
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/e2p | sed -e 's;lib/;;'`/libe2p.so.2.3 libe2p.so.2.3)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libe2p.so.2.3 libe2p.so)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libe2p.so.2.3 libe2p.so.2)
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/e2p'
| making all in lib/support
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| make -s real-subdirs
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/cstring.c -o cstring.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/mkquota.c -o mkquota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/plausible.c -o plausible.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/profile.c -o profile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/parse_qtype.c -o parse_qtype.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/print_fs_flags.c -o print_fs_flags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/profile_helpers.c -o profile_helpers.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c prof_err.c -o prof_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/quotaio.c -o quotaio.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/quotaio_v2.c -o quotaio_v2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/quotaio_tree.c -o quotaio_tree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/dict.c -o dict.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/support/devname.c -o devname.o
| (if test -r libsupport.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libsupport.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libsupport.a libsupport.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libsupport.a cstring.o mkquota.o plausible.o profile.o parse_qtype.o print_fs_flags.o profile_helpers.o prof_err.o quotaio.o quotaio_v2.o quotaio_tree.o dict.o devname.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libsupport.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/support | sed -e 's;lib/;;'`/libsupport.a libsupport.a)
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| making all in lib/ext2fs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make -s real-subdirs
| gcc   -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/include -O2 -pipe  -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -o gen_crc32ctable \
| 	../../../sources/e2fsprogs-1.47.2/lib/ext2fs/gen_crc32ctable.c
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/bb_compat.c -o bb_compat.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/inode_io.c -o inode_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/write_bb_file.c -o write_bb_file.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dupfs.c -o dupfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/imager.c -o imager.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/test_io.c -o test_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ext2_err.c -o ext2_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/alloc.c -o alloc.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/alloc_sb.c -o alloc_sb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/alloc_stats.c -o alloc_stats.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/alloc_tables.c -o alloc_tables.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/atexit.c -o atexit.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/badblocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/bb_inode.c -o bb_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/bitmaps.c -o bitmaps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/bitops.c -o bitops.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ext2_err.o 
 -c ext2_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/write_bb_fi
 le.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/write_bb_file.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bb_compat.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/bb_compat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_stats
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/alloc_stats.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/blkmap64_ba.c -o blkmap64_ba.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dupfs.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dupfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bb_inode.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/bb_inode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/atexit.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/atexit.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inode_io.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/inode_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_sb.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/alloc_sb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_table
 s.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/alloc_tables.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bitmaps.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/bitmaps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/blkmap64_rb.c -o blkmap64_rb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/badblocks.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/badblocks.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bitops.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/bitops.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/imager.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/imager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/alloc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/blknum.c -o blknum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/test_io.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/test_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/block.c -o block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/bmap.c -o bmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/check_desc.c -o check_desc.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/closefs.c -o closefs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/crc16.c -o crc16.o
| ./gen_crc32ctable > crc32c_table.h
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/csum.c -o csum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dblist.c -o dblist.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crc16.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/crc16.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dblist_dir.c -o dblist_dir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blkmap64_ba
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/blkmap64_ba.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dirblock.c -o dirblock.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dirhash.c -o dirhash.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/dir_iterate.c -o dir_iterate.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/expanddir.c -o expanddir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/check_desc.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/check_desc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dblist_dir.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dblist_dir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blkmap64_rb
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/blkmap64_rb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/ext_attr.c -o ext_attr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blknum.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/blknum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dirblock.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dirblock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/extent.c -o extent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dblist.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dblist.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/expanddir.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/expanddir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/fallocate.c -o fallocate.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bmap.o -c .
 ./../../sources/e2fsprogs-1.47.2/lib/ext2fs/bmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/fileio.c -o fileio.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/closefs.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/closefs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dir_iterate
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dir_iterate.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/finddev.c -o finddev.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/flushb.c -o flushb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/block.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/csum.o -c .
 ./../../sources/e2fsprogs-1.47.2/lib/ext2fs/csum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dirhash.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/dirhash.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/freefs.c -o freefs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/flushb.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/flushb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/finddev.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/finddev.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/gen_bitmap.c -o gen_bitmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/gen_bitmap64.c -o gen_bitmap64.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/get_num_dirs.c -o get_num_dirs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/get_pathname.c -o get_pathname.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/freefs.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/freefs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/getenv.c -o getenv.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/getsize.c -o getsize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fileio.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/fileio.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/getsectsize.c -o getsectsize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/hashmap.c -o hashmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fallocate.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/fallocate.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/i_block.c -o i_block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/get_num_dir
 s.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/get_num_dirs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/icount.c -o icount.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/ind_block.c -o ind_block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getenv.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/getenv.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/initialize.c -o initialize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getsectsize
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/getsectsize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/get_pathnam
 e.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/get_pathname.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getsize.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/getsize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/hashmap.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/hashmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/inline.c -o inline.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/i_block.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/i_block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ind_block.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/ind_block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/gen_bitmap.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/gen_bitmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/inline_data.c -o inline_data.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/gen_bitmap6
 4.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/gen_bitmap64.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/inode.c -o inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/extent.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/extent.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/io_manager.c -o io_manager.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ext_attr.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/ext_attr.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/ismounted.c -o ismounted.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/link.c -o link.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/llseek.c -o llseek.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/lookup.c -o lookup.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/mkdir.c -o mkdir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/llseek.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/llseek.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/mkjournal.c -o mkjournal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/io_manager.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/io_manager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inline.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/inline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/mmp.c -o mmp.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/initialize.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/initialize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/lookup.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/lookup.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/icount.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/icount.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ismounted.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/ismounted.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/namei.c -o namei.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inline_data
 .o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/inline_data.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/native.c -o native.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/newdir.c -o newdir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mkdir.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/mkdir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/nls_utf8.c -o nls_utf8.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/link.o -c .
 ./../../sources/e2fsprogs-1.47.2/lib/ext2fs/link.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/native.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/native.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/openfs.c -o openfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/namei.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/namei.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/orphan.c -o orphan.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mmp.o -c ..
 /../../sources/e2fsprogs-1.47.2/lib/ext2fs/mmp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inode.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/inode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/newdir.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/newdir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mkjournal.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/mkjournal.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/progress.c -o progress.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/punch.c -o punch.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/qcow2.c -o qcow2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/read_bb.c -o read_bb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/read_bb_file.c -o read_bb_file.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/res_gdt.c -o res_gdt.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/rw_bitmaps.c -o rw_bitmaps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/nls_utf8.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/nls_utf8.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/sha512.c -o sha512.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/orphan.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/orphan.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/progress.o 
 -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/progress.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/swapfs.c -o swapfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/symlink.c -o symlink.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/tdb.c -o tdb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/read_bb_fil
 e.o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/read_bb_file.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/read_bb.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/read_bb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/openfs.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/openfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/punch.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/punch.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/qcow2.o -c 
 ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/qcow2.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/res_gdt.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/res_gdt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/undo_io.c -o undo_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/unix_io.c -o unix_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/sha512.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/sha512.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/sparse_io.c -o sparse_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/unlink.c -o unlink.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/symlink.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/symlink.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/valid_blk.c -o valid_blk.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/version.c -o version.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/rbtree.c -o rbtree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../sources/e2fsprogs-1.47.2/l
 ib/ext2fs/crc32c.c -o crc32c.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/swapfs.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/swapfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/sparse_io.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/sparse_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/rw_bitmaps.
 o -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/rw_bitmaps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/unlink.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/unlink.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/valid_blk.o
  -c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/valid_blk.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/rbtree.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/rbtree.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/version.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/version.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/undo_io.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/undo_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crc32c.o -c
  ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/crc32c.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/unix_io.o -
 c ../../../sources/e2fsprogs-1.47.2/lib/ext2fs/unix_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/tdb.o -c ..
 /../../sources/e2fsprogs-1.47.2/lib/ext2fs/tdb.c
| (if test -r libext2fs.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libext2fs.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libext2fs.a libext2fs.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libext2fs.a bb_compat.o inode_io.o write_bb_file.o dupfs.o imager.o test_io.o ext2_err.o alloc.o alloc_sb.o alloc_stats.o alloc_tables.o atexit.o badblocks.o bb_inode.o bitmaps.o bitops.o blkmap64_ba.o blkmap64_rb.o blknum.o block.o bmap.o check_desc.o closefs.o crc16.o crc32c.o csum.o dblist.o dblist_dir.o dirblock.o dirhash.o dir_iterate.o expanddir.o ext_attr.o extent.o fallocate.o fileio.o finddev.o flushb.o freefs.o gen_bitmap.o gen_bitmap64.o get_num_dirs.o get_pathname.o getenv.o getsize.o getsectsize.o hashmap.o i_block.o icount.o ind_block.o initialize.o inline.o inline_data.o inode.o io_manager.o ismounted.o link.o llseek.o lookup.o mkdir.o mkjournal.o mmp.o namei.o native.o newdir.o nls_utf8.o openfs.o orphan.o progress.o punch.o qcow2.o read_bb.o read_bb_file.o res_gdt.o rw_bitmaps.o sha512.o swapfs.o symlink.o tdb.o undo_io.o unix_io.o sparse_io.o unlink.o valid_blk.o version.o rbtree.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libext2fs.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ext2fs | sed -e 's;lib/;;'`/libext2fs.a libext2fs.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libext2fs.so.2.4 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
| 	-Wl,-soname,libext2fs.so.2 bb_compat.o inode_io.o write_bb_file.o dupfs.o imager.o test_io.o ext2_err.o alloc.o alloc_sb.o alloc_stats.o alloc_tables.o atexit.o badblocks.o bb_inode.o bitmaps.o bitops.o blkmap64_ba.o blkmap64_rb.o blknum.o block.o bmap.o check_desc.o closefs.o crc16.o crc32c.o csum.o dblist.o dblist_dir.o dirblock.o dirhash.o dir_iterate.o expanddir.o ext_attr.o extent.o fallocate.o fileio.o finddev.o flushb.o freefs.o gen_bitmap.o gen_bitmap64.o get_num_dirs.o get_pathname.o getenv.o getsize.o getsectsize.o hashmap.o i_block.o icount.o ind_block.o initialize.o inline.o inline_data.o inode.o io_manager.o ismounted.o link.o llseek.o lookup.o mkdir.o mkjournal.o mmp.o namei.o native.o newdir.o nls_utf8.o openfs.o orphan.o progress.o punch.o qcow2.o read_bb.o read_bb_file.o res_gdt.o rw_bitmaps.o sha512.o swapfs.o symlink.o tdb.o undo_io.o unix_io.o sparse_io.o unlink.o valid_blk.o version.o rbtree.o -lcom_err)
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv elfshared/libext2fs.so.2.4 .
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libext2fs.so.2.4 ../libext2fs.so ../libext2fs.so.2
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ext2fs | sed -e 's;lib/;;'`/libext2fs.so.2.4 libext2fs.so.2.4)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libext2fs.so.2.4 libext2fs.so)
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  libext2fs.so.2.4 libext2fs.so.2)
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make progs
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'util/subst.conf' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/config.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/dirpaths.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: 'lib/ext2fs/ext2_types.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[2]: 'compile_et' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[2]: 'ext2_err.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| make[2]: 'prof_err.h' is up to date.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| making all in lib/et
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| making all in lib/ss
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ss'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ss'
| making all in lib/e2p
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/e2p'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/e2p'
| making all in lib/support
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| making all in lib/ext2fs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| making all in e2fsck
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/e2fsck'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/uni
 x.c -o unix.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/e2f
 sck.c -o e2fsck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/sup
 er.c -o super.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s1.c -o pass1.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s1b.c -o pass1b.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s2.c -o pass2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s3.c -o pass3.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s4.c -o pass4.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pas
 s5.c -o pass5.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/jou
 rnal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/bad
 blocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/uti
 l.c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/dir
 info.c -o dirinfo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/dx_
 dirinfo.c -o dx_dirinfo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/eha
 ndler.c -o ehandler.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/pro
 blem.c -o problem.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/mes
 sage.c -o message.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/quo
 ta.c -o quota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/rec
 overy.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/reg
 ion.c -o region.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/rev
 oke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/ea_
 refcount.c -o ea_refcount.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/reh
 ash.c -o rehash.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/log
 file.c -o logfile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/sig
 catcher.c -o sigcatcher.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/rea
 dahead.c -o readahead.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/ext
 ents.c -o extents.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/e2fsck/enc
 rypted_files.c -o encrypted_files.o
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/e2fsck/e2fsck.8.in e2fsck.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/e2fsck/e2fsck.conf.5.in e2fsck.conf.5
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -rdynamic -o e2fsck unix.o e2fsck.o 
 super.o pass1.o pass1b.o pass2.o pass3.o pass4.o pass5.o journal.o badblocks.o util.o dirinfo.o dx_dirinfo.o ehandler.o problem.o message.o quota.o recovery.o region.o revoke.o ea_refcount.o rehash.o logfile.o sigcatcher.o  readahead.o extents.o encrypted_files.o  ../lib/libsupport.a ../lib/libext2fs.so ../lib/libcom_err.so  -lblkid  -luuid   ../lib/libe2p.so -ldl -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/e2fsck'
| making all in debugfs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/debugfs'
| _SS_DIR_OVERRIDE=../../sources/e2fsprogs-1.47.2/debugfs/../lib/ss ../lib/ss/mk_cmds ../../sources/e2fsprogs-1.47.2/debugfs/debug_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/debugfs.c -o debugfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/util.c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/ncheck.c -o ncheck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/icheck.c -o icheck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/ls.c -o ls.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/lsdel.c -o lsdel.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/dump.c -o dump.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/set_fields.c -o set_fields.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/logdump.c -o logdump.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/htree.c -o htree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/unused.c -o unused.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/debugfs ../../sources/e2fsprogs-1.47.2/debugfs/../misc/e2freefrag.c -o e2freefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/filefrag.c -o filefrag.o
| _SS_DIR_OVERRIDE=../../sources/e2fsprogs-1.47.2/debugfs/../lib/ss ../lib/ss/mk_cmds ../../sources/e2fsprogs-1.47.2/debugfs/extent_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/extent_inode.c -o extent_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/zap.c -o zap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/debugfs \
| 	 ../../sources/e2fsprogs-1.47.2/debugfs/../misc/create_inode.c -o create_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/debugfs \
| 	 ../../sources/e2fsprogs-1.47.2/debugfs/../misc/create_inode_libarchive.c -o create_inode_libarchive.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/quota.c -o quota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/xattrs.c -o xattrs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/journal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/debugfs \
| 	../../sources/e2fsprogs-1.47.2/debugfs/../e2fsck/revoke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/debugfs \
| 	../../sources/e2fsprogs-1.47.2/debugfs/../e2fsck/recovery.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/do_journal.c -o do_journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS ../../sources/e2fsprogs-1.47.2/debugfs/do_orphan.c -o do_orphan.o
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/debugfs/debugfs.8.in debugfs.8
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS debug_cmds.c -o debug_cmds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../sources/e2fsprogs-1.47.2/debugfs/.
 ./e2fsck -DDEBUGFS extent_cmds.c -o extent_cmds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o debugfs debug_cmds.o debugfs.o ut
 il.o ncheck.o icheck.o ls.o lsdel.o dump.o set_fields.o logdump.o htree.o unused.o e2freefrag.o filefrag.o extent_cmds.o extent_inode.o zap.o create_inode.o create_inode_libarchive.o quota.o xattrs.o journal.o revoke.o recovery.o do_journal.o do_orphan.o  ../lib/libsupport.a ../lib/libext2fs.so ../lib/libe2p.so ../lib/libss.so  ../lib/libcom_err.so  -lblkid  -luuid  -ldl -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/debugfs'
| making all in misc
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/misc'
| if test -f ../../sources/e2fsprogs-1.47.2/misc/mke2fs.conf.custom.in ; then \
| 	cp ../../sources/e2fsprogs-1.47.2/misc/mke2fs.conf.custom.in mke2fs.conf; \
| else \
| 	cp ../../sources/e2fsprogs-1.47.2/misc/mke2fs.conf.in mke2fs.conf; \
| fi
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/mke2f
 s.c -o mke2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/util.
 c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/mk_hu
 gefiles.c -o mk_hugefiles.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/creat
 e_inode.c -o create_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/creat
 e_inode_libarchive.c -o create_inode_libarchive.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/badbl
 ocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/tune2
 fs.c -o tune2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../sources/e2fsprogs-1.47.2/misc/../e2fsck -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CON
 FIG_H  -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/misc \
| 	../../sources/e2fsprogs-1.47.2/misc/../debugfs/journal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../sources/e2fsprogs-1.47.2/misc/../e2fsck -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CON
 FIG_H  -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/misc \
| 	../../sources/e2fsprogs-1.47.2/misc/../e2fsck/recovery.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../sources/e2fsprogs-1.47.2/misc/../e2fsck -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CON
 FIG_H  -DDEBUGFS -I../../sources/e2fsprogs-1.47.2/misc \
| 	../../sources/e2fsprogs-1.47.2/misc/../e2fsck/revoke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/dumpe
 2fs.c -o dumpe2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/logsa
 ve.c -o logsave.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e2ima
 ge.c -o e2image.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/fsck.
 c -o fsck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/base_
 device.c -o base_device.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/ismou
 nted.c -o ismounted.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e2und
 o.c -o e2undo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/chatt
 r.c -o chattr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/lsatt
 r.c -o lsattr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/mklos
 t+found.c -o mklost+found.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/filef
 rag.c -o filefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e2fre
 efrag.c -o e2freefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e4def
 rag.c -o e4defrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e4cry
 pt.c -o e4crypt.o
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/tune2fs.8.in tune2fs.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/mklost+found.8.in mklost+found.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/mke2fs.8.in mke2fs.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/dumpe2fs.8.in dumpe2fs.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/badblocks.8.in badblocks.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e2label.8.in e2label.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e2image.8.in e2image.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/logsave.8.in logsave.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/filefrag.8.in filefrag.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e2undo.8.in e2undo.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e4defrag.8.in e4defrag.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e4crypt.8.in e4crypt.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/fsck.8.in fsck.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/e2mmpstatus.8.in e2mmpstatus.8
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/chattr.1.in chattr.1
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/lsattr.1.in lsattr.1
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/mke2fs.conf.5.in mke2fs.conf.5
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/misc/ext4.5.in ext4.5
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e2ini
 trd_helper.c -o e2initrd_helper.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/misc/e2fuz
 z.c -o e2fuzz.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o logsave logsave.o -lpthread
| gawk -f ../../sources/e2fsprogs-1.47.2/misc/profile-to-c.awk < mke2fs.conf \
| 	>  default_profile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2undo e2undo.o ../lib/libext2fs.
 so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o lsattr lsattr.o ../lib/libe2p.so 
 ../lib/libcom_err.so  \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o mklost+found mklost+found.o \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  default_profile.c -o default_profile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o dumpe2fs dumpe2fs.o ../lib/libext
 2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	../lib/libe2p.so ../lib/libcom_err.so  -luuid   -lpthread -lblkid  \
| 	-ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o chattr chattr.o ../lib/libe2p.so 
 ../lib/libcom_err.so  \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o fsck fsck.o base_device.o ismount
 ed.o -lblkid  \
| 	 -lpthread ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o badblocks badblocks.o ../lib/libe
 xt2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2freefrag e2freefrag.o \
| 	../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o filefrag filefrag.o -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2initrd_helper e2initrd_helper.o
  ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lblkid  ../lib/libext2fs.so  -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2fuzz e2fuzz.o ../lib/libext2fs.
 so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lblkid  -luuid  ../lib/libext2fs.so -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2image e2image.o ../lib/libext2f
 s.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	 -lpthread -lblkid  -ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e4crypt e4crypt.o \
| 	-luuid  ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e4defrag e4defrag.o ../lib/libext
 2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o tune2fs tune2fs.o util.o journal.
 o recovery.o revoke.o ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lblkid  -luuid  ../lib/libext2fs.so ../lib/libe2p.so ../lib/libcom_err.so  \
| 	 -lpthread -lblkid  -ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o mke2fs mke2fs.o util.o default_pr
 ofile.o mk_hugefiles.o create_inode.o create_inode_libarchive.o ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lblkid  \
| 	-luuid  ../lib/libext2fs.so ../lib/libe2p.so  \
| 	-lpthread -ldl
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/misc'
| making all in resize
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/resize'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/ext
 ent.c -o extent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/res
 ize2fs.c -o resize2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/mai
 n.c -o main.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/onl
 ine.c -o online.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/res
 ource_track.c -o resource_track.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/sim
 _progress.c -o sim_progress.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../sources/e2fsprogs-1.47.2/resize/tes
 t_extent.c -o test_extent.o
| ../util/subst -t -f ../util/subst.conf ../../sources/e2fsprogs-1.47.2/resize/resize2fs.8.in resize2fs.8
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o test_extent extent.o test_extent.
 o ../lib/libe2p.so ../lib/libext2fs.so ../lib/libcom_err.so   -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o resize2fs extent.o resize2fs.o ma
 in.o online.o resource_track.o sim_progress.o ../lib/libe2p.so ../lib/libext2fs.so ../lib/libcom_err.so   -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/resize'
| making all in tests/progs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/progs'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../../sources/e2fsprogs-1.47.2/t
 ests/progs/test_icount.c -o test_icount.o
| _SS_DIR_OVERRIDE=../../../sources/e2fsprogs-1.47.2/tests/progs/../../lib/ss ../../lib/ss/mk_cmds ../../../sources/e2fsprogs-1.47.2/tests/progs/test_icount_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../../sources/e2fsprogs-1.47.2/t
 ests/progs/crcsum.c -o crcsum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../sources/e2fsprogs-1.47.2/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  test_icount_cmds.c -o test_icount_c
 mds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../../lib  -o crcsum crcsum.o ../../lib/libe
 xt2fs.so ../../lib/libss.so  ../../lib/libcom_err.so  -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/sources/e2fsprogs-1.47.2=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../../lib  -o test_icount test_icount.o test
 _icount_cmds.o ../../lib/libext2fs.so ../../lib/libss.so  ../../lib/libcom_err.so  -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/progs'
| making all in tests/fuzz
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/fuzz'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/fuzz'
| making all in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| test ! -f ../../sources/e2fsprogs-1.47.2/po/e2fsprogs.pot || \
|   test -z "../../sources/e2fsprogs-1.47.2/po/ca.gmo ../../sources/e2fsprogs-1.47.2/po/cs.gmo ../../sources/e2fsprogs-1.47.2/po/da.gmo ../../sources/e2fsprogs-1.47.2/po/de.gmo ../../sources/e2fsprogs-1.47.2/po/eo.gmo ../../sources/e2fsprogs-1.47.2/po/es.gmo ../../sources/e2fsprogs-1.47.2/po/fi.gmo ../../sources/e2fsprogs-1.47.2/po/fr.gmo ../../sources/e2fsprogs-1.47.2/po/fur.gmo ../../sources/e2fsprogs-1.47.2/po/hu.gmo ../../sources/e2fsprogs-1.47.2/po/id.gmo ../../sources/e2fsprogs-1.47.2/po/it.gmo ../../sources/e2fsprogs-1.47.2/po/ms.gmo ../../sources/e2fsprogs-1.47.2/po/nl.gmo ../../sources/e2fsprogs-1.47.2/po/pl.gmo ../../sources/e2fsprogs-1.47.2/po/pt.gmo ../../sources/e2fsprogs-1.47.2/po/ro.gmo ../../sources/e2fsprogs-1.47.2/po/sr.gmo ../../sources/e2fsprogs-1.47.2/po/sv.gmo ../../sources/e2fsprogs-1.47.2/po/tr.gmo ../../sources/e2fsprogs-1.47.2/po/uk.gmo ../../sources/e2fsprogs-1.47.2/po/vi.gmo ../../sources/e2fsprogs-1.47.2/po/zh_CN.gmo" || make ../../sources/e2fsprogs-1.47.
 2/po/ca.gmo ../../sources/e2fsprogs-1.47.2/po/cs.gmo ../../sources/e2fsprogs-1.47.2/po/da.gmo ../../sources/e2fsprogs-1.47.2/po/de.gmo ../../sources/e2fsprogs-1.47.2/po/eo.gmo ../../sources/e2fsprogs-1.47.2/po/es.gmo ../../sources/e2fsprogs-1.47.2/po/fi.gmo ../../sources/e2fsprogs-1.47.2/po/fr.gmo ../../sources/e2fsprogs-1.47.2/po/fur.gmo ../../sources/e2fsprogs-1.47.2/po/hu.gmo ../../sources/e2fsprogs-1.47.2/po/id.gmo ../../sources/e2fsprogs-1.47.2/po/it.gmo ../../sources/e2fsprogs-1.47.2/po/ms.gmo ../../sources/e2fsprogs-1.47.2/po/nl.gmo ../../sources/e2fsprogs-1.47.2/po/pl.gmo ../../sources/e2fsprogs-1.47.2/po/pt.gmo ../../sources/e2fsprogs-1.47.2/po/ro.gmo ../../sources/e2fsprogs-1.47.2/po/sr.gmo ../../sources/e2fsprogs-1.47.2/po/sv.gmo ../../sources/e2fsprogs-1.47.2/po/tr.gmo ../../sources/e2fsprogs-1.47.2/po/uk.gmo ../../sources/e2fsprogs-1.47.2/po/vi.gmo ../../sources/e2fsprogs-1.47.2/po/zh_CN.gmo
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f ca.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o ca.1po ca.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o ca.gmo ca.1po && rm -f ca.1po
| ca.1po: 1230 translated messages.
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f cs.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o cs.1po cs.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o cs.gmo cs.1po && rm -f cs.1po
| cs.1po: 1662 translated messages.
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f da.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o da.1po da.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o da.gmo da.1po && rm -f da.1po
| da.1po: 1344 translated messages.
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f de.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o de.1po de.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o de.gmo de.1po && rm -f de.1po
| de.po:2021: warning: internationalized messages should not contain the '\b' escape sequence
| de.1po: 1490 translated messages.
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f eo.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o eo.1po eo.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o eo.gmo eo.1po && rm -f eo.1po
| eo.1po: 902 translated messages.
| cd ../../sources/e2fsprogs-1.47.2/po && rm -f es.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o es.1po es.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o es.gmo es.1po && rm -f es.1po
| es.1po:984: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1208: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1213: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1310: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1337: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1709: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1757: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| es.1po:1771: format specifications in 'msgid' and 'msgstr' for argument 1 are not the same
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal errors
| es.1po: 1662 translated messages.
| make[3]: *** [Makefile:257: ../../sources/e2fsprogs-1.47.2/po/es.gmo] Error 1
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| make[2]: *** [Makefile:295: ../../sources/e2fsprogs-1.47.2/po/stamp-po] Error 2
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| make[1]: *** [Makefile:445: all-progs-recursive] Error 1
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make: *** [Makefile:373: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 183
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 167
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 162
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 157
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 152
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489, line 196
NOTE: recipe e2fsprogs-1.47.2-r0: task do_compile: Failed
NOTE: recipe perl-5.40.2-r0: task do_install: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_install: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2084 tasks of which 1483 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701081246.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701081246.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/log.do_compile.54489
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: e2fsprogs-1.47.2-r0 do_compile: oe_runmake failed
ERROR: e2fsprogs-1.47.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.54489' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/log.do_compile.54489
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile) failed with exit code '1'

--===============7638183582564571720==--

