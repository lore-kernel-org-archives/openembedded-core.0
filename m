Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142F2C25B79
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13431.1713248038653455780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SjwFKy49;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4jb4o2mS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a7380-4e391d08-da26-473b-90f3-5ddb63537871-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mavfdMbjS/08qqg4IeRxutciUo/569yEc2xOtcVNu3g=;
	b=SjwFKy49X2fc57yciAfUa+2qHoJS506yTOtLJxAPb/oQx1ovs0isAE70rGoLSQs3
	Zhtx1cvUlAghyUayhVezQkq66mKmgofH6dNtAMZPPhCl/i4BLVuHzUWhqFnuxZAwrkJ
	1RECEgc4Ard5lckUgq7zrXjZnjx+MJV9PK6RN/ow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mavfdMbjS/08qqg4IeRxutciUo/569yEc2xOtcVNu3g=;
	b=4jb4o2mSzbN/obS+R/UPagOiE3J4hIEGUAA/DMtQjFcOiZKwPxfhKW1fVT2sdYem
	i/eBdYIq1dCT7VN0wJfY0PdSPsgXkfAGEyScPjwxaeYhdwZWH2+8IkDqX79dnU5QqPd
	BByeutS8vanTaaah8dGuBrnF6LIzNKA2b520yRzE=
Content-Type: multipart/mixed; boundary="===============8488682799651276838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.3.0 SUCCEEDED
Message-ID: <0101018ee58a7380-4e391d08-da26-473b-90f3-5ddb63537871-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198313

--===============8488682799651276838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.2.7-3.3.0.patch
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
From d9543ac063b30b01fbf8d0d2c5ad858ba4c82782 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 20:33:18 +0000
Subject: [PATCH] rsync: upgrade 3.2.7 -> 3.3.0

---
 ...-prototypes-to-function-declarations.patch | 13 ++++++------
 .../rsync/files/determism.patch               | 20 +++++++++++++------
 .../rsync/files/makefile-no-rebuild.patch     |  7 +++----
 .../rsync/{rsync_3.2.7.bb => rsync_3.3.0.bb}  |  2 +-
 4 files changed, 24 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.7.bb => rsync_3.3.0.bb} (96%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 8895adad74..aec186e8c8 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
+From fb2e454f79a5641494243ba1a41ea79baff376d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,7 +15,6 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  checksum.c       | 2 +-
  exclude.c        | 2 +-
@@ -30,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  10 files changed, 12 insertions(+), 13 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 60de365..67a9e16 100644
+index cb21882..736818b 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -43,7 +42,7 @@ index 60de365..67a9e16 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index ffe55b1..a85ea76 100644
+index 87edbcf..ae0de2f 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -96,10 +95,10 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index d2a7b9b..c50af45 100644
+index 0c60b86..4bc664a 100644
 --- a/main.c
 +++ b/main.c
-@@ -244,7 +244,7 @@ void read_del_stats(int f)
+@@ -246,7 +246,7 @@ void read_del_stats(int f)
  	stats.deleted_files += stats.deleted_specials = read_varint(f);
  }
  
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index e3494fdded..eba1f67db6 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,7 +1,12 @@
+From f717a9c4d957d6400f33bfdebcf2b08bb98ce4b3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 21 Feb 2021 09:45:48 +0000
+Subject: [PATCH] rsync: Fix a file sorting determinism issue
+
 The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
 but the order depends on the locale settings, particularly whether
 "util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
-they sort one way, in C, they sort the other. The sorting order changes 
+they sort one way, in C, they sort the other. The sorting order changes
 the output binaries. The behaviour also changes dependning on whether
 SHELL (/bin/sh) is dash or bash.
 
@@ -15,12 +20,15 @@ Upstream-Status: Backport [ish, see below]
 After discussion upstream renamed util.c to util1.c which avoids the problem
 in a different way. This patch can be dropped when we upgrade to include:
 https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
+---
+ Makefile.in | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-Index: rsync-3.2.3/Makefile.in
-===================================================================
---- rsync-3.2.3.orig/Makefile.in
-+++ rsync-3.2.3/Makefile.in
-@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
+diff --git a/Makefile.in b/Makefile.in
+index a084935..1c93824 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 92ed1f4419..df74e5b326 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 81700d1a0e51391028c761cc8ef1cd660084d114 Mon Sep 17 00:00:00 2001
+From 3e214c731612c13b36545f301945d4ac16e9368a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -8,16 +8,15 @@ generally overcomplicated, and we ensure that autoreconf is invoked if required.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  Makefile.in | 54 -----------------------------------------------------
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3cde955..d963a70 100644
+index a1253e5..a084935 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -190,60 +190,6 @@ gensend: gen
+@@ -192,60 +192,6 @@ gensend: gen
  	fi
  	rsync -aic $(GENFILES) git-version.h $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/ || true
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
similarity index 96%
rename from meta/recipes-devtools/rsync/rsync_3.2.7.bb
rename to meta/recipes-devtools/rsync/rsync_3.3.0.bb
index 130581a785..b42026331d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
+SRC_URI[sha256sum] = "7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90"
 
 inherit autotools-brokensep
 
