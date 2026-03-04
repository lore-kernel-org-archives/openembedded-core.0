Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FD8EFCE55
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 23:11:57 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31851.1772665908433412319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 15:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eeq/NAPg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202603042311465b9ba9bfcc0002070c-szq9lu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202603042311465b9ba9bfcc0002070c
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 00:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=I0Td1zJVEVIO9YGpkPOor7/wWZeZIbiuYh3WnIvQluc=;
 b=eeq/NAPgbmcfFSSqGiMhCSSwwQu+eoAb9zEGAlIu6QFrPg8OutRzh6B7rrgMhxiQhTFLS9
 kj5+7Q4eXz2MQn9azxMouBBlM1Z2cO4COTR18i0QEBimCieLfAZjafLEnf23Z9Irm/XTnOyt
 Dl2X8No5ghIayhVvAznua7y7qifWPMbfioSKoISdpAnnR/Y9p1eQEp2E/o+XjdscHhCdiOPf
 TNHOGkmsQx3uzAgVHVgrMCUhsq81deV4mwy8mXghiCUegswBNYwnTQ2H8/9hFPgtdqweK9Pn
 d5GvhTcey/hUM5xJSxAkdV18n5hGg7qESsGcCE5BMGtPibSuZ/JMsdbA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] systemd: upgrade 259.1 -> 259.3
Date: Thu,  5 Mar 2026 00:11:39 +0100
Message-Id: <20260304231139.451840-2-peter.marko@siemens.com>
In-Reply-To: <20260304231139.451840-1-peter.marko@siemens.com>
References: <20260304231139.451840-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 23:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232443

From: Peter Marko <peter.marko@siemens.com>

Update to latest revision of v259.
Drop patches included in this release.

