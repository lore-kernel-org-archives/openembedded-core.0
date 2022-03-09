Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B35C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 22:22:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.2972.1646864545062574475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oOWM2POS;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id d10so8129359eje.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=keSEZ6a7s7hk7hy/W2Nwwpic5L2LJp2IIxa+AlZBdo8=;
        b=oOWM2POSHahaOVqwvhZr6gbxCLXb/mCGfX4/z+LuYpBegwMVI+FQM+BejiTWqSdfe0
         z0AF7z2QECPLSnJDAIHFpkbIFjo5L2SDklVfVTOjd03itdnOIxkXLu4Ea9sWu6Q98RH4
         ivahMF0IHYmroyxQeCz+hiqQ1QdoBQeaTEr0xKW6zJi6aqSwQIxj8sZwOak+QsrZk4PR
         DKLpbTI/Iva7DXWPNNYwG8e/XTPI2AywWgJjOzu67jO8W4ogAwsKdLLFuG19nKhMLeJi
         IM8GNc16k6dxHheOrj/0FOFQ1bLwgf+lY7l0AGUnk/k84d5qC9psjbjAtr1w8eREpc1h
         yFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=keSEZ6a7s7hk7hy/W2Nwwpic5L2LJp2IIxa+AlZBdo8=;
        b=c0KK2PHObkwrfSw2o9tIEo+1lWkWOFGSw2HucgeLGIXUMYgSShDGNSzkp9BKqCU7/7
         mrL0IbD9exKZ4HTGvaBM/OdbJMrSVVvvZMejxvLpUjL1evrLX9rvFd3aOgj+TZL2wykJ
         2GnpT89ylEZncXyc3x4sAhPxG3EuN3moOJuUUt1IFohO7pRzADlRVqXNIVyzPieTM7W3
         nYe+cO30SQ6xZ6DA1dkW+NPY5MzFFAp/f+gAbKI9QR3ORKtHI2xohMEJmSoAXFrQuUhc
         oTowsDFsqXprPU56zYjcBxRyzV+H7r6MtBks3uJ+Dz3PK7vaqqQmBl6txowZVrSN27dV
         y2nQ==
X-Gm-Message-State: AOAM532yQCqaNFqjHFXYZXgBn0jnDVm6yeZsBGVIR9WeoR4UBwgcX5oA
	NQoFK4kuvzgwP1IhYCKJNY/4jJMDrvQ=
X-Google-Smtp-Source: 
 ABdhPJy0itwMGCRE9Dik/SSG+awV/5/BLunTEJN+U2Knf54rg6EvNaXnRA2Bt2ICogd/Y6jVfrpkSw==
X-Received: by 2002:a17:906:1e91:b0:6ae:99d9:93b1 with SMTP id
 e17-20020a1709061e9100b006ae99d993b1mr1733004ejj.111.1646864543537;
        Wed, 09 Mar 2022 14:22:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b006db0dcf6746sm1173699ejb.216.2022.03.09.14.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:22:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] dbus: update 1.12.22 -> 1.14.0
Date: Wed,  9 Mar 2022 23:22:14 +0100
Message-Id: <20220309222214.4040432-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309222214.4040432-1-alex@linutronix.de>
References: <20220309222214.4040432-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 22:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162995

Drop patches:
clear-guid_from_server-if-send_negotiate_unix_f.patch
stop_using_selinux_set_mapping.patch
(both merged upstream)

python-config.patch
(patched code removed upstream)

License-Update: whitespace fixes

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...from_server-if-send_negotiate_unix_f.patch | 104 ------------
 .../dbus/dbus/python-config.patch             |  34 ----
 .../dbus/stop_using_selinux_set_mapping.patch | 148 ------------------
 .../dbus/{dbus_1.12.22.bb => dbus_1.14.0.bb}  |  11 +-
 4 files changed, 4 insertions(+), 293 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/python-config.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
 rename meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.14.0.bb} (94%)

