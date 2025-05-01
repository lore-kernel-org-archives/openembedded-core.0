Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE9DC3ABCE
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1778.1746113612625078747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PZX2aAIk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DDXLTFXH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101968c7b58fd-735a7e08-5839-4b16-9537-dc8c5bfa0ed5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113616;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TskcDHMda/LFAr0KuJgPY888PTquNTelMWw0P2+w2LI=;
	b=PZX2aAIklTIqXjNX2BAikKjD4QgnakAm4fxT731BoWOZ9ylcN2ux1MLT07snAr3x
	mvvIi2aqhaJahv5ZPtehtJBO7Fv43++KvpEnF+TQfaOvn/275sGZYx6uJFI7eI/Wusv
	2GQFjcAn28G7dkIrSJb7Rb4qmsvSxMM8KrwMXnKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113616;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TskcDHMda/LFAr0KuJgPY888PTquNTelMWw0P2+w2LI=;
	b=DDXLTFXHUhlI/G+NlC3/WhSTmB18e+49dOLpGygeKMs1U7qrm7c7oX8nEY6lLahh
	KjPOX3oia/A6Fn2EksEwRFmIpDR2WyOxTbR9DCI3XxnaIqvlD5yPBI+m+9iVytIyLjn
	KgfHznc1X/O5mIlj4KzPg78QyjzQWpFiHihFf6N4=
Content-Type: multipart/mixed; boundary="===============7603145011456172571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.47.2 FAILED
Message-ID: <010101968c7b58fd-735a7e08-5839-4b16-9537-dc8c5bfa0ed5-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215807

--===============7603145011456172571==
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
From 87798d7dd18811b0cd6b56b6c33561fab5fabe83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:22:55 +0000
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
index 4cd1098597..f6d45e2b7a 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
+From 134dcbea9fb190622587110be858968c8f13a79a Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index 2dbeba1095..0acb1aeada 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,4 +1,4 @@
-From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
+From 394052a4706ee1092c20a19c4c8679f068352d75 Mon Sep 17 00:00:00 2001
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
index f4e1057a36..85cd02a329 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,4 +1,4 @@
-From 25db5ac7469cedd043a04bcf49ce7553979fbb32 Mon Sep 17 00:00:00 2001
+From 378eb135bf3ec220bb3ceba3d87885500c702466 Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
 Date: Sat, 18 Apr 2015 17:58:17 +0300
 Subject: [PATCH] e2fsprogs: add ptest
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 4ba150e27d..fc23438e27 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
+From bf160ac2dd8a16b8b3e9113091d85e2edd82fdd0 Mon Sep 17 00:00:00 2001
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
index 307088d42b..c25441285e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
@@ -1,4 +1,4 @@
-From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
+From 005fb9b4569ddb0007c64b6784717ea17fd834cd Mon Sep 17 00:00:00 2001
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


--===============7603145011456172571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.47.1-1.47.2.patch"

RnJvbSA4Nzc5OGQ3ZGQxODgxMWIwY2Q2YjU2YjZjMzM1NjFmYWI1ZmFiZTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODoyMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGUy
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
aW9uLWRlbmllZC5wYXRjaAppbmRleCA0Y2QxMDk4NTk3Li5mNmQ0NWUyYjdhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJvZ3MtZml4
LW1pc3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL2UyZnNwcm9ncy1maXgtbWlzc2luZy1j
aGVjay1mb3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFj
NzA3OGZkYTZkMjNmMWQ4MGIwZDk1YWMzZTkwODM2NDc0OWUxODggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDEzNGRjYmVhOWZiMTkwNjIyNTg3MTEwYmU4NTg5NjhjOGYxM2E3OWEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxMCBBdWcgMjAxNiAxMToxOTo0NCArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBGaXggbWlzc2luZyBjaGVjayBmb3IgcGVybWlzc2lvbiBkZW5pZWQuCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rp
cl9wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtk
aXJfcC5wYXRjaAppbmRleCAyZGJlYmExMDk1Li4wYWNiMWFlYWRhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rpcl9wLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL21rZGlyX3AucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxNDNhOTAwMTk5YzViYjEwYjI4ZjNmYzhmNGQzNmJiYjZm
ZmRkNWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM5NDA1MmE0NzA2ZWUxMDkyYzIw
YTE5YzRjODY3OWYwNjgzNTJkNzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb2Ug
U2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDcgTWFyIDIwMTcgMTQ6
NTM6MTkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dzOiBleHBhbmQgQG1rZGlyX3BA
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDEzMWNhZWYzLi5jYTQ0OGQ5
NyAxMDA2NDQKK2luZGV4IDFmNjc2MDQwLi44YmUwYzFlMCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtOTM4LDYgKzkzOCw4IEBAIEFDX1NVQlNUKFBB
Q0tBR0UpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNw
cm9ncy9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzL3B0ZXN0LnBhdGNoCmluZGV4IGY0ZTEwNTdhMzYuLjg1Y2QwMmEzMjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNWRiNWFjNzQ2OWNlZGQwNDNhMDRiY2Y0OWNlNzU1Mzk3
OWZiYjMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNzhlYjEzNWJmM2VjMjIwYmIz
Y2ViYTNkODc4ODU1MDBjNzAyNDY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1p
dHJ5IEVyZW1pbi1Tb2xlbmlrb3YgPGRtaXRyeV9lcmVtaW5AbWVudG9yLmNvbT4KIERhdGU6IFNh
dCwgMTggQXByIDIwMTUgMTc6NTg6MTcgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dz
OiBhZGQgcHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mv
ZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJm
c3Byb2dzL2UyZnNwcm9ncy9xdWlldC1kZWJ1Z2ZzLnBhdGNoCmluZGV4IDRiYTE1MGUyN2QuLmZj
MjM0MzhlMjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Uy
ZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYjY2Yzk3M2UwMDRlMGM0NThlZjI3NWI0MWFjMmQ4ZDlmZjMzZDI5ZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYmYxNjBhYzJkZDhhMTZiOGIzZTkxMTMwOTFkODVlMmVkZDgyZmRk
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
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
LmNhbGwucGF0Y2gKaW5kZXggMzA3MDg4ZDQyYi4uYzI1NDQxMjg1ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcmVtb3ZlLmxkY29uZmlnLmNh
bGwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3Mv
cmVtb3ZlLmxkY29uZmlnLmNhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk3MjA4Njkz
NWQ2YzdmNmU2MDMwMDRmZDdmOTRiZDEzYTY1ZjQ3MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDAwNWZiOWI0NTY5ZGRiMDAwN2M2NGI2Nzg0NzE3ZWExN2ZkODM0Y2QgTW9uIFNlcCAx
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

