Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4E27FE22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u2so2159668wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6k8ruxqjNPxRozzO24e1jH5tE7Fsd6mtUBy+qkV5sTs=;
	b=PlNVQYRP3rKJFLLCaDi5o0qVCTsKSmdT1EttIl3LpZt7kaX1W5UXCvCV579Xp6M21v
	GOickMcls6ImhfBioe7QwegvNDdXwrS81b+cmGBJf0vjj61XSUQW0U081PJ/4DKMxOPr
	pGdsDGb/oNk1U8/wrjykt/9FlE1VT2iTzZJYknbk7dCof7eVsxyZTaCXv/BBQ8qeOXXw
	A2sY3VUdkWVhR6WLq3UjbYE6zyA837SQpXrUGbACJoVO+OSXHEwHqOWhz1xjZ9QUTK7B
	IrsXzLiJgq8E23C3w8zu+baeyDJTLZLuym8/SK7yghxnbyUkD5E2l2TEZcAHpPKTn74o
	Df9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6k8ruxqjNPxRozzO24e1jH5tE7Fsd6mtUBy+qkV5sTs=;
	b=UmmVfliU/Oo5KoZBTq7iVADvfVhVpY5Oif3s8p0yI7T7tNh5QwlWAI+eMdmGknZTvP
	SxI9Y1lFANbTXRX101UeWwuxeGVExi6/M3knU3mJ0C/y6zJa+lsAiSpnY/1Z4wFsu7qT
	zWpumU5uD9oq3D0gr31yfCoTBcHhEuYrF1/nUuMgq+smEtWCJJq7H9pvO67a7H+Mw6g0
	F8jfS3ZH87La8H9QSKk8V0AVprpaw4qyvbqE0fy/Wjt+rU2h6Eeqle6Io+Tbz6ZFTbA2
	vsU+aguvjeE0zBB5mxvHPq+zCEEWNqzod5oiOrR5B6xwyfQMc7kMztM5cFG/E4GAhu6H
	P6Uw==
X-Gm-Message-State: APjAAAXtZ1fH5tbsuyHGvHcJVlvTVgFaElGYBNQsYcqNu5hsTUs/pvIq
	dS8t7bXbsW8/SPHxGMLIY35eRhsXGE0=
X-Google-Smtp-Source: APXvYqxkqBttvO3QOZQ/+97nuS6SxOKZTXlzv3hPcp6HudMjs+1NL4EjEce8Uc4BRr+aaCplqdkPcQ==
X-Received: by 2002:a05:600c:294d:: with SMTP id
	n13mr3507750wmd.130.1576679899302; 
	Wed, 18 Dec 2019 06:38:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:51 +0100
Message-Id: <20191218143758.129308-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/25] lttng-tools: update to 2.11.0
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:20 -0000

Remove 0001-Skip-when-testapp-is-not-present.patch as it is unclear
whether it needs to be rebased, and difficult to rebase.

Remove 0001-check-for-gettid-API-during-configure.patch as it
is no longer needed.

Ptests still seem to run ok, however they are rather slow,
so I did not wait for their completion.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Skip-when-testapp-is-not-present.patch | 610 ------------------
 ...heck-for-gettid-API-during-configure.patch |  55 --
 ...-tests-do-not-strip-a-helper-library.patch |  27 +
 ...ttng-modules-presence-before-testing.patch |  24 -
 ...-tools_2.10.7.bb => lttng-tools_2.11.0.bb} |  14 +-
 5 files changed, 35 insertions(+), 695 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Skip-when-testapp-is-not-present.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-check-for-lttng-modules-presence-before-testing.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.10.7.bb => lttng-tools_2.11.0.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Skip-when-testapp-is-not-present.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Skip-when-testapp-is-not-present.patch
