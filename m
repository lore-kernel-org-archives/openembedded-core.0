Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2623C25B4D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8645.1698848703272298284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KMV1gHtw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R+pfChbK;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460184-3ed75f32-103e-46d0-b14a-8db67957015c-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FufBVrwN5ZroHqh1R2DktyrIJ6mXIX2ddRWlpBhQ7rs=;
	b=KMV1gHtwo0x9wze/WdivLb5PVUblj5pq6oV3iN/ELu6z6wpDa1ZFO6VJLNyMZEMr
	FM3h1EhapT53TuKqWycbK2MvqfGyaIupTiN9L+YZOv75k060lT2p6I9CT8YdYysGN4B
	ftwRYa1Oh2i3DUVYrst4hKTc3FnBjxFXfoq9hsy4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FufBVrwN5ZroHqh1R2DktyrIJ6mXIX2ddRWlpBhQ7rs=;
	b=R+pfChbKiz0KuDr6w/95clKkr0dwZ8pqZU2xZRCTVTA3IzCVCenKR2gsOha3KvkG
	0yFuLxcBG1WKxArUR5OIGdTGFaLdDCNQajlyQGrBuyrrPbUbVKPZiYR+d03RkOG6EJo
	25mBDcL/Z2VcsdAEbWfa00crskDMxITGKlRm5LqY=
Content-Type: multipart/mixed; boundary="===============3806206352230634765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.2 SUCCEEDED
Message-ID: <0101018b8b460184-3ed75f32-103e-46d0-b14a-8db67957015c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189942

--===============3806206352230634765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *1.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.0.1-1.0.2.patch
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
From 59d4d07a0d80ac169fc4db00ffe665a0efb0ddd7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:32:53 +0000
Subject: [PATCH] createrepo-c: upgrade 1.0.1 -> 1.0.2

---
 .../createrepo-c/createrepo-c/time64fix.patch | 69 -------------------
 ...erepo-c_1.0.1.bb => createrepo-c_1.0.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.1.bb => createrepo-c_1.0.2.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
deleted file mode 100644
index a63801ce26..0000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 89e1c9415fb8438310036d5810cdb7da75ee3a7f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Jul 2023 12:27:14 -0700
-Subject: [PATCH] Adjust printf formats for 64bit time_t on 32bit systems
-
-Fixes format specifier mismatch warnings as well while here
-
-e.g.
-warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t'
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/376]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/createrepo_c.c    | 4 ++--
- src/misc.c            | 4 ++--
- src/xml_dump_repomd.c | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/createrepo_c.c b/src/createrepo_c.c
-index 8681419..0f9048a 100644
---- a/src/createrepo_c.c
-+++ b/src/createrepo_c.c
-@@ -582,9 +582,9 @@ duplicates_warning(const char *nevra, GArray *locations, CmdDupNevra option)
-   for (size_t i=0; i<locations->len; i++) {
-       struct DuplicateLocation location = g_array_index(locations, struct
-                                                         DuplicateLocation, i);
--      g_warning("    Sourced from location: \'%s\', build timestamp: %ld%s",
-+      g_warning("    Sourced from location: \'%s\', build timestamp: %jd%s",
-                 location.location,
--                location.pkg->time_build,
-+                (intmax_t) location.pkg->time_build,
-                 location.pkg->skip_dump ? skip_reason : "");
- 
-   }
-diff --git a/src/misc.c b/src/misc.c
-index 8511ca2..7866c7b 100644
---- a/src/misc.c
-+++ b/src/misc.c
-@@ -1512,11 +1512,11 @@ cr_append_pid_and_datetime(const char *str, const char *suffix)
-     gettimeofday(&tv, NULL);
-     timeinfo = localtime (&(tv.tv_sec));
-     strftime(datetime, 80, "%Y%m%d%H%M%S", timeinfo);
--    gchar *result = g_strdup_printf("%s%jd.%s.%ld%s",
-+    gchar *result = g_strdup_printf("%s%jd.%s.%jd%s",
-                                     str ? str : "",
-                                     (intmax_t) getpid(),
-                                     datetime,
--                                    tv.tv_usec,
-+                                    (intmax_t) tv.tv_usec,
-                                     suffix ? suffix : "");
-     return result;
- }
-diff --git a/src/xml_dump_repomd.c b/src/xml_dump_repomd.c
-index 33b0e09..9d24249 100644
---- a/src/xml_dump_repomd.c
-+++ b/src/xml_dump_repomd.c
-@@ -143,7 +143,7 @@ cr_xml_dump_repomd_body(xmlNodePtr root, cr_Repomd *repomd)
-                            BAD_CAST repomd->revision);
-     } else {
-         // Use the current time if no revision was explicitly specified
--        gchar *rev = g_strdup_printf("%ld", time(NULL));
-+        gchar *rev = g_strdup_printf("%jd", (intmax_t) time(NULL));
-         xmlNewChild(root, NULL, BAD_CAST "revision", BAD_CAST rev);
-         g_free(rev);
-     }
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
index 44d9213bd4..49d29bcfb4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
-           file://time64fix.patch \
            "
 