--===============7603145011456172571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:05294437dbe101abc432a67d6cf2f160e78e1cdc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 497 Local 248 Mirrors 0 Missed 249 Current 335 (49% match, 70% complete)
Removing 68 stale sstate objects for arch qemux86_64...done.
Removing 52 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 451 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 531 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-78.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 592 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-78.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 633 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 642 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 645 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 652 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 653 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 654 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 677 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 688 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 700 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 702 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 703 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 716 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 718 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 719 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 720 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 722 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 724 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 727 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 736 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 738 of 832 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 744 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 751 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 752 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 755 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 762 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 764 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 770 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 773 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 774 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 776 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 780 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 781 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 785 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 789 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 790 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 802 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 803 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 804 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 807 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 417 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 518 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 519 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: Running task 559 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 638 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 646 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 648 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 652 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 660 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 662 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 664 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running task 666 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 813 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 816 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 670 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: Running task 673 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 682 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: Running task 683 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: Running task 688 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 689 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 690 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 691 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 694 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 695 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: Running setscene task 823 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running setscene task 827 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 707 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 729 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 733 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 735 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 830 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 783 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: Running task 796 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: Running task 799 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: Running task 800 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 811 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running task 832 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 833 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: Running task 834 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: Running task 836 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: Running task 837 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 839 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: Running task 855 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: Running task 856 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 896 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: Running task 897 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: Running task 898 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: Running task 900 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: Running task 902 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: Running task 905 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: Running task 906 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 907 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 909 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 910 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 912 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 913 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: Running task 919 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: Running task 988 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: Running task 990 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: Running task 997 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: Running task 998 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: Running task 1001 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1004 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: Running task 1006 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: Running task 1007 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1013 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 1018 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: Running task 1020 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 1021 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: Running task 1026 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: Running task 1027 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Started
NOTE: Running task 1033 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: Running task 1036 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 1060 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1071 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_fetch)
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1074 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_fetch: Started
NOTE: Running task 1075 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: Running task 1081 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: Running task 1082 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: Running task 1103 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1107 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1108 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_unpack: Started
NOTE: Running task 1118 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: Running task 1119 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1125 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1126 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1138 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: Running task 1139 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_patch: Started
NOTE: Running task 1140 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch unihash changed to 30823ae2e47bd97f3faa0dd95a80e1baa52d233e9cf834e71befc20298cbaafe
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1141 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 1143 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure)
NOTE: Running task 1144 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: Running task 1145 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: Running task 1149 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 1150 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: Running task 1151 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: Running task 1152 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: Running task 1153 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: Running task 1154 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1156 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: Running task 1162 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 1163 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: Running task 1164 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: Running task 1168 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: Running task 1171 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: Running task 1174 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1184 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: Running task 1185 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1187 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1189 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1191 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: Running task 1194 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: Running task 1195 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1196 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1199 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: Running task 1204 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1205 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1206 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1207 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_fetch)
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: Running task 1216 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 1219 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: Running task 1221 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_fetch)
NOTE: Running task 1222 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: Running task 1223 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe diffutils-3.11-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe diffutils-3.11-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: Running task 1231 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: Running task 1232 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1244 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1251 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: Running task 1252 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1254 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1261 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1262 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1264 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_unpack)
NOTE: Running task 1265 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe diffutils-3.11-r0: task do_unpack: Started
NOTE: Running task 1281 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1283 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1286 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: Running task 1290 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe diffutils-3.11-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 1292 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_patch)
NOTE: Running task 1293 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: Running task 1294 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: Running task 1301 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1305 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1310 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1312 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe diffutils-3.11-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1323 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: Running task 1324 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1325 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1327 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1330 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe diffutils-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1331 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: Running task 1332 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1334 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: Running task 1335 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1337 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1339 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1351 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: Running task 1352 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_patch)
NOTE: Running task 1356 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1357 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Running task 1358 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_fetch)
NOTE: Running task 1359 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1360 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: Running task 1363 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1372 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_write_config)
NOTE: Running task 1373 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running task 1379 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1411 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_write_config)
NOTE: Running task 1412 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_write_config: Succeeded
NOTE: Running task 1413 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1417 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1419 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1425 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: Running task 1427 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1429 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1433 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_warn_musl)
NOTE: Running task 1434 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_deploy_source_date_epoch unihash changed to e95dfb4e5ffe294697a0e633df18820bf1d432c35e2abf30a880d743b004b79d
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1435 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: Running task 1436 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_unpack)
NOTE: Running task 1439 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_write_config)
NOTE: Running task 1441 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Started
NOTE: Setscene tasks completed
NOTE: Running task 1447 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Succeeded
NOTE: Running task 1448 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: Running task 1463 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 1493 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: Running task 1496 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Started
NOTE: Running task 1502 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Started
NOTE: Running task 1503 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_lic)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: Running noexec task 1507 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1508 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1509 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Succeeded
NOTE: Running task 1510 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1511 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.2-r0: task do_populate_lic: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: Running task 1513 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_lic unihash changed to 4a56dfae6ad43822818ad13e7098312db152a8b9a2991867708a3623e620443a
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1518 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe wayland-protocols-1.42-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_compile)
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1520 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_compile: Succeeded
NOTE: Running task 1523 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_install)
NOTE: recipe wayland-protocols-1.42-r0: task do_install: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Succeeded
NOTE: Running task 1525 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_patch)
NOTE: recipe wayland-protocols-1.42-r0: task do_install: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_patch: Started
NOTE: recipe systemd-1_257.5-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Running task 1542 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_configure)
NOTE: recipe glibc-2.41+git-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_compile)
NOTE: recipe glibc-2.41+git-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_configure: Succeeded
NOTE: Running task 1545 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_install: Succeeded
NOTE: Running task 1547 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1548 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1549 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_configure)
NOTE: recipe libarchive-native-3.7.9-r0: task do_configure: Started
NOTE: recipe libarchive-native-3.7.9-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_compile)
NOTE: recipe libarchive-native-3.7.9-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.7.9-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_install)
NOTE: recipe libarchive-native-3.7.9-r0: task do_install: Started
NOTE: recipe libarchive-native-3.7.9-r0: task do_install: Succeeded
NOTE: Running task 1552 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1553 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_compile)
NOTE: recipe elfutils-native-0.192-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.192-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_install)
NOTE: recipe elfutils-native-0.192-r0: task do_install: Started
NOTE: recipe elfutils-native-0.192-r0: task do_install: Succeeded
NOTE: Running task 1557 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.192-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.192-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1558 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1559 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_configure)
NOTE: Running task 1561 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1564 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_install)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_install: Succeeded
NOTE: Running task 1567 of 2274 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1568 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
NOTE: Running task 1569 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1570 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package)
NOTE: Running task 1571 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1572 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_package: Started
NOTE: recipe glibc-2.41+git-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_install)
NOTE: recipe wayland-protocols-1.42-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package unihash changed to e5660d726a9a41799edbc0b7e8c65365f69888f30ee830bf5042ed183ba55616
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx became valid
NOTE: recipe glibc-2.41+git-r0: task do_install: Started
NOTE: Running setscene task 822 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 66aebf965282c6bff97cafd21dbd3d2bfc98190d807903761378c37e6e88fb6e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to 5905b40c1527609cb0fe44e61252861e2254e6c9959157cbbca4732d1ff135a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx became valid
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package unihash changed to 9514955c58367f6c13b9065d84c4ab04b40e2bfbe25001d93131cbc431be7660
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx became valid
NOTE: Running setscene task 804 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1588 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1591 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package)
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_configure)
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1595 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_install)
NOTE: recipe libgcc-14.2.0-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1596 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_multilib_install)
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1597 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1599 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package unihash changed to 2cdff9a00a57c75d6af99ae483d42d5c36dd04bab32f426abb65309d3da3c9de
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx became valid
NOTE: Running setscene task 796 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1602 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package)
NOTE: Running task 1604 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package unihash changed to b87f1dfc1caf7627c4d8becd181f15b8631de550bc80046694b2b2dae71eb54c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata became valid
NOTE: Running setscene task 793 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1607 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1608 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1616 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1618 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1619 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1620 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1621 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1625 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1626 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1627 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1628 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1629 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1630 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1631 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1632 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: Running task 1633 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1634 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe libffi-3.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1636 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure)
NOTE: Running task 1637 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_configure)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1638 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1639 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1640 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_configure)
NOTE: Running task 1641 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Started
NOTE: Running task 1642 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_configure)
NOTE: Running task 1643 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Started
NOTE: Running task 1644 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: recipe libffi-3.4.7-r0: task do_configure: Started
NOTE: Running task 1645 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1646 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_configure)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1647 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: Running task 1648 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1649 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1651 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1652 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1654 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure)
NOTE: recipe openssl-3.5.0-r0: task do_configure: Started
NOTE: recipe expat-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1658 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1659 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1661 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1662 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1664 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_compile)
NOTE: Running task 1665 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1667 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1668 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_install)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1671 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 1672 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1674 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Succeeded
NOTE: Running task 1676 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package unihash changed to 338497bdb86f57b69fcd3ba8cb53c2a543f0e0fe5c75f06d361cf9f680d110b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx became valid
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 692 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1677 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1678 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_compile)
NOTE: Running task 1679 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1680 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1683 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1685 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 1688 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_compile)
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1690 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1691 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Succeeded
NOTE: Running task 1692 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libffi-3.4.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1694 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_compile)
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: Running task 1695 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.4.7-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1697 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: Running task 1698 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to dd341348483f036414709721b6fd2e01f281e25b676ed7a725d705e7d370b302
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running task 1699 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: Running task 1701 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1705 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1707 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1708 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_configure)
NOTE: recipe libffi-3.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_install)
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Succeeded
NOTE: Running task 1710 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_install)
NOTE: recipe libpcre2-10.45-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libffi-3.4.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 33bb2dc006ec00aea86e82b2d23549c39d924d2e8ee894f01b12f6c731b679fb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Succeeded
NOTE: Running setscene task 814 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1712 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_compile)
NOTE: recipe openssl-3.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1715 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1716 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile)
NOTE: recipe libffi-3.4.7-r0: task do_install: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1718 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_package)
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Started
NOTE: recipe libffi-3.4.7-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1721 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_configure)
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: Setscene tasks completed
NOTE: Running task 1723 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_install)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1725 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1728 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Succeeded
NOTE: Running task 1729 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: Running task 1731 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1733 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 1249733a7ee7db0b72c6b7a54672ec7fcb4276a9b808c819a781f94573d592c6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe libffi-3.4.7-r0: task do_package: Succeeded
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1734 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_package unihash changed to bc1b4981690a71a4492a541c331284bde47b5bdd03642c818b26f933bde512ba
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package unihash changed to d4c115ddbb1a241ab4411c6303c0f4ebdb5dcad571913794d003fca1bee5abf5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx became valid
NOTE: Running setscene task 815 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 818 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1735 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: Running task 1736 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1737 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1740 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1742 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Started
NOTE: Running task 1744 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1747 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe expat-2.7.1-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1748 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package unihash changed to 043b467d49b7880ef4e1d222c1a7c3de90fdb7f8df89769722c6c511b1124bd8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: Running setscene task 821 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running task 1749 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1750 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe perl-5.40.2-r0: task do_configure: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1752 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1753 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1754 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package unihash changed to 1852c1f6f51ea14e66d0108d42f5752224fa585835709c94435655da7aecf52f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata became valid
NOTE: Running setscene task 815 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1756 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 6215472a63bcd100bf153b9d739fb85baa88c1f2e0ef1f5fe875546f144d5321
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Running setscene task 821 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1758 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1759 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Running task 1760 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 75d29cc5be1dea5c6b3b980a5b85689afa40d3d0cd77b8c2d59b893d02951269
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: Running setscene task 818 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: Running task 1761 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: Running task 1762 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1767 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1768 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package unihash changed to 804407c02431959148c08174231fdf3db098e92c47650e266aeb1e6d84eefeb9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx became valid
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running task 1769 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_install)
NOTE: Running task 1771 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_compile)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libpcre2-10.45-r0: task do_compile: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1774 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1776 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1778 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1779 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe xz-5.8.1-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1780 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package unihash changed to 1cb8ddfaa80c2f6c260dba39d6c6ccebe23dcb5b0de8322b2ed73e56b73e7b01
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata became valid
NOTE: Running setscene task 820 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1783 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1785 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1786 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: Running task 1787 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1788 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: Running task 1790 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe libcap-2.75-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe libcap-2.75-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1791 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_configure)
NOTE: Running task 1793 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libcap-2.75-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1794 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1795 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1796 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_install: Succeeded
NOTE: Running task 1797 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1798 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe diffutils-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package)
NOTE: recipe diffutils-3.11-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_compile: Succeeded
NOTE: Running task 1802 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_install)
NOTE: recipe libpcre2-10.45-r0: task do_install: Started
NOTE: recipe libcap-2.75-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: recipe libcap-2.75-r0: task do_install: Started
NOTE: Running task 1804 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.45-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1814 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: Running task 1816 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1817 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_compile: Started
NOTE: recipe libcap-2.75-r0: task do_install: Succeeded
NOTE: Running task 1821 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1822 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Running task 1823 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 568154fb50dc76c86c99ba2ff077dca2ee50fd61abca32e5890920dcef4d11b9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: Running setscene task 822 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to 57b36b5e36ef1f22832bf44e61833fb878f59bfbec46e396a4de3820e1c1a402
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx became valid
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_install: Succeeded
NOTE: Running setscene task 820 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running task 1827 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: Running task 1829 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_package)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1836 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package)
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: Running task 1839 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1840 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: recipe xz-5.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package unihash changed to c75b5768b5079118ae5ba8e43414eeef70b9b4efc2ad0323527dc0485e2d23b2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: Running setscene task 815 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running task 1841 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: Running task 1842 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1844 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1845 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1847 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to 0b1ee8ec778cbdfe9e5ece4e8ac3429caf75ed67d503cecbeb4d55508f55a6ac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx became valid
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_package unihash changed to d31cdafec111805aba774e989ff4ef6dd459d46f46104f207b6f064fc0916024
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 3784fc6ec2fb2e47bdd5d1fd35e64dddd4ce94e37c1c672268f6a8e639a18b0a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx became valid
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Succeeded
NOTE: Running setscene task 800 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package unihash changed to 5fc5e5ca1569c7b4c22ec7dd3a921ddd34a365ea36781f837464b45745cf8789
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx became valid
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running task 1849 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1850 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1852 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1854 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1858 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1860 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: Running task 1861 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libpcre2-10.45-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure)
NOTE: recipe findutils-4.10.0-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1864 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package)
NOTE: recipe libcap-2.75-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1866 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to 1a0f1f0f41dccdfb96082bb00c4f4a0bee57ddabe54c5f5a9004e31219e869ee
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1868 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 2f4903ebacd56a5b58d562b83dc512eec0737e369a9dadb98cab11711c03fb5d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx became valid
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 7c5b05ebfb441884a11c6ce11098528a8374a9cae70868c84d9e3079ac867ffb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_package: Succeeded
NOTE: recipe libcap-2.75-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package unihash changed to 099e7c6ff249caf540e7c122b40f6e2a5b8d7e88dd2b7ecfb34c9e8c82bad554
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package unihash changed to 537436a149c5774284a3a64a564229f664cc491dab1af5e6c7c28b7610535fe7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx_setscene)
NOTE: Running setscene task 822 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1870 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.75-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1875 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1877 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1880 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to f45d976c37be799d2a701d6e1b45ee8f81d2ed1f1a2ff35471f5815fa5742039
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx became valid
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to 59e7be3fb26dfa2a750b7d6d943ec3396a4202d9fa293925a3611f1f4b40e520
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1891 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_collect_spdx_deps)
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1892 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 1900 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1909 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_compile)
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1923 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.3-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1924 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_configure)
NOTE: Running noexec task 1925 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_compile)
NOTE: Running task 1926 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_install)
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1941 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_collect_spdx_deps)
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1942 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1943 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1944 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1945 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1946 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1947 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1948 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to 8d62a980348d85ab00788b5d62e7e7dd37a48272532da08d36d22639e0790cf3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1950 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_install)
NOTE: recipe shadow-4.17.3-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to a8447a606ab5fdb6b411c5525999c9b7924d679519c6efc8642b656369bb6e65
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: Running setscene task 823 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1956 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1957 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package)
NOTE: Running task 1960 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.3-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1965 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: Running task 1967 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1968 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: Running task 1970 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1971 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Succeeded
NOTE: Running task 1973 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package)
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1974 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1975 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: Running task 1976 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 52c0c75c779a6d9d2f7213ff769c57ed6976ce28a1f58dba6b8977bf3123b2b0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: Running setscene task 827 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1980 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package unihash changed to a4f4a31c888825ddb1a2d7b55a7f5dc96ff11c1e3bd84b5f2092f9fbbaa161af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata became valid
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1983 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1985 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1986 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1988 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Succeeded
NOTE: Running task 1990 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to e4c29d8418ab8f3f78bd404ae63fcf06ac587fdf59f83be238cca721114f0250
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1995 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 2eb938e8c0bb0708ec683701a766fef36fbbfb9beb631683c11da57dbbdfc33c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package unihash changed to 9f8995f81890a3c65ff850b6f9ceeeb19777b3f46ad070a51f400c1010631e93
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata became valid
NOTE: Running setscene task 816 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to c703188f7a238cfc419f53e71c342b5c2a3bfe0ad9737cbfacd7d42a8d0ab085
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: recipe openssl-3.5.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running task 2001 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2002 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.5.0-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to 2c83300267987e98caeaaf09b0c6fc21c06a9909bdf7134674a2b0edff977f86
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx became valid
NOTE: recipe openssl-3.5.0-r0: task do_install: Succeeded
NOTE: Running setscene task 822 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running task 2005 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install_ptest_base)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: recipe diffutils-3.11-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: Running task 2009 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_configure_ptest_base)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe diffutils-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2010 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_compile)
NOTE: recipe diffutils-3.11-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 2012 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 2014 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to ea8443ff682b156363e36eef580f856ea817fe285e9dfb3605d98fa0fbbc712e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffutils-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2016 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.11-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2017 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_install)
NOTE: recipe diffutils-3.11-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 2748e09d3e25d05762fdcc353a3353df584f0e1f7afc3fec2ac2b799d6598d98
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx became valid
NOTE: Running setscene task 827 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffutils-3.11-r0: task do_install: Succeeded
NOTE: Running task 2020 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2021 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_package)
NOTE: recipe diffutils-3.11-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 2024 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2025 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2026 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 2027 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2028 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2029 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2030 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_configure)
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2031 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_configure)
NOTE: Running task 2032 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Started
NOTE: Running task 2033 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe bash-5.2.37-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2034 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure)
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Started
NOTE: recipe diffutils-3.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_package unihash changed to 78fd17d841d00bb9744b0ab104126075960c6391f10c3c83cf99bfb2f5b6c127
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_packagedata became valid
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_create_spdx_setscene)
NOTE: recipe diffutils-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe findutils-4.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2037 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2038 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_compile: Started
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2040 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package)
NOTE: Running task 2041 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2.13-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2042 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_compile)
NOTE: Running task 2043 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe readline-8.2.13-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Succeeded
NOTE: Running task 2044 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_compile)
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to bfc8992ce99ada72e7ec9e74fe79b41205b949f2b49981e5c93caed5e359d179
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: Running setscene task 819 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2045 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2048 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_collect_spdx_deps)
NOTE: Running task 2049 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_collect_spdx_deps)
NOTE: recipe readline-8.2.13-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_install)
NOTE: Running task 2052 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe findutils-4.10.0-r0: task do_install: Started
NOTE: recipe readline-8.2.13-r0: task do_install: Started
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2053 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_install)
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Started
NOTE: recipe readline-8.2.13-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2056 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2.13-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Succeeded
NOTE: Running task 2059 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2060 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package)
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure)
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Started
NOTE: recipe python3-3.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure: Started
NOTE: recipe python3-3.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_configure)
NOTE: recipe python3-3.13.2-r0: task do_configure: Started
NOTE: recipe findutils-4.10.0-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2064 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 2065 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2066 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2068 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile)
NOTE: recipe readline-8.2.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package unihash changed to ed3f59f8d4e4ff3f0e4fb9c2cf58403757d283e76d63870a84a22f887e3ca508
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata became valid
NOTE: recipe perl-5.40.2-r0: task do_compile: Started
NOTE: Running setscene task 829 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package unihash changed to 0f48d349f8bd3cd09863aa7ebec4b90de5f29ce4862b5ae47e16128411d1dc2a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx became valid
NOTE: Running setscene task 824 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2072 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 2073 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package unihash changed to 3fad15569706a22c993cfe096349afb5a2190cb496e2b45efa897d3ebea62d31
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata became valid
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2075 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe openssl-3.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package unihash changed to 87f3b5f92cbfc3be1edef0e2e5b866f1fc47faa436549f5ab2c50a101f96c99b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx became valid
NOTE: Running setscene task 823 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2077 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 2079 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_collect_spdx_deps)
NOTE: Running task 2080 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 14b3f0e741b1890c5f684cf9afee1b73b25ed260fcbe68390cd2d8641ad236b7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 830 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2084 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2086 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2087 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 320a0f9dec28452cf597c12ad983ec969d5cc0b256871b1f0a5312f72ca1e2db
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to d03d041926817c8f2ac83b7dda7af93cb4efdf2e36fef4ac7d8033f66639682f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 828 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2090 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2091 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile)
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_compile: Succeeded
NOTE: Running task 2092 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2093 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2094 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2095 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2096 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2097 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile)
NOTE: recipe gawk-5.3.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Succeeded
NOTE: Running task 2098 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_install: Succeeded
NOTE: Running task 2099 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2100 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install)
NOTE: recipe util-linux-2.40.4-r0: task do_install: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2101 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_install: Succeeded
NOTE: Running task 2102 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2103 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install)
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_install: Started
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2104 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package)
NOTE: recipe bash-5.2.37-r0: task do_package: Started
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2108 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2109 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package)
NOTE: Running task 2110 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2111 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure: Started
NOTE: recipe gawk-5.3.2-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 2113 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2114 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2116 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package)
NOTE: recipe gawk-5.3.2-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package unihash changed to 16b9892a5ee13d92a46990ff272a264f47510275c1f52c50935a9c9529a3f41b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb became valid
NOTE: Running setscene task 814 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 817 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 820 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 826 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2121 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm unihash changed to 1c9f5f97338997c3942ce8b4873d5401761d18d0be9548bcb8526c4ca687801b
NOTE: recipe gawk-5.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package unihash changed to d77942b8397d0051bdb0eac3da6c0df62ccfcf74e76c30036cfde364f657383e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.13.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2124 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.13.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.13.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2125 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_compile)
NOTE: recipe python3-3.13.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure: Succeeded
NOTE: Running task 2126 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2127 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package unihash changed to d8f77126a381eb3ae21ba3d8aa7c6951163a80c933d7861957f606634c330ac4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx became valid
NOTE: Running setscene task 825 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2130 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package unihash changed to 21532d513ad78caf49ba4cb9943245358410fc5d891a73c7f0c095d4b8cd935e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx became valid
NOTE: Running setscene task 831 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 832 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_compile: Succeeded
NOTE: Running task 2131 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2134 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_install: Started
NOTE: recipe python3-3.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_compile_ptest_base)
NOTE: recipe python3-3.13.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2136 of 2274 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_install)
NOTE: recipe python3-3.13.2-r0: task do_install: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| cd ./util ; make subst
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/util'
| echo "/* fake dirpaths.h for config.h */" > dirpaths.h
| gcc  -c  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/include -O2 -pipe ../../git/util/subst.c -o subst.o
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
| ./util/subst -f ./util/subst.conf ../git/lib/dirpaths.h.in lib/dirpaths.h
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| cd .; CONFIG_FILES=./lib/ext2fs/ext2_types.h ./config.status
| config.status: creating ./lib/ext2fs/ext2_types.h
| config.status: creating lib/config.h
| config.status: lib/config.h is unchanged
| config.status: executing po-directories commands
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| ../../util/subst -f ../../util/subst.conf ../../../git/lib/et/compile_et.sh.in compile_et
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/chmod +x compile_et
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/et'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| ../../util/subst -f ../../util/subst.conf ../../../git/lib/ext2fs/ext2_err.et.in ext2_err.et
| _ET_DIR_OVERRIDE=../../../git/lib/ext2fs/../et ../et/compile_et ext2_err.et
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/ext2fs'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/lib/support'
| _ET_DIR_OVERRIDE=../../../git/lib/support/../et ../et/compile_et ../../../git/lib/support/prof_err.et
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/et/error_message.c -o error_message.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/et/et_name.c -o et_name.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/et/init_et.c -o init_et.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/et/com_err.c -o com_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/et/com_right.c -o com_right.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/et_name.o -c ../../../git/lib/et/et_name.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/com_err.o -c ../../../git/lib/et/com_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/init_et.o -c ../../../git/lib/et/init_et.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/com_right.o -c ../../../git/lib/et/com_right.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/error_message.o -c ../../../git/lib/et/error_message.
 c
