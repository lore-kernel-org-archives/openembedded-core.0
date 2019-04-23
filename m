Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A87865CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:25:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r71so1553035iod.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9ds865jI6ejzqopxFherFvv/7xEu3+LyrjXlNengLtI=;
	b=1D06b0WI7L1/dTesmQlTIh9Z/lnSlIuzpwpzfY7qVMuQXVlbAFIAsKZBcJLR8u+V0J
	45qNJE5z/oh9s0IrBq8so+KJK9I+XUTLx4RbKdQ7HGYXwW3lgNJD8W7DDNSTB7nnU62I
	EujLC/VbkrQRwmXPFFCjMMU0mBVUAB/V0FDYxcjIHhGC4d9IjenidySeONKTyZZu8k+N
	gKffRLs7H2zzk5cLpyiKg6aLqVi5NG2K3Pb1J4qzCzHfwEU1fl/lipmZFrQwRPR/mpqv
	MiM93DWXD+EZWKslQ2GvJeJZ+IEfJ/ByqV0XRRN/yI6RbhB5d1W66U4cgA1O8C3uMNSO
	YcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9ds865jI6ejzqopxFherFvv/7xEu3+LyrjXlNengLtI=;
	b=VDEycNPmGrjgg3n4sPqTe1S9ksUyCTGtLGBHvuADmPeWrTBGFiNya2zfqNEDqD+l9V
	BxhpqRmJowu8fjkFdukAQDh2LKoG490CHpjalZUqoB5/HyqQIt1rGpMPKDGWR7Ow0W3l
	7mf0Zy2W0RY2bxYltSMfM97ma/yxPmB2j9bzsDeG0xDswO9T8bdVUYUgJWC1Cfl0OBvn
	LbBnsILGk5g9JauC5wZawmo0RBnRh79qaU+qfEo8juBjZStBXlSE3F8s53kOaljAY6XD
	BX4/ZMqHm6xqgNa4zjV6WFCf67kEY7GT5oAA7oaqbfAl1YqhoH2lCog1FA/noE771aaw
	E4aA==
X-Gm-Message-State: APjAAAU74GNUSly4ihYL16z0Axg0tfiXy9s3iij5P+xRd22TUrGbVztS
	Su13f/IncBmma5b5Mf6i/2gczxU43L6fvurlwg9hIXGqPGI=
X-Google-Smtp-Source: APXvYqzTIMhLdFdBmyujAuXnsdx2o8DMRRJqAu8P4lMJi6WbqYdWFg7h/+mWDf+1FIxOgINZZ81wHsddQrvN1S0qFjE=
X-Received: by 2002:a6b:8e05:: with SMTP id q5mr7250138iod.270.1556011545825; 
	Tue, 23 Apr 2019 02:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
In-Reply-To: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 10:25:32 +0100
Message-ID: <CAJTo0La4YqdHVeCoHjt4V2VtUoNb7CytKfhAmXr7+j6gdiERVQ@mail.gmail.com>
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] lttng-tools: improve ptest and test suite
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
X-List-Received-Date: Tue, 23 Apr 2019 09:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> 0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch
> Fixes a race found while testing OE built with musl. This is a legit
> bug. The fixes or a variant should be accepted soon.

This was missing the Upstream-Status tag.  Is there an upstream bug or
similar we can point at in an Upstream-Status for tracking?

Ross

On Thu, 4 Apr 2019 at 22:48, Jonathan Rajotte
<jonathan.rajotte-julien@efficios.com> wrote:
>
> Multiple patches are to be applied to improve the current ptest suite.
>
> 0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.patch
> 0002-Fix-test-skip-test_getcpu_override-on-single-thread-.patch
> 0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-itsel.patch
> 0006-Tests-check-for-lttng-modules-presence.patch
>
> All deal with problem in the test suite. Most of these are already
> accepted upstream and will be removed on the next recipe update.
>
> 0004-Skip-when-testapp-is-not-present.patch
>
> Is a OE specific fix that make sure that we skip the test if
> the test util application (event generator) is not present. We are
> still unsure on how (upstream) we are going to solve this problem. We
> already have this problem if a user build lttng without lttng-ust
> (--without-lttng-ust). We will most probably end up splitting each test
> into kernel and userspace tests and adjust the makefile accordingly.
> Another option is to probe lttng for enabled function at runtime.
>
> 0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch
>
> Is a requirement for 0006 that should be accepted upstream shorlty.
>
> 0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch
>
> Fixes a race found while testing OE built with musl. This is a legit
> bug. The fixes or a variant should be accepted soon.
>
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  ...nk-libpause_consumer-on-liblttng-ctl.patch |  35 +
>  ...st_getcpu_override-on-single-thread-.patch |  52 ++
>  ...e-tree-origin-can-be-a-symlink-itsel.patch |  80 +++
>  ...004-Skip-when-testapp-is-not-present.patch | 610 ++++++++++++++++++
>  ...be-to-test-for-the-presence-of-lttng.patch | 176 +++++
>  ...sts-check-for-lttng-modules-presence.patch |  28 +
>  ...tgrnam-is-not-MT-Safe-use-getgrnam_r.patch | 345 ++++++++++
>  .../lttng/lttng-tools_2.10.6.bb               |   9 +-
>  8 files changed, 1334 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-=
link-libpause_consumer-on-liblttng-ctl.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-s=
kip-test_getcpu_override-on-single-thread-.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-u=
nit-the-tree-origin-can-be-a-symlink-itsel.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0004-Skip-when-=
testapp-is-not-present.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-=
modprobe-to-test-for-the-presence-of-lttng.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0006-Tests-chec=
k-for-lttng-modules-presence.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrn=
am-is-not-MT-Safe-use-getgrnam_r.patch
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-link-li=
bpause_consumer-on-liblttng-ctl.patch b/meta/recipes-kernel/lttng/lttng-too=
ls/0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.patch
> new file mode 100644
> index 0000000000..df18dc842b
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-tests-link-libpause_=
consumer-on-liblttng-ctl.patch
> @@ -0,0 +1,35 @@
> +From 7244eac44be929fabd6ed1333f96929ef8da564f Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Tue, 19 Mar 2019 17:56:49 +0000
> +Subject: [PATCH] fix: tests: link libpause_consumer on liblttng-ctl
> +
> +This preload test library uses symbols from liblttng-ctl which are
> +resolved when preloaded by GLIBC but not by MUSL.
> +
> +Upstream-Status: Accepted [f667fbd7f8b9512f9943edb2597c226fcc424ee9]
> +Backported to 2.11 and 2.10.
> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +---
> + tests/regression/tools/notification/Makefile.am | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/regression/tools/notification/Makefile.am b/tests/reg=
ression/tools/notification/Makefile.am
> +index 41adc69..a352bb8 100644
> +--- a/tests/regression/tools/notification/Makefile.am
> ++++ b/tests/regression/tools/notification/Makefile.am
> +@@ -20,7 +20,10 @@ FORCE_SHARED_LIB_OPTIONS =3D -module -shared -avoid-v=
ersion \
> +                          -rpath $(abs_builddir)
> +
> + libpause_consumer_la_SOURCES =3D consumer_testpoints.c
> +-libpause_consumer_la_LIBADD =3D $(top_builddir)/src/common/libcommon.la=
 $(DL_LIBS)
