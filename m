Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id C05527E5E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 18:42:59 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 623AC258AA4;
	Thu, 20 Jun 2019 14:43:00 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id nunwloj3qosi; Thu, 20 Jun 2019 14:42:59 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 28AAD258A9F;
	Thu, 20 Jun 2019 14:42:59 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 28AAD258A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1561056179;
	bh=2feTHOLN2k5f6Y2aDhZhEgEl229RrLJP2TG4kOUmDzU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=sYespquM+Enp7dFoDRMRX0XsnIFBNphg2Qvb8FSG0ee+iAUAeHQ85rjw3penBt+5q
	P49CjyGNpTwUcvyzhpyhIL345MCtXRXdHnM5R2uY+veiCGcAz9FmxrZ/awvp5e9EpD
	HfuvIqqAwg4nWZnPLnQ7w+yotRpOtSjfu1PEto4Z8efwwEHqNhGEPFLJGdr1/+MNBs
	BnDgjZdvDRO/1krdNzszBs6qZqtFM9CdN2FP1jPTeJsP/4UBiSw+lDKz3DD+hfjRO3
	V33Y+EMNo+ZxgHeEWbfElfdKdMIZPSZKnna6YLI0F5FrEBGJyzKPwgO+ReVM4b02Z/
	qyeuVnAJXOdow==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 5B5PC7UY7rJE; Thu, 20 Jun 2019 14:42:59 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id EC74B258A9A;
	Thu, 20 Jun 2019 14:42:58 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 18:42:39 +0000
Message-Id: <20190620184239.4636-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: update to 2.10.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2019 18:43:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove upstreamed patches.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...nk-libpause_consumer-on-liblttng-ctl.patch |  35 --
 ...01-Skip-when-testapp-is-not-present.patch} |   0
 ...tng-modules-presence-before-testing.patch} |   0
 ...st_getcpu_override-on-single-thread-.patch |  52 ---
 ...e-tree-origin-can-be-a-symlink-itsel.patch |  80 ----
 ...be-to-test-for-the-presence-of-lttng.patch | 176 ---------
 ...sts-check-for-lttng-modules-presence.patch |  28 --
 ...tgrnam-is-not-MT-Safe-use-getgrnam_r.patch | 347 ------------------
 ...-tools_2.10.6.bb =3D> lttng-tools_2.10.7.bb} |  14 +-
 9 files changed, 4 insertions(+), 728 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-=
