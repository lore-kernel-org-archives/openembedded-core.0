Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145FCC48294
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:08:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2547.1706810900818735203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LaegCc9b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gFtL+px2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65db80fd-4ecd0548-5eac-4687-8391-90c4865e81a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BoNsUGLiCJOPMgtTtiWFKlzcPyECc3eInJMC00OFcAM=;
	b=LaegCc9bU4D56T6TXaaR5NycLBZ2g6/pzR5hqzC/dMFINLlxQVwE/u5Dn4Py7obL
	cse9c3e7Q7ad9inFZ1GImjqDE2VPqNE5qw0L8inD4YE8SOswOILbQyXoqKsS+GxeWwO
	iAMb9JNy+/bOZQ5d16Cmdjai7B3LVBZiwZLrNNYo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BoNsUGLiCJOPMgtTtiWFKlzcPyECc3eInJMC00OFcAM=;
	b=gFtL+px2gSaaWQFa3QLYs7dGH57ulwEv5RmkwDT3scq7WTj6c8lsvysAmtZoGgGc
	a4I8MdgkKP8IV/foxTMqQrFWWS44cGIfVnFHVZcum2+41NHN/StjLlxk4iuHeM+ccIL
	fqH4aEEOuAJ4CG2lvDiu52egO3hCFzSP3Yy5HFTk=
Content-Type: multipart/mixed; boundary="===============1753848115565886528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] numactl: upgrading to 2.0.17 SUCCEEDED
Message-ID: <0101018d65db80fd-4ecd0548-5eac-4687-8391-90c4865e81a7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:08:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194727

--===============1753848115565886528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *numactl* to *2.0.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-numactl-upgrade-2.0.16-2.0.17.patch
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
From 9e1f98e81de7dde8a19d360a3f01ebcdc74e0a7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 17:51:09 +0000
Subject: [PATCH] numactl: upgrade 2.0.16 -> 2.0.17

---
 ...onfigure-Check-for-largefile-support.patch | 27 --------
 .../numactl/0001-define-run-test-target.patch | 13 ++--
 ...at64-fstat64-ftruncate64mmap64-with-.patch | 64 -------------------
 .../numactl/Fix-the-test-output-format.patch  | 14 ++--
 meta/recipes-support/numactl/numactl_git.bb   |  6 +-
 5 files changed, 15 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
 delete mode 100644 meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch

diff --git a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch b/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
deleted file mode 100644
index 152eb2807b..0000000000
--- a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 61f910f5d12d6f6a66223b5af6d74e30ace3a2e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:10:37 -0800
-Subject: [PATCH] configure: Check for largefile support
-
-This helps in using 64bit versions of off_t related functions
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8510fc5..d74bc6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,9 @@ LT_INIT
- 
- AC_PROG_CC
- 
-+# Check for enabling LFS support
-+AC_SYS_LARGEFILE
-+
- # Override CFLAGS so that we can specify custom CFLAGS for numademo.
- AX_AM_OVERRIDE_VAR([CFLAGS])
- 
diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 9e65a45133..ac39e57c89 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,4 +1,7 @@
-rename test target as run-test
+From 54e497001237b6faca763a6e74e586bba63117f8 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 19 Oct 2020 14:42:11 -0700
+Subject: [PATCH] rename test target as run-test
 
 Upstream-Status: Pending
 
@@ -8,15 +11,16 @@ not suitable for cross-compile environment, so rename it as run-test.
 and define test target to compile the test files.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index b6db339..de176c4 100644
+index e84b21e..94a8bff 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
+@@ -126,7 +126,9 @@ regress2: $(check_PROGRAMS)
  test_numademo: numademo
  	./numademo -t -e 10M
  
@@ -27,6 +31,3 @@ index b6db339..de176c4 100644
  
  TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
  
