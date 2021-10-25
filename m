Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0512CC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 18:53:07 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.1368.1635187985886698469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NE3um1Ns;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g17so11211634qtk.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sp3TNOjJ3rgK27z16QR90X2A4jpgcJdEdACjtlgDEXk=;
        b=NE3um1Nsc5D4egyV3f4AxrVlLvr1q095DhTc4xbXCaJGU0kAF6zGA0FPGcN52L7GKH
         tktl6ceGlQZ1no5N6tFDCZr2UJ1hCoPytkwcgmnD2KldJq6QuEs6jgoeayi0/tiNl8bM
         pEM5nxNPcl6CW0z0OCeewJxHP8844AaW3z+75W1ctxu60ilXlgg6iafSJwZ5MrmPZXap
         Y83TErj8tv2/4p9MWGzL9kB3cMncf42EqZq5Dw8DjALaWLVZCe9CDdeNFeK2NAwKX9Gr
         fntpj3wze+KcRc0fje2RDEAhdamqYUxbIhWr6ZQ9+jeVZgcnTqs3t5XMLPnGp/fQAa1p
         pkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sp3TNOjJ3rgK27z16QR90X2A4jpgcJdEdACjtlgDEXk=;
        b=SRaC+lFOej+AHLGte+yh38NZB559owC24nUiYyc5N3MiBnnOq3GnBYDh4Va5Myk3Vj
         Bgc8GM6tMI5sLQREBBXOOUctnofoA+kS2sFY1DuvnfNq4fzjZVYOiutlqvcY9HUJmOw4
         CQ1e8UYxyS9L8IeUkNIJyOdw7Cv4ogAxiKKjqcL4CQ3tqoSBdC6cIeU7iKD2X4R1GKBV
         dV170S+dQsDc8E6NiGnz/e3NbdV2OVARbS99lgKBd7I9V0qdjo/YVsGNr0G+/c2i4/T/
         4DBJ7i8AwfiVT8G7ZC++It0sVy6uNNwqx38L62uM81MexCRTPZTnviQRzYRutIQgkACE
         1dsQ==
X-Gm-Message-State: AOAM532gXTbRABWCdNKvsSeYgA3zpD4HGDdS3jzAOzm4wwBaD8JQQkdo
	tM6m8Samw/c0lbl6cpYYznoy6Goh2bMhUmL9LIg=
X-Google-Smtp-Source: 
 ABdhPJwi1O3P/OPWYr01C74cj7JAxpo0gt5oHnsP4zkv5ZVWg3XC2YGlWWGpS3LPjDKDCti5iF68izkpkLhE7YN6xdI=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr19848958qtk.227.1635187984799;
 Mon, 25 Oct 2021 11:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
 <1635172017-18309-5-git-send-email-wangmy@fujitsu.com>
 <YXb3SXeWBzWvk7sY@piout.net>
In-Reply-To: <YXb3SXeWBzWvk7sY@piout.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2021 11:52:38 -0700
Message-ID: 
 <CAMKF1sp8R5Twff8KUSbvfBs4_92vqqizLBjcNiXK2XJya051AA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.13.0 -> 2.13.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: wangmy <wangmy@fujitsu.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 18:53:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157359

On Mon, Oct 25, 2021 at 11:28 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I did fix it up but as this is the second time this is happening, I want
> to let you know that git am fails while applying this patch:
>
> error: cannot convert from y to UTF-8
> fatal: could not parse patch
>
> Indeed, the declared charset is y which isn't a thing. I think that what
> happens is that you get to the following prompt:
>
> The following files are 8bit, but do not declare a Content-Transfer-Encod=
ing.
> something.patch
> Which 8bit encoding should I declare [UTF-8]?
>
> At that point, you probably pressed y but you should simply press enter.
>

Yeah most likely that's the cause. You can also change defaults to use
utf-8 and perhaps that might help

git config sendemail.composeencoding UTF-8

in individual repos or perhaps globally if you want to do that