link-libpause_consumer-on-liblttng-ctl.patch
 rename meta/recipes-kernel/lttng/lttng-tools/{0004-Skip-when-testapp-is-=
not-present.patch =3D> 0001-Skip-when-testapp-is-not-present.patch} (100%=
)
 rename meta/recipes-kernel/lttng/lttng-tools/{0008-Fix-check-for-lttng-m=
odules-presence-before-testing.patch =3D> 0002-Fix-check-for-lttng-module=
s-presence-before-testing.patch} (100%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-s=
kip-test_getcpu_override-on-single-thread-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-u=
nit-the-tree-origin-can-be-a-symlink-itsel.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-=
modprobe-to-test-for-the-presence-of-lttng.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0006-Tests-chec=
k-for-lttng-modules-presence.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrn=
am-is-not-MT-Safe-use-getgrnam_r.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.10.6.bb =3D> lttng-tools=
_2.10.7.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-link-li=
bpause_consumer-on-liblttng-ctl.patch b/meta/recipes-kernel/lttng/lttng-t=
ools/0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.patch
deleted file mode 100644
index df18dc842b..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-link-libpause_=
consumer-on-liblttng-ctl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7244eac44be929fabd6ed1333f96929ef8da564f Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Tue, 19 Mar 2019 17:56:49 +0000
-Subject: [PATCH] fix: tests: link libpause_consumer on liblttng-ctl
-
-This preload test library uses symbols from liblttng-ctl which are
-resolved when preloaded by GLIBC but not by MUSL.
-
-Upstream-Status: Accepted [f667fbd7f8b9512f9943edb2597c226fcc424ee9]
-Backported to 2.11 and 2.10.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
----
- tests/regression/tools/notification/Makefile.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/regression/tools/notification/Makefile.am b/tests/reg=
ression/tools/notification/Makefile.am
-index 41adc69..a352bb8 100644
---- a/tests/regression/tools/notification/Makefile.am
-+++ b/tests/regression/tools/notification/Makefile.am
-@@ -20,7 +20,10 @@ FORCE_SHARED_LIB_OPTIONS =3D -module -shared -avoid-v=
ersion \
- 			   -rpath $(abs_builddir)
-=20
- libpause_consumer_la_SOURCES =3D consumer_testpoints.c
--libpause_consumer_la_LIBADD =3D $(top_builddir)/src/common/libcommon.la=
 $(DL_LIBS)
-+libpause_consumer_la_LIBADD =3D \
-+     $(top_builddir)/src/common/libcommon.la \
-+     $(top_builddir)/src/lib/lttng-ctl/liblttng-ctl.la \
-+     $(DL_LIBS)
- libpause_consumer_la_LDFLAGS =3D $(FORCE_SHARED_LIB_OPTIONS)
- noinst_LTLIBRARIES =3D libpause_consumer.la
-=20
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0004-Skip-when-testapp=
-is-not-present.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Skip-w=
hen-testapp-is-not-present.patch
similarity index 100%
rename from meta/recipes-kernel/lttng/lttng-tools/0004-Skip-when-testapp-=
is-not-present.patch
rename to meta/recipes-kernel/lttng/lttng-tools/0001-Skip-when-testapp-is=
-not-present.patch
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-ltt=
ng-modules-presence-before-testing.patch b/meta/recipes-kernel/lttng/lttn=
g-tools/0002-Fix-check-for-lttng-modules-presence-before-testing.patch
similarity index 100%
rename from meta/recipes-kernel/lttng/lttng-tools/0008-Fix-check-for-lttn=
g-modules-presence-before-testing.patch
rename to meta/recipes-kernel/lttng/lttng-tools/0002-Fix-check-for-lttng-=
modules-presence-before-testing.patch
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-skip-tes=
t_getcpu_override-on-single-thread-.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0002-Fix-test-skip-test_getcpu_override-on-single-thread-.patch
deleted file mode 100644
index 5bb88d21e5..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-skip-test_getcp=
u_override-on-single-thread-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e7db27668a9d7fd279d45bc43f3a2d5847374e7b Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Tue, 12 Mar 2019 12:04:58 -0400
-Subject: [PATCH lttng-tools 1/2] Fix: test: skip test_getcpu_override on
- single thread system
-
-There is no value in performing this test on single thread system
-since the only valid value for the cpu field is 0.
-
-This test currently fails on single thread system (i.e yocto runquemu)
-on the test_getcpu_override_fail test case.
-
-Upstream-Status: Accepted [f87d0ca370c17b597762f5ee218f0e821ed2452d]
-Backported to 2.11 and 2.10
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
----
- .../ust/getcpu-override/test_getcpu_override     | 16 +++++++++++-----
- 1 file changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/tests/regression/ust/getcpu-override/test_getcpu_override b=
/tests/regression/ust/getcpu-override/test_getcpu_override
-index 4ca385aeb..ee3e31953 100755
---- a/tests/regression/ust/getcpu-override/test_getcpu_override
-+++ b/tests/regression/ust/getcpu-override/test_getcpu_override
-@@ -157,13 +157,19 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ -x "$CURDIR/.libs/lttng-ust-getcpu-override-test.so" ]; then
--	foundobj=3D1
--else
--	foundobj=3D0
-+if [ ! -x "$CURDIR/.libs/lttng-ust-getcpu-override-test.so" ]; then
-+	skip 0 "No shared object generated. Skipping all tests." $NUM_TESTS &&=
 exit 0
