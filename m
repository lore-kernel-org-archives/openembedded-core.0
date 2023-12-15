Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED15AC48BC1
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63609.1702649863334516342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X25ZiXXW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m3a2Jwks;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd71948-aa553328-27d2-4721-8e6a-fe3f09fdbc6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NUWlxUvN6UMvjUfPu1j6eTnHWNVOJqxDzJ4Di6Vt/DI=;
	b=X25ZiXXW1mJvPxVCAJVvrwJns4Hk6AF5rdI+p0xx9ZJMeK6HenILnWeYP3a4pFUy
	vNal716gLkGNz7+FBYUWh6J2wULcMzmy7Z90hXqKNTgpy1+QSs3xcAqkxowzegii4K8
	/Oy9vOhCZi/Ja9hsTC2AfhLDE/DMBhz9jpmE0cMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NUWlxUvN6UMvjUfPu1j6eTnHWNVOJqxDzJ4Di6Vt/DI=;
	b=m3a2Jwks2uxYjU7Gi7v7EFOXpe9mndOummohF5FxL8nRkQukfcfUjd7jAzFhGODv
	BqKfho7MbC1DHh+/lX0IETXBgVECKKe2OggnJeKAHJrgjoektLR1Pf142TfE1Y1NDQA
	oYFhh+0vpRfAT2SvmjUHWRzt1sdeMZ4YGbPJgLD0=
Content-Type: multipart/mixed; boundary="===============7523583551368397982=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.39.3 FAILED
Message-ID: <0101018c6dd71948-aa553328-27d2-4721-8e6a-fe3f09fdbc6e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192453

--===============7523583551368397982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.39.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.39.2-2.39.3.patch
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
From 90c8c2c36c8586634777d9ee107bb839964a4bcf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 06:21:20 +0000
Subject: [PATCH] util-linux: upgrade 2.39.2 -> 2.39.3

---
 meta/recipes-core/util-linux/util-linux.inc   |  5 +--
 ...ls-include-libgen.h-for-basename-API.patch |  9 +++--
 ...Use-4K-buffer-size-instead-of-BUFSIZ.patch | 38 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  4 +-
 .../util-linux/configure-sbindir.patch        | 19 +++++++---
 .../display_testname_for_subtest.patch        | 12 +++---
 .../util-linux/util-linux/ptest.patch         |  4 +-
 ...l-linux_2.39.2.bb => util-linux_2.39.3.bb} | 29 ++++++++++++++
 8 files changed, 61 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.2.bb => util-linux_2.39.3.bb} (92%)

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
index 2b9897ade1..3733341c0c 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 6581cf8ac95b99b5a35fea88c52646558d05b5e7 Mon Sep 17 00:00:00 2001
+From 5a4816a3927c53fb52835a3afcda9f8423980238 Mon Sep 17 00:00:00 2001
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
index f1cbdb3beb..887530e289 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From f90ff1937fce66dfae8f750b4c0708ad605b63a7 Mon Sep 17 00:00:00 2001
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
index e475289f65..78a730a372 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,3 +1,8 @@
+From 95d4de0924bc36f130f2b15dc61dadf53cb032c3 Mon Sep 17 00:00:00 2001
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
index 417ca1d98f..f841ef0b9a 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,7 @@
-Display testname for subtest
+From 98261bc43d1b122e4877b8d0115be51753fb8245 Mon Sep 17 00:00:00 2001
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
index ba2bd3f6ac..dae4448d33 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From f028197750c3383554bb56f1fc19d5b0d1d0b983 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.2.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
similarity index 92%
rename from meta/recipes-core/util-linux/util-linux_2.39.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 927037a342..9455f3a576 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
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
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-- 
2.42.0


--===============7523583551368397982==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.39.2-2.39.3.patch"

