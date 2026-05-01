Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74C4CD37BA
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:55 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15715.1777645540185683116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L4Ws+oQt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bP8IoAtA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee697c-7b81cf7b-9257-4b71-a146-06cd2f7fe185-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DEP7aXVh5A6YWGWdYBydjaZ+HhE10slm+6jzPJU4OrA=;
	b=L4Ws+oQt5/RtLPPzeT3o+6zeyj7Lt6q4WyQJfI+qQ3UfYGSrJdxnRBIUSymcfosk
	WT9/k5eM8kcgsfyZIJdhWd15qjlhT/PohPiyhOzpvI1eP2eIpm49nUOPQ5+lXahICRL
	WS1HGFr958QU3JQn/T5Fb996Dcbyyhw+ZG/iWbgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DEP7aXVh5A6YWGWdYBydjaZ+HhE10slm+6jzPJU4OrA=;
	b=bP8IoAtA1vW066k9zq8iflGwVe0ALwV97NMQIzUqCz50kT7tsyAXe3akkErEAmgi
	qmPg3gNCI6rA2yCkWJGPbIh5HbtrHBZP5JT7PaR5FMCmYRJg5knmyZqmuyjDQi6Ilob
	gryjMcvd/aMYL2M2Uem57VYYtJN6ZsyLGA8fpypo=
Content-Type: multipart/mixed; boundary="===============8065850231335924401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.4.2 SUCCEEDED
Message-ID: <0101019de3ee697c-7b81cf7b-9257-4b71-a146-06cd2f7fe185-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236254

--===============8065850231335924401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.4.1-3.4.2.patch
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
From 5238c60f8f11e075a8f25dc2908d863118574bfd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 10:02:15 +0000
Subject: [PATCH] rsync: upgrade 3.4.1 -> 3.4.2

---
 ...-prototypes-to-function-declarations.patch | 68 +++----------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ----------
 .../rsync/files/determism.patch               |  4 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb}  |  3 +-
 5 files changed, 16 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 3011308c61..e6d3578e85 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
