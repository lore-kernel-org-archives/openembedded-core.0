Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD20C83026
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EvaIaqAf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F1k2WDFF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc7002b-cb4e1eaa-7fe8-4fa2-9e95-421461e14581-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L/r2AigpT2b/R8bSg/KfV3S9mTxrLamLU3Q/CHWA+ho=;
	b=EvaIaqAfWDqWBp8Wv2p3ebHiqoTiPrsrhPQ8ET6KVVNEc1+/Dk09rF5/F5YTcJCV
	IKHyN72HinK0SK87oEI+g9m67rHMgHEVi5NAhTZV260abz8wTdpq+2aU8szVmkyrgB8
	QboNfTPWGtZVWHsKDMpafqMczgQm8ZLGpGdx5uRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L/r2AigpT2b/R8bSg/KfV3S9mTxrLamLU3Q/CHWA+ho=;
	b=F1k2WDFFq7JaLMlrPrwhsAEKIZxNxhSGHj5c3oiBHNHmn5Wxmv9xZT63+59VKyRH
	acDMZNs5Tv9bvlL9q4FUx8o+qXgEFpS5PKq6ouyPlCUBE6qaWvedH2prmn9lHa5XQkW
	oeabMggqJRU9SOklqyGbpBTY7nho8zOm0YCxjepU=
Content-Type: multipart/mixed; boundary="===============5798364973692672996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.6 SUCCEEDED
Message-ID: <010101972bc7002b-cb4e1eaa-7fe8-4fa2-9e95-421461e14581-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217661

--===============5798364973692672996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apr* to *1.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apr-upgrade-1.7.5-1.7.6.patch
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
From 185b55b92c4f617358b577efd51cfa3a7edd8fca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:19:29 +0000
Subject: [PATCH] apr: upgrade 1.7.5 -> 1.7.6

---
 ...ion-to-disable-timed-dependant-tests.patch | 11 +++++-----
 ...-runtime-test-for-mmap-that-can-map-.patch |  7 +++----
 ...Check-for-NULL-handle-in-apr_dso_sym.patch |  5 +----
 ...ir-path-references-from-installed-ap.patch |  9 ++++----
 ...04-Fix-packet-discards-HTTP-redirect.patch |  7 ++-----
 ...-LTFLAGS-to-make-it-work-with-ccache.patch | 11 ++++------
 .../apr/apr/autoconf-2.73.patch               | 21 ++++++++++++-------
 .../apr/{apr_1.7.5.bb => apr_1.7.6.bb}        |  2 +-
 8 files changed, 34 insertions(+), 39 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.5.bb => apr_1.7.6.bb} (98%)

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
index b46dc76a86..63d5f562ac 100644
--- a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -1,4 +1,4 @@
-From 225abf37cd0b49960664b59f08e515a4c4ea5ad0 Mon Sep 17 00:00:00 2001
+From 525ef54051b7c15fd76b651cfbffaf1ddb755f01 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Thu, 26 Mar 2020 18:30:36 +0000
 Subject: [PATCH] Add option to disable timed dependant tests