-SRCREV = "e7af838e04009cd2f848a00e1ea31cc42c8f3ae7"
+SRCREV = "e87636334a3bc5d6ddfdb6c0b34042e96987efb1"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3806206352230634765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.0.1", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: removed "file-dbg"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1491936 to 1483256 (-1%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146429 to 146403 (-0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1280187 to 1278726 (-0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.1", added "/usr/lib/libcreaterepo_c.so.1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: RDEPENDS: removed "file (['>= 5.45'])"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.1 to libcreaterepo_c.so.1.0.2
  /usr/lib/libcreaterepo_c.so.1.0.1 moved to /usr/lib/libcreaterepo_c.so.1.0.2

--===============3806206352230634765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: removed "file-dbg"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: RDEPENDS: removed "file (['>= 5.45'])"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.1", added "/usr/lib/libcreaterepo_c.so.1.0.2"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.1 to libcreaterepo_c.so.1.0.2
  /usr/lib/libcreaterepo_c.so.1.0.1 moved to /usr/lib/libcreaterepo_c.so.1.0.2

--===============3806206352230634765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.0.1-1.0.2.patch"

RnJvbSA1OWQ0ZDA3YTBkODBhYzE2OWZjNGRiMDBmZmU2NjVhMGVmYjBkZGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjozMjo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAxLjAuMSAtPiAxLjAuMgoKLS0tCiAuLi4vY3JlYXRlcmVwby1j
L2NyZWF0ZXJlcG8tYy90aW1lNjRmaXgucGF0Y2ggfCA2OSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5lcmVwby1jXzEuMC4xLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuMi5iYn0gfCAgMyArLQogMiBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNzEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMv
dGltZTY0Zml4LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8t
Yy97Y3JlYXRlcmVwby1jXzEuMC4xLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuMi5iYn0gKDk0JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tYy90aW1lNjRmaXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1j
L2NyZWF0ZXJlcG8tYy90aW1lNjRmaXgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IGE2MzgwMWNlMjYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ny
ZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvdGltZTY0Zml4LnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsNjkgKzAsMCBAQAotRnJvbSA4OWUxYzk0MTVmYjg0MzgzMTAwMzZkNTgxMGNkYjdkYTc1ZWUz
YTdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KLURhdGU6IFdlZCwgMjYgSnVsIDIwMjMgMTI6Mjc6MTQgLTA3MDAKLVN1YmplY3Q6
IFtQQVRDSF0gQWRqdXN0IHByaW50ZiBmb3JtYXRzIGZvciA2NGJpdCB0aW1lX3Qgb24gMzJiaXQg
c3lzdGVtcwotCi1GaXhlcyBmb3JtYXQgc3BlY2lmaWVyIG1pc21hdGNoIHdhcm5pbmdzIGFzIHdl
bGwgd2hpbGUgaGVyZQotCi1lLmcuCi13YXJuaW5nOiBmb3JtYXQgJyVsZCcgZXhwZWN0cyBhcmd1
bWVudCBvZiB0eXBlICdsb25nIGludCcsIGJ1dCBhcmd1bWVudCAyIGhhcyB0eXBlICd0aW1lX3Qn
Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcnBtLXNv
ZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jL3B1bGwvMzc2XQotCi1TaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL2NyZWF0ZXJlcG9fYy5j
ICAgIHwgNCArKy0tCi0gc3JjL21pc2MuYyAgICAgICAgICAgIHwgNCArKy0tCi0gc3JjL3htbF9k
dW1wX3JlcG9tZC5jIHwgMiArLQotIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2NyZWF0ZXJlcG9fYy5jIGIvc3JjL2Ny
ZWF0ZXJlcG9fYy5jCi1pbmRleCA4NjgxNDE5Li4wZjkwNDhhIDEwMDY0NAotLS0tIGEvc3JjL2Ny
ZWF0ZXJlcG9fYy5jCi0rKysgYi9zcmMvY3JlYXRlcmVwb19jLmMKLUBAIC01ODIsOSArNTgyLDkg
QEAgZHVwbGljYXRlc193YXJuaW5nKGNvbnN0IGNoYXIgKm5ldnJhLCBHQXJyYXkgKmxvY2F0aW9u
cywgQ21kRHVwTmV2cmEgb3B0aW9uKQotICAgZm9yIChzaXplX3QgaT0wOyBpPGxvY2F0aW9ucy0+
bGVuOyBpKyspIHsKLSAgICAgICBzdHJ1Y3QgRHVwbGljYXRlTG9jYXRpb24gbG9jYXRpb24gPSBn
X2FycmF5X2luZGV4KGxvY2F0aW9ucywgc3RydWN0Ci0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEdXBsaWNhdGVMb2NhdGlvbiwgaSk7Ci0t
ICAgICAgZ193YXJuaW5nKCIgICAgU291cmNlZCBmcm9tIGxvY2F0aW9uOiBcJyVzXCcsIGJ1aWxk
IHRpbWVzdGFtcDogJWxkJXMiLAotKyAgICAgIGdfd2FybmluZygiICAgIFNvdXJjZWQgZnJvbSBs
b2NhdGlvbjogXCclc1wnLCBidWlsZCB0aW1lc3RhbXA6ICVqZCVzIiwKLSAgICAgICAgICAgICAg
ICAgbG9jYXRpb24ubG9jYXRpb24sCi0tICAgICAgICAgICAgICAgIGxvY2F0aW9uLnBrZy0+dGlt
ZV9idWlsZCwKLSsgICAgICAgICAgICAgICAgKGludG1heF90KSBsb2NhdGlvbi5wa2ctPnRpbWVf
YnVpbGQsCi0gICAgICAgICAgICAgICAgIGxvY2F0aW9uLnBrZy0+c2tpcF9kdW1wID8gc2tpcF9y
ZWFzb24gOiAiIik7Ci0gCi0gICB9Ci1kaWZmIC0tZ2l0IGEvc3JjL21pc2MuYyBiL3NyYy9taXNj
LmMKLWluZGV4IDg1MTFjYTIuLjc4NjZjN2IgMTAwNjQ0Ci0tLS0gYS9zcmMvbWlzYy5jCi0rKysg
Yi9zcmMvbWlzYy5jCi1AQCAtMTUxMiwxMSArMTUxMiwxMSBAQCBjcl9hcHBlbmRfcGlkX2FuZF9k
YXRldGltZShjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIgKnN1ZmZpeCkKLSAgICAgZ2V0dGlt
ZW9mZGF5KCZ0diwgTlVMTCk7Ci0gICAgIHRpbWVpbmZvID0gbG9jYWx0aW1lICgmKHR2LnR2X3Nl
YykpOwotICAgICBzdHJmdGltZShkYXRldGltZSwgODAsICIlWSVtJWQlSCVNJVMiLCB0aW1laW5m
byk7Ci0tICAgIGdjaGFyICpyZXN1bHQgPSBnX3N0cmR1cF9wcmludGYoIiVzJWpkLiVzLiVsZCVz
IiwKLSsgICAgZ2NoYXIgKnJlc3VsdCA9IGdfc3RyZHVwX3ByaW50ZigiJXMlamQuJXMuJWpkJXMi
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0ciA/IHN0ciA6ICIiLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpbnRtYXhfdCkgZ2V0cGlkKCks
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0ZXRpbWUsCi0tICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHYudHZfdXNlYywKLSsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoaW50bWF4X3QpIHR2LnR2X3VzZWMsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3VmZml4ID8gc3VmZml4IDogIiIpOwotICAgICBy
ZXR1cm4gcmVzdWx0OwotIH0KLWRpZmYgLS1naXQgYS9zcmMveG1sX2R1bXBfcmVwb21kLmMgYi9z
cmMveG1sX2R1bXBfcmVwb21kLmMKLWluZGV4IDMzYjBlMDkuLjlkMjQyNDkgMTAwNjQ0Ci0tLS0g
YS9zcmMveG1sX2R1bXBfcmVwb21kLmMKLSsrKyBiL3NyYy94bWxfZHVtcF9yZXBvbWQuYwotQEAg
LTE0Myw3ICsxNDMsNyBAQCBjcl94bWxfZHVtcF9yZXBvbWRfYm9keSh4bWxOb2RlUHRyIHJvb3Qs
IGNyX1JlcG9tZCAqcmVwb21kKQotICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJBRF9DQVNU
IHJlcG9tZC0+cmV2aXNpb24pOwotICAgICB9IGVsc2UgewotICAgICAgICAgLy8gVXNlIHRoZSBj
dXJyZW50IHRpbWUgaWYgbm8gcmV2aXNpb24gd2FzIGV4cGxpY2l0bHkgc3BlY2lmaWVkCi0tICAg
ICAgICBnY2hhciAqcmV2ID0gZ19zdHJkdXBfcHJpbnRmKCIlbGQiLCB0aW1lKE5VTEwpKTsKLSsg
ICAgICAgIGdjaGFyICpyZXYgPSBnX3N0cmR1cF9wcmludGYoIiVqZCIsIChpbnRtYXhfdCkgdGlt
ZShOVUxMKSk7Ci0gICAgICAgICB4bWxOZXdDaGlsZChyb290LCBOVUxMLCBCQURfQ0FTVCAicmV2
aXNpb24iLCBCQURfQ0FTVCByZXYpOwotICAgICAgICAgZ19mcmVlKHJldik7Ci0gICAgIH0KLS0t
IAotMi40MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBv
LWMvY3JlYXRlcmVwby1jXzEuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJl
cG8tYy9jcmVhdGVyZXBvLWNfMS4wLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4wLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVw
by1jXzEuMC4yLmJiCmluZGV4IDQ0ZDkyMTNiZDQuLjQ5ZDI5YmNmYjQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC4y
LmJiCkBAIC03LDEwICs3LDkgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3Qtc2V0LVBZ
VEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoIFwKLSAgICAgICAgICAgZmls
ZTovL3RpbWU2NGZpeC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImU3YWY4Mzhl
MDQwMDljZDJmODQ4YTAwZTFlYTMxY2M0MmM4ZjNhZTciCitTUkNSRVYgPSAiZTg3NjM2MzM0YTNi
YzVkNmRkZmRiNmMwYjM0MDQyZTk2OTg3ZWZiMSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAot
LSAKMi4zOS4yCgo=

--===============3806206352230634765==--