Changes: https://github.com/systemd/systemd/compare/v259.1...v259.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ..._259.1.bb => systemd-boot-native_259.3.bb} |   0
 ...md-boot_259.1.bb => systemd-boot_259.3.bb} |   0
 ...1.bb => systemd-systemctl-native_259.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../systemd/0001-udev-move-functions.patch    | 187 ------------
 ...-not-build-full-list-of-dependencies.patch | 287 ------------------
 .../{systemd_259.1.bb => systemd_259.3.bb}    |   2 -
 7 files changed, 1 insertion(+), 477 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.1.bb => systemd-boot-native_259.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.1.bb => systemd-boot_259.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.1.bb => systemd-systemctl-native_259.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch
 rename meta/recipes-core/systemd/{systemd_259.1.bb => systemd_259.3.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.1.bb b/meta/recipes-core/systemd/systemd-boot-native_259.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_259.1.bb
rename to meta/recipes-core/systemd/systemd-boot-native_259.3.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_259.1.bb b/meta/recipes-core/systemd/systemd-boot_259.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_259.1.bb
rename to meta/recipes-core/systemd/systemd-boot_259.3.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.1.bb b/meta/recipes-core/systemd/systemd-systemctl-native_259.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.1.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_259.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 39ef398007..52171acad5 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "6a36f1c7420dcb8e5176796676047f058466fe7a"
+SRCREV = "32bc9ae9f58aed3fa06e111b55fc157a3fe1322b"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch b/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
deleted file mode 100644
index 41bf03ecdc..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-udev-move-functions.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-From ce57f17eff5e6a01e15341e49aa0b65dd3def486 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Wed, 21 Jan 2026 12:32:50 +0900
-Subject: [PATCH 1/2] udev: move functions
-
-Nothing changed except for the functions are moved.
-Preparation for the next commit, where worker_detach_event() will be
-used in on_worker_exit().
-
-(cherry picked from commit 59bc3e7cd6fc7bcfc1d01245ccefd10ad1d3c304)
-Upstream-Status: Backport
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- src/udev/udev-manager.c | 150 ++++++++++++++++++++--------------------
- 1 file changed, 75 insertions(+), 75 deletions(-)
-
-diff --git a/src/udev/udev-manager.c b/src/udev/udev-manager.c
-index 9fd7f4a6857b..5c6d354f5ba3 100644
---- a/src/udev/udev-manager.c
-+++ b/src/udev/udev-manager.c
-@@ -392,6 +392,81 @@ void manager_revert(Manager *manager) {
-         manager_kill_workers(manager, SIGTERM);
- }
- 
-+static int on_worker_timeout_kill(sd_event_source *s, uint64_t usec, void *userdata) {
-+        Worker *worker = ASSERT_PTR(userdata);
-+        Manager *manager = ASSERT_PTR(worker->manager);
-+        Event *event = ASSERT_PTR(worker->event);
-+
-+        (void) pidref_kill_and_sigcont(&worker->pidref, manager->config.timeout_signal);
-+        worker->state = WORKER_KILLED;
-+
-+        log_device_error(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" killed.", worker->pidref.pid, event->seqnum);
-+        return 0;
-+}
-+
-+static int on_worker_timeout_warning(sd_event_source *s, uint64_t usec, void *userdata) {
-+        Worker *worker = ASSERT_PTR(userdata);
-+        Event *event = ASSERT_PTR(worker->event);
-+
-+        log_device_warning(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" is taking a long time.", worker->pidref.pid, event->seqnum);
-+        return 0;
-+}
-+
-+static void worker_attach_event(Worker *worker, Event *event) {
-+        Manager *manager = ASSERT_PTR(ASSERT_PTR(worker)->manager);
-+
-+        assert(event);
-+        assert(event->state == EVENT_QUEUED);
-+        assert(!event->worker);
-+        assert(IN_SET(worker->state, WORKER_UNDEF, WORKER_IDLE));
-+        assert(!worker->event);
-+
-+        worker->state = WORKER_RUNNING;
-+        worker->event = event;
-+        event->state = EVENT_RUNNING;
-+        event->worker = worker;
-+
-+        (void) event_reset_time_relative(
-+                        manager->event,
-+                        &worker->timeout_warning_event_source,
-+                        CLOCK_MONOTONIC,
-+                        udev_warn_timeout(manager->config.timeout_usec),
-+                        USEC_PER_SEC,
-+                        on_worker_timeout_warning,
-+                        worker,
-+                        EVENT_PRIORITY_WORKER_TIMER,
-+                        "worker-timeout-warn",
-+                        /* force_reset= */ true);
-+
-+        (void) event_reset_time_relative(
-+                        manager->event,
-+                        &worker->timeout_kill_event_source,
-+                        CLOCK_MONOTONIC,
-+                        manager_kill_worker_timeout(manager),
-+                        USEC_PER_SEC,
-+                        on_worker_timeout_kill,
-+                        worker,
-+                        EVENT_PRIORITY_WORKER_TIMER,
-+                        "worker-timeout-kill",
-+                        /* force_reset= */ true);
-+}
-+
-+static Event* worker_detach_event(Worker *worker) {
-+        assert(worker);
-+
-+        Event *event = TAKE_PTR(worker->event);
-+        if (event)
-+                assert_se(TAKE_PTR(event->worker) == worker);
-+
-+        if (worker->state != WORKER_KILLED)
-+                worker->state = WORKER_IDLE;
-+
-+        (void) event_source_disable(worker->timeout_warning_event_source);
-+        (void) event_source_disable(worker->timeout_kill_event_source);
-+
-+        return event;
-+}
-+
- static int on_sigchld(sd_event_source *s, const siginfo_t *si, void *userdata) {
-         _cleanup_(worker_freep) Worker *worker = ASSERT_PTR(userdata);
-         sd_device *dev = worker->event ? ASSERT_PTR(worker->event->dev) : NULL;
-@@ -472,81 +547,6 @@ static int worker_new(Worker **ret, Manager *manager, sd_device_monitor *worker_
-         return 0;
- }
- 
--static int on_worker_timeout_kill(sd_event_source *s, uint64_t usec, void *userdata) {
--        Worker *worker = ASSERT_PTR(userdata);
--        Manager *manager = ASSERT_PTR(worker->manager);
--        Event *event = ASSERT_PTR(worker->event);
--
--        (void) pidref_kill_and_sigcont(&worker->pidref, manager->config.timeout_signal);
--        worker->state = WORKER_KILLED;
--
--        log_device_error(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" killed.", worker->pidref.pid, event->seqnum);
--        return 0;
--}
--
--static int on_worker_timeout_warning(sd_event_source *s, uint64_t usec, void *userdata) {
--        Worker *worker = ASSERT_PTR(userdata);
--        Event *event = ASSERT_PTR(worker->event);
--
--        log_device_warning(event->dev, "Worker ["PID_FMT"] processing SEQNUM=%"PRIu64" is taking a long time.", worker->pidref.pid, event->seqnum);
--        return 0;
--}
--
--static void worker_attach_event(Worker *worker, Event *event) {
--        Manager *manager = ASSERT_PTR(ASSERT_PTR(worker)->manager);
--
--        assert(event);
--        assert(event->state == EVENT_QUEUED);
--        assert(!event->worker);
--        assert(IN_SET(worker->state, WORKER_UNDEF, WORKER_IDLE));
--        assert(!worker->event);
--
--        worker->state = WORKER_RUNNING;
--        worker->event = event;
--        event->state = EVENT_RUNNING;
--        event->worker = worker;
--
--        (void) event_reset_time_relative(
--                        manager->event,
--                        &worker->timeout_warning_event_source,
--                        CLOCK_MONOTONIC,
--                        udev_warn_timeout(manager->config.timeout_usec),
--                        USEC_PER_SEC,
--                        on_worker_timeout_warning,
--                        worker,
--                        EVENT_PRIORITY_WORKER_TIMER,
--                        "worker-timeout-warn",
--                        /* force_reset= */ true);
--
--        (void) event_reset_time_relative(
--                        manager->event,
--                        &worker->timeout_kill_event_source,
--                        CLOCK_MONOTONIC,
--                        manager_kill_worker_timeout(manager),
--                        USEC_PER_SEC,
--                        on_worker_timeout_kill,
--                        worker,
--                        EVENT_PRIORITY_WORKER_TIMER,
--                        "worker-timeout-kill",
--                        /* force_reset= */ true);
--}
--
--static Event* worker_detach_event(Worker *worker) {
--        assert(worker);
--
--        Event *event = TAKE_PTR(worker->event);
--        if (event)
--                assert_se(TAKE_PTR(event->worker) == worker);
--
--        if (worker->state != WORKER_KILLED)
--                worker->state = WORKER_IDLE;
--
--        (void) event_source_disable(worker->timeout_warning_event_source);
--        (void) event_source_disable(worker->timeout_kill_event_source);
--
--        return event;
--}
--
- static int worker_spawn(Manager *manager, Event *event) {
-         int r;
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch b/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch
deleted file mode 100644
index b42e52c101..0000000000
--- a/meta/recipes-core/systemd/systemd/0002-udev-do-not-build-full-list-of-dependencies.patch
+++ /dev/null
@@ -1,287 +0,0 @@
-From 340d469aec6d3daff5a518149ebcdaa82485124d Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Sat, 17 Jan 2026 04:14:05 +0900
-Subject: [PATCH 2/2] udev: do not build full list of dependencies
-
-Suppose the following dependent events are queued:
-
-A(1000) -> C(1002)
-                   \
-                     --> E(1004)
-                   /
-B(1001) -> D(1003)
-
-Here, each number is the seqnum of the event, and A -> B means that
-event B depends on event A, that is, event B cannot be started until
-event A is processed.
-
-In this case, to know if event E can be started, we only need to check
-if event C and D are processed, and not necessary to check the state of
-event A or B.
-
-However, the commit e1ae931064be9483aa98249294f6e195537f43d1 introduced
-full dependency list (in the above example, all A, B, C, D are listed as
-the blocker for E), but it is overkill and most information is not necessary.
-Also, before the commit e1ae931064be9483aa98249294f6e195537f43d1, we
-found blocker from the beginning of the queued events, but that's also
-not necessary, as even A is processed, still C may be queued, and we
-anyway need to check if C is processed or not.
-
-This makes each event only stores the last blocker event for the event,
-and finds the blocker from the end of the queue. With this change, the
-memory cost can be reduced from O(n^2) to O(n). Also, as previously we
-used Set for managing blockers, but now we only increment/decrement
-the reference counter of events, so the speed should be also improved.
-
-Fixes #39583 and #39817.
-
-(cherry picked from commit cb16d47f30cc0d848ca6868c39b844810520d713)
-Upstream-Status: Backport
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- src/udev/udev-manager.c | 107 +++++++++++++++++++++-------------------
- 1 file changed, 55 insertions(+), 52 deletions(-)
-
-diff --git a/src/udev/udev-manager.c b/src/udev/udev-manager.c
-index 5c6d354f5ba3..6d9da33e4932 100644
---- a/src/udev/udev-manager.c
-+++ b/src/udev/udev-manager.c
-@@ -53,9 +53,14 @@ typedef enum EventState {
-         EVENT_QUEUED,
-         EVENT_RUNNING,
-         EVENT_LOCKED,
-+        EVENT_PROCESSED,
- } EventState;
- 
- typedef struct Event {
-+        /* All events that have not been processed (state != EVENT_PROCESSED) are referenced by the Manager.
-+         * Additionally, an event may be referenced by events blocked by this event. See event_find_blocker(). */
-+        unsigned n_ref;
-+
-         Manager *manager;
-         Worker *worker;
-         EventState state;
-@@ -76,9 +81,8 @@ typedef struct Event {
-         char *whole_disk;
-         LIST_FIELDS(Event, same_disk);
- 
--        bool dependencies_built;
--        Set *blocker_events;
--        Set *blocking_events;
-+        /* The last blocker for this event. This event must not be processed before the blocker is processed. */
-+        Event *blocker;
- 
-         LIST_FIELDS(Event, event);
- } Event;
-@@ -101,21 +105,6 @@ typedef struct Worker {
-         Event *event;
- } Worker;
- 
--static void event_clear_dependencies(Event *event) {
--        assert(event);
--
--        Event *e;
--        while ((e = set_steal_first(event->blocker_events)))
--                assert_se(set_remove(e->blocking_events, event) == event);
--        event->blocker_events = set_free(event->blocker_events);
--
--        while ((e = set_steal_first(event->blocking_events)))
--                assert_se(set_remove(e->blocker_events, event) == event);
--        event->blocking_events = set_free(event->blocking_events);
--
--        event->dependencies_built = false;
--}
--
- static void event_unset_whole_disk(Event *event) {
-         Manager *manager = ASSERT_PTR(ASSERT_PTR(event)->manager);
- 
-@@ -140,6 +129,10 @@ static void event_unset_whole_disk(Event *event) {
-         event->whole_disk = mfree(event->whole_disk);
- }
- 
-+static Event* event_free(Event *event);
-+DEFINE_PRIVATE_TRIVIAL_REF_UNREF_FUNC(Event, event, event_free);
-+DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_unref);
-+
- static Event* event_free(Event *event) {
-         if (!event)
-                 return NULL;
-@@ -156,14 +149,25 @@ static Event* event_free(Event *event) {
-         if (event->worker)
-                 event->worker->event = NULL;
- 
--        event_clear_dependencies(event);
-+        event_unref(event->blocker);
- 
-         sd_device_unref(event->dev);
- 
-         return mfree(event);
- }
- 
--DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_free);
-+static Event* event_enter_processed(Event *event) {
-+        if (!event)
-+                return NULL;
-+
-+        if (event->state == EVENT_PROCESSED)
-+                return NULL;
-+
-+        event->state = EVENT_PROCESSED;
-+        return event_unref(event);
-+}
-+
-+DEFINE_TRIVIAL_CLEANUP_FUNC(Event*, event_enter_processed);
- 
- static Worker* worker_free(Worker *worker) {
-         if (!worker)
-@@ -176,7 +180,6 @@ static Worker* worker_free(Worker *worker) {
-         sd_event_source_unref(worker->timeout_warning_event_source);
-         sd_event_source_unref(worker->timeout_kill_event_source);
-         pidref_done(&worker->pidref);
--        event_free(worker->event);
- 
-         return mfree(worker);
- }
-@@ -200,8 +203,8 @@ Manager* manager_free(Manager *manager) {
-         udev_rules_free(manager->rules);
- 
-         hashmap_free(manager->workers);
--        while (manager->events)
--                event_free(manager->events);
-+        LIST_FOREACH(event, event, manager->events)
-+                event_enter_processed(event);
- 
-         prioq_free(manager->locked_events_by_time);
-         hashmap_free(manager->locked_events_by_disk);
-@@ -469,7 +472,8 @@ static Event* worker_detach_event(Worker *worker) {
- 
- static int on_sigchld(sd_event_source *s, const siginfo_t *si, void *userdata) {
-         _cleanup_(worker_freep) Worker *worker = ASSERT_PTR(userdata);
--        sd_device *dev = worker->event ? ASSERT_PTR(worker->event->dev) : NULL;
-+        _cleanup_(event_enter_processedp) Event *event = worker_detach_event(worker);
-+        sd_device *dev = event ? ASSERT_PTR(event->dev) : NULL;
- 
-         assert(si);
- 
-@@ -649,17 +653,21 @@ bool devpath_conflict(const char *a, const char *b) {
-         return *a == '/' || *b == '/' || *a == *b;
- }
- 
--static int event_build_dependencies(Event *event) {
--        int r;
--
-+static void event_find_blocker(Event *event) {
-         assert(event);
- 
-         /* lookup event for identical, parent, child device */
- 
--        if (event->dependencies_built)
--                return 0;
-+        if (event->blocker && event->blocker->state != EVENT_PROCESSED)
-+                /* Previously found blocker is not processed yet. */
-+                return;
-+
-+        /* If we have not found blocker yet, or the previously found blocker has been processed, let's find
-+         * (another) blocker for this event. */
-+        LIST_FOREACH_BACKWARDS(event, e, (event->blocker ?: event)->event_prev) {
-+                if (e->state == EVENT_PROCESSED)
-+                        continue;
- 
--        LIST_FOREACH_BACKWARDS(event, e, event->event_prev) {
-                 if (!streq_ptr(event->id, e->id) &&
-                     !devpath_conflict(event->devpath, e->devpath) &&
-                     !devpath_conflict(event->devpath, e->devpath_old) &&
-@@ -667,22 +675,16 @@ static int event_build_dependencies(Event *event) {
-                     !(event->devnode && streq_ptr(event->devnode, e->devnode)))
-                         continue;
- 
--                r = set_ensure_put(&event->blocker_events, NULL, e);
--                if (r < 0)
--                        return r;
--
--                r = set_ensure_put(&e->blocking_events, NULL, event);
--                if (r < 0) {
--                        assert_se(set_remove(event->blocker_events, e) == e);
--                        return r;
--                }
--
-                 log_device_debug(event->dev, "SEQNUM=%" PRIu64 " blocked by SEQNUM=%" PRIu64,
-                                  event->seqnum, e->seqnum);
-+
-+                unref_and_replace_full(event->blocker, e, event_ref, event_unref);
-+                return;
-         }
- 
--        event->dependencies_built = true;
--        return 0;
-+        /* No new blocker is found, and if set, previously found blocker has been processed. Clear the
-+         * previous blocker if set. */
-+        event->blocker = event_unref(event->blocker);
- }
- 
- static bool manager_can_process_event(Manager *manager) {
-@@ -739,14 +741,10 @@ static int event_queue_start(Manager *manager) {
-                 if (event->state != EVENT_QUEUED)
-                         continue;
- 
--                r = event_build_dependencies(event);
--                if (r < 0)
--                        log_device_warning_errno(event->dev, r,
--                                                 "Failed to check dependencies for event (SEQNUM=%"PRIu64", ACTION=%s), ignoring: %m",
--                                                 event->seqnum, strna(device_action_to_string(event->action)));
-+                event_find_blocker(event);
- 
-                 /* do not start event if parent or child event is still running or queued */
--                if (!set_isempty(event->blocker_events))
-+                if (event->blocker)
-                         continue;
- 
-                 r = event_run(event);
-@@ -927,11 +925,12 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
-         if (r < 0 && r != -ENOENT)
-                 return r;
- 
--        _cleanup_(event_freep) Event *event = new(Event, 1);
-+        _cleanup_(event_unrefp) Event *event = new(Event, 1);
-         if (!event)
-                 return -ENOMEM;
- 
-         *event = (Event) {
-+                .n_ref = 1,
-                 .dev = sd_device_ref(dev),
-                 .seqnum = seqnum,
-                 .action = action,
-@@ -943,6 +942,9 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
-                 .locked_event_prioq_index = PRIOQ_IDX_NULL,
-         };
- 
-+        /* The kernel sometimes sends events in a wrong order, and we may receive an event with smaller
-+         * SEQNUM after one with larger SEQNUM. To workaround the issue, let's reorder events if necessary. */
-+
-         Event *prev = NULL;
-         LIST_FOREACH_BACKWARDS(event, e, manager->last_event) {
-                 if (e->seqnum < event->seqnum) {
-@@ -954,8 +956,9 @@ static int event_queue_insert(Manager *manager, sd_device *dev) {
-                                                         "The event (SEQNUM=%"PRIu64") has been already queued.",
-                                                         event->seqnum);
- 
--                /* Inserting an event in an earlier place may change dependency tree. Let's rebuild it later. */
--                event_clear_dependencies(e);
-+                /* The inserted event may be a blocker of an already queued event, hence the already found
-+                 * blocker may not be the last one. Let's find the last blocker again later. */
-+                e->blocker = event_unref(e->blocker);
-         }
- 
-         LIST_INSERT_AFTER(event, manager->events, prev, event);
-@@ -1211,7 +1214,7 @@ static int on_worker_notify(sd_event_source *s, int fd, uint32_t revents, void *
-                 return 0;
-         }
- 
--        _cleanup_(event_freep) Event *event = worker_detach_event(worker);
-+        _cleanup_(event_enter_processedp) Event *event = worker_detach_event(worker);
- 
-         if (strv_contains(l, "TRY_AGAIN=1")) {
-                 /* Worker cannot lock the device. */
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_259.1.bb b/meta/recipes-core/systemd/systemd_259.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_259.1.bb
rename to meta/recipes-core/systemd/systemd_259.3.bb
index 177b769116..9221a41558 100644
--- a/meta/recipes-core/systemd/systemd_259.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -33,8 +33,6 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-udev-move-functions.patch \
-           file://0002-udev-do-not-build-full-list-of-dependencies.patch \
            "
 
 PAM_PLUGINS = " \