> ++libpause_consumer_la_LIBADD =3D \
> ++     $(top_builddir)/src/common/libcommon.la \
> ++     $(top_builddir)/src/lib/lttng-ctl/liblttng-ctl.la \
> ++     $(DL_LIBS)
> + libpause_consumer_la_LDFLAGS =3D $(FORCE_SHARED_LIB_OPTIONS)
> + noinst_LTLIBRARIES =3D libpause_consumer.la
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-skip-tes=
t_getcpu_override-on-single-thread-.patch b/meta/recipes-kernel/lttng/lttng=
-tools/0002-Fix-test-skip-test_getcpu_override-on-single-thread-.patch
> new file mode 100644
> index 0000000000..5bb88d21e5
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-test-skip-test_getcp=
u_override-on-single-thread-.patch
> @@ -0,0 +1,52 @@
> +From e7db27668a9d7fd279d45bc43f3a2d5847374e7b Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Tue, 12 Mar 2019 12:04:58 -0400
> +Subject: [PATCH lttng-tools 1/2] Fix: test: skip test_getcpu_override on
> + single thread system
> +
> +There is no value in performing this test on single thread system
> +since the only valid value for the cpu field is 0.
> +
> +This test currently fails on single thread system (i.e yocto runquemu)
> +on the test_getcpu_override_fail test case.
> +
> +Upstream-Status: Accepted [f87d0ca370c17b597762f5ee218f0e821ed2452d]
> +Backported to 2.11 and 2.10
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +---
> + .../ust/getcpu-override/test_getcpu_override     | 16 +++++++++++-----
> + 1 file changed, 11 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/regression/ust/getcpu-override/test_getcpu_override b=
/tests/regression/ust/getcpu-override/test_getcpu_override
> +index 4ca385aeb..ee3e31953 100755
> +--- a/tests/regression/ust/getcpu-override/test_getcpu_override
> ++++ b/tests/regression/ust/getcpu-override/test_getcpu_override
> +@@ -157,13 +157,19 @@ plan_tests $NUM_TESTS
> +
> + print_test_banner "$TEST_DESC"
> +
> +-if [ -x "$CURDIR/.libs/lttng-ust-getcpu-override-test.so" ]; then
> +-      foundobj=3D1
> +-else
> +-      foundobj=3D0
> ++if [ ! -x "$CURDIR/.libs/lttng-ust-getcpu-override-test.so" ]; then
> ++      skip 0 "No shared object generated. Skipping all tests." $NUM_TES=
TS && exit 0
> ++fi
> ++
> ++if [ "$num_cpus" -eq "1" ]; then
> ++      # Skip the test since we cannot perform it as designed since N mo=
d 1
> ++      # is always equals to zero. There is no point testing this on a s=
ystem
> ++      # with a single thread. LTTng-UST limits the get_cpu function to =
return
> ++      # value inside the [0, NUM_CPU - 1] range for a valid event (pres=
ent in
> ++      # trace).
> ++      skip 0 "Test system only have a single thread. Skipping all tests=
." $NUM_TESTS && exit 0
> + fi
> +
> +-skip $foundobj "No shared object generated. Skipping all tests." $NUM_T=
ESTS && exit 0
> +
> + TESTS=3D(
> +       test_getcpu_override_fail
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-unit-the=
-tree-origin-can-be-a-symlink-itsel.patch b/meta/recipes-kernel/lttng/lttng=
-tools/0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-itsel.patch
> new file mode 100644
> index 0000000000..822b26a367
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0003-Fix-test-unit-the-tree-o=
rigin-can-be-a-symlink-itsel.patch
> @@ -0,0 +1,80 @@
> +From 83d165442d1c3658b6bafa28ddade8ffee7092ad Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Wed, 6 Mar 2019 16:46:49 -0500
> +Subject: [PATCH lttng-tools 2/2] Fix: test: unit: the tree origin can be=
 a
> + symlink itself
> +
> +Problem:
> +
> +The base tree is defined as "/tmp/.....XXXXXX".
> +On systems where "/tmp/" is itself a symlink utils_expand_path will
> +expand the tree origin itself.
> +
> +For example on a base core-image-minimal Yocto build /tmp is a symlink
> +to "/var/tmp", which is a symlink to "/var/volatile".
> +
> +utils_expand_path will return something like this for the symlink test:
> +"/var/volative/.....XXXXXX/...." which is the valid result.
> +
> +Solution:
> +
> +Simply use realpath on the tree_origin and use this path to perform the
> +test validation.
> +
> +This work was performed in the effort to support yocto fully and be able
> +to run the test suite to detect problem as early as possible.
> +
> +
> +Upstream-Status: Accepted [f66e964a2e0c75f5e1a55fbcc963b1c5e2b4519d]
> +Backported to 2.11 and 2.10
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +---
> + tests/unit/test_utils_expand_path.c | 18 ++++++++++++++----
> + 1 file changed, 14 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/unit/test_utils_expand_path.c b/tests/unit/test_utils=
_expand_path.c
> +index d5cab002e..d047c207d 100644
> +--- a/tests/unit/test_utils_expand_path.c
> ++++ b/tests/unit/test_utils_expand_path.c
> +@@ -281,8 +281,8 @@ error:
> + static void test_utils_expand_path(void)
> + {
> +       char *result;
> +-      char name[100], tmppath[PATH_MAX];
> +-      int i;
> ++      char name[100], tmppath[PATH_MAX], real_tree_origin[PATH_MAX];
> ++      int i, treelen;
> +
> +       /* Test valid cases */
> +       for (i =3D 0; i < num_valid_tests; i++) {
> +@@ -295,14 +295,24 @@ static void test_utils_expand_path(void)
> +               free(result);
> +       }
> +
> ++      /*
> ++       * Get the realpath for the tree_origin since it can itself be a
> ++       * symlink.
> ++       */
> ++      result =3D realpath(tree_origin, real_tree_origin);
> ++      if (!result) {
> ++              fail("realpath failed.");
> ++              return;
> ++      }
> ++
> +       /* Test symlink tree cases */
> +-      int treelen =3D strlen(tree_origin) + 1;
> ++      treelen =3D strlen(real_tree_origin) + 1;
> +       for (i =3D 0; i < num_symlink_tests; i++) {
> +               sprintf(name, "symlink tree test case: [tmppath/]%s",
> +                               symlink_tests_inputs[i].input);
> +
> +               snprintf(tmppath, PATH_MAX, "%s/%s",
> +-                              tree_origin, symlink_tests_inputs[i].inpu=
t);
> ++                              real_tree_origin, symlink_tests_inputs[i]=
.input);
> +               result =3D utils_expand_path(tmppath);
> +               ok(result !=3D NULL && strcmp(result + treelen,
> +                                       symlink_tests_inputs[i].expected_=
result) =3D=3D 0, name);
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0004-Skip-when-testapp=
-is-not-present.patch b/meta/recipes-kernel/lttng/lttng-tools/0004-Skip-whe=
n-testapp-is-not-present.patch
> new file mode 100644
> index 0000000000..6c9f7e462c
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0004-Skip-when-testapp-is-not=
-present.patch
> @@ -0,0 +1,610 @@
> +From 95c27e6acceaeda55c729b9e92e594322adef13f Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Wed, 3 Apr 2019 16:31:18 -0400
> +Subject: [PATCH lttng-tools] Skip when testapp is not present
> +
> +We expect lttng-ust do be present, this is a wrong assumptions.
> +
> +This is a quick fix. The real fix is to either detect at runtime
> +lttng-ust support or at build time (HAVE_LIBLTTNG_UST_CTL).
> +
> +This prevent hang for make check done on a build configured with
> +--without-lttng-ust.
> +
> +Upstream-Status: Inappropriate [other]
> +Reason: This patch is inappropriate for upstream for 2.10 stable release
> +since we do not backport "superficial" fix to the test suite. We do
> +backport when a test is broken. The fact that on --without-lttng-ust
> +hang is not a "broken" test per-see. Still, a variation of this fix will
> +be upstreamed in our master branch and possibly 2.11. The upstreamed
> +version will split the test in kernel/ust test and skip them at the
> +build system level. This patch is more succinct.
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +---
> + tests/regression/tools/crash/test_crash       |  4 ++
> + .../regression/tools/exclusion/test_exclusion |  4 ++
> + .../tools/filtering/test_valid_filter         | 21 ++++--
> + tests/regression/tools/health/test_thread_ok  | 29 +++++---
> + tests/regression/tools/live/Makefile.am       |  2 -
> + tests/regression/tools/live/test_lttng_ust    |  4 ++
> + tests/regression/tools/live/test_ust          |  4 ++
> + .../tools/live/test_ust_tracefile_count       |  4 ++
> + tests/regression/tools/mi/test_mi             |  4 ++
> + .../notification/test_notification_multi_app  | 18 +++--
> + .../tools/notification/test_notification_ust  |  4 ++
> + .../regression/tools/regen-metadata/test_ust  |  2 +-
> + .../regression/tools/regen-statedump/test_ust |  2 +-
> + .../regression/tools/save-load/test_autoload  |  7 ++
> + tests/regression/tools/save-load/test_load    |  8 +++
> + tests/regression/tools/save-load/test_save    |  7 ++
> + .../regression/tools/snapshots/test_ust_fast  |  2 +-
> + .../regression/tools/snapshots/test_ust_long  |  2 +-
> + .../tools/snapshots/test_ust_streaming        |  2 +-
> + tests/regression/tools/snapshots/ust_test     |  2 +-
> + .../streaming/test_high_throughput_limits     |  2 +-
> + tests/regression/tools/streaming/test_ust     |  2 +-
> + .../tracefile-limits/test_tracefile_count     |  2 +-
> + .../tracefile-limits/test_tracefile_size      |  2 +-
> + .../tools/wildcard/test_event_wildcard        | 67 ++++++++++---------
> + 25 files changed, 147 insertions(+), 60 deletions(-)
> +
> +diff --git a/tests/regression/tools/crash/test_crash b/tests/regression/=
tools/crash/test_crash
> +index 8c62c513d..3cbe97688 100755
> +--- a/tests/regression/tools/crash/test_crash
> ++++ b/tests/regression/tools/crash/test_crash
> +@@ -35,6 +35,10 @@ NUM_TESTS=3D77
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + # Global declaration for simplification
> + LTTNG_CRASH=3D$TESTDIR/../src/bin/lttng-crash/$CRASH_BIN
> +
> +diff --git a/tests/regression/tools/exclusion/test_exclusion b/tests/reg=
ression/tools/exclusion/test_exclusion
> +index 949cd41df..42e4d72fb 100755
> +--- a/tests/regression/tools/exclusion/test_exclusion
> ++++ b/tests/regression/tools/exclusion/test_exclusion
> +@@ -30,6 +30,10 @@ NUM_TESTS=3D149
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + function enable_ust_lttng_all_event_exclusion()
> + {
> +       sess_name=3D"$1"
> +diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/=
regression/tools/filtering/test_valid_filter
> +index 163b32182..1e8da630b 100755
> +--- a/tests/regression/tools/filtering/test_valid_filter
> ++++ b/tests/regression/tools/filtering/test_valid_filter
> +@@ -418,12 +418,18 @@ issue_356_filter+=3D"intfield > 4 && intfield > 5 =
&& "
> + issue_356_filter+=3D"intfield > 6 && intfield > 7 && "
> + issue_356_filter+=3D"intfield > 8 || intfield > 0"
> +
> ++BIN_NAME=3D"gen-ust-events"
> ++
> ++skip_ust=3D1
> ++if [ ! -x "$CURDIR/$BIN_NAME" ]; then
> ++      skip_ust=3D0
> ++      skip 0 "No UST nevents binary detected." $NUM_UST_TESTS
> ++fi
> ++
> + start_lttng_sessiond
> +
> + ### UST TESTS
> +
> +-BIN_NAME=3D"gen-ust-events"
> +-
> + KIRK_KRAUSS_TESTS=3D(
> +       # the tests below were written by Kirk Krauss in this article:
> +       # http://www.drdobbs.com/architecture-and-design/matching-wildcar=
ds-an-empirical-way-to-t/240169123
> +@@ -897,9 +903,6 @@ UST_STR_FILTERS=3D(
> +       END
> + )
> +
> +-if [ ! -x "$CURDIR/$BIN_NAME" ]; then
> +-      BAIL_OUT "No UST nevents binary detected."
> +-fi
> +
> + IFS=3D"$OLDIFS"
> +
> +@@ -910,6 +913,10 @@ i=3D0
> + while true; do
> +       validator=3D"${UST_FILTERS[$i]}"
> +
> ++      if [ $skip_ust -eq 0 ]; then
> ++              break
> ++      fi
> ++
> +       if [ "$validator" =3D END ]; then
> +               break
> +       fi
> +@@ -929,6 +936,10 @@ i=3D0
> + while true; do
> +       validator=3D"${UST_STR_FILTERS[$i]}"
> +
> ++      if [ $skip_ust -eq 0 ]; then
> ++              break
> ++      fi
> ++
> +       if [ "$validator" =3D END ]; then
> +               break
> +       fi
> +diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regres=
sion/tools/health/test_thread_ok
> +index e81d6ed24..849b7e71f 100755
> +--- a/tests/regression/tools/health/test_thread_ok
> ++++ b/tests/regression/tools/health/test_thread_ok
> +@@ -27,6 +27,9 @@ CHANNEL_NAME=3D"testchan"
> + HEALTH_CHECK_BIN=3D"health_check"
> + NUM_TESTS=3D17
> + SLEEP_TIME=3D30
> ++TESTAPP_PATH=3D"$TESTDIR/utils/testapp"
> ++TESTAPP_NAME=3D"gen-ust-events"
> ++TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> +
> + source $TESTDIR/utils/utils.sh
> +
> +@@ -76,15 +79,19 @@ function test_thread_ok
> +       $CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
> +       report_errors
> +
> +-      diag "With UST consumer daemons"
> +-      create_lttng_session_no_output $SESSION_NAME
> +-      enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_=
NAME
> +-      start_lttng_tracing_ok $SESSION_NAME
> +-      destroy_lttng_session_ok $SESSION_NAME
> ++      skip $skip_ust "Ust does not seems to be supported" "5" ||
> ++      {
> ++              diag "With UST consumer daemons"
> ++              create_lttng_session_no_output $SESSION_NAME
> ++              enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $=
CHANNEL_NAME
> ++              start_lttng_tracing_ok $SESSION_NAME
> ++              destroy_lttng_session_ok $SESSION_NAME
> +
> +-      # Check health status
> +-      $CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
> +-      report_errors
> ++
> ++              # Check health status
> ++              $CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PA=
TH}
> ++              report_errors
> ++      }
> +
> +       skip $isroot "Root access is needed. Skipping kernel consumer hea=
lth check test." "5" ||
> +       {
> +@@ -141,6 +148,12 @@ else
> +       isroot=3D0
> + fi
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      skip_ust=3D0
> ++else
> ++      skip_ust=3D1
> ++fi
> ++
> + test_thread_ok
> +
> + rm -rf ${HEALTH_PATH}
> +diff --git a/tests/regression/tools/live/Makefile.am b/tests/regression/=
tools/live/Makefile.am
> +index 46186d383..db74de8d5 100644
> +--- a/tests/regression/tools/live/Makefile.am
> ++++ b/tests/regression/tools/live/Makefile.am
> +@@ -16,9 +16,7 @@ LIVE=3D$(top_builddir)/src/bin/lttng-sessiond/session.=
$(OBJEXT) \
> + noinst_PROGRAMS =3D live_test
> + EXTRA_DIST =3D test_kernel test_lttng_kernel
> +
> +-if HAVE_LIBLTTNG_UST_CTL
> + EXTRA_DIST +=3D test_ust test_ust_tracefile_count test_lttng_ust
> +-endif
> +
> + live_test_SOURCES =3D live_test.c
> + live_test_LDADD =3D $(LIBTAP) $(LIBCOMMON) $(LIBRELAYD) $(LIBSESSIOND_C=
OMM) \
> +diff --git a/tests/regression/tools/live/test_lttng_ust b/tests/regressi=
on/tools/live/test_lttng_ust
> +index 06017d01d..be9b3d7f7 100755
> +--- a/tests/regression/tools/live/test_lttng_ust
> ++++ b/tests/regression/tools/live/test_lttng_ust
> +@@ -38,6 +38,10 @@ NUM_TESTS=3D12
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + # MUST set TESTDIR before calling those functions
> + plan_tests $NUM_TESTS
> +
> +diff --git a/tests/regression/tools/live/test_ust b/tests/regression/too=
ls/live/test_ust
> +index 0384a706f..add521bfc 100755
> +--- a/tests/regression/tools/live/test_ust
> ++++ b/tests/regression/tools/live/test_ust
> +@@ -36,6 +36,10 @@ DIR=3D$(readlink -f $TESTDIR)
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + echo "$TEST_DESC"
> +
> + function setup_live_tracing()
> +diff --git a/tests/regression/tools/live/test_ust_tracefile_count b/test=
s/regression/tools/live/test_ust_tracefile_count
> +index 6da368fc6..10504f8c6 100755
> +--- a/tests/regression/tools/live/test_ust_tracefile_count
> ++++ b/tests/regression/tools/live/test_ust_tracefile_count
> +@@ -36,6 +36,10 @@ DIR=3D$(readlink -f $TESTDIR)
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + echo "$TEST_DESC"
> +
> + function setup_live_tracing()
> +diff --git a/tests/regression/tools/mi/test_mi b/tests/regression/tools/=
mi/test_mi
> +index 48dda7da6..2cc30b29a 100755
> +--- a/tests/regression/tools/mi/test_mi
> ++++ b/tests/regression/tools/mi/test_mi
> +@@ -61,6 +61,10 @@ NUM_TESTS=3D228
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + #Overwrite the lttng_bin to get mi output
> + LTTNG_BIN=3D"lttng --mi xml"
> +
> +diff --git a/tests/regression/tools/notification/test_notification_multi=
_app b/tests/regression/tools/notification/test_notification_multi_app
> +index 0a05ea6a0..29b0f62fa 100755
> +--- a/tests/regression/tools/notification/test_notification_multi_app
> ++++ b/tests/regression/tools/notification/test_notification_multi_app
> +@@ -52,6 +52,11 @@ plan_tests $NUM_TESTS
> +
> + print_test_banner "$TEST_DESC"
> +
> ++skip_ust=3D1
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      skip_ust=3D0
> ++fi
> ++
> + app_pids=3D()
> +
> + function kernel_event_generator_toogle_state
> +@@ -468,10 +473,15 @@ function test_on_register_evaluation ()
> + }
> +
> +
> +-TESTS=3D(
> +-      test_multi_app_ust
> +-      test_on_register_evaluation_ust
> +-)
> ++TESTS=3D()
> ++if [ $skip_ust -eq "1" ]; then
> ++      TESTS+=3D(
> ++              test_multi_app_ust
> ++              test_on_register_evaluation_ust
> ++      )
> ++else
> ++      skip 0 "No UST events binary detected." $NUM_TEST_UST
> ++fi
> +
> + if [ "$(id -u)" =3D=3D "0" ]; then
> +       TESTS+=3D(
> +diff --git a/tests/regression/tools/notification/test_notification_ust b=
/tests/regression/tools/notification/test_notification_ust
> +index 8941e476d..eb2e15cad 100755
> +--- a/tests/regression/tools/notification/test_notification_ust
> ++++ b/tests/regression/tools/notification/test_notification_ust
> +@@ -46,6 +46,10 @@ DIR=3D$(readlink -f $TESTDIR)
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + function ust_event_generator_toogle_state
> + {
> +       ust_event_generator_suspended=3D$((ust_event_generator_suspended=
=3D=3D0))
> +diff --git a/tests/regression/tools/regen-metadata/test_ust b/tests/regr=
ession/tools/regen-metadata/test_ust
> +index b7f1af1d8..312c8a40d 100755
> +--- a/tests/regression/tools/regen-metadata/test_ust
> ++++ b/tests/regression/tools/regen-metadata/test_ust
> +@@ -34,7 +34,7 @@ NUM_TESTS=3D33
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function lttng_create_session_uri
> +diff --git a/tests/regression/tools/regen-statedump/test_ust b/tests/reg=
ression/tools/regen-statedump/test_ust
> +index 486b9a560..8d455b26a 100755
> +--- a/tests/regression/tools/regen-statedump/test_ust
> ++++ b/tests/regression/tools/regen-statedump/test_ust
> +@@ -34,7 +34,7 @@ NUM_TESTS=3D11
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function test_ust_local ()
> +diff --git a/tests/regression/tools/save-load/test_autoload b/tests/regr=
ession/tools/save-load/test_autoload
> +index 7ee5e9906..ec376cfb3 100755
> +--- a/tests/regression/tools/save-load/test_autoload
> ++++ b/tests/regression/tools/save-load/test_autoload
> +@@ -21,6 +21,9 @@ CURDIR=3D$(dirname $0)/
> + CONFIG_DIR=3D"${CURDIR}/configuration"
> + TESTDIR=3D$CURDIR/../../../
> + export LTTNG_SESSION_CONFIG_XSD_PATH=3D$(readlink -m ${TESTDIR}../src/c=
ommon/config/)
> ++TESTAPP_PATH=3D"$TESTDIR/utils/testapp"
> ++TESTAPP_NAME=3D"gen-ust-events"
> ++TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> +
> + DIR=3D$(readlink -f $TESTDIR)
> +
> +@@ -28,6 +31,10 @@ NUM_TESTS=3D9
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + # MUST set TESTDIR before calling those functions
> + plan_tests $NUM_TESTS
> +
> +diff --git a/tests/regression/tools/save-load/test_load b/tests/regressi=
on/tools/save-load/test_load
> +index 5e38b46b6..b6fdd8192 100755
> +--- a/tests/regression/tools/save-load/test_load
> ++++ b/tests/regression/tools/save-load/test_load
> +@@ -20,6 +20,10 @@ TEST_DESC=3D"Load session(s)"
> + CURDIR=3D$(dirname $0)/
> + CONFIG_DIR=3D"${CURDIR}/configuration"
> + TESTDIR=3D$CURDIR/../../../
> ++TESTAPP_PATH=3D"$TESTDIR/utils/testapp"
> ++TESTAPP_NAME=3D"gen-ust-events"
> ++TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> ++
> + export LTTNG_SESSION_CONFIG_XSD_PATH=3D$(readlink -m ${TESTDIR}../src/c=
ommon/config/)
> +
> + SESSION_NAME=3D"load-42"
> +@@ -31,6 +35,10 @@ NUM_TESTS=3D67
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "$TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + # MUST set TESTDIR before calling those functions
> + plan_tests $NUM_TESTS
> +
> +diff --git a/tests/regression/tools/save-load/test_save b/tests/regressi=
on/tools/save-load/test_save
> +index c5f6b1341..cfaf67b7a 100755
> +--- a/tests/regression/tools/save-load/test_save
> ++++ b/tests/regression/tools/save-load/test_save
> +@@ -23,6 +23,9 @@ TESTDIR=3D$CURDIR/../../../
> + SESSION_NAME=3D"save-42"
> + CHANNEL_NAME=3D"chan-save"
> + EVENT_NAME=3D"tp:tptest"
> ++TESTAPP_PATH=3D"$TESTDIR/utils/testapp"
> ++TESTAPP_NAME=3D"gen-ust-events"
> ++TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> +
> + DIR=3D$(readlink -f $TESTDIR)
> +
> +@@ -30,6 +33,10 @@ NUM_TESTS=3D41
> +
> + source $TESTDIR/utils/utils.sh
> +
> ++if [ ! -x "TESTAPP_BIN" ]; then
> ++      plan_skip_all "No UST events binary detected."
> ++fi
> ++
> + # MUST set TESTDIR before calling those functions
> + plan_tests $NUM_TESTS
> +
> +diff --git a/tests/regression/tools/snapshots/test_ust_fast b/tests/regr=
ession/tools/snapshots/test_ust_fast
> +index edb435c52..5a68ec56d 100755
> +--- a/tests/regression/tools/snapshots/test_ust_fast
> ++++ b/tests/regression/tools/snapshots/test_ust_fast
> +@@ -23,7 +23,7 @@ TEST_BIN=3D"ust_test"
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$CURDIR/$TEST_BIN" ]; then
> +-      BAIL_OUT "No UST test found: $TEST_BIN"
> ++      plan_skip_all "No UST test found: $TEST_BIN"
> + fi
> +
> + ./$CURDIR/$TEST_BIN $NR_SNAPSHOT
> +diff --git a/tests/regression/tools/snapshots/test_ust_long b/tests/regr=
ession/tools/snapshots/test_ust_long
> +index 9e1a0c262..afa019f6a 100755
> +--- a/tests/regression/tools/snapshots/test_ust_long
> ++++ b/tests/regression/tools/snapshots/test_ust_long
> +@@ -23,7 +23,7 @@ TEST_BIN=3D"ust_test"
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$CURDIR/$TEST_BIN" ]; then
> +-      BAIL_OUT "No UST test found: $TEST_BIN"
> ++      plan_skip_all "No UST test found: $TEST_BIN"
> + fi
> +
> + ./$CURDIR/$TEST_BIN $NR_SNAPSHOT
> +diff --git a/tests/regression/tools/snapshots/test_ust_streaming b/tests=
/regression/tools/snapshots/test_ust_streaming
> +index 93b0957f3..69291ab4d 100755
> +--- a/tests/regression/tools/snapshots/test_ust_streaming
> ++++ b/tests/regression/tools/snapshots/test_ust_streaming
> +@@ -37,7 +37,7 @@ NUM_TESTS=3D75
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function snapshot_add_output ()
> +diff --git a/tests/regression/tools/snapshots/ust_test b/tests/regressio=
n/tools/snapshots/ust_test
> +index 755cef9e0..92f9f6cff 100755
> +--- a/tests/regression/tools/snapshots/ust_test
> ++++ b/tests/regression/tools/snapshots/ust_test
> +@@ -34,7 +34,7 @@ TRACE_PATH=3D$(mktemp -d)
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + # Need the number of snapshot to do.
> +diff --git a/tests/regression/tools/streaming/test_high_throughput_limit=
s b/tests/regression/tools/streaming/test_high_throughput_limits
> +index 32c3f1f2b..f54178923 100755
> +--- a/tests/regression/tools/streaming/test_high_throughput_limits
> ++++ b/tests/regression/tools/streaming/test_high_throughput_limits
> +@@ -38,7 +38,7 @@ NUM_TESTS=3D104
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function set_bw_limit
> +diff --git a/tests/regression/tools/streaming/test_ust b/tests/regressio=
n/tools/streaming/test_ust
> +index a5d5b5e92..e1dd98ee7 100755
> +--- a/tests/regression/tools/streaming/test_ust
> ++++ b/tests/regression/tools/streaming/test_ust
> +@@ -34,7 +34,7 @@ NUM_TESTS=3D16
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function lttng_create_session_uri
> +diff --git a/tests/regression/tools/tracefile-limits/test_tracefile_coun=
t b/tests/regression/tools/tracefile-limits/test_tracefile_count
> +index 6ada8580f..7553c7d1f 100755
> +--- a/tests/regression/tools/tracefile-limits/test_tracefile_count
> ++++ b/tests/regression/tools/tracefile-limits/test_tracefile_count
> +@@ -33,7 +33,7 @@ PAGE_SIZE=3D$(getconf PAGE_SIZE)
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function enable_lttng_channel_count_limit ()
> +diff --git a/tests/regression/tools/tracefile-limits/test_tracefile_size=
 b/tests/regression/tools/tracefile-limits/test_tracefile_size
> +index 3dddbe613..1089487ff 100755
> +--- a/tests/regression/tools/tracefile-limits/test_tracefile_size
> ++++ b/tests/regression/tools/tracefile-limits/test_tracefile_size
> +@@ -33,7 +33,7 @@ NUM_TESTS=3D66
> + source $TESTDIR/utils/utils.sh
> +
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST events binary detected."
> ++      plan_skip_all "No UST events binary detected."
> + fi
> +
> + function enable_lttng_channel_size_limit ()
> +diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests=
/regression/tools/wildcard/test_event_wildcard
> +index 61ea67a72..921a2301d 100755
> +--- a/tests/regression/tools/wildcard/test_event_wildcard
> ++++ b/tests/regression/tools/wildcard/test_event_wildcard
> +@@ -97,42 +97,47 @@ print_test_banner "$TEST_DESC"
> +
> + start_lttng_sessiond
> +
> +-diag "Test UST wildcard"
> +-
> + if [ ! -x "$TESTAPP_BIN" ]; then
> +-      BAIL_OUT "No UST nevents binary detected."
> ++      skip_ust=3D0
> ++else
> ++      skip_ust=3D1
> + fi
> +
> +-EVENT_NAME=3D"tp:tptest"
> ++skip $skip_ust "No UST nevents binary detected." $NUM_UST_TESTS ||
> ++{
> ++      diag "Test UST wildcard"
> +
> +-# non-matching
> +-test_event_wildcard ust 0 'tp:abc*'
> +-test_event_wildcard ust 0 '*abc'
> +-test_event_wildcard ust 0 '*z*'
> +-test_event_wildcard ust 0 '*\**'
> +-test_event_wildcard ust 0 '*\*'
> +-test_event_wildcard ust 0 '\**'
> +-test_event_wildcard ust 0 '*:*tpte*s'
> +-test_event_wildcard ust 0 'tp**tpTest'
> ++      EVENT_NAME=3D"tp:tptest"
> +
> +-# matching
> +-test_event_wildcard ust 1 'tp:tp*'
> +-test_event_wildcard ust 1 '*'
> +-test_event_wildcard ust 1 'tp:tptest*'
> +-test_event_wildcard ust 1 '**'
> +-test_event_wildcard ust 1 '***'
> +-test_event_wildcard ust 1 '*tptest'
> +-test_event_wildcard ust 1 '**tptest'
> +-test_event_wildcard ust 1 '*tpte*'
> +-test_event_wildcard ust 1 '*tp*'
> +-test_event_wildcard ust 1 '*tp**'
> +-test_event_wildcard ust 1 '*:*tptest'
> +-test_event_wildcard ust 1 '*:*tpte*t'
> +-test_event_wildcard ust 1 't*p*:*t*e*s*t'
> +-test_event_wildcard ust 1 '*t*p*:*t*e*s*t*'
> +-test_event_wildcard ust 1 'tp*tptest'
> +-test_event_wildcard ust 1 'tp**tptest'
> +-test_event_wildcard ust 1 'tp*test'
> ++      # non-matching
> ++      test_event_wildcard ust 0 'tp:abc*'
> ++      test_event_wildcard ust 0 '*abc'
> ++      test_event_wildcard ust 0 '*z*'
> ++      test_event_wildcard ust 0 '*\**'
> ++      test_event_wildcard ust 0 '*\*'
> ++      test_event_wildcard ust 0 '\**'
> ++      test_event_wildcard ust 0 '*:*tpte*s'
> ++      test_event_wildcard ust 0 'tp**tpTest'
> ++
> ++      # matching
> ++      test_event_wildcard ust 1 'tp:tp*'
> ++      test_event_wildcard ust 1 '*'
> ++      test_event_wildcard ust 1 'tp:tptest*'
> ++      test_event_wildcard ust 1 '**'
> ++      test_event_wildcard ust 1 '***'
> ++      test_event_wildcard ust 1 '*tptest'
> ++      test_event_wildcard ust 1 '**tptest'
> ++      test_event_wildcard ust 1 '*tpte*'
> ++      test_event_wildcard ust 1 '*tp*'
> ++      test_event_wildcard ust 1 '*tp**'
> ++      test_event_wildcard ust 1 '*:*tptest'
> ++      test_event_wildcard ust 1 '*:*tpte*t'
> ++      test_event_wildcard ust 1 't*p*:*t*e*s*t'
> ++      test_event_wildcard ust 1 '*t*p*:*t*e*s*t*'
> ++      test_event_wildcard ust 1 'tp*tptest'
> ++      test_event_wildcard ust 1 'tp**tptest'
> ++      test_event_wildcard ust 1 'tp*test'
> ++}
> +
> + if [ "$(id -u)" =3D=3D "0" ]; then
> +       isroot=3D1
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-modprob=
e-to-test-for-the-presence-of-lttng.patch b/meta/recipes-kernel/lttng/lttng=
-tools/0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch
> new file mode 100644
> index 0000000000..16df3e610a
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0005-Tests-use-modprobe-to-te=
st-for-the-presence-of-lttng.patch
> @@ -0,0 +1,176 @@
> +From 9bc81a446d0a3ea9a884739eee48d3f14db3283c Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Wed, 28 Mar 2018 15:21:26 -0400
> +Subject: [PATCH lttng-tools] Tests: use modprobe to test for the presenc=
e of
> + lttng-modules
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [28702730192ae1ded06105c54c5dc]
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
> +---
> + tests/regression/tools/regen-metadata/test_kernel      |  8 ++------
> + tests/regression/tools/regen-statedump/test_kernel     |  7 +------
> + tests/regression/tools/snapshots/test_kernel           |  9 +++------
> + tests/regression/tools/snapshots/test_kernel_streaming |  8 ++------
> + tests/regression/tools/streaming/test_kernel           |  8 ++------
> + tests/utils/utils.sh                                   | 10 ++++++++++
> + 6 files changed, 20 insertions(+), 30 deletions(-)
> +
> +diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/r=
egression/tools/regen-metadata/test_kernel
> +index fd139aeef..1849b9cd0 100755
> +--- a/tests/regression/tools/regen-metadata/test_kernel
> ++++ b/tests/regression/tools/regen-metadata/test_kernel
> +@@ -28,12 +28,6 @@ NUM_TESTS=3D18
> +
> + source $TESTDIR/utils/utils.sh
> +
> +-# LTTng kernel modules check
> +-out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
> +-if [ -z "$out" ]; then
> +-      BAIL_OUT "LTTng modules not detected."
> +-fi
> +-
> + function lttng_create_session_uri
> + {
> +       # Create session with default path
> +@@ -91,6 +85,8 @@ fi
> +
> + skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
> + {
> ++      validate_lttng_modules_present
> ++
> +       start_lttng_relayd "-o $TRACE_PATH"
> +       start_lttng_sessiond
> +       modprobe lttng-test
> +diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/=
regression/tools/regen-statedump/test_kernel
> +index 85afe76a1..50054eb07 100755
> +--- a/tests/regression/tools/regen-statedump/test_kernel
> ++++ b/tests/regression/tools/regen-statedump/test_kernel
> +@@ -29,12 +29,6 @@ NUM_TESTS=3D11
> +
> + source $TESTDIR/utils/utils.sh
> +
> +-# LTTng kernel modules check
> +-out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
> +-if [ -z "$out" ]; then
> +-      BAIL_OUT "LTTng modules not detected."
> +-fi
> +-
> + function test_kernel_local ()
> + {
> +       diag "Test kernel local with statedump regeneration"
> +@@ -64,6 +58,7 @@ fi
> +
> + skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
> + {
> ++      validate_lttng_modules_present
> +       start_lttng_sessiond
> +       modprobe lttng-test
> +
> +diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regres=
sion/tools/snapshots/test_kernel
> +index 886c4557a..ff563100b 100755
> +--- a/tests/regression/tools/snapshots/test_kernel
> ++++ b/tests/regression/tools/snapshots/test_kernel
> +@@ -29,12 +29,6 @@ NUM_TESTS=3D2060
> +
> + source $TESTDIR/utils/utils.sh
> +
> +-# LTTng kernel modules check
> +-out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
> +-if [ -z "$out" ]; then
> +-      BAIL_OUT "LTTng modules not detected."
> +-fi
> +-
> + function test_kernel_local_snapshot ()
> + {
> +       diag "Test local kernel snapshots"
> +@@ -241,6 +235,9 @@ fi
> +
> + skip $isroot "Root access is needed. Skipping all kernel snapshot tests=
." $NUM_TESTS ||
> + {
> ++
> ++      validate_lttng_modules_present
> ++
> +       start_lttng_sessiond
> +
> +       #tests=3D( test_kernel_1000_local_snapshots )
> +diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/te=
sts/regression/tools/snapshots/test_kernel_streaming
> +index 7b96ef270..1d97519aa 100755
> +--- a/tests/regression/tools/snapshots/test_kernel_streaming
> ++++ b/tests/regression/tools/snapshots/test_kernel_streaming
> +@@ -29,12 +29,6 @@ NUM_TESTS=3D61
> +
> + source $TESTDIR/utils/utils.sh
> +
> +-# LTTng kernel modules check
> +-out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
> +-if [ -z "$out" ]; then
> +-      BAIL_OUT "LTTng modules not detected."
> +-fi
> +-
> + function snapshot_add_output ()
> + {
> +       local sess_name=3D$1
> +@@ -169,6 +163,8 @@ fi
> +
> + skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
> + {
> ++      validate_lttng_modules_present
> ++
> +       start_lttng_relayd "-o $TRACE_PATH"
> +       start_lttng_sessiond
> +
> +diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regres=
sion/tools/streaming/test_kernel
> +index d54bcedf5..6bb23d9f5 100755
> +--- a/tests/regression/tools/streaming/test_kernel
> ++++ b/tests/regression/tools/streaming/test_kernel
> +@@ -28,12 +28,6 @@ NUM_TESTS=3D10
> +
> + source $TESTDIR/utils/utils.sh
> +
> +-# LTTng kernel modules check
> +-out=3D`ls /lib/modules/$(uname -r)/extra | grep lttng`
> +-if [ -z "$out" ]; then
> +-      BAIL_OUT "LTTng modules not detected."
> +-fi
> +-
> + function lttng_create_session_uri
> + {
> +       # Create session with default path
> +@@ -80,6 +74,8 @@ fi
> +
> + skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
> + {
> ++      validate_lttng_modules_present
> ++
> +       start_lttng_relayd "-o $TRACE_PATH"
> +       start_lttng_sessiond
> +
> +diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
> +index af63824ce..26e59e383 100644
> +--- a/tests/utils/utils.sh
> ++++ b/tests/utils/utils.sh
> +@@ -125,6 +125,16 @@ function conf_proc_count()
> +       echo
> + }
> +
> ++# Check if base lttng-modules are present.
> ++# Bail out on failure
> ++function validate_lttng_modules_present ()
> ++{
> ++      modprobe -n lttng-tracer 2>/dev/null
> ++      if [ $? -ne 0  ]; then
> ++              BAIL_OUT "LTTng modules not detected."
> ++      fi
> ++}
> ++
> + function enable_kernel_lttng_event
> + {
> +       local withtap=3D"$1"
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-l=
ttng-modules-presence.patch b/meta/recipes-kernel/lttng/lttng-tools/0006-Te=
sts-check-for-lttng-modules-presence.patch
> new file mode 100644
> index 0000000000..e07c227f46
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0006-Tests-check-for-lttng-mo=
dules-presence.patch
> @@ -0,0 +1,28 @@
> +From 92f93238f1df005aadc98e105c0dd0e04a5955a7 Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Mon, 25 Mar 2019 14:24:51 -0400
> +Subject: [2/2] tests: check for lttng-modules presence
> +
> +Upstream-status: Accepted [5da3fc8579a9f93ea4767729a107784bf2d034ae]
> +Backported to 2.11 and 2.10
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +---
> + tests/regression/tools/notification/test_notification_kernel | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/regression/tools/notification/test_notification_kerne=
l b/tests/regression/tools/notification/test_notification_kernel
> +index 6d7f256ae..e7368df26 100755
> +--- a/tests/regression/tools/notification/test_notification_kernel
> ++++ b/tests/regression/tools/notification/test_notification_kernel
> +@@ -108,6 +108,7 @@ function kernel_test
> + }
> +
> + if [ "$(id -u)" =3D=3D "0" ]; then
> ++      validate_lttng_modules_present
> +       kernel_test
> + else
> +       # Kernel tests are skipped.
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrnam-is-n=
ot-MT-Safe-use-getgrnam_r.patch b/meta/recipes-kernel/lttng/lttng-tools/000=
7-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch
> new file mode 100644
> index 0000000000..5437de26e8
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0007-Fix-getgrnam-is-not-MT-S=
afe-use-getgrnam_r.patch
> @@ -0,0 +1,345 @@
> +From 10e8001ad876d8cb3b5a17c7492e713bbc047975 Mon Sep 17 00:00:00 2001
> +From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +Date: Thu, 28 Mar 2019 18:31:29 -0400
> +Subject: [PATCH] Fix: getgrnam is not MT-Safe, use getgrnam_r
> +
> +Running the test suite under a Yocto musl build resulted in musl
> +coredump due to double freeing.
> +
> +We get the following backtraces:
> +
> +0  a_crash () at ./arch/x86_64/atomic_arch.h:108
> +1  unmap_chunk (self=3D<optimized out>) at src/malloc/malloc.c:515
> +2  free (p=3D<optimized out>) at src/malloc/malloc.c:526
> +3  0x00007f46d9dc3849 in __getgrent_a (f=3Df@entry=3D0x7f46d9d1f7e0, gr=
=3Dgr@entry=3D0x7f46d9e24460 <gr>, line=3Dline@entry=3D0x7f46d9e26058 <line=
>, size=3Dsize@entry=3D0x7f46d92db550, mem=3Dmem@entry=3D0x7f46d9e26050 <me=
m>, nmem=3Dnmem@entry=3D0x7f46d92db558, res=3D0x7f46d92db548) at src/passwd=
/getgrent_a.c:45
> +4  0x00007f46d9dc2e6b in __getgr_a (name=3D0x487242 "tracing", gid=3Dgid=
@entry=3D0, gr=3Dgr@entry=3D0x7f46d9e24460 <gr>, buf=3Dbuf@entry=3D0x7f46d9=
e26058 <line>, size=3Dsize@entry=3D0x7f46d92db550, mem=3Dmem@entry=3D0x7f46=
d9e26050 <mem>, nmem=3D0x7f46d92db558, res=3D0x7f46d92db548) at src/passwd/=
getgr_a.c:30
> +5  0x00007f46d9dc3733 in getgrnam (name=3D<optimized out>) at src/passwd=
/getgrent.c:37
> +6  0x0000000000460b29 in utils_get_group_id (name=3D<optimized out>) at =
../../../lttng-tools-2.10.6/src/common/utils.c:1241
> +7  0x000000000044ee69 in thread_manage_health (data=3D<optimized out>) a=
t ../../../../lttng-tools-2.10.6/src/bin/lttng-sessiond/main.c:4115
> +8  0x00007f46d9de1541 in start (p=3D<optimized out>) at src/thread/pthre=
ad_create.c:195
> +9  0x00007f46d9dee661 in __clone () at src/thread/x86_64/clone.s:22
> +
> +From another run:
> +
> +0  a_crash () at ./arch/x86_64/atomic_arch.h:108
> +1  unmap_chunk (self=3D<optimized out>) at src/malloc/malloc.c:515
> +2  free (p=3D<optimized out>) at src/malloc/malloc.c:526
> +3  0x00007f5abc210849 in __getgrent_a (f=3Df@entry=3D0x7f5abc2733e0, gr=
=3Dgr@entry=3D0x7f5abc271460 <gr>, line=3Dline@entry=3D0x7f5abc273058 <line=
>, size=3Dsize@entry=3D0x7f5abaef5510, mem=3Dmem@entry=3D0x7f5abc273050 <me=
m>, nmem=3Dnmem@entry=3D0x7f5abaef5518, res=3D0x7f5abaef5508) at src/passwd=
/getgrent_a.c:45
> +4  0x00007f5abc20fe6b in __getgr_a (name=3D0x487242 "tracing", gid=3Dgid=
@entry=3D0, gr=3Dgr@entry=3D0x7f5abc271460 <gr>, buf=3Dbuf@entry=3D0x7f5abc=
273058 <line>, size=3Dsize@entry=3D0x7f5abaef5510, mem=3Dmem@entry=3D0x7f5a=
bc273050 <mem>, nmem=3D0x7f5abaef5518, res=3D0x7f5abaef5508) at src/passwd/=
getgr_a.c:30
> +5  0x00007f5abc210733 in getgrnam (name=3D<optimized out>) at src/passwd=
/getgrent.c:37
> +6  0x0000000000460b29 in utils_get_group_id (name=3D<optimized out>) at =
../../../lttng-tools-2.10.6/src/common/utils.c:1241
> +7  0x000000000042dee4 in notification_channel_socket_create () at ../../=
../../lttng-tools-2.10.6/src/bin/lttng-sessiond/notification-thread.c:238
> +8  init_thread_state (state=3D0x7f5abaef5560, handle=3D0x7f5abbf9be40) a=
t ../../../../lttng-tools-2.10.6/src/bin/lttng-sessiond/notification-thread=
.c:375
> +9  thread_notification (data=3D0x7f5abbf9be40) at ../../../../lttng-tool=
s-2.10.6/src/bin/lttng-sessiond/notification-thread.c:495
> +10 0x00007f5abc22e541 in start (p=3D<optimized out>) at src/thread/pthre=
ad_create.c:195
> +11 0x00007f5abc23b661 in __clone () at src/thread/x86_64/clone.s:22
> +
> +The problem was easily reproducible (~6 crash on ~300 runs). A prototype=
 fix
> +using mutex around the getgrnam yielded no crash in over 1000 runs. This
> +patch yielded the same results as the prototype fix.
> +
> +Unfortunately we cannot rely on a mutex in liblttng-ctl since we cannot
> +enforce the locking for the application using the lib.
> +
> +Use getgrnam_r instead.
> +
> +The previous implementation of utils_get_group_id returned the gid of
> +the root group (0) on error/not found. lttng_check_tracing_group needs
> +to know if an error/not found occured, returning the root group is not
> +enough. We now return the gid via the passed parameter. The caller is
> +responsible for either defaulting to the root group or propagating the
> +error.
> +
> +We also do not want to warn when used in liblttng-ctl context. We might
> +want to move the warning elsewhere in the future. For now, pass a bool
> +if we need to warn or not.
> +
> +Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> +---
> + src/bin/lttng-consumerd/health-consumerd.c   | 10 ++-
> + src/bin/lttng-relayd/health-relayd.c         | 20 ++++--
> + src/bin/lttng-sessiond/main.c                | 24 +++++--
> + src/bin/lttng-sessiond/notification-thread.c | 10 ++-
> + src/common/utils.c                           | 75 +++++++++++++++++---
> + src/common/utils.h                           |  4 +-
> + src/lib/lttng-ctl/lttng-ctl.c                |  8 +--
> + 7 files changed, 122 insertions(+), 29 deletions(-)
> +
> +diff --git a/src/bin/lttng-consumerd/health-consumerd.c b/src/bin/lttng-=
consumerd/health-consumerd.c
> +index 1e2f31e4..6045401a 100644
> +--- a/src/bin/lttng-consumerd/health-consumerd.c
> ++++ b/src/bin/lttng-consumerd/health-consumerd.c
> +@@ -184,8 +184,14 @@ void *thread_manage_health(void *data)
> +       is_root =3D !getuid();
> +       if (is_root) {
> +               /* lttng health client socket path permissions */
> +-              ret =3D chown(health_unix_sock_path, 0,
> +-                              utils_get_group_id(tracing_group_name));
> ++              gid_t gid;
> ++
> ++              ret =3D utils_get_group_id(tracing_group_name, true, &gid=
);
> ++              if (ret) {
> ++                      gid =3D 0; /* Default to root group. */
> ++              }
> ++
> ++              ret =3D chown(health_unix_sock_path, 0, gid);
> +               if (ret < 0) {
> +                       ERR("Unable to set group on %s", health_unix_sock=
_path);
> +                       PERROR("chown");
> +diff --git a/src/bin/lttng-relayd/health-relayd.c b/src/bin/lttng-relayd=
/health-relayd.c
> +index ba996621..962e88c4 100644
> +--- a/src/bin/lttng-relayd/health-relayd.c
> ++++ b/src/bin/lttng-relayd/health-relayd.c
> +@@ -105,8 +105,14 @@ static int create_lttng_rundir_with_perm(const char=
 *rundir)
> +               int is_root =3D !getuid();
> +
> +               if (is_root) {
> +-                      ret =3D chown(rundir, 0,
> +-                                      utils_get_group_id(tracing_group_=
name));
> ++                      gid_t gid;
> ++
> ++                      ret =3D utils_get_group_id(tracing_group_name, tr=
ue, &gid);
> ++                      if (ret) {
> ++                              gid =3D 0; /* Default to root group.*/
> ++                      }
> ++
> ++                      ret =3D chown(rundir, 0, gid);
> +                       if (ret < 0) {
> +                               ERR("Unable to set group on %s", rundir);
> +                               PERROR("chown");
> +@@ -256,8 +262,14 @@ void *thread_manage_health(void *data)
> +       is_root =3D !getuid();
> +       if (is_root) {
> +               /* lttng health client socket path permissions */
> +-              ret =3D chown(health_unix_sock_path, 0,
> +-                              utils_get_group_id(tracing_group_name));
> ++              gid_t gid;
> ++
> ++              ret =3D utils_get_group_id(tracing_group_name, true, &gid=
);
> ++              if (ret) {
> ++                      gid =3D 0; /* Default to root group */
> ++              }
> ++
> ++              ret =3D chown(health_unix_sock_path, 0, gid);
> +               if (ret < 0) {
> +                       ERR("Unable to set group on %s", health_unix_sock=
_path);
> +                       PERROR("chown");
> +diff --git a/src/bin/lttng-sessiond/main.c b/src/bin/lttng-sessiond/main=
.c
> +index fa6fa483..49307064 100644
> +--- a/src/bin/lttng-sessiond/main.c
> ++++ b/src/bin/lttng-sessiond/main.c
> +@@ -4112,8 +4112,14 @@ static void *thread_manage_health(void *data)
> +
> +       if (is_root) {
> +               /* lttng health client socket path permissions */
> +-              ret =3D chown(config.health_unix_sock_path.value, 0,
> +-                              utils_get_group_id(config.tracing_group_n=
ame.value));
> ++              gid_t gid;
> ++
> ++              ret =3D utils_get_group_id(config.tracing_group_name.valu=
e, true, &gid);
> ++              if (ret) {
> ++                      gid =3D 0; /* Default to root group */
> ++              }
> ++
> ++              ret =3D chown(config.health_unix_sock_path.value, 0, &gid=
);
> +               if (ret < 0) {
> +                       ERR("Unable to set group on %s", config.health_un=
ix_sock_path.value);
> +                       PERROR("chown");
> +@@ -5238,7 +5244,10 @@ static int set_permissions(char *rundir)
> +       int ret;
> +       gid_t gid;
> +
> +-      gid =3D utils_get_group_id(config.tracing_group_name.value);
> ++      ret =3D utils_get_group_id(config.tracing_group_name.value, true,=
 &gid);
> ++      if (ret) {
> ++              gid =3D 0; /* Default to root group */
> ++      }
> +
> +       /* Set lttng run dir */
> +       ret =3D chown(rundir, 0, gid);
> +@@ -5349,7 +5358,14 @@ static int set_consumer_sockets(struct consumer_d=
ata *consumer_data)
> +               goto error;
> +       }
> +       if (is_root) {
> +-              ret =3D chown(path, 0, utils_get_group_id(config.tracing_=
group_name.value));
> ++              gid_t gid;
> ++
> ++              ret =3D utils_get_group_id(config.tracing_group_name.valu=
e, true, &gid);
> ++              if (ret) {
> ++                      gid =3D 0; /* Default to root group */
> ++              }
> ++
> ++              ret =3D chown(path, 0, gid);
> +               if (ret < 0) {
> +                       ERR("Unable to set group on %s", path);
> +                       PERROR("chown");
> +diff --git a/src/bin/lttng-sessiond/notification-thread.c b/src/bin/lttn=
g-sessiond/notification-thread.c
> +index 92ac597f..18a264d9 100644
> +--- a/src/bin/lttng-sessiond/notification-thread.c
> ++++ b/src/bin/lttng-sessiond/notification-thread.c
> +@@ -235,8 +235,14 @@ int notification_channel_socket_create(void)
> +       }
> +
> +       if (getuid() =3D=3D 0) {
> +-              ret =3D chown(sock_path, 0,
> +-                              utils_get_group_id(config.tracing_group_n=
ame.value));
> ++              gid_t gid;
> ++
> ++              ret =3D  utils_get_group_id(config.tracing_group_name.val=
ue, true, &gid);
> ++              if (ret) {
> ++                      gid =3D 0; /* Default to root group. */
> ++              }
> ++
> ++              ret =3D chown(sock_path, 0, gid);
> +               if (ret) {
> +                       ERR("Failed to set the notification channel socke=
t's group");
> +                       ret =3D -1;
> +diff --git a/src/common/utils.c b/src/common/utils.c
> +index c0bb031e..778bc00f 100644
> +--- a/src/common/utils.c
> ++++ b/src/common/utils.c
> +@@ -1231,24 +1231,77 @@ size_t utils_get_current_time_str(const char *fo=
rmat, char *dst, size_t len)
> + }
> +
> + /*
> +- * Return the group ID matching name, else 0 if it cannot be found.
> ++ * Return 0 on success and set *gid to the group_ID matching the passed=
 name.
> ++ * Else -1 if it cannot be found or an error occurred.
> +  */
> + LTTNG_HIDDEN
> +-gid_t utils_get_group_id(const char *name)
> ++int utils_get_group_id(const char *name, bool warn, gid_t *gid)
> + {
> +-      struct group *grp;
> ++      static volatile int warn_once;
> +
> +-      grp =3D getgrnam(name);
> +-      if (!grp) {
> +-              static volatile int warn_once;
> ++      int ret;
> ++      long sys_len;
> ++      size_t len;
> ++      struct group grp;
> ++      struct group *result;
> ++      char *buffer =3D NULL;
> +
> +-              if (!warn_once) {
> +-                      WARN("No tracing group detected");
> +-                      warn_once =3D 1;
> ++      /* Get the system limit if it exists */
> ++      sys_len =3D sysconf(_SC_GETGR_R_SIZE_MAX);
> ++      if (sys_len =3D=3D -1) {
> ++              len =3D 1024;
> ++      } else {
> ++              len =3D (size_t) sys_len;
> ++      }
> ++
> ++      buffer =3D malloc(len);
> ++      if (!buffer) {
> ++              PERROR("getgrnam_r malloc");
> ++              ret =3D -1;
> ++              goto error;
> ++      }
> ++
> ++      while ((ret =3D getgrnam_r(name, &grp, buffer, len, &result)) =3D=
=3D ERANGE)
> ++      {
> ++              /* Buffer is not big enough, increase its size. */
> ++              size_t new_len =3D 2 * len;
> ++              char *new_buffer =3D NULL;
> ++              if (new_len < len) {
> ++                      ERR("getgrnam_r buffer size overflow");
> ++                      ret =3D -1;
> ++                      goto error;
> ++              }
> ++              len =3D new_len;
> ++              new_buffer =3D realloc(buffer, len);
> ++              if (!new_buffer) {
> ++                      PERROR("getgrnam_r realloc");
> ++                      ret =3D -1;
> ++                      goto error;
> +               }
> +-              return 0;
> ++              buffer =3D new_buffer;
> ++      }
> ++      if (ret !=3D 0) {
> ++              PERROR("getgrnam_r");
> ++              ret =3D -1;
> ++              goto error;
> ++      }
> ++
> ++      /* Group not found. */
> ++      if (!result) {
> ++              ret =3D -1;
> ++              goto error;
> ++      }
> ++
> ++      *gid =3D result->gr_gid;
> ++      ret =3D 0;
> ++
> ++error:
> ++      free(buffer);
> ++      if (ret && warn && !warn_once) {
> ++              WARN("No tracing group detected");
> ++              warn_once =3D 1;
> +       }
> +-      return grp->gr_gid;
> ++      return ret;
> + }
> +
> + /*
> +diff --git a/src/common/utils.h b/src/common/utils.h
> +index 18f19ef1..9c72431d 100644
> +--- a/src/common/utils.h
> ++++ b/src/common/utils.h
> +@@ -22,6 +22,8 @@
> + #include <unistd.h>
> + #include <stdint.h>
> + #include <getopt.h>
> ++#include <stdbool.h>
> ++#include <sys/types.h>
> +
> + #define KIBI_LOG2 10
> + #define MEBI_LOG2 20
> +@@ -52,7 +54,7 @@ int utils_get_count_order_u64(uint64_t x);
> + char *utils_get_home_dir(void);
> + char *utils_get_user_home_dir(uid_t uid);
> + size_t utils_get_current_time_str(const char *format, char *dst, size_t=
 len);
> +-gid_t utils_get_group_id(const char *name);
> ++int utils_get_group_id(const char *name, bool warn, gid_t *gid);
> + char *utils_generate_optstring(const struct option *long_options,
> +               size_t opt_count);
> + int utils_create_lock_file(const char *filepath);
> +diff --git a/src/lib/lttng-ctl/lttng-ctl.c b/src/lib/lttng-ctl/lttng-ctl=
.c
> +index 2d84aad9..561b0bcf 100644
> +--- a/src/lib/lttng-ctl/lttng-ctl.c
> ++++ b/src/lib/lttng-ctl/lttng-ctl.c
> +@@ -208,15 +208,13 @@ end:
> + LTTNG_HIDDEN
> + int lttng_check_tracing_group(void)
> + {
> +-      struct group *grp_tracing;      /* no free(). See getgrnam(3) */
> +-      gid_t *grp_list;
> ++      gid_t *grp_list, tracing_gid;
> +       int grp_list_size, grp_id, i;
> +       int ret =3D -1;
> +       const char *grp_name =3D tracing_group;
> +
> +       /* Get GID of group 'tracing' */
> +-      grp_tracing =3D getgrnam(grp_name);
> +-      if (!grp_tracing) {
> ++      if (utils_get_group_id(grp_name, false, &tracing_gid)) {
> +               /* If grp_tracing is NULL, the group does not exist. */
> +               goto end;
> +       }
> +@@ -241,7 +239,7 @@ int lttng_check_tracing_group(void)
> +       }
> +
> +       for (i =3D 0; i < grp_list_size; i++) {
> +-              if (grp_list[i] =3D=3D grp_tracing->gr_gid) {
> ++              if (grp_list[i] =3D=3D tracing_gid) {
> +                       ret =3D 1;
> +                       break;
> +               }
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recip=
es-kernel/lttng/lttng-tools_2.10.6.bb
> index 86418f14c0..b720b84afa 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01d7fc4496aa=
cf37d90df90b90b0cac1 \
>
>  DEPENDS =3D "liburcu popt libxml2 util-linux"
>  RDEPENDS_${PN} =3D "libgcc"
> -RDEPENDS_${PN}-ptest +=3D "make perl bash gawk ${PN} babeltrace procps p=
erl-module-overloading coreutils util-linux"
> +RDEPENDS_${PN}-ptest +=3D "make perl bash gawk ${PN} babeltrace procps p=
erl-module-overloading coreutils util-linux kmod"
>  RDEPENDS_${PN}-ptest_append_libc-glibc =3D " glibc-utils"
>  RDEPENDS_${PN}-ptest_append_libc-musl =3D " musl-utils"
>  # babelstats.pl wants getopt-long
> @@ -33,6 +33,13 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng=
-tools-${PV}.tar.bz2 \
>             file://x32.patch \
>             file://run-ptest \
>             file://lttng-sessiond.service \
> +           file://0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.=
patch \
> +           file://0002-Fix-test-skip-test_getcpu_override-on-single-thre=
ad-.patch \
> +           file://0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-it=
sel.patch \
> +           file://0004-Skip-when-testapp-is-not-present.patch\
> +           file://0005-Tests-use-modprobe-to-test-for-the-presence-of-lt=
tng.patch \
> +           file://0006-Tests-check-for-lttng-modules-presence.patch \
> +           file://0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch =
\
>             "
>
>  SRC_URI[md5sum] =3D "e88c521b5da6bb48a8187af633336ecc"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

