Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DD2C43217
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.32952.1635172054499921789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=tygpxLHu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172052; i=@fujitsu.com;
	bh=4bbDHQlpfq8DY2eTWPm5d/fhWO6AkY44Sfcl9X8B4cg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=tygpxLHuKP2/cK6hdQaAmyUsJ8qTdgLFmFUS2BihB/mEfMeSV4npVuJ8QWGnTlzxJ
	 bW8kml2njzNaE7Ox44Xp4FO/pH+QiR3Mo68yO74+nv31CjYmboRJarrlUacryd9pVh
	 YL6tkZKDy0aeh7WNGZYDBgyHxXWkTMdhNd5QCwSLn1+nsa3B5EozADapd4XTP4RMwW
	 GyOLg8PX762363TS+bZOIgDFYS9XlYbo2x7JphXSVSQ3oscn+MMaDscVJr3YpkdWed
	 BoIY3gCJTGjvOtXxJscWvwhvlVyestu9mIMuWzUwmqr28ep3VVkk+1zdJeWPvmZoVc
	 OvDpTmx+YbNsQ==
Received: from [100.112.196.123] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id AB/54-18279-4DEB6716;
 Mon, 25 Oct 2021 14:27:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRWlGSWpSXmKPExsViZ8MxSffKvrJ
  Eg0+zhSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyLl24zFtzPqPj78hljA2NLTBcjF4eQwGNG
  iTfXn7NAOOeZJJb+ecQG4ZxglJh0ew1zFyMnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+
  N3DDmILCzhInH35kRXEZhFQlZixZioLiM0r4CTR/OQkI4gtIaAgMeXhe7CRnALOEr8uPASrEQ
  KquXZ7DyNEvaDEyZlPWCDmq0p0H3nKBGHLSzRvnc0MMUdRYvblZhYIu0Ji1qw2JghbTeLquU3
  MExiFZiEZNQvJqFlIRi1gZF7FaJFUlJmeUZKbmJmja2hgoGtoaKRraGmma2RqqpdYpZukl1qq
  W55aXKJrqJdYXqxXXJmbnJOil5dasokRGPApBUf+72Bc/uaD3iFGSQ4mJVHeM/PLEoX4kvJTK
  jMSizPii0pzUosPMcpwcChJ8G7bC5QTLEpNT61Iy8wBRh9MWoKDR0mE99QeoDRvcUFibnFmOk
  TqFKMxx87Tixcxc8zfuGQRsxBLXn5eqpQ4byzIJAGQ0ozSPLhBsKRwiVFWSpiXkYGBQYinILU
  oN7MEVf4VozgHo5IwrzQwxQjxZOaVwO17BXQKE9ApfrolIKeUJCKkpBqYEv7LPqn4EZLOE2wb
  Y3aXa294Z3psZkBJpqBq+M0j77nfzgj9Onvxfv+YY96Fd7OzJ2R9+eg86e2LyowvoU6+87sVo
  7vCtq3N0AvxkCpvtr7EeKb/ioqYUPC5U5F2r+SCQoP8jVSZzSIL1+0Wky6fUibN6vJNikN/V4
  tkVfJ/juthVVKr3xioHblg+n7tZe3zDVH70nrlg9Kt9zIKzjy47ss2lpX850r2dlWtCajKTi8
  x+vG151Xk162N8/YxNJbd7X6obtTlNEsg1Lso5fwMxy2Wc9Im9weUy2WbHbmgUtDrcLJj04bq
  S97N/Dz/2Wfr+n88MF1ZhHvv3cD9fhsEV0qH9Qvv/XH00vYfJUosxRmJhlrMRcWJAPK/w4OFA
  wAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-287.messagelabs.com!1635172052!417359!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13742 invoked from network); 25 Oct 2021 14:27:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:27:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CE77D100466
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B2D8210046B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:27:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.13.0 -> 2.13.1
Date: Mon, 25 Oct 2021 22:26:56 +0800
Message-ID: <1635172017-18309-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157344

2021-10-18 lttng-tools 2.13.1 (National Chocolate Cupcake Day)
 Fix: ust: app stuck on recv message during UST comm timeout scenario
 Fix: ust: UST communication can return -EAGAIN
 Fix: ust: segfault on lttng start on filter bytecode copy
 Fix: sessiond: previously created channel cannot be enabled
 Build fix: Missing message in LTTNG_DEPRECATED invocation
 Fix: notification-thread: handling event from a removed tracer event src
 include: add missing "extern"
 include: remove spurious spaces in condition/session-rotation.h
 tests: fix header of regression/ust/getcpu-override/run-getcpu-override
 fix: wrong define used for GCC version check
 Fix: userspace-probe: unreported error on string copy error
 Fix: userspace-probe: truncating binary path for SDT
 Fix: lttng: add-trigger: don't provide a default event rule type
 Fix: statements with side-effects in assert statements
 Fix: lttng_trace_archive_location_serialize is called on freed memory
 Fix: sessiond: ust session is inactive during ust_app_global_update
 Fix: common: error query for trigger action protocol error
 Fix: common: un-hide two rate policy functions
 Fix: include: remove unneeded declaration of lttng_session_descriptor_get_session_name
 Fix: Tests: race condition in test_ns_contexts_change
 Fix: Tests: race condition in test_event_tracker
 Fix: man: lttng-rotate: trace file count/size limitation does not apply
 Fix: runas: less-than-zero comparison of an unsigned value
 Fix: runas: supplementary groups are ignored on lttng save
 Docs: lttng-event-rule(7): --exclude does not exist, use --exclude-name
 sessiond: logging typo: {triger, triggger} -> trigger
 Fix: lttng: free sessions in cmd_destroy
 Fix: lttng: free domains and channels in get_session_stats_str