RnJvbSA5MGM4YzJjMzZjODU4NjYzNDc3N2Q5ZWUxMDdiYjgzOTk2NGE0YmNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDY6MjE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiB1cGdyYWRlIDIuMzkuMiAtPiAyLjM5LjMKCi0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDUgKy0tCiAuLi5scy1pbmNsdWRlLWxp
Ymdlbi5oLWZvci1iYXNlbmFtZS1BUEkucGF0Y2ggfCAgOSArKystLQogLi4uVXNlLTRLLWJ1ZmZl
ci1zaXplLWluc3RlYWQtb2YtQlVGU0laLnBhdGNoIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgIHwgIDQgKy0KIC4u
Li91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAgICAgICB8IDE5ICsrKysrKyst
LS0KIC4uLi9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoICAgICAgICB8IDEyICsr
Ky0tLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCAgICAgICAgIHwgIDQg
Ky0KIC4uLmwtbGludXhfMi4zOS4yLmJiID0+IHV0aWwtbGludXhfMi4zOS4zLmJifSB8IDI5ICsr
KysrKysrKysrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDU5IGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJ
Wi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgve3V0aWwtbGludXhf
Mi4zOS4yLmJiID0+IHV0aWwtbGludXhfMi4zOS4zLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMgYi9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCmluZGV4IGUzYmVmNWFjZmMuLjA0NGQ5ODYx
ZGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwpAQCAt
MTIsNyArMTIsNyBAQCBMSUNFTlNFOiR7UE59LWxpYmZkaXNrID0gIkxHUEwtMi4xLW9yLWxhdGVy
IgogTElDRU5TRToke1BOfS1saWJtb3VudCA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ0VOU0U6
JHtQTn0tbGlic21hcnRjb2xzID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0xMmFlNzc2OGE2NWVjOGYyZTQ0ZDkz
MGRmOWNiNDNmYSBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5n
O21kNT02YjBlMGEyMzIwZTY2ZTYyZWVmOWI4MTQ5YTZmYWVjNCBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Eb2N1bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJ
TkcuR1BMLTIuMC1vci1sYXRlcjttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZ
SU5HLkxHUEwtMi4xLW9yLWxhdGVyO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyBcCkBAIC0zNSw4ICszNSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51
eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vZGlzcGxheV90ZXN0bmFtZV9m
b3Jfc3VidGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6
ZS1pbnN0ZWFkLW9mLUJVRlNJWi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxvZ2lu
LXV0aWxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLUFQSS5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3YWJkZmFhOGU0OTBmOGJlNmRkZTk3NmY3
YzgwYjliNWZmOWYzMDFlMWI2N2UzODk5ZTFmMDVhNTlhMTUzMWYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2I2NjA1ZTQ4ZDFhNDlmNDNjYzRiNGNmYzU5ZjMxM2QwZGQ1NDAyZmE0MGI5NjgxMGJk
NTcyZTE2N2RmZWQwZiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWxvZ2luLXV0aWxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1l
LUFQSS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LWxvZ2luLXV0aWxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLUFQSS5wYXRjaAppbmRl
eCAyYjk4OTdhZGUxLi4zNzMzMzQxYzBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sb2dpbi11dGlscy1pbmNsdWRlLWxpYmdlbi5oLWZv
ci1iYXNlbmFtZS1BUEkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtbG9naW4tdXRpbHMtaW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUt
QVBJLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NTgxY2Y4YWM5NWI5OWI1YTM1ZmVhODhj
NTI2NDY1NThkMDViNWU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YTQ4MTZhMzky
N2M1M2ZiNTI4MzVhM2FmY2RhOWY4NDIzOTgwMjM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMyBEZWMgMjAy
MyAxOTo1OTo0NiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBsb2dpbi11dGlsczogaW5jbHVkZSBs
aWJnZW4uaCBmb3IgYmFzZW5hbWUgQVBJCkBAIC0xNywxMCArMTcsMTMgQEAgRml4ZXMKIAogVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0
aWwtbGludXgvcHVsbC8yNjE1XQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KKwogLS0tCi0gbG9naW4tdXRpbHMvc3UtY29tbW9uLmMgfCA4ICsrKysrKy0tCi0g
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKyBsb2dpbi11
dGlscy9zdS1jb21tb24uYyB8IDEwICsrKysrKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCitkaWZmIC0tZ2l0IGEvbG9naW4tdXRpbHMvc3Ut
Y29tbW9uLmMgYi9sb2dpbi11dGlscy9zdS1jb21tb24uYworaW5kZXggYjY3NDkyMC4uMzI5N2M3
OCAxMDA2NDQKIC0tLSBhL2xvZ2luLXV0aWxzL3N1LWNvbW1vbi5jCiArKysgYi9sb2dpbi11dGls
cy9zdS1jb21tb24uYwogQEAgLTI2LDYgKzI2LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6
ZS1pbnN0ZWFkLW9mLUJVRlNJWi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJ
Wi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNGQ3NDg3YzRmNy4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1s
c2NwdS1Vc2UtNEstYnVmZmVyLXNpemUtaW5zdGVhZC1vZi1CVUZTSVoucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDk1YjA0MDUzMzg0NDBjZjVjZDZkNGIyYjVjNjZj
ZGE4YmYzODFiMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgotRGF0ZTogRnJpLCAxNSBTZXAgMjAyMyAwMDoxODoxOCAtMDcwMAot
U3ViamVjdDogW1BBVENIXSBsc2NwdTogVXNlIDRLIGJ1ZmZlciBzaXplIGluc3RlYWQgb2YgQlVG
U0laCi0KLVNvbWUgbGluZXMgaW4gL3Byb2MvY3B1aW5mbyBjYW4gYmUgbGFyZ2UgZS5nLiBmbGFn
cyBhbmQgY2FuIHRoZW4KLXRydW5jYXRlIHRoZW0gaW4gZGlzcGxheWluZyB0aGVtCi0KLUJVRlNJ
WiBjYW4gdmFyeSBxdWl0ZSBhIGJpdCAgZS5nLiBnbGliYy9saW51eCBzeXN0ZW1zIGl0cyA4MTky
Ci1idXQgb24gbXVzbC9saW51eCBhbmQgT1NYIGl0cyAxMDI0LCBvbiBtaW5nVyBpdCBpcyAyNTYs
IHNvbWUgdGVzdHMgZS5nLgoteDg2XzY0LTY0Y3B1LWxpbnV4Ni4yLnRhci5neiBoYXMgYWRkZWQg
cmVhbGx5IGxvbmcgbGluZSBmb3IgY3B1IGZsYWdzCi1saW5lIHdoaWNoIGlzIGdyZWF0ZXIgdGhh
biAxMDI0IGNoYXJhY3RlcnMgYW5kIGhlbmNlIHRoaXMgdGVzdCBmYWlscwotb24gbXVzbCBiZWNh
dXNlIGxzY3B1IC1zIHJlcG9ydHMgdHJ1bmNhdGVkIHN0cmluZwotCi1VcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9wdWxs
LzI0OTJdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0t
Ci0gc3lzLXV0aWxzL2xzY3B1LWNwdXR5cGUuYyB8IDQgKysrLQotIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3N5cy11dGlscy9s
c2NwdS1jcHV0eXBlLmMgYi9zeXMtdXRpbHMvbHNjcHUtY3B1dHlwZS5jCi1pbmRleCAzZmQ1Zjdh
M2MuLmM4ZjcyYWI4YSAxMDA2NDQKLS0tLSBhL3N5cy11dGlscy9sc2NwdS1jcHV0eXBlLmMKLSsr
KyBiL3N5cy11dGlscy9sc2NwdS1jcHV0eXBlLmMKLUBAIC00NjIsNyArNDYyLDkgQEAgc3RhdGlj
IGludCBjcHVpbmZvX3BhcnNlX2NhY2hlKHN0cnVjdCBsc2NwdV9jeHQgKmN4dCwgaW50IGtleW51
bSwgY2hhciAqZGF0YSkKLSBpbnQgbHNjcHVfcmVhZF9jcHVpbmZvKHN0cnVjdCBsc2NwdV9jeHQg
KmN4dCkKLSB7Ci0gCUZJTEUgKmZwOwotLQljaGFyIGJ1ZltCVUZTSVpdOwotKwkvKiBVc2VkIHRv
IGJlIEJVRlNJWiB3aGljaCBpcyBzbWFsbCBvbiBzb21lIHBsYXRmb3JtcyBlLmcsIG11c2wsCi0r
CSAqIHRoZXJlZm9yZSBoYXJkY29kZSB0byA0SyAqLwotKwljaGFyIGJ1Zls0MDk2XTsKLSAJc2l6
ZV90IGk7Ci0gCXN0cnVjdCBsc2NwdV9jcHV0eXBlICpjdDsKLSAJc3RydWN0IGNwdWluZm9fcGFy
c2VyIF9wciA9IHsgLmN4dCA9IGN4dCB9LCAqcHIgPSAmX3ByOwotLS0gCi0yLjQyLjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3Bh
cmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGYxY2JkYjNiZWIuLjg4NzUzMGUy
ODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9h
dm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGVlM2M3ODEyZTFlZmE2NzE5YWY2OGI5OTQ4MDRmMGU2Y2FjZWFiZDggTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGY5MGZmMTkzN2ZjZTY2ZGZhZThmNzUwYjRjMDcwOGFkNjA1
YjYzYTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9y
LmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTQ6MDA6MzEgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDogQWRkIHB0ZXN0CkBAIC0xNSw3ICsxNSw3IEBA
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCA1NjY0ZjlmLi4wNzVlZjI3IDEwMDY0NAoraW5kZXggODkwMjEyZi4u
ODcwZTgxNyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBA
QCAtMTEsNyArMTEsNyBAQCBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJl
LXNiaW5kaXIucGF0Y2gKaW5kZXggZTQ3NTI4OWY2NS4uNzhhNzMwYTM3MiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGly
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25m
aWd1cmUtc2JpbmRpci5wYXRjaApAQCAtMSwzICsxLDggQEAKK0Zyb20gOTVkNGRlMDkyNGJjMzZm
MTMwZjJiMTVkYzYxZGFkZjUzY2IwMzJjMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgorRGF0ZTogTW9uLCAyNCBTZXAgMjAxMiAwNzoy
NDo1MSArMDEwMAorU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBFbnN1cmUgdGhhdCAke3Ni
aW5kaXJ9IGlzIHJlc3BlY3RlZAorCiB1dGlsLWxpbnV4OiB0YWtlICR7c2JpbmRpcn0gZnJvbSB0
aGUgZW52aXJvbm1lbnQgaWYgaXQgaXMgc2V0IHRoZXJlCiBmaXggdGhlIHRlc3QsIHRoZSBbIF0g
c3ludGF4IHdhcyBnZXR0aW5nIGVhdGVuIGJ5IGF1dG9jb25mCiAKQEAgLTUsMTEgKzEwLDE1IEBA
IFNpZ25lZC1vZmYtYnk6IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgogU2lnbmVkLW9mZi1i
eTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAKLUluZGV4OiB1dGlsLWxpbnV4LTIuMzEvY29uZmln
dXJlLmFjCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0gdXRpbC1saW51eC0yLjMxLm9yaWcvY29uZmlndXJlLmFj
Ci0rKysgdXRpbC1saW51eC0yLjMxL2NvbmZpZ3VyZS5hYwotQEAgLTg5LDcgKzg5LDEwIEBAIEFD
X1NVQlNUKFtydW5zdGF0ZWRpcl0pCistLS0KKyBjb25maWd1cmUuYWMgfCA1ICsrKystCisgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0
IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitpbmRleCAzNmMyNGI0Li44OTAyMTJmIDEw
MDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9jb25maWd1cmUuYWMKK0BAIC0xMDIsNyAr
MTAyLDEwIEBAIEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCiAgdXNyYmluX2V4ZWNkaXI9JyR7ZXhl
Y19wcmVmaXh9L2JpbicKICBBQ19TVUJTVChbdXNyYmluX2V4ZWNkaXJdKQogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5h
bWVfZm9yX3N1YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAppbmRleCA0MTdjYTFkOThm
Li5mODQxZWYwYjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3Vi
dGVzdC5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLURpc3BsYXkgdGVzdG5hbWUgZm9yIHN1YnRlc3QK
K0Zyb20gOTgyNjFiYzQzZDFiMTIyZTQ4NzdiOGQwMTE1YmU1MTc1M2ZiODI0NSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29t
PgorRGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCitTdWJqZWN0OiBbUEFUQ0hd
IERpc3BsYXkgdGVzdG5hbWUgZm9yIHN1YnRlc3QKIAogU2lnbmVkLW9mZi1ieTogVHVkb3IgRmxv
cmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKQEAg
LTgsMTAgKzExLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvZnVu
Y3Rpb25zLnNoIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1pbmRleCA1MjQ2NjA1Li5iMjRkYzE1IDEw
MDY0NAoraW5kZXggNWE1NjJhMy4uMDk4MTQ1ZSAxMDA2NDQKIC0tLSBhL3Rlc3RzL2Z1bmN0aW9u
cy5zaAogKysrIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1AQCAtMzIwLDcgKzMyMCw3IEBAIGZ1bmN0
aW9uIHRzX2luaXRfc3VidGVzdCB7CitAQCAtNDM3LDcgKzQzNyw3IEBAIGZ1bmN0aW9uIHRzX2lu
aXRfc3VidGVzdCB7CiAgCiAgCWlmIFsgIiRUU19QQVJTQUJMRSIgIT0gInllcyIgXTsgdGhlbgog
IAkJWyAkVFNfTlNVQlRFU1RTIC1lcSAxIF0gJiYgZWNobwpAQCAtMjAsNiArMjMsMyBAQCBpbmRl
eCA1MjQ2NjA1Li5iMjRkYzE1IDEwMDY0NAogIAlmaQogIH0KICAKLS0tIAotMi44LjMKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNo
CmluZGV4IGJhMmJkM2Y2YWMuLmRhZTQ0NDhkMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGFmMDczYzEzZWYxODRjYTc1ODExZGY2ODhlMGEwYTI1ODI3YjM2YzMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGYwMjgxOTc3NTBjMzM4MzU1NGJiNTZmMWZjMTlkNWIwZDFkMGI5
ODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZs
b3JlYUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBEZWZpbmUgVEVTVFMgdmFyaWFibGUKQEAgLTExLDcgKzExLDcgQEAgVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAK
IGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA4ODY1OThkLi4x
Y2Y0MzQ2IDEwMDY0NAoraW5kZXggZWZmYmIwMi4uN2QyYmQxZSAxMDA2NDQKIC0tLSBhL01ha2Vm
aWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTU3LDYgKzU3LDcgQEAgc3lzdGVtZHN5c3Rl
bXVuaXRfREFUQSA9CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXhfMi4zOS4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4XzIuMzkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi4zOS4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi4zOS4zLmJiCmluZGV4IDkyNzAzN2Ez
NDIuLjk0NTVmM2E1NzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eF8yLjM5LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4XzIuMzkuMy5iYgpAQCAtMSwzICsxLDMyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gUkVBRE1FLmxpY2Vuc2luZworIyArKysgUkVBRE1FLmxpY2Vuc2luZworIyBAQCAtMiwxMSAr
MiwxMyBAQAorIyAgVGhlIHByb2plY3QgdXRpbC1saW51eCBkb2Vzbid0IHVzZSB0aGUgc2FtZSBs
aWNlbnNlIGZvciBhbGwgb2YgdGhlIGNvZGUuCisjICBUaGVyZSBpcyBjb2RlIHVuZGVyOgorIyAg
CisjIC0gICAqIEdQTC0zLjAtb3ItbGF0ZXIgICAtIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMywgb3IgYW55IGxhdGVyIHZlcnNpb24KKyMgKyAgICogR1BMLTEuMC1vci1sYXRl
ciAgIC0gR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAxLCBvciBhbnkgbGF0ZXIg
dmVyc2lvbgorIyArCisjICsgICAqIEdQTC0yLjAgICAgICAgICAgICAtIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIHZlcnNpb24gMgorIyAgCisjICAgICAqIEdQTC0yLjAtb3ItbGF0ZXIgICAt
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiwgb3IgYW55IGxhdGVyIHZlcnNp
b24KKyMgIAorIyAtICAgKiBHUEwtMi4wICAgICAgICAgICAgLSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSB2ZXJzaW9uIDIKKyMgKyAgICogR1BMLTMuMC1vci1sYXRlciAgIC0gR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAzLCBvciBhbnkgbGF0ZXIgdmVyc2lvbgorIyAgCisj
ICAgICAqIExHUEwtMi4xLW9yLWxhdGVyICAtIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSAyLjEgb3IgYW55IGxhdGVyIHZlcnNpb24KKyMgIAorIyAKKyMKKwogcmVxdWlyZSB1dGls
LWxpbnV4LmluYwogCiAjZ3RrLWRvYyBpcyBub3QgZW5hYmxlZCBhcyBpdCByZXF1aXJlcyB4bWx0
byB3aGljaCByZXF1aXJlcyB1dGlsLWxpbnV4Ci0tIAoyLjQyLjAKCg==

