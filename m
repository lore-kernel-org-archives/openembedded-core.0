Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 065607F838
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z7so4115203wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ATT01zBKRJRwTbTlU54xLrqR5NNZuEVjOF+qFJthlTs=;
	b=X4nQN0WfqFlYd/RWei7p1W7WwXrQc/wjuxsrhneroGjB/7d4VBQDkDwOErT6QHNhaM
	VzXVsy3PMl4hHpe5z5c+yMOEQEiQWUrL0/R1exI6cPqsKg9AgGVggydE/SLCkZPihHWS
	16SiMOFEftuUcVZD/Gw9bR2sIHzOt0H0migpH4H6SVj5XkD4SlyhLnMN2wFcuVly/QK6
	DnOP4LLyTTWRwWM0VeQhF/zL/W9O6Xo0Gpibvc2M4dSaw/LOeRdZ6S/Wkb975D6KKUa2
	pffV/fDmtz2+7Q70cne2/WrcSEz3VU8F1d3kgkkp3BfYltEewtyZBMUeEGOod5geXGNn
	Zr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ATT01zBKRJRwTbTlU54xLrqR5NNZuEVjOF+qFJthlTs=;
	b=f+LTqtM5yj0EtMZ1wG/3MxTdtlAJtfg0+GC3WuSXZPpHjpbpVqH3M8LNflKgACjAg0
	KOwE/rCkJsaMgWcECxBeA+RhTYamyGr1ZBljRcpuL+uTIBiAllwrZadMcgEg1AbTyvYO
	qtYXE/DG0El7Z7HHQxA03WBxojPfigBWDJ5bzyb2eJOQpe59ghffCe6oo3rZg9PcchIe
	psqi6yHjvumwTfLqskWucrISHDROGJxYbNLZvMBjUMl+DXMjptcTbio53gco+xYGSKwc
	iQIf2D42ouPPEJbB+OQYQqA/w+UYf2jHpJ/H2im92KH8HEuEfjt+Dgm+hcXnjVxUjWQx
	h0TA==
X-Gm-Message-State: APjAAAVKEeNpGqgODDyjafS9kIwbztZMbIWMkjpotf89V++5TPrjAy3e
	9Gvs8/mWGAj5dGSh88cD1weCm410
X-Google-Smtp-Source: APXvYqwLCs+6ePaLHHJ3l36w95tN4KiRMwnowtpEGmc1In4Qs6A0j2D628ppuYlJeoAOOHtUWdnX4g==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr11729984wrv.380.1575560654343;
	Thu, 05 Dec 2019 07:44:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:45 +0100
Message-Id: <20191205154357.121346-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/24] bluez: update 5.50 -> 5.52
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:15 -0000

Drop a big pile of backports.

Disable zsh completions, as they're unlikely to be useful.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  22 +-
 ...d-without-systemd-in-the-user-sessio.patch |  12 +-
 ...kefile.am-Fix-a-race-issue-for-tools.patch |  30 --
 ...x-build-after-y2038-changes-in-glibc.patch |  68 ---
 ...1-tools-btpclient.c-include-signal.h.patch |  30 --
 .../bluez5/bluez5/CVE-2018-10910.patch        | 505 ------------------
 .../bluez5/bluez5/gcc9-fixes.patch            | 301 -----------
 .../bluez5/bluez5/out-of-tree.patch           |  26 -
 .../bluez5/{bluez5_5.50.bb => bluez5_5.52.bb} |   4 +-
 9 files changed, 16 insertions(+), 982 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/out-of-tree.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.50.bb => bluez5_5.52.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 484509350b0..150d909d735 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -46,20 +46,13 @@ PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
-SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-    file://out-of-tree.patch \
-    file://init \
-    file://run-ptest \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
-    file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-    file://0001-test-gatt-Fix-hung-issue.patch \
-    file://0001-Makefile.am-Fix-a-race-issue-for-tools.patch \
-    file://CVE-2018-10910.patch \
-    file://gcc9-fixes.patch \
-    file://0001-tools-Fix-build-after-y2038-changes-in-glibc.patch \
-    file://0001-tools-btpclient.c-include-signal.h.patch \
-"
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
+           file://init \
+           file://run-ptest \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
+           file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           file://0001-test-gatt-Fix-hung-issue.patch \
+           "
 S = "${WORKDIR}/bluez-${PV}"
 
 CVE_PRODUCT = "bluez"
@@ -70,6 +63,7 @@ EXTRA_OECONF = "\
   --enable-test \
   --enable-datafiles \
   --enable-library \
+  --without-zsh-completion-dir \
 "
 
 # bluez5 builds a large number of useful utilities but does not
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
index da7140922d9..618ed734a96 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
@@ -1,4 +1,4 @@
-From 99ccdbe155028c4c789803a429072675b87d0c3a Mon Sep 17 00:00:00 2001
+From f74eb97c9fb3c0ee2895742e773ac6a3c41c999c Mon Sep 17 00:00:00 2001
 From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
 Date: Sat, 12 Oct 2013 17:45:25 +0200
 Subject: [PATCH] Allow using obexd without systemd in the user session
