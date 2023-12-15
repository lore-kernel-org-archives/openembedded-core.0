Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9AEC48BEC
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63136.1702649863339255368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xqko9f/t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TmuxEkmb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd7191c-6404ccef-5926-4d19-bbd5-08cb48975deb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vl2jnciW0Z94V6YegcbmXogitVxU9MhYAeJDC575Qqo=;
	b=Xqko9f/tZb4Vapcx+o7tW3wrVjVSScUJ8BXlxHVAb2PVDT0zLQYtbfyygXnhUP5S
	/h/l1Hw1oyBusHthVJEqrQg0gFD/m27AMHKU7K0+B+WKGjllpdfBk3/rZ2CPeiC47Lp
	BORll1yHKWsRqf7ushzllYR9CdZ3EfeAKd1Gc+dE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vl2jnciW0Z94V6YegcbmXogitVxU9MhYAeJDC575Qqo=;
	b=TmuxEkmbej4zF7dIbJLwXfLnljfbA2CYoYKmZ+7gSYS+ypLs2QIek6RXvDtI2s4n
	vFthA6wM6HJUdLSWPV2RzjjYGxbz0sYRlBHB7e+FJxQQrvBrYlzhaI3AnKyloGfPLNr
	Idv+1LjcArbErJZx5Q1Smu4t4GHRnSCLS2Wlx1HQ=
Content-Type: multipart/mixed; boundary="===============8953066334356320920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.3 FAILED
Message-ID: <0101018c6dd7191c-6404ccef-5926-4d19-bbd5-08cb48975deb-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192450

--===============8953066334356320920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.39.2-2.39.3.patch
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
From f2d399c227d3b098bdf1e8f12a60baa62df2ab55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 06:15:39 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.39.2 -> 2.39.3

