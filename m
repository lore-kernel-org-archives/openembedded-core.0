Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D31C48BEB
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4629.1704114719584323553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gvnH/HhL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CzwPPsg9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cc52707c0-d3732bac-632a-42c4-a8b6-165d82bfa202-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TzQhCLsiwBWPFPZvysmE8f0EZqe21E+BwKj5DudNpGo=;
	b=gvnH/HhLAXfCo83UKJdnktEvfjU6VlvjSTNql+coodS6uxkbrk+/N2qv9W2uzJx+
	bCXG8CXTpugaTDbTgpwxHJ/8JP/NK4HeApPWwkzRH/QwkvilNKvC8iD83PXAYvknHvj
	KcxTphaFpyr9rLrG/gHf1Iz7XHPNW2rJ8Nwo+5Tk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TzQhCLsiwBWPFPZvysmE8f0EZqe21E+BwKj5DudNpGo=;
	b=CzwPPsg9/6lKf3mADqyxXIiNnEN1tQ0IcyCrAl69gYnMGWUx2ou8a6QyBMRkGfOi
	XFvp+wa7CSbSqgj4mnNm88i8+SzptYo/hK+c11jKrXBWY42/4iiVtj7RjPR+DAovA3o
	ssyMr60qHO7iaL/+uVnHazJBWfwD3ouUjwO5gCHo=
Content-Type: multipart/mixed; boundary="===============1292388275320391385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.3 FAILED
Message-ID: <0101018cc52707c0-d3732bac-632a-42c4-a8b6-165d82bfa202-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193118

--===============1292388275320391385==
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
From 42ae2724b9c8c6ff8c83baab652bebad5214a753 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:44:28 +0000
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
index 2b9897ade1..7fca689583 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 6581cf8ac95b99b5a35fea88c52646558d05b5e7 Mon Sep 17 00:00:00 2001
+From 2b63e0aae67b8c00217300b9b7b3e0fc1db886a4 Mon Sep 17 00:00:00 2001
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
index f1cbdb3beb..d027b4d11e 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From 989f04be9f9e59eb9c8234503ecd81cc9c2ec67e Mon Sep 17 00:00:00 2001
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
index e475289f65..916dda3232 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,3 +1,8 @@
+From 9196bd921e08b97f87549f89f75fb9eb48b6b850 Mon Sep 17 00:00:00 2001
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
index 417ca1d98f..3b5ccda3bd 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,7 @@
-Display testname for subtest
+From 25221b89ac473793a7c135147e6ce5e523f84eaf Mon Sep 17 00:00:00 2001
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
index ba2bd3f6ac..dff2900665 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From bdb7f4ec2c32250b0c5245f4a33c5d15881ff977 Mon Sep 17 00:00:00 2001
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


--===============1292388275320391385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.39.2-2.39.3.patch"