--- 
-1.9.1
-
diff --git a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch b/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
deleted file mode 100644
index 03b98e0a2c..0000000000
--- a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8a08d3583d77bebeb1763fb9b378899201ce5afa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:11:13 -0800
-Subject: [PATCH] shm.c: Replace stat64/fstat64/ftruncate64mmap64 with normal functions
-
-These functions were needed when _FILE_OFFSET_BITS was not 64, using
-AC_SYS_LARGEFILE will detect it correctly and make the normal variants
-of these functions behave same as their *64 counterparts.
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- shm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/shm.c b/shm.c
-index 20537d9..5d0d1ab 100644
---- a/shm.c
-+++ b/shm.c
-@@ -24,8 +24,8 @@
- #include <sys/mman.h>
- #include <sys/ipc.h>
- #include <sys/shm.h>
--#include <sys/fcntl.h>
- #include <sys/stat.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <errno.h>
- #include <unistd.h>
-@@ -135,7 +135,7 @@ void attach_sysvshm(char *name, char *opt)
- /* Attach a shared memory file. */
- void attach_shared(char *name, char *opt)
- {
--	struct stat64 st;
-+	struct stat st;
- 
- 	shmfd = open(name, O_RDWR);
- 	if (shmfd < 0) {
-@@ -146,14 +146,14 @@ void attach_shared(char *name, char *opt)
- 		if (shmfd < 0)
- 			nerror("cannot create file %s", name);
- 	}
--	if (fstat64(shmfd, &st) < 0)
-+	if (fstat(shmfd, &st) < 0)
- 		err("shm stat");
- 	/* the file size must be larger than mmap shmlen + shmoffset, otherwise SIGBUS
- 	 * will be caused when we access memory, because mmaped memory is no longer in
- 	 * the range of the file laster.
- 	 */
- 	if ((shmlen + shmoffset) > st.st_size) {
--		if (ftruncate64(shmfd, shmlen + shmoffset) < 0) {
-+		if (ftruncate(shmfd, shmlen + shmoffset) < 0) {
- 			/* XXX: we could do it by hand, but it would it
- 			   would be impossible to apply policy then.
- 			   need to fix that in the kernel. */
-@@ -168,7 +168,7 @@ void attach_shared(char *name, char *opt)
- 
- 	/* RED-PEN For shmlen > address space may need to map in pieces.
- 	   Left for some poor 32bit soul. */
--	shmptr = mmap64(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
-+	shmptr = mmap(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
- 	if (shmptr == (char*)-1)
- 		err("shm mmap");
- }
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index a7bc8d322e..e3341d624e 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From 135ab48060b1350b661e9f0bc46bcfc70563ea11 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,24 +8,25 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
  2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/test/regress b/test/regress
-index 2ce1705..d086a47 100755
+index f06b22f..2fdfacb 100755
 --- a/test/regress
 +++ b/test/regress
-@@ -74,6 +74,7 @@ probe_hardware()
+@@ -78,6 +78,7 @@ probe_hardware()
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
 +	    echo "SKIP: numa regress"
-	    exit 77  # Skip test
+ 	    exit 77  # Skip test
  	fi
  }
-@@ -207,10 +208,9 @@ main()
+@@ -209,10 +210,9 @@ main()
  	rm A B
  
  	if [ "$EXIT" = 0 ] ; then
@@ -60,6 +61,3 @@ index aa6ea41..450c510 100755
  }
  
  # still broken
--- 
-1.8.4.2
-
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 0f71258bc3..bc5b09fc82 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,16 +10,14 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
-PV = "2.0.16"
+SRCREV = "c1165896572b74e971d817909bf652066ddf801a"
+PV = "2.0.17"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
            file://0001-define-run-test-target.patch \
-           file://0001-configure-Check-for-largefile-support.patch \
-           file://0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============1753848115565886528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-numactl-upgrade-2.0.16-2.0.17.patch"

RnJvbSA5ZTFmOThlODFkZTdkZGU4YTE5ZDM2MGEzZjAxZWJjZGM3NGUwYTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzo1MTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG51
bWFjdGw6IHVwZ3JhZGUgMi4wLjE2IC0+IDIuMC4xNwoKLS0tCiAuLi5vbmZpZ3VyZS1DaGVjay1m
b3ItbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2ggfCAyNyAtLS0tLS0tLQogLi4uL251bWFjdGwvMDAw
MS1kZWZpbmUtcnVuLXRlc3QtdGFyZ2V0LnBhdGNoIHwgMTMgKystLQogLi4uYXQ2NC1mc3RhdDY0
LWZ0cnVuY2F0ZTY0bW1hcDY0LXdpdGgtLnBhdGNoIHwgNjQgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL251bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggIHwgMTQgKystLQog
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsX2dpdC5iYiAgIHwgIDYgKy0KIDUg
ZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC8wMDAxLWNv
bmZpZ3VyZS1DaGVjay1mb3ItbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2gKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGwvMDAwMi1zaG0uYy1SZXBs
YWNlLXN0YXQ2NC1mc3RhdDY0LWZ0cnVuY2F0ZTY0bW1hcDY0LXdpdGgtLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDEtY29uZmlndXJl
LUNoZWNrLWZvci1sYXJnZWZpbGUtc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L251bWFjdGwvbnVtYWN0bC8wMDAxLWNvbmZpZ3VyZS1DaGVjay1mb3ItbGFyZ2VmaWxlLXN1cHBv
cnQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDE1MmViMjgwN2IuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDEtY29u
ZmlndXJlLUNoZWNrLWZvci1sYXJnZWZpbGUtc3VwcG9ydC5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDI3ICswLDAgQEAKLUZyb20gNjFmOTEwZjVkMTJkNmY2YTY2MjIzYjVhZjZkNzRlMzBhY2Uz
YTJlMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci1EYXRlOiBUaHUsIDE1IERlYyAyMDIyIDEyOjEwOjM3IC0wODAwCi1TdWJqZWN0
OiBbUEFUQ0hdIGNvbmZpZ3VyZTogQ2hlY2sgZm9yIGxhcmdlZmlsZSBzdXBwb3J0Ci0KLVRoaXMg
aGVscHMgaW4gdXNpbmcgNjRiaXQgdmVyc2lvbnMgb2Ygb2ZmX3QgcmVsYXRlZCBmdW5jdGlvbnMK
LQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL251bWFjdGwv
bnVtYWN0bC9wdWxsLzE1OV0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+Ci0tLS0KLSBjb25maWd1cmUuYWMgfCAzICsrKwotIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggODUxMGZjNS4uZDc0YmM2ZSAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIv
Y29uZmlndXJlLmFjCi1AQCAtMTQsNiArMTQsOSBAQCBMVF9JTklUCi0gCi0gQUNfUFJPR19DQwot
IAotKyMgQ2hlY2sgZm9yIGVuYWJsaW5nIExGUyBzdXBwb3J0Ci0rQUNfU1lTX0xBUkdFRklMRQot
KwotICMgT3ZlcnJpZGUgQ0ZMQUdTIHNvIHRoYXQgd2UgY2FuIHNwZWNpZnkgY3VzdG9tIENGTEFH
UyBmb3IgbnVtYWRlbW8uCi0gQVhfQU1fT1ZFUlJJREVfVkFSKFtDRkxBR1NdKQotIApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDEtZGVmaW5lLXJ1
bi10ZXN0LXRhcmdldC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0
bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0Y2gKaW5kZXggOWU2NWE0NTEzMy4uYWMz
OWU1N2M4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3Rs
LzAwMDEtZGVmaW5lLXJ1bi10ZXN0LXRhcmdldC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9udW1hY3RsL251bWFjdGwvMDAwMS1kZWZpbmUtcnVuLXRlc3QtdGFyZ2V0LnBhdGNoCkBA
IC0xLDQgKzEsNyBAQAotcmVuYW1lIHRlc3QgdGFyZ2V0IGFzIHJ1bi10ZXN0CitGcm9tIDU0ZTQ5
NzAwMTIzN2I2ZmFjYTc2M2E2ZTc0ZTU4NmJiYTYzMTE3ZjggTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CitEYXRlOiBNb24s
IDE5IE9jdCAyMDIwIDE0OjQyOjExIC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIHJlbmFtZSB0ZXN0
IHRhcmdldCBhcyBydW4tdGVzdAogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIApAQCAtOCwx
NSArMTEsMTYgQEAgbm90IHN1aXRhYmxlIGZvciBjcm9zcy1jb21waWxlIGVudmlyb25tZW50LCBz
byByZW5hbWUgaXQgYXMgcnVuLXRlc3QuCiBhbmQgZGVmaW5lIHRlc3QgdGFyZ2V0IHRvIGNvbXBp
bGUgdGhlIHRlc3QgZmlsZXMuCiAKIFNpZ25lZC1vZmYtYnk6IFJveSBMaSA8cm9uZ3FpbmcubGlA
d2luZHJpdmVyLmNvbT4KKwogLS0tCiAgTWFrZWZpbGUuYW0gfCA0ICsrKy0KICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtl
ZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBiNmRiMzM5Li5kZTE3NmM0IDEwMDY0NAoraW5k
ZXggZTg0YjIxZS4uOTRhOGJmZiAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtl
ZmlsZS5hbQotQEAgLTEyNCw3ICsxMjQsOSBAQCByZWdyZXNzMjogJChjaGVja19QUk9HUkFNUykK
K0BAIC0xMjYsNyArMTI2LDkgQEAgcmVncmVzczI6ICQoY2hlY2tfUFJPR1JBTVMpCiAgdGVzdF9u
dW1hZGVtbzogbnVtYWRlbW8KICAJLi9udW1hZGVtbyAtdCAtZSAxME0KICAKQEAgLTI3LDYgKzMx
LDMgQEAgaW5kZXggYjZkYjMzOS4uZGUxNzZjNCAxMDA2NDQKICAKICBURVNUU19FTlZJUk9OTUVO
VCA9IGJ1aWxkZGlyPSckKGJ1aWxkZGlyKSc7IGV4cG9ydCBidWlsZGRpcjsKICAKLS0tIAotMS45
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAw
MDItc2htLmMtUmVwbGFjZS1zdGF0NjQtZnN0YXQ2NC1mdHJ1bmNhdGU2NG1tYXA2NC13aXRoLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC8wMDAyLXNobS5jLVJl
cGxhY2Utc3RhdDY0LWZzdGF0NjQtZnRydW5jYXRlNjRtbWFwNjQtd2l0aC0ucGF0Y2gKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAzYjk4ZTBhMmMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDItc2htLmMtUmVwbGFjZS1zdGF0
NjQtZnN0YXQ2NC1mdHJ1bmNhdGU2NG1tYXA2NC13aXRoLS5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDY0ICswLDAgQEAKLUZyb20gOGEwOGQzNTgzZDc3YmViZWIxNzYzZmI5YjM3ODg5OTIwMWNl
NWFmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci1EYXRlOiBUaHUsIDE1IERlYyAyMDIyIDEyOjExOjEzIC0wODAwCi1TdWJqZWN0
OiBbUEFUQ0hdIHNobS5jOiBSZXBsYWNlIHN0YXQ2NC9mc3RhdDY0L2Z0cnVuY2F0ZTY0bW1hcDY0
IHdpdGggbm9ybWFsIGZ1bmN0aW9ucwotCi1UaGVzZSBmdW5jdGlvbnMgd2VyZSBuZWVkZWQgd2hl
biBfRklMRV9PRkZTRVRfQklUUyB3YXMgbm90IDY0LCB1c2luZwotQUNfU1lTX0xBUkdFRklMRSB3
aWxsIGRldGVjdCBpdCBjb3JyZWN0bHkgYW5kIG1ha2UgdGhlIG5vcm1hbCB2YXJpYW50cwotb2Yg
dGhlc2UgZnVuY3Rpb25zIGJlaGF2ZSBzYW1lIGFzIHRoZWlyICo2NCBjb3VudGVycGFydHMuCi0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9udW1hY3RsL251
bWFjdGwvcHVsbC8xNTldCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgotLS0tCi0gc2htLmMgfCAxMCArKysrKy0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NobS5jIGIvc2htLmMK
LWluZGV4IDIwNTM3ZDkuLjVkMGQxYWIgMTAwNjQ0Ci0tLS0gYS9zaG0uYwotKysrIGIvc2htLmMK
LUBAIC0yNCw4ICsyNCw4IEBACi0gI2luY2x1ZGUgPHN5cy9tbWFuLmg+Ci0gI2luY2x1ZGUgPHN5
cy9pcGMuaD4KLSAjaW5jbHVkZSA8c3lzL3NobS5oPgotLSNpbmNsdWRlIDxzeXMvZmNudGwuaD4K
LSAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KLSsjaW5jbHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSA8
c3RkYXJnLmg+Ci0gI2luY2x1ZGUgPGVycm5vLmg+Ci0gI2luY2x1ZGUgPHVuaXN0ZC5oPgotQEAg
LTEzNSw3ICsxMzUsNyBAQCB2b2lkIGF0dGFjaF9zeXN2c2htKGNoYXIgKm5hbWUsIGNoYXIgKm9w
dCkKLSAvKiBBdHRhY2ggYSBzaGFyZWQgbWVtb3J5IGZpbGUuICovCi0gdm9pZCBhdHRhY2hfc2hh
cmVkKGNoYXIgKm5hbWUsIGNoYXIgKm9wdCkKLSB7Ci0tCXN0cnVjdCBzdGF0NjQgc3Q7Ci0rCXN0
cnVjdCBzdGF0IHN0OwotIAotIAlzaG1mZCA9IG9wZW4obmFtZSwgT19SRFdSKTsKLSAJaWYgKHNo
bWZkIDwgMCkgewotQEAgLTE0NiwxNCArMTQ2LDE0IEBAIHZvaWQgYXR0YWNoX3NoYXJlZChjaGFy
ICpuYW1lLCBjaGFyICpvcHQpCi0gCQlpZiAoc2htZmQgPCAwKQotIAkJCW5lcnJvcigiY2Fubm90
IGNyZWF0ZSBmaWxlICVzIiwgbmFtZSk7Ci0gCX0KLS0JaWYgKGZzdGF0NjQoc2htZmQsICZzdCkg
PCAwKQotKwlpZiAoZnN0YXQoc2htZmQsICZzdCkgPCAwKQotIAkJZXJyKCJzaG0gc3RhdCIpOwot
IAkvKiB0aGUgZmlsZSBzaXplIG11c3QgYmUgbGFyZ2VyIHRoYW4gbW1hcCBzaG1sZW4gKyBzaG1v
ZmZzZXQsIG90aGVyd2lzZSBTSUdCVVMKLSAJICogd2lsbCBiZSBjYXVzZWQgd2hlbiB3ZSBhY2Nl
c3MgbWVtb3J5LCBiZWNhdXNlIG1tYXBlZCBtZW1vcnkgaXMgbm8gbG9uZ2VyIGluCi0gCSAqIHRo
ZSByYW5nZSBvZiB0aGUgZmlsZSBsYXN0ZXIuCi0gCSAqLwotIAlpZiAoKHNobWxlbiArIHNobW9m
ZnNldCkgPiBzdC5zdF9zaXplKSB7Ci0tCQlpZiAoZnRydW5jYXRlNjQoc2htZmQsIHNobWxlbiAr
IHNobW9mZnNldCkgPCAwKSB7Ci0rCQlpZiAoZnRydW5jYXRlKHNobWZkLCBzaG1sZW4gKyBzaG1v
ZmZzZXQpIDwgMCkgewotIAkJCS8qIFhYWDogd2UgY291bGQgZG8gaXQgYnkgaGFuZCwgYnV0IGl0
IHdvdWxkIGl0Ci0gCQkJICAgd291bGQgYmUgaW1wb3NzaWJsZSB0byBhcHBseSBwb2xpY3kgdGhl
bi4KLSAJCQkgICBuZWVkIHRvIGZpeCB0aGF0IGluIHRoZSBrZXJuZWwuICovCi1AQCAtMTY4LDcg
KzE2OCw3IEBAIHZvaWQgYXR0YWNoX3NoYXJlZChjaGFyICpuYW1lLCBjaGFyICpvcHQpCi0gCi0g
CS8qIFJFRC1QRU4gRm9yIHNobWxlbiA+IGFkZHJlc3Mgc3BhY2UgbWF5IG5lZWQgdG8gbWFwIGlu
IHBpZWNlcy4KLSAJICAgTGVmdCBmb3Igc29tZSBwb29yIDMyYml0IHNvdWwuICovCi0tCXNobXB0
ciA9IG1tYXA2NChOVUxMLCBzaG1sZW4sIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsIE1BUF9TSEFS
RUQsIHNobWZkLCBzaG1vZmZzZXQpOwotKwlzaG1wdHIgPSBtbWFwKE5VTEwsIHNobWxlbiwgUFJP
VF9SRUFEIHwgUFJPVF9XUklURSwgTUFQX1NIQVJFRCwgc2htZmQsIHNobW9mZnNldCk7Ci0gCWlm
IChzaG1wdHIgPT0gKGNoYXIqKS0xKQotIAkJZXJyKCJzaG0gbW1hcCIpOwotIH0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC9GaXgtdGhlLXRlc3Qtb3V0
cHV0LWZvcm1hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC9G
aXgtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5wYXRjaAppbmRleCBhN2JjOGQzMjJlLi5lMzM0MWQ2
MjRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGwvRml4
LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bnVtYWN0bC9udW1hY3RsL0ZpeC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA1OWZkNzUwYTg0YmJlNTg3NGRlYzkzNmQyYmVlOWVmMTFhMWI2NTA1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMzVhYjQ4MDYwYjEzNTBiNjYxZTlmMGJjNDZi
Y2ZjNzA1NjNlYTExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTGkgeGluIDxsaXhp
bi5mbnN0QGNuLmZ1aml0c3UuY29tPgogRGF0ZTogVHVlLCAyMSBKdWwgMjAxNSAwMjowMToyMiAr
MDkwMAogU3ViamVjdDogW1BBVENIXSBGaXggdGhlIHRlc3Qgb3V0cHV0IGZvcm1hdApAQCAtOCwy
NCArOCwyNSBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IFJveSBM
aSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIFNpZ25lZC1vZmYtYnk6IExpIFhpbiA8bGl4
aW4uZm5zdEBjbi5mdWppdHN1LmNvbT4KIFNpZ25lZC1vZmYtYnk6IFhpYW5neXUgQ2hlbiA8eGlh
bmd5dS5jaGVuQHdpbmRyaXZlci5jb20+CisKIC0tLQogIHRlc3QvcmVncmVzcyAgfCAgNiArKyst
LS0KICB0ZXN0L3JlZ3Jlc3MyIHwgMTEgKysrKystLS0tLS0KICAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3QvcmVncmVz
cyBiL3Rlc3QvcmVncmVzcwotaW5kZXggMmNlMTcwNS4uZDA4NmE0NyAxMDA3NTUKK2luZGV4IGYw
NmIyMmYuLjJmZGZhY2IgMTAwNzU1CiAtLS0gYS90ZXN0L3JlZ3Jlc3MKICsrKyBiL3Rlc3QvcmVn
cmVzcwotQEAgLTc0LDYgKzc0LDcgQEAgcHJvYmVfaGFyZHdhcmUoKQorQEAgLTc4LDYgKzc4LDcg
QEAgcHJvYmVfaGFyZHdhcmUoKQogIAlpZiBbICRudW1ub2RlcyAtbHQgMiBdIDsgdGhlbgogIAkg
ICAgZWNobyAibmVlZCBhdCBsZWFzdCB0d28gbm9kZXMgd2l0aCBhdCBsZWFzdCAkTkVFRFBBR0VT
IGVhY2ggb2YiCiAgCSAgICBlY2hvICJmcmVlIG1lbW9yeSBmb3IgbWVtcG9saWN5IHJlZ3Jlc3Np
b24gdGVzdHMiCiArCSAgICBlY2hvICJTS0lQOiBudW1hIHJlZ3Jlc3MiCi0JICAgIGV4aXQgNzcg
ICMgU2tpcCB0ZXN0CisgCSAgICBleGl0IDc3ICAjIFNraXAgdGVzdAogIAlmaQogIH0KLUBAIC0y
MDcsMTAgKzIwOCw5IEBAIG1haW4oKQorQEAgLTIwOSwxMCArMjEwLDkgQEAgbWFpbigpCiAgCXJt
IEEgQgogIAogIAlpZiBbICIkRVhJVCIgPSAwIF0gOyB0aGVuCkBAIC02MCw2ICs2MSwzIEBAIGlu
ZGV4IGFhNmVhNDEuLjQ1MGM1MTAgMTAwNzU1CiAgfQogIAogICMgc3RpbGwgYnJva2VuCi0tLSAK
LTEuOC40LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1h
Y3RsX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIK
aW5kZXggMGY3MTI1OGJjMy4uYmM1YjA5ZmM4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbnVtYWN0bC9udW1hY3RsX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9u
dW1hY3RsL251bWFjdGxfZ2l0LmJiCkBAIC0xMCwxNiArMTAsMTQgQEAgaW5oZXJpdCBhdXRvdG9v
bHMtYnJva2Vuc2VwIHB0ZXN0CiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRS5t
ZDtiZWdpbmxpbmU9MTk7ZW5kbGluZT0zMjttZDU9OWYzNGMzYWY0ZWQ2ZjNmNWRmMGRhNWYzYzA4
MzVhNDMiCiAKLVNSQ1JFViA9ICIxMDI4NWYxYTFiYWQ0OTMwNjgzOWIyYzQ2MzkzNjQ2MGI2MDRl
M2VhIgotUFYgPSAiMi4wLjE2IgorU1JDUkVWID0gImMxMTY1ODk2NTcyYjc0ZTk3MWQ4MTc5MDli
ZjY1MjA2NmRkZjgwMWEiCitQViA9ICIyLjAuMTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9udW1hY3RsL251bWFjdGw7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAg
ICAgICAgIGZpbGU6Ly9GaXgtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly9NYWtlZmlsZSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1kZWZpbmUtcnVuLXRlc3QtdGFyZ2V0LnBhdGNoIFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLUNoZWNrLWZvci1sYXJnZWZpbGUtc3VwcG9ydC5w
YXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAyLXNobS5jLVJlcGxhY2Utc3RhdDY0LWZzdGF0
NjQtZnRydW5jYXRlNjRtbWFwNjQtd2l0aC0ucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFMgPSAi
JHtXT1JLRElSfS9naXQiCi0tIAoyLjQyLjAKCg==

--===============1753848115565886528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/numactl/numactl-dbg: RRECOMMENDS: added "libatomic-dbg"
packages/core2-64-poky-linux/numactl/numactl-dev: RRECOMMENDS: added "libatomic-dev"
packages/core2-64-poky-linux/numactl/numactl: RDEPENDS: added "libatomic (['>= 13.2.0'])"

--===============1753848115565886528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/numactl: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl: SRC_URI changed from "git://github.com/numactl/numactl;branch=master;protocol=https file://Fix-the-test-output-format.patch file://Makefile file://run-ptest file://0001-define-run-test-target.patch file://0001-configure-Check-for-largefile-support.patch file://0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch" to "git://github.com/numactl/numactl;branch=master;protocol=https file://Fix-the-test-output-format.patch file://Makefile file://run-ptest file://0001-define-run-test-target.patch"
packages/core2-64-poky-linux/numactl: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-dbg: RRECOMMENDS: added "libatomic-dbg"
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGSIZE changed from 726640 to 737576 (+2%)
packages/core2-64-poky-linux/numactl/numactl-dbg: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-dev: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-dev: RRECOMMENDS: added "libatomic-dev"
packages/core2-64-poky-linux/numactl/numactl-dev: PKGSIZE changed from 17156 to 17244 (+1%)
packages/core2-64-poky-linux/numactl/numactl-dev: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-doc: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-doc: PKGSIZE changed from 56282 to 56714 (+1%)
packages/core2-64-poky-linux/numactl/numactl-doc: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-locale: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-locale: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-ptest: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-ptest: PKGSIZE changed from 247491 to 251439 (+2%)
packages/core2-64-poky-linux/numactl/numactl-ptest: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-src: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-src: PKGSIZE changed from 237683 to 243844 (+3%)
packages/core2-64-poky-linux/numactl/numactl-src: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl-staticdev: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl-staticdev: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl: PKGV changed from 2.0.16 [default] to 2.0.17 [default]
packages/core2-64-poky-linux/numactl/numactl: PKGSIZE changed from 210624 to 219008 (+4%)
packages/core2-64-poky-linux/numactl/numactl: PV changed from "2.0.16" to "2.0.17"
packages/core2-64-poky-linux/numactl/numactl: RDEPENDS: added "libatomic (['>= 13.2.0'])"

--===============1753848115565886528==--

