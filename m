Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA4FCD8C8C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1558.1780328132758483389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L+qLzMBb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0d166yvz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d39afc-2e74b606-2422-4a36-94de-0ccfa9abd708-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Lff3T/XSAGpdfQn0vxVD3ene0PwSv9h7lZ5VcrEsGM=;
	b=L+qLzMBbhVG5lXHZeOvo8ZiwrZm0xevlrPBTEkC3cVWe6Nl3zDqOC6TXgjdtAccj
	34jyeEMRVT7kkRcnELwLAsaZvlCAV31j8NUCiD55beixC1AP55CG8ZbsNzUx4FphcoF
	H1EaRT6jahRCjoxjdmOi1Z2BQGySU7O1VkjKAOus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Lff3T/XSAGpdfQn0vxVD3ene0PwSv9h7lZ5VcrEsGM=;
	b=0d166yvz7ObZgD4G2QJO1MHHhDv1yv2Reybd+4y4k0sf8OQ/l9sl+DnuTc+oZiZ1
	HCuhXBb00J21qbEnzb55w5ThlFQP0+J57AzFAZ6X3FXDeSS73M2p1NC4xEph41IY714
	L2xhHo206d/mJLurM74sW2zoiQVz91sEltlhzHzs=
Content-Type: multipart/mixed; boundary="===============0085379901392876166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.4.3 SUCCEEDED
Message-ID: <0101019e83d39afc-2e74b606-2422-4a36-94de-0ccfa9abd708-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237901

--===============0085379901392876166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.4.2-3.4.3.patch
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
From 9d2afde6bcc2aaec74b1e4598a3050f3014e0199 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:57:24 +0000
Subject: [PATCH] rsync: upgrade 3.4.2 -> 3.4.3

---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.4.2.bb => rsync_3.4.3.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.2.bb => rsync_3.4.3.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index e6d3578e85..1e43834aa6 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
+From ca0eb32797ac0ac05d176c88d40283936a7baa78 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,7 +50,7 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index b948f16..afca81d 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -63,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index ccad28a..bbb09ba 100644
+index 78f0b83..7a3f80a 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index fd96b873c8..54f75049ab 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
+From 54072971b5319e85be4f5ff5a73ac262b73b9f41 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 80e9d72..a7d313c 100644
+index 4f25841..00df9f1 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index fb195b1e68..b571d0c582 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
+From 49f396f67b8c4cd5635b373acf347d22f1494561 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c2fe775..80e9d72 100644
+index 699d995..4f25841 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
+@@ -193,60 +193,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.3.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.3.bb
index 5fe1bc2c2b..43693859c0 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
+SRC_URI[sha256sum] = "c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============0085379901392876166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.4.2.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.4.3.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/x86-64-v3-poky-linux/rsync: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1381616 to 1429136 (+3%)
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGSIZE changed from 300234 to 300231 (-0%)
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1244830 to 1295516 (+4%)
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: FILELIST: directory renamed /usr/src/debug/rsync/3.4.2 -> /usr/src/debug/rsync/3.4.3, directory renamed /usr/src/debug/rsync/3.4.2/lib -> /usr/src/debug/rsync/3.4.3/lib
packages/x86-64-v3-poky-linux/rsync/rsync-src: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PV changed from "3.4.2" to "3.4.3"
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 530434 to 546818 (+3%)
packages/x86-64-v3-poky-linux/rsync/rsync: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PV changed from "3.4.2" to "3.4.3"

--===============0085379901392876166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.4.2-3.4.3.patch"