@@ -9,7 +9,6 @@ a timer or other timing related issues.
 
 Upstream-Status: Submitted [https://github.com/apache/apr/pull/54]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
 ---
  configure.in     | 6 ++++++
  include/apr.h.in | 1 +
@@ -17,10 +16,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  3 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index bfd488b..3663220 100644
+index 0ce20ab..3d42953 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -3023,6 +3023,12 @@ AC_ARG_ENABLE(timedlocks,
+@@ -3119,6 +3119,12 @@ AC_ARG_ENABLE(timedlocks,
  )
  AC_SUBST(apr_has_timedlocks)
  
@@ -34,10 +33,10 @@ index bfd488b..3663220 100644
  # so getaddrinfo/gai_strerror are not used.
  if test $have_ipv6 = 0; then
 diff --git a/include/apr.h.in b/include/apr.h.in
-index ee99def..c46a5f4 100644
+index 637ed38..e7cb9b9 100644
 --- a/include/apr.h.in
 +++ b/include/apr.h.in
-@@ -298,6 +298,7 @@ extern "C" {
+@@ -307,6 +307,7 @@ extern "C" {
  #define APR_HAS_XTHREAD_FILES     @apr_has_xthread_files@
  #define APR_HAS_OS_UUID           @osuuid@
  #define APR_HAS_TIMEDLOCKS        @apr_has_timedlocks@
diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index 3480deaa4d..dbdc2871ba 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -1,4 +1,4 @@
-From 316b81c462f065927d7fec56aadd5c8cb94d1cf0 Mon Sep 17 00:00:00 2001
+From 4a90ec801fbe0e6ad18b70b647985ce91fface4a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Aug 2022 00:28:08 -0700
 Subject: [PATCH] configure: Remove runtime test for mmap that can map
@@ -10,16 +10,15 @@ mutexes
 
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  configure.in | 30 ------------------------------
  1 file changed, 30 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 3663220..dce9789 100644
+index 3d42953..7e43b0f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1303,36 +1303,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
+@@ -1391,36 +1391,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
  APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
  AC_CHECK_FILE(/dev/zero)
  
diff --git a/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch b/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch
index 8ba181b887..e5dc410ef7 100644
--- a/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch
+++ b/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch
@@ -1,4 +1,4 @@
-From a25be1aaa92a6d2e7f4cc3fdfbb92e5a10b63035 Mon Sep 17 00:00:00 2001
+From 43c460db7a0e885659ed53ab5de2aca033ef6985 Mon Sep 17 00:00:00 2001
 From: Greg Beard <gmbeard@googlemail.com>
 Date: Sat, 25 Mar 2023 08:31:36 +0000
 Subject: [PATCH] dso: Check for NULL handle in apr_dso_sym
@@ -32,6 +32,3 @@ index fdd56f1..583d5de 100644
  #if defined(DSO_USE_SHL)
      void *symaddr = NULL;
      int status;
--- 
-2.42.0
-
diff --git a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
index d63423f3a1..2eaa0596b2 100644
--- a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
+++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
@@ -1,4 +1,4 @@
-From 689a8db96a6d1e1cae9cbfb35d05ac82140a6555 Mon Sep 17 00:00:00 2001
+From 26c834c09a510819de0efdb56fb7ba020439e7c5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 09:39:06 +0800
 Subject: [PATCH] apr: Remove workdir path references from installed apr files
@@ -13,16 +13,15 @@ packages at target run time, the workdir path caused confusion.
 Rebase to 1.6.3
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  apr-config.in | 32 ++------------------------------
  1 file changed, 2 insertions(+), 30 deletions(-)
 
 diff --git a/apr-config.in b/apr-config.in
-index bed47ca..47874e5 100644
+index 626d3b0..42be269 100644
 --- a/apr-config.in
 +++ b/apr-config.in
-@@ -164,16 +164,7 @@ while test $# -gt 0; do
+@@ -179,16 +179,7 @@ while test $# -gt 0; do
      flags="$flags $LDFLAGS"
      ;;
      --includes)
@@ -39,7 +38,7 @@ index bed47ca..47874e5 100644
      ;;
      --srcdir)
      echo $APR_SOURCE_DIR
-@@ -197,33 +188,14 @@ while test $# -gt 0; do
+@@ -212,33 +203,14 @@ while test $# -gt 0; do
      exit 0
      ;;
      --link-ld)
diff --git a/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
index 30fc07d4a0..e525194f95 100644
--- a/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
+++ b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
@@ -1,7 +1,7 @@
-From 7925eb1766a00ccee05c6e80b1d34f163a04b7b1 Mon Sep 17 00:00:00 2001
+From 7c29986101ceefc7bb2f4cd4f7fb046db7f8772e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 09:43:34 +0800
-Subject: [PATCH 4/7] Fix packet discards HTTP redirect.
+Subject: [PATCH] Fix packet discards HTTP redirect.
 
 Disconnect the connection by poll() timeout.
 If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
@@ -34,6 +34,3 @@ index 4c0e0a6..1bdafba 100644
          if (arv != APR_SUCCESS) {
              *len = 0;
              return arv;
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
index 02634e6fde..67851298d3 100644
--- a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
+++ b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
@@ -1,7 +1,7 @@
-From 2e66cece0c3adff92733332111204ddc1d730a07 Mon Sep 17 00:00:00 2001
+From 5efa5286bd4c986333cd0cc4e41f31c4c853c62e Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 19 Nov 2015 18:25:38 -0800
-Subject: [PATCH 5/7] configure.in: fix LTFLAGS to make it work with ccache
+Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
 
 When ccache is enabled, libtool requires --tag=CC when use ccache,
 otherwise when building apr-util with ccache enabled:
@@ -19,10 +19,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 361120f..3b10422 100644
+index b0457e2..0ce20ab 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -249,7 +249,7 @@ case $host in
+@@ -266,7 +266,7 @@ case $host in
      ;;
  *)
      if test "x$LTFLAGS" = "x"; then
@@ -31,6 +31,3 @@ index 361120f..3b10422 100644
      fi
      if test "$experimental_libtool" = "yes"; then
          # Use a custom-made libtool replacement
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr/autoconf-2.73.patch b/meta/recipes-support/apr/apr/autoconf-2.73.patch
index a8b7a77566..1e24c0a576 100644
--- a/meta/recipes-support/apr/apr/autoconf-2.73.patch
+++ b/meta/recipes-support/apr/apr/autoconf-2.73.patch
@@ -1,13 +1,20 @@
-To work with autoconf 2.73, tweak the macro ordering in configure.in.
+From 37753451f5b9f9fa058246a33f03e35d2d093e47 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 27 Jul 2023 20:47:55 -0700
+Subject: [PATCH] To work with autoconf 2.73, tweak the macro ordering in
+ configure.in.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: apr-1.7.2/configure.in
-===================================================================
---- apr-1.7.2.orig/configure.in
-+++ apr-1.7.2/configure.in
-@@ -430,6 +430,8 @@ if test "$host" = "i586-pc-beos"; then
+diff --git a/configure.in b/configure.in
+index 7e43b0f..f954ee7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -442,6 +442,8 @@ if test "$host" = "i586-pc-beos"; then
    ) dnl
  fi
  