diff --git a/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch b/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
deleted file mode 100644
index 6bb6d9c82e..0000000000
--- a/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From b8f84bd39485d3977625c9a8b8e8cff5d23be56f Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Thu, 27 Feb 2014 09:05:02 +0800
-Subject: [PATCH] dbus: clear guid_from_server if send_negotiate_unix_fd
- failed
-
-Upstream-Status: Submitted
-
-bus-test dispatch test failed with below information:
-    ./bus/bus-test: Running message dispatch test
-    Activating service name='org.freedesktop.DBus.TestSuiteEchoService'
-    Successfully activated service 'org.freedesktop.DBus.TestSuiteEchoService'
-    6363: assertion failed "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0" file "dbus-auth.c" line 1545 function process_ok
-      ./bus/bus-test(_dbus_print_backtrace+0x29) [0x80cb969]
-      ./bus/bus-test(_dbus_abort+0x14) [0x80cfb44]
-      ./bus/bus-test(_dbus_real_assert+0x53) [0x80b52c3]
-      ./bus/bus-test() [0x80e24da]
-      ./bus/bus-test(_dbus_auth_do_work+0x388) [0x80e3848]
-      ./bus/bus-test() [0x80aea49]
-      ./bus/bus-test() [0x80affde]
-      ./bus/bus-test(_dbus_transport_handle_watch+0xb1) [0x80ad841]
-      ./bus/bus-test(_dbus_connection_handle_watch+0x104) [0x8089174]
-      ./bus/bus-test(dbus_watch_handle+0xd8) [0x80b15e8]
-      ./bus/bus-test(_dbus_loop_iterate+0x4a9) [0x80d1509]
-      ./bus/bus-test(bus_test_run_clients_loop+0x5d) [0x808129d]
-      ./bus/bus-test() [0x806cab0]
-      ./bus/bus-test() [0x806e0ca]
-      ./bus/bus-test() [0x806da6f]
-      ./bus/bus-test(_dbus_test_oom_handling+0x18c) [0x80b5c8c]
-      ./bus/bus-test() [0x806f723]
-      ./bus/bus-test(bus_dispatch_test+0x3c) [0x8071aac]
-      ./bus/bus-test(main+0x1b7) [0x805acc7]
-      /lib/libc.so.6(__libc_start_main+0xf3) [0x45f919b3]
-      ./bus/bus-test() [0x805ae39]
-
-The stack is below:
-    #0  0xffffe425 in __kernel_vsyscall ()
-    #1  0x45fa62d6 in raise () from /lib/libc.so.6
-    #2  0x45fa9653 in abort () from /lib/libc.so.6
-    #3  0x080cfb65 in _dbus_abort () at dbus-sysdeps.c:94
-    #4  0x080b52c3 in _dbus_real_assert (condition=0,
-        condition_text=condition_text@entry=0x8117a38 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
-        file=file@entry=0x8117273 "dbus-auth.c", line=line@entry=1545,
-        func=func@entry=0x8117f8e <__FUNCTION__.3492> "process_ok")
-        data=0x8157290) at dbus-connection.c:1515
-    #0  0x00000033fee353e9 in raise () from /lib64/libc.so.6
-    #1  0x00000033fee38508 in abort () from /lib64/libc.so.6
-    #2  0x000000000047d585 in _dbus_abort () at dbus-sysdeps.c:94
-    #3  0x0000000000466486 in _dbus_real_assert (condition=<optimized out>,
-        condition_text=condition_text@entry=0x4c2988 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
-        file=file@entry=0x4c21a5 "dbus-auth.c", line=line@entry=1546,
-        func=func@entry=0x4c2fce <__FUNCTION__.3845> "process_ok")
-        at dbus-internals.c:931
-    #4  0x000000000048d424 in process_ok (args_from_ok=0x7fffffffe480,
-        auth=0x6ff340) at dbus-auth.c:1546
-    #5  handle_client_state_waiting_for_data (auth=0x6ff340,
-        command=<optimized out>, args=0x7fffffffe480) at dbus-auth.c:1996
-    #6  0x000000000048e789 in process_command (auth=0x6ff340) at dbus-auth.c:2208
-    #7  _dbus_auth_do_work (auth=0x6ff340) at dbus-auth.c:2458
-    #8  0x000000000046091d in do_authentication (
-        transport=transport@entry=0x6ffaa0, do_reading=do_reading@entry=1,
-        do_writing=do_writing@entry=0,
-        auth_completed=auth_completed@entry=0x7fffffffe55c)
-        at dbus-transport-socket.c:442
-    #9  0x0000000000461d08 in socket_handle_watch (transport=0x6ffaa0,
-        watch=0x6f4190, flags=1) at dbus-transport-socket.c:921
-    #10 0x000000000045fa3a in _dbus_transport_handle_watch (transport=0x6ffaa0,
-
-Once send_negotiate_unix_fd failed, this failure will happen, since
-auth->guid_from_server has been set to some value before
-send_negotiate_unix_fd. send_negotiate_unix_fd failure will lead to
-this auth be handled by process_ok again, but this auth->guid_from_server
-is not zero.
-
-So we should clear auth->guid_from_server if send_negotiate_unix_fd failed
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- dbus/dbus-auth.c |    9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c
-index d2c37a7..37b45c6 100644
---- a/dbus/dbus-auth.c
-+++ b/dbus/dbus-auth.c
-@@ -1571,8 +1571,13 @@ process_ok(DBusAuth *auth,
-   _dbus_verbose ("Got GUID '%s' from the server\n",
-                  _dbus_string_get_const_data (& DBUS_AUTH_CLIENT (auth)->guid_from_server));
- 
--  if (auth->unix_fd_possible)
--    return send_negotiate_unix_fd(auth);
-+  if (auth->unix_fd_possible) {
-+     if (!send_negotiate_unix_fd(auth)) {
-+         _dbus_string_set_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server, 0);
-+         return FALSE;
-+     }
-+     return TRUE;
-+  }
- 
-   _dbus_verbose("Not negotiating unix fd passing, since not possible\n");
-   return send_begin (auth);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
deleted file mode 100644
index da2f10c726..0000000000
--- a/meta/recipes-core/dbus/dbus/python-config.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-When building the dbus-ptest package, we have to enable python.  However
-checking if the host-system python has the necessary library isn't useful.
-
-Disable the python module check for cross compiling.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
----
- configure.ac | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 80d27b4..becc1cc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -279,13 +279,6 @@ if test "x$enable_tests" = xyes; then
-   # full test coverage is required, Python is a hard dependency
-   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygi])
-   AM_PATH_PYTHON([2.6])
--  AC_MSG_CHECKING([for Python modules for full test coverage])
--  if "$PYTHON" -c "import dbus, gi.repository.GObject, dbus.mainloop.glib"; then
--    AC_MSG_RESULT([yes])
--  else
--    AC_MSG_RESULT([no])
--    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject, dbus.mainloop.glib Python modules])
--  fi
- else
-   # --enable-tests not given: do not abort if Python is missing
-   AM_PATH_PYTHON([2.6], [], [:])
--- 
-1.9.1
-
diff --git a/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch b/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
deleted file mode 100644
index 7035098e41..0000000000
--- a/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 6072f8b24153d844a3033108a17bcd0c1a967816 Mon Sep 17 00:00:00 2001
-From: Laurent Bigonville <bigon@bigon.be>
-Date: Sat, 3 Mar 2018 11:15:23 +0100
-Subject: [PATCH] Stop using selinux_set_mapping() function
-
-Currently, if the "dbus" security class or the associated AV doesn't
-exist, dbus-daemon fails to initialize and exits immediately. Also the
-security classes or access vector cannot be reordered in the policy.
-This can be a problem for people developing their own policy or trying
-to access a machine where, for some reasons, there is not policy defined
-at all.
-
-The code here copy the behaviour of the selinux_check_access() function.
-We cannot use this function here as it doesn't allow us to define the
-AVC entry reference.
-
-See the discussion at https://marc.info/?l=selinux&m=152163374332372&w=2
-
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/issues/198
----
- bus/selinux.c | 75 ++++++++++++++++++++++++++++-----------------------
- 1 file changed, 42 insertions(+), 33 deletions(-)
-
-
-Upstream-Status: Backport
-Signed-off-by: Nisha.Parrakat <Nisha.Parrakat@kpit.com>
-diff --git a/bus/selinux.c b/bus/selinux.c
-
---- a/bus/selinux.c	2021-08-11 14:45:59.048513026 +0000
-+++ b/bus/selinux.c	2021-08-11 14:57:47.144846966 +0000
-@@ -311,24 +311,6 @@
- #endif
- }
- 
--/*
-- * Private Flask definitions; the order of these constants must
-- * exactly match that of the structure array below!
-- */
--/* security dbus class constants */
--#define SECCLASS_DBUS       1
--
--/* dbus's per access vector constants */
--#define DBUS__ACQUIRE_SVC   1
--#define DBUS__SEND_MSG      2
--
--#ifdef HAVE_SELINUX
--static struct security_class_mapping dbus_map[] = {
--  { "dbus", { "acquire_svc", "send_msg", NULL } },
--  { NULL }
--};
--#endif /* HAVE_SELINUX */
--
- /**
-  * Establish dynamic object class and permission mapping and
-  * initialize the user space access vector cache (AVC) for D-Bus and set up
-@@ -350,13 +332,6 @@
- 
-   _dbus_verbose ("SELinux is enabled in this kernel.\n");
- 
--  if (selinux_set_mapping (dbus_map) < 0)
--    {
--      _dbus_warn ("Failed to set up security class mapping (selinux_set_mapping():%s).",
--                   strerror (errno));
--      return FALSE; 
--    }
--
-   avc_entry_ref_init (&aeref);
-   if (avc_init ("avc", &mem_cb, &log_cb, &thread_cb, &lock_cb) < 0)
-     {
-@@ -421,19 +396,53 @@
- static dbus_bool_t
- bus_selinux_check (BusSELinuxID        *sender_sid,
-                    BusSELinuxID        *override_sid,
--                   security_class_t     target_class,
--                   access_vector_t      requested,
-+                   const char          *target_class,
-+                   const char          *requested,
- 		   DBusString          *auxdata)
- {
-+  int saved_errno;
-+  security_class_t security_class;
-+  access_vector_t requested_access;
-+
-   if (!selinux_enabled)
-     return TRUE;
- 
-+  security_class = string_to_security_class (target_class);
-+  if (security_class == 0)
-+    {
-+      saved_errno = errno;
-+      log_callback (SELINUX_ERROR, "Unknown class %s", target_class);
-+      if (security_deny_unknown () == 0)
-+        {
-+          return TRUE;
-+	}
-+
-+      _dbus_verbose ("Unknown class %s\n", target_class);
-+      errno = saved_errno;
-+      return FALSE;
-+    }
-+
-+  requested_access = string_to_av_perm (security_class, requested);
-+  if (requested_access == 0)
-+    {
-+      saved_errno = errno;
-+      log_callback (SELINUX_ERROR, "Unknown permission %s for class %s", requested, target_class);
-+      if (security_deny_unknown () == 0)
-+        {
-+          return TRUE;
-+	}
-+
-+      _dbus_verbose ("Unknown permission %s for class %s\n", requested, target_class);
-+      errno = saved_errno;
-+      return FALSE;
-+    }
-+
-   /* Make the security check.  AVC checks enforcing mode here as well. */
-   if (avc_has_perm (SELINUX_SID_FROM_BUS (sender_sid),
-                     override_sid ?
-                     SELINUX_SID_FROM_BUS (override_sid) :
-                     bus_sid,
--                    target_class, requested, &aeref, auxdata) < 0)
-+                    security_class, requested_access, &aeref, auxdata) < 0)
-     {
-     switch (errno)
-       {
-@@ -500,8 +509,8 @@
-   
-   ret = bus_selinux_check (connection_sid,
- 			   service_sid,
--			   SECCLASS_DBUS,
--			   DBUS__ACQUIRE_SVC,
-+			   "dbus",
-+			   "acquire_svc",
- 			   &auxdata);
- 
-   _dbus_string_free (&auxdata);
-@@ -629,8 +638,8 @@
- 
-   ret = bus_selinux_check (sender_sid, 
- 			   recipient_sid,
--			   SECCLASS_DBUS, 
--			   DBUS__SEND_MSG,
-+			   "dbus", 
-+			   "send_msg",
- 			   &auxdata);
- 
-   _dbus_string_free (&auxdata);
diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
similarity index 94%
rename from meta/recipes-core/dbus/dbus_1.12.22.bb
rename to meta/recipes-core/dbus/dbus_1.14.0.bb
index 792f34c7ef..7598c45f8e 100644
--- a/meta/recipes-core/dbus/dbus_1.12.22.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -7,18 +7,15 @@ inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
 
-SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
-           file://python-config.patch \
            file://tmpdir.patch \
            file://dbus-1.init \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://stop_using_selinux_set_mapping.patch \
 "
 
-SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
+SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
@@ -37,7 +34,7 @@ PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[x11] = "--enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
 PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
-- 
2.30.2