RnJvbSA5ZDJhZmRlNmJjYzJhYWVjNzRiMWU0NTk4YTMwNTBmMzAxNGUwMTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTo1NzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJz
eW5jOiB1cGdyYWRlIDMuNC4yIC0+IDMuNC4zCgotLS0KIC4uLi1BZGQtbWlzc2luZy1wcm90b3R5
cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaCB8IDggKysrKy0tLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2ggICAgICAgICB8IDQgKyst
LQogLi4uL3JzeW5jL2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVpbGQucGF0Y2ggICAgICAgICAgICAg
ICAgIHwgNiArKystLS0KIC4uLi9yc3luYy97cnN5bmNfMy40LjIuYmIgPT4gcnN5bmNfMy40LjMu
YmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3ty
c3luY18zLjQuMi5iYiA9PiByc3luY18zLjQuMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVz
LXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
c3luYy9maWxlcy8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFy
YXRpb25zLnBhdGNoCmluZGV4IGU2ZDM1NzhlODUuLjFlNDM4MzRhYTYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlw
ZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yc3luYy9maWxlcy8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24t
ZGVjbGFyYXRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NmNiZTViNzBiNWNiZjk4
MWNmNjkzMTM3YWMwODFjYWNiYmIyZTJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBj
YTBlYjMyNzk3YWMwYWMwNWQxNzZjODhkNDAyODM5MzZhN2JhYTc4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwg
MjkgQXVnIDIwMjIgMTk6NTM6MjggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3Npbmcg
cHJvdG90eXBlcyB0byBmdW5jdGlvbiBkZWNsYXJhdGlvbnMKQEAgLTUwLDcgKzUwLDcgQEAgaW5k
ZXggMjRkZTY0Zi4uYTc4NzQ4OCAxMDA2NDQKICAJaWYgKHBhcnRpYWxfc3RyaW5nX2J1Zikgewog
IAkJaWYgKHBhcnRpYWxfc3RyaW5nX2xlbikKIGRpZmYgLS1naXQgYS9sb2cuYyBiL2xvZy5jCi1p
bmRleCBlNGJhMWNjLi44NDgyYjcxIDEwMDY0NAoraW5kZXggYjk0OGYxNi4uYWZjYTgxZCAxMDA2
NDQKIC0tLSBhL2xvZy5jCiArKysgYi9sb2cuYwogQEAgLTEzMSw3ICsxMzEsNyBAQCBzdGF0aWMg
dm9pZCBsb2dpdChpbnQgcHJpb3JpdHksIGNvbnN0IGNoYXIgKmJ1ZikKQEAgLTYzLDExICs2Mywx
MSBAQCBpbmRleCBlNGJhMWNjLi44NDgyYjcxIDEwMDY0NAogIAlpbnQgb3B0aW9ucyA9IExPR19Q
SUQ7CiAgCiBkaWZmIC0tZ2l0IGEvbWFpbi5jIGIvbWFpbi5jCi1pbmRleCBjY2FkMjhhLi5iYmIw
OWJhIDEwMDY0NAoraW5kZXggNzhmMGI4My4uN2EzZjgwYSAxMDA2NDQKIC0tLSBhL21haW4uYwog
KysrIGIvbWFpbi5jCiBAQCAtMjQ2LDcgKzI0Niw3IEBAIHZvaWQgcmVhZF9kZWxfc3RhdHMoaW50
IGYpCi0gCXN0YXRzLmRlbGV0ZWRfZmlsZXMgKz0gc3RhdHMuZGVsZXRlZF9zcGVjaWFscyA9IHJl
YWRfdmFyaW50KGYpOworIAlzdGF0cy5kZWxldGVkX2ZpbGVzICs9IHN0YXRzLmRlbGV0ZWRfc3Bl
Y2lhbHMgPSByZWFkX3ZhcmludF9ib3VuZGVkKGYsIDAsIE1BWF9XSVJFX0RFTF9TVEFULCAiZGVs
ZXRlZF9zcGVjaWFscyIpOwogIH0KICAKIC1zdGF0aWMgdm9pZCBiZWNvbWVfY29weV9hc191c2Vy
KCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1p
c20ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBh
dGNoCmluZGV4IGZkOTZiODczYzguLjU0Zjc1MDQ5YWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYjgxMGQ3OGE5MzI3YjViMzEzZWJjMGFhMWEwYjE1NWRlN2MxMGFmZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNTQwNzI5NzFiNTMxOWU4NWJlNGY1ZmY1YTczYWMyNjJiNzNiOWY0
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogU3VuLCAyMSBGZWIgMjAyMSAwOTo0
NTo0OCArMDAwMAogU3ViamVjdDogW1BBVENIXSByc3luYzogRml4IGEgZmlsZSBzb3J0aW5nIGRl
dGVybWluaXNtIGlzc3VlCkBAIC0yNSw3ICsyNSw3IEBAIGh0dHBzOi8vZ2l0aHViLmNvbS9XYXlu
ZUQvcnN5bmMvY29tbWl0L2QzMDg1ZjdhZGQzOGE1Y2Y4MzNhMGIzMWNiMDYzN2ZmNDZjODBmOGQK
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmls
ZS5pbiBiL01ha2VmaWxlLmluCi1pbmRleCA4MGU5ZDcyLi5hN2QzMTNjIDEwMDY0NAoraW5kZXgg
NGYyNTg0MS4uMDBkZjlmMSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmls
ZS5pbgogQEAgLTI3LDYgKzI3LDExIEBAIE1LRElSX1A9QE1LRElSX1BACmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxk
LnBhdGNoCmluZGV4IGZiMTk1YjFlNjguLmI1NzFkMGM1ODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNjA4ZjVlYmIyNmUyZTQ3NDg2N2JlYzZjM2Q2N2Rm
ZDBhNzY2M2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OWYzOTZmNjdiOGM0Y2Q1
NjM1YjM3M2FjZjM0N2QyMmYxNDk0NTYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMTIgQXByIDIw
MTYgMTU6NTE6NTQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcnN5bmM6IHJlbW92ZSB1cHN0cmVh
bSdzIHJlYnVpbGQgbG9naWMKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1NCBkZWxl
dGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4
IGMyZmU3NzUuLjgwZTlkNzIgMTAwNjQ0CitpbmRleCA2OTlkOTk1Li40ZjI1ODQxIDEwMDY0NAog
LS0tIGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCi1AQCAtMTg1LDYwICsxODUsNiBA
QCBjb25mOiBjb25maWd1cmUuc2ggY29uZmlnLmguaW4KK0BAIC0xOTMsNjAgKzE5Myw2IEBAIGNv
bmY6IGNvbmZpZ3VyZS5zaCBjb25maWcuaC5pbgogIC5QSE9OWTogZ2VuCiAgZ2VuOiBjb25mIHBy
b3RvLmggbWFuIGdpdC12ZXJzaW9uLmgKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yc3luYy9yc3luY18zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9y
c3luY18zLjQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yc3luYy9yc3luY18zLjQuMy5iYgppbmRleCA1ZmUxYmMyYzJiLi40MzY5Mzg1OWMw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy40LjIuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNC4zLmJiCkBAIC0xNiw3
ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5zYW1iYS5vcmcvcHViLyR7QlBO
fS9zcmMvJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2RldGVybWlzbS5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rp
b24tZGVjbGFyYXRpb25zLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImZmMTBhYTJjMTUxY2Q0YjJkYmJlNjEzNTEyNmRiYzg1NDA0NjExM2QyZGZiNDk1NzJhMzQ4
MjMzMjY3ZWIzMTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzcyZTYzY2EzMDIxY2JjODBiYTg2
ZWMzMDEwMjc3M2Y0YzU2MzFmYmM0OTJiNTJlNzczYjM5NThmODJhNTNkMyIKIAogIyBPdXQtb2Yt
dHJlZSBidWlsZHMgZG9uJ3QgaW5zdGFsbCB0aGUgZG9jdW1lbnRhdGlvbiBjdXJyZW50bHkKICMg
aHR0cHM6Ly9naXRodWIuY29tL1JzeW5jUHJvamVjdC9yc3luYy9pc3N1ZXMvODQ2Ci0tIAoyLjQ3
LjEKCg==

--===============0085379901392876166==--