| (if test -r libcom_err.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libcom_err.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libcom_err.a libcom_err.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libcom_err.a error_message.o et_name.o init_et.o com_err.o com_right.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libcom_err.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/et | sed -e 's;lib/;;'`/libcom_err.a libcom_err.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libcom_err.so.2.1 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
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
| ../../util/subst -f ../../util/subst.conf ../../../git/lib/ss/mk_cmds.sh.in mk_cmds
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/chmod +x mk_cmds
| make -s real-subdirs
| _ET_DIR_OVERRIDE=../../../git/lib/ss/../et ../et/compile_et ../../../git/lib/ss/ss_err.et
| DIR=../../../git/lib/ss _SS_DIR_OVERRIDE=../../../git/lib/ss ./mk_cmds ../../../git/lib/ss/std_rqs.ct
| _ET_DIR_OVERRIDE=../../../git/lib/ss/../et ../et/compile_et ../../../git/lib/ss/ss_err.et
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c std_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/invocation.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/help.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/execute_cmd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/listen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/parse.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/error.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/prompt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/request_tbl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/list_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/pager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/requests.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/data.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ss/get_readline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ss_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/std_rqs.o -c std_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/ss_err.o -c ss_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/data.o -c ../../../git/lib/ss/data.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/prompt.o -c ../../../git/lib/ss/prom
 pt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/requests.o -c ../../../git/lib/ss/re
 quests.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/error.o -c ../../../git/lib/ss/error
 .c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/get_readline.o -c ../../../git/lib/s
 s/get_readline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/request_tbl.o -c ../../../git/lib/ss
 /request_tbl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/parse.o -c ../../../git/lib/ss/parse
 .c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/invocation.o -c ../../../git/lib/ss/
 invocation.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/execute_cmd.o -c ../../../git/lib/ss
 /execute_cmd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/list_rqs.o -c ../../../git/lib/ss/li
 st_rqs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/pager.o -c ../../../git/lib/ss/pager
 .c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/help.o -c ../../../git/lib/ss/help.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DSHARED_ELF_LIB -fPIC -shared -o elfshared/listen.o -c ../../../git/lib/ss/list
 en.c
| (if test -r libss.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libss.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libss.a libss.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libss.a ss_err.o std_rqs.o invocation.o help.o execute_cmd.o listen.o parse.o error.o prompt.o request_tbl.o list_rqs.o pager.o requests.o data.o get_readline.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libss.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ss | sed -e 's;lib/;;'`/libss.a libss.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libss.so.2.0 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/feature.c -o feature.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fgetflags.c -o fgetflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fsetflags.c -o fsetflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fgetversion.c -o fgetversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fsetversion.c -o fsetversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/getflags.c -o getflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/getversion.c -o getversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/hashstr.c -o hashstr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/iod.c -o iod.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/ls.c -o ls.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/ljs.c -o ljs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/mntopts.c -o mntopts.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/parse_num.c -o parse_num.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/pe.c -o pe.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/pf.c -o pf.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/ps.c -o ps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ps.o -c ../../../git/lib/e2p/ps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/pe.o -c ../../../git/lib/e2p/pe.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getversion.o -c ../../../git/lib/e2p/getversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/pf.o -c ../../../git/lib/e2p/pf.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/parse_num.o -c ../../../git/lib/e2p/parse_num.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getflags.o -c ../../../git/lib/e2p/getflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetversion.o -c ../../../git/lib/e2p/fsetversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/hashstr.o -c ../../../git/lib/e2p/hashstr.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetversion.o -c ../../../git/lib/e2p/fgetversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/iod.o -c ../../../git/lib/e2p/iod.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetflags.o -c ../../../git/lib/e2p/fgetflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetflags.o -c ../../../git/lib/e2p/fsetflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mntopts.o -c ../../../git/lib/e2p/mntopts.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/setflags.c -o setflags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/setversion.c -o setversion.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ljs.o -c ../../../git/lib/e2p/ljs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/uuid.c -o uuid.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/ostype.c -o ostype.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/percent.c -o percent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/crypto_mode.c -o crypto_mode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fgetproject.c -o fgetproject.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/fsetproject.c -o fsetproject.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/feature.o -c ../../../git/lib/e2p/feature.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/encoding.c -o encoding.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/e2p/errcode.c -o errcode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/setversion.o -c ../../../git/lib/e2p/setversion.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/setflags.o -c ../../../git/lib/e2p/setflags.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/uuid.o -c ../../../git/lib/e2p/uuid.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/percent.o -c ../../../git/lib/e2p/percent.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ostype.o -c ../../../git/lib/e2p/ostype.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crypto_mode.o -c ../../../git/lib/e2p/crypto_mode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ls.o -c ../../../git/lib/e2p/ls.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/errcode.o -c ../../../git/lib/e2p/errcode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fgetproject.o -c ../../../git/lib/e2p/fgetproject.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fsetproject.o -c ../../../git/lib/e2p/fsetproject.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/encoding.o -c ../../../git/lib/e2p/encoding.c
| (if test -r libe2p.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libe2p.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libe2p.a libe2p.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libe2p.a feature.o fgetflags.o fsetflags.o fgetversion.o fsetversion.o getflags.o getversion.o hashstr.o iod.o ls.o ljs.o mntopts.o parse_num.o pe.o pf.o ps.o setflags.o setversion.o uuid.o ostype.o percent.o crypto_mode.o fgetproject.o fsetproject.o encoding.o errcode.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libe2p.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/e2p | sed -e 's;lib/;;'`/libe2p.a libe2p.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libe2p.so.2.3 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/cstring.c -o cstring.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/mkquota.c -o mkquota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/plausible.c -o plausible.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/profile.c -o profile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/parse_qtype.c -o parse_qtype.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/print_fs_flags.c -o print_fs_flags.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/profile_helpers.c -o profile_helpers.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c prof_err.c -o prof_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/quotaio.c -o quotaio.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/quotaio_v2.c -o quotaio_v2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/quotaio_tree.c -o quotaio_tree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/dict.c -o dict.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/support/devname.c -o devname.o
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
| 	../../../git/lib/ext2fs/gen_crc32ctable.c
| touch subdirs
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/bb_compat.c -o bb_compat.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/inode_io.c -o inode_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/write_bb_file.c -o write_bb_file.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dupfs.c -o dupfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/imager.c -o imager.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/test_io.c -o test_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ext2_err.c -o ext2_err.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/alloc.c -o alloc.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/alloc_sb.c -o alloc_sb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/alloc_stats.c -o alloc_stats.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/alloc_tables.c -o alloc_tables.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/atexit.c -o atexit.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/badblocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/bb_inode.c -o bb_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/bitmaps.c -o bitmaps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ext2_err.o -c ext2_err.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/bitops.c -o bitops.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/write_bb_file.o -c ../../../git/lib/ext2fs/write_bb_f
 ile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bb_compat.o -c ../../../git/lib/ext2fs/bb_compat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/blkmap64_ba.c -o blkmap64_ba.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_sb.o -c ../../../git/lib/ext2fs/alloc_sb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dupfs.o -c ../../../git/lib/ext2fs/dupfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_stats.o -c ../../../git/lib/ext2fs/alloc_stats.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/atexit.o -c ../../../git/lib/ext2fs/atexit.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bb_inode.o -c ../../../git/lib/ext2fs/bb_inode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inode_io.o -c ../../../git/lib/ext2fs/inode_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bitmaps.o -c ../../../git/lib/ext2fs/bitmaps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/blkmap64_rb.c -o blkmap64_rb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc_tables.o -c ../../../git/lib/ext2fs/alloc_table
 s.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bitops.o -c ../../../git/lib/ext2fs/bitops.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/badblocks.o -c ../../../git/lib/ext2fs/badblocks.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/imager.o -c ../../../git/lib/ext2fs/imager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/blknum.c -o blknum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/alloc.o -c ../../../git/lib/ext2fs/alloc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/block.c -o block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/bmap.c -o bmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/test_io.o -c ../../../git/lib/ext2fs/test_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/check_desc.c -o check_desc.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/closefs.c -o closefs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/crc16.c -o crc16.o
| ./gen_crc32ctable > crc32c_table.h
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/csum.c -o csum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dblist.c -o dblist.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dblist_dir.c -o dblist_dir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blkmap64_ba.o -c ../../../git/lib/ext2fs/blkmap64_ba.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crc16.o -c ../../../git/lib/ext2fs/crc16.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dirblock.c -o dirblock.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dirhash.c -o dirhash.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/check_desc.o -c ../../../git/lib/ext2fs/check_desc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/dir_iterate.c -o dir_iterate.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/expanddir.c -o expanddir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dblist_dir.o -c ../../../git/lib/ext2fs/dblist_dir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blknum.o -c ../../../git/lib/ext2fs/blknum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/blkmap64_rb.o -c ../../../git/lib/ext2fs/blkmap64_rb.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/ext_attr.c -o ext_attr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/closefs.o -c ../../../git/lib/ext2fs/closefs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dirblock.o -c ../../../git/lib/ext2fs/dirblock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/extent.c -o extent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/fallocate.c -o fallocate.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dblist.o -c ../../../git/lib/ext2fs/dblist.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/expanddir.o -c ../../../git/lib/ext2fs/expanddir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/bmap.o -c ../../../git/lib/ext2fs/bmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dirhash.o -c ../../../git/lib/ext2fs/dirhash.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/block.o -c ../../../git/lib/ext2fs/block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/fileio.c -o fileio.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/finddev.c -o finddev.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/dir_iterate.o -c ../../../git/lib/ext2fs/dir_iterate.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/flushb.c -o flushb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/csum.o -c ../../../git/lib/ext2fs/csum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/freefs.c -o freefs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/gen_bitmap.c -o gen_bitmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/gen_bitmap64.c -o gen_bitmap64.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/finddev.o -c ../../../git/lib/ext2fs/finddev.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/get_num_dirs.c -o get_num_dirs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/get_pathname.c -o get_pathname.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/flushb.o -c ../../../git/lib/ext2fs/flushb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/getenv.c -o getenv.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/getsize.c -o getsize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/freefs.o -c ../../../git/lib/ext2fs/freefs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fileio.o -c ../../../git/lib/ext2fs/fileio.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/get_num_dirs.o -c ../../../git/lib/ext2fs/get_num_dir
 s.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/getsectsize.c -o getsectsize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/fallocate.o -c ../../../git/lib/ext2fs/fallocate.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/hashmap.c -o hashmap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getenv.o -c ../../../git/lib/ext2fs/getenv.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/i_block.c -o i_block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/get_pathname.o -c ../../../git/lib/ext2fs/get_pathnam
 e.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/icount.c -o icount.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getsize.o -c ../../../git/lib/ext2fs/getsize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/ind_block.c -o ind_block.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/initialize.c -o initialize.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/hashmap.o -c ../../../git/lib/ext2fs/hashmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/inline.c -o inline.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/getsectsize.o -c ../../../git/lib/ext2fs/getsectsize.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/inline_data.c -o inline_data.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/gen_bitmap.o -c ../../../git/lib/ext2fs/gen_bitmap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/i_block.o -c ../../../git/lib/ext2fs/i_block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ind_block.o -c ../../../git/lib/ext2fs/ind_block.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/gen_bitmap64.o -c ../../../git/lib/ext2fs/gen_bitmap6
 4.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/inode.c -o inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/io_manager.c -o io_manager.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/extent.o -c ../../../git/lib/ext2fs/extent.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/ismounted.c -o ismounted.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/link.c -o link.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ext_attr.o -c ../../../git/lib/ext2fs/ext_attr.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/llseek.c -o llseek.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/lookup.c -o lookup.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/mkdir.c -o mkdir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/mkjournal.c -o mkjournal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/icount.o -c ../../../git/lib/ext2fs/icount.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/llseek.o -c ../../../git/lib/ext2fs/llseek.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inline_data.o -c ../../../git/lib/ext2fs/inline_data.
 c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inline.o -c ../../../git/lib/ext2fs/inline.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/io_manager.o -c ../../../git/lib/ext2fs/io_manager.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/initialize.o -c ../../../git/lib/ext2fs/initialize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/lookup.o -c ../../../git/lib/ext2fs/lookup.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/mmp.c -o mmp.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/ismounted.o -c ../../../git/lib/ext2fs/ismounted.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mkdir.o -c ../../../git/lib/ext2fs/mkdir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/namei.c -o namei.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/native.c -o native.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/newdir.c -o newdir.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/nls_utf8.c -o nls_utf8.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/link.o -c ../../../git/lib/ext2fs/link.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/openfs.c -o openfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/native.o -c ../../../git/lib/ext2fs/native.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/orphan.c -o orphan.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mmp.o -c ../../../git/lib/ext2fs/mmp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/progress.c -o progress.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/punch.c -o punch.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/qcow2.c -o qcow2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/inode.o -c ../../../git/lib/ext2fs/inode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/mkjournal.o -c ../../../git/lib/ext2fs/mkjournal.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/newdir.o -c ../../../git/lib/ext2fs/newdir.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/namei.o -c ../../../git/lib/ext2fs/namei.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/read_bb.c -o read_bb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/read_bb_file.c -o read_bb_file.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/res_gdt.c -o res_gdt.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/progress.o -c ../../../git/lib/ext2fs/progress.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/rw_bitmaps.c -o rw_bitmaps.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/orphan.o -c ../../../git/lib/ext2fs/orphan.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/sha512.c -o sha512.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/swapfs.c -o swapfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/read_bb.o -c ../../../git/lib/ext2fs/read_bb.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/qcow2.o -c ../../../git/lib/ext2fs/qcow2.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/symlink.c -o symlink.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/read_bb_file.o -c ../../../git/lib/ext2fs/read_bb_fil
 e.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/nls_utf8.o -c ../../../git/lib/ext2fs/nls_utf8.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/punch.o -c ../../../git/lib/ext2fs/punch.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/openfs.o -c ../../../git/lib/ext2fs/openfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/tdb.c -o tdb.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/undo_io.c -o undo_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/res_gdt.o -c ../../../git/lib/ext2fs/res_gdt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/unix_io.c -o unix_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/sparse_io.c -o sparse_io.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/unlink.c -o unlink.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/valid_blk.c -o valid_blk.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/symlink.o -c ../../../git/lib/ext2fs/symlink.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/sha512.o -c ../../../git/lib/ext2fs/sha512.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/version.c -o version.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/rbtree.c -o rbtree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/sparse_io.o -c ../../../git/lib/ext2fs/sparse_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/unlink.o -c ../../../git/lib/ext2fs/unlink.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/crc32c.c -o crc32c.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/swapfs.o -c ../../../git/lib/ext2fs/swapfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/valid_blk.o -c ../../../git/lib/ext2fs/valid_blk.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/rw_bitmaps.o -c ../../../git/lib/ext2fs/rw_bitmaps.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/version.o -c ../../../git/lib/ext2fs/version.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/rbtree.o -c ../../../git/lib/ext2fs/rbtree.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/undo_io.o -c ../../../git/lib/ext2fs/undo_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/crc32c.o -c ../../../git/lib/ext2fs/crc32c.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/unix_io.o -c ../../../git/lib/ext2fs/unix_io.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -fPIC -shared -o elfshared/tdb.o -c ../../../git/lib/ext2fs/tdb.c
| (if test -r libext2fs.a; then /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f libext2fs.a.bak && /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mv libext2fs.a libext2fs.a.bak; fi)
| x86_64-poky-linux-gcc-ar rc libext2fs.a bb_compat.o inode_io.o write_bb_file.o dupfs.o imager.o test_io.o ext2_err.o alloc.o alloc_sb.o alloc_stats.o alloc_tables.o atexit.o badblocks.o bb_inode.o bitmaps.o bitops.o blkmap64_ba.o blkmap64_rb.o blknum.o block.o bmap.o check_desc.o closefs.o crc16.o crc32c.o csum.o dblist.o dblist_dir.o dirblock.o dirhash.o dir_iterate.o expanddir.o ext_attr.o extent.o fallocate.o fileio.o finddev.o flushb.o freefs.o gen_bitmap.o gen_bitmap64.o get_num_dirs.o get_pathname.o getenv.o getsize.o getsectsize.o hashmap.o i_block.o icount.o ind_block.o initialize.o inline.o inline_data.o inode.o io_manager.o ismounted.o link.o llseek.o lookup.o mkdir.o mkjournal.o mmp.o namei.o native.o newdir.o nls_utf8.o openfs.o orphan.o progress.o punch.o qcow2.o read_bb.o read_bb_file.o res_gdt.o rw_bitmaps.o sha512.o swapfs.o symlink.o tdb.o undo_io.o unix_io.o sparse_io.o unlink.o valid_blk.o version.o rbtree.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rm -f ../libext2fs.a
| (cd ..; /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/ln  \
| 	`echo lib/ext2fs | sed -e 's;lib/;;'`/libext2fs.a libext2fs.a)
| (cd elfshared; x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -o libext2fs.so.2.4 \
| 	-L../../../lib  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -fPIC -shared \
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/unix.c -o unix.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/e2fsck.c -o e2fsck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/super.c -o super.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass1.c -o pass1.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass1b.c -o pass1b.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass2.c -o pass2.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass3.c -o pass3.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass4.c -o pass4.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/pass5.c -o pass5.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/journal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/badblocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/util.c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/dirinfo.c -o dirinfo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/dx_dirinfo.c -o dx_dirinfo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/ehandler.c -o ehandler.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/problem.c -o problem.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/message.c -o message.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/quota.c -o quota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/recovery.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/region.c -o region.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/revoke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/ea_refcount.c -o ea_refcount.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/rehash.c -o rehash.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/logfile.c -o logfile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/sigcatcher.c -o sigcatcher.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/readahead.c -o readahead.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/extents.c -o extents.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/e2fsck/encrypted_files.c -o encrypted_files.o
| ../util/subst -t -f ../util/subst.conf ../../git/e2fsck/e2fsck.8.in e2fsck.8
| ../util/subst -t -f ../util/subst.conf ../../git/e2fsck/e2fsck.conf.5.in e2fsck.conf.5
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -rdynamic -o e2fsck unix.o e2fsck.o super.o pass1.o pass1
 b.o pass2.o pass3.o pass4.o pass5.o journal.o badblocks.o util.o dirinfo.o dx_dirinfo.o ehandler.o problem.o message.o quota.o recovery.o region.o revoke.o ea_refcount.o rehash.o logfile.o sigcatcher.o  readahead.o extents.o encrypted_files.o  ../lib/libsupport.a ../lib/libext2fs.so ../lib/libcom_err.so  -lblkid  -luuid   ../lib/libe2p.so -ldl -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/e2fsck'
| making all in debugfs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/debugfs'
| _SS_DIR_OVERRIDE=../../git/debugfs/../lib/ss ../lib/ss/mk_cmds ../../git/debugfs/debug_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/debugfs.c -o debugfs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/util.c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/ncheck.c -o ncheck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/icheck.c -o icheck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/ls.c -o ls.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/lsdel.c -o lsdel.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/dump.c -o dump.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/set_fields.c -o set_fields
 .o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/logdump.c -o logdump.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/htree.c -o htree.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/unused.c -o unused.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS -I../../git/debugfs ../../git/debugfs/../mis
 c/e2freefrag.c -o e2freefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/filefrag.c -o filefrag.o
| _SS_DIR_OVERRIDE=../../git/debugfs/../lib/ss ../lib/ss/mk_cmds ../../git/debugfs/extent_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/extent_inode.c -o extent_i
 node.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/zap.c -o zap.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS -I../../git/debugfs \
| 	 ../../git/debugfs/../misc/create_inode.c -o create_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS -I../../git/debugfs \
| 	 ../../git/debugfs/../misc/create_inode_libarchive.c -o create_inode_libarchive.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/quota.c -o quota.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/xattrs.c -o xattrs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/journal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS -I../../git/debugfs \
| 	../../git/debugfs/../e2fsck/revoke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS -I../../git/debugfs \
| 	../../git/debugfs/../e2fsck/recovery.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/do_journal.c -o do_journal
 .o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS ../../git/debugfs/do_orphan.c -o do_orphan.o
| ../util/subst -t -f ../util/subst.conf ../../git/debugfs/debugfs.8.in debugfs.8
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS debug_cmds.c -o debug_cmds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H -I../../git/debugfs/../e2fsck -DDEBUGFS extent_cmds.c -o extent_cmds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o debugfs debug_cmds.o debugfs.o util.o ncheck.o icheck.
 o ls.o lsdel.o dump.o set_fields.o logdump.o htree.o unused.o e2freefrag.o filefrag.o extent_cmds.o extent_inode.o zap.o create_inode.o create_inode_libarchive.o quota.o xattrs.o journal.o revoke.o recovery.o do_journal.o do_orphan.o  ../lib/libsupport.a ../lib/libext2fs.so ../lib/libe2p.so ../lib/libss.so  ../lib/libcom_err.so  -lblkid  -luuid  -ldl -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/debugfs'
| making all in misc
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/misc'
| if test -f ../../git/misc/mke2fs.conf.custom.in ; then \
| 	cp ../../git/misc/mke2fs.conf.custom.in mke2fs.conf; \
| else \
| 	cp ../../git/misc/mke2fs.conf.in mke2fs.conf; \
| fi
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/mke2fs.c -o mke2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/util.c -o util.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/mk_hugefiles.c -o mk_hugefiles.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/create_inode.c -o create_inode.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/create_inode_libarchive.c -o create_inode_libarchive.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/badblocks.c -o badblocks.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/tune2fs.c -o tune2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../git/misc/../e2fsck -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DDEBUGFS -I../../git/misc \
| 	../../git/misc/../debugfs/journal.c -o journal.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../git/misc/../e2fsck -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DDEBUGFS -I../../git/misc \
| 	../../git/misc/../e2fsck/recovery.c -o recovery.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I../../git/misc/../e2fsck -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  -DDEBUGFS -I../../git/misc \
| 	../../git/misc/../e2fsck/revoke.c -o revoke.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/dumpe2fs.c -o dumpe2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/logsave.c -o logsave.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e2image.c -o e2image.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/fsck.c -o fsck.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/base_device.c -o base_device.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/ismounted.c -o ismounted.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e2undo.c -o e2undo.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/chattr.c -o chattr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/lsattr.c -o lsattr.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/mklost+found.c -o mklost+found.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/filefrag.c -o filefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e2freefrag.c -o e2freefrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e4defrag.c -o e4defrag.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e4crypt.c -o e4crypt.o
| ../util/subst -t -f ../util/subst.conf ../../git/misc/tune2fs.8.in tune2fs.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/mklost+found.8.in mklost+found.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/mke2fs.8.in mke2fs.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/dumpe2fs.8.in dumpe2fs.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/badblocks.8.in badblocks.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e2label.8.in e2label.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e2image.8.in e2image.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/logsave.8.in logsave.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/filefrag.8.in filefrag.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e2undo.8.in e2undo.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e4defrag.8.in e4defrag.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e4crypt.8.in e4crypt.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/fsck.8.in fsck.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/e2mmpstatus.8.in e2mmpstatus.8
| ../util/subst -t -f ../util/subst.conf ../../git/misc/chattr.1.in chattr.1
| ../util/subst -t -f ../util/subst.conf ../../git/misc/lsattr.1.in lsattr.1
| ../util/subst -t -f ../util/subst.conf ../../git/misc/mke2fs.conf.5.in mke2fs.conf.5
| ../util/subst -t -f ../util/subst.conf ../../git/misc/ext4.5.in ext4.5
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e2initrd_helper.c -o e2initrd_helper.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/misc/e2fuzz.c -o e2fuzz.o
| gawk -f ../../git/misc/profile-to-c.awk < mke2fs.conf \
| 	>  default_profile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o logsave logsave.o -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o chattr chattr.o ../lib/libe2p.so ../lib/libcom_err.so 
  \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o lsattr lsattr.o ../lib/libe2p.so ../lib/libcom_err.so 
  \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o mklost+found mklost+found.o \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  default_profile.c -o default_profile.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o dumpe2fs dumpe2fs.o ../lib/libext2fs.so ../lib/libcom_
 err.so   ../lib/libsupport.a \
| 	../lib/libe2p.so ../lib/libcom_err.so  -luuid   -lpthread -lblkid  \
| 	-ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2undo e2undo.o ../lib/libext2fs.so ../lib/libcom_err.
 so   ../lib/libsupport.a \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2freefrag e2freefrag.o \
| 	../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o fsck fsck.o base_device.o ismounted.o -lblkid  \
| 	 -lpthread ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o badblocks badblocks.o ../lib/libext2fs.so ../lib/libco
 m_err.so   ../lib/libsupport.a \
| 	 -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o filefrag filefrag.o -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2fuzz e2fuzz.o ../lib/libext2fs.so ../lib/libcom_err.
 so   ../lib/libsupport.a \
| 	-lblkid  -luuid  ../lib/libext2fs.so -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2initrd_helper e2initrd_helper.o ../lib/libext2fs.so 
 ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lblkid  ../lib/libext2fs.so  -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e2image e2image.o ../lib/libext2fs.so ../lib/libcom_er
 r.so   ../lib/libsupport.a \
| 	 -lpthread -lblkid  -ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e4crypt e4crypt.o \
| 	-luuid  ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o e4defrag e4defrag.o ../lib/libext2fs.so ../lib/libcom_
 err.so   ../lib/libsupport.a \
| 	-lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o tune2fs tune2fs.o util.o journal.o recovery.o revoke.o
  ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a \
| 	-lblkid  -luuid  ../lib/libext2fs.so ../lib/libe2p.so ../lib/libcom_err.so  \
| 	 -lpthread -lblkid  -ldl
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o mke2fs mke2fs.o util.o default_profile.o mk_hugefiles.
 o create_inode.o create_inode_libarchive.o ../lib/libext2fs.so ../lib/libcom_err.so   ../lib/libsupport.a -lblkid  \
| 	-luuid  ../lib/libext2fs.so ../lib/libe2p.so  \
| 	-lpthread -ldl
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/misc'
| making all in resize
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/resize'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/extent.c -o extent.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/resize2fs.c -o resize2fs.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/main.c -o main.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/online.c -o online.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/resource_track.c -o resource_track.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/sim_progress.c -o sim_progress.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../lib -I../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../git/resize/test_extent.c -o test_extent.o
| ../util/subst -t -f ../util/subst.conf ../../git/resize/resize2fs.8.in resize2fs.8
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o test_extent extent.o test_extent.o ../lib/libe2p.so ..
 /lib/libext2fs.so ../lib/libcom_err.so   -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../lib  -o resize2fs extent.o resize2fs.o main.o online.o resourc
 e_track.o sim_progress.o ../lib/libe2p.so ../lib/libext2fs.so ../lib/libcom_err.so   -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/resize'
| making all in tests/progs
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/progs'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../../git/tests/progs/test_icount.c -o test_icount.o
| _SS_DIR_OVERRIDE=../../../git/tests/progs/../../lib/ss ../../lib/ss/mk_cmds ../../../git/tests/progs/test_icount_cmds.ct
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  ../../../git/tests/progs/crcsum.c -o crcsum.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot -c -I. -I../../lib -I../../../git/lib  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -pipe -pthread  -DHAVE_CONFIG_H  test_icount_cmds.c -o test_icount_cmds.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../../lib  -o crcsum crcsum.o ../../lib/libext2fs.so ../../lib/li
 bss.so  ../../lib/libcom_err.so  -lpthread
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot  -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/git=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build=/usr/src/debug/e2fsprogs/1.47.2  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-rpath-link,../../lib  -o test_icount test_icount.o test_icount_cmds.o ../../
 lib/libext2fs.so ../../lib/libss.so  ../../lib/libcom_err.so  -lpthread
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/progs'
| making all in tests/fuzz
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/fuzz'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/tests/fuzz'
| making all in po
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| test ! -f ../../git/po/e2fsprogs.pot || \
|   test -z "../../git/po/ca.gmo ../../git/po/cs.gmo ../../git/po/da.gmo ../../git/po/de.gmo ../../git/po/eo.gmo ../../git/po/es.gmo ../../git/po/fi.gmo ../../git/po/fr.gmo ../../git/po/fur.gmo ../../git/po/hu.gmo ../../git/po/id.gmo ../../git/po/it.gmo ../../git/po/ms.gmo ../../git/po/nl.gmo ../../git/po/pl.gmo ../../git/po/pt.gmo ../../git/po/ro.gmo ../../git/po/sr.gmo ../../git/po/sv.gmo ../../git/po/tr.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo" || make ../../git/po/ca.gmo ../../git/po/cs.gmo ../../git/po/da.gmo ../../git/po/de.gmo ../../git/po/eo.gmo ../../git/po/es.gmo ../../git/po/fi.gmo ../../git/po/fr.gmo ../../git/po/fur.gmo ../../git/po/hu.gmo ../../git/po/id.gmo ../../git/po/it.gmo ../../git/po/ms.gmo ../../git/po/nl.gmo ../../git/po/pl.gmo ../../git/po/pt.gmo ../../git/po/ro.gmo ../../git/po/sr.gmo ../../git/po/sv.gmo ../../git/po/tr.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| cd ../../git/po && rm -f ca.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o ca.1po ca.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o ca.gmo ca.1po && rm -f ca.1po
| ca.1po: 1230 translated messages.
| cd ../../git/po && rm -f cs.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o cs.1po cs.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o cs.gmo cs.1po && rm -f cs.1po
| cs.1po: 1662 translated messages.
| cd ../../git/po && rm -f da.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o da.1po da.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o da.gmo da.1po && rm -f da.1po
| da.1po: 1344 translated messages.
| cd ../../git/po && rm -f de.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o de.1po de.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o de.gmo de.1po && rm -f de.1po
| de.po:2021: warning: internationalized messages should not contain the '\b' escape sequence
| de.1po: 1490 translated messages.
| cd ../../git/po && rm -f eo.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o eo.1po eo.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o eo.gmo eo.1po && rm -f eo.1po
| eo.1po: 902 translated messages.
| cd ../../git/po && rm -f es.gmo && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o es.1po es.po e2fsprogs.pot && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o es.gmo es.1po && rm -f es.1po
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
| make[3]: *** [Makefile:257: ../../git/po/es.gmo] Error 1
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build/po'
| make[2]: *** [Makefile:295: ../../git/po/stamp-po] Error 2
| make[1]: *** [Makefile:445: all-progs-recursive] Error 1
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/build'
| make: *** [Makefile:373: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 183
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 167
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 162
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 157
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 152
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341, line 196
NOTE: recipe e2fsprogs-1.47.2-r0: task do_compile: Failed
NOTE: recipe perl-5.40.2-r0: task do_install: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2136 tasks of which 1512 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501081643.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501081643.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/log.do_compile.2791341
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: e2fsprogs-1.47.2-r0 do_compile: oe_runmake failed
ERROR: e2fsprogs-1.47.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/run.do_compile.2791341' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.2/temp/log.do_compile.2791341
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb:do_compile) failed with exit code '1'

--===============7603145011456172571==--