RnJvbSA0MmFlMjcyNGI5YzhjNmZmOGM4M2JhYWI2NTJiZWJhZDUyMTRhNzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNTo0NDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjM5LjIgLT4gMi4zOS4zCgotLS0KIC4uLjIuMzku
Mi5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4zLmJifSB8IDI5ICsrKysrKysrKysrKysr
CiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgfCAgNSArLS0K
IC4uLmxzLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLUFQSS5wYXRjaCB8ICA5ICsrKy0t
CiAuLi5Vc2UtNEstYnVmZmVyLXNpemUtaW5zdGVhZC1vZi1CVUZTSVoucGF0Y2ggfCAzOCAtLS0t
LS0tLS0tLS0tLS0tLS0tCiAuLi4vdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRj
aCAgICAgfCAgNCArLQogLi4uL3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2ggICAg
ICAgIHwgMTkgKysrKysrKy0tLQogLi4uL2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0
Y2ggICAgICAgIHwgMTIgKysrLS0tCiAuLi4vdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBh
dGNoICAgICAgICAgfCAgNCArLQogOCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA1
OSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGls
LWxpbnV4LWxpYnV1aWRfMi4zOS4yLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8yLjM5LjMuYmJ9
ICgzMCUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtbHNjcHUtVXNlLTRLLWJ1ZmZlci1zaXplLWluc3RlYWQtb2YtQlVGU0la
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LWxpYnV1aWRfMi4zOS4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LWxpYnV1aWRfMi4zOS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMzAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1
aWRfMi4zOS4zLmJiCmluZGV4IDVkNzU5YWVkOTQuLjY4N2U0MzI3YzggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5
LjMuYmIKQEAgLTEsMyArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFs
dWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93
aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNl
IHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQg
c3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vu
c2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQg
eWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRS5saWNl
bnNpbmcKKyMgKysrIFJFQURNRS5saWNlbnNpbmcKKyMgQEAgLTIsMTEgKzIsMTMgQEAKKyMgIFRo
ZSBwcm9qZWN0IHV0aWwtbGludXggZG9lc24ndCB1c2UgdGhlIHNhbWUgbGljZW5zZSBmb3IgYWxs
IG9mIHRoZSBjb2RlLgorIyAgVGhlcmUgaXMgY29kZSB1bmRlcjoKKyMgIAorIyAtICAgKiBHUEwt
My4wLW9yLWxhdGVyICAgLSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDMsIG9y
IGFueSBsYXRlciB2ZXJzaW9uCisjICsgICAqIEdQTC0xLjAtb3ItbGF0ZXIgICAtIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMSwgb3IgYW55IGxhdGVyIHZlcnNpb24KKyMgKwor
IyArICAgKiBHUEwtMi4wICAgICAgICAgICAgLSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2
ZXJzaW9uIDIKKyMgIAorIyAgICAgKiBHUEwtMi4wLW9yLWxhdGVyICAgLSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIsIG9yIGFueSBsYXRlciB2ZXJzaW9uCisjICAKKyMgLSAg
ICogR1BMLTIuMCAgICAgICAgICAgIC0gR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lv
biAyCisjICsgICAqIEdQTC0zLjAtb3ItbGF0ZXIgICAtIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIHZlcnNpb24gMywgb3IgYW55IGxhdGVyIHZlcnNpb24KKyMgIAorIyAgICAgKiBMR1BMLTIu
MS1vci1sYXRlciAgLSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgMi4xIG9yIGFu
eSBsYXRlciB2ZXJzaW9uCisjICAKKyMgCisjCisKICMgVG8gYWxsb3cgdXRpbC1saW51eCB0byBv
cHRpb25hbGx5IGJ1aWxkLWRlcGVuZCBvbiBjcnlwdHNldHVwLCBsaWJ1dWlkIGlzCiAjIHNwbGl0
IG91dCBvZiB0aGUgbWFpbiByZWNpcGUsIGFzIGl0J3MgbmVlZGVkIGJ5IGNyeXB0c2V0dXAKIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggZTNiZWY1
YWNmYy4uMDQ0ZDk4NjFkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXguaW5jCkBAIC0xMiw3ICsxMiw3IEBAIExJQ0VOU0U6JHtQTn0tbGliZmRpc2sgPSAiTEdQ
TC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYm1vdW50ID0gIkxHUEwtMi4xLW9yLWxh
dGVyIgogTElDRU5TRToke1BOfS1saWJzbWFydGNvbHMgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiAK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNpbmc7bWQ1PTEyYWU3NzY4
YTY1ZWM4ZjJlNDRkOTMwZGY5Y2I0M2ZhIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JF
QURNRS5saWNlbnNpbmc7bWQ1PTZiMGUwYTIzMjBlNjZlNjJlZWY5YjgxNDlhNmZhZWM0IFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZh
ODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0RvY3VtZW50YXRpb24v
bGljZW5zZXMvQ09QWUlORy5HUEwtMi4wLW9yLWxhdGVyO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2
YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Eb2N1bWVudGF0aW9u
L2xpY2Vuc2VzL0NPUFlJTkcuTEdQTC0yLjEtb3ItbGF0ZXI7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1
MTA3OTAwOGIzNjQ1MTZjIFwKQEAgLTM1LDggKzM1LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9S
R19NSVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0vdXRpbC1s
aW4KICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNw
bGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbHNjcHUtVXNl
LTRLLWJ1ZmZlci1zaXplLWluc3RlYWQtb2YtQlVGU0laLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtbG9naW4tdXRpbHMtaW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtQVBJLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODdhYmRmYWE4ZTQ5
MGY4YmU2ZGRlOTc2ZjdjODBiOWI1ZmY5ZjMwMWUxYjY3ZTM4OTllMWYwNWE1OWExNTMxZiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI3YjY2MDVlNDhkMWE0OWY0M2NjNGI0Y2ZjNTlmMzEzZDBkZDU0
MDJmYTQwYjk2ODEwYmQ1NzJlMTY3ZGZlZDBmIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbG9naW4tdXRpbHMtaW5jbHVkZS1saWJnZW4u
aC1mb3ItYmFzZW5hbWUtQVBJLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtbG9naW4tdXRpbHMtaW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUt
QVBJLnBhdGNoCmluZGV4IDJiOTg5N2FkZTEuLjdmY2E2ODk1ODMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxvZ2luLXV0aWxzLWluY2x1
ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLUFQSS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sb2dpbi11dGlscy1pbmNsdWRlLWxpYmdlbi5o
LWZvci1iYXNlbmFtZS1BUEkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1ODFjZjhhYzk1
Yjk5YjVhMzVmZWE4OGM1MjY0NjU1OGQwNWI1ZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDJiNjNlMGFhZTY3YjhjMDAyMTczMDBiOWI3YjNlMGZjMWRiODg2YTQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTog
U3VuLCAzIERlYyAyMDIzIDE5OjU5OjQ2IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxvZ2luLXV0
aWxzOiBpbmNsdWRlIGxpYmdlbi5oIGZvciBiYXNlbmFtZSBBUEkKQEAgLTE3LDEwICsxNywxMyBA
QCBGaXhlcwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29t
L3V0aWwtbGludXgvdXRpbC1saW51eC9wdWxsLzI2MTVdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KLSBsb2dpbi11dGlscy9zdS1jb21tb24uYyB8
IDggKysrKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQorIGxvZ2luLXV0aWxzL3N1LWNvbW1vbi5jIHwgMTAgKysrKysrKy0tLQorIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKK2RpZmYgLS1naXQgYS9s
b2dpbi11dGlscy9zdS1jb21tb24uYyBiL2xvZ2luLXV0aWxzL3N1LWNvbW1vbi5jCitpbmRleCBi
Njc0OTIwLi4zMjk3Yzc4IDEwMDY0NAogLS0tIGEvbG9naW4tdXRpbHMvc3UtY29tbW9uLmMKICsr
KyBiL2xvZ2luLXV0aWxzL3N1LWNvbW1vbi5jCiBAQCAtMjYsNiArMjYsNyBAQApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbHNjcHUtVXNl
LTRLLWJ1ZmZlci1zaXplLWluc3RlYWQtb2YtQlVGU0laLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbHNjcHUtVXNlLTRLLWJ1ZmZlci1zaXplLWlu
c3RlYWQtb2YtQlVGU0laLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0ZDc0
ODdjNGY3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC8wMDAxLWxzY3B1LVVzZS00Sy1idWZmZXItc2l6ZS1pbnN0ZWFkLW9mLUJVRlNJWi5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM4ICswLDAgQEAKLUZyb20gOTViMDQwNTMzODQ0MGNm
NWNkNmQ0YjJiNWM2NmNkYThiZjM4MWIyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDE1IFNlcCAyMDIzIDAw
OjE4OjE4IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxzY3B1OiBVc2UgNEsgYnVmZmVyIHNpemUg
aW5zdGVhZCBvZiBCVUZTSVoKLQotU29tZSBsaW5lcyBpbiAvcHJvYy9jcHVpbmZvIGNhbiBiZSBs
YXJnZSBlLmcuIGZsYWdzIGFuZCBjYW4gdGhlbgotdHJ1bmNhdGUgdGhlbSBpbiBkaXNwbGF5aW5n
IHRoZW0KLQotQlVGU0laIGNhbiB2YXJ5IHF1aXRlIGEgYml0ICBlLmcuIGdsaWJjL2xpbnV4IHN5
c3RlbXMgaXRzIDgxOTIKLWJ1dCBvbiBtdXNsL2xpbnV4IGFuZCBPU1ggaXRzIDEwMjQsIG9uIG1p
bmdXIGl0IGlzIDI1Niwgc29tZSB0ZXN0cyBlLmcuCi14ODZfNjQtNjRjcHUtbGludXg2LjIudGFy
Lmd6IGhhcyBhZGRlZCByZWFsbHkgbG9uZyBsaW5lIGZvciBjcHUgZmxhZ3MKLWxpbmUgd2hpY2gg
aXMgZ3JlYXRlciB0aGFuIDEwMjQgY2hhcmFjdGVycyBhbmQgaGVuY2UgdGhpcyB0ZXN0IGZhaWxz
Ci1vbiBtdXNsIGJlY2F1c2UgbHNjcHUgLXMgcmVwb3J0cyB0cnVuY2F0ZWQgc3RyaW5nCi0KLVVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91
dGlsLWxpbnV4L3B1bGwvMjQ5Ml0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci0tLS0KLSBzeXMtdXRpbHMvbHNjcHUtY3B1dHlwZS5jIHwgNCArKystCi0gMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0
IGEvc3lzLXV0aWxzL2xzY3B1LWNwdXR5cGUuYyBiL3N5cy11dGlscy9sc2NwdS1jcHV0eXBlLmMK
LWluZGV4IDNmZDVmN2EzYy4uYzhmNzJhYjhhIDEwMDY0NAotLS0tIGEvc3lzLXV0aWxzL2xzY3B1
LWNwdXR5cGUuYwotKysrIGIvc3lzLXV0aWxzL2xzY3B1LWNwdXR5cGUuYwotQEAgLTQ2Miw3ICs0
NjIsOSBAQCBzdGF0aWMgaW50IGNwdWluZm9fcGFyc2VfY2FjaGUoc3RydWN0IGxzY3B1X2N4dCAq
Y3h0LCBpbnQga2V5bnVtLCBjaGFyICpkYXRhKQotIGludCBsc2NwdV9yZWFkX2NwdWluZm8oc3Ry
dWN0IGxzY3B1X2N4dCAqY3h0KQotIHsKLSAJRklMRSAqZnA7Ci0tCWNoYXIgYnVmW0JVRlNJWl07
Ci0rCS8qIFVzZWQgdG8gYmUgQlVGU0laIHdoaWNoIGlzIHNtYWxsIG9uIHNvbWUgcGxhdGZvcm1z
IGUuZywgbXVzbCwKLSsJICogdGhlcmVmb3JlIGhhcmRjb2RlIHRvIDRLICovCi0rCWNoYXIgYnVm
WzQwOTZdOwotIAlzaXplX3QgaTsKLSAJc3RydWN0IGxzY3B1X2NwdXR5cGUgKmN0OwotIAlzdHJ1
Y3QgY3B1aW5mb19wYXJzZXIgX3ByID0geyAuY3h0ID0gY3h0IH0sICpwciA9ICZfcHI7Ci0tLSAK
LTIuNDIuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKaW5kZXggZjFjYmRi
M2JlYi4uZDAyN2I0ZDExZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZWUzYzc4MTJlMWVmYTY3MTlhZjY4Yjk5NDgwNGYwZTZjYWNl
YWJkOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTg5ZjA0YmU5ZjllNTllYjljODIz
NDUwM2VjZDgxY2M5YzJlYzY3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9y
IEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogTW9uLCAxNCBKdW4gMjAyMSAx
NDowMDozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBBZGQgcHRlc3QKQEAg
LTE1LDcgKzE1LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25m
aWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDU2NjRmOWYuLjA3NWVmMjcgMTAwNjQ0Citp
bmRleCA4OTAyMTJmLi44NzBlODE3IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9j
b25maWd1cmUuYWMKIEBAIC0xMSw3ICsxMSw3IEBAIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25m
aWd1cmUtc2JpbmRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAppbmRleCBlNDc1Mjg5ZjY1Li45MTZkZGEzMjMy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29u
ZmlndXJlLXNiaW5kaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCkBAIC0xLDMgKzEsOCBAQAorRnJvbSA5
MTk2YmQ5MjFlMDhiOTdmODc1NDlmODlmNzVmYjllYjQ4YjZiODUwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogUGhpbCBCbHVuZGVsbCA8cGJAcGJjbC5uZXQ+CitEYXRlOiBNb24sIDI0
IFNlcCAyMDEyIDA3OjI0OjUxICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEVu
c3VyZSB0aGF0ICR7c2JpbmRpcn0gaXMgcmVzcGVjdGVkCisKIHV0aWwtbGludXg6IHRha2UgJHtz
YmluZGlyfSBmcm9tIHRoZSBlbnZpcm9ubWVudCBpZiBpdCBpcyBzZXQgdGhlcmUKIGZpeCB0aGUg
dGVzdCwgdGhlIFsgXSBzeW50YXggd2FzIGdldHRpbmcgZWF0ZW4gYnkgYXV0b2NvbmYKIApAQCAt
NSwxMSArMTAsMTUgQEAgU2lnbmVkLW9mZi1ieTogUGhpbCBCbHVuZGVsbCA8cGJAcGJjbC5uZXQ+
CiBTaWduZWQtb2ZmLWJ5OiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20KIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KIAotSW5kZXg6IHV0aWwtbGlu
dXgtMi4zMS9jb25maWd1cmUuYWMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSB1dGlsLWxpbnV4LTIuMzEub3Jp
Zy9jb25maWd1cmUuYWMKLSsrKyB1dGlsLWxpbnV4LTIuMzEvY29uZmlndXJlLmFjCi1AQCAtODks
NyArODksMTAgQEAgQUNfU1VCU1QoW3J1bnN0YXRlZGlyXSkKKy0tLQorIGNvbmZpZ3VyZS5hYyB8
IDUgKysrKy0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CisKK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKK2luZGV4IDM2YzI0
YjQuLjg5MDIxMmYgMTAwNjQ0CistLS0gYS9jb25maWd1cmUuYWMKKysrKyBiL2NvbmZpZ3VyZS5h
YworQEAgLTEwMiw3ICsxMDIsMTAgQEAgQUNfU1VCU1QoW3J1bnN0YXRlZGlyXSkKICB1c3JiaW5f
ZXhlY2Rpcj0nJHtleGVjX3ByZWZpeH0vYmluJwogIEFDX1NVQlNUKFt1c3JiaW5fZXhlY2Rpcl0p
CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
ZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCmlu
ZGV4IDQxN2NhMWQ5OGYuLjNiNWNjZGEzYmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rl
c3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNyBAQAotRGlzcGxheSB0ZXN0bmFt
ZSBmb3Igc3VidGVzdAorRnJvbSAyNTIyMWI4OWFjNDczNzkzYTdjMTM1MTQ3ZTZjZTVlNTIzZjg0
ZWFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5m
bG9yZWFAZW5lYS5jb20+CitEYXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKK1N1
YmplY3Q6IFtQQVRDSF0gRGlzcGxheSB0ZXN0bmFtZSBmb3Igc3VidGVzdAogCiBTaWduZWQtb2Zm
LWJ5OiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIFVwc3RyZWFtLVN0YXR1
czogUGVuZGluZwpAQCAtOCwxMCArMTEsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS90ZXN0cy9mdW5jdGlvbnMuc2ggYi90ZXN0cy9mdW5jdGlvbnMuc2gKLWluZGV4IDUyNDY2
MDUuLmIyNGRjMTUgMTAwNjQ0CitpbmRleCA1YTU2MmEzLi4wOTgxNDVlIDEwMDY0NAogLS0tIGEv
dGVzdHMvZnVuY3Rpb25zLnNoCiArKysgYi90ZXN0cy9mdW5jdGlvbnMuc2gKLUBAIC0zMjAsNyAr
MzIwLDcgQEAgZnVuY3Rpb24gdHNfaW5pdF9zdWJ0ZXN0IHsKK0BAIC00MzcsNyArNDM3LDcgQEAg
ZnVuY3Rpb24gdHNfaW5pdF9zdWJ0ZXN0IHsKICAKICAJaWYgWyAiJFRTX1BBUlNBQkxFIiAhPSAi
eWVzIiBdOyB0aGVuCiAgCQlbICRUU19OU1VCVEVTVFMgLWVxIDEgXSAmJiBlY2hvCkBAIC0yMCw2
ICsyMywzIEBAIGluZGV4IDUyNDY2MDUuLmIyNGRjMTUgMTAwNjQ0CiAgCWZpCiAgfQogIAotLS0g
Ci0yLjguMwotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvcHRlc3QucGF0Y2gKaW5kZXggYmEyYmQzZjZhYy4uZGZmMjkwMDY2NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYWYwNzNjMTNlZjE4NGNhNzU4MTFkZjY4OGUwYTBhMjU4MjdiMzZj
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmRiN2Y0ZWMyYzMyMjUwYjBjNTI0NWY0
YTMzYzVkMTU4ODFmZjk3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZs
b3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4
OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBURVNUUyB2YXJpYWJsZQpAQCAtMTEs
NyArMTEsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWlu
ZGV4IDg4NjU5OGQuLjFjZjQzNDYgMTAwNjQ0CitpbmRleCBlZmZiYjAyLi43ZDJiZDFlIDEwMDY0
NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCiBAQCAtNTcsNiArNTcsNyBA
QCBzeXN0ZW1kc3lzdGVtdW5pdF9EQVRBID0KLS0gCjIuNDIuMAoK

