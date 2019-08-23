Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E525F7F365
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FPBl2ysrz3P
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 16:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566571071;
	bh=lSByUIegY+3UcMJwflehZUCfh6PqLxUaPDM1kZ2Vi8g=;
	h=From:To:Subject:Date:From;
	b=Wma/R8As/i4KmoSiT1Ur/0RAlZJawEbUsv0hrJQCtKMcxUwXJYV4llz6KrxPvLARN
	kbtYauGY2fmRrBJqGBDauzWyDiScibG4dKhiGV8kp49tSgd/rveirs70hmeEDVWQMh
	ey0VXjNPvWHvyQfgodMZrVDoQVT06wgnnN1U/s+xX6nVYVjFGYa0F3f2SVipefONpP
	pNfD+YzhxFo6BR1T5PnbKG1kZpMxcF5PQHh/f59mg3LBfmgNqUbayMaSaZUJAyox3Z
	K3bwM7bEwy5ihNOHkyaEM4icSwU0vszr2eFYDmXNHw5C88Qu27qVlzy1IyG3l1IZPP
	6Z083cuBQO36arEU5+gSsHBzEOGA8LFwQ3m3DB7SQHeVuUbEoOq0+KS4Z8pp4UWlow
	hu7IrbJzBlXID7U0VQAk1+XNPIlAYhNzah1iRZwTKJNXAvuyqMkmMTPpxEiTLHD+pb
	okfrqlUaO+frjD/rJ5B6lVZmVqUpzZZgxAN8kJQmHy6reLHlMiToO8/ZvTUinn3iuI
	hv7TWljUx6o1/G+uxh6P4zmH0SrW7IkxbGgiKoHk1/JyHDInuX4caVQ4xzkxlCuBwu
	zGXWxyKwO+1NRpOjk7C7yCnHS7tqyAwBIAF2wrcMy+vsgY9IJua9uV/iqqQlZ6wppT
	Jk1bp9+UJ4I6xBcbVPTrUe7g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 17:37:48 +0300
Message-Id: <20190823143750.12232-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] systemd: Update to the latest 242 branch
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
X-List-Received-Date: Fri, 23 Aug 2019 14:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported patches applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...-max-sysctl-to-LONG_MAX-rather-than-.patch | 39 --------
 .../systemd/0001-networkd-fix-link-up.patch   | 66 -------------
 .../0002-network-do-not-send-ipv6.patch       | 96 -------------------
 ...remove-redunant-link-name-in-message.patch | 41 --------
 meta/recipes-core/systemd/systemd_242.bb      |  4 -
 6 files changed, 1 insertion(+), 247 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3a353b009b..491361ccca 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "db2e367bfc3b119609f837eb973d915f6c550b2f"
+SRCREV = "07f0549ffe3413f0e78b656dd34d64681cbd8f00"
 SRCBRANCH = "v242-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch b/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch
deleted file mode 100644
index ff64f58c9c..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6e2f78948403a4cce45b9e34311c9577c624f066 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Mon, 17 Jun 2019 10:51:25 +0200
-Subject: [PATCH] core: set fs.file-max sysctl to LONG_MAX rather than
- ULONG_MAX
-
-Since kernel 5.2 the kernel thankfully returns proper errors when we
-write a value out of range to the sysctl. Which however breaks writing
-ULONG_MAX to request the maximum value. Hence let's write the new
-maximum value instead, LONG_MAX.
-
-/cc @brauner
-
-Fixes: #12803
-
-Upstream-Status: Backport
-
-Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
----
- src/core/main.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/core/main.c b/src/core/main.c
-index b33ea1b5b5..e7f51815f0 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -1245,9 +1245,9 @@ static void bump_file_max_and_nr_open(void) {
- #endif
- 
- #if BUMP_PROC_SYS_FS_FILE_MAX
--        /* I so wanted to use STRINGIFY(ULONG_MAX) here, but alas we can't as glibc/gcc define that as
--         * "(0x7fffffffffffffffL * 2UL + 1UL)". Seriously. 😢 */
--        if (asprintf(&t, "%lu\n", ULONG_MAX) < 0) {
-+        /* The maximum the kernel allows for this since 5.2 is LONG_MAX, use that. (Previously thing where
-+         * different but the operation would fail silently.) */
-+        if (asprintf(&t, "%li\n", LONG_MAX) < 0) {
-                 log_oom();
-                 return;
-         }
diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch b/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
deleted file mode 100644
index 4c7a0a33a3..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 6bd76d2d4ff130decd3aa13e0c2dbfd56ff8d7b7 Mon Sep 17 00:00:00 2001
-From: Susant Sahani <ssahani@gmail.com>
-Date: Thu, 9 May 2019 07:35:35 +0530
-Subject: [PATCH] networkd: fix link_up() (#12505)
-
-Fillup IFLA_INET6_ADDR_GEN_MODE while we do link_up.
-
-Fixes the following error:
-```
-dummy-test: Could not bring up interface: Invalid argument
-```
-
-After reading the kernel code when we do a link up
-```
-net/core/rtnetlink.c
-IFLA_AF_SPEC
- af_ops->set_link_af(dev, af);
-  inet6_set_link_af
-   if (tb[IFLA_INET6_ADDR_GEN_MODE])
-             Here it looks for IFLA_INET6_ADDR_GEN_MODE
-```
-Since link up we didn't filling up that it's failing.
-
-Closes #12504.
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/4eb086a38712ea98faf41e075b84555b11b54362.patch]
-
----
- src/network/networkd-link.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index e466b96792..042496173c 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -2034,6 +2034,8 @@ static int link_up(Link *link) {
-         }
- 
-         if (link_ipv6_enabled(link)) {
-+                uint8_t ipv6ll_mode;
-+
-                 r = sd_netlink_message_open_container(req, IFLA_AF_SPEC);
-                 if (r < 0)
-                         return log_link_error_errno(link, r, "Could not open IFLA_AF_SPEC container: %m");
-@@ -2049,6 +2051,19 @@ static int link_up(Link *link) {
-                                 return log_link_error_errno(link, r, "Could not append IFLA_INET6_TOKEN: %m");
-                 }
- 
-+                if (!link_ipv6ll_enabled(link))
-+                        ipv6ll_mode = IN6_ADDR_GEN_MODE_NONE;
-+                else if (sysctl_read_ip_property(AF_INET6, link->ifname, "stable_secret", NULL) < 0)
-+                        /* The file may not exist. And event if it exists, when stable_secret is unset,
-+                         * reading the file fails with EIO. */
-+                        ipv6ll_mode = IN6_ADDR_GEN_MODE_EUI64;
-+                else
-+                        ipv6ll_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
-+
-+                r = sd_netlink_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
-+                if (r < 0)
-+                        return log_link_error_errno(link, r, "Could not append IFLA_INET6_ADDR_GEN_MODE: %m");
-+
-                 r = sd_netlink_message_close_container(req);
-                 if (r < 0)
-                         return log_link_error_errno(link, r, "Could not close AF_INET6 container: %m");
diff --git a/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch b/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch
deleted file mode 100644
index 2565314876..0000000000
--- a/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From b5c4eb818101127a606849e822937b15b8497c75 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Thu, 9 May 2019 14:39:46 +0900
-Subject: [PATCH] network: do not send ipv6 token to kernel
-
-We disabled kernel RA support. Then, we should not send
-IFLA_INET6_TOKEN.
-Thus, we do not need to send IFLA_INET6_ADDR_GEN_MODE twice.
-
-Follow-up for 0e2fdb83bb5e22047e0c7cc058b415d0e93f02cf and
-4eb086a38712ea98faf41e075b84555b11b54362.
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9f6e82e6eb3b6e73d66d00d1d6eee60691fb702f]
-
----
- src/network/networkd-link.c | 51 +++++--------------------------------
- 1 file changed, 6 insertions(+), 45 deletions(-)
-
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 042496173c..c49dba33da 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -1940,6 +1940,9 @@ static int link_configure_addrgen_mode(Link *link) {
-         assert(link->manager);
-         assert(link->manager->rtnl);
- 
-+        if (!socket_ipv6_is_supported())
-+                return 0;
-+
-         log_link_debug(link, "Setting address genmode for link");
- 
-         r = sd_rtnl_message_new_link(link->manager->rtnl, &req, RTM_SETLINK, link->ifindex);
-@@ -2033,46 +2036,6 @@ static int link_up(Link *link) {
-                         return log_link_error_errno(link, r, "Could not set MAC address: %m");
-         }
- 
--        if (link_ipv6_enabled(link)) {
--                uint8_t ipv6ll_mode;
--
--                r = sd_netlink_message_open_container(req, IFLA_AF_SPEC);
--                if (r < 0)
--                        return log_link_error_errno(link, r, "Could not open IFLA_AF_SPEC container: %m");
--
--                /* if the kernel lacks ipv6 support setting IFF_UP fails if any ipv6 options are passed */
--                r = sd_netlink_message_open_container(req, AF_INET6);
--                if (r < 0)
--                        return log_link_error_errno(link, r, "Could not open AF_INET6 container: %m");
--
--                if (!in_addr_is_null(AF_INET6, &link->network->ipv6_token)) {
--                        r = sd_netlink_message_append_in6_addr(req, IFLA_INET6_TOKEN, &link->network->ipv6_token.in6);
--                        if (r < 0)
--                                return log_link_error_errno(link, r, "Could not append IFLA_INET6_TOKEN: %m");
--                }
--
--                if (!link_ipv6ll_enabled(link))
--                        ipv6ll_mode = IN6_ADDR_GEN_MODE_NONE;
--                else if (sysctl_read_ip_property(AF_INET6, link->ifname, "stable_secret", NULL) < 0)
--                        /* The file may not exist. And event if it exists, when stable_secret is unset,
--                         * reading the file fails with EIO. */
--                        ipv6ll_mode = IN6_ADDR_GEN_MODE_EUI64;
--                else
--                        ipv6ll_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
--
--                r = sd_netlink_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
--                if (r < 0)
--                        return log_link_error_errno(link, r, "Could not append IFLA_INET6_ADDR_GEN_MODE: %m");
--
--                r = sd_netlink_message_close_container(req);
--                if (r < 0)
--                        return log_link_error_errno(link, r, "Could not close AF_INET6 container: %m");
--
--                r = sd_netlink_message_close_container(req);
--                if (r < 0)
--                        return log_link_error_errno(link, r, "Could not close IFLA_AF_SPEC container: %m");
--        }
--
-         r = netlink_call_async(link->manager->rtnl, NULL, req, link_up_handler,
-                                link_netlink_destroy_callback, link);
-         if (r < 0)
-@@ -3208,11 +3171,9 @@ static int link_configure(Link *link) {
-         if (r < 0)
-                 return r;
- 
--        if (socket_ipv6_is_supported()) {
--                r = link_configure_addrgen_mode(link);
--                if (r < 0)
--                        return r;
--        }
-+        r = link_configure_addrgen_mode(link);
-+        if (r < 0)
-+                return r;
- 
-         return link_configure_after_setting_mtu(link);
- }
diff --git a/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch b/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch
deleted file mode 100644
index 33f482ae9b..0000000000
--- a/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9e6940858c7dbdd56b297bdf49f58d623e3430b7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 7 May 2019 13:46:55 +0200
-Subject: [PATCH] network: remove redunant link name in message
-
-Fixes #12454.
-
-gcc was complaining that the link->ifname argument is NULL. Adding
-assert(link->ifname) right before the call has no effect. It seems that
-gcc is confused by the fact that log_link_warning_errno() internally
-calls log_object(), with link->ifname passed as the object. log_object()
-is also a macro and is does a check whether the passed object is NULL.
-So we have a check if something is NULL right next an unconditional use
-of it where it cannot be NULL. I think it's a bug in gcc.
-
-Anyway, we don't need to use link->ifname here. log_object() already prepends
-the object name to the message.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: backport [https://github.com/systemd/systemd/commit/c98b3545008d8e984ab456dcf79787418fcbfe13]
----
- src/network/networkd-link.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 3e334c8d29..a158c01bbd 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -321,8 +321,7 @@ static int link_enable_ipv6(Link *link) {
- 
-         r = sysctl_write_ip_property_boolean(AF_INET6, link->ifname, "disable_ipv6", disabled);
-         if (r < 0)
--                log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
--                                       enable_disable(!disabled), link->ifname);
-+                log_link_warning_errno(link, r, "Cannot %s IPv6: %m", enable_disable(!disabled));
-         else
-                 log_link_info(link, "IPv6 successfully %sd", enable_disable(!disabled));
- 
--- 
-2.21.0
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index b368ca8a2c..ceee3aa0cb 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -22,12 +22,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
-           file://0006-network-remove-redunant-link-name-in-message.patch \
            file://99-default.preset \
            file://0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch \
-           file://0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch \
-           file://0001-networkd-fix-link-up.patch \
-           file://0002-network-do-not-send-ipv6.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