--===============7523583551368397982==
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
DISTRO_VERSION       = "4.3+snapshot-54ac155d7db97c40f492b1ca24e75d87b24d8489"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:54ac155d7db97c40f492b1ca24e75d87b24d8489"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 736 Local 283 Mirrors 0 Missed 453 Current 315 (38% match, 56% complete)
Removing 38 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 108 stale sstate objects for arch core2-64...done.
Removing 107 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 441 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 445 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 522 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 523 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 524 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 556 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 586 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 587 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 622 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 626 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 664 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 665 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 668 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 680 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 683 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 685 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-74-1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 738 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 746 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 751 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 752 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 796 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 797 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 801 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 802 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 804 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 818 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 824 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 828 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 833 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 834 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 841 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 858 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 865 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 866 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 889 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 897 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 899 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 905 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 907 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-native-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-native-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 910 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 911 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 924 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-native-1.07.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 930 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe bc-native-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 941 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 943 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-native-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 946 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 949 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 957 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 965 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-native-1.07.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1051 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 974 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 976 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-native-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-native-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-native-31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-native-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 983 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 987 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 988 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 989 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-native-31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 990 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 992 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-native-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 996 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-native-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-native-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 999 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1000 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1001 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1004 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1008 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1013 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1016 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-native-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-native-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1023 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1024 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe curl-native-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1025 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1027 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-native-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1030 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1035 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1037 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe libical-native-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1043 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-native-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-native-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1045 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-native-1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-native-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1049 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1050 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1051 of 1051 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 187 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe openssl-native-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 217 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_patch)
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe openssl-native-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 352 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_patch: Started
NOTE: Running task 394 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 396 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: Running task 425 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 429 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: Running task 433 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 435 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_fetch)
NOTE: Running task 437 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 441 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running task 493 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running task 495 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: Running task 497 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 499 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: Running task 520 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: Running task 521 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running noexec task 523 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_configure)
NOTE: Running noexec task 524 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 525 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_install)
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 526 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 527 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa unihash changed to e9999d4a764afbad3996de6be13eb639f262dc163f3e91a5b5f3e4802621bb9f
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_install: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 529 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: Running task 536 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: Running task 537 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: Running task 538 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: Running task 539 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 540 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: Running task 541 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 542 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_unpack)
NOTE: Running task 543 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 544 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Running task 545 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 546 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: Running task 547 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 548 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: Running task 552 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 554 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
WARNING: util-linux-libuuid-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 555 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 556 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 557 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 558 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_patch)
NOTE: Running task 559 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 560 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 563 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 567 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_fetch)
NOTE: Running task 571 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 572 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 574 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: Running task 577 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_fetch)
NOTE: Running task 579 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Started
NOTE: Running task 583 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Succeeded
WARNING: util-linux-libuuid-native-2.39.2-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz - will attempt other sources if available
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 586 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa unihash changed to f40f388d0892c657f1f46199fbc826af1e4c05433b5f32af535bbc05850985d2
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 599 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 600 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 601 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_patch)
NOTE: Running task 604 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: Running task 605 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: Running task 606 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: Running task 607 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: Running task 609 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 611 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: Running task 612 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_unpack)
NOTE: Running task 613 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_unpack)
NOTE: Running task 617 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 618 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 619 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_unpack)
NOTE: Running task 621 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Succeeded
NOTE: Running task 622 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_patch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 623 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 625 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 627 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 628 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_patch: Succeeded
NOTE: Running task 630 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: Running task 634 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 635 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_configure)
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Succeeded
WARNING: util-linux-libuuid-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_patch: Succeeded
NOTE: Running task 647 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_fetch)
NOTE: Running task 668 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: Running task 674 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_fetch: Started
NOTE: Running task 708 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_configure: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 710 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_unpack)
NOTE: Running task 714 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 745 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: Running task 748 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 749 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 752 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_unpack)
NOTE: Running task 753 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa)
NOTE: recipe meson-native-1.3.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_unpack: Started
WARNING: util-linux-libuuid-2.39.2-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz - will attempt other sources if available
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 790 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 792 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.42.0.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 802 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: Running task 829 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: Running task 830 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.3.0-r0: task do_unpack: Started
NOTE: Running task 835 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_patch: Started
NOTE: Running task 858 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.42.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 860 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: Running task 861 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 862 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: Running task 866 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 868 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: Running task 871 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running task 873 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Started
NOTE: Running task 874 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 875 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Running task 878 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: Running task 880 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 885 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_unpack: Started
NOTE: recipe meson-native-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Started
NOTE: Running task 886 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_patch)
NOTE: recipe python3-setuptools-native-69.0.2-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 889 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 894 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Started
NOTE: Running task 897 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 898 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe wayland-native-1.22.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.3.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: Running task 901 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 902 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 903 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe meson-native-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 910 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_unpack: Started
NOTE: Running task 911 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 912 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 914 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_patch)
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 916 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 917 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 918 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 919 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe wayland-native-1.22.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 921 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 927 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: Running task 931 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: Running task 933 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe wayland-native-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 935 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 938 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 945 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 948 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 949 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
WARNING: util-linux-libuuid-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 952 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 953 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_write_config: Started
NOTE: Running task 955 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 958 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: Running task 960 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_patch: Started
NOTE: Running task 963 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 970 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: Running task 971 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe update-rc.d-0.8-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 977 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 979 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 980 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 982 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_patch)
NOTE: Running task 983 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 984 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: Running task 985 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: Running task 988 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_patch: Started
NOTE: Running task 994 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: Running task 998 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 999 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe xcb-proto-1.16.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_collect_spdx_deps)
NOTE: recipe update-rc.d-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: Running task 1018 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1019 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1025 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: Running task 1029 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: Running task 1030 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1033 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running task 1034 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_patch)
NOTE: recipe xcb-proto-1.16.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1037 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_unpack)
NOTE: Running task 1039 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Started
NOTE: Running task 1040 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe xcb-proto-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_patch)
NOTE: Running task 1042 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: Running task 1046 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_unpack: Started
NOTE: Running task 1049 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1052 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: Running task 1071 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: Running task 1080 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe libxslt-native-1.1.39-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_patch: Started
NOTE: Running task 1084 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1087 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_fetch)
NOTE: recipe libxslt-native-1.1.39-r0: task do_fetch: Succeeded
NOTE: recipe kmod-31-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe update-rc.d-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: Running task 1093 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1099 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1100 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: Running task 1102 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: recipe kmod-31-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: Running task 1105 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1106 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.2-r0: task do_fetch: Started
NOTE: recipe curl-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_fetch: Started
NOTE: Running task 1107 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_patch)
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1109 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1110 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_unpack)
NOTE: Running task 1113 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_unpack)
NOTE: Running task 1116 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1119 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_patch: Succeeded
NOTE: Running task 1121 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_unpack)
NOTE: Running task 1122 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: Running task 1131 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe curl-8.4.0-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Started
NOTE: recipe kmod-31-r0: task do_unpack: Started
NOTE: recipe curl-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_unpack: Started
NOTE: Running task 1132 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: Running task 1140 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1142 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1143 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_patch)
NOTE: Running task 1144 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: Running task 1146 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_configure: Succeeded
NOTE: Running task 1148 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_compile)
NOTE: recipe update-rc.d-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_patch: Started
NOTE: recipe update-rc.d-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_patch: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1151 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_fetch)
NOTE: Running task 1176 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe update-rc.d-0.8-r0: task do_configure: Started
NOTE: recipe glibc-2.38+git-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_patch: Started
NOTE: Running task 1180 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe update-rc.d-0.8-r0: task do_configure: Succeeded
NOTE: recipe kmod-31-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_patch)
NOTE: Running task 1182 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_fetch: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_unpack: Started
NOTE: Running task 1183 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe update-rc.d-0.8-r0: task do_compile: Started
NOTE: recipe update-rc.d-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1185 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: recipe kmod-31-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_fetch: Succeeded
NOTE: Running task 1186 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe xorgproto-native-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1187 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_unpack)
NOTE: Running task 1188 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1189 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 1190 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe update-rc.d-0.8-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1191 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1215 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_write_config)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: Running task 1216 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_patch: Started
NOTE: recipe kmod-31-r0: task do_patch: Succeeded
NOTE: Running task 1220 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.2-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Started
NOTE: Running task 1232 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_warn_musl)
NOTE: Running task 1233 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: Running task 1236 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_write_config)
NOTE: recipe xorgproto-native-2023.2-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Started
NOTE: Running task 1241 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Succeeded
NOTE: Running task 1242 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_patch: Started
NOTE: Running task 1251 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Succeeded
NOTE: Running task 1258 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 1260 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Started
NOTE: recipe vala-native-0.56.13-r0: task do_fetch: Started
NOTE: recipe vala-native-0.56.13-r0: task do_fetch: Succeeded
NOTE: Running task 1261 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Succeeded
NOTE: Running task 1268 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Started
NOTE: Running task 1271 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe xorgproto-native-2023.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: Running task 1272 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1274 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe xorgproto-native-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe icu-74-1-r0: task do_fetch: Started
NOTE: Running task 1275 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1277 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe gnutls-3.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1279 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: recipe vala-native-0.56.13-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe icu-74-1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 1284 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe libical-native-3.0.17-r0: task do_fetch: Started
NOTE: recipe libical-native-3.0.17-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_fetch: Started
NOTE: Running task 1289 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: Running task 1290 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 1291 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: Running task 1292 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1301 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: recipe icu-74-1-r0: task do_unpack: Started
NOTE: Running task 1302 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe systemd-1_254.4-r0: task do_patch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1304 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 1305 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Succeeded
NOTE: Running task 1308 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Started
NOTE: Running task 1310 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe libical-native-3.0.17-r0: task do_unpack: Started
NOTE: recipe vala-native-0.56.13-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: Running task 1314 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_patch: Succeeded
NOTE: Running task 1316 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1317 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1318 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe libical-native-3.0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1321 of 2825 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_fetch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe vala-native-0.56.13-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1324 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 1326 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_patch: Started
NOTE: recipe vala-native-0.56.13-r0: task do_patch: Succeeded
NOTE: Running task 1328 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe libical-native-3.0.17-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe kmod-native-31-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Failed
NOTE: Running task 1330 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libical-3.0.17-r0: task do_patch: Succeeded
NOTE: recipe kmod-native-31-r0: task do_fetch: Succeeded
NOTE: recipe libical-native-3.0.17-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe icu-74-1-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Failed
NOTE: recipe linux-yocto-6.5.13+git-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1330 tasks of which 1027 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215061914.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215061914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.39.2-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz
ERROR: util-linux-libuuid-native-2.39.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz\' has sha256 checksum \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' when \'7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz')
ERROR: util-linux-libuuid-2.39.2-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz
ERROR: util-linux-libuuid-2.39.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz\' has sha256 checksum \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' when \'7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.39.2/temp/log.do_fetch.3399355
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.39.2/temp/log.do_fetch.3400171
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch) failed with exit code '1'

--===============7523583551368397982==--