--===============1292388275320391385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-98991acef50639f22fa43ab60b9be892ec194c5e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:98991acef50639f22fa43ab60b9be892ec194c5e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 148 Local 107 Mirrors 0 Missed 41 Current 145 (72% match, 86% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 166 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 169 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 170 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 175 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 176 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 177 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 186 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 199 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 217 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 218 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 219 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 220 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 222 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 252 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 262 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 270 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 282 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 116 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running task 175 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa)
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 293 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_recipe_qa_setscene)
NOTE: Running task 252 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa)
NOTE: Running task 261 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: Running task 263 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_recipe_qa: Started
NOTE: Running task 431 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 471 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 472 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 481 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_fetch)
NOTE: Running task 482 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: Running task 528 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 532 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 543 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 552 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 582 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running noexec task 595 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 287 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 627 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 629 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa unihash changed to 2e4d5c2c5b64db183e6be422dfa319b3231b5cff8c97a383e9923a0b943a9ab4
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa unihash changed to 33e85be94b48801385513c25d646dfc4e7d38d8441a660367f6ffe85f890dac8
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 266 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 277 of 293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 630 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: Running task 631 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: Running task 632 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running task 633 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: Running task 634 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 635 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 636 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_unpack)
NOTE: Running task 637 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 638 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 639 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: Running task 640 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 641 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 642 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 643 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 644 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: Running task 645 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_prepare_recipe_sysroot)
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Started
NOTE: Running task 648 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 657 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 660 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa)
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: Running task 661 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 665 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 715 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz - will attempt other sources if available
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa unihash changed to 7064f7a331d77666c6007d885838df05c2d1cae541f065ad32ec08f59821807c
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 718 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_patch)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 725 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 726 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 729 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 731 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
WARNING: util-linux-native-2.39.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz_bad-checksum_87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 732 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch unihash changed to a095cef48da9dc05d273d545fc0dd521d7fd4ab94a17e4dac92ce50e34907279
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 733 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: Running task 735 of 888 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 736 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 737 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_lic)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 888 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_lic: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_lic unihash changed to 6911d449668ad539b8c911c96ae9dba2749c43a4e6056866cf700baef87e8316
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch unihash changed to 6b29f13c3cafb02f6b28dc9f0ae11aea0c92bbc8fe5d890e799c77d684a6b76c
NOTE: Setscene tasks completed
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Failed
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 739 tasks of which 683 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101054349.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101054349.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.39.2-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz
ERROR: util-linux-native-2.39.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/util-linux-2.39.2.tar.xz\' has sha256 checksum \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' when \'7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.39.2/temp/log.do_fetch.2201376
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch) failed with exit code '1'

--===============1292388275320391385==--