@@ -16,7 +23,7 @@ Index: apr-1.7.2/configure.in
  # this is the place to put specific options for platform/compiler
  # combinations
  case "$host:$CC" in
-@@ -2384,7 +2386,6 @@ AC_MSG_RESULT([$msg])
+@@ -2480,7 +2482,6 @@ AC_MSG_RESULT([$msg])
  AC_SUBST(have_union_semun)
  
  dnl Checks for libraries.
diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.6.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.5.bb
rename to meta/recipes-support/apr/apr_1.7.6.bb
index 83d84bfdb6..13fa5daa3c 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
            "
 
-SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
+SRC_URI[sha256sum] = "49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.47.1


--===============5798364973692672996==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apr-upgrade-1.7.5-1.7.6.patch"

RnJvbSAxODViNTViOTJjNGY2MTczNThiNTc3ZWZkNTFjZmEzYTdlZGQ4ZmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzoxOToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cjogdXBncmFkZSAxLjcuNSAtPiAxLjcuNgoKLS0tCiAuLi5pb24tdG8tZGlzYWJsZS10aW1lZC1k
ZXBlbmRhbnQtdGVzdHMucGF0Y2ggfCAxMSArKysrKy0tLS0tCiAuLi4tcnVudGltZS10ZXN0LWZv
ci1tbWFwLXRoYXQtY2FuLW1hcC0ucGF0Y2ggfCAgNyArKystLS0tCiAuLi5DaGVjay1mb3ItTlVM
TC1oYW5kbGUtaW4tYXByX2Rzb19zeW0ucGF0Y2ggfCAgNSArLS0tLQogLi4uaXItcGF0aC1yZWZl
cmVuY2VzLWZyb20taW5zdGFsbGVkLWFwLnBhdGNoIHwgIDkgKysrKy0tLS0KIC4uLjA0LUZpeC1w
YWNrZXQtZGlzY2FyZHMtSFRUUC1yZWRpcmVjdC5wYXRjaCB8ICA3ICsrLS0tLS0KIC4uLi1MVEZM
QUdTLXRvLW1ha2UtaXQtd29yay13aXRoLWNjYWNoZS5wYXRjaCB8IDExICsrKystLS0tLS0KIC4u
Li9hcHIvYXByL2F1dG9jb25mLTIuNzMucGF0Y2ggICAgICAgICAgICAgICB8IDIxICsrKysrKysr
KysrKy0tLS0tLS0KIC4uLi9hcHIve2Fwcl8xLjcuNS5iYiA9PiBhcHJfMS43LjYuYmJ9ICAgICAg
ICB8ICAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci97YXByXzEuNy41LmJiID0+IGFw
cl8xLjcuNi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIv
YXByLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXRpbWVkLWRlcGVuZGFudC10ZXN0cy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2Fi
bGUtdGltZWQtZGVwZW5kYW50LXRlc3RzLnBhdGNoCmluZGV4IGI0NmRjNzZhODYuLjYzZDVmNTYy
YWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1BZGQtb3B0
aW9uLXRvLWRpc2FibGUtdGltZWQtZGVwZW5kYW50LXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtdGltZWQtZGVw
ZW5kYW50LXRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMjVhYmYzN2NkMGI0OTk2
MDY2NGI1OWYwOGU1MTVhNGM0ZWE1YWQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
MjVlZjU0MDUxYjdjMTVmZDc2YjY1MWNmYmZmYWYxZGRiNzU1ZjAxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRl
OiBUaHUsIDI2IE1hciAyMDIwIDE4OjMwOjM2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBv
cHRpb24gdG8gZGlzYWJsZSB0aW1lZCBkZXBlbmRhbnQgdGVzdHMKQEAgLTksNyArOSw2IEBAIGEg
dGltZXIgb3Igb3RoZXIgdGltaW5nIHJlbGF0ZWQgaXNzdWVzLgogCiBVcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL2FwYWNoZS9hcHIvcHVsbC81NF0KIFNpZ25l
ZC1vZmYtYnk6IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPgotCiAtLS0KICBj
b25maWd1cmUuaW4gICAgIHwgNiArKysrKysKICBpbmNsdWRlL2Fwci5oLmluIHwgMSArCkBAIC0x
NywxMCArMTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12
aXN0YS5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuaW4gYi9jb25maWd1cmUuaW4KLWluZGV4IGJm
ZDQ4OGIuLjM2NjMyMjAgMTAwNjQ0CitpbmRleCAwY2UyMGFiLi4zZDQyOTUzIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmluCiArKysgYi9jb25maWd1cmUuaW4KLUBAIC0zMDIzLDYgKzMwMjMsMTIg
QEAgQUNfQVJHX0VOQUJMRSh0aW1lZGxvY2tzLAorQEAgLTMxMTksNiArMzExOSwxMiBAQCBBQ19B
UkdfRU5BQkxFKHRpbWVkbG9ja3MsCiAgKQogIEFDX1NVQlNUKGFwcl9oYXNfdGltZWRsb2NrcykK
ICAKQEAgLTM0LDEwICszMywxMCBAQCBpbmRleCBiZmQ0ODhiLi4zNjYzMjIwIDEwMDY0NAogICMg
c28gZ2V0YWRkcmluZm8vZ2FpX3N0cmVycm9yIGFyZSBub3QgdXNlZC4KICBpZiB0ZXN0ICRoYXZl
X2lwdjYgPSAwOyB0aGVuCiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hcHIuaC5pbiBiL2luY2x1ZGUv
YXByLmguaW4KLWluZGV4IGVlOTlkZWYuLmM0NmE1ZjQgMTAwNjQ0CitpbmRleCA2MzdlZDM4Li5l
N2NiOWI5IDEwMDY0NAogLS0tIGEvaW5jbHVkZS9hcHIuaC5pbgogKysrIGIvaW5jbHVkZS9hcHIu
aC5pbgotQEAgLTI5OCw2ICsyOTgsNyBAQCBleHRlcm4gIkMiIHsKK0BAIC0zMDcsNiArMzA3LDcg
QEAgZXh0ZXJuICJDIiB7CiAgI2RlZmluZSBBUFJfSEFTX1hUSFJFQURfRklMRVMgICAgIEBhcHJf
aGFzX3h0aHJlYWRfZmlsZXNACiAgI2RlZmluZSBBUFJfSEFTX09TX1VVSUQgICAgICAgICAgIEBv
c3V1aWRACiAgI2RlZmluZSBBUFJfSEFTX1RJTUVETE9DS1MgICAgICAgIEBhcHJfaGFzX3RpbWVk
bG9ja3NACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLzAwMDEtY29u
ZmlndXJlLVJlbW92ZS1ydW50aW1lLXRlc3QtZm9yLW1tYXAtdGhhdC1jYW4tbWFwLS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1jb25maWd1cmUtUmVtb3ZlLXJ1bnRp
bWUtdGVzdC1mb3ItbW1hcC10aGF0LWNhbi1tYXAtLnBhdGNoCmluZGV4IDM0ODBkZWFhNGQuLmRi
ZGMyODcxYmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1j
b25maWd1cmUtUmVtb3ZlLXJ1bnRpbWUtdGVzdC1mb3ItbW1hcC10aGF0LWNhbi1tYXAtLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwMS1jb25maWd1cmUtUmVtb3Zl
LXJ1bnRpbWUtdGVzdC1mb3ItbW1hcC10aGF0LWNhbi1tYXAtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAzMTZiODFjNDYyZjA2NTkyN2Q3ZmVjNTZhYWRkNWM4Y2I5NGQxY2YwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YTkwZWM4MDFmYmUwZTZhZDE4YjcwYjY0Nzk4NWNlOTFm
ZmFjZTRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjYgQXVnIDIwMjIgMDA6Mjg6MDggLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gY29uZmlndXJlOiBSZW1vdmUgcnVudGltZSB0ZXN0IGZvciBtbWFwIHRoYXQg
Y2FuIG1hcApAQCAtMTAsMTYgKzEwLDE1IEBAIG11dGV4ZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtDcm9zcy1jb21waWxlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmluIHwgMzAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDMwIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmluIGIvY29uZmlndXJlLmluCi1pbmRleCAz
NjYzMjIwLi5kY2U5Nzg5IDEwMDY0NAoraW5kZXggM2Q0Mjk1My4uN2U0M2IwZiAxMDA2NDQKIC0t
LSBhL2NvbmZpZ3VyZS5pbgogKysrIGIvY29uZmlndXJlLmluCi1AQCAtMTMwMywzNiArMTMwMyw2
IEBAIEFDX0NIRUNLX0ZVTkNTKFttbWFwIG11bm1hcCBzaG1fb3BlbiBzaG1fdW5saW5rIHNobWdl
dCBzaG1hdCBzaG1kdCBzaG1jdGwgXAorQEAgLTEzOTEsMzYgKzEzOTEsNiBAQCBBQ19DSEVDS19G
VU5DUyhbbW1hcCBtdW5tYXAgc2htX29wZW4gc2htX3VubGluayBzaG1nZXQgc2htYXQgc2htZHQg
c2htY3RsIFwKICBBUFJfQ0hFQ0tfREVGSU5FKE1BUF9BTk9OLCBzeXMvbW1hbi5oKQogIEFDX0NI
RUNLX0ZJTEUoL2Rldi96ZXJvKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXByL2Fwci8wMDAxLWRzby1DaGVjay1mb3ItTlVMTC1oYW5kbGUtaW4tYXByX2Rzb19zeW0ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLzAwMDEtZHNvLUNoZWNrLWZvci1OVUxM
LWhhbmRsZS1pbi1hcHJfZHNvX3N5bS5wYXRjaAppbmRleCA4YmExODFiODg3Li5lNWRjNDEwZWY3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLzAwMDEtZHNvLUNoZWNr
LWZvci1OVUxMLWhhbmRsZS1pbi1hcHJfZHNvX3N5bS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHIvYXByLzAwMDEtZHNvLUNoZWNrLWZvci1OVUxMLWhhbmRsZS1pbi1hcHJfZHNv
X3N5bS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTI1YmUxYWFhOTJhNmQyZTdmNGNjM2Zk
ZmJiOTJlNWExMGI2MzAzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDNjNDYwZGI3
YTBlODg1NjU5ZWQ1M2FiNWRlMmFjYTAzM2VmNjk4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEdyZWcgQmVhcmQgPGdtYmVhcmRAZ29vZ2xlbWFpbC5jb20+CiBEYXRlOiBTYXQsIDI1
IE1hciAyMDIzIDA4OjMxOjM2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRzbzogQ2hlY2sgZm9y
IE5VTEwgaGFuZGxlIGluIGFwcl9kc29fc3ltCkBAIC0zMiw2ICszMiwzIEBAIGluZGV4IGZkZDU2
ZjEuLjU4M2Q1ZGUgMTAwNjQ0CiAgI2lmIGRlZmluZWQoRFNPX1VTRV9TSEwpCiAgICAgIHZvaWQg
KnN5bWFkZHIgPSBOVUxMOwogICAgICBpbnQgc3RhdHVzOwotLS0gCi0yLjQyLjAKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci8wMDAyLWFwci1SZW1vdmUtd29ya2Rp
ci1wYXRoLXJlZmVyZW5jZXMtZnJvbS1pbnN0YWxsZWQtYXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHIvYXByLzAwMDItYXByLVJlbW92ZS13b3JrZGlyLXBhdGgtcmVmZXJlbmNlcy1m
cm9tLWluc3RhbGxlZC1hcC5wYXRjaAppbmRleCBkNjM0MjNmM2ExLi4yZWFhMDU5NmIyIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLzAwMDItYXByLVJlbW92ZS13b3Jr
ZGlyLXBhdGgtcmVmZXJlbmNlcy1mcm9tLWluc3RhbGxlZC1hcC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9hcHIvYXByLzAwMDItYXByLVJlbW92ZS13b3JrZGlyLXBhdGgtcmVmZXJl
bmNlcy1mcm9tLWluc3RhbGxlZC1hcC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjg5YThk
Yjk2YTZkMWUxY2FlOWNiZmIzNWQwNWFjODIxNDBhNjU1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMjZjODM0YzA5YTUxMDgxOWRlMGVmZGI1NmZiN2JhMDIwNDM5ZTdjNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KIERhdGU6IFR1ZSwgMzAgSmFuIDIwMTggMDk6Mzk6MDYgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYXByOiBSZW1vdmUgd29ya2RpciBwYXRoIHJlZmVyZW5jZXMgZnJvbSBpbnN0YWxsZWQg
YXByIGZpbGVzCkBAIC0xMywxNiArMTMsMTUgQEAgcGFja2FnZXMgYXQgdGFyZ2V0IHJ1biB0aW1l
LCB0aGUgd29ya2RpciBwYXRoIGNhdXNlZCBjb25mdXNpb24uCiBSZWJhc2UgdG8gMS42LjMKIAog
U2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgotCiAt
LS0KICBhcHItY29uZmlnLmluIHwgMzIgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL2Fwci1jb25maWcuaW4gYi9hcHItY29uZmlnLmluCi1pbmRleCBiZWQ0N2NhLi40
Nzg3NGU1IDEwMDY0NAoraW5kZXggNjI2ZDNiMC4uNDJiZTI2OSAxMDA2NDQKIC0tLSBhL2Fwci1j
b25maWcuaW4KICsrKyBiL2Fwci1jb25maWcuaW4KLUBAIC0xNjQsMTYgKzE2NCw3IEBAIHdoaWxl
IHRlc3QgJCMgLWd0IDA7IGRvCitAQCAtMTc5LDE2ICsxNzksNyBAQCB3aGlsZSB0ZXN0ICQjIC1n
dCAwOyBkbwogICAgICBmbGFncz0iJGZsYWdzICRMREZMQUdTIgogICAgICA7OwogICAgICAtLWlu
Y2x1ZGVzKQpAQCAtMzksNyArMzgsNyBAQCBpbmRleCBiZWQ0N2NhLi40Nzg3NGU1IDEwMDY0NAog
ICAgICA7OwogICAgICAtLXNyY2RpcikKICAgICAgZWNobyAkQVBSX1NPVVJDRV9ESVIKLUBAIC0x
OTcsMzMgKzE4OCwxNCBAQCB3aGlsZSB0ZXN0ICQjIC1ndCAwOyBkbworQEAgLTIxMiwzMyArMjAz
LDE0IEBAIHdoaWxlIHRlc3QgJCMgLWd0IDA7IGRvCiAgICAgIGV4aXQgMAogICAgICA7OwogICAg
ICAtLWxpbmstbGQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLzAw
MDQtRml4LXBhY2tldC1kaXNjYXJkcy1IVFRQLXJlZGlyZWN0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXByL2Fwci8wMDA0LUZpeC1wYWNrZXQtZGlzY2FyZHMtSFRUUC1yZWRpcmVjdC5w
YXRjaAppbmRleCAzMGZjMDdkNGEwLi5lNTI1MTk0Zjk1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHIvYXByLzAwMDQtRml4LXBhY2tldC1kaXNjYXJkcy1IVFRQLXJlZGlyZWN0
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHIvMDAwNC1GaXgtcGFja2V0
LWRpc2NhcmRzLUhUVFAtcmVkaXJlY3QucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDc5MjVl
YjE3NjZhMDBjY2VlMDVjNmU4MGIxZDM0ZjE2M2EwNGI3YjEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDdjMjk5ODYxMDFjZWVmYzdiYjJmNGNkNGY3ZmIwNDZkYjdmODc3MmUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUdWUsIDMwIEphbiAyMDE4IDA5OjQzOjM0ICswODAwCi1TdWJqZWN0OiBb
UEFUQ0ggNC83XSBGaXggcGFja2V0IGRpc2NhcmRzIEhUVFAgcmVkaXJlY3QuCitTdWJqZWN0OiBb
UEFUQ0hdIEZpeCBwYWNrZXQgZGlzY2FyZHMgSFRUUCByZWRpcmVjdC4KIAogRGlzY29ubmVjdCB0
aGUgY29ubmVjdGlvbiBieSBwb2xsKCkgdGltZW91dC4KIElmIHRpbWVvdXQ9MCBhbmQgYXByX3dh
aXRfZm9yX2lvX29yX3RpbWVvdXQoKT1BUFJfVElNRVVQIHRoZW4KQEAgLTM0LDYgKzM0LDMgQEAg
aW5kZXggNGMwZTBhNi4uMWJkYWZiYSAxMDA2NDQKICAgICAgICAgIGlmIChhcnYgIT0gQVBSX1NV
Q0NFU1MpIHsKICAgICAgICAgICAgICAqbGVuID0gMDsKICAgICAgICAgICAgICByZXR1cm4gYXJ2
OwotLS0gCi0xLjguMy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9h
cHIvMDAwNS1jb25maWd1cmUuaW4tZml4LUxURkxBR1MtdG8tbWFrZS1pdC13b3JrLXdpdGgtY2Nh
Y2hlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci8wMDA1LWNvbmZpZ3VyZS5p
bi1maXgtTFRGTEFHUy10by1tYWtlLWl0LXdvcmstd2l0aC1jY2FjaGUucGF0Y2gKaW5kZXggMDI2
MzRlNmZkZS4uNjc4NTEyOThkMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBy
L2Fwci8wMDA1LWNvbmZpZ3VyZS5pbi1maXgtTFRGTEFHUy10by1tYWtlLWl0LXdvcmstd2l0aC1j
Y2FjaGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci8wMDA1LWNvbmZp
Z3VyZS5pbi1maXgtTFRGTEFHUy10by1tYWtlLWl0LXdvcmstd2l0aC1jY2FjaGUucGF0Y2gKQEAg
LTEsNyArMSw3IEBACi1Gcm9tIDJlNjZjZWNlMGMzYWRmZjkyNzMzMzMyMTExMjA0ZGRjMWQ3MzBh
MDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVlZmE1Mjg2YmQ0Yzk4NjMzM2NkMGNj
NGU0MWYzMWM0Yzg1M2M2MmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb2JlcnQg
WWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTkgTm92IDIwMTUg
MTg6MjU6MzggLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCA1LzddIGNvbmZpZ3VyZS5pbjogZml4IExU
RkxBR1MgdG8gbWFrZSBpdCB3b3JrIHdpdGggY2NhY2hlCitTdWJqZWN0OiBbUEFUQ0hdIGNvbmZp
Z3VyZS5pbjogZml4IExURkxBR1MgdG8gbWFrZSBpdCB3b3JrIHdpdGggY2NhY2hlCiAKIFdoZW4g
Y2NhY2hlIGlzIGVuYWJsZWQsIGxpYnRvb2wgcmVxdWlyZXMgLS10YWc9Q0Mgd2hlbiB1c2UgY2Nh
Y2hlLAogb3RoZXJ3aXNlIHdoZW4gYnVpbGRpbmcgYXByLXV0aWwgd2l0aCBjY2FjaGUgZW5hYmxl
ZDoKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhp
LnlhbmdAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5pbiBiL2NvbmZpZ3VyZS5pbgot
aW5kZXggMzYxMTIwZi4uM2IxMDQyMiAxMDA2NDQKK2luZGV4IGIwNDU3ZTIuLjBjZTIwYWIgMTAw
NjQ0CiAtLS0gYS9jb25maWd1cmUuaW4KICsrKyBiL2NvbmZpZ3VyZS5pbgotQEAgLTI0OSw3ICsy
NDksNyBAQCBjYXNlICRob3N0IGluCitAQCAtMjY2LDcgKzI2Niw3IEBAIGNhc2UgJGhvc3QgaW4K
ICAgICAgOzsKICAqKQogICAgICBpZiB0ZXN0ICJ4JExURkxBR1MiID0gIngiOyB0aGVuCkBAIC0z
MSw2ICszMSwzIEBAIGluZGV4IDM2MTEyMGYuLjNiMTA0MjIgMTAwNjQ0CiAgICAgIGZpCiAgICAg
IGlmIHRlc3QgIiRleHBlcmltZW50YWxfbGlidG9vbCIgPSAieWVzIjsgdGhlbgogICAgICAgICAg
IyBVc2UgYSBjdXN0b20tbWFkZSBsaWJ0b29sIHJlcGxhY2VtZW50Ci0tLSAKLTEuOC4zLjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci9hdXRvY29uZi0yLjczLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci9hdXRvY29uZi0yLjczLnBhdGNoCmlu
ZGV4IGE4YjdhNzc1NjYuLjFlMjRjMGE1NzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2Fwci9hcHIvYXV0b2NvbmYtMi43My5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHIvYXByL2F1dG9jb25mLTIuNzMucGF0Y2gKQEAgLTEsMTMgKzEsMjAgQEAKLVRvIHdvcmsg
d2l0aCBhdXRvY29uZiAyLjczLCB0d2VhayB0aGUgbWFjcm8gb3JkZXJpbmcgaW4gY29uZmlndXJl
LmluLgorRnJvbSAzNzc1MzQ1MWY1YjlmOWZhMDU4MjQ2YTMzZjAzZTM1ZDJkMDkzZTQ3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBUaHUsIDI3IEp1bCAyMDIzIDIwOjQ3OjU1IC0w
NzAwCitTdWJqZWN0OiBbUEFUQ0hdIFRvIHdvcmsgd2l0aCBhdXRvY29uZiAyLjczLCB0d2VhayB0
aGUgbWFjcm8gb3JkZXJpbmcgaW4KKyBjb25maWd1cmUuaW4uCiAKIFVwc3RyZWFtLVN0YXR1czog
UGVuZGluZwogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+CistLS0KKyBjb25maWd1cmUuaW4gfCAzICsrLQorIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAotSW5kZXg6IGFwci0xLjcu
Mi9jb25maWd1cmUuaW4KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBhcHItMS43LjIub3JpZy9jb25maWd1cmUu
aW4KLSsrKyBhcHItMS43LjIvY29uZmlndXJlLmluCi1AQCAtNDMwLDYgKzQzMCw4IEBAIGlmIHRl
c3QgIiRob3N0IiA9ICJpNTg2LXBjLWJlb3MiOyB0aGVuCitkaWZmIC0tZ2l0IGEvY29uZmlndXJl
LmluIGIvY29uZmlndXJlLmluCitpbmRleCA3ZTQzYjBmLi5mOTU0ZWU3IDEwMDY0NAorLS0tIGEv
Y29uZmlndXJlLmluCisrKysgYi9jb25maWd1cmUuaW4KK0BAIC00NDIsNiArNDQyLDggQEAgaWYg
dGVzdCAiJGhvc3QiID0gImk1ODYtcGMtYmVvcyI7IHRoZW4KICAgICkgZG5sCiAgZmkKICAKQEAg
LTE2LDcgKzIzLDcgQEAgSW5kZXg6IGFwci0xLjcuMi9jb25maWd1cmUuaW4KICAjIHRoaXMgaXMg
dGhlIHBsYWNlIHRvIHB1dCBzcGVjaWZpYyBvcHRpb25zIGZvciBwbGF0Zm9ybS9jb21waWxlcgog
ICMgY29tYmluYXRpb25zCiAgY2FzZSAiJGhvc3Q6JENDIiBpbgotQEAgLTIzODQsNyArMjM4Niw2
IEBAIEFDX01TR19SRVNVTFQoWyRtc2ddKQorQEAgLTI0ODAsNyArMjQ4Miw2IEBAIEFDX01TR19S
RVNVTFQoWyRtc2ddKQogIEFDX1NVQlNUKGhhdmVfdW5pb25fc2VtdW4pCiAgCiAgZG5sIENoZWNr
cyBmb3IgbGlicmFyaWVzLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fw
cl8xLjcuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjYuYmIKc2ltaWxh
cml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8x
LjcuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjcuNi5iYgpp
bmRleCA4M2Q4NGJmZGI2Li4xM2ZhNWRhYTNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hcHIvYXByXzEuNy41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJf
MS43LjYuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIke0FQQUNIRV9NSVJST1J9L2Fw
ci8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRzby1DaGVj
ay1mb3ItTlVMTC1oYW5kbGUtaW4tYXByX2Rzb19zeW0ucGF0Y2ggXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDBmNWQ1MmI5YWIxNzA0YzcyMTYwYzVlZTNlZDVkM2Q0
Y2EyZGY0YTdmOGFiNTY0ZTNjYjM1MmI2NzIzMmYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5
MDMwZDkyZDI1NzVkYTczNTc5MWI0OTZkYzMyMmYzY2U1Y2ZmOTQ5NDc3OWJhOGNjMjhjN2Y0NmM1
ZGViMzIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBsaWJfcGFja2FnZSBiaW5jb25m
aWcgbXVsdGlsaWJfaGVhZGVyIHB0ZXN0IG11bHRpbGliX3NjcmlwdAogCi0tIAoyLjQ3LjEKCg==