-- 
2.42.0


--===============8488682799651276838==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.2.7-3.3.0.patch"

RnJvbSBkOTU0M2FjMDYzYjMwYjAxZmJmOGQwZDJjNWFkODU4YmE0YzgyNzgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjA6MzM6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjIuNyAtPiAzLjMuMAoKLS0tCiAuLi4tcHJvdG90eXBlcy10by1mdW5j
dGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggfCAxMyArKysrKystLS0tLS0KIC4uLi9yc3luYy9maWxl
cy9kZXRlcm1pc20ucGF0Y2ggICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0K
IC4uLi9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoICAgICB8ICA3ICsrKy0t
LS0KIC4uLi9yc3luYy97cnN5bmNfMy4yLjcuYmIgPT4gcnN5bmNfMy4zLjAuYmJ9ICB8ICAyICst
CiA0IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy97cnN5bmNfMy4yLjcuYmIgPT4gcnN5bmNf
My4zLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5j
L2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlv
bnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlz
c2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaAppbmRleCA4ODk1
YWRhZDc0Li5hZWMxODZlOGM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5
bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0
aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1B
ZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNjUxNDI1ZmNlZDA2OTFkOTA2M2ZlNDE3Mzg4YmE2Y2ExYzM4YzQw
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmIyZTQ1NGY3OWE1NjQxNDk0MjQzYmEx
YTQxZWE3OWJhZmYzNzZkOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI5IEF1ZyAyMDIyIDE5OjUzOjI4IC0w
NzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIHByb3RvdHlwZXMgdG8gZnVuY3Rpb24g
ZGVjbGFyYXRpb25zCkBAIC0xNSw3ICsxNSw2IEBAIEZpeGVzIGVycm9ycyBsaWtlCiAKIFVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2xpc3RzLnNhbWJhLm9yZy9hcmNoaXZlL3Jz
eW5jLzIwMjItQXVndXN0LzAzMjg1OC5odG1sXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KLQogLS0tCiAgY2hlY2tzdW0uYyAgICAgICB8IDIgKy0KICBleGNs
dWRlLmMgICAgICAgIHwgMiArLQpAQCAtMzAsMTAgKzI5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMTAgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jaGVja3N1bS5jIGIvY2hl
Y2tzdW0uYwotaW5kZXggNjBkZTM2NS4uNjdhOWUxNiAxMDA2NDQKK2luZGV4IGNiMjE4ODIuLjcz
NjgxOGIgMTAwNjQ0CiAtLS0gYS9jaGVja3N1bS5jCiArKysgYi9jaGVja3N1bS5jCi1AQCAtNzc4
LDcgKzc3OCw3IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9kaWdlc3Qoc3RydWN0IG5hbWVfbnVtX2l0
ZW0gKm5uaSwgQk9PTCBjaGVja19hdXRoX2xpc3QpCitAQCAtNzc5LDcgKzc3OSw3IEBAIHN0YXRp
YyB2b2lkIHZlcmlmeV9kaWdlc3Qoc3RydWN0IG5hbWVfbnVtX2l0ZW0gKm5uaSwgQk9PTCBjaGVj
a19hdXRoX2xpc3QpCiAgfQogICNlbmRpZgogIApAQCAtNDMsNyArNDIsNyBAQCBpbmRleCA2MGRl
MzY1Li42N2E5ZTE2IDEwMDY0NAogICNpZiBkZWZpbmVkIFNVUFBPUlRfWFhIMyB8fCBkZWZpbmVk
IFVTRV9PUEVOU1NMCiAgCXN0cnVjdCBuYW1lX251bV9pdGVtICpubmk7CiBkaWZmIC0tZ2l0IGEv
ZXhjbHVkZS5jIGIvZXhjbHVkZS5jCi1pbmRleCBmZmU1NWIxLi5hODVlYTc2IDEwMDY0NAoraW5k
ZXggODdlZGJjZi4uYWUwZGUyZiAxMDA2NDQKIC0tLSBhL2V4Y2x1ZGUuYwogKysrIGIvZXhjbHVk
ZS5jCiBAQCAtMzYzLDcgKzM2Myw3IEBAIHZvaWQgaW1wbGllZF9pbmNsdWRlX3BhcnRpYWxfc3Ry
aW5nKGNvbnN0IGNoYXIgKnNfc3RhcnQsIGNvbnN0IGNoYXIgKnNfZW5kKQpAQCAtOTYsMTAgKzk1
LDEwIEBAIGluZGV4IGU0YmExY2MuLjg0ODJiNzEgMTAwNjQ0CiAgCWludCBvcHRpb25zID0gTE9H
X1BJRDsKICAKIGRpZmYgLS1naXQgYS9tYWluLmMgYi9tYWluLmMKLWluZGV4IGQyYTdiOWIuLmM1
MGFmNDUgMTAwNjQ0CitpbmRleCAwYzYwYjg2Li40YmM2NjRhIDEwMDY0NAogLS0tIGEvbWFpbi5j
CiArKysgYi9tYWluLmMKLUBAIC0yNDQsNyArMjQ0LDcgQEAgdm9pZCByZWFkX2RlbF9zdGF0cyhp
bnQgZikKK0BAIC0yNDYsNyArMjQ2LDcgQEAgdm9pZCByZWFkX2RlbF9zdGF0cyhpbnQgZikKICAJ
c3RhdHMuZGVsZXRlZF9maWxlcyArPSBzdGF0cy5kZWxldGVkX3NwZWNpYWxzID0gcmVhZF92YXJp
bnQoZik7CiAgfQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2Zp
bGVzL2RldGVybWlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9k
ZXRlcm1pc20ucGF0Y2gKaW5kZXggZTM0OTRmZGRlZC4uZWJhMWY2N2RiNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlzbS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoCkBAIC0xLDcg
KzEsMTIgQEAKK0Zyb20gZjcxN2E5YzRkOTU3ZDY0MDBmMzNiZmRlYmNmMmIwOGJiOThjZTRiMyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogU3VuLCAyMSBGZWIgMjAyMSAwOTo0NTo0
OCArMDAwMAorU3ViamVjdDogW1BBVENIXSByc3luYzogRml4IGEgZmlsZSBzb3J0aW5nIGRldGVy
bWluaXNtIGlzc3VlCisKIFRoZSBNYWtlZmlsZSBjYWxscyBhd2sgb24gYSAiKi5jIiBnbG9iLiBU
aGUgcmVzdWx0cyBvZiB0aGlzIGdsb2IgYXJlIHNvcnRlZAogYnV0IHRoZSBvcmRlciBkZXBlbmRz
IG9uIHRoZSBsb2NhbGUgc2V0dGluZ3MsIHBhcnRpY3VsYXJseSB3aGV0aGVyCiAidXRpbC5jIiBh
bmQgInV0aWwyLmMiIHNvcnQgYmVmb3JlIG9yIGFmdGVyIGVhY2ggb3RoZXIuIEluIGVuX1VTLlVU
Ri04Ci10aGV5IHNvcnQgb25lIHdheSwgaW4gQywgdGhleSBzb3J0IHRoZSBvdGhlci4gVGhlIHNv
cnRpbmcgb3JkZXIgY2hhbmdlcyAKK3RoZXkgc29ydCBvbmUgd2F5LCBpbiBDLCB0aGV5IHNvcnQg
dGhlIG90aGVyLiBUaGUgc29ydGluZyBvcmRlciBjaGFuZ2VzCiB0aGUgb3V0cHV0IGJpbmFyaWVz
LiBUaGUgYmVoYXZpb3VyIGFsc28gY2hhbmdlcyBkZXBlbmRuaW5nIG9uIHdoZXRoZXIKIFNIRUxM
ICgvYmluL3NoKSBpcyBkYXNoIG9yIGJhc2guCiAKQEAgLTE1LDEyICsyMCwxNSBAQCBVcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IFtpc2gsIHNlZSBiZWxvd10KIEFmdGVyIGRpc2N1c3Npb24gdXBz
dHJlYW0gcmVuYW1lZCB1dGlsLmMgdG8gdXRpbDEuYyB3aGljaCBhdm9pZHMgdGhlIHByb2JsZW0K
IGluIGEgZGlmZmVyZW50IHdheS4gVGhpcyBwYXRjaCBjYW4gYmUgZHJvcHBlZCB3aGVuIHdlIHVw
Z3JhZGUgdG8gaW5jbHVkZToKIGh0dHBzOi8vZ2l0aHViLmNvbS9XYXluZUQvcnN5bmMvY29tbWl0
L2QzMDg1ZjdhZGQzOGE1Y2Y4MzNhMGIzMWNiMDYzN2ZmNDZjODBmOGQKKy0tLQorIE1ha2VmaWxl
LmluIHwgNSArKysrKworIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAotSW5kZXg6
IHJzeW5jLTMuMi4zL01ha2VmaWxlLmluCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gcnN5bmMtMy4yLjMub3Jp
Zy9NYWtlZmlsZS5pbgotKysrIHJzeW5jLTMuMi4zL01ha2VmaWxlLmluCi1AQCAtMjYsNiArMjYs
MTEgQEAgTUtESVJfUD1ATUtESVJfUEAKK2RpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2Vm
aWxlLmluCitpbmRleCBhMDg0OTM1Li4xYzkzODI0IDEwMDY0NAorLS0tIGEvTWFrZWZpbGUuaW4K
KysrKyBiL01ha2VmaWxlLmluCitAQCAtMjcsNiArMjcsMTEgQEAgTUtESVJfUD1ATUtESVJfUEAK
ICBWUEFUSD0kKHNyY2RpcikKICBTSEVMTD0vYmluL3NoCiAgCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNo
CmluZGV4IDkyZWQxZjQ0MTkuLmRmNzRlNWIzMjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA4MTcwMGQxYTBlNTEzOTEwMjhjNzYxY2M4ZWYxY2Q2NjAwODRk
MTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZTIxNGM3MzE2MTJjMTNiMzY1NDVm
MzAxOTQ1ZDRhYzE2ZTkzNjhhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMTIgQXByIDIwMTYgMTU6
NTE6NTQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcnN5bmM6IHJlbW92ZSB1cHN0cmVhbSdzIHJl
YnVpbGQgbG9naWMKQEAgLTgsMTYgKzgsMTUgQEAgZ2VuZXJhbGx5IG92ZXJjb21wbGljYXRlZCwg
YW5kIHdlIGVuc3VyZSB0aGF0IGF1dG9yZWNvbmYgaXMgaW52b2tlZCBpZiByZXF1aXJlZC4KIAog
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgotCiAtLS0KICBNYWtlZmlsZS5pbiB8IDU0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgMSBmaWxl
IGNoYW5nZWQsIDU0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9N
YWtlZmlsZS5pbgotaW5kZXggM2NkZTk1NS4uZDk2M2E3MCAxMDA2NDQKK2luZGV4IGExMjUzZTUu
LmEwODQ5MzUgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZpbGUuaW4KLUBA
IC0xOTAsNjAgKzE5MCw2IEBAIGdlbnNlbmQ6IGdlbgorQEAgLTE5Miw2MCArMTkyLDYgQEAgZ2Vu
c2VuZDogZ2VuCiAgCWZpCiAgCXJzeW5jIC1haWMgJChHRU5GSUxFUykgZ2l0LXZlcnNpb24uaCAk
JHtTQU1CQV9IT1NULXNhbWJhLm9yZ306L2hvbWUvZnRwL3B1Yi9yc3luYy9nZW5lcmF0ZWQtZmls
ZXMvIHx8IHRydWUKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9y
c3luY18zLjIuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnN5bmMvcnN5bmNfMy4yLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3lu
Yy9yc3luY18zLjMuMC5iYgppbmRleCAxMzA1ODFhNzg1Li5iNDIwMjYzMzFkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy4yLjcuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMy4wLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNS
Q19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5zYW1iYS5vcmcvcHViLyR7QlBOfS9zcmMvJHtCUH0u
dGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2RldGVybWlzbS5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRp
b25zLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRlN2Q5ZDNm
NmVkMTA4NzhjNThjNWZiNzI0YTY3ZGFjZjRiNmFhYzczNDBiMTNlNDg4ZmIyZGM0MTM0NmYyYmIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM5OWU5YTY3MDhjMzJkNjc4YTcyYTYzMjE5ZTk2ZjIz
YmUwYmUyMzM2ZTUwZmQxMzQ4NDk4ZDA3MDQxZGY5MCIKIAogaW5oZXJpdCBhdXRvdG9vbHMtYnJv
a2Vuc2VwCiAKLS0gCjIuNDIuMAoK

--===============8488682799651276838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/rsync: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.3.0.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/core2-64-poky-linux/rsync/rsync-dbg: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-dbg: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1465704 to 1467048 (+0%)
packages/core2-64-poky-linux/rsync/rsync-dev: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-dev: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync-doc: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-doc: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync-doc: PKGSIZE changed from 298026 to 298518 (+0%)
packages/core2-64-poky-linux/rsync/rsync-locale: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-locale: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync-src: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-src: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync-src: PKGSIZE changed from 1640513 to 1641890 (+0%)
packages/core2-64-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync-staticdev: PV changed from "3.2.7" to "3.3.0"
packages/core2-64-poky-linux/rsync/rsync: PKGV changed from 3.2.7 [default] to 3.3.0 [default]
packages/core2-64-poky-linux/rsync/rsync: PV changed from "3.2.7" to "3.3.0"

--===============8488682799651276838==--