deleted file mode 100644
index 6c9f7e462cc..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Skip-when-testapp-is-not-present.patch
+++ /dev/null
@@ -1,610 +0,0 @@
-From 95c27e6acceaeda55c729b9e92e594322adef13f Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Wed, 3 Apr 2019 16:31:18 -0400
-Subject: [PATCH lttng-tools] Skip when testapp is not present
-
-We expect lttng-ust do be present, this is a wrong assumptions.
-
-This is a quick fix. The real fix is to either detect at runtime
-lttng-ust support or at build time (HAVE_LIBLTTNG_UST_CTL).
-
-This prevent hang for make check done on a build configured with
---without-lttng-ust.
-
-Upstream-Status: Inappropriate [other] 
-Reason: This patch is inappropriate for upstream for 2.10 stable release 
-since we do not backport "superficial" fix to the test suite. We do 
-backport when a test is broken. The fact that on --without-lttng-ust 
-hang is not a "broken" test per-see. Still, a variation of this fix will 
-be upstreamed in our master branch and possibly 2.11. The upstreamed 
-version will split the test in kernel/ust test and skip them at the 
-build system level. This patch is more succinct.
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
----
- tests/regression/tools/crash/test_crash       |  4 ++
- .../regression/tools/exclusion/test_exclusion |  4 ++
- .../tools/filtering/test_valid_filter         | 21 ++++--
- tests/regression/tools/health/test_thread_ok  | 29 +++++---
- tests/regression/tools/live/Makefile.am       |  2 -
- tests/regression/tools/live/test_lttng_ust    |  4 ++
- tests/regression/tools/live/test_ust          |  4 ++
- .../tools/live/test_ust_tracefile_count       |  4 ++
- tests/regression/tools/mi/test_mi             |  4 ++
- .../notification/test_notification_multi_app  | 18 +++--
- .../tools/notification/test_notification_ust  |  4 ++
- .../regression/tools/regen-metadata/test_ust  |  2 +-
- .../regression/tools/regen-statedump/test_ust |  2 +-
- .../regression/tools/save-load/test_autoload  |  7 ++
- tests/regression/tools/save-load/test_load    |  8 +++
- tests/regression/tools/save-load/test_save    |  7 ++
- .../regression/tools/snapshots/test_ust_fast  |  2 +-
- .../regression/tools/snapshots/test_ust_long  |  2 +-
- .../tools/snapshots/test_ust_streaming        |  2 +-
- tests/regression/tools/snapshots/ust_test     |  2 +-
- .../streaming/test_high_throughput_limits     |  2 +-
- tests/regression/tools/streaming/test_ust     |  2 +-
- .../tracefile-limits/test_tracefile_count     |  2 +-
- .../tracefile-limits/test_tracefile_size      |  2 +-
- .../tools/wildcard/test_event_wildcard        | 67 ++++++++++---------
- 25 files changed, 147 insertions(+), 60 deletions(-)
-
-diff --git a/tests/regression/tools/crash/test_crash b/tests/regression/tools/crash/test_crash
-index 8c62c513d..3cbe97688 100755
---- a/tests/regression/tools/crash/test_crash
-+++ b/tests/regression/tools/crash/test_crash
-@@ -35,6 +35,10 @@ NUM_TESTS=77
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- # Global declaration for simplification
- LTTNG_CRASH=$TESTDIR/../src/bin/lttng-crash/$CRASH_BIN
- 
-diff --git a/tests/regression/tools/exclusion/test_exclusion b/tests/regression/tools/exclusion/test_exclusion
-index 949cd41df..42e4d72fb 100755
---- a/tests/regression/tools/exclusion/test_exclusion
-+++ b/tests/regression/tools/exclusion/test_exclusion
-@@ -30,6 +30,10 @@ NUM_TESTS=149
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- function enable_ust_lttng_all_event_exclusion()
- {
- 	sess_name="$1"
-diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/regression/tools/filtering/test_valid_filter
-index 163b32182..1e8da630b 100755
---- a/tests/regression/tools/filtering/test_valid_filter
-+++ b/tests/regression/tools/filtering/test_valid_filter
-@@ -418,12 +418,18 @@ issue_356_filter+="intfield > 4 && intfield > 5 && "
- issue_356_filter+="intfield > 6 && intfield > 7 && "
- issue_356_filter+="intfield > 8 || intfield > 0"
- 
-+BIN_NAME="gen-ust-events"
-+
-+skip_ust=1
-+if [ ! -x "$CURDIR/$BIN_NAME" ]; then
-+	skip_ust=0
-+	skip 0 "No UST nevents binary detected." $NUM_UST_TESTS
-+fi
-+
- start_lttng_sessiond
- 
- ### UST TESTS
- 
--BIN_NAME="gen-ust-events"
--
- KIRK_KRAUSS_TESTS=(
- 	# the tests below were written by Kirk Krauss in this article:
- 	# http://www.drdobbs.com/architecture-and-design/matching-wildcards-an-empirical-way-to-t/240169123
-@@ -897,9 +903,6 @@ UST_STR_FILTERS=(
- 	END
- )
- 
--if [ ! -x "$CURDIR/$BIN_NAME" ]; then
--	BAIL_OUT "No UST nevents binary detected."
--fi
- 
- IFS="$OLDIFS"
- 
-@@ -910,6 +913,10 @@ i=0
- while true; do
- 	validator="${UST_FILTERS[$i]}"
- 
-+	if [ $skip_ust -eq 0 ]; then
-+		break
-+	fi
-+
- 	if [ "$validator" = END ]; then
- 		break
- 	fi
-@@ -929,6 +936,10 @@ i=0
- while true; do
- 	validator="${UST_STR_FILTERS[$i]}"
- 
-+	if [ $skip_ust -eq 0 ]; then
-+		break
-+	fi
-+
- 	if [ "$validator" = END ]; then
- 		break
- 	fi
-diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regression/tools/health/test_thread_ok
-index e81d6ed24..849b7e71f 100755
---- a/tests/regression/tools/health/test_thread_ok
-+++ b/tests/regression/tools/health/test_thread_ok
-@@ -27,6 +27,9 @@ CHANNEL_NAME="testchan"
- HEALTH_CHECK_BIN="health_check"
- NUM_TESTS=17
- SLEEP_TIME=30
-+TESTAPP_PATH="$TESTDIR/utils/testapp"
-+TESTAPP_NAME="gen-ust-events"
-+TESTAPP_BIN="$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
- 
- source $TESTDIR/utils/utils.sh
- 
-@@ -76,15 +79,19 @@ function test_thread_ok
- 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
- 	report_errors
- 
--	diag "With UST consumer daemons"
--	create_lttng_session_no_output $SESSION_NAME
--	enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
--	start_lttng_tracing_ok $SESSION_NAME
--	destroy_lttng_session_ok $SESSION_NAME
-+	skip $skip_ust "Ust does not seems to be supported" "5" ||
-+	{
-+		diag "With UST consumer daemons"
-+		create_lttng_session_no_output $SESSION_NAME
-+		enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
-+		start_lttng_tracing_ok $SESSION_NAME
-+		destroy_lttng_session_ok $SESSION_NAME
- 
--	# Check health status
--	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
--	report_errors
-+
-+		# Check health status
-+		$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
-+		report_errors
-+	}
- 
- 	skip $isroot "Root access is needed. Skipping kernel consumer health check test." "5" ||
- 	{
-@@ -141,6 +148,12 @@ else
- 	isroot=0
- fi
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	skip_ust=0
-+else
-+	skip_ust=1
-+fi
-+
- test_thread_ok
- 
- rm -rf ${HEALTH_PATH}
-diff --git a/tests/regression/tools/live/Makefile.am b/tests/regression/tools/live/Makefile.am
-index 46186d383..db74de8d5 100644
---- a/tests/regression/tools/live/Makefile.am
-+++ b/tests/regression/tools/live/Makefile.am
-@@ -16,9 +16,7 @@ LIVE=$(top_builddir)/src/bin/lttng-sessiond/session.$(OBJEXT) \
- noinst_PROGRAMS = live_test
- EXTRA_DIST = test_kernel test_lttng_kernel
- 
--if HAVE_LIBLTTNG_UST_CTL
- EXTRA_DIST += test_ust test_ust_tracefile_count test_lttng_ust
--endif
- 
- live_test_SOURCES = live_test.c
- live_test_LDADD = $(LIBTAP) $(LIBCOMMON) $(LIBRELAYD) $(LIBSESSIOND_COMM) \
-diff --git a/tests/regression/tools/live/test_lttng_ust b/tests/regression/tools/live/test_lttng_ust
-index 06017d01d..be9b3d7f7 100755
---- a/tests/regression/tools/live/test_lttng_ust
-+++ b/tests/regression/tools/live/test_lttng_ust
-@@ -38,6 +38,10 @@ NUM_TESTS=12
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
- 
-diff --git a/tests/regression/tools/live/test_ust b/tests/regression/tools/live/test_ust
-index 0384a706f..add521bfc 100755
---- a/tests/regression/tools/live/test_ust
-+++ b/tests/regression/tools/live/test_ust
-@@ -36,6 +36,10 @@ DIR=$(readlink -f $TESTDIR)
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- echo "$TEST_DESC"
- 
- function setup_live_tracing()
-diff --git a/tests/regression/tools/live/test_ust_tracefile_count b/tests/regression/tools/live/test_ust_tracefile_count
-index 6da368fc6..10504f8c6 100755
---- a/tests/regression/tools/live/test_ust_tracefile_count
-+++ b/tests/regression/tools/live/test_ust_tracefile_count
-@@ -36,6 +36,10 @@ DIR=$(readlink -f $TESTDIR)
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- echo "$TEST_DESC"
- 
- function setup_live_tracing()
-diff --git a/tests/regression/tools/mi/test_mi b/tests/regression/tools/mi/test_mi
-index 48dda7da6..2cc30b29a 100755
---- a/tests/regression/tools/mi/test_mi
-+++ b/tests/regression/tools/mi/test_mi
-@@ -61,6 +61,10 @@ NUM_TESTS=228
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- #Overwrite the lttng_bin to get mi output
- LTTNG_BIN="lttng --mi xml"
- 
-diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
-index 0a05ea6a0..29b0f62fa 100755
---- a/tests/regression/tools/notification/test_notification_multi_app
-+++ b/tests/regression/tools/notification/test_notification_multi_app
-@@ -52,6 +52,11 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
-+skip_ust=1
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	skip_ust=0
-+fi
-+
- app_pids=()
- 
- function kernel_event_generator_toogle_state
-@@ -468,10 +473,15 @@ function test_on_register_evaluation ()
- }
- 
- 
--TESTS=(
--	test_multi_app_ust
--	test_on_register_evaluation_ust
--)
-+TESTS=()
-+if [ $skip_ust -eq "1" ]; then
-+	TESTS+=(
-+		test_multi_app_ust
-+		test_on_register_evaluation_ust
-+	)
-+else
-+	skip 0 "No UST events binary detected." $NUM_TEST_UST
-+fi
- 
- if [ "$(id -u)" == "0" ]; then
- 	TESTS+=(
-diff --git a/tests/regression/tools/notification/test_notification_ust b/tests/regression/tools/notification/test_notification_ust
-index 8941e476d..eb2e15cad 100755
---- a/tests/regression/tools/notification/test_notification_ust
-+++ b/tests/regression/tools/notification/test_notification_ust
-@@ -46,6 +46,10 @@ DIR=$(readlink -f $TESTDIR)
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- function ust_event_generator_toogle_state
- {
- 	ust_event_generator_suspended=$((ust_event_generator_suspended==0))
-diff --git a/tests/regression/tools/regen-metadata/test_ust b/tests/regression/tools/regen-metadata/test_ust
-index b7f1af1d8..312c8a40d 100755
---- a/tests/regression/tools/regen-metadata/test_ust
-+++ b/tests/regression/tools/regen-metadata/test_ust
-@@ -34,7 +34,7 @@ NUM_TESTS=33
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function lttng_create_session_uri
-diff --git a/tests/regression/tools/regen-statedump/test_ust b/tests/regression/tools/regen-statedump/test_ust
-index 486b9a560..8d455b26a 100755
---- a/tests/regression/tools/regen-statedump/test_ust
-+++ b/tests/regression/tools/regen-statedump/test_ust
-@@ -34,7 +34,7 @@ NUM_TESTS=11
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function test_ust_local ()
-diff --git a/tests/regression/tools/save-load/test_autoload b/tests/regression/tools/save-load/test_autoload
-index 7ee5e9906..ec376cfb3 100755
---- a/tests/regression/tools/save-load/test_autoload
-+++ b/tests/regression/tools/save-load/test_autoload
-@@ -21,6 +21,9 @@ CURDIR=$(dirname $0)/
- CONFIG_DIR="${CURDIR}/configuration"
- TESTDIR=$CURDIR/../../../
- export LTTNG_SESSION_CONFIG_XSD_PATH=$(readlink -m ${TESTDIR}../src/common/config/)
-+TESTAPP_PATH="$TESTDIR/utils/testapp"
-+TESTAPP_NAME="gen-ust-events"
-+TESTAPP_BIN="$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
- 
- DIR=$(readlink -f $TESTDIR)
- 
-@@ -28,6 +31,10 @@ NUM_TESTS=9
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
- 
-diff --git a/tests/regression/tools/save-load/test_load b/tests/regression/tools/save-load/test_load
-index 5e38b46b6..b6fdd8192 100755
---- a/tests/regression/tools/save-load/test_load
-+++ b/tests/regression/tools/save-load/test_load
-@@ -20,6 +20,10 @@ TEST_DESC="Load session(s)"
- CURDIR=$(dirname $0)/
- CONFIG_DIR="${CURDIR}/configuration"
- TESTDIR=$CURDIR/../../../
-+TESTAPP_PATH="$TESTDIR/utils/testapp"
-+TESTAPP_NAME="gen-ust-events"
-+TESTAPP_BIN="$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
-+
- export LTTNG_SESSION_CONFIG_XSD_PATH=$(readlink -m ${TESTDIR}../src/common/config/)
- 
- SESSION_NAME="load-42"
-@@ -31,6 +35,10 @@ NUM_TESTS=67
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "$TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
- 
-diff --git a/tests/regression/tools/save-load/test_save b/tests/regression/tools/save-load/test_save
-index c5f6b1341..cfaf67b7a 100755
---- a/tests/regression/tools/save-load/test_save
-+++ b/tests/regression/tools/save-load/test_save
-@@ -23,6 +23,9 @@ TESTDIR=$CURDIR/../../../
- SESSION_NAME="save-42"
- CHANNEL_NAME="chan-save"
- EVENT_NAME="tp:tptest"
-+TESTAPP_PATH="$TESTDIR/utils/testapp"
-+TESTAPP_NAME="gen-ust-events"
-+TESTAPP_BIN="$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
- 
- DIR=$(readlink -f $TESTDIR)
- 
-@@ -30,6 +33,10 @@ NUM_TESTS=41
- 
- source $TESTDIR/utils/utils.sh
- 
-+if [ ! -x "TESTAPP_BIN" ]; then
-+	plan_skip_all "No UST events binary detected."
-+fi
-+
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
- 
-diff --git a/tests/regression/tools/snapshots/test_ust_fast b/tests/regression/tools/snapshots/test_ust_fast
-index edb435c52..5a68ec56d 100755
---- a/tests/regression/tools/snapshots/test_ust_fast
-+++ b/tests/regression/tools/snapshots/test_ust_fast
-@@ -23,7 +23,7 @@ TEST_BIN="ust_test"
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$CURDIR/$TEST_BIN" ]; then
--	BAIL_OUT "No UST test found: $TEST_BIN"
-+	plan_skip_all "No UST test found: $TEST_BIN"
- fi
- 
- ./$CURDIR/$TEST_BIN $NR_SNAPSHOT
-diff --git a/tests/regression/tools/snapshots/test_ust_long b/tests/regression/tools/snapshots/test_ust_long
-index 9e1a0c262..afa019f6a 100755
---- a/tests/regression/tools/snapshots/test_ust_long
-+++ b/tests/regression/tools/snapshots/test_ust_long
-@@ -23,7 +23,7 @@ TEST_BIN="ust_test"
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$CURDIR/$TEST_BIN" ]; then
--	BAIL_OUT "No UST test found: $TEST_BIN"
-+	plan_skip_all "No UST test found: $TEST_BIN"
- fi
- 
- ./$CURDIR/$TEST_BIN $NR_SNAPSHOT
-diff --git a/tests/regression/tools/snapshots/test_ust_streaming b/tests/regression/tools/snapshots/test_ust_streaming
-index 93b0957f3..69291ab4d 100755
---- a/tests/regression/tools/snapshots/test_ust_streaming
-+++ b/tests/regression/tools/snapshots/test_ust_streaming
-@@ -37,7 +37,7 @@ NUM_TESTS=75
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function snapshot_add_output ()
-diff --git a/tests/regression/tools/snapshots/ust_test b/tests/regression/tools/snapshots/ust_test
-index 755cef9e0..92f9f6cff 100755
---- a/tests/regression/tools/snapshots/ust_test
-+++ b/tests/regression/tools/snapshots/ust_test
-@@ -34,7 +34,7 @@ TRACE_PATH=$(mktemp -d)
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- # Need the number of snapshot to do.
-diff --git a/tests/regression/tools/streaming/test_high_throughput_limits b/tests/regression/tools/streaming/test_high_throughput_limits
-index 32c3f1f2b..f54178923 100755
---- a/tests/regression/tools/streaming/test_high_throughput_limits
-+++ b/tests/regression/tools/streaming/test_high_throughput_limits
-@@ -38,7 +38,7 @@ NUM_TESTS=104
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function set_bw_limit
-diff --git a/tests/regression/tools/streaming/test_ust b/tests/regression/tools/streaming/test_ust
-index a5d5b5e92..e1dd98ee7 100755
---- a/tests/regression/tools/streaming/test_ust
-+++ b/tests/regression/tools/streaming/test_ust
-@@ -34,7 +34,7 @@ NUM_TESTS=16
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function lttng_create_session_uri
-diff --git a/tests/regression/tools/tracefile-limits/test_tracefile_count b/tests/regression/tools/tracefile-limits/test_tracefile_count
-index 6ada8580f..7553c7d1f 100755
---- a/tests/regression/tools/tracefile-limits/test_tracefile_count
-+++ b/tests/regression/tools/tracefile-limits/test_tracefile_count
-@@ -33,7 +33,7 @@ PAGE_SIZE=$(getconf PAGE_SIZE)
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function enable_lttng_channel_count_limit ()
-diff --git a/tests/regression/tools/tracefile-limits/test_tracefile_size b/tests/regression/tools/tracefile-limits/test_tracefile_size
-index 3dddbe613..1089487ff 100755
---- a/tests/regression/tools/tracefile-limits/test_tracefile_size
-+++ b/tests/regression/tools/tracefile-limits/test_tracefile_size
-@@ -33,7 +33,7 @@ NUM_TESTS=66
- source $TESTDIR/utils/utils.sh
- 
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST events binary detected."
-+	plan_skip_all "No UST events binary detected."
- fi
- 
- function enable_lttng_channel_size_limit ()
-diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests/regression/tools/wildcard/test_event_wildcard
-index 61ea67a72..921a2301d 100755
---- a/tests/regression/tools/wildcard/test_event_wildcard
-+++ b/tests/regression/tools/wildcard/test_event_wildcard
-@@ -97,42 +97,47 @@ print_test_banner "$TEST_DESC"
- 
- start_lttng_sessiond
- 
--diag "Test UST wildcard"
--
- if [ ! -x "$TESTAPP_BIN" ]; then
--	BAIL_OUT "No UST nevents binary detected."
-+	skip_ust=0
-+else
-+	skip_ust=1
- fi
- 
--EVENT_NAME="tp:tptest"
-+skip $skip_ust "No UST nevents binary detected." $NUM_UST_TESTS ||
-+{
-+	diag "Test UST wildcard"
- 
--# non-matching
--test_event_wildcard ust 0 'tp:abc*'
--test_event_wildcard ust 0 '*abc'
--test_event_wildcard ust 0 '*z*'
--test_event_wildcard ust 0 '*\**'
--test_event_wildcard ust 0 '*\*'
--test_event_wildcard ust 0 '\**'
--test_event_wildcard ust 0 '*:*tpte*s'
--test_event_wildcard ust 0 'tp**tpTest'
-+	EVENT_NAME="tp:tptest"
- 
--# matching
--test_event_wildcard ust 1 'tp:tp*'
--test_event_wildcard ust 1 '*'
--test_event_wildcard ust 1 'tp:tptest*'
--test_event_wildcard ust 1 '**'
--test_event_wildcard ust 1 '***'
--test_event_wildcard ust 1 '*tptest'
--test_event_wildcard ust 1 '**tptest'
--test_event_wildcard ust 1 '*tpte*'
--test_event_wildcard ust 1 '*tp*'
--test_event_wildcard ust 1 '*tp**'
--test_event_wildcard ust 1 '*:*tptest'
--test_event_wildcard ust 1 '*:*tpte*t'
--test_event_wildcard ust 1 't*p*:*t*e*s*t'
--test_event_wildcard ust 1 '*t*p*:*t*e*s*t*'
--test_event_wildcard ust 1 'tp*tptest'
--test_event_wildcard ust 1 'tp**tptest'
--test_event_wildcard ust 1 'tp*test'
-+	# non-matching
-+	test_event_wildcard ust 0 'tp:abc*'
-+	test_event_wildcard ust 0 '*abc'
-+	test_event_wildcard ust 0 '*z*'
-+	test_event_wildcard ust 0 '*\**'
-+	test_event_wildcard ust 0 '*\*'
-+	test_event_wildcard ust 0 '\**'
-+	test_event_wildcard ust 0 '*:*tpte*s'
-+	test_event_wildcard ust 0 'tp**tpTest'
-+
-+	# matching
-+	test_event_wildcard ust 1 'tp:tp*'
-+	test_event_wildcard ust 1 '*'
-+	test_event_wildcard ust 1 'tp:tptest*'
-+	test_event_wildcard ust 1 '**'
-+	test_event_wildcard ust 1 '***'
-+	test_event_wildcard ust 1 '*tptest'
-+	test_event_wildcard ust 1 '**tptest'
-+	test_event_wildcard ust 1 '*tpte*'
-+	test_event_wildcard ust 1 '*tp*'
-+	test_event_wildcard ust 1 '*tp**'
-+	test_event_wildcard ust 1 '*:*tptest'
-+	test_event_wildcard ust 1 '*:*tpte*t'
-+	test_event_wildcard ust 1 't*p*:*t*e*s*t'
-+	test_event_wildcard ust 1 '*t*p*:*t*e*s*t*'
-+	test_event_wildcard ust 1 'tp*tptest'
-+	test_event_wildcard ust 1 'tp**tptest'
-+	test_event_wildcard ust 1 'tp*test'
-+}
- 
- if [ "$(id -u)" == "0" ]; then
- 	isroot=1
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch
deleted file mode 100644
index c494cee6040..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 69c62f5f3cc424b7dd0c8e4097743b39a9c48306 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 08:48:13 -0700
-Subject: [lttng-tools][PATCH] check for gettid API during configure
-
-Add support for gettid() provided by glibc 2.30+
-
-Since version 2.30 glibc provides gettid and it causes conflicts with
-locally defined gettid(). Use the local definition of
-gettid only if system gettid is not available.
-
-https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=NEWS;hb=HEAD<Paste>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac            | 2 +-
- src/common/compat/tid.h | 3 ++-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7b99f5c..e4bd82c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -190,7 +190,7 @@ AC_CHECK_HEADERS([ \
- # Basic functions check
- AC_CHECK_FUNCS([ \
- 	atexit bzero clock_gettime dup2 fdatasync fls ftruncate \
--	gethostbyname gethostname getpagesize localtime_r memchr memset \
-+	gethostbyname gethostname getpagesize gettid localtime_r memchr memset \
- 	mkdir munmap putenv realpath rmdir socket strchr strcspn strdup \
- 	strncasecmp strndup strnlen strpbrk strrchr strstr strtol strtoul \
- 	strtoull dirfd gethostbyname2 getipnodebyname epoll_create1 \
-diff --git a/src/common/compat/tid.h b/src/common/compat/tid.h
-index 40f562f..aa07a85 100644
---- a/src/common/compat/tid.h
-+++ b/src/common/compat/tid.h
-@@ -25,6 +25,7 @@
- #ifndef LTTNG_TID_H
- #define LTTNG_TID_H
- 
-+#if !HAVE_GETTID
- #ifdef __linux__
- #include <syscall.h>
- #endif
-@@ -47,5 +48,5 @@ static inline pid_t gettid(void)
- 	return getpid();
- }
- #endif
--
-+#endif /* HAVE_GETTID */
- #endif /* LTTNG_TID_H */
--- 
-2.22.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
new file mode 100644
index 00000000000..2d08b088794
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -0,0 +1,27 @@
+From ab238c213fac190972f55e73cf3e0bb1c7846eb8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 12 Dec 2019 16:52:07 +0100
+Subject: [PATCH] tests: do not strip a helper library
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/utils/testapp/userspace-probe-elf-binary/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
+index 03f5d5a..d12c343 100644
+--- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
++++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
+@@ -12,7 +12,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
+ libfoo.strip: libfoo.la
+ 	$(OBJCOPY) --strip-all .libs/libfoo.so
+ 
+-all-local: libfoo.strip
++all-local:
+ 	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
+ 		for script in $(EXTRA_DIST); do \
+ 			cp -f $(srcdir)/$$script $(builddir); \
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-check-for-lttng-modules-presence-before-testing.patch b/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-check-for-lttng-modules-presence-before-testing.patch
deleted file mode 100644
index 784a07940a4..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-check-for-lttng-modules-presence-before-testing.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 58e4dcce48b48b68b65bffc0cd51d9e26b44c75d Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Wed, 22 May 2019 16:44:54 -0400
-Subject: [PATCH] Fix: check for lttng modules presence before testing
-
-Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2019-May/028987.html]
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
----
- tests/regression/tools/notification/test_notification_multi_app | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
-index 29b0f62..a6baf65 100755
---- a/tests/regression/tools/notification/test_notification_multi_app
-+++ b/tests/regression/tools/notification/test_notification_multi_app
-@@ -484,6 +484,7 @@ else
- fi
- 
- if [ "$(id -u)" == "0" ]; then
-+	validate_lttng_modules_present
- 	TESTS+=(
- 	test_multi_app_kernel
- 	test_on_register_evaluation_kernel
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
index aa6d19d0fa5..a2797567410 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules sed"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules sed python3-core"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
@@ -30,15 +30,13 @@ PACKAGECONFIG_remove_arc = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
+           file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
-           file://0001-Skip-when-testapp-is-not-present.patch \
-           file://0002-Fix-check-for-lttng-modules-presence-before-testing.patch \
-           file://0001-check-for-gettid-API-during-configure.patch \
            "
 
-SRC_URI[md5sum] = "e7804d10e4cade381e241601f6047373"
-SRC_URI[sha256sum] = "ed71ebe00c5d985c74f30e97b614e909573cbd9276c85e05d9557a0b817a1312"
+SRC_URI[md5sum] = "e6c23244a36e2a09783d03a362eb63cb"
+SRC_URI[sha256sum] = "dce493c82db673c96049b5fad155a760fa449fab3d92467a69fcb0ddaf3f0fbc"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -59,6 +57,8 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
+PRIVATE_LIBS_${PN}-ptest = "libfoo.so"
+
 do_install_append () {
     # install systemd unit file
     install -d ${D}${systemd_unitdir}/system
@@ -111,6 +111,8 @@ do_install_ptest () {
         done
     done
 
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
+
     #
     # Use the versioned libs of liblttng-ust-dl.
     #
-- 
2.17.1