---
 ...2.39.2.bb => util-linux-libuuid_2.39.3.bb} | 29 ++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc   |  5 +--
 ...ls-include-libgen.h-for-basename-API.patch |  9 +++--
 ...Use-4K-buffer-size-instead-of-BUFSIZ.patch | 38 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  4 +-
 .../util-linux/configure-sbindir.patch        | 19 +++++++---
 .../display_testname_for_subtest.patch        | 12 +++---
 .../util-linux/util-linux/ptest.patch         |  4 +-
 8 files changed, 61 insertions(+), 59 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.2.bb => util-linux-libuuid_2.39.3.bb} (30%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
similarity index 30%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
index 5d759aed94..687e4327c8 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
@@ -1,3 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.licensing
+# +++ README.licensing
+# @@ -2,11 +2,13 @@
+#  The project util-linux doesn't use the same license for all of the code.
+#  There is code under:
+#  
+# -   * GPL-3.0-or-later   - GNU General Public License version 3, or any later version
+# +   * GPL-1.0-or-later   - GNU General Public License version 1, or any later version
+# +
+# +   * GPL-2.0            - GNU General Public License version 2
+#  
+#     * GPL-2.0-or-later   - GNU General Public License version 2, or any later version
+#  
+# -   * GPL-2.0            - GNU General Public License version 2
+# +   * GPL-3.0-or-later   - GNU General Public License version 3, or any later version
+#  
+#     * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
+#  
+# 
+#
+
 # To allow util-linux to optionally build-depend on cryptsetup, libuuid is
 # split out of the main recipe, as it's needed by cryptsetup
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e3bef5acfc..044d9861de 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -12,7 +12,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=6b0e0a2320e66e62eef9b8149a6faec4 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -35,8 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch \
            file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            "
 
-SRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"
+SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
index 2b9897ade1..6282991a98 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 6581cf8ac95b99b5a35fea88c52646558d05b5e7 Mon Sep 17 00:00:00 2001
+From ebfc064070c11adb96f0d933ceb19e524cf9ec7e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Dec 2023 19:59:46 -0800
 Subject: [PATCH] login-utils: include libgen.h for basename API
@@ -17,10 +17,13 @@ Fixes
 
 Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- login-utils/su-common.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ login-utils/su-common.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
 
+diff --git a/login-utils/su-common.c b/login-utils/su-common.c
+index b674920..3297c78 100644
 --- a/login-utils/su-common.c
 +++ b/login-utils/su-common.c
 @@ -26,6 +26,7 @@
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
deleted file mode 100644
index 4d7487c4f7..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 95b0405338440cf5cd6d4b2b5c66cda8bf381b28 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2023 00:18:18 -0700
-Subject: [PATCH] lscpu: Use 4K buffer size instead of BUFSIZ
-
-Some lines in /proc/cpuinfo can be large e.g. flags and can then
-truncate them in displaying them
-
-BUFSIZ can vary quite a bit  e.g. glibc/linux systems its 8192
-but on musl/linux and OSX its 1024, on mingW it is 256, some tests e.g.
-x86_64-64cpu-linux6.2.tar.gz has added really long line for cpu flags
-line which is greater than 1024 characters and hence this test fails
-on musl because lscpu -s reports truncated string
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2492]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sys-utils/lscpu-cputype.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/sys-utils/lscpu-cputype.c b/sys-utils/lscpu-cputype.c
-index 3fd5f7a3c..c8f72ab8a 100644
---- a/sys-utils/lscpu-cputype.c
-+++ b/sys-utils/lscpu-cputype.c
-@@ -462,7 +462,9 @@ static int cpuinfo_parse_cache(struct lscpu_cxt *cxt, int keynum, char *data)
- int lscpu_read_cpuinfo(struct lscpu_cxt *cxt)
- {
- 	FILE *fp;
--	char buf[BUFSIZ];
-+	/* Used to be BUFSIZ which is small on some platforms e.g, musl,
-+	 * therefore hardcode to 4K */
-+	char buf[4096];
- 	size_t i;
- 	struct lscpu_cputype *ct;
- 	struct cpuinfo_parser _pr = { .cxt = cxt }, *pr = &_pr;
--- 
-2.42.0
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index f1cbdb3beb..a85d8a7bec 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From 699d8640c235aea07977e6b7d66a17528a43332c Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5664f9f..075ef27 100644
+index 890212f..870e817 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index e475289f65..e0eb4d873b 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,3 +1,8 @@
+From dca82b9f5cfd651aeefeeda9b531ff06116692ca Mon Sep 17 00:00:00 2001
+From: Phil Blundell <pb@pbcl.net>
+Date: Mon, 24 Sep 2012 07:24:51 +0100
+Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
+
 util-linux: take ${sbindir} from the environment if it is set there
 fix the test, the [ ] syntax was getting eaten by autoconf
 
@@ -5,11 +10,15 @@ Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
 
-Index: util-linux-2.31/configure.ac
-===================================================================
---- util-linux-2.31.orig/configure.ac
-+++ util-linux-2.31/configure.ac
-@@ -89,7 +89,10 @@ AC_SUBST([runstatedir])
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 36c24b4..890212f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 417ca1d98f..1c30fbee2b 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,7 @@
-Display testname for subtest
+From 89eccd862694903c926c594844974bcb5f2dcf6e Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Thu, 3 Dec 2015 04:08:00 +0100
+Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
@@ -8,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5246605..b24dc15 100644
+index 5a562a3..098145e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -320,7 +320,7 @@ function ts_init_subtest {
+@@ -437,7 +437,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
@@ -20,6 +23,3 @@ index 5246605..b24dc15 100644
  	fi
  }
  
--- 
-2.8.3
-
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ba2bd3f6ac..6b359025b3 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From 6ec5b79d7c4b001632685c879cbffb96a04f0076 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 886598d..1cf4346 100644
+index effbb02..7d2bd1e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -57,6 +57,7 @@ systemdsystemunit_DATA =
-- 
2.42.0


--===============8953066334356320920==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.39.2-2.39.3.patch"

RnJvbSBmMmQzOTljMjI3ZDNiMDk4YmRmMWU4ZjEyYTYwYmFhNjJkZjJhYjU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDY6MTU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgMi4zOS4yIC0+IDIuMzkuMwoKLS0tCiAuLi4yLjM5
LjIuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMy5iYn0gfCAyOSArKysrKysrKysrKysr
KwogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDUgKy0t
CiAuLi5scy1pbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1BUEkucGF0Y2ggfCAgOSArKyst
LQogLi4uVXNlLTRLLWJ1ZmZlci1zaXplLWluc3RlYWQtb2YtQlVGU0laLnBhdGNoIHwgMzggLS0t
LS0tLS0tLS0tLS0tLS0tLQogLi4uL3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0
Y2ggICAgIHwgIDQgKy0KIC4uLi91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAg
ICAgICB8IDE5ICsrKysrKystLS0KIC4uLi9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBh
dGNoICAgICAgICB8IDEyICsrKy0tLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5w
YXRjaCAgICAgICAgIHwgIDQgKy0KIDggZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwg
NTkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRp
bC1saW51eC1saWJ1dWlkXzIuMzkuMi5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4zLmJi
fSAoMzAlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJ
Wi5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC1saWJ1dWlkXzIuMzkuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC1saWJ1dWlkXzIuMzkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDMwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1
dWlkXzIuMzkuMy5iYgppbmRleCA1ZDc1OWFlZDk0Li42ODdlNDMyN2M4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LjIuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4z
OS4zLmJiCkBAIC0xLDMgKzEsMzIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZh
bHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxv
d2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5z
ZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5k
IHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNl
bnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0
IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBSRUFETUUubGlj
ZW5zaW5nCisjICsrKyBSRUFETUUubGljZW5zaW5nCisjIEBAIC0yLDExICsyLDEzIEBACisjICBU
aGUgcHJvamVjdCB1dGlsLWxpbnV4IGRvZXNuJ3QgdXNlIHRoZSBzYW1lIGxpY2Vuc2UgZm9yIGFs
bCBvZiB0aGUgY29kZS4KKyMgIFRoZXJlIGlzIGNvZGUgdW5kZXI6CisjICAKKyMgLSAgICogR1BM
LTMuMC1vci1sYXRlciAgIC0gR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAzLCBv
ciBhbnkgbGF0ZXIgdmVyc2lvbgorIyArICAgKiBHUEwtMS4wLW9yLWxhdGVyICAgLSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDEsIG9yIGFueSBsYXRlciB2ZXJzaW9uCisjICsK
KyMgKyAgICogR1BMLTIuMCAgICAgICAgICAgIC0gR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
dmVyc2lvbiAyCisjICAKKyMgICAgICogR1BMLTIuMC1vci1sYXRlciAgIC0gR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgdmVyc2lvbiAyLCBvciBhbnkgbGF0ZXIgdmVyc2lvbgorIyAgCisjIC0g
ICAqIEdQTC0yLjAgICAgICAgICAgICAtIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNp
b24gMgorIyArICAgKiBHUEwtMy4wLW9yLWxhdGVyICAgLSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSB2ZXJzaW9uIDMsIG9yIGFueSBsYXRlciB2ZXJzaW9uCisjICAKKyMgICAgICogTEdQTC0y
LjEtb3ItbGF0ZXIgIC0gR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIDIuMSBvciBh
bnkgbGF0ZXIgdmVyc2lvbgorIyAgCisjIAorIworCiAjIFRvIGFsbG93IHV0aWwtbGludXggdG8g
b3B0aW9uYWxseSBidWlsZC1kZXBlbmQgb24gY3J5cHRzZXR1cCwgbGlidXVpZCBpcwogIyBzcGxp
dCBvdXQgb2YgdGhlIG1haW4gcmVjaXBlLCBhcyBpdCdzIG5lZWRlZCBieSBjcnlwdHNldHVwCiAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMg
Yi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCmluZGV4IGUzYmVm
NWFjZmMuLjA0NGQ5ODYxZGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LmluYwpAQCAtMTIsNyArMTIsNyBAQCBMSUNFTlNFOiR7UE59LWxpYmZkaXNrID0gIkxH
UEwtMi4xLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1saWJtb3VudCA9ICJMR1BMLTIuMS1vci1s
YXRlciIKIExJQ0VOU0U6JHtQTn0tbGlic21hcnRjb2xzID0gIkxHUEwtMi4xLW9yLWxhdGVyIgog
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0xMmFlNzc2
OGE2NWVjOGYyZTQ0ZDkzMGRmOWNiNDNmYSBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9S
RUFETUUubGljZW5zaW5nO21kNT02YjBlMGEyMzIwZTY2ZTYyZWVmOWI4MTQ5YTZmYWVjNCBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2
YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Eb2N1bWVudGF0aW9u
L2xpY2Vuc2VzL0NPUFlJTkcuR1BMLTIuMC1vci1sYXRlcjttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4
NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9jdW1lbnRhdGlv
bi9saWNlbnNlcy9DT1BZSU5HLkxHUEwtMi4xLW9yLWxhdGVyO21kNT00ZmJkNjUzODBjZGQyNTU5
NTEwNzkwMDhiMzY0NTE2YyBcCkBAIC0zNSw4ICszNSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxP
UkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwt
bGluCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vZGlz
cGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWxzY3B1LVVz
ZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJWi5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWxvZ2luLXV0aWxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLUFQSS5w
YXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3YWJkZmFhOGU0
OTBmOGJlNmRkZTk3NmY3YzgwYjliNWZmOWYzMDFlMWI2N2UzODk5ZTFmMDVhNTlhMTUzMWYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiN2I2NjA1ZTQ4ZDFhNDlmNDNjYzRiNGNmYzU5ZjMxM2QwZGQ1
NDAyZmE0MGI5NjgxMGJkNTcyZTE2N2RmZWQwZiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxvZ2luLXV0aWxzLWluY2x1ZGUtbGliZ2Vu
LmgtZm9yLWJhc2VuYW1lLUFQSS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWxvZ2luLXV0aWxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1l
LUFQSS5wYXRjaAppbmRleCAyYjk4OTdhZGUxLi42MjgyOTkxYTk4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sb2dpbi11dGlscy1pbmNs
dWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1BUEkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbG9naW4tdXRpbHMtaW5jbHVkZS1saWJnZW4u
aC1mb3ItYmFzZW5hbWUtQVBJLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NTgxY2Y4YWM5
NWI5OWI1YTM1ZmVhODhjNTI2NDY1NThkMDViNWU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlYmZjMDY0MDcwYzExYWRiOTZmMGQ5MzNjZWIxOWU1MjRjZjllYzdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IFN1biwgMyBEZWMgMjAyMyAxOTo1OTo0NiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBsb2dpbi11
dGlsczogaW5jbHVkZSBsaWJnZW4uaCBmb3IgYmFzZW5hbWUgQVBJCkBAIC0xNywxMCArMTcsMTMg
QEAgRml4ZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNv
bS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHVsbC8yNjE1XQogU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCi0gbG9naW4tdXRpbHMvc3UtY29tbW9uLmMg
fCA4ICsrKysrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKKyBsb2dpbi11dGlscy9zdS1jb21tb24uYyB8IDEwICsrKysrKystLS0KKyAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCitkaWZmIC0tZ2l0IGEv
bG9naW4tdXRpbHMvc3UtY29tbW9uLmMgYi9sb2dpbi11dGlscy9zdS1jb21tb24uYworaW5kZXgg
YjY3NDkyMC4uMzI5N2M3OCAxMDA2NDQKIC0tLSBhL2xvZ2luLXV0aWxzL3N1LWNvbW1vbi5jCiAr
KysgYi9sb2dpbi11dGlscy9zdS1jb21tb24uYwogQEAgLTI2LDYgKzI2LDcgQEAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzY3B1LVVz
ZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJWi5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6ZS1p
bnN0ZWFkLW9mLUJVRlNJWi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNGQ3
NDg3YzRmNy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS1sc2NwdS1Vc2UtNEstYnVmZmVyLXNpemUtaW5zdGVhZC1vZi1CVUZTSVou
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDk1YjA0MDUzMzg0NDBj
ZjVjZDZkNGIyYjVjNjZjZGE4YmYzODFiMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogRnJpLCAxNSBTZXAgMjAyMyAw
MDoxODoxOCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBsc2NwdTogVXNlIDRLIGJ1ZmZlciBzaXpl
IGluc3RlYWQgb2YgQlVGU0laCi0KLVNvbWUgbGluZXMgaW4gL3Byb2MvY3B1aW5mbyBjYW4gYmUg
bGFyZ2UgZS5nLiBmbGFncyBhbmQgY2FuIHRoZW4KLXRydW5jYXRlIHRoZW0gaW4gZGlzcGxheWlu
ZyB0aGVtCi0KLUJVRlNJWiBjYW4gdmFyeSBxdWl0ZSBhIGJpdCAgZS5nLiBnbGliYy9saW51eCBz
eXN0ZW1zIGl0cyA4MTkyCi1idXQgb24gbXVzbC9saW51eCBhbmQgT1NYIGl0cyAxMDI0LCBvbiBt
aW5nVyBpdCBpcyAyNTYsIHNvbWUgdGVzdHMgZS5nLgoteDg2XzY0LTY0Y3B1LWxpbnV4Ni4yLnRh
ci5neiBoYXMgYWRkZWQgcmVhbGx5IGxvbmcgbGluZSBmb3IgY3B1IGZsYWdzCi1saW5lIHdoaWNo
IGlzIGdyZWF0ZXIgdGhhbiAxMDI0IGNoYXJhY3RlcnMgYW5kIGhlbmNlIHRoaXMgdGVzdCBmYWls
cwotb24gbXVzbCBiZWNhdXNlIGxzY3B1IC1zIHJlcG9ydHMgdHJ1bmNhdGVkIHN0cmluZwotCi1V
cHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgv
dXRpbC1saW51eC9wdWxsLzI0OTJdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgotLS0tCi0gc3lzLXV0aWxzL2xzY3B1LWNwdXR5cGUuYyB8IDQgKysrLQotIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdp
dCBhL3N5cy11dGlscy9sc2NwdS1jcHV0eXBlLmMgYi9zeXMtdXRpbHMvbHNjcHUtY3B1dHlwZS5j
Ci1pbmRleCAzZmQ1ZjdhM2MuLmM4ZjcyYWI4YSAxMDA2NDQKLS0tLSBhL3N5cy11dGlscy9sc2Nw
dS1jcHV0eXBlLmMKLSsrKyBiL3N5cy11dGlscy9sc2NwdS1jcHV0eXBlLmMKLUBAIC00NjIsNyAr
NDYyLDkgQEAgc3RhdGljIGludCBjcHVpbmZvX3BhcnNlX2NhY2hlKHN0cnVjdCBsc2NwdV9jeHQg
KmN4dCwgaW50IGtleW51bSwgY2hhciAqZGF0YSkKLSBpbnQgbHNjcHVfcmVhZF9jcHVpbmZvKHN0
cnVjdCBsc2NwdV9jeHQgKmN4dCkKLSB7Ci0gCUZJTEUgKmZwOwotLQljaGFyIGJ1ZltCVUZTSVpd
OwotKwkvKiBVc2VkIHRvIGJlIEJVRlNJWiB3aGljaCBpcyBzbWFsbCBvbiBzb21lIHBsYXRmb3Jt
cyBlLmcsIG11c2wsCi0rCSAqIHRoZXJlZm9yZSBoYXJkY29kZSB0byA0SyAqLwotKwljaGFyIGJ1
Zls0MDk2XTsKLSAJc2l6ZV90IGk7Ci0gCXN0cnVjdCBsc2NwdV9jcHV0eXBlICpjdDsKLSAJc3Ry
dWN0IGNwdWluZm9fcGFyc2VyIF9wciA9IHsgLmN4dCA9IGN4dCB9LCAqcHIgPSAmX3ByOwotLS0g
Ci0yLjQyLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGYxY2Jk
YjNiZWIuLmE4NWQ4YTdiZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGVlM2M3ODEyZTFlZmE2NzE5YWY2OGI5OTQ4MDRmMGU2Y2Fj
ZWFiZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY5OWQ4NjQwYzIzNWFlYTA3OTc3
ZTZiN2Q2NmExNzUyOGE0MzMzMmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRv
ciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEg
MTQ6MDA6MzEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDogQWRkIHB0ZXN0CkBA
IC0xNSw3ICsxNSw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29u
ZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA1NjY0ZjlmLi4wNzVlZjI3IDEwMDY0NAor
aW5kZXggODkwMjEyZi4uODcwZTgxNyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIv
Y29uZmlndXJlLmFjCiBAQCAtMTEsNyArMTEsNyBAQCBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0p
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29u
ZmlndXJlLXNiaW5kaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKaW5kZXggZTQ3NTI4OWY2NS4uZTBlYjRkODcz
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Nv
bmZpZ3VyZS1zYmluZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaApAQCAtMSwzICsxLDggQEAKK0Zyb20g
ZGNhODJiOWY1Y2ZkNjUxYWVlZmVlZGE5YjUzMWZmMDYxMTY2OTJjYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgorRGF0ZTogTW9uLCAy
NCBTZXAgMjAxMiAwNzoyNDo1MSArMDEwMAorU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBF
bnN1cmUgdGhhdCAke3NiaW5kaXJ9IGlzIHJlc3BlY3RlZAorCiB1dGlsLWxpbnV4OiB0YWtlICR7
c2JpbmRpcn0gZnJvbSB0aGUgZW52aXJvbm1lbnQgaWYgaXQgaXMgc2V0IHRoZXJlCiBmaXggdGhl
IHRlc3QsIHRoZSBbIF0gc3ludGF4IHdhcyBnZXR0aW5nIGVhdGVuIGJ5IGF1dG9jb25mCiAKQEAg
LTUsMTEgKzEwLDE1IEBAIFNpZ25lZC1vZmYtYnk6IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0
PgogU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAKLUluZGV4OiB1dGlsLWxp
bnV4LTIuMzEvY29uZmlndXJlLmFjCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gdXRpbC1saW51eC0yLjMxLm9y
aWcvY29uZmlndXJlLmFjCi0rKysgdXRpbC1saW51eC0yLjMxL2NvbmZpZ3VyZS5hYwotQEAgLTg5
LDcgKzg5LDEwIEBAIEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCistLS0KKyBjb25maWd1cmUuYWMg
fCA1ICsrKystCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQorCitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitpbmRleCAzNmMy
NGI0Li44OTAyMTJmIDEwMDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9jb25maWd1cmUu
YWMKK0BAIC0xMDIsNyArMTAyLDEwIEBAIEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCiAgdXNyYmlu
X2V4ZWNkaXI9JyR7ZXhlY19wcmVmaXh9L2JpbicKICBBQ19TVUJTVChbdXNyYmluX2V4ZWNkaXJd
KQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaApp
bmRleCA0MTdjYTFkOThmLi4xYzMwZmJlZTJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90
ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLURpc3BsYXkgdGVzdG5h
bWUgZm9yIHN1YnRlc3QKK0Zyb20gODllY2NkODYyNjk0OTAzYzkyNmM1OTQ4NDQ5NzRiY2I1ZjJk
Y2Y2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3Iu
ZmxvcmVhQGVuZWEuY29tPgorRGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCitT
dWJqZWN0OiBbUEFUQ0hdIERpc3BsYXkgdGVzdG5hbWUgZm9yIHN1YnRlc3QKIAogU2lnbmVkLW9m
Zi1ieTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBVcHN0cmVhbS1TdGF0
dXM6IFBlbmRpbmcKQEAgLTgsMTAgKzExLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvdGVzdHMvZnVuY3Rpb25zLnNoIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1pbmRleCA1MjQ2
NjA1Li5iMjRkYzE1IDEwMDY0NAoraW5kZXggNWE1NjJhMy4uMDk4MTQ1ZSAxMDA2NDQKIC0tLSBh
L3Rlc3RzL2Z1bmN0aW9ucy5zaAogKysrIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1AQCAtMzIwLDcg
KzMyMCw3IEBAIGZ1bmN0aW9uIHRzX2luaXRfc3VidGVzdCB7CitAQCAtNDM3LDcgKzQzNyw3IEBA
IGZ1bmN0aW9uIHRzX2luaXRfc3VidGVzdCB7CiAgCiAgCWlmIFsgIiRUU19QQVJTQUJMRSIgIT0g
InllcyIgXTsgdGhlbgogIAkJWyAkVFNfTlNVQlRFU1RTIC1lcSAxIF0gJiYgZWNobwpAQCAtMjAs
NiArMjMsMyBAQCBpbmRleCA1MjQ2NjA1Li5iMjRkYzE1IDEwMDY0NAogIAlmaQogIH0KICAKLS0t
IAotMi44LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4L3B0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L3B0ZXN0LnBhdGNoCmluZGV4IGJhMmJkM2Y2YWMuLjZiMzU5MDI1YjMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGFmMDczYzEzZWYxODRjYTc1ODExZGY2ODhlMGEwYTI1ODI3YjM2
YzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlYzViNzlkN2M0YjAwMTYzMjY4NWM4
NzljYmZmYjk2YTA0ZjAwNzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDow
ODowMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBEZWZpbmUgVEVTVFMgdmFyaWFibGUKQEAgLTEx
LDcgKzExLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1p
bmRleCA4ODY1OThkLi4xY2Y0MzQ2IDEwMDY0NAoraW5kZXggZWZmYmIwMi4uN2QyYmQxZSAxMDA2
NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTU3LDYgKzU3LDcg
QEAgc3lzdGVtZHN5c3RlbXVuaXRfREFUQSA9Ci0tIAoyLjQyLjAKCg==

--===============8953066334356320920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7989e4a95bebdbfd2f94cf8ca2c6fd503416cc6e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7989e4a95bebdbfd2f94cf8ca2c6fd503416cc6e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 150 Local 109 Mirrors 0 Missed 41 Current 143 (72% match, 86% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 163 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 166 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 171 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 172 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 173 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running noexec task 261 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running noexec task 265 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 268 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 231 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 286 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 234 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 243 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 244 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 246 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 248 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 262 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 263 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 269 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 270 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 377 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 279 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: Running task 429 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 482 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running setscene task 281 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 282 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 521 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa)
NOTE: Running task 522 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 531 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_fetch)
NOTE: Running task 532 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: Running task 533 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 535 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_recipe_qa: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 536 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 537 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa: Started
NOTE: Running task 538 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: Running task 547 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 564 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 570 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 572 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 573 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_unpack)
NOTE: Running task 586 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 597 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 598 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: Running task 599 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa unihash changed to 33e85be94b48801385513c25d646dfc4e7d38d8441a660367f6ffe85f890dac8
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: Running task 601 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: Running task 602 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 603 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: Running task 604 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 605 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 606 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 607 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 608 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: Running task 624 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 625 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: Running task 626 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 666 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 667 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 668 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: Running task 674 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 702 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 703 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_patch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz - will attempt other sources if available
NOTE: Running setscene task 287 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 707 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 711 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 712 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Started
NOTE: Running task 713 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 715 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 718 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_configure)
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 719 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_configure: Started
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Started
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 721 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 722 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 288 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 724 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 725 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 741 tasks of which 684 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215061502.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215061502.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.39.2-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz
ERROR: util-linux-native-2.39.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz\' has sha256 checksum \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' when \'7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.39.2/temp/log.do_fetch.3302707
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch) failed with exit code '1'

--===============8953066334356320920==--