@@ -17,22 +17,22 @@ http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
 Signed-off-by: Javier Viguera <javier.viguera@digi.com>
 
 ---
- Makefile.obexd                                                  | 4 ++--
- obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
+ Makefile.obexd                                                | 4 ++--
+ .../src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
  rename obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} (76%)
 
 diff --git a/Makefile.obexd b/Makefile.obexd
-index c462692..0325f66 100644
+index de59d29..73004a3 100644
 --- a/Makefile.obexd
 +++ b/Makefile.obexd
 @@ -1,12 +1,12 @@
  if SYSTEMD
- systemduserunitdir = @SYSTEMD_USERUNITDIR@
+ systemduserunitdir = $(SYSTEMD_USERUNITDIR)
  systemduserunit_DATA = obexd/src/obex.service
 +endif
  
- dbussessionbusdir = @DBUS_SESSIONBUSDIR@
+ dbussessionbusdir = $(DBUS_SESSIONBUSDIR)
  dbussessionbus_DATA = obexd/src/org.bluez.obex.service
 -endif
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
deleted file mode 100644
index b6cb978393e..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 117c41242c01e057295aed80ed973c6dc7e35fe2 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 8 Oct 2019 11:01:56 +0100
-Subject: [PATCH BlueZ] Makefile.am: add missing mkdir in rules generation
-
-In parallel out-of-tree builds it's possible that tools/*.rules are
-generated before the target directory has been implicitly created. Solve this by
-creating the directory before writing into it.
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2ac28b23d..e7bcd2366 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -589,6 +589,7 @@ src/builtin.h: src/genbuiltin $(builtin_sources)
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
- 
- tools/%.rules:
-+	$(AM_V_at)$(MKDIR_P) tools
- 	$(AM_V_GEN)cp $(srcdir)/$(subst 97-,,$@) $@
- 
- $(lib_libbluetooth_la_OBJECTS): $(local_headers)
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
deleted file mode 100644
index 9ca20ae53b9..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f36f71f60b1e68c0f12e615b9b128d089ec3dd19 Mon Sep 17 00:00:00 2001
-From: Bastien Nocera <hadess@hadess.net>
-Date: Fri, 7 Jun 2019 09:51:33 +0200
-Subject: [PATCH] tools: Fix build after y2038 changes in glibc
-
-The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
-to fix the build.
-
-Upstream-Status: backport commit f36f71f60b1e68c0f12e615b9b128d089ec3dd19
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
----
- tools/l2test.c | 6 +++++-
- tools/rctest.c | 6 +++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/tools/l2test.c b/tools/l2test.c
-index e755ac881..e787c2ce2 100644
---- a/tools/l2test.c
-+++ b/tools/l2test.c
-@@ -55,6 +55,10 @@
- #define BREDR_DEFAULT_PSM	0x1011
- #define LE_DEFAULT_PSM		0x0080
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -907,7 +911,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
-diff --git a/tools/rctest.c b/tools/rctest.c
-index 94490f462..bc8ed875d 100644
---- a/tools/rctest.c
-+++ b/tools/rctest.c
-@@ -50,6 +50,10 @@
- 
- #include "src/shared/util.h"
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -505,7 +509,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
--- 
-2.19.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch
deleted file mode 100644
index 620aaabc687..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0b1766514f6847c7367fce07f19a750ec74c11a6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 26 Sep 2019 16:19:34 +0800
-Subject: [PATCH] tools/btpclient.c: include signal.h
-
-Fix compile failure when configure --enable-btpclient:
-btpclient.c:2834:7: error: 'SIGINT' undeclared (first use in this function)
-
-Upstream-Status: Backport [A subset of the full fix that went upstream]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- tools/btpclient.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/btpclient.c b/tools/btpclient.c
-index b217df5..aece7fe 100644
---- a/tools/btpclient.c
-+++ b/tools/btpclient.c
-@@ -29,6 +29,7 @@
- #include <stdlib.h>
- #include <assert.h>
- #include <getopt.h>
-+#include <signal.h>
- 
- #include <ell/ell.h>
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
deleted file mode 100644
index 2a780774439..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
+++ /dev/null
@@ -1,505 +0,0 @@
-From 977321f2c7f974ea68a3d90df296c66189a3f254 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 21 Jun 2019 17:57:35 +0900
-Subject: [PATCH] CVE-2018-10910
-
-A bug in Bluez may allow for the Bluetooth Discoverable state being set to on
-when no Bluetooth agent is registered with the system. This situation could
-lead to the unauthorized pairing of certain Bluetooth devices without any
-form of authentication.
-
-CVE: CVE-2018-10910
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Subject:    [PATCH BlueZ 1/4] client: Add discoverable-timeout command
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-25 10:20:32
-Message-ID: 20180725102035.19439-1-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This adds discoverable-timeout command which can be used to get/set
-DiscoverableTimeout property:
-
-[bluetooth]# discoverable-timeout 180
-Changing discoverable-timeout 180 succeeded
----
- client/main.c       |  82 +++++++++++++++++++++++++++++++++-
- doc/adapter-api.txt |   6 +++
- src/adapter.c       | 125 ++++++++++++++++++++++++++++++++++++++++++++++------
- 3 files changed, 198 insertions(+), 15 deletions(-)
-
-diff --git a/client/main.c b/client/main.c
-index 87323d8..1a66a3a 100644
---- a/client/main.c
-+++ b/client/main.c
-@@ -877,6 +877,7 @@ static void cmd_show(int argc, char *argv[])
- 	print_property(proxy, "Class");
- 	print_property(proxy, "Powered");
- 	print_property(proxy, "Discoverable");
-+	print_property(proxy, "DiscoverableTimeout");
- 	print_property(proxy, "Pairable");
- 	print_uuids(proxy);
- 	print_property(proxy, "Modalias");
-@@ -1061,6 +1062,47 @@ static void cmd_discoverable(int argc, char *argv[])
- 	return bt_shell_noninteractive_quit(EXIT_FAILURE);
- }
- 
-+static void cmd_discoverable_timeout(int argc, char *argv[])
-+{
-+	uint32_t value;
-+	char *endptr = NULL;
-+	char *str;
-+
-+	if (argc < 2) {
-+		DBusMessageIter iter;
-+
-+		if (!g_dbus_proxy_get_property(default_ctrl->proxy,
-+					"DiscoverableTimeout", &iter)) {
-+			bt_shell_printf("Unable to get DiscoverableTimeout\n");
-+			return bt_shell_noninteractive_quit(EXIT_FAILURE);
-+		}
-+
-+		dbus_message_iter_get_basic(&iter, &value);
-+
-+		bt_shell_printf("DiscoverableTimeout: %d seconds\n", value);
-+
-+		return;
-+	}
-+
-+	value = strtol(argv[1], &endptr, 0);
-+	if (!endptr || *endptr != '\0' || value > UINT32_MAX) {
-+		bt_shell_printf("Invalid argument\n");
-+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
-+	}
-+
-+	str = g_strdup_printf("discoverable-timeout %d", value);
-+
-+	if (g_dbus_proxy_set_property_basic(default_ctrl->proxy,
-+					"DiscoverableTimeout",
-+					DBUS_TYPE_UINT32, &value,
-+					generic_callback, str, g_free))
-+		return;
-+
-+	g_free(str);
-+
-+	return bt_shell_noninteractive_quit(EXIT_FAILURE);
-+}
-+
- static void cmd_agent(int argc, char *argv[])
- {
- 	dbus_bool_t enable;
-@@ -1124,6 +1166,7 @@ static struct set_discovery_filter_args {
- 	char **uuids;
- 	size_t uuids_len;
- 	dbus_bool_t duplicate;
-+	dbus_bool_t discoverable;
- 	bool set;
- } filter = {
- 	.rssi = DISTANCE_VAL_INVALID,
-@@ -1163,6 +1206,11 @@ static void set_discovery_filter_setup(DBusMessageIter *iter, void *user_data)
- 						DBUS_TYPE_BOOLEAN,
- 						&args->duplicate);
- 
-+	if (args->discoverable)
-+		g_dbus_dict_append_entry(&dict, "Discoverable",
-+						DBUS_TYPE_BOOLEAN,
-+						&args->discoverable);
-+
- 	dbus_message_iter_close_container(iter, &dict);
- }
- 
-@@ -1320,6 +1368,26 @@ static void cmd_scan_filter_duplicate_data(int argc, char *argv[])
- 	filter.set = false;
- }
- 
-+static void cmd_scan_filter_discoverable(int argc, char *argv[])
-+{
-+	if (argc < 2 || !strlen(argv[1])) {
-+		bt_shell_printf("Discoverable: %s\n",
-+				filter.discoverable ? "on" : "off");
-+		return bt_shell_noninteractive_quit(EXIT_SUCCESS);
-+	}
-+
-+	if (!strcmp(argv[1], "on"))
-+		filter.discoverable = true;
-+	else if (!strcmp(argv[1], "off"))
-+		filter.discoverable = false;
-+	else {
-+		bt_shell_printf("Invalid option: %s\n", argv[1]);
-+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
-+	}
-+
-+	filter.set = false;
-+}
-+
- static void filter_clear_uuids(void)
- {
- 	g_strfreev(filter.uuids);
-@@ -1348,6 +1416,11 @@ static void filter_clear_duplicate(void)
- 	filter.duplicate = false;
- }
- 
-+static void filter_clear_discoverable(void)
-+{
-+	filter.discoverable = false;
-+}
-+
- struct clear_entry {
- 	const char *name;
- 	void (*clear) (void);
-@@ -1359,6 +1432,7 @@ static const struct clear_entry filter_clear[] = {
- 	{ "pathloss", filter_clear_pathloss },
- 	{ "transport", filter_clear_transport },
- 	{ "duplicate-data", filter_clear_duplicate },
-+	{ "discoverable", filter_clear_discoverable },
- 	{}
- };
- 
-@@ -2468,7 +2542,11 @@ static const struct bt_shell_menu scan_menu = {
- 	{ "duplicate-data", "[on/off]", cmd_scan_filter_duplicate_data,
- 				"Set/Get duplicate data filter",
- 				NULL },
--	{ "clear", "[uuids/rssi/pathloss/transport/duplicate-data]",
-+	{ "discoverable", "[on/off]", cmd_scan_filter_discoverable,
-+				"Set/Get discoverable filter",
-+				NULL },
-+	{ "clear",
-+		"[uuids/rssi/pathloss/transport/duplicate-data/discoverable]",
- 				cmd_scan_filter_clear,
- 				"Clears discovery filter.",
- 				filter_clear_generator },
-@@ -2549,6 +2627,8 @@ static const struct bt_shell_menu main_menu = {
- 	{ "discoverable", "<on/off>", cmd_discoverable,
- 					"Set controller discoverable mode",
- 							NULL },
-+	{ "discoverable-timeout", "[value]", cmd_discoverable_timeout,
-+					"Set discoverable timeout", NULL },
- 	{ "agent",        "<on/off/capability>", cmd_agent,
- 				"Enable/disable agent with given capability",
- 							capability_generator},
-diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
-index d14d0ca..4791af2 100644
---- a/doc/adapter-api.txt
-+++ b/doc/adapter-api.txt
-@@ -113,6 +113,12 @@ Methods		void StartDiscovery()
- 				generated for either ManufacturerData and
- 				ServiceData everytime they are discovered.
- 
-+			bool Discoverable (Default: false)
-+
-+				Make adapter discoverable while discovering,
-+				if the adapter is already discoverable this
-+				setting this filter won't do anything.
-+
- 			When discovery filter is set, Device objects will be
- 			created as new devices with matching criteria are
- 			discovered regardless of they are connectable or
-diff --git a/src/adapter.c b/src/adapter.c
-index af340fd..822bd34 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -157,6 +157,7 @@ struct discovery_filter {
- 	int16_t rssi;
- 	GSList *uuids;
- 	bool duplicate;
-+	bool discoverable;
- };
- 
- struct watch_client {
-@@ -196,6 +197,7 @@ struct btd_adapter {
- 	char *name;			/* controller device name */
- 	char *short_name;		/* controller short name */
- 	uint32_t supported_settings;	/* controller supported settings */
-+	uint32_t pending_settings;	/* pending controller settings */
- 	uint32_t current_settings;	/* current controller settings */
- 
- 	char *path;			/* adapter object path */
-@@ -213,6 +215,7 @@ struct btd_adapter {
- 
- 	bool discovering;		/* discovering property state */
- 	bool filtered_discovery;	/* we are doing filtered discovery */
-+	bool filtered_discoverable;	/* we are doing filtered discovery */
- 	bool no_scan_restart_delay;	/* when this flag is set, restart scan
- 					 * without delay */
- 	uint8_t discovery_type;		/* current active discovery type */
-@@ -509,8 +512,10 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
- 	changed_mask = adapter->current_settings ^ settings;
- 
- 	adapter->current_settings = settings;
-+	adapter->pending_settings &= ~changed_mask;
- 
- 	DBG("Changed settings: 0x%08x", changed_mask);
-+	DBG("Pending settings: 0x%08x", adapter->pending_settings);
- 
- 	if (changed_mask & MGMT_SETTING_POWERED) {
- 	        g_dbus_emit_property_changed(dbus_conn, adapter->path,
-@@ -596,10 +601,31 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
- 							uint8_t mode)
- {
- 	struct mgmt_mode cp;
-+	uint32_t setting = 0;
- 
- 	memset(&cp, 0, sizeof(cp));
- 	cp.val = mode;
- 
-+	switch (mode) {
-+	case MGMT_OP_SET_POWERED:
-+		setting = MGMT_SETTING_POWERED;
-+		break;
-+	case MGMT_OP_SET_CONNECTABLE:
-+		setting = MGMT_SETTING_CONNECTABLE;
-+		break;
-+	case MGMT_OP_SET_FAST_CONNECTABLE:
-+		setting = MGMT_SETTING_FAST_CONNECTABLE;
-+		break;
-+	case MGMT_OP_SET_DISCOVERABLE:
-+		setting = MGMT_SETTING_DISCOVERABLE;
-+		break;
-+	case MGMT_OP_SET_BONDABLE:
-+		setting = MGMT_SETTING_DISCOVERABLE;
-+		break;
-+	}
-+
-+	adapter->pending_settings |= setting;
-+
- 	DBG("sending set mode command for index %u", adapter->dev_id);
- 
- 	if (mgmt_send(adapter->mgmt, opcode,
-@@ -1818,7 +1844,17 @@ static void discovery_free(void *user_data)
- 	g_free(client);
- }
- 
--static void discovery_remove(struct watch_client *client)
-+static bool set_filtered_discoverable(struct btd_adapter *adapter, bool enable)
-+{
-+	if (adapter->filtered_discoverable == enable)
-+		return true;
-+
-+	adapter->filtered_discoverable = enable;
-+
-+	return set_discoverable(adapter, enable, 0);
-+}
-+
-+static void discovery_remove(struct watch_client *client, bool exit)
- {
- 	struct btd_adapter *adapter = client->adapter;
- 
-@@ -1830,7 +1866,27 @@ static void discovery_remove(struct watch_client *client)
- 	adapter->discovery_list = g_slist_remove(adapter->discovery_list,
- 								client);
- 
--	discovery_free(client);
-+	if (adapter->filtered_discoverable &&
-+			client->discovery_filter->discoverable) {
-+		GSList *l;
-+
-+		for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
-+			struct watch_client *client = l->data;
-+
-+			if (client->discovery_filter->discoverable)
-+				break;
-+		}
-+
-+		/* Disable filtered discoverable if there are no clients */
-+		if (!l)
-+			set_filtered_discoverable(adapter, false);
-+	}
-+
-+	if (!exit && client->discovery_filter)
-+		adapter->set_filter_list = g_slist_prepend(
-+					adapter->set_filter_list, client);
-+	else
-+		discovery_free(client);
- 
- 	/*
- 	 * If there are other client discoveries in progress, then leave
-@@ -1859,8 +1915,11 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
- 		goto done;
- 	}
- 
--	if (client->msg)
-+	if (client->msg) {
- 		g_dbus_send_reply(dbus_conn, client->msg, DBUS_TYPE_INVALID);
-+		dbus_message_unref(client->msg);
-+		client->msg = NULL;
-+	}
- 
- 	adapter->discovery_type = 0x00;
- 	adapter->discovery_enable = 0x00;
-@@ -1873,7 +1932,7 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
- 	trigger_passive_scanning(adapter);
- 
- done:
--	discovery_remove(client);
-+	discovery_remove(client, false);
- }
- 
- static int compare_sender(gconstpointer a, gconstpointer b)
-@@ -2094,14 +2153,14 @@ static int update_discovery_filter(struct btd_adapter *adapter)
- 	return -EINPROGRESS;
- }
- 
--static int discovery_stop(struct watch_client *client)
-+static int discovery_stop(struct watch_client *client, bool exit)
- {
- 	struct btd_adapter *adapter = client->adapter;
- 	struct mgmt_cp_stop_discovery cp;
- 
- 	/* Check if there are more client discovering */
- 	if (g_slist_next(adapter->discovery_list)) {
--		discovery_remove(client);
-+		discovery_remove(client, exit);
- 		update_discovery_filter(adapter);
- 		return 0;
- 	}
-@@ -2111,7 +2170,7 @@ static int discovery_stop(struct watch_client *client)
- 	 * and so it is enough to send out the signal and just return.
- 	 */
- 	if (adapter->discovery_enable == 0x00) {
--		discovery_remove(client);
-+		discovery_remove(client, exit);
- 		adapter->discovering = false;
- 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
- 					ADAPTER_INTERFACE, "Discovering");
-@@ -2136,7 +2195,7 @@ static void discovery_disconnect(DBusConnection *conn, void *user_data)
- 
- 	DBG("owner %s", client->owner);
- 
--	discovery_stop(client);
-+	discovery_stop(client, true);
- }
- 
- /*
-@@ -2200,6 +2259,15 @@ static DBusMessage *start_discovery(DBusConnection *conn,
- 					     adapter->set_filter_list, client);
- 		adapter->discovery_list = g_slist_prepend(
- 					      adapter->discovery_list, client);
-+
-+		/* Reset discoverable filter if already set */
-+		if (adapter->current_settings & MGMT_OP_SET_DISCOVERABLE)
-+			goto done;
-+
-+		/* Set discoverable if filter requires and it*/
-+		if (client->discovery_filter->discoverable)
-+			set_filtered_discoverable(adapter, true);
-+
- 		goto done;
- 	}
- 
-@@ -2324,6 +2392,17 @@ static bool parse_duplicate_data(DBusMessageIter *value,
- 	return true;
- }
- 
-+static bool parse_discoverable(DBusMessageIter *value,
-+					struct discovery_filter *filter)
-+{
-+	if (dbus_message_iter_get_arg_type(value) != DBUS_TYPE_BOOLEAN)
-+		return false;
-+
-+	dbus_message_iter_get_basic(value, &filter->discoverable);
-+
-+	return true;
-+}
-+
- struct filter_parser {
- 	const char *name;
- 	bool (*func)(DBusMessageIter *iter, struct discovery_filter *filter);
-@@ -2333,6 +2412,7 @@ struct filter_parser {
- 	{ "Pathloss", parse_pathloss },
- 	{ "Transport", parse_transport },
- 	{ "DuplicateData", parse_duplicate_data },
-+	{ "Discoverable", parse_discoverable },
- 	{ }
- };
- 
-@@ -2372,6 +2452,7 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
- 	(*filter)->rssi = DISTANCE_VAL_INVALID;
- 	(*filter)->type = get_scan_type(adapter);
- 	(*filter)->duplicate = false;
-+	(*filter)->discoverable = false;
- 
- 	dbus_message_iter_init(msg, &iter);
- 	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY ||
-@@ -2417,8 +2498,10 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
- 		goto invalid_args;
- 
- 	DBG("filtered discovery params: transport: %d rssi: %d pathloss: %d "
--		" duplicate data: %s ", (*filter)->type, (*filter)->rssi,
--		(*filter)->pathloss, (*filter)->duplicate ? "true" : "false");
-+		" duplicate data: %s discoverable %s", (*filter)->type,
-+		(*filter)->rssi, (*filter)->pathloss,
-+		(*filter)->duplicate ? "true" : "false",
-+		(*filter)->discoverable ? "true" : "false");
- 
- 	return true;
- 
-@@ -2510,7 +2593,7 @@ static DBusMessage *stop_discovery(DBusConnection *conn,
- 	if (client->msg)
- 		return btd_error_busy(msg);
- 
--	err = discovery_stop(client);
-+	err = discovery_stop(client, false);
- 	switch (err) {
- 	case 0:
- 		return dbus_message_new_method_return(msg);
-@@ -2739,13 +2822,15 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
- 	else
- 		current_enable = FALSE;
- 
--	if (enable == current_enable) {
-+	if (enable == current_enable || adapter->pending_settings & setting) {
- 		g_dbus_pending_property_success(id);
- 		return;
- 	}
- 
- 	mode = (enable == TRUE) ? 0x01 : 0x00;
- 
-+	adapter->pending_settings |= setting;
-+
- 	switch (setting) {
- 	case MGMT_SETTING_POWERED:
- 		opcode = MGMT_OP_SET_POWERED;
-@@ -2798,7 +2883,7 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
- 	data->id = id;
- 
- 	if (mgmt_send(adapter->mgmt, opcode, adapter->dev_id, len, param,
--				property_set_mode_complete, data, g_free) > 0)
-+			property_set_mode_complete, data, g_free) > 0)
- 		return;
- 
- 	g_free(data);
-@@ -2875,6 +2960,7 @@ static void property_set_discoverable_timeout(
- 				GDBusPendingPropertySet id, void *user_data)
- {
- 	struct btd_adapter *adapter = user_data;
-+	bool enabled;
- 	dbus_uint32_t value;
- 
- 	dbus_message_iter_get_basic(iter, &value);
-@@ -2888,8 +2974,19 @@ static void property_set_discoverable_timeout(
- 	g_dbus_emit_property_changed(dbus_conn, adapter->path,
- 				ADAPTER_INTERFACE, "DiscoverableTimeout");
- 
-+	if (adapter->pending_settings & MGMT_SETTING_DISCOVERABLE) {
-+		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+			enabled = false;
-+		else
-+			enabled = true;
-+	} else {
-+		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+			enabled = true;
-+		else
-+			enabled = false;
-+	}
- 
--	if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+	if (enabled)
- 		set_discoverable(adapter, 0x01, adapter->discoverable_timeout);
- }
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch b/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch
deleted file mode 100644
index ca678e601e7..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/gcc9-fixes.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-Backported commit from upstream master branch (post 5.50 release), which
-resolves assertion failures in several unit tests.
-
-https://git.kernel.org/pub/scm/bluetooth/bluez.git/patch/?id=0be5246170
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/unit/test-avctp.c b/unit/test-avctp.c
-index 3bc3569..24de663 100644
---- a/unit/test-avctp.c
-+++ b/unit/test-avctp.c
-@@ -43,7 +43,7 @@
- 
- struct test_pdu {
- 	bool valid;
--	const uint8_t *data;
-+	uint8_t *data;
- 	size_t size;
- };
- 
-@@ -66,7 +66,7 @@ struct context {
- #define raw_pdu(args...)					\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -91,6 +91,11 @@ static void test_debug(const char *str, void *user_data)
- static void test_free(gconstpointer user_data)
- {
- 	const struct test_data *data = user_data;
-+	struct test_pdu *pdu;
-+	int i;
-+
-+	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
-+		g_free(pdu->data);
- 
- 	g_free(data->test_name);
- 	g_free(data->pdu_list);
-diff --git a/unit/test-avdtp.c b/unit/test-avdtp.c
-index dd8aed7..e2c951a 100644
---- a/unit/test-avdtp.c
-+++ b/unit/test-avdtp.c
-@@ -47,7 +47,7 @@
- struct test_pdu {
- 	bool valid;
- 	bool fragmented;
--	const uint8_t *data;
-+	uint8_t *data;
- 	size_t size;
- };
- 
-@@ -61,7 +61,7 @@ struct test_data {
- #define raw_pdu(args...) \
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -69,7 +69,7 @@ struct test_data {
- 	{							\
- 		.valid = true,					\
- 		.fragmented = true,				\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -81,7 +81,7 @@ struct test_data {
- 		static struct test_data data;				\
- 		data.test_name = g_strdup(name);			\
- 		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
--		tester_add(name, &data, NULL, function, NULL);		\
-+		tester_add(name, &data, NULL, function, NULL);	\
- 	} while (0)
- 
- struct context {
-@@ -109,6 +109,11 @@ static void test_debug(const char *str, void *user_data)
- static void test_free(gconstpointer user_data)
- {
- 	const struct test_data *data = user_data;
-+	struct test_pdu *pdu;
-+	int i;
-+
-+	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
-+		g_free(pdu->data);
- 
- 	g_free(data->test_name);
- 	g_free(data->pdu_list);
-diff --git a/unit/test-avrcp.c b/unit/test-avrcp.c
-index 01307e6..f1aa353 100644
---- a/unit/test-avrcp.c
-+++ b/unit/test-avrcp.c
-@@ -49,7 +49,7 @@ struct test_pdu {
- 	bool fragmented;
- 	bool continuing;
- 	bool browse;
--	const uint8_t *data;
-+	uint8_t *data;
- 	size_t size;
- };
- 
-@@ -74,7 +74,7 @@ struct context {
- #define raw_pdu(args...)					\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -82,7 +82,7 @@ struct context {
- 	{							\
- 		.valid = true,					\
- 		.browse = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -90,7 +90,7 @@ struct context {
- 	{							\
- 		.valid = true,					\
- 		.fragmented = true,				\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -98,7 +98,7 @@ struct context {
- 	{							\
- 		.valid = true,					\
- 		.continuing = true,				\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -123,6 +123,11 @@ static void test_debug(const char *str, void *user_data)
- static void test_free(gconstpointer user_data)
- {
- 	const struct test_data *data = user_data;
-+	struct test_pdu *pdu;
-+	int i;
-+
-+	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
-+		g_free(pdu->data);
- 
- 	g_free(data->test_name);
- 	g_free(data->pdu_list);
-diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index c7e28f8..d49f7a0 100644
---- a/unit/test-gatt.c
-+++ b/unit/test-gatt.c
-@@ -48,7 +48,7 @@
- 
- struct test_pdu {
- 	bool valid;
--	const uint8_t *data;
-+	uint8_t *data;
- 	size_t size;
- };
- 
-@@ -86,7 +86,7 @@ struct context {
- #define raw_pdu(args...)					\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -306,6 +306,11 @@ static bt_uuid_t uuid_char_128 = {
- static void test_free(gconstpointer user_data)
- {
- 	const struct test_data *data = user_data;
-+	struct test_pdu *pdu;
-+	int i;
-+
-+	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
-+		g_free(pdu->data);
- 
- 	g_free(data->test_name);
- 	g_free(data->pdu_list);
-@@ -1911,6 +1916,8 @@ static void test_server(gconstpointer data)
- 	g_assert_cmpint(len, ==, pdu.size);
- 
- 	util_hexdump('<', pdu.data, len, test_debug, "GATT: ");
-+
-+	g_free(pdu.data);
- }
- 
- static void test_search_primary(gconstpointer data)
-diff --git a/unit/test-hfp.c b/unit/test-hfp.c
-index f2b9622..890eee6 100644
---- a/unit/test-hfp.c
-+++ b/unit/test-hfp.c
-@@ -43,7 +43,7 @@ struct context {
- 
- struct test_pdu {
- 	bool valid;
--	const uint8_t *data;
-+	uint8_t *data;
- 	size_t size;
- 	enum hfp_gw_cmd_type type;
- 	bool fragmented;
-@@ -63,7 +63,7 @@ struct test_data {
- #define raw_pdu(args...)					\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 	}
- 
-@@ -75,7 +75,7 @@ struct test_data {
- #define type_pdu(cmd_type, args...)				\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 		.type = cmd_type,				\
- 	}
-@@ -83,7 +83,7 @@ struct test_data {
- #define frg_pdu(args...)					\
- 	{							\
- 		.valid = true,					\
--		.data = data(args),				\
-+		.data = g_memdup(data(args), sizeof(data(args))), \
- 		.size = sizeof(data(args)),			\
- 		.fragmented = true,				\
- 	}
-@@ -119,6 +119,11 @@ struct test_data {
- static void test_free(gconstpointer user_data)
- {
- 	const struct test_data *data = user_data;
-+	struct test_pdu *pdu;
-+	int i;
-+
-+	for (i = 0; (pdu = &data->pdu_list[i]) && pdu->valid; i++)
-+		g_free(pdu->data);
- 
- 	g_free(data->test_name);
- 	g_free(data->pdu_list);
-diff --git a/unit/test-hog.c b/unit/test-hog.c
-index d117968..25bdb42 100644
---- a/unit/test-hog.c
-+++ b/unit/test-hog.c
-@@ -68,11 +68,11 @@ struct context {
- 
- #define data(args...) ((const unsigned char[]) { args })
- 
--#define raw_pdu(args...)    \
--{      \
--	.valid = true,		\
--	.data = data(args), \
--	.size = sizeof(data(args)),\
-+#define raw_pdu(args...)					\
-+{								\
-+	.valid = true,						\
-+	.data = g_memdup(data(args), sizeof(data(args))),	\
-+	.size = sizeof(data(args)),				\
- }
- 
- #define false_pdu()	\
-diff --git a/unit/test-sdp.c b/unit/test-sdp.c
-index ac921a9..c71ee1f 100644
---- a/unit/test-sdp.c
-+++ b/unit/test-sdp.c
-@@ -59,14 +59,14 @@ struct test_data {
- #define raw_pdu(args...) \
- 	{							\
- 		.valid = true,					\
--		.raw_data = raw_data(args),			\
-+		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
- 		.raw_size = sizeof(raw_data(args)),		\
- 	}
- 
- #define raw_pdu_cont(cont, args...) \
- 	{							\
- 		.valid = true,					\
--		.raw_data = raw_data(args),			\
-+		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
- 		.raw_size = sizeof(raw_data(args)),		\
- 		.cont_len = cont,				\
- 	}
-@@ -103,7 +103,7 @@ struct test_data_de {
- #define define_test_de_attr(name, input, exp) \
- 	do {								\
- 		static struct test_data_de data;			\
--		data.input_data = input;				\
-+		data.input_data = g_memdup(input, sizeof(input));	\
- 		data.input_size = sizeof(input);			\
- 		data.expected = exp;					\
- 		tester_add("/sdp/DE/ATTR/" name, &data,	NULL,		\
diff --git a/meta/recipes-connectivity/bluez5/bluez5/out-of-tree.patch b/meta/recipes-connectivity/bluez5/bluez5/out-of-tree.patch
deleted file mode 100644
index 76ed7792589..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/out-of-tree.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ed55b49a226ca3909f52416be2ae5ce1c5ca2cb2 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 22 Apr 2016 15:40:37 +0100
-Subject: [PATCH] Makefile.obexd: add missing mkdir in builtin.h generation
-
-In parallel out-of-tree builds it's possible that obexd/src/builtin.h is
-generated before the target directory has been implicitly created. Solve this by
-creating the directory before writing into it.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.obexd | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.obexd b/Makefile.obexd
-index 2e33cbc..c8286f0 100644
---- a/Makefile.obexd
-+++ b/Makefile.obexd
-@@ -105,2 +105,3 @@ obexd/src/plugin.$(OBJEXT): obexd/src/builtin.h
- obexd/src/builtin.h: obexd/src/genbuiltin $(obexd_builtin_sources)
-+	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN)$(srcdir)/obexd/src/genbuiltin $(obexd_builtin_modules) > $@
--- 
-2.8.0.rc3
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb b/meta/recipes-connectivity/bluez5/bluez5_5.52.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.50.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.52.bb
index 4e443e5fb08..b86103014b8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.52.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "8e35c67c81a55d3ad4c9f22280dae178"
-SRC_URI[sha256sum] = "5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911"
+SRC_URI[md5sum] = "a33eb9aadf1dd4153420958709d3ce60"
+SRC_URI[sha256sum] = "f7144ce2039202cfac18ccb52426efea11c98e4f6e1bb8041bcb994b8378560a"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.17.1


