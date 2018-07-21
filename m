Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Jul 2018 03:48:42 UTC
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id 500E67451E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=52097; q=dns/txt;
	s=iport; t=1532144923; x=1533354523;
	h=from:to:subject:date:message-id;
	bh=yeXtcPKgFY38VuCd1M6oZJZdIV6WgqyE/Ozm2Uoq+Ss=;
	b=DN5+/ePQfPqb5tmPOknIohWg34lbDFWjvYVphPCAhBLEf7T/aEMr2xIP
	6SFi0fRwZHaCGBVCJF0+3sOZpVqEt5mBvH9rt6aEeljC/6bYL+lQ81WA2
	vQwfv94PnpUIYCG0j+111DCMpGeVckiyCaeR9t5Hz2WZUC1yfuoX+72fl k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D1AAAJqlJb/4cNJK1cGgEBAQEBAgE?=
	=?us-ascii?q?BAQEIAQEBAYNNY38ojAJfi1OBJYFch0SEZ4gcFA+BVwsfgViGAyE0GAECAQE?=
	=?us-ascii?q?CAQECbRwMhTYBIAEMfgMBAhY6LiGDIAGBZwMVrVszhF2CNA2DM4kCghaBEYJ?=
	=?us-ascii?q?cgn0OgWAKBB8CVYUXAodJISeES2uLeisJhhGGE4MMAkp5Q4Y9hS2IA4F3gRq?=
	=?us-ascii?q?GZgIRFIFBOIFSTSMVgyMBCYIcARaBNoIPhRSEdWkfMIsAKoIfAQE?=