>
> On 25/10/2021 22:26:56+0800, wangmy wrote:
> > 2021-10-18 lttng-tools 2.13.1 (National Chocolate Cupcake Day)
> >  Fix: ust: app stuck on recv message during UST comm timeout scenario
> >  Fix: ust: UST communication can return -EAGAIN
> >  Fix: ust: segfault on lttng start on filter bytecode copy
> >  Fix: sessiond: previously created channel cannot be enabled
> >  Build fix: Missing message in LTTNG_DEPRECATED invocation
> >  Fix: notification-thread: handling event from a removed tracer event s=
rc
> >  include: add missing "extern"
> >  include: remove spurious spaces in condition/session-rotation.h
> >  tests: fix header of regression/ust/getcpu-override/run-getcpu-overrid=
e
> >  fix: wrong define used for GCC version check
> >  Fix: userspace-probe: unreported error on string copy error
> >  Fix: userspace-probe: truncating binary path for SDT
> >  Fix: lttng: add-trigger: don't provide a default event rule type
> >  Fix: statements with side-effects in assert statements
> >  Fix: lttng_trace_archive_location_serialize is called on freed memory
> >  Fix: sessiond: ust session is inactive during ust_app_global_update
> >  Fix: common: error query for trigger action protocol error
> >  Fix: common: un-hide two rate policy functions
> >  Fix: include: remove unneeded declaration of lttng_session_descriptor_=
get_session_name
> >  Fix: Tests: race condition in test_ns_contexts_change
> >  Fix: Tests: race condition in test_event_tracker
> >  Fix: man: lttng-rotate: trace file count/size limitation does not appl=
y
> >  Fix: runas: less-than-zero comparison of an unsigned value
> >  Fix: runas: supplementary groups are ignored on lttng save
> >  Docs: lttng-event-rule(7): --exclude does not exist, use --exclude-nam=
e
> >  sessiond: logging typo: {triger, triggger} -> trigger
> >  Fix: lttng: free sessions in cmd_destroy
> >  Fix: lttng: free domains and channels in get_session_stats_str
> >
> > 0001-Fix-Tests-race-condition-in-test_event_tracker.patch
> > 0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
> > are removed since they're included in 2.13.1
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...race-condition-in-test_event_tracker.patch | 221 ------------------
> >  ...condition-in-test_ns_contexts_change.patch |  46 ----
> >  ...-tools_2.13.0.bb =3D> lttng-tools_2.13.1.bb} |   4 +-
> >  3 files changed, 1 insertion(+), 270 deletions(-)
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Test=
s-race-condition-in-test_event_tracker.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Test=
s-race-condition-in-test_ns_contexts_change.patch
> >  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.0.bb =3D> lttng-too=
ls_2.13.1.bb} (97%)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-=
condition-in-test_event_tracker.patch b/meta/recipes-kernel/lttng/lttng-too=
ls/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
> > deleted file mode 100644
> > index 10020e1ecf..0000000000
> > --- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-conditi=
on-in-test_event_tracker.patch
> > +++ /dev/null
> > @@ -1,221 +0,0 @@
> > -From d3392e4850532c02e53e3c3ff1cc27df7e51c941 Mon Sep 17 00:00:00 2001
> > -From: Francis Deslauriers <francis.deslauriers@efficios.com>
> > -Date: Tue, 7 Sep 2021 17:10:31 -0400
> > -Subject: [PATCH 1/2] Fix: Tests: race condition in test_event_tracker
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Background
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -The `test_event_tracker` file contains test cases when the event
> > -generating app in executed in two distinct steps. Those two steps are
> > -preparation and execution.
> > -  1. the preparation is the launching the app in the background, and
> > -  2. the execution is actually generating the event that should or
> > -     should not be traced depending on the test case.
> > -
> > -This is useful to test the tracker feature since we want to ensure tha=
t
> > -already running apps are notified properly when changing their trackin=
g
> > -status.
> > -
> > -Issue
> > -=3D=3D=3D=3D=3D
> > -The `test_event_vpid_track_untrack` test case suffers from a race
> > -condition that is easy to reproduce on Yocto.
> > -
> > -The issue is that sometimes events are end up the trace when none is
> > -expected.
> > -
> > -This is due to the absence of synchronization point at the launch of t=
he
> > -app which leads to the app being scheduled in-between the track-untrac=
k
> > -calls leading to events being recorded to the trace.
> > -
> > -It's easy to reproduce this issue on my machine by adding a `sleep 5`
> > -between the track and untrack calls and setting the `NR_USEC_WAIT`
> > -variable to 1.
> > -
> > -Fix
> > -=3D=3D=3D
> > -Using the testapp `--sync-before-last-event-touch` flag to make the ap=
p
> > -create a file when all but the last event are executed. We then have t=
he
> > -app wait until we create a file (`--sync-before-last-event`) to genera=
te
> > -that last event. This way, we are sure no event will be generated when
> > -running the track and untrack commands.
> > -
> > -Notes
> > -=3D=3D=3D=3D=3D
> > -- This issue affects other test cases in this file.
> > -- This commit fixes a typo in the test header.
> > -- This commit adds `diag` calls to help tracking to what test the outp=
ut
> > -  relates to when reading the log.
> > -
> > -Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
> > -Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios=
.com>
> > -Change-Id: Ia2b68128dc9a805526f9748f31ec2c2d95566f31
> > -Upstream-Status: Backport
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - .../tools/tracker/test_event_tracker          | 56 ++++++++++++++----=
-
> > - 1 file changed, 42 insertions(+), 14 deletions(-)
> > -
> > -diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests=
/regression/tools/tracker/test_event_tracker
> > -index feb3787..cc0f698 100755
> > ---- a/tests/regression/tools/tracker/test_event_tracker
> > -+++ b/tests/regression/tools/tracker/test_event_tracker
> > -@@ -5,7 +5,7 @@
> > - #
> > - # SPDX-License-Identifier: GPL-2.0-only
> > -
> > --TEST_DESC=3D"LTTng - Event traker test"
> > -+TEST_DESC=3D"LTTng - Event tracker test"
> > -
> > - CURDIR=3D$(dirname "$0")/
> > - TESTDIR=3D"$CURDIR/../../.."
> > -@@ -15,7 +15,7 @@ TESTAPP_KERNEL_NAME=3D"gen-kernel-test-events"
> > - TESTAPP_BIN=3D"$TESTAPP_PATH/$TESTAPP_NAME/$TESTAPP_NAME"
> > - TESTAPP_KERNEL_BIN=3D"$TESTAPP_PATH/$TESTAPP_KERNEL_NAME/$TESTAPP_KER=
NEL_NAME"
> > - SESSION_NAME=3D"tracker"
> > --NR_ITER=3D100
> > -+NR_ITER=3D1
> > - NUM_GLOBAL_TESTS=3D2
> > - NUM_UST_TESTS=3D283
> > - NUM_KERNEL_TESTS=3D462
> > -@@ -30,27 +30,41 @@ SCRIPT_GROUPNAME=3D"$(id -gn)"
> > -
> > - CHILD_PID=3D-1
> > - WAIT_PATH=3D
> > --AFTER_FIRST_PATH=3D
> > --BEFORE_LAST_PATH=3D
> > -+TOUCH_BEFORE_LAST_PATH=3D
> > -+SYNC_BEFORE_LAST_PATH=3D
> > -
> > - source $TESTDIR/utils/utils.sh
> > -
> > -+# Launch the testapp and execute it up until right before the last ev=
ent. It is
> > -+# useful to do it in two seperate steps in order to test tracking and
> > -+# untracking on an active app.
> > - function prepare_ust_app
> > - {
> > --    AFTER_FIRST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_a=
fter_first.XXXXXX)
> > --    BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_sync_b=
efore_last.XXXXXX)
> > -+    TOUCH_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_=
touch_before_last.XXXXXX)
> > -+    SYNC_BEFORE_LAST_PATH=3D$(mktemp --tmpdir -u tmp.${FUNCNAME[0]}_s=
ync_before_last.XXXXXX)
> > -+
> > -+    $TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT \
> > -+            --sync-before-last-event-touch "$TOUCH_BEFORE_LAST_PATH" =
\
> > -+            --sync-before-last-event "$SYNC_BEFORE_LAST_PATH" &
> > -
> > --    $TESTAPP_BIN -i $NR_ITER -w $NR_USEC_WAIT -a "$AFTER_FIRST_PATH" =
-b "$BEFORE_LAST_PATH" &
> > -     CHILD_PID=3D$!
> > -+
> > -+    # Wait for the app to execute all the way to right before the las=
t
> > -+    # event.
> > -+    while [ ! -f "${TOUCH_BEFORE_LAST_PATH}" ]; do
> > -+            sleep 0.5
> > -+    done
> > - }
> > -
> > -+# Generate the last event.
> > - function trace_ust_app
> > - {
> > --    touch "$BEFORE_LAST_PATH"
> > --    wait
> > -+    # Ask the test app to generate the last event.
> > -+    touch "$SYNC_BEFORE_LAST_PATH"
> > -+    wait "$CHILD_PID"
> > -     ok $? "Traced application stopped."
> > --    rm "$BEFORE_LAST_PATH"
> > --    rm "$AFTER_FIRST_PATH"
> > -+    rm "$SYNC_BEFORE_LAST_PATH"
> > -+    rm "$TOUCH_BEFORE_LAST_PATH"
> > - }
> > -
> > - function prepare_kernel_app
> > -@@ -64,7 +78,7 @@ function prepare_kernel_app
> > - function trace_kernel_app
> > - {
> > -     touch "$WAIT_PATH"
> > --    wait
> > -+    wait "$CHILD_PID"
> > -     ok $? "Traced application stopped."
> > -     rm "$WAIT_PATH"
> > - }
> > -@@ -78,6 +92,8 @@ function test_event_tracker()
> > -     local tracker=3D"$4"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -117,6 +133,8 @@ function test_event_vpid_tracker()
> > -     local wildcard=3D"$3"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -160,6 +178,8 @@ function test_event_pid_tracker()
> > -     local wildcard=3D"$3"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -203,6 +223,8 @@ function test_event_tracker_fail()
> > -     local wildcard=3D"$2"
> > -     local tracker=3D"$3"
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -222,6 +244,8 @@ function test_event_track_untrack()
> > -     local tracker=3D"$4"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -262,6 +286,8 @@ function test_event_vpid_track_untrack()
> > -     local wildcard=3D"$3"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -302,6 +328,8 @@ function test_event_pid_track_untrack()
> > -     local wildcard=3D"$3"
> > -     local channel=3D''
> > -
> > -+    diag "${FUNCNAME[0]} $*"
> > -+
> > -     trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_path.X=
XXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path"
> > -@@ -336,9 +364,9 @@ function test_event_pid_track_untrack()
> > -
> > - function test_event_ust_vpid_untrack_snapshot()
> > - {
> > --    local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_=
path.XXXXXX)
> > -+    diag "${FUNCNAME[0]} $*"
> > -
> > --    diag "Test_event_ust_vpid_untrack_snapshot"
> > -+    local trace_path=3D$(mktemp --tmpdir -d tmp.${FUNCNAME[0]}_trace_=
path.XXXXXX)
> > -
> > -     create_lttng_session_ok $SESSION_NAME "$trace_path" "--snapshot"
> > -
> > ---
> > -2.20.1
> > -
> > diff --git a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-=
condition-in-test_ns_contexts_change.patch b/meta/recipes-kernel/lttng/lttn=
g-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
> > deleted file mode 100644
> > index a8d983105a..0000000000
> > --- a/meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-conditi=
on-in-test_ns_contexts_change.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From d284752e616dfc4c9288be3bb21c04ea78cdd967 Mon Sep 17 00:00:00 2001
> > -From: Francis Deslauriers <francis.deslauriers@efficios.com>
> > -Date: Wed, 8 Sep 2021 10:16:23 -0400
> > -Subject: [PATCH 2/2] Fix: Tests: race condition in test_ns_contexts_ch=
ange
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Issue
> > -=3D=3D=3D=3D=3D
> > -The test script doesn't wait for the test application to complete befo=
re
> > -stopping the tracing session. The race is that depending on the
> > -scheduling the application is not always done generating events when t=
he
> > -session is stopped.
> > -
> > -Fix
> > -=3D=3D=3D
> > -Make the test script wait for the termination of the test app before
> > -stopping the session.
> > -
> > -Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
> > -Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios=
.com>
> > -Change-Id: I29d9b41d2a2ed60a6c42020509c2067442ae332c
> > -Upstream-Status: Backport
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - tests/regression/ust/namespaces/test_ns_contexts_change | 3 +++
> > - 1 file changed, 3 insertions(+)
> > -
> > -diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b=
/tests/regression/ust/namespaces/test_ns_contexts_change
> > -index c0af15e..8a4b62c 100755
> > ---- a/tests/regression/ust/namespaces/test_ns_contexts_change
> > -+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
> > -@@ -79,6 +79,9 @@ function test_ns()
> > -
> > -     touch "$file_sync_before_last"
> > -
> > -+    # Wait for the test app to generate all expected events and exit.
> > -+    wait $app_pid
> > -+
> > -     # stop and destroy
> > -     stop_lttng_tracing_ok "$session_name"
> > -     destroy_lttng_session_ok "$session_name"
> > ---
> > -2.20.1
> > -
> > diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/rec=
ipes-kernel/lttng/lttng-tools_2.13.1.bb
> > similarity index 97%
> > rename from meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> > rename to meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
> > index 1491aff618..063d8e8c2d 100644
> > --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.1.bb
> > @@ -37,11 +37,9 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/ltt=
ng-tools-${PV}.tar.bz2 \
> >             file://lttng-sessiond.service \
> >             file://determinism.patch \
> >             file://0001-src-common-correct-header-location.patch \
> > -           file://0001-Fix-Tests-race-condition-in-test_event_tracker.=
patch \
> > -           file://0002-Fix-Tests-race-condition-in-test_ns_contexts_ch=
ange.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =3D "8dc894f9a7a840e943c1c344345c75f001a9529daa9157=
f1a0e6175c081c29e6"
> > +SRC_URI[sha256sum] =3D "cfe6df7da831fc07fd07ce46b442c2ec1074c167af73f3=
a1b1d2fba0c453c8b5"
> >
> >  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> >
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157357): https://lists.openembedded.org/g/openembedde=
d-core/message/157357
> Mute This Topic: https://lists.openembedded.org/mt/86578262/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