-+fi
-+
-+if [ "$num_cpus" -eq "1" ]; then
-+	# Skip the test since we cannot perform it as designed since N mod 1
-+	# is always equals to zero. There is no point testing this on a system
-+	# with a single thread. LTTng-UST limits the get_cpu function to retur=
n
-+	# value inside the [0, NUM_CPU - 1] range for a valid event (present i=
n
-+	# trace).
-+	skip 0 "Test system only have a single thread. Skipping all tests." $N=
UM_TESTS && exit 0
- fi
-=20
--skip $foundobj "No shared object generated. Skipping all tests." $NUM_T=
ESTS && exit 0
-=20
- TESTS=3D(
- 	test_getcpu_override_fail
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-unit-the=
-tree-origin-can-be-a-symlink-itsel.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-itsel.patch
deleted file mode 100644
index 822b26a367..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-unit-the-tree-o=
rigin-can-be-a-symlink-itsel.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 83d165442d1c3658b6bafa28ddade8ffee7092ad Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Wed, 6 Mar 2019 16:46:49 -0500
-Subject: [PATCH lttng-tools 2/2] Fix: test: unit: the tree origin can be=
 a
- symlink itself
-
-Problem:
-
-The base tree is defined as "/tmp/.....XXXXXX".
-On systems where "/tmp/" is itself a symlink utils_expand_path will
-expand the tree origin itself.
-
-For example on a base core-image-minimal Yocto build /tmp is a symlink
-to "/var/tmp", which is a symlink to "/var/volatile".
-
-utils_expand_path will return something like this for the symlink test:
-"/var/volative/.....XXXXXX/...." which is the valid result.
-
-Solution:
-
-Simply use realpath on the tree_origin and use this path to perform the
-test validation.
-
-This work was performed in the effort to support yocto fully and be able
-to run the test suite to detect problem as early as possible.
-
-
-Upstream-Status: Accepted [f66e964a2e0c75f5e1a55fbcc963b1c5e2b4519d]
-Backported to 2.11 and 2.10
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
----
- tests/unit/test_utils_expand_path.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/tests/unit/test_utils_expand_path.c b/tests/unit/test_utils=
_expand_path.c
-index d5cab002e..d047c207d 100644
---- a/tests/unit/test_utils_expand_path.c
-+++ b/tests/unit/test_utils_expand_path.c
-@@ -281,8 +281,8 @@ error:
- static void test_utils_expand_path(void)
- {
- 	char *result;
--	char name[100], tmppath[PATH_MAX];
--	int i;
-+	char name[100], tmppath[PATH_MAX], real_tree_origin[PATH_MAX];
-+	int i, treelen;
-=20
- 	/* Test valid cases */
- 	for (i =3D 0; i < num_valid_tests; i++) {
-@@ -295,14 +295,24 @@ static void test_utils_expand_path(void)
- 		free(result);
- 	}
-=20
-+	/*
-+	 * Get the realpath for the tree_origin since it can itself be a
-+	 * symlink.
-+	 */
-+	result =3D realpath(tree_origin, real_tree_origin);
-+	if (!result) {
-+		fail("realpath failed.");
-+		return;
-+	}
-+
- 	/* Test symlink tree cases */
--	int treelen =3D strlen(tree_origin) + 1;
-+	treelen =3D strlen(real_tree_origin) + 1;
- 	for (i =3D 0; i < num_symlink_tests; i++) {
- 		sprintf(name, "symlink tree test case: [tmppath/]%s",
- 				symlink_tests_inputs[i].input);
-=20
- 		snprintf(tmppath, PATH_MAX, "%s/%s",
--				tree_origin, symlink_tests_inputs[i].input);
-+				real_tree_origin, symlink_tests_inputs[i].input);
- 		result =3D utils_expand_path(tmppath);
- 		ok(result !=3D NULL && strcmp(result + treelen,
- 					symlink_tests_inputs[i].expected_result) =3D=3D 0, name);
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-modprob=
e-to-test-for-the-presence-of-lttng.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch
deleted file mode 100644
index 16df3e610a..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-modprobe-to-te=
st-for-the-presence-of-lttng.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 9bc81a446d0a3ea9a884739eee48d3f14db3283c Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Wed, 28 Mar 2018 15:21:26 -0400
-Subject: [PATCH lttng-tools] Tests: use modprobe to test for the presenc=
e of
- lttng-modules
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [28702730192ae1ded06105c54c5dc]
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
----
- tests/regression/tools/regen-metadata/test_kernel      |  8 ++------
- tests/regression/tools/regen-statedump/test_kernel     |  7 +------
- tests/regression/tools/snapshots/test_kernel           |  9 +++------
- tests/regression/tools/snapshots/test_kernel_streaming |  8 ++------
- tests/regression/tools/streaming/test_kernel           |  8 ++------
- tests/utils/utils.sh                                   | 10 ++++++++++
- 6 files changed, 20 insertions(+), 30 deletions(-)
-
-diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/r=
egression/tools/regen-metadata/test_kernel
-index fd139aeef..1849b9cd0 100755
---- a/tests/regression/tools/regen-metadata/test_kernel
-+++ b/tests/regression/tools/regen-metadata/test_kernel
-@@ -28,12 +28,6 @@ NUM_TESTS=3D18
-=20
- source $TESTDIR/utils/utils.sh
-=20
--# LTTng kernel modules check
--out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
--if [ -z "$out" ]; then
--	BAIL_OUT "LTTng modules not detected."
--fi
--
- function lttng_create_session_uri
- {
- 	# Create session with default path
-@@ -91,6 +85,8 @@ fi
-=20
- skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
- {
-+	validate_lttng_modules_present
-+
- 	start_lttng_relayd "-o $TRACE_PATH"
- 	start_lttng_sessiond
- 	modprobe lttng-test
-diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/=
regression/tools/regen-statedump/test_kernel
-index 85afe76a1..50054eb07 100755
---- a/tests/regression/tools/regen-statedump/test_kernel
-+++ b/tests/regression/tools/regen-statedump/test_kernel
-@@ -29,12 +29,6 @@ NUM_TESTS=3D11
-=20
- source $TESTDIR/utils/utils.sh
-=20
--# LTTng kernel modules check
--out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
--if [ -z "$out" ]; then
--	BAIL_OUT "LTTng modules not detected."
--fi
--
- function test_kernel_local ()
- {
- 	diag "Test kernel local with statedump regeneration"
-@@ -64,6 +58,7 @@ fi
-=20
- skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
- {
-+	validate_lttng_modules_present
- 	start_lttng_sessiond
- 	modprobe lttng-test
-=20
-diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regres=
sion/tools/snapshots/test_kernel
-index 886c4557a..ff563100b 100755
---- a/tests/regression/tools/snapshots/test_kernel
-+++ b/tests/regression/tools/snapshots/test_kernel
-@@ -29,12 +29,6 @@ NUM_TESTS=3D2060
-=20
- source $TESTDIR/utils/utils.sh
-=20
--# LTTng kernel modules check
--out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
--if [ -z "$out" ]; then
--	BAIL_OUT "LTTng modules not detected."
--fi
--
- function test_kernel_local_snapshot ()
- {
- 	diag "Test local kernel snapshots"
-@@ -241,6 +235,9 @@ fi
-=20
- skip $isroot "Root access is needed. Skipping all kernel snapshot tests=
." $NUM_TESTS ||
- {
-+
-+	validate_lttng_modules_present
-+
- 	start_lttng_sessiond
-=20
- 	#tests=3D( test_kernel_1000_local_snapshots )
-diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/te=
sts/regression/tools/snapshots/test_kernel_streaming
-index 7b96ef270..1d97519aa 100755
---- a/tests/regression/tools/snapshots/test_kernel_streaming
-+++ b/tests/regression/tools/snapshots/test_kernel_streaming
-@@ -29,12 +29,6 @@ NUM_TESTS=3D61
-=20
- source $TESTDIR/utils/utils.sh
-=20
--# LTTng kernel modules check
--out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
--if [ -z "$out" ]; then
--	BAIL_OUT "LTTng modules not detected."
--fi
--
- function snapshot_add_output ()
- {
- 	local sess_name=3D$1
-@@ -169,6 +163,8 @@ fi
-=20
- skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
- {
-+	validate_lttng_modules_present
-+
- 	start_lttng_relayd "-o $TRACE_PATH"
- 	start_lttng_sessiond
-=20
-diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regres=
sion/tools/streaming/test_kernel
-index d54bcedf5..6bb23d9f5 100755
---- a/tests/regression/tools/streaming/test_kernel
-+++ b/tests/regression/tools/streaming/test_kernel
-@@ -28,12 +28,6 @@ NUM_TESTS=3D10
-=20
- source $TESTDIR/utils/utils.sh
-=20
--# LTTng kernel modules check
--out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
--if [ -z "$out" ]; then
--	BAIL_OUT "LTTng modules not detected."
--fi
--
- function lttng_create_session_uri
- {
- 	# Create session with default path
-@@ -80,6 +74,8 @@ fi
-=20
- skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
- {
-+	validate_lttng_modules_present
-+
- 	start_lttng_relayd "-o $TRACE_PATH"
- 	start_lttng_sessiond
-=20
-diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index af63824ce..26e59e383 100644
---- a/tests/utils/utils.sh
-+++ b/tests/utils/utils.sh
-@@ -125,6 +125,16 @@ function conf_proc_count()
- 	echo
- }
-=20
-+# Check if base lttng-modules are present.
-+# Bail out on failure
-+function validate_lttng_modules_present ()
-+{
-+	modprobe -n lttng-tracer 2>/dev/null
-+	if [ $? -ne 0  ]; then
-+		BAIL_OUT "LTTng modules not detected."
-+	fi
-+}
-+
- function enable_kernel_lttng_event
- {
- 	local withtap=3D"$1"
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-l=
ttng-modules-presence.patch b/meta/recipes-kernel/lttng/lttng-tools/0006-=
Tests-check-for-lttng-modules-presence.patch
deleted file mode 100644
index 30aa66b2c8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-mo=
dules-presence.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 92f93238f1df005aadc98e105c0dd0e04a5955a7 Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Mon, 25 Mar 2019 14:24:51 -0400
-Subject: [2/2] tests: check for lttng-modules presence
-
-Upstream-Status: Accepted [5da3fc8579a9f93ea4767729a107784bf2d034ae]
-Backported to 2.11 and 2.10
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
----
- tests/regression/tools/notification/test_notification_kernel | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l b/tests/regression/tools/notification/test_notification_kernel
-index 6d7f256ae..e7368df26 100755
---- a/tests/regression/tools/notification/test_notification_kernel
-+++ b/tests/regression/tools/notification/test_notification_kernel
-@@ -108,6 +108,7 @@ function kernel_test
- }
-=20
- if [ "$(id -u)" =3D=3D "0" ]; then
-+	validate_lttng_modules_present
- 	kernel_test
- else
- 	# Kernel tests are skipped.
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrnam-is-n=
ot-MT-Safe-use-getgrnam_r.patch b/meta/recipes-kernel/lttng/lttng-tools/0=
007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch
deleted file mode 100644
index a3362ea247..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrnam-is-not-MT-S=
afe-use-getgrnam_r.patch
+++ /dev/null
@@ -1,347 +0,0 @@
-From 10e8001ad876d8cb3b5a17c7492e713bbc047975 Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Thu, 28 Mar 2019 18:31:29 -0400
-Subject: [PATCH] Fix: getgrnam is not MT-Safe, use getgrnam_r
-
-Running the test suite under a Yocto musl build resulted in musl
-coredump due to double freeing.
-
-We get the following backtraces:
-
-0  a_crash () at ./arch/x86_64/atomic_arch.h:108
-1  unmap_chunk (self=3D<optimized out>) at src/malloc/malloc.c:515
-2  free (p=3D<optimized out>) at src/malloc/malloc.c:526
-3  0x00007f46d9dc3849 in __getgrent_a (f=3Df@entry=3D0x7f46d9d1f7e0, gr=3D=
gr@entry=3D0x7f46d9e24460 <gr>, line=3Dline@entry=3D0x7f46d9e26058 <line>=
, size=3Dsize@entry=3D0x7f46d92db550, mem=3Dmem@entry=3D0x7f46d9e26050 <m=
em>, nmem=3Dnmem@entry=3D0x7f46d92db558, res=3D0x7f46d92db548) at src/pas=
swd/getgrent_a.c:45
-4  0x00007f46d9dc2e6b in __getgr_a (name=3D0x487242 "tracing", gid=3Dgid=
@entry=3D0, gr=3Dgr@entry=3D0x7f46d9e24460 <gr>, buf=3Dbuf@entry=3D0x7f46=
d9e26058 <line>, size=3Dsize@entry=3D0x7f46d92db550, mem=3Dmem@entry=3D0x=
7f46d9e26050 <mem>, nmem=3D0x7f46d92db558, res=3D0x7f46d92db548) at src/p=
asswd/getgr_a.c:30
-5  0x00007f46d9dc3733 in getgrnam (name=3D<optimized out>) at src/passwd=
/getgrent.c:37
-6  0x0000000000460b29 in utils_get_group_id (name=3D<optimized out>) at =
../../../lttng-tools-2.10.6/src/common/utils.c:1241
-7  0x000000000044ee69 in thread_manage_health (data=3D<optimized out>) a=
t ../../../../lttng-tools-2.10.6/src/bin/lttng-sessiond/main.c:4115
-8  0x00007f46d9de1541 in start (p=3D<optimized out>) at src/thread/pthre=
ad_create.c:195
-9  0x00007f46d9dee661 in __clone () at src/thread/x86_64/clone.s:22
-
-From another run:
-
-0  a_crash () at ./arch/x86_64/atomic_arch.h:108
-1  unmap_chunk (self=3D<optimized out>) at src/malloc/malloc.c:515
-2  free (p=3D<optimized out>) at src/malloc/malloc.c:526
-3  0x00007f5abc210849 in __getgrent_a (f=3Df@entry=3D0x7f5abc2733e0, gr=3D=
gr@entry=3D0x7f5abc271460 <gr>, line=3Dline@entry=3D0x7f5abc273058 <line>=
, size=3Dsize@entry=3D0x7f5abaef5510, mem=3Dmem@entry=3D0x7f5abc273050 <m=
em>, nmem=3Dnmem@entry=3D0x7f5abaef5518, res=3D0x7f5abaef5508) at src/pas=
swd/getgrent_a.c:45
-4  0x00007f5abc20fe6b in __getgr_a (name=3D0x487242 "tracing", gid=3Dgid=
@entry=3D0, gr=3Dgr@entry=3D0x7f5abc271460 <gr>, buf=3Dbuf@entry=3D0x7f5a=
bc273058 <line>, size=3Dsize@entry=3D0x7f5abaef5510, mem=3Dmem@entry=3D0x=
7f5abc273050 <mem>, nmem=3D0x7f5abaef5518, res=3D0x7f5abaef5508) at src/p=
asswd/getgr_a.c:30
-5  0x00007f5abc210733 in getgrnam (name=3D<optimized out>) at src/passwd=
/getgrent.c:37
-6  0x0000000000460b29 in utils_get_group_id (name=3D<optimized out>) at =
../../../lttng-tools-2.10.6/src/common/utils.c:1241
-7  0x000000000042dee4 in notification_channel_socket_create () at ../../=
../../lttng-tools-2.10.6/src/bin/lttng-sessiond/notification-thread.c:238
-8  init_thread_state (state=3D0x7f5abaef5560, handle=3D0x7f5abbf9be40) a=
t ../../../../lttng-tools-2.10.6/src/bin/lttng-sessiond/notification-thre=
ad.c:375
-9  thread_notification (data=3D0x7f5abbf9be40) at ../../../../lttng-tool=
s-2.10.6/src/bin/lttng-sessiond/notification-thread.c:495
-10 0x00007f5abc22e541 in start (p=3D<optimized out>) at src/thread/pthre=
ad_create.c:195
-11 0x00007f5abc23b661 in __clone () at src/thread/x86_64/clone.s:22
-
-The problem was easily reproducible (~6 crash on ~300 runs). A prototype=
 fix
-using mutex around the getgrnam yielded no crash in over 1000 runs. This
-patch yielded the same results as the prototype fix.
-
-Unfortunately we cannot rely on a mutex in liblttng-ctl since we cannot
-enforce the locking for the application using the lib.
-
-Use getgrnam_r instead.
-
-The previous implementation of utils_get_group_id returned the gid of
-the root group (0) on error/not found. lttng_check_tracing_group needs
-to know if an error/not found occured, returning the root group is not
-enough. We now return the gid via the passed parameter. The caller is
-responsible for either defaulting to the root group or propagating the
-error.
-
-We also do not want to warn when used in liblttng-ctl context. We might
-want to move the warning elsewhere in the future. For now, pass a bool
-if we need to warn or not.
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-
-Upstream-Status: Submitted [https://patchwork.lttng.org/patch/2314703]
----
- src/bin/lttng-consumerd/health-consumerd.c   | 10 ++-
- src/bin/lttng-relayd/health-relayd.c         | 20 ++++--
- src/bin/lttng-sessiond/main.c                | 24 +++++--
- src/bin/lttng-sessiond/notification-thread.c | 10 ++-
- src/common/utils.c                           | 75 +++++++++++++++++---
- src/common/utils.h                           |  4 +-
- src/lib/lttng-ctl/lttng-ctl.c                |  8 +--
- 7 files changed, 122 insertions(+), 29 deletions(-)
-
-diff --git a/src/bin/lttng-consumerd/health-consumerd.c b/src/bin/lttng-=
consumerd/health-consumerd.c
-index 1e2f31e4..6045401a 100644
---- a/src/bin/lttng-consumerd/health-consumerd.c
-+++ b/src/bin/lttng-consumerd/health-consumerd.c
-@@ -184,8 +184,14 @@ void *thread_manage_health(void *data)
- 	is_root =3D !getuid();
- 	if (is_root) {
- 		/* lttng health client socket path permissions */
--		ret =3D chown(health_unix_sock_path, 0,
--				utils_get_group_id(tracing_group_name));
-+		gid_t gid;
-+
-+		ret =3D utils_get_group_id(tracing_group_name, true, &gid);
-+		if (ret) {
-+			gid =3D 0; /* Default to root group. */
-+		}
-+
-+		ret =3D chown(health_unix_sock_path, 0, gid);
- 		if (ret < 0) {
- 			ERR("Unable to set group on %s", health_unix_sock_path);
- 			PERROR("chown");
-diff --git a/src/bin/lttng-relayd/health-relayd.c b/src/bin/lttng-relayd=
/health-relayd.c
-index ba996621..962e88c4 100644
---- a/src/bin/lttng-relayd/health-relayd.c
-+++ b/src/bin/lttng-relayd/health-relayd.c
-@@ -105,8 +105,14 @@ static int create_lttng_rundir_with_perm(const char=
 *rundir)
- 		int is_root =3D !getuid();
-=20
- 		if (is_root) {
--			ret =3D chown(rundir, 0,
--					utils_get_group_id(tracing_group_name));
-+			gid_t gid;
-+
-+			ret =3D utils_get_group_id(tracing_group_name, true, &gid);
-+			if (ret) {
-+				gid =3D 0; /* Default to root group.*/
-+			}
-+
-+			ret =3D chown(rundir, 0, gid);
- 			if (ret < 0) {
- 				ERR("Unable to set group on %s", rundir);
- 				PERROR("chown");
-@@ -256,8 +262,14 @@ void *thread_manage_health(void *data)
- 	is_root =3D !getuid();
- 	if (is_root) {
- 		/* lttng health client socket path permissions */
--		ret =3D chown(health_unix_sock_path, 0,
--				utils_get_group_id(tracing_group_name));
-+		gid_t gid;
-+
-+		ret =3D utils_get_group_id(tracing_group_name, true, &gid);
-+		if (ret) {
-+			gid =3D 0; /* Default to root group */
-+		}
-+
-+		ret =3D chown(health_unix_sock_path, 0, gid);
- 		if (ret < 0) {
- 			ERR("Unable to set group on %s", health_unix_sock_path);
- 			PERROR("chown");
-diff --git a/src/bin/lttng-sessiond/main.c b/src/bin/lttng-sessiond/main=
.c
-index fa6fa483..49307064 100644
---- a/src/bin/lttng-sessiond/main.c
-+++ b/src/bin/lttng-sessiond/main.c
-@@ -4112,8 +4112,14 @@ static void *thread_manage_health(void *data)
-=20
- 	if (is_root) {
- 		/* lttng health client socket path permissions */
--		ret =3D chown(config.health_unix_sock_path.value, 0,
--				utils_get_group_id(config.tracing_group_name.value));
-+		gid_t gid;
-+
-+		ret =3D utils_get_group_id(config.tracing_group_name.value, true, &gi=
d);
-+		if (ret) {
-+			gid =3D 0; /* Default to root group */
-+		}
-+
-+		ret =3D chown(config.health_unix_sock_path.value, 0, &gid);
- 		if (ret < 0) {
- 			ERR("Unable to set group on %s", config.health_unix_sock_path.value)=
;
- 			PERROR("chown");
-@@ -5238,7 +5244,10 @@ static int set_permissions(char *rundir)
- 	int ret;
- 	gid_t gid;
-=20
--	gid =3D utils_get_group_id(config.tracing_group_name.value);
-+	ret =3D utils_get_group_id(config.tracing_group_name.value, true, &gid=
);
-+	if (ret) {
-+		gid =3D 0; /* Default to root group */
-+	}
-=20
- 	/* Set lttng run dir */
- 	ret =3D chown(rundir, 0, gid);
-@@ -5349,7 +5358,14 @@ static int set_consumer_sockets(struct consumer_d=
ata *consumer_data)
- 		goto error;
- 	}
- 	if (is_root) {
--		ret =3D chown(path, 0, utils_get_group_id(config.tracing_group_name.v=
alue));
-+		gid_t gid;
-+
-+		ret =3D utils_get_group_id(config.tracing_group_name.value, true, &gi=
d);
-+		if (ret) {
-+			gid =3D 0; /* Default to root group */
-+		}
-+
-+		ret =3D chown(path, 0, gid);
- 		if (ret < 0) {
- 			ERR("Unable to set group on %s", path);
- 			PERROR("chown");
-diff --git a/src/bin/lttng-sessiond/notification-thread.c b/src/bin/lttn=
g-sessiond/notification-thread.c
-index 92ac597f..18a264d9 100644
---- a/src/bin/lttng-sessiond/notification-thread.c
-+++ b/src/bin/lttng-sessiond/notification-thread.c
-@@ -235,8 +235,14 @@ int notification_channel_socket_create(void)
- 	}
-=20
- 	if (getuid() =3D=3D 0) {
--		ret =3D chown(sock_path, 0,
--				utils_get_group_id(config.tracing_group_name.value));
-+		gid_t gid;
-+
-+		ret =3D  utils_get_group_id(config.tracing_group_name.value, true, &g=
id);
-+		if (ret) {
-+			gid =3D 0; /* Default to root group. */
-+		}
-+
-+		ret =3D chown(sock_path, 0, gid);
- 		if (ret) {
- 			ERR("Failed to set the notification channel socket's group");
- 			ret =3D -1;
-diff --git a/src/common/utils.c b/src/common/utils.c
-index c0bb031e..778bc00f 100644
---- a/src/common/utils.c
-+++ b/src/common/utils.c
-@@ -1231,24 +1231,77 @@ size_t utils_get_current_time_str(const char *fo=
rmat, char *dst, size_t len)
- }
-=20
- /*
-- * Return the group ID matching name, else 0 if it cannot be found.
-+ * Return 0 on success and set *gid to the group_ID matching the passed=
 name.
-+ * Else -1 if it cannot be found or an error occurred.
-  */
- LTTNG_HIDDEN
--gid_t utils_get_group_id(const char *name)
-+int utils_get_group_id(const char *name, bool warn, gid_t *gid)
- {
--	struct group *grp;
-+	static volatile int warn_once;
-=20
--	grp =3D getgrnam(name);
--	if (!grp) {
--		static volatile int warn_once;
-+	int ret;
-+	long sys_len;
-+	size_t len;
-+	struct group grp;
-+	struct group *result;
-+	char *buffer =3D NULL;
-=20
--		if (!warn_once) {
--			WARN("No tracing group detected");
--			warn_once =3D 1;
-+	/* Get the system limit if it exists */
-+	sys_len =3D sysconf(_SC_GETGR_R_SIZE_MAX);
-+	if (sys_len =3D=3D -1) {
-+		len =3D 1024;
-+	} else {
-+		len =3D (size_t) sys_len;
-+	}
-+
-+	buffer =3D malloc(len);
-+	if (!buffer) {
-+		PERROR("getgrnam_r malloc");
-+		ret =3D -1;
-+		goto error;
-+	}
-+
-+	while ((ret =3D getgrnam_r(name, &grp, buffer, len, &result)) =3D=3D E=
RANGE)
-+	{
-+		/* Buffer is not big enough, increase its size. */
-+		size_t new_len =3D 2 * len;
-+		char *new_buffer =3D NULL;
-+		if (new_len < len) {
-+			ERR("getgrnam_r buffer size overflow");
-+			ret =3D -1;
-+			goto error;
-+		}
-+		len =3D new_len;
-+		new_buffer =3D realloc(buffer, len);
-+		if (!new_buffer) {
-+			PERROR("getgrnam_r realloc");
-+			ret =3D -1;
-+			goto error;
- 		}
--		return 0;
-+		buffer =3D new_buffer;
-+	}
-+	if (ret !=3D 0) {
-+		PERROR("getgrnam_r");
-+		ret =3D -1;
-+		goto error;
-+	}
-+
-+	/* Group not found. */
-+	if (!result) {
-+		ret =3D -1;
-+		goto error;
-+	}
-+
-+	*gid =3D result->gr_gid;
-+	ret =3D 0;
-+
-+error:
-+	free(buffer);
-+	if (ret && warn && !warn_once) {
-+		WARN("No tracing group detected");
-+		warn_once =3D 1;
- 	}
--	return grp->gr_gid;
-+	return ret;
- }
-=20
- /*
-diff --git a/src/common/utils.h b/src/common/utils.h
-index 18f19ef1..9c72431d 100644
---- a/src/common/utils.h
-+++ b/src/common/utils.h
-@@ -22,6 +22,8 @@
- #include <unistd.h>
- #include <stdint.h>
- #include <getopt.h>
-+#include <stdbool.h>
-+#include <sys/types.h>
-=20
- #define KIBI_LOG2 10
- #define MEBI_LOG2 20
-@@ -52,7 +54,7 @@ int utils_get_count_order_u64(uint64_t x);
- char *utils_get_home_dir(void);
- char *utils_get_user_home_dir(uid_t uid);
- size_t utils_get_current_time_str(const char *format, char *dst, size_t=
 len);
--gid_t utils_get_group_id(const char *name);
-+int utils_get_group_id(const char *name, bool warn, gid_t *gid);
- char *utils_generate_optstring(const struct option *long_options,
- 		size_t opt_count);
- int utils_create_lock_file(const char *filepath);
-diff --git a/src/lib/lttng-ctl/lttng-ctl.c b/src/lib/lttng-ctl/lttng-ctl=
.c
-index 2d84aad9..561b0bcf 100644
---- a/src/lib/lttng-ctl/lttng-ctl.c
-+++ b/src/lib/lttng-ctl/lttng-ctl.c
-@@ -208,15 +208,13 @@ end:
- LTTNG_HIDDEN
- int lttng_check_tracing_group(void)
- {
--	struct group *grp_tracing;	/* no free(). See getgrnam(3) */
--	gid_t *grp_list;
-+	gid_t *grp_list, tracing_gid;
- 	int grp_list_size, grp_id, i;
- 	int ret =3D -1;
- 	const char *grp_name =3D tracing_group;
-=20
- 	/* Get GID of group 'tracing' */
--	grp_tracing =3D getgrnam(grp_name);
--	if (!grp_tracing) {
-+	if (utils_get_group_id(grp_name, false, &tracing_gid)) {
- 		/* If grp_tracing is NULL, the group does not exist. */
- 		goto end;
- 	}
-@@ -241,7 +239,7 @@ int lttng_check_tracing_group(void)
- 	}
-=20
- 	for (i =3D 0; i < grp_list_size; i++) {
--		if (grp_list[i] =3D=3D grp_tracing->gr_gid) {
-+		if (grp_list[i] =3D=3D tracing_gid) {
- 			ret =3D 1;
- 			break;
- 		}
---=20
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recip=
es-kernel/lttng/lttng-tools_2.10.7.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
index 9583ee3abb..a01b6a43e3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
@@ -32,18 +32,12 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttn=
g-tools-${PV}.tar.bz2 \
            file://x32.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
-           file://0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.=
patch \
-           file://0002-Fix-test-skip-test_getcpu_override-on-single-thre=
ad-.patch \
-           file://0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-it=
sel.patch \
-           file://0004-Skip-when-testapp-is-not-present.patch\
-           file://0005-Tests-use-modprobe-to-test-for-the-presence-of-lt=
tng.patch \
-           file://0006-Tests-check-for-lttng-modules-presence.patch \
-           file://0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch =
\
-           file://0008-Fix-check-for-lttng-modules-presence-before-testi=
ng.patch \
+           file://0001-Skip-when-testapp-is-not-present.patch \
+           file://0002-Fix-check-for-lttng-modules-presence-before-testi=
ng.patch \
            "
=20
-SRC_URI[md5sum] =3D "e88c521b5da6bb48a8187af633336ecc"
-SRC_URI[sha256sum] =3D "f05df52bbebf8ce88d1b29e9e98cfc957d2ed738a3451180=
18237ebdb581537c"
+SRC_URI[md5sum] =3D "e7804d10e4cade381e241601f6047373"
+SRC_URI[sha256sum] =3D "ed71ebe00c5d985c74f30e97b614e909573cbd9276c85e05=
d9557a0b817a1312"
=20
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
=20
--=20
2.17.1