X-IronPort-AV: E=Sophos;i="5.51,382,1526342400"; d="scan'208";a="208830703"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2018 03:39:06 +0000
Received: from kamensky-w541.cisco.com (rtp-vpn3-1263.cisco.com
	[10.82.220.244]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w6L3crgI013872
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 03:39:05 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 20:38:52 -0700
Message-Id: <1532144333-19873-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.82.220.244, rtp-vpn3-1263.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
Subject: [PATCH 1/2] systemtap: 3.2 -> 3.3
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
X-List-Received-Date: Sat, 21 Jul 2018 03:48:42 -0000

Upgrade systemtap from 3.2 to 3.3: Removed all backported patches.
Removed "remove quotes around -I include" pending patch since 3.3
got similar fix already. Resolved merge conflict in and
regenerated monitor-option.patch patch.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 ...dded-a-couple-of-small-sysroot-fixes.patch |  42 ---
 ...root-path-to-module-name-in-case-of-.patch |  61 ----
 ...pdating-the-use-of-timers-for-the-4..patch | 277 ------------------
 .../systemtap/0001-Fixes-for-gcc-8.patch      | 215 --------------
 ...sysroot-paths-don-t-end-with-a-slash.patch | 128 --------
 ...when-looking-for-the-System.map-file.patch |  29 --
 ...ocate-needs-target-file-path-not-hos.patch |  39 ---
 ...-remove-quotes-around-I-include-line.patch |  38 ---
 ...-with-sysroot-case-do-not-remove-sys.patch |  42 ---
 ...t-release-r-option-handling-follow-u.patch |  40 ---
 ...-fix-short-release-r-option-handling.patch |  53 ----
 ...ymbolic-links-with-absolute-name-rel.patch | 117 --------
 .../systemtap/systemtap/monitor-option.patch  |  15 +-
 .../systemtap/systemtap_git.inc               |  16 +-
 14 files changed, 8 insertions(+), 1104 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
deleted file mode 100644
index c0ceb5a412..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Added-a-couple-of-small-sysroot-fixes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a714658727206d2a98a7194b7e6d29dbd3e27b8d Mon Sep 17 00:00:00 2001
-From: David Smith <dsmith@redhat.com>
-Date: Mon, 19 Mar 2018 16:50:05 -0500
-Subject: [PATCH] Added a couple of small sysroot fixes.
-
-* tapsets.cxx (dwarf_builder::build): Fix commit 4ffecddf5.
-  (path_remove_sysroot): Fix extra '/' present at start of paths.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- tapsets.cxx | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-Index: git/tapsets.cxx
-===================================================================
---- git.orig/tapsets.cxx
-+++ git/tapsets.cxx
-@@ -1395,7 +1395,8 @@ string path_remove_sysroot(const systemt
-   string retval = path;
-   if (!sess.sysroot.empty() &&
-       (pos = retval.find(sess.sysroot)) != string::npos)
--    retval.replace(pos, sess.sysroot.length(), "/");
-+    retval.replace(pos, sess.sysroot.length(),
-+		   (sess.sysroot.back() == '/' ? "/": ""));
-   return retval;
- }
- 
-@@ -8412,8 +8413,11 @@ dwarf_builder::build(systemtap_session &
- 
-       // PR13338: unquote glob results
-       module_name = unescape_glob_chars (module_name);
--      user_path = find_executable (module_name, "", sess.sysenv); // canonicalize it
--      if (!is_fully_resolved(user_path, sess.sysroot, sess.sysenv))
-+      user_path = find_executable (module_name, sess.sysroot, sess.sysenv); // canonicalize it
-+      // Note we don't need to pass the sysroot to
-+      // is_fully_resolved(), since we just passed it to
-+      // find_executable().
-+      if (!is_fully_resolved(user_path, "", sess.sysenv))
-         throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
-                                 user_path.to_string().c_str()));
- 
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
deleted file mode 100644
index 89951a2f19..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 4ffecddf5433d65a6f01241990c9d516586b1c79 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Mon, 19 Mar 2018 08:53:51 -0500
-Subject: [PATCH] Delay adding sysroot path to module name in case of non
- absolute executable
-
-Current stap code adds sysroot prematurely for probes that specify non
-absolute path name, i.e like "foo", so when find_executable called it
-receives full path as <sysroot>/foo and find_executable does not search
-PATH while applying sysroot.
-
-Fix delays adding sysroot till path inside of sysroot is searched first.
-
-Also fix missing sysroot addition in glob expansion case.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- tapsets.cxx | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-Index: git/tapsets.cxx
-===================================================================
---- git.orig/tapsets.cxx
-+++ git/tapsets.cxx
-@@ -746,7 +746,7 @@ base_query::base_query(dwflpp & dw, lite
-               pid_val = 0;
-               get_string_param(params, TOK_PROCESS, module_val);
-             }
--          module_val = find_executable (module_val, "", sess.sysenv);
-+          module_val = find_executable (module_val, sess.sysroot, sess.sysenv);
-           if (!is_fully_resolved(module_val, "", sess.sysenv))
-             throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
-                                     module_val.to_string().c_str()));
-@@ -8287,7 +8287,6 @@ dwarf_builder::build(systemtap_session &
-             }
-           else
-             {
--              module_name = (string)sess.sysroot + (string)module_name;
-               filled_parameters[TOK_PROCESS] = new literal_string(module_name);
-             }
-         }
-@@ -8321,7 +8320,8 @@ dwarf_builder::build(systemtap_session &
-           assert (lit);
- 
-           // Evaluate glob here, and call derive_probes recursively with each match.
--          const auto& globs = glob_executable (module_name);
-+          const auto& globs = glob_executable (sess.sysroot
-+					       + string(module_name));
-           unsigned results_pre = finished_results.size();
-           for (auto it = globs.begin(); it != globs.end(); ++it)
-             {
-@@ -8413,7 +8413,7 @@ dwarf_builder::build(systemtap_session &
-       // PR13338: unquote glob results
-       module_name = unescape_glob_chars (module_name);
-       user_path = find_executable (module_name, "", sess.sysenv); // canonicalize it
--      if (!is_fully_resolved(user_path, "", sess.sysenv))
-+      if (!is_fully_resolved(user_path, sess.sysroot, sess.sysenv))
-         throw SEMANTIC_ERROR(_F("cannot find executable '%s'",
-                                 user_path.to_string().c_str()));
- 
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch b/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
deleted file mode 100644
index 460c3b7609..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch
+++ /dev/null
@@ -1,277 +0,0 @@
-From fbb26e17a4c026f05a497fc5d584516bad3b6950 Mon Sep 17 00:00:00 2001
-From: David Smith <dsmith@redhat.com>
-Date: Wed, 6 Dec 2017 14:37:42 -0600
-Subject: [PATCH] Fix PR22551 by updating the use of timers for the 4.15
- kernel.
-
-* runtime/linux/timer_compatibility.h: New file.
-* runtime/time.c: Update timer callback function parameter type. Update
-  timer initialization.
-* runtime/transport/relay_v2.c: Ditto.
-* runtime/transport/transport.c: Ditto.
-* tapset-timers.cxx (timer_derived_probe_group::emit_module_decls):
-  Ditto. Handle old and new timer callback interface.
-* runtime/linux/runtime.h: Include timer_compatibility.h instead of timer.h.
-* tapset/linux/scsi.stp: Ditto.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
-
----
- runtime/linux/runtime.h             |  2 +-
- runtime/linux/timer_compatibility.h | 76 +++++++++++++++++++++++++++++++++++++
- runtime/time.c                      |  7 ++--
- runtime/transport/relay_v2.c        |  8 ++--
- runtime/transport/transport.c       | 13 +++----
- tapset-timers.cxx                   | 14 +++++--
- tapset/linux/scsi.stp               |  2 +-
- 7 files changed, 100 insertions(+), 22 deletions(-)
- create mode 100644 runtime/linux/timer_compatibility.h
-
-diff --git a/runtime/linux/runtime.h b/runtime/linux/runtime.h
-index 9c585a2..df9b74c 100644
---- a/runtime/linux/runtime.h
-+++ b/runtime/linux/runtime.h
-@@ -34,7 +34,7 @@
- #include <linux/compat.h>
- #include <linux/sched.h>
- #include <linux/mm.h>
--#include <linux/timer.h>
-+#include "timer_compatibility.h"
- #include <linux/delay.h>
- #include <linux/profile.h>
- #include <linux/rcupdate.h>
-diff --git a/runtime/linux/timer_compatibility.h b/runtime/linux/timer_compatibility.h
-new file mode 100644
-index 0000000..ac03de9
---- /dev/null
-+++ b/runtime/linux/timer_compatibility.h
-@@ -0,0 +1,76 @@
-+/*
-+ * linux/timer.h compatibility defines and inlines
-+ * Copyright (C) 2017 Red Hat Inc.
-+ *
-+ * This file is part of systemtap, and is free software.  You can
-+ * redistribute it and/or modify it under the terms of the GNU General
-+ * Public License (GPL); either version 2, or (at your option) any
-+ * later version.
-+ */
-+
-+#ifndef _TIMER_COMPATIBILITY_H_
-+#define _TIMER_COMPATIBILITY_H_
-+
-+#include <linux/timer.h>
-+
-+/*
-+ * Starting with the 4.15 kernel, the timer interface
-+ * changed. Originally, you'd do something like:
-+ *
-+ *   static void timer_func(unsigned long val);
-+ *
-+ *   init_timer(&timer);
-+ *   timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
-+ *   timer.function = timer_func;
-+ *   timer.data = 0;
-+ *   add_timer(&timer);
-+ *
-+ * The 'data' parameter would get passed to the callback
-+ * function. Starting with 4.15, you'd do something like this:
-+ *
-+ *   static void timer_func(struct timer_list *val);
-+ *
-+ *   timer_setup(&timer, timer_func, 0);
-+ *   timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
-+ *   add_timer(&timer);
-+ *   
-+ * With the new code, the timer that caused the callback gets passed
-+ * to the timer callback function. The 'data' field has been removed.
-+ *
-+ * So, we're going to use the new interface. To hide the differences
-+ * between the callback function parameter type, we'll define a new
-+ * type, 'stp_timer_callback_parameter_t'.
-+ *
-+ * If code needs to figure out the difference between the old and new
-+ * interface, it should test the TIMER_TRACE_FLAGMASK define (which
-+ * only exists in the new interface).
-+ */
-+
-+#if defined(TIMER_TRACE_FLAGMASK) 
-+/* This is the >= 4.15 kernel interface. */
-+
-+typedef struct timer_list * stp_timer_callback_parameter_t;
-+
-+#else
-+/* This is the < 4.15 kernel interface. */
-+
-+typedef unsigned long stp_timer_callback_parameter_t;
-+
-+/**
-+ * timer_setup - prepare a timer for first use
-+ * @timer: the timer in question
-+ * @callback: the function to call when timer expires
-+ * @flags: any TIMER_* flags (note that anything other than 0 is an
-+ * 	   error, since this compatibility function can't support any
-+ *	   of the TIMER_* flags)
-+ */
-+#define timer_setup(timer, callback, flags)			\
-+	{							\
-+		init_timer((timer));				\
-+		(timer)->function = callback;			\
-+		(timer)->data = 0;				\
-+		BUILD_BUG_ON_ZERO((flags) != 0);		\
-+	}
-+#endif
-+
-+#endif /* _TIMER_COMPATIBILITY_H_ */
-diff --git a/runtime/time.c b/runtime/time.c
-index 2e666d5..91ceafa 100644
---- a/runtime/time.c
-+++ b/runtime/time.c
-@@ -168,10 +168,10 @@ __stp_time_smp_callback(void *val)
- 
- /* The timer callback is in a softIRQ -- interrupts enabled. */
- static void
--__stp_time_timer_callback(unsigned long val)
-+__stp_time_timer_callback(stp_timer_callback_parameter_t unused)
- {
-     stp_time_t *time =__stp_time_local_update();
--    (void) val;
-+    (void) unused;
- 
-     /* PR6481: make sure IRQs are enabled before resetting the timer
-        (IRQs are disabled and then reenabled in
-@@ -200,9 +200,8 @@ __stp_init_time(void *info)
-     time->freq = __stp_get_freq();
-     __stp_time_local_update();
- 
--    init_timer(&time->timer);
-+    timer_setup(&time->timer, __stp_time_timer_callback, 0);
-     time->timer.expires = jiffies + STP_TIME_SYNC_INTERVAL;
--    time->timer.function = __stp_time_timer_callback;
- 
- #ifndef STAPCONF_ADD_TIMER_ON
-     add_timer(&time->timer);
-diff --git a/runtime/transport/relay_v2.c b/runtime/transport/relay_v2.c
-index f81d75d..135951a 100644
---- a/runtime/transport/relay_v2.c
-+++ b/runtime/transport/relay_v2.c
-@@ -30,7 +30,7 @@
- #include <linux/debugfs.h>
- #include <linux/mm.h>
- #include <linux/relay.h>
--#include <linux/timer.h>
-+#include "../linux/timer_compatibility.h"
- #include "../uidgid_compatibility.h"
- #include "relay_compat.h"
- 
-@@ -120,7 +120,7 @@ static void __stp_relay_wakeup_readers(struct rchan_buf *buf)
- 		wake_up_interruptible(&buf->read_wait);
- }
- 
--static void __stp_relay_wakeup_timer(unsigned long val)
-+static void __stp_relay_wakeup_timer(stp_timer_callback_parameter_t unused)
- {
- #ifdef STP_BULKMODE
- 	int i;
-@@ -151,10 +151,8 @@ static void __stp_relay_wakeup_timer(unsigned long val)
- static void __stp_relay_timer_init(void)
- {
- 	atomic_set(&_stp_relay_data.wakeup, 0);
--	init_timer(&_stp_relay_data.timer);
-+	timer_setup(&_stp_relay_data.timer, __stp_relay_wakeup_timer, 0);
- 	_stp_relay_data.timer.expires = jiffies + STP_RELAY_TIMER_INTERVAL;
--	_stp_relay_data.timer.function = __stp_relay_wakeup_timer;
--	_stp_relay_data.timer.data = 0;
- 	add_timer(&_stp_relay_data.timer);
- 	smp_mb();
- }
-diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
-index 3400f22..320fd18 100644
---- a/runtime/transport/transport.c
-+++ b/runtime/transport/transport.c
-@@ -311,7 +311,7 @@ static void _stp_detach(void)
- }
- 
- 
--static void _stp_ctl_work_callback(unsigned long val);
-+static void _stp_ctl_work_callback(stp_timer_callback_parameter_t unused);
- 
- /*
-  * Called when stapio opens the control channel.
-@@ -320,13 +320,12 @@ static void _stp_attach(void)
- {
- 	dbug_trans(1, "attach\n");
- 	_stp_pid = current->pid;
--  if (_stp_namespaces_pid < 1)
--    _stp_namespaces_pid = _stp_pid;
-+	if (_stp_namespaces_pid < 1)
-+		_stp_namespaces_pid = _stp_pid;
- 	_stp_transport_data_fs_overwrite(0);
--	init_timer(&_stp_ctl_work_timer);
-+
-+	timer_setup(&_stp_ctl_work_timer, _stp_ctl_work_callback, 0);
- 	_stp_ctl_work_timer.expires = jiffies + STP_CTL_TIMER_INTERVAL;
--	_stp_ctl_work_timer.function = _stp_ctl_work_callback;
--	_stp_ctl_work_timer.data= 0;
- 	add_timer(&_stp_ctl_work_timer);
- }
- 
-@@ -341,7 +340,7 @@ static void _stp_attach(void)
-  *	notified. Reschedules itself if someone is still attached
-  *	to the cmd channel.
-  */
--static void _stp_ctl_work_callback(unsigned long val)
-+static void _stp_ctl_work_callback(stp_timer_callback_parameter_t unused)
- {
- 	int do_io = 0;
- 	unsigned long flags;
-diff --git a/tapset-timers.cxx b/tapset-timers.cxx
-index 1a40bcd..0ab4d69 100644
---- a/tapset-timers.cxx
-+++ b/tapset-timers.cxx
-@@ -122,9 +122,13 @@ timer_derived_probe_group::emit_module_decls (systemtap_session& s)
-   s.op->newline(-1) << "};";
-   s.op->newline();
- 
--  s.op->newline() << "static void enter_timer_probe (unsigned long val) {";
-+  s.op->newline() << "static void enter_timer_probe (stp_timer_callback_parameter_t val) {";
-+  s.op->newline() << "#if defined(TIMER_TRACE_FLAGMASK)";
-+  s.op->newline(1) << "struct stap_timer_probe* stp = container_of(val, struct stap_timer_probe, timer_list);";
-+  s.op->newline(-1) << "#else";
-   s.op->newline(1) << "struct stap_timer_probe* stp = & stap_timer_probes [val];";
--  s.op->newline() << "if ((atomic_read (session_state()) == STAP_SESSION_STARTING) ||";
-+  s.op->newline(-1) << "#endif";
-+  s.op->newline(1) << "if ((atomic_read (session_state()) == STAP_SESSION_STARTING) ||";
-   s.op->newline() << "    (atomic_read (session_state()) == STAP_SESSION_RUNNING))";
-   s.op->newline(1) << "mod_timer (& stp->timer_list, jiffies + ";
-   emit_interval (s.op);
-@@ -148,9 +152,11 @@ timer_derived_probe_group::emit_module_init (systemtap_session& s)
-   s.op->newline() << "for (i=0; i<" << probes.size() << "; i++) {";
-   s.op->newline(1) << "struct stap_timer_probe* stp = & stap_timer_probes [i];";
-   s.op->newline() << "probe_point = stp->probe->pp;";
--  s.op->newline() << "init_timer (& stp->timer_list);";
--  s.op->newline() << "stp->timer_list.function = & enter_timer_probe;";
-+
-+  s.op->newline() << "timer_setup (& stp->timer_list, enter_timer_probe, 0);";
-+  s.op->newline() << "#if !defined(TIMER_TRACE_FLAGMASK)";
-   s.op->newline() << "stp->timer_list.data = i;"; // NB: important!
-+  s.op->newline() << "#endif";
-   // copy timer renew calculations from above :-(
-   s.op->newline() << "stp->timer_list.expires = jiffies + ";
-   emit_interval (s.op);
-diff --git a/tapset/linux/scsi.stp b/tapset/linux/scsi.stp
-index 44f686c..3577942 100644
---- a/tapset/linux/scsi.stp
-+++ b/tapset/linux/scsi.stp
-@@ -14,7 +14,7 @@
- #include <scsi/scsi_cmnd.h>
- #include <scsi/scsi_device.h>
- #include <scsi/scsi_host.h>
--#include <linux/timer.h>
-+#include "linux/timer_compatibility.h"
- #include <linux/blkdev.h>
- %}
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch
deleted file mode 100644
index a1b0bff02a..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 4ffe00f1d9eac332d928f7dc01fe250dc32b1bb8 Mon Sep 17 00:00:00 2001
-From: Stan Cox <scox@redhat.com>
-Date: Tue, 13 Feb 2018 22:38:03 -0500
-Subject: [PATCH] Fixes for gcc 8
-
-* includes/sys/sdt.h (__SDT_COND_SIGNED):  Add CT, cast type argument
-
-Author: Will Cohen <wcohen.redhat.com>
-
-* stap-serverd.cxx (generate_mok, handleRequest, handle_connection):
-  Catch format overflow
-
-* translate.cxx (translate_pass): Use ref in catch.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- includes/sys/sdt.h | 20 ++++++++--------
- stap-serverd.cxx   | 67 +++++++++++++++++++++++++++++++++++++++++++++++-------
- translate.cxx      |  2 +-
- 3 files changed, 70 insertions(+), 19 deletions(-)
-
-diff --git a/includes/sys/sdt.h b/includes/sys/sdt.h
-index 940f74483..c0c5a492c 100644
---- a/includes/sys/sdt.h
-+++ b/includes/sys/sdt.h
-@@ -119,8 +119,8 @@ struct __sdt_type
-   
- #define __SDT_ALWAYS_SIGNED(T) \
- template<> struct __sdt_type<T> { static const bool __sdt_signed = true; };
--#define __SDT_COND_SIGNED(T) \
--template<> struct __sdt_type<T> { static const bool __sdt_signed = ((T)(-1) < 1); };
-+#define __SDT_COND_SIGNED(T,CT)						\
-+template<> struct __sdt_type<T> { static const bool __sdt_signed = ((CT)(-1) < 1); };
- __SDT_ALWAYS_SIGNED(signed char)
- __SDT_ALWAYS_SIGNED(short)
- __SDT_ALWAYS_SIGNED(int)
-@@ -141,14 +141,14 @@ __SDT_ALWAYS_SIGNED(const volatile short)
- __SDT_ALWAYS_SIGNED(const volatile int)
- __SDT_ALWAYS_SIGNED(const volatile long)
- __SDT_ALWAYS_SIGNED(const volatile long long)
--__SDT_COND_SIGNED(char)
--__SDT_COND_SIGNED(wchar_t)
--__SDT_COND_SIGNED(volatile char)
--__SDT_COND_SIGNED(volatile wchar_t)
--__SDT_COND_SIGNED(const char)
--__SDT_COND_SIGNED(const wchar_t)
--__SDT_COND_SIGNED(const volatile char)
--__SDT_COND_SIGNED(const volatile wchar_t)
-+__SDT_COND_SIGNED(char, char)
-+__SDT_COND_SIGNED(wchar_t, wchar_t)
-+__SDT_COND_SIGNED(volatile char, char)
-+__SDT_COND_SIGNED(volatile wchar_t, wchar_t)
-+__SDT_COND_SIGNED(const char, char)
-+__SDT_COND_SIGNED(const wchar_t, wchar_t)
-+__SDT_COND_SIGNED(const volatile char, char)
-+__SDT_COND_SIGNED(const volatile wchar_t, wchar_t)
- #if defined (__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4))
- /* __SDT_COND_SIGNED(char16_t) */
- /* __SDT_COND_SIGNED(char32_t) */
-diff --git a/stap-serverd.cxx b/stap-serverd.cxx
-index 7cf76c617..41f77ee9e 100644
---- a/stap-serverd.cxx
-+++ b/stap-serverd.cxx
-@@ -1607,6 +1607,7 @@ generate_mok(string &mok_fingerprint)
-   char tmpdir[PATH_MAX] = { '\0' };
-   string public_cert_path, private_cert_path, destdir;
-   mode_t old_umask;
-+  int retlen;
- 
-   mok_fingerprint.clear ();
- 
-@@ -1631,7 +1632,14 @@ generate_mok(string &mok_fingerprint)
-     }
- 
-   // Make a temporary directory to store results in.
--  snprintf (tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", mok_path.c_str ());
-+  retlen = snprintf (tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", mok_path.c_str ());
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Could not create %s name", "temporary directory"));
-+      tmpdir[0] = '\0';
-+      goto cleanup;
-+    }
-+
-   if (mkdtemp (tmpdir) == NULL)
-     {
-       server_error (_F("Could not create temporary directory %s: %s", tmpdir, 
-@@ -1704,6 +1712,7 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
-   unsigned u;
-   unsigned i;
-   FILE* f;
-+  int retlen;
- 
-   // Save the server version. Do this early, so the client knows what version of the server
-   // it is dealing with, even if the request is not fully completed.
-@@ -1782,7 +1791,12 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
-       struct stat st;
-       char *arg;
- 
--      snprintf (stapargfile, PATH_MAX, "%s/argv%d", requestDirName.c_str (), i);
-+      retlen = snprintf (stapargfile, PATH_MAX, "%s/argv%d", requestDirName.c_str (), i);
-+      if (retlen < 0 || retlen >= PATH_MAX)
-+        {
-+          server_error (_F("Error creating %s name", "path"));
-+          return;
-+        }
- 
-       rc = stat(stapargfile, & st);
-       if (rc) break;
-@@ -1888,7 +1902,15 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
-     {
-       glob_t globber;
-       char pattern[PATH_MAX];
--      snprintf (pattern, PATH_MAX, "%s/*.ko", new_staptmpdir.c_str());
-+      int retlen;
-+
-+      retlen = snprintf (pattern, PATH_MAX, "%s/*.ko", new_staptmpdir.c_str());
-+      if (retlen < 0 || retlen >= PATH_MAX)
-+        {
-+          server_error (_F("Error creating %s name", "pattern"));
-+          return;
-+        }
-+
-       rc = glob (pattern, GLOB_ERR, NULL, &globber);
-       if (rc)
-         server_error (_F("Unable to find a module in %s", new_staptmpdir.c_str()));
-@@ -2164,6 +2186,7 @@ handle_connection (void *arg)
-                         copy for each connection.*/
-   vector<string>     argv;
-   PRInt32            bytesRead;
-+  int		     retlen;
- 
-   /* Detatch to avoid a memory leak */
-   if(max_threads > 0)
-@@ -2213,7 +2236,13 @@ handle_connection (void *arg)
- #endif
- 
-   secStatus = SECFailure;
--  snprintf(tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", getenv("TMPDIR") ?: "/tmp");
-+  retlen = snprintf(tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", getenv("TMPDIR") ?: "/tmp");
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Error creating %s name", "temporary directory"));
-+      tmpdir[0]=0; /* prevent /bin/rm */
-+      goto cleanup;
-+    }
-   rc1 = mkdtemp(tmpdir);
-   if (! rc1)
-     {
-@@ -2223,9 +2252,20 @@ handle_connection (void *arg)
-     }
- 
-   /* Create a temporary files names and directories.  */
--  snprintf (requestFileName, PATH_MAX, "%s/request.zip", tmpdir);
-+  retlen = snprintf (requestFileName, PATH_MAX, "%s/request.zip", tmpdir);
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Error creating %s name", "request.zip path"));
-+      goto cleanup;
-+    }
-+
-+  retlen = snprintf (requestDirName, PATH_MAX, "%s/request", tmpdir);
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Error creating %s name", "request directory path"));
-+      goto cleanup;
-+    }
- 
--  snprintf (requestDirName, PATH_MAX, "%s/request", tmpdir);
-   rc = mkdir(requestDirName, 0700);
-   if (rc)
-     {
-@@ -2233,7 +2273,13 @@ handle_connection (void *arg)
-       goto cleanup;
-     }
- 
--  snprintf (responseDirName, PATH_MAX, "%s/response", tmpdir);
-+  retlen = snprintf (responseDirName, PATH_MAX, "%s/response", tmpdir);
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Error creating %s name", "response directory path"));
-+      goto cleanup;
-+    }
-+
-   rc = mkdir(responseDirName, 0700);
-   if (rc)
-     {
-@@ -2243,7 +2289,12 @@ handle_connection (void *arg)
-   // Set this early, since it gets used for errors to be returned to the client.
-   stapstderr = string(responseDirName) + "/stderr";
- 
--  snprintf (responseFileName, PATH_MAX, "%s/response.zip", tmpdir);
-+  retlen = snprintf (responseFileName, PATH_MAX, "%s/response.zip", tmpdir);
-+  if (retlen < 0 || retlen >= PATH_MAX)
-+    {
-+      server_error (_F("Error creating %s name", "response.zip path"));
-+      goto cleanup;
-+    }
- 
-   /* Read data from the socket.
-    * If the user is requesting/requiring authentication, authenticate
-diff --git a/translate.cxx b/translate.cxx
-index 1240a80ec..4ade06fdd 100644
---- a/translate.cxx
-+++ b/translate.cxx
-@@ -7860,7 +7860,7 @@ translate_pass (systemtap_session& s)
- 	  if (versions.size() >= 3 && s.verbose > 1)
- 	    clog << _F("ignoring extra parts of compat version: %s", s.compatible.c_str()) << endl;
- 	}
--      catch (const runtime_error)
-+      catch (const runtime_error&)
- 	{
- 	  throw SEMANTIC_ERROR(_F("parse error in compatibility version: %s", s.compatible.c_str()));
- 	}
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
deleted file mode 100644
index 7cd9030eac..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 41efad04730be89889d1483719f9a6c9396dc250 Mon Sep 17 00:00:00 2001
-From: David Smith <dsmith@redhat.com>
-Date: Wed, 14 Mar 2018 17:05:25 -0500
-Subject: [PATCH] Make sure sysroot paths don't end with a slash.
-
-* session.cxx (parse_cmdline): Make sure a sysroot path does not end with
-  a '/', since we build paths like: sysroot + "/lib/modules". If the
-  sysroot path ends with a '/', we end up with paths like
-  '/SYSROOT//lib/modules'.
-  (setup_kernel_release): Take a string parameter, not a character pointer.
-* session.h: Update setup_kernel_release() prototype.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- session.cxx | 34 ++++++++++++++++++++++++++--------
- session.h   |  2 +-
- 2 files changed, 27 insertions(+), 9 deletions(-)
-
-Index: git/session.cxx
-===================================================================
---- git.orig/session.cxx
-+++ git/session.cxx
-@@ -722,6 +722,9 @@ systemtap_session::parse_cmdline (int ar
-   client_options_disallowed_for_unprivileged = "";
-   std::set<std::string> additional_unwindsym_modules;
-   struct rlimit our_rlimit;
-+  bool sysroot_option_seen = false;
-+  string kernel_release_value;
-+
-   while (true)
-     {
-       char * num_endptr;
-@@ -887,7 +890,7 @@ systemtap_session::parse_cmdline (int ar
- 	    // Note that '-' must come last in a regex bracket expression.
-             assert_regexp_match("-r parameter from client", optarg, "^[a-z0-9_.+-]+$");
- 	  server_args.push_back (string ("-") + (char)grc + optarg);
--          setup_kernel_release(optarg);
-+	  kernel_release_value = optarg;
-           break;
- 
-         case 'a':
-@@ -1473,7 +1476,7 @@ systemtap_session::parse_cmdline (int ar
- 	  if (client_options) {
- 	      cerr << _F("ERROR: %s invalid with %s", "--sysroot", "--client-options") << endl;
- 	      return 1;
--	  } else if (!sysroot.empty()) {
-+	  } else if (sysroot_option_seen) {
- 	      cerr << "ERROR: multiple --sysroot options not supported" << endl;
- 	      return 1;
- 	  } else {
-@@ -1487,11 +1490,17 @@ systemtap_session::parse_cmdline (int ar
- 
- 	      sysroot = string(spath);
- 	      free (spath);
--	      if (sysroot[sysroot.size() - 1] != '/')
--		  sysroot.append("/");
- 
--	      break;
-+	      // We do path creation like this:
-+	      //   sysroot + "/lib/modules"
-+	      // So, we don't want the sysroot path to end with a '/',
-+	      // otherwise we'll end up with '/foo//lib/modules'.
-+	      if (sysroot.back() == '/') {
-+		  sysroot.pop_back();
-+	      }
- 	  }
-+	  sysroot_option_seen = true;
-+	  break;
- 
- 	case LONG_OPT_SYSENV:
- 	  if (client_options) {
-@@ -1501,7 +1510,7 @@ systemtap_session::parse_cmdline (int ar
- 	      string sysenv_str = optarg;
- 	      string value;
- 	      size_t pos;
--	      if (sysroot.empty()) {
-+	      if (! sysroot_option_seen) {
- 		  cerr << "ERROR: --sysenv must follow --sysroot" << endl;
- 		  return 1;
- 	      }
-@@ -1646,6 +1655,15 @@ systemtap_session::parse_cmdline (int ar
- 	}
-     }
- 
-+  if (! kernel_release_value.empty())
-+  {
-+      setup_kernel_release(kernel_release_value);
-+  }
-+  else if (! sysroot.empty())
-+  {
-+      kernel_build_tree = sysroot + "/lib/modules/" + kernel_release  + "/build";
-+  }
-+
-   return 0;
- }
- 
-@@ -2152,7 +2170,7 @@ void systemtap_session::insert_loaded_mo
- }
- 
- void
--systemtap_session::setup_kernel_release (const char* kstr) 
-+systemtap_session::setup_kernel_release (const string& kstr) 
- {
-   // Sometimes we may get dupes here... e.g. a server may have a full
-   // -r /path/to/kernel followed by a client's -r kernel.
-@@ -2183,7 +2201,7 @@ systemtap_session::setup_kernel_release
-   else
-     {
-       update_release_sysroot = true;
--      kernel_release = string (kstr);
-+      kernel_release = kstr;
-       if (!kernel_release.empty())
-         kernel_build_tree = "/lib/modules/" + kernel_release + "/build";
- 
-Index: git/session.h
-===================================================================
---- git.orig/session.h
-+++ git/session.h
-@@ -144,7 +144,7 @@ public:
- 
-   // NB: It is very important for all of the above (and below) fields
-   // to be cleared in the systemtap_session ctor (session.cxx).
--  void setup_kernel_release (const char* kstr);
-+  void setup_kernel_release (const std::string& kstr);
-   void insert_loaded_modules ();
- 
-   // command line parsing
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
deleted file mode 100644
index b2820b31e8..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Use-sysroot-when-looking-for-the-System.map-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 436063d5e4738a9b03535d330a2242be5118e745 Mon Sep 17 00:00:00 2001
-From: David Smith <dsmith@redhat.com>
-Date: Thu, 8 Mar 2018 16:01:58 -0600
-Subject: [PATCH] Use sysroot when looking for the System.map file.
-
-Add sysroot to system_map_path + "/boot/System.map" case. Otherwise
-stap tries to look symbols on host system and it produce error like this:
-
-> Kernel symbol table /boot/System.map-4.9.78-yocto-standard unavailable, (No such file or directory)
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- session.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/session.cxx
-===================================================================
---- git.orig/session.cxx
-+++ git/session.cxx
-@@ -2013,7 +2013,7 @@ systemtap_session::parse_kernel_function
- 	clog << _F("Kernel symbol table %s unavailable, (%s)",
- 		   system_map_path.c_str(), strerror(errno)) << endl;
- 
--      system_map_path = "/boot/System.map-" + kernel_release;
-+      system_map_path = sysroot + "/boot/System.map-" + kernel_release;
-       system_map.clear();
-       system_map.open(system_map_path.c_str(), ifstream::in);
-       if (! system_map.is_open())
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch b/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
deleted file mode 100644
index 98181a1294..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 183c7a7a8167333c873525f7908913837b8dc3cb Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Tue, 20 Mar 2018 12:41:05 -0500
-Subject: [PATCH] _stp_umodule_relocate needs target file path, not host file
- path
-
-Strip of sysroot from module name is required when _stp_umodule_relocate
-call is generated. Otherwise path won't match path on target and could
-will fail to calculated address within the file.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- loc2stap.cxx | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/loc2stap.cxx b/loc2stap.cxx
-index 4818ee0..e09954f 100644
---- a/loc2stap.cxx
-+++ b/loc2stap.cxx
-@@ -17,6 +17,7 @@
- 
- #include "loc2stap.h"
- #include "dwflpp.h"
-+#include "tapsets.h"
- 
- #if ! _ELFUTILS_PREREQ(0, 153)
- #define DW_OP_GNU_entry_value 0xf3
-@@ -106,7 +107,9 @@ location_context::translate_address(Dwarf_Addr addr)
-           c = "/* pragma:vma */ "
-               "({ unsigned long addr = 0; "
-               "addr = _stp_umodule_relocate (\""
--              + resolve_path(dw->module_name.c_str()) + "\", "
-+              + path_remove_sysroot(dw->sess,
-+				    resolve_path(dw->module_name.c_str()))
-+	      + "\", "
-               + lex_cast_hex (addr)
- 	      + ", current); addr; })";
- 	}
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch b/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch
deleted file mode 100644
index 7996fdde73..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 75c4aec6de3a615909f3283eac585760de101b8c Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Tue, 7 Mar 2017 10:46:12 -0800
-Subject: [PATCH] buildrun: remove quotes around -I include line
-
-By having the quotes, the kernel Makefile addtree macro adds the
-kernel $srctree directory as a prefix and causes compilation failures.
-Removing the quotes resolves the issue.
-
-This is trimmed from the verbose output of the GCC command line
-Before:
- -I/srv/sdb/builds/4.9/tmp/work-shared/qemux86-64/kernel-source/"/srv/sdb/releases/jethro/builds/4.1/tmp/sysroots/x86_64-linux/usr/share/systemtap/runtime"
-
-After:
- -I/srv/sdb/builds/4.9/tmp/sysroots/x86_64-linux/usr/share/systemtap/runtime
-
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- buildrun.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/buildrun.cxx b/buildrun.cxx
-index aaea64c..8a8ee9f 100644
---- a/buildrun.cxx
-+++ b/buildrun.cxx
-@@ -495,7 +495,7 @@ compile_pass (systemtap_session& s)
-   #if CHECK_POINTER_ARITH_PR5947
-   o << "EXTRA_CFLAGS += -Wpointer-arith" << endl;
-   #endif
--  o << "EXTRA_CFLAGS += -I\"" << s.runtime_path << "\"" << endl;
-+  o << "EXTRA_CFLAGS += -I" << s.runtime_path << endl;
-   // XXX: this may help ppc toc overflow
-   // o << "CFLAGS := $(subst -Os,-O2,$(CFLAGS)) -fminimal-toc" << endl;
-   o << "obj-m := " << s.module_name << ".o" << endl;
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch b/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
deleted file mode 100644
index 160642db08..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b29e448e12040ed8f4d83743a14db0f138a7cc67 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Wed, 14 Mar 2018 16:54:08 -0500
-Subject: [PATCH] debuginfo lookup with sysroot case do not remove sysroot from
- file_name
-
-If sysroot option is passed, and debug symbols reside in sysroot along
-with executable <foo> in <foo_dir>/.debug/<foo_file> directory,
-stap fails to find debuginfo because it strips out sysroot path
-from file_name so dwfl_standard_find_debuginfo ends up looking at
-host <foo_dir>/.debug/<foo_file> rather then checking
-<sysroot>/<foo_dir>/.debug/<foo_file>.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- setupdwfl.cxx | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/setupdwfl.cxx b/setupdwfl.cxx
-index 11e0bb2..2a87982 100644
---- a/setupdwfl.cxx
-+++ b/setupdwfl.cxx
-@@ -627,18 +627,6 @@ internal_find_debuginfo (Dwfl_Module *mod,
- 
-   call_dwfl_standard_find_debuginfo:
- 
--  if (current_session_for_find_debuginfo)
--    {
--      string sysroot = current_session_for_find_debuginfo->sysroot + "/*";
--      int    found   = fnmatch(sysroot.c_str(), file_name, 0);
--
--      if (found)
--	{
--	  file_name = file_name
--	    + current_session_for_find_debuginfo->sysroot.length() - 1;
--	}
--    }
--
-   /* Call the original dwfl_standard_find_debuginfo */
-   return dwfl_standard_find_debuginfo(mod, userdata, modname, base,
-               file_name, debuglink_file,
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
deleted file mode 100644
index 6fe7d4d1cf..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling-follow-u.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7e11f129ff370ce5f39812ce2ae6ce40818a347f Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Thu, 22 Mar 2018 16:02:02 -0500
-Subject: [PATCH] sysroot: fix short release -r option handling follow up
-
-In case of sysroot set and short release -r option it does not make sense
-to pass short release name into dwfl_linux_kernel_report_offline
-function. This function is not aware about sysroot and it won't look for
-kernel modules under sysroot directory.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- setupdwfl.cxx | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/setupdwfl.cxx b/setupdwfl.cxx
-index c419afa..0cf5810 100644
---- a/setupdwfl.cxx
-+++ b/setupdwfl.cxx
-@@ -367,7 +367,15 @@ setup_dwfl_kernel (unsigned *modules_found, systemtap_session &s)
-   // hard-code this magic here.
-   string lib_path = s.sysroot + "/lib/modules/" + s.kernel_release + "/build";
-   if (s.kernel_build_tree == lib_path)
--    elfutils_kernel_path = s.kernel_release;
-+    {
-+      if (s.sysroot != "")
-+        // If we have sysroot set does not make sense to pass
-+        // short release to dwfl, it won't take a sysroot into
-+        // account. Let's construct full path in such case.
-+	elfutils_kernel_path = string(s.sysroot + "/lib/modules/" + s.kernel_release);
-+      else
-+	elfutils_kernel_path = s.kernel_release;
-+    }
-   else
-     elfutils_kernel_path = s.kernel_build_tree;
-   offline_modules_found = 0;
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
deleted file mode 100644
index b31d6274e2..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-fix-short-release-r-option-handling.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a9ce89bcd2d78728faef59bda60e75510972cd56 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Wed, 14 Mar 2018 17:09:44 -0500
-Subject: [PATCH] sysroot: fix short release -r option handling
-
-* setupdwfl.cxx (debuginfo_path_insert_sysroot): Add a '/' to the end of
-  the sysroot for path_insert_sysroot().
-  (setup_dwfl_kernel): Simplify logic when finding the kernel path to send
-  to elfutils.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- setupdwfl.cxx | 19 ++++++++++++-------
- 1 file changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/setupdwfl.cxx b/setupdwfl.cxx
-index 2a87982..f6c3157 100644
---- a/setupdwfl.cxx
-+++ b/setupdwfl.cxx
-@@ -339,6 +339,13 @@ static char * path_insert_sysroot(string sysroot, string path)
- 
- void debuginfo_path_insert_sysroot(string sysroot)
- {
-+  // FIXME: This is a short-term fix, until we expect sysroot paths to
-+  // always end with a '/' (and never be empty).
-+  //
-+  // The path_insert_sysroot() function assumes that sysroot has a '/'
-+  // on the end. Make sure that is true.
-+  if (sysroot.back() != '/')
-+    sysroot.push_back('/');
-   debuginfo_path = path_insert_sysroot(sysroot, debuginfo_path);
-   debuginfo_usr_path = path_insert_sysroot(sysroot, debuginfo_usr_path);
- }
-@@ -358,13 +365,11 @@ setup_dwfl_kernel (unsigned *modules_found, systemtap_session &s)
-   // no way to set the dwfl_callback.debuginfo_path and always
-   // passs the plain kernel_release here.  So instead we have to
-   // hard-code this magic here.
--   string lib_path = "/lib/modules/" + s.kernel_release + "/build";
--   if (s.kernel_build_tree == string(s.sysroot + lib_path) ||
--       (s.kernel_build_tree == lib_path
--	&& s.sysroot == "/"))
--      elfutils_kernel_path = s.kernel_release;
--   else
--      elfutils_kernel_path = s.kernel_build_tree;
-+  string lib_path = s.sysroot + "/lib/modules/" + s.kernel_release + "/build";
-+  if (s.kernel_build_tree == lib_path)
-+    elfutils_kernel_path = s.kernel_release;
-+  else
-+    elfutils_kernel_path = s.kernel_build_tree;
-   offline_modules_found = 0;
- 
-   // First try to report full path modules.
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch b/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
deleted file mode 100644
index 8a3d39a5b8..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 2041085d1a700201dc088991ca8136e7935bf42f Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Wed, 21 Mar 2018 11:35:26 -0500
-Subject: [PATCH] sysroot: handle symbolic links with absolute name relative to
- sysroot
-
-In case of symbolic link found under sysroot point to absolute path,
-instead of trying to look for such absolute path in host system,
-apply sysroot prefix first.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- util.cxx | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 76 insertions(+)
-
-Index: git/util.cxx
-===================================================================
---- git.orig/util.cxx
-+++ git/util.cxx
-@@ -441,6 +441,64 @@ split_lines(const char *buf, size_t n)
-   return lines;
- }
- 
-+static string
-+follow_link(const string& name, const string& sysroot)
-+{
-+  char *linkname;
-+  ssize_t r;
-+  string retpath;
-+  struct stat st;
-+
-+  const char *f = name.c_str();
-+
-+  lstat(f, &st);
-+
-+  linkname = (char *) malloc(st.st_size + 1);
-+
-+  if (linkname)
-+    {
-+      r = readlink(f, linkname, st.st_size + 1);
-+      linkname[st.st_size] = '\0';
-+      /*
-+       * If we have non-empty sysroot and we got link that
-+       * points to absolute path name, we need to look at
-+       * this path relative to sysroot itself. access and
-+       * stat will follow symbolic links correctly only in
-+       * case with empty sysroot.
-+       */
-+      while (r != -1 && linkname && linkname[0] == '/')
-+	{
-+	  string fname1 = sysroot + linkname;
-+	  const char *f1 = fname1.c_str();
-+	  if (access(f1, X_OK) == 0
-+	      && stat(f1, &st) == 0
-+	      && S_ISREG(st.st_mode))
-+	    {
-+	      retpath = fname1;
-+	      break;
-+	    }
-+	  else if (lstat(f1, &st) == 0
-+		   && S_ISLNK(st.st_mode))
-+	    {
-+	      free(linkname);
-+	      linkname = (char *) malloc(st.st_size + 1);
-+	      if (linkname)
-+		{
-+		  r = readlink(f1, linkname, st.st_size + 1);
-+		  linkname[st.st_size] = '\0';
-+		}
-+	    }
-+	  else
-+	    {
-+	      break;
-+	    }
-+	}
-+    }
-+  free(linkname);
-+
-+  return retpath;
-+}
-+
- // Resolve an executable name to a canonical full path name, with the
- // same policy as execvp().  A program name not containing a slash
- // will be searched along the $PATH.
-@@ -465,6 +523,14 @@ string find_executable(const string& nam
-   if (name.find('/') != string::npos) // slash in the path already?
-     {
-       retpath = sysroot + name;
-+
-+      const char *f = retpath.c_str();
-+      if (sysroot != ""
-+	  && lstat(f, &st) == 0
-+	  && S_ISLNK(st.st_mode))
-+	{
-+	  retpath = follow_link(f, sysroot);
-+	}
-     }
-   else // Nope, search $PATH.
-     {
-@@ -493,6 +559,16 @@ string find_executable(const string& nam
-                   retpath = fname;
-                   break;
-                 }
-+              else if (sysroot != ""
-+                       && lstat(f, &st) == 0
-+                       && S_ISLNK(st.st_mode))
-+		{
-+		  retpath = follow_link(f, sysroot);
-+		  if (retpath != "")
-+		    {
-+		      break;
-+		    }
-+		}
-             }
-         }
-     }
diff --git a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
index b7ee0701b1..9313a5aba3 100644
--- a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
@@ -13,18 +13,18 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 6bd0c5fc4..2ea9b3cbf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -752,13 +752,16 @@ dnl We want either (or both) python probe support.
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -766,13 +766,16 @@ dnl We want either (or both) python prob
  AM_CONDITIONAL([HAVE_PYTHON_PROBES],
    [test "x$have_python2_support" = "xyes" -o "x$have_python3_support" = "xyes"])
  
 +AC_ARG_ENABLE([monitor], AS_HELP_STRING([--disable-monitor],[Disable monitor]))
 +if test "$enable_monitor" != "no"; then
  dnl Check for presence of json-c and ncurses for use in monitor mode
- PKG_CHECK_MODULES([jsonc], [json-c >= 0.12], [have_jsonc=yes], [have_jsonc=no])
+ PKG_CHECK_MODULES([jsonc], [json-c >= 0.11], [have_jsonc=yes], [have_jsonc=no])
  PKG_CHECK_MODULES([ncurses], [ncurses], [have_ncurses=yes], [have_ncurses=no])
 -AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes"])
  if test "${have_jsonc}" == "yes" -a "${have_ncurses}" == yes; then
@@ -35,6 +35,3 @@ index 6bd0c5fc4..2ea9b3cbf 100644
  
  AC_CACHE_CHECK([for assembler .section "?" flags support], stap_cv_sectionq, [
  old_CFLAGS="$CFLAGS"
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index e2f5204a02..a1e05579e6 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "4051c70c9318c837981384cbb23f3e9eb1bd0892"
-PV = "3.2"
+SRCREV = "48867d1cface9445d58e3c6e14497770b7eb77e1"
+PV = "3.3"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
@@ -10,19 +10,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://no-msgfmt-check.patch \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
-           file://0001-buildrun-remove-quotes-around-I-include-line.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch \
-           file://0001-Fixes-for-gcc-8.patch \
-           file://0001-Use-sysroot-when-looking-for-the-System.map-file.patch \
-           file://0001-debuginfo-lookup-with-sysroot-case-do-not-remove-sys.patch \
-           file://0001-Make-sure-sysroot-paths-don-t-end-with-a-slash.patch \
-           file://0001-sysroot-fix-short-release-r-option-handling.patch \
-           file://0001-Delay-adding-sysroot-path-to-module-name-in-case-of-.patch \
-           file://0001-Added-a-couple-of-small-sysroot-fixes.patch \
-           file://0001-_stp_umodule_relocate-needs-target-file-path-not-hos.patch \
-           file://0001-sysroot-handle-symbolic-links-with-absolute-name-rel.patch \
-           file://0001-sysroot-fix-short-release-r-option-handling-follow-u.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.17.1