+From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -17,20 +17,17 @@ Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/03
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c   | 2 +-
- exclude.c    | 2 +-
- log.c        | 2 +-
- main.c       | 2 +-
- zlib/crc32.c | 2 +-
- zlib/trees.c | 2 +-
- zlib/zutil.c | 4 ++--
- 7 files changed, 8 insertions(+), 8 deletions(-)
+ checksum.c | 2 +-
+ exclude.c  | 2 +-
+ log.c      | 2 +-
+ main.c     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 66e8089..b24b202 100644
+index 24e46bf..6ae3178 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -40,7 +37,7 @@ index 66e8089..b24b202 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 87edbcf..ae0de2f 100644
+index 24de64f..a787488 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -66,7 +63,7 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 4f070ac..f59eaec 100644
+index ccad28a..bbb09ba 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
@@ -78,48 +75,3 @@ index 4f070ac..f59eaec 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 05733f4..50c6c02 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -187,7 +187,7 @@ local void write_table(out, table)
- /* =========================================================================
-  * This function can be used by asm versions of crc32()
-  */
--const z_crc_t FAR * ZEXPORT get_crc_table()
-+const z_crc_t FAR * ZEXPORT get_crc_table(void)
- {
- #ifdef DYNAMIC_CRC_TABLE
-     if (crc_table_empty)
-diff --git a/zlib/trees.c b/zlib/trees.c
-index 9c66770..0d9047e 100644
---- a/zlib/trees.c
-+++ b/zlib/trees.c
-@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
- /* ===========================================================================
-  * Initialize the various 'constant' tables.
-  */
--local void tr_static_init()
-+local void tr_static_init(void)
- {
- #if defined(GEN_TREES_H) || !defined(STDC)
-     static int static_init_done = 0;
-diff --git a/zlib/zutil.c b/zlib/zutil.c
-index bbba7b2..61f8dc9 100644
---- a/zlib/zutil.c
-+++ b/zlib/zutil.c
-@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
- ""};
- 
- 
--const char * ZEXPORT zlibVersion()
-+const char * ZEXPORT zlibVersion(void)
- {
-     return ZLIB_VERSION;
- }
- 
--uLong ZEXPORT zlibCompileFlags()
-+uLong ZEXPORT zlibCompileFlags(void)
- {
-     uLong flags;
- 
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index 1c5661d35b..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c2ff1647b1d9a0b92b73af106ce133490306e886 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-
-Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index a4d46c39..b1588b70 100644
---- a/sender.c
-+++ b/sender.c
-@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
- 
- 		if (ndx - cur_flist->ndx_start >= 0)
- 			file = cur_flist->files[ndx - cur_flist->ndx_start];
-+		else if (cur_flist->parent_ndx < 0)
-+			exit_cleanup(RERR_PROTOCOL);
- 		else
- 			file = dir_flist->files[cur_flist->parent_ndx];
- 		if (F_PATHNAME(file)) {
--- 
-2.51.2
-
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index f915d658c8..fd96b873c8 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1d13e8c..2c5cf99 100644
+index 80e9d72..a7d313c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 42af4c55d0..fb195b1e68 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
+From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7c75c26..1d13e8c 100644
+index c2fe775..80e9d72 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.4.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 509be486b8..5fe1bc2c2b 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2025-10158.patch \
            "
-SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
+SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============8065850231335924401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.4.1-3.4.2.patch"

RnJvbSA1MjM4YzYwZjhmMTFlMDc1YThmMjVkYzI5MDhkODYzMTE4NTc0YmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMDowMjoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJz
eW5jOiB1cGdyYWRlIDMuNC4xIC0+IDMuNC4yCgotLS0KIC4uLi1wcm90b3R5cGVzLXRvLWZ1bmN0
aW9uLWRlY2xhcmF0aW9ucy5wYXRjaCB8IDY4ICsrKy0tLS0tLS0tLS0tLS0tLS0KIC4uLi9yc3lu
Yy9maWxlcy9DVkUtMjAyNS0xMDE1OC5wYXRjaCAgICAgICAgICB8IDM2IC0tLS0tLS0tLS0KIC4u
Li9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2ggICAgICAgICAgICAgICB8ICA0ICstCiAuLi4v
cnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaCAgICAgfCAgNiArLQogLi4uL3Jz
eW5jL3tyc3luY18zLjQuMS5iYiA9PiByc3luY18zLjQuMi5iYn0gIHwgIDMgKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9DVkUtMjAyNS0xMDE1OC5w
YXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy97cnN5bmNfMy40LjEuYmIg
PT4gcnN5bmNfMy40LjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1k
ZWNsYXJhdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAw
MS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaApp
bmRleCAzMDExMzA4YzYxLi5lNmQzNTc4ZTg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9u
LWRlY2xhcmF0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmls
ZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDczY2FhNjdmMmFhMjIxZGUxMTNhMjFmODEwNTk0
MDQyMWEyZGE5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZjYmU1YjcwYjVjYmY5
ODFjZjY5MzEzN2FjMDgxY2FjYmJiMmUyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI5IEF1ZyAyMDIyIDE5
OjUzOjI4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIHByb3RvdHlwZXMgdG8g
ZnVuY3Rpb24gZGVjbGFyYXRpb25zCkBAIC0xNywyMCArMTcsMTcgQEAgVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vbGlzdHMuc2FtYmEub3JnL2FyY2hpdmUvcnN5bmMvMjAyMi1B
dWd1c3QvMDMKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBT
aWduZWQtb2ZmLWJ5OiBBcmNoYW5hIFBvbGFtcGFsbGkgPGFyY2hhbmEucG9sYW1wYWxsaUB3aW5k
cml2ZXIuY29tPgogLS0tCi0gY2hlY2tzdW0uYyAgIHwgMiArLQotIGV4Y2x1ZGUuYyAgICB8IDIg
Ky0KLSBsb2cuYyAgICAgICAgfCAyICstCi0gbWFpbi5jICAgICAgIHwgMiArLQotIHpsaWIvY3Jj
MzIuYyB8IDIgKy0KLSB6bGliL3RyZWVzLmMgfCAyICstCi0gemxpYi96dXRpbC5jIHwgNCArKy0t
Ci0gNyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCisgY2hl
Y2tzdW0uYyB8IDIgKy0KKyBleGNsdWRlLmMgIHwgMiArLQorIGxvZy5jICAgICAgfCAyICstCisg
bWFpbi5jICAgICB8IDIgKy0KKyA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NoZWNrc3VtLmMgYi9jaGVja3N1bS5jCi1pbmRl
eCA2NmU4MDg5Li5iMjRiMjAyIDEwMDY0NAoraW5kZXggMjRlNDZiZi4uNmFlMzE3OCAxMDA2NDQK
IC0tLSBhL2NoZWNrc3VtLmMKICsrKyBiL2NoZWNrc3VtLmMKLUBAIC03NzksNyArNzc5LDcgQEAg
c3RhdGljIHZvaWQgdmVyaWZ5X2RpZ2VzdChzdHJ1Y3QgbmFtZV9udW1faXRlbSAqbm5pLCBCT09M
IGNoZWNrX2F1dGhfbGlzdCkKK0BAIC03NzgsNyArNzc4LDcgQEAgc3RhdGljIHZvaWQgdmVyaWZ5
X2RpZ2VzdChzdHJ1Y3QgbmFtZV9udW1faXRlbSAqbm5pLCBCT09MIGNoZWNrX2F1dGhfbGlzdCkK
ICB9CiAgI2VuZGlmCiAgCkBAIC00MCw3ICszNyw3IEBAIGluZGV4IDY2ZTgwODkuLmIyNGIyMDIg
MTAwNjQ0CiAgI2lmIGRlZmluZWQgU1VQUE9SVF9YWEgzIHx8IGRlZmluZWQgVVNFX09QRU5TU0wK
ICAJc3RydWN0IG5hbWVfbnVtX2l0ZW0gKm5uaTsKIGRpZmYgLS1naXQgYS9leGNsdWRlLmMgYi9l
eGNsdWRlLmMKLWluZGV4IDg3ZWRiY2YuLmFlMGRlMmYgMTAwNjQ0CitpbmRleCAyNGRlNjRmLi5h
Nzg3NDg4IDEwMDY0NAogLS0tIGEvZXhjbHVkZS5jCiArKysgYi9leGNsdWRlLmMKIEBAIC0zNjMs
NyArMzYzLDcgQEAgdm9pZCBpbXBsaWVkX2luY2x1ZGVfcGFydGlhbF9zdHJpbmcoY29uc3QgY2hh
ciAqc19zdGFydCwgY29uc3QgY2hhciAqc19lbmQpCkBAIC02Niw3ICs2Myw3IEBAIGluZGV4IGU0
YmExY2MuLjg0ODJiNzEgMTAwNjQ0CiAgCWludCBvcHRpb25zID0gTE9HX1BJRDsKICAKIGRpZmYg
LS1naXQgYS9tYWluLmMgYi9tYWluLmMKLWluZGV4IDRmMDcwYWMuLmY1OWVhZWMgMTAwNjQ0Citp
bmRleCBjY2FkMjhhLi5iYmIwOWJhIDEwMDY0NAogLS0tIGEvbWFpbi5jCiArKysgYi9tYWluLmMK
IEBAIC0yNDYsNyArMjQ2LDcgQEAgdm9pZCByZWFkX2RlbF9zdGF0cyhpbnQgZikKQEAgLTc4LDQ4
ICs3NSwzIEBAIGluZGV4IDRmMDcwYWMuLmY1OWVhZWMgMTAwNjQ0CiAgewogIAljaGFyICpnbmFt
ZTsKICAJdWlkX3QgdWlkOwotZGlmZiAtLWdpdCBhL3psaWIvY3JjMzIuYyBiL3psaWIvY3JjMzIu
YwotaW5kZXggMDU3MzNmNC4uNTBjNmMwMiAxMDA2NDQKLS0tLSBhL3psaWIvY3JjMzIuYwotKysr
IGIvemxpYi9jcmMzMi5jCi1AQCAtMTg3LDcgKzE4Nyw3IEBAIGxvY2FsIHZvaWQgd3JpdGVfdGFi
bGUob3V0LCB0YWJsZSkKLSAvKiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0gICogVGhpcyBmdW5jdGlvbiBj
YW4gYmUgdXNlZCBieSBhc20gdmVyc2lvbnMgb2YgY3JjMzIoKQotICAqLwotLWNvbnN0IHpfY3Jj
X3QgRkFSICogWkVYUE9SVCBnZXRfY3JjX3RhYmxlKCkKLStjb25zdCB6X2NyY190IEZBUiAqIFpF
WFBPUlQgZ2V0X2NyY190YWJsZSh2b2lkKQotIHsKLSAjaWZkZWYgRFlOQU1JQ19DUkNfVEFCTEUK
LSAgICAgaWYgKGNyY190YWJsZV9lbXB0eSkKLWRpZmYgLS1naXQgYS96bGliL3RyZWVzLmMgYi96
bGliL3RyZWVzLmMKLWluZGV4IDljNjY3NzAuLjBkOTA0N2UgMTAwNjQ0Ci0tLS0gYS96bGliL3Ry
ZWVzLmMKLSsrKyBiL3psaWIvdHJlZXMuYwotQEAgLTIzMSw3ICsyMzEsNyBAQCBsb2NhbCB2b2lk
IHNlbmRfYml0cyhzLCB2YWx1ZSwgbGVuZ3RoKQotIC8qID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotICAq
IEluaXRpYWxpemUgdGhlIHZhcmlvdXMgJ2NvbnN0YW50JyB0YWJsZXMuCi0gICovCi0tbG9jYWwg
dm9pZCB0cl9zdGF0aWNfaW5pdCgpCi0rbG9jYWwgdm9pZCB0cl9zdGF0aWNfaW5pdCh2b2lkKQot
IHsKLSAjaWYgZGVmaW5lZChHRU5fVFJFRVNfSCkgfHwgIWRlZmluZWQoU1REQykKLSAgICAgc3Rh
dGljIGludCBzdGF0aWNfaW5pdF9kb25lID0gMDsKLWRpZmYgLS1naXQgYS96bGliL3p1dGlsLmMg
Yi96bGliL3p1dGlsLmMKLWluZGV4IGJiYmE3YjIuLjYxZjhkYzkgMTAwNjQ0Ci0tLS0gYS96bGli
L3p1dGlsLmMKLSsrKyBiL3psaWIvenV0aWwuYwotQEAgLTI3LDEyICsyNywxMiBAQCB6X2NvbnN0
IGNoYXIgKiBjb25zdCB6X2Vycm1zZ1sxMF0gPSB7Ci0gIiJ9OwotIAotIAotLWNvbnN0IGNoYXIg
KiBaRVhQT1JUIHpsaWJWZXJzaW9uKCkKLStjb25zdCBjaGFyICogWkVYUE9SVCB6bGliVmVyc2lv
bih2b2lkKQotIHsKLSAgICAgcmV0dXJuIFpMSUJfVkVSU0lPTjsKLSB9Ci0gCi0tdUxvbmcgWkVY
UE9SVCB6bGliQ29tcGlsZUZsYWdzKCkKLSt1TG9uZyBaRVhQT1JUIHpsaWJDb21waWxlRmxhZ3Mo
dm9pZCkKLSB7Ci0gICAgIHVMb25nIGZsYWdzOwotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JzeW5jL2ZpbGVzL0NWRS0yMDI1LTEwMTU4LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JzeW5jL2ZpbGVzL0NWRS0yMDI1LTEwMTU4LnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAxYzU2NjFkMzViLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9maWxlcy9DVkUtMjAyNS0xMDE1OC5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDM2ICswLDAgQEAKLUZyb20gYzJmZjE2NDdiMWQ5YTBiOTJiNzNhZjEwNmNlMTMzNDkw
MzA2ZTg4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFuZHJldyBUcmlkZ2VsbCA8
YW5kcmV3QHRyaWRnZWxsLm5ldD4KLURhdGU6IFNhdCwgMjMgQXVnIDIwMjUgMTc6MjY6NTMgKzEw
MDAKLVN1YmplY3Q6IFtQQVRDSF0gZml4ZWQgYW4gaW52YWxpZCBhY2Nlc3MgdG8gZmlsZXMgYXJy
YXkKLQotdGhpcyB3YXMgZm91bmQgYnkgQ2FsdW0gSHV0dG9uIGZyb20gUmFwaWQ3LiBJdCBpcyBh
IHJlYWwgYnVnLCBidXQKLWFuYWx5c2lzIHNob3dzIGl0IGNhbid0IGJlIGxldmVyZ2VkIGludG8g
YW4gZXhwbG9pdC4gV29ydGggZml4aW5nCi10aG91Z2guCi0KLU1hbnkgdGhhbmtzIHRvIENhbHVt
IGFuZCBSYXBpZDcgZm9yIGZpbmRpbmcgYW5kIHJlcG9ydGluZyB0aGlzCi0KLUNWRTogQ1ZFLTIw
MjUtMTAxNTgKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29t
L1JzeW5jUHJvamVjdC9yc3luYy9jb21taXQvNzk3ZTE3ZmM0YTZmMTVlM2IxNzU2NTM4YTlmODEy
YjYzOTQyNjg2Zl0KLQotU2lnbmVkLW9mZi1ieTogTGl5aW4gWmhhbmcgPGxpeWluLnpoYW5nLmNu
QHdpbmRyaXZlci5jb20+Ci0tLS0KLSBzZW5kZXIuYyB8IDIgKysKLSAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9zZW5kZXIuYyBiL3NlbmRlci5jCi1pbmRl
eCBhNGQ0NmMzOS4uYjE1ODhiNzAgMTAwNjQ0Ci0tLS0gYS9zZW5kZXIuYwotKysrIGIvc2VuZGVy
LmMKLUBAIC0yNjIsNiArMjYyLDggQEAgdm9pZCBzZW5kX2ZpbGVzKGludCBmX2luLCBpbnQgZl9v
dXQpCi0gCi0gCQlpZiAobmR4IC0gY3VyX2ZsaXN0LT5uZHhfc3RhcnQgPj0gMCkKLSAJCQlmaWxl
ID0gY3VyX2ZsaXN0LT5maWxlc1tuZHggLSBjdXJfZmxpc3QtPm5keF9zdGFydF07Ci0rCQllbHNl
IGlmIChjdXJfZmxpc3QtPnBhcmVudF9uZHggPCAwKQotKwkJCWV4aXRfY2xlYW51cChSRVJSX1BS
T1RPQ09MKTsKLSAJCWVsc2UKLSAJCQlmaWxlID0gZGlyX2ZsaXN0LT5maWxlc1tjdXJfZmxpc3Qt
PnBhcmVudF9uZHhdOwotIAkJaWYgKEZfUEFUSE5BTUUoZmlsZSkpIHsKLS0tIAotMi41MS4yCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNo
CmluZGV4IGY5MTVkNjU4YzguLmZkOTZiODczYzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NDFiODU5YTlkZjk2MTFiN2IzZjZjYmUyOGFmNDcxMThkOTQ3MDgwZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjgxMGQ3OGE5MzI3YjViMzEzZWJjMGFhMWEwYjE1NWRlN2MxMGFmZCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogU3VuLCAyMSBGZWIgMjAyMSAwOTo0NTo0
OCArMDAwMAogU3ViamVjdDogW1BBVENIXSByc3luYzogRml4IGEgZmlsZSBzb3J0aW5nIGRldGVy
bWluaXNtIGlzc3VlCkBAIC0yNSw3ICsyNSw3IEBAIGh0dHBzOi8vZ2l0aHViLmNvbS9XYXluZUQv
cnN5bmMvY29tbWl0L2QzMDg1ZjdhZGQzOGE1Y2Y4MzNhMGIzMWNiMDYzN2ZmNDZjODBmOGQKICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5p
biBiL01ha2VmaWxlLmluCi1pbmRleCAxZDEzZThjLi4yYzVjZjk5IDEwMDY0NAoraW5kZXggODBl
OWQ3Mi4uYTdkMzEzYyAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5p
bgogQEAgLTI3LDYgKzI3LDExIEBAIE1LRElSX1A9QE1LRElSX1BACmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBh
dGNoCmluZGV4IDQyYWY0YzU1ZDAuLmZiMTk1YjFlNjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MDNlNTg2MmNjYTgzMmFlOTI1ZDBjOTJhODY1NGE1N2Nh
ZmY1OTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNjA4ZjVlYmIyNmUyZTQ3NDg2
N2JlYzZjM2Q2N2RmZDBhNzY2M2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMTIgQXByIDIwMTYg
MTU6NTE6NTQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcnN5bmM6IHJlbW92ZSB1cHN0cmVhbSdz
IHJlYnVpbGQgbG9naWMKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1NCBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDdj
NzVjMjYuLjFkMTNlOGMgMTAwNjQ0CitpbmRleCBjMmZlNzc1Li44MGU5ZDcyIDEwMDY0NAogLS0t
IGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCi1AQCAtMTg0LDYwICsxODQsNiBAQCBj
b25mOiBjb25maWd1cmUuc2ggY29uZmlnLmguaW4KK0BAIC0xODUsNjAgKzE4NSw2IEBAIGNvbmY6
IGNvbmZpZ3VyZS5zaCBjb25maWcuaC5pbgogIC5QSE9OWTogZ2VuCiAgZ2VuOiBjb25mIHByb3Rv
LmggbWFuIGdpdC12ZXJzaW9uLmgKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yc3luYy9yc3luY18zLjQuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3lu
Y18zLjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy40LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9yc3luYy9yc3luY18zLjQuMi5iYgppbmRleCA1MDliZTQ4NmI4Li41ZmUxYmMyYzJiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy40LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNC4yLmJiCkBAIC0xNSw5ICsx
NSw4IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5zYW1iYS5vcmcvcHViLyR7QlBOfS9z
cmMvJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL21ha2VmaWxlLW5vLXJlYnVpbGQu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaXNtLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlv
bnMucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjUtMTAxNTgucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjkyNGJjYjNhMWVkOGI1NTFmYzEwMWY3
NDBiOWYwZmUwYTIwMmIxMTUwMjc2NDdjZjY5ODUwZDY1ZmQ4OGM1MiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJmZjEwYWEyYzE1MWNkNGIyZGJiZTYxMzUxMjZkYmM4NTQwNDYxMTNkMmRmYjQ5NTcy
YTM0ODIzMzI2N2ViMzE1IgogCiAjIE91dC1vZi10cmVlIGJ1aWxkcyBkb24ndCBpbnN0YWxsIHRo
ZSBkb2N1bWVudGF0aW9uIGN1cnJlbnRseQogIyBodHRwczovL2dpdGh1Yi5jb20vUnN5bmNQcm9q
ZWN0L3JzeW5jL2lzc3Vlcy84NDYKLS0gCjIuNDcuMQoK

--===============8065850231335924401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.4.1.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch file://CVE-2025-10158.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.4.2.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/x86-64-v3-poky-linux/rsync: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1362528 to 1363200 (+0%)
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGSIZE changed from 298657 to 300234 (+1%)
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-src: FILELIST: directory renamed /usr/src/debug/rsync/3.4.1 -> /usr/src/debug/rsync/3.4.2, directory renamed /usr/src/debug/rsync/3.4.1/lib -> /usr/src/debug/rsync/3.4.2/lib
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1242633 to 1244830 (+0%)
packages/x86-64-v3-poky-linux/rsync/rsync-src: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PV changed from "3.4.1" to "3.4.2"
packages/x86-64-v3-poky-linux/rsync/rsync: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 519682 to 518146 (-0%)
packages/x86-64-v3-poky-linux/rsync/rsync: PV changed from "3.4.1" to "3.4.2"

--===============8065850231335924401==--

