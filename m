Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EFE736226A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:40:07 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2013 05:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="266920212"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2013 05:40:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 15:41:43 +0300
Message-Id: <1373546503-10930-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus: upgrade to 1.6.10
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
X-List-Received-Date: Thu, 11 Jul 2013 12:40:08 -0000

dbus-ptest also upgraded to 1.6.10
systemd-address.patch removed; included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/dbus-1.init   |    0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/ptest.patch   |    0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/run-ptest     |    0
 .../test-run-path.patch                            |    0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/tmpdir.patch  |    0
 .../dbus/dbus-1.6.8/systemd-address.patch          |  187 --------------------
 .../{dbus-ptest_1.6.8.bb => dbus-ptest_1.6.10.bb}  |    4 +-
 meta/recipes-core/dbus/dbus.inc                    |    1 -
 meta/recipes-core/dbus/dbus_1.6.10.bb              |    6 +
 meta/recipes-core/dbus/dbus_1.6.8.bb               |    6 -
 10 files changed, 8 insertions(+), 196 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/ptest.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/run-ptest (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/test-run-path.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.8.bb => dbus-ptest_1.6.10.bb} (91%)
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.8.bb

diff --git a/meta/recipes-core/dbus/dbus-1.6.8/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.8/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch b/meta/recipes-core/dbus/dbus-1.6.10/ptest.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
rename to meta/recipes-core/dbus/dbus-1.6.10/ptest.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.8/run-ptest b/meta/recipes-core/dbus/dbus-1.6.10/run-ptest
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.8/run-ptest
rename to meta/recipes-core/dbus/dbus-1.6.10/run-ptest
diff --git a/meta/recipes-core/dbus/dbus-1.6.8/test-run-path.patch b/meta/recipes-core/dbus/dbus-1.6.10/test-run-path.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.8/test-run-path.patch
rename to meta/recipes-core/dbus/dbus-1.6.10/test-run-path.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.8/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.6.10/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.8/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.6.10/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch b/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
deleted file mode 100644
index ae1291c..0000000
--- a/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d728fdc655f17031da3bb129ab2fd17dadf0fe3a Mon Sep 17 00:00:00 2001
-From: Simon Peeters <peeters.simon@gmail.com>
-Date: Sun, 07 Oct 2012 14:59:30 +0000
-Subject: Set correct address when using --address=systemd:
-
-When dbus gets launched through systemd, we need to create an address
-string based on the sockets passed.
-
-The _dbus_append_addres_from_socket() function is responsible for
-extracting the address information from the file-descriptor and
-formatting it in a dbus friendly way.
-
-This fixes bus activation when running dbus under a systemd session.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=50962
-
-Signed-off-by: Simon Peeters <peeters.simon@gmail.com>
----
-diff --git a/dbus/dbus-server-unix.c b/dbus/dbus-server-unix.c
-index 130f66e..d995240 100644
---- a/dbus/dbus-server-unix.c
-+++ b/dbus/dbus-server-unix.c
-@@ -149,7 +149,7 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
-     }
-   else if (strcmp (method, "systemd") == 0)
-     {
--      int n, *fds;
-+      int i, n, *fds;
-       DBusString address;
- 
-       n = _dbus_listen_systemd_sockets (&fds, error);
-@@ -159,27 +159,39 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
-           return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-         }
- 
--      _dbus_string_init_const (&address, "systemd:");
-+      if (!_dbus_string_init (&address))
-+          goto systemd_oom;
- 
--      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
--      if (*server_p == NULL)
-+      for (i = 0; i < n; i++)
-         {
--          int i;
--
--          for (i = 0; i < n; i++)
-+          if (i > 0)
-             {
--              _dbus_close_socket (fds[i], NULL);
-+              if (!_dbus_string_append (&address, ";"))
-+                goto systemd_oom;
-             }
--          dbus_free (fds);
--
--          dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
--          return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-+          if (!_dbus_append_address_from_socket (fds[i], &address, error))
-+            goto systemd_err;
-         }
- 
-+      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
-+      if (*server_p == NULL)
-+        goto systemd_oom;
-+
-       dbus_free (fds);
- 
-       return DBUS_SERVER_LISTEN_OK;
--	}
-+  systemd_oom:
-+      _DBUS_SET_OOM (error);
-+  systemd_err:
-+      for (i = 0; i < n; i++)
-+        {
-+          _dbus_close_socket (fds[i], NULL);
-+        }
-+      dbus_free (fds);
-+      _dbus_string_free (&address);
-+
-+      return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-+    }
- #ifdef DBUS_ENABLE_LAUNCHD
-   else if (strcmp (method, "launchd") == 0)
-     {
-diff --git a/dbus/dbus-sysdeps-unix.c b/dbus/dbus-sysdeps-unix.c
-index b4ecc96..55743b1 100644
---- a/dbus/dbus-sysdeps-unix.c
-+++ b/dbus/dbus-sysdeps-unix.c
-@@ -55,6 +55,7 @@
- #include <netinet/in.h>
- #include <netdb.h>
- #include <grp.h>
-+#include <arpa/inet.h>
- 
- #ifdef HAVE_ERRNO_H
- #include <errno.h>
-@@ -4160,4 +4161,71 @@ _dbus_check_setuid (void)
- #endif
- }
- 
-+/**
-+ * Read the address from the socket and append it to the string
-+ *
-+ * @param fd the socket
-+ * @param address
-+ * @param error return location for error code
-+ */
-+dbus_bool_t
-+_dbus_append_address_from_socket (int         fd,
-+                                  DBusString *address,
-+                                  DBusError  *error)
-+{
-+  union {
-+      struct sockaddr sa;
-+      struct sockaddr_storage storage;
-+      struct sockaddr_un un;
-+      struct sockaddr_in ipv4;
-+      struct sockaddr_in6 ipv6;
-+  } socket;
-+  char hostip[INET6_ADDRSTRLEN];
-+  int size = sizeof (socket);
-+
-+  if (getsockname (fd, &socket.sa, &size))
-+    goto err;
-+
-+  switch (socket.sa.sa_family)
-+    {
-+    case AF_UNIX:
-+      if (socket.un.sun_path[0]=='\0')
-+        {
-+          if (_dbus_string_append_printf (address, "unix:abstract=%s", &(socket.un.sun_path[1])))
-+            return TRUE;
-+        }
-+      else
-+        {
-+          if (_dbus_string_append_printf (address, "unix:path=%s", socket.un.sun_path))
-+            return TRUE;
-+        }
-+      break;
-+    case AF_INET:
-+      if (inet_ntop (AF_INET, &socket.ipv4.sin_addr, hostip, sizeof (hostip)))
-+        if (_dbus_string_append_printf (address, "tcp:family=ipv4,host=%s,port=%u",
-+                   hostip, ntohs (socket.ipv4.sin_port)))
-+          return TRUE;
-+      break;
-+#ifdef AF_INET6
-+    case AF_INET6:
-+      if (inet_ntop (AF_INET6, &socket.ipv6.sin6_addr, hostip, sizeof (hostip)))
-+        if (_dbus_string_append_printf (address, "tcp:family=ipv6,host=%s,port=%u",
-+                   hostip, ntohs (socket.ipv6.sin6_port)))
-+          return TRUE;
-+      break;
-+#endif
-+    default:
-+      dbus_set_error (error,
-+                      _dbus_error_from_errno (EINVAL),
-+                      "Failed to read address from socket: Unknown socket type.");
-+      return FALSE;
-+    }
-+ err:
-+  dbus_set_error (error,
-+                  _dbus_error_from_errno (errno),
-+                  "Failed to open socket: %s",
-+                  _dbus_strerror (errno));
-+  return FALSE;
-+}
-+
- /* tests in dbus-sysdeps-util.c */
-diff --git a/dbus/dbus-sysdeps-unix.h b/dbus/dbus-sysdeps-unix.h
-index 9b70896..a265b33 100644
---- a/dbus/dbus-sysdeps-unix.h
-+++ b/dbus/dbus-sysdeps-unix.h
-@@ -138,6 +138,10 @@ dbus_bool_t _dbus_parse_uid (const DBusString  *uid_str,
- 
- void _dbus_close_all (void);
- 
-+dbus_bool_t _dbus_append_address_from_socket (int         fd,
-+                                              DBusString *address,
-+                                              DBusError  *error);
-+
- /** @} */
- 
- DBUS_END_DECLS
---
-cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
similarity index 91%
rename from meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
rename to meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
index 8d21666..6c0f404 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "3bf059c7dd5eda5f539a1b7cfe7a14a2"
-SRC_URI[sha256sum] = "fc1370ef38abeeb13f55c905ec002e60705fb0bfde3b8d21c8d6eb8056c11bac"
+SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
+SRC_URI[sha256sum] = "1f3d6f4a53a7121328f6cd685fc14440d72e6c0006ecb3312cc779c495915e86"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESPATH = "${FILE_DIRNAME}/dbus-${PV}"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8055824..b07aefa 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -16,7 +16,6 @@ INC_PR = "r6"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
-           file://systemd-address.patch \
            file://dbus-1.init"
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus_1.6.10.bb b/meta/recipes-core/dbus/dbus_1.6.10.bb
new file mode 100644
index 0000000..5b8220c
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.6.10.bb
@@ -0,0 +1,6 @@
+include dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
+SRC_URI[sha256sum] = "1f3d6f4a53a7121328f6cd685fc14440d72e6c0006ecb3312cc779c495915e86"
diff --git a/meta/recipes-core/dbus/dbus_1.6.8.bb b/meta/recipes-core/dbus/dbus_1.6.8.bb
deleted file mode 100644
index facc02e..0000000
--- a/meta/recipes-core/dbus/dbus_1.6.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include dbus.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "3bf059c7dd5eda5f539a1b7cfe7a14a2"
-SRC_URI[sha256sum] = "fc1370ef38abeeb13f55c905ec002e60705fb0bfde3b8d21c8d6eb8056c11bac"
-- 
1.7.10.4