0001-Fix-Tests-race-condition-in-test_event_tracker.patch
0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
are removed since they're included in 2.13.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...race-condition-in-test_event_tracker.patch | 221 ------------------
 ...condition-in-test_ns_contexts_change.patch |  46 ----
 ...-tools_2.13.0.bb =3D> lttng-tools_2.13.1.bb} |   4 +-
 3 files changed, 1 insertion(+), 270 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.0.bb =3D> lttng-tools_2.13.1.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
deleted file mode 100644
index 10020e1ecf..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From d3392e4850532c02e53e3c3ff1cc27df7e51c941 Mon Sep 17 00:00:00 2001
-From: Francis Deslauriers <francis.deslauriers@efficios.com>
-Date: Tue, 7 Sep 2021 17:10:31 -0400
-Subject: [PATCH 1/2] Fix: Tests: race condition in test_event_tracker
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Background
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-The `test_event_tracker` file contains test cases when the event
-generating app in executed in two distinct steps. Those two steps are
-preparation and execution.
-  1. the preparation is the launching the app in the background, and
-  2. the execution is actually generating the event that should or
-     should not be traced depending on the test case.
-
-This is useful to test the tracker feature since we want to ensure that
-already running apps are notified properly when changing their tracking
-status.
-
-Issue
-=3D=3D=3D=3D=3D
-The `test_event_vpid_track_untrack` test case suffers from a race
-condition that is easy to reproduce on Yocto.
-
-The issue is that sometimes events are end up the trace when none is
-expected.
-
-This is due to the absence of synchronization point at the launch of the
-app which leads to the app being scheduled in-between the track-untrack
-calls leading to events being recorded to the trace.
-
-It's easy to reproduce this issue on my machine by adding a `sleep 5`
-between the track and untrack calls and setting the `NR_USEC_WAIT`
-variable to 1.
-
-Fix
-=3D=3D=3D
-Using the testapp `--sync-before-last-event-touch` flag to make the app
-create a file when all but the last event are executed. We then have the
-app wait until we create a file (`--sync-before-last-event`) to generate
-that last event. This way, we are sure no event will be generated when
-running the track and untrack commands.
-
-Notes
-=3D=3D=3D=3D=3D
-- This issue affects other test cases in this file.
-- This commit fixes a typo in the test header.
-- This commit adds `diag` calls to help tracking to what test the output
-  relates to when reading the log.
-
-Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: Ia2b68128dc9a805526f9748f31ec2c2d95566f31
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- .../tools/tracker/test_event_tracker          | 56 ++++++++++++++-----
- 1 file changed, 42 insertions(+), 14 deletions(-)
-
-diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
-index feb3787..cc0f698 100755
---- a/tests/regression/tools/tracker/test_event_tracker
-+++ b/tests/regression/tools/tracker/test_event_tracker
-@@ -5,7 +5,7 @@
- #
- # SPDX-License-Identifier: GPL-2.0-only
- 
--TEST_DESC=3D"LTTng - Event traker test"
-+TEST_DESC=3D"LTTng - Event tracker test"
- 
- CURDIR=3D$(dirname "$0")/
- TESTDIR=3D"$CURDIR/../../.."
-@@ -15,7 +15,7 @@ TESTAPP_KERNEL_NAME=3D"gen-kernel-test-events"
- TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
- TESTAPP_KERNEL_BIN=3D"$TESTAPP_PATH/$TESTAPP_KERNEL_NAME/$TESTAPP_KERNEL_NAME"
- SESSION_NAME=3D"tracker"
--NR_ITER=3D100
-+NR_ITER=3D1
- NUM_GLOBAL_TESTS=3D2
- NUM_UST_TESTS=3D283
- NUM_KERNEL_TESTS=3D462
-@@ -30,27 +30,41 @@ SCRIPT_GROUPNAME=3D"$(id -gn)"
- 
- CHILD_PID=3D-1
- WAIT_PATH=3D
--AFTER_FIRST_PATH=3D
--BEFORE_LAST_PATH=3D
-+TOUCH_BEFORE_LAST_PATH=3D
-+SYNC_BEFORE_LAST_PATH=3D
- 
- source $TESTDIR/utils/utils.sh
- 
-+# Launch the testapp and execute it up until right before the last event. It is
-+# useful to do it in two seperate steps in order to test tracking and
-+# untracking on an active app.
- function prepare_ust_app
- {
--	AFTER_FIRST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_after_first.XXXXXX)
--	BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_before_last.XXXXXX)
-+	TOUCH_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_touch_before_last.XXXXXX)
-+	SYNC_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_before_last.XXXXXX)
-+
-+	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT \
-+		--sync-before-last-event-touch "$TOUCH_BEFORE_LAST_PATH" \
-+		--sync-before-last-event "$SYNC_BEFORE_LAST_PATH" &
- 
--	$TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT -a "$AFTER_FIRST_PATH" -b "$BEFORE_LAST_PATH" &
- 	CHILD_PID=3D$!
-+
-+	# Wait for the app to execute all the way to right before the last
-+	# event.
-+	while [ ! -f "${TOUCH_BEFORE_LAST_PATH}" ]; do
-+		sleep 0.5
-+	done
- }
- 
-+# Generate the last event.
- function trace_ust_app
- {
--	touch "$BEFORE_LAST_PATH"
--	wait
-+	# Ask the test app to generate the last event.
-+	touch "$SYNC_BEFORE_LAST_PATH"
-+	wait "$CHILD_PID"
- 	ok $=3F "Traced application stopped."
--	rm "$BEFORE_LAST_PATH"
--	rm "$AFTER_FIRST_PATH"
-+	rm "$SYNC_BEFORE_LAST_PATH"
-+	rm "$TOUCH_BEFORE_LAST_PATH"
- }
- 
- function prepare_kernel_app
-@@ -64,7 +78,7 @@ function prepare_kernel_app
- function trace_kernel_app
- {
- 	touch "$WAIT_PATH"
--	wait
-+	wait "$CHILD_PID"
- 	ok $=3F "Traced application stopped."
- 	rm "$WAIT_PATH"
- }
-@@ -78,6 +92,8 @@ function test_event_tracker()
- 	local tracker=3D"$4"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -117,6 +133,8 @@ function test_event_vpid_tracker()
- 	local wildcard=3D"$3"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -160,6 +178,8 @@ function test_event_pid_tracker()
- 	local wildcard=3D"$3"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -203,6 +223,8 @@ function test_event_tracker_fail()
- 	local wildcard=3D"$2"
- 	local tracker=3D"$3"
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -222,6 +244,8 @@ function test_event_track_untrack()
- 	local tracker=3D"$4"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -262,6 +286,8 @@ function test_event_vpid_track_untrack()
- 	local wildcard=3D"$3"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -302,6 +328,8 @@ function test_event_pid_track_untrack()
- 	local wildcard=3D"$3"
- 	local channel=3D''
- 
-+	diag "${FUNCNAME[0]} $*"
-+
- 	trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path"
-@@ -336,9 +364,9 @@ function test_event_pid_track_untrack()
- 
- function test_event_ust_vpid_untrack_snapshot()
- {
--	local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
-+	diag "${FUNCNAME[0]} $*"
- 
--	diag "Test_event_ust_vpid_untrack_snapshot"
-+	local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.XXXXXX)
- 
- 	create_lttng_session_ok $SESSION_NAME "$trace_path" "--snapshot"
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch b/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
deleted file mode 100644
index a8d983105a..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d284752e616dfc4c9288be3bb21c04ea78cdd967 Mon Sep 17 00:00:00 2001
-From: Francis Deslauriers <francis.deslauriers@efficios.com>
-Date: Wed, 8 Sep 2021 10:16:23 -0400
-Subject: [PATCH 2/2] Fix: Tests: race condition in test_ns_contexts_change
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Issue
-=3D=3D=3D=3D=3D
-The test script doesn't wait for the test application to complete before
-stopping the tracing session. The race is that depending on the
-scheduling the application is not always done generating events when the
-session is stopped.
-
-Fix
-=3D=3D=3D
-Make the test script wait for the termination of the test app before
-stopping the session.
-
-Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: I29d9b41d2a2ed60a6c42020509c2067442ae332c
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/regression/ust/namespaces/test_ns_contexts_change | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
-index c0af15e..8a4b62c 100755
---- a/tests/regression/ust/namespaces/test_ns_contexts_change
-+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
-@@ -79,6 +79,9 @@ function test_ns()
- 
- 	touch "$file_sync_before_last"
- 
-+	# Wait for the test app to generate all expected events and exit.
-+	wait $app_pid
-+
- 	# stop and destroy
- 	stop_lttng_tracing_ok "$session_name"
- 	destroy_lttng_session_ok "$session_name"
--- 
-2.20.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
index 1491aff618..063d8e8c2d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
@@ -37,11 +37,9 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://determinism.patch \
            file://0001-src-common-correct-header-location.patch \
-           file://0001-Fix-Tests-race-condition-in-test_event_tracker.patch \
-           file://0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch \
            "
 
-SRC_URI[sha256sum] =3D "8dc894f9a7a840e943c1c344345c75f001a9529daa9157f1a0e6175c081c29e6"
+SRC_URI[sha256sum] =3D "cfe6df7da831fc07fd07ce46b442c2ec1074c167af73f3a1b1d2fba0c453c8b5"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