--===============5798364973692672996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/apr/apr-bin: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-bin: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-dbg: PKGSIZE changed from 1502168 to 1502256 (+0%)
packages/core2-64-poky-linux/apr/apr-dbg: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-dbg: FILELIST: removed "/usr/lib/.debug/libapr-1.so.0.7.5", added "/usr/lib/.debug/libapr-1.so.0.7.6"
packages/core2-64-poky-linux/apr/apr-dbg: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-dev: PKGSIZE changed from 573692 to 573715 (+0%)
packages/core2-64-poky-linux/apr/apr-dev: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-dev: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-doc: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-doc: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-locale: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-locale: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-ptest: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-ptest: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-src: PKGSIZE changed from 2028273 to 2028278 (+0%)
packages/core2-64-poky-linux/apr/apr-src: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-src: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr-staticdev: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr-staticdev: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr/apr: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.5", added "/usr/lib/libapr-1.so.0.7.6"
packages/core2-64-poky-linux/apr/apr: PV changed from "1.7.5" to "1.7.6"
packages/core2-64-poky-linux/apr: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-1.7.5.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch file://autoconf-2.73.patch file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch" to "https://archive.apache.org/dist/apr/apr-1.7.6.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch file://autoconf-2.73.patch file://0001-dso-Check-for-NU
 LL-handle-in-apr_dso_sym.patch"
packages/core2-64-poky-linux/apr: PKGV changed from 1.7.5 [default] to 1.7.6 [default]
packages/core2-64-poky-linux/apr: PV changed from "1.7.5" to "1.7.6"
Changes to packages/core2-64-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.5 to libapr-1.so.0.7.6
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.5 to libapr-1.so.0.7.6
  /usr/lib/libapr-1.so.0.7.5 moved to /usr/lib/libapr-1.so.0.7.6

--===============5798364973692672996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.5", added "/usr/lib/libapr-1.so.0.7.6"
Changes to packages/core2-64-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.5 to libapr-1.so.0.7.6
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.5 to libapr-1.so.0.7.6
  /usr/lib/libapr-1.so.0.7.5 moved to /usr/lib/libapr-1.so.0.7.6

--===============5798364973692672996==--

