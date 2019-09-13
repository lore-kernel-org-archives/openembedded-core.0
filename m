Return-Path: <scott.murray@konsulko.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id BA8977F00E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 21:48:28 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id r26so65711227ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W+DWOzusxN0eWiK0m2cz3MBRSbxZO5g3fxyiQxWD1D4=;
	b=pfoUuwKPrQY7bB/Bl+JmbbWlEphWXn6xz4ZG8w35HmTVNZH1ulNybc1B/Swi4v+0Ms
	i0eVfu1CWHnS6QqFYGqzuxTAE3/M+E0Baka6bJVqKkIg3plxDHiRwtsJULNeEuZSqTfn
	KjM21MG0zQatcCmnDpn2+fbd8L3ToSsCPpeFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W+DWOzusxN0eWiK0m2cz3MBRSbxZO5g3fxyiQxWD1D4=;
	b=Lkw1Zc74Gfx3FRi3rDwkbSujuTxxaUcdFGaUi8L+ZHh/CDRKrQ0GX/WqdpXBPegly5
	YC4J8ywwzIc7A9IHmpedQhfLZGRI33N6y+b9gfdQQEBy1pxnPs+nyO3no22xabgmcKtd
	psPyqhvJw2tMu98CJVlGIQF+exy413HpAQ94rEdVy64xIPVD2GU5Nn/jq8TDVXo8R4AD
	1ELJLDgQbtT7s1R1s/7u5Xd9KH7So1wzRM/a9r0cBYE6QVwV7bbDc7ob268GH+dkpZ+B
	tsO/1Fr6Maw8aQZxCBZjYkMl24Bzy/e/ICGrnW0mSuK9R6BHHrxn2JCYq6JGoq2iAjOI
	WaXA==
X-Gm-Message-State: APjAAAXySyW2iYzhFS1TLhlMqngVl0+wR+ub1Y1Fk3Nxm1MCVcbI2w89
	FKPCl669WuL8nerQDwBePwZAxudfMC0=
X-Google-Smtp-Source: APXvYqzaX8H2SglJqJK9eLP2PT271oKn+vtHXIq1RqbhrM7k9lccsb+jGvIRbYVqzqIeOjsF3fNmew==
X-Received: by 2002:a02:8502:: with SMTP id g2mr6000139jai.87.1568411307782;
	Fri, 13 Sep 2019 14:48:27 -0700 (PDT)
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com.
	[198.84.179.103]) by smtp.gmail.com with ESMTPSA id
	z20sm31867351iof.38.2019.09.13.14.48.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 14:48:27 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 17:58:09 -0400
Message-Id: <20190913215809.34402-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [PATCH v2] systemd: upgrade to 243
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
X-List-Received-Date: Fri, 13 Sep 2019 21:48:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PATCH REBASED:
==============
0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
0001-do-not-disable-buffer-in-writing-files.patch
0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
0004-add-fallback-parse_printf_format-implementation.patch
0004-rules-whitelist-hd-devices.patch
0005-rules-watch-metadata-changes-in-ide-devices.patch
0005-src-basic-missing.h-check-for-missing-strndupa.patch
0006-Include-netinet-if_ether.h.patch
0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch

PATCH DROPPED:
==============
0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
0023-socket-util.h-include-string.h.patch
0025-fs-utilh-add-missing-sys-stat-include.patch

PATCH ADDED:
============
0002-src-login-brightness.c-include-wait.h.patch
0003-src-basic-copy.c-include-signal.h.patch
0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch

Also applied libc-glibc over-ride to pkg_postinst and pkg_prerm function
definitions, as musl does not provide nsswitch.conf.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ...ystemd-boot_242.bb => systemd-boot_243.bb} |   0
 ...ystemd-conf_242.bb => systemd-conf_243.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...cy-ULONG_LONG_MAX-with-the-C99-ULLON.patch |  50 -----
 ...tall-dependency-links-at-install-tim.patch |  17 +-
 ...-not-disable-buffer-in-writing-files.patch | 148 ++++++-------
 ...udev-event.c-must-include-sys-wait.h.patch |  35 ----
 ...rc-login-brightness.c-include-wait.h.patch |  25 +++
 ...instead-of-looking-for-relative-opti.patch |  23 +--
 ...03-src-basic-copy.c-include-signal.h.patch |  27 +++
 ...k-parse_printf_format-implementation.patch |  15 +-
 .../0004-rules-whitelist-hd-devices.patch     |  11 +-
 ...set-util.h-add-__cpu_mask-definition.patch |  54 +++++
 ...atch-metadata-changes-in-ide-devices.patch |  16 +-
 ...missing.h-check-for-missing-strndupa.patch | 139 ++++++++++---
 .../0006-Include-netinet-if_ether.h.patch     | 195 +++++++++++++++---
 ...LOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch |  26 ++-
 ...uffering-when-writing-to-oom_score_a.patch |  12 +-
 .../0023-socket-util.h-include-string.h.patch |  30 ---
 ...s-utilh-add-missing-sys-stat-include.patch |  30 ---
 .../{systemd_242.bb => systemd_243.bb}        |  11 +-
 21 files changed, 507 insertions(+), 361 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_242.bb => systemd-boot_243.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_242.bb => systemd-conf_243.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
 rename meta/recipes-core/systemd/{systemd_242.bb => systemd_243.bb} (98%)

diff --git a/meta/recipes-core/systemd/systemd-boot_242.bb b/meta/recipes-core/systemd/systemd-boot_243.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_242.bb
rename to meta/recipes-core/systemd/systemd-boot_243.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_243.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_242.bb
rename to meta/recipes-core/systemd/systemd-conf_243.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 1912715617..7f3a59c208 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "f875dced33462641e1fb7875d2f9a8cd8e8c2fcc"
-SRCBRANCH = "v242-stable"
+SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch b/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
deleted file mode 100644
index 6f192a2ad2..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f491dfdc88ddbba36a24a75b2063aff027461b83 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Thu, 16 May 2019 22:20:07 +0300
-Subject: Replace the legacy ULONG_LONG_MAX with the C99 ULLONG_MAX
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- src/journal-remote/journal-remote-main.c | 4 ++--
- src/shutdown/shutdown.c                  | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 2321a91e7b..d32c51c3ce 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -528,7 +528,7 @@ static int dispatch_http_event(sd_event_source *event,
-                                void *userdata) {
-         MHDDaemonWrapper *d = userdata;
-         int r;
--        MHD_UNSIGNED_LONG_LONG timeout = ULONG_LONG_MAX;
-+        MHD_UNSIGNED_LONG_LONG timeout = ULLONG_MAX;
- 
-         assert(d);
- 
-@@ -538,7 +538,7 @@ static int dispatch_http_event(sd_event_source *event,
-                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
-                                        "MHD_run failed!");
-         if (MHD_get_timeout(d->daemon, &timeout) == MHD_NO)
--                timeout = ULONG_LONG_MAX;
-+                timeout = ULLONG_MAX;
- 
-         r = sd_event_source_set_time(d->timer_event, timeout);
-         if (r < 0) {
-diff --git a/src/shutdown/shutdown.c b/src/shutdown/shutdown.c
-index 35b2c2aa46..9623fe9ea2 100644
---- a/src/shutdown/shutdown.c
-+++ b/src/shutdown/shutdown.c
-@@ -212,7 +212,7 @@ static int sync_making_progress(unsigned long long *prev_dirty) {
- }
- 
- static void sync_with_progress(void) {
--        unsigned long long dirty = ULONG_LONG_MAX;
-+        unsigned long long dirty = ULLONG_MAX;
-         unsigned checks;
-         pid_t pid;
-         int r;
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 00670ca2b1..73e65ff798 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -16,6 +16,8 @@ Upstream-Status: Denied
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  units/meson.build                       | 6 ++----
  units/proc-sys-fs-binfmt_misc.automount | 3 +++
@@ -23,10 +25,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index d695084..7b1f14a 100644
+index e1ee9f86c3..6bb7771b36 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -47,8 +47,7 @@ units = [
+@@ -46,8 +46,7 @@ units = [
          ['poweroff.target',                     '',
           'runlevel0.target'],
          ['printer.target',                      ''],
@@ -36,7 +38,7 @@ index d695084..7b1f14a 100644
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'runlevel6.target ctrl-alt-del.target'],
-@@ -134,8 +133,7 @@ in_units = [
+@@ -130,8 +129,7 @@ in_units = [
          ['systemd-ask-password-console.service', ''],
          ['systemd-ask-password-wall.service',    ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
@@ -45,9 +47,9 @@ index d695084..7b1f14a 100644
 +        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
-         ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
+         ['systemd-boot-system-token.service',    'ENABLE_EFI',
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 30a6bc9..4231f3b 100644
+index 30a6bc9918..4231f3b70f 100644
 --- a/units/proc-sys-fs-binfmt_misc.automount
 +++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
@@ -58,7 +60,7 @@ index 30a6bc9..4231f3b 100644
 +[Install]
 +WantedBy=sysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index e940c7c..6be7f5c 100644
+index e940c7c9ad..6be7f5cc9b 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
@@ -76,6 +78,3 @@ index e940c7c..6be7f5c 100644
 +
 +[Install]
 +WantedBy=sysinit.target
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index 68ca604d6d..2f4daf8665 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -16,6 +16,8 @@ Upstream-Status: Inappropriate [musl]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  src/basic/cgroup-util.c                 | 14 +++++++-------
  src/basic/procfs-util.c                 |  4 ++--
@@ -30,17 +32,17 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
  src/shared/sysctl-util.c                |  2 +-
- src/sleep/sleep.c                       | 12 ++++++------
+ src/sleep/sleep.c                       | 10 +++++-----
  src/udev/udevadm-trigger.c              |  2 +-
- src/udev/udevd.c                        |  6 +++---
+ src/udev/udevd.c                        |  2 +-
  src/vconsole/vconsole-setup.c           |  2 +-
- 17 files changed, 39 insertions(+), 39 deletions(-)
+ 17 files changed, 36 insertions(+), 36 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index fc28109..44fe985 100644
+index 7b5839ccd6..18f6e8ffc8 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -822,7 +822,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -860,7 +860,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -49,7 +51,7 @@ index fc28109..44fe985 100644
          if (r < 0)
                  return r;
  
-@@ -1104,7 +1104,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -58,7 +60,7 @@ index fc28109..44fe985 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -1122,7 +1122,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -67,7 +69,7 @@ index fc28109..44fe985 100644
                  if (r < 0)
                          return r;
  
-@@ -1149,7 +1149,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -76,7 +78,7 @@ index fc28109..44fe985 100644
          if (r < 0)
                  return r;
  
-@@ -1159,7 +1159,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -85,7 +87,7 @@ index fc28109..44fe985 100644
          if (r < 0)
                  return r;
  
-@@ -2016,7 +2016,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -94,7 +96,7 @@ index fc28109..44fe985 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-@@ -2664,7 +2664,7 @@ int cg_enable_everywhere(
+@@ -2697,7 +2697,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -104,10 +106,10 @@ index fc28109..44fe985 100644
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 7aaf95b..25fc3de 100644
+index 42ce53d5aa..57512532a6 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -85,13 +85,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -124,7 +126,7 @@ index 7aaf95b..25fc3de 100644
                  uint64_t threads_max;
  
 diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
-index 123d00e..e7ea78f 100644
+index 123d00e13e..e7ea78f349 100644
 --- a/src/basic/smack-util.c
 +++ b/src/basic/smack-util.c
 @@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
@@ -137,7 +139,7 @@ index 123d00e..e7ea78f 100644
                  return r;
  
 diff --git a/src/basic/util.c b/src/basic/util.c
-index 93d610b..97dca64 100644
+index 93d610bc98..97dca64f73 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -294,7 +294,7 @@ void disable_coredumps(void) {
@@ -150,7 +152,7 @@ index 93d610b..97dca64 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
 diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 66e2f01..5daa43b 100644
+index aa9d811f2e..8c7f2dae7a 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
@@ -175,16 +177,16 @@ index 66e2f01..5daa43b 100644
                  }
  
                  /* Flush out all rules */
--                write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
+-                (void) write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++                (void) write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
 diff --git a/src/core/main.c b/src/core/main.c
-index 46db471..726ccaf 100644
+index bcce7178a8..4199cedab9 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1469,7 +1469,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1285,7 +1285,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -193,7 +195,7 @@ index 46db471..726ccaf 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1684,7 +1684,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1509,7 +1509,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -203,10 +205,10 @@ index 46db471..726ccaf 100644
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
 diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index cd7fb01..077e861 100644
+index b95e6239d4..fdbdaaaccb 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -351,17 +351,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -229,7 +231,7 @@ index cd7fb01..077e861 100644
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
 diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 17e7cd1..87a7667 100644
+index 17e7cd1a00..87a7667716 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -242,10 +244,10 @@ index 17e7cd1..87a7667 100644
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index c2315c0..00f81b4 100644
+index c4a7f2f3d3..bcac758284 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1852,7 +1852,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -255,10 +257,10 @@ index c2315c0..00f81b4 100644
                  if (r == -ELOOP)
                          return -EINVAL;
 diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 2cebcce..7111fc1 100644
+index 30b9a66334..cc1d577933 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1285,7 +1285,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+@@ -1325,7 +1325,7 @@ static int trigger_device(Manager *m, sd_device *d) {
                  if (!t)
                          return -ENOMEM;
  
@@ -268,23 +270,23 @@ index 2cebcce..7111fc1 100644
  
          return 0;
 diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 168125d..dd0ab79 100644
+index 0462b46413..7c53d41483 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
-         (void) mkdir_parents(fn, 0755);
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+         fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
--        r = write_string_file(fn, pid_string, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(fn, pid_string, 0);
+-        r = write_string_file(fn, pid_string, WRITE_STRING_FILE_DISABLE_BUFFER|WRITE_STRING_FILE_MKDIR_0755);
++        r = write_string_file(fn, pid_string, WRITE_STRING_FILE_MKDIR_0755);
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 3b0ecb1..a1b5240 100644
+index 2aec8041f0..841542f2f3 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2341,7 +2341,7 @@ static int reset_audit_loginuid(void) {
+@@ -2357,7 +2357,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -293,7 +295,7 @@ index 3b0ecb1..a1b5240 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3531,13 +3531,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3566,13 +3566,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -310,10 +312,10 @@ index 3b0ecb1..a1b5240 100644
                  return log_error_errno(r, "Failed to write GID map: %m");
  
 diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 9be4055..f935cde 100644
+index 93bdcf11bf..68cddb7a9f 100644
 --- a/src/shared/sysctl-util.c
 +++ b/src/shared/sysctl-util.c
-@@ -73,7 +73,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -323,19 +325,19 @@ index 9be4055..f935cde 100644
  
  int sysctl_read(const char *property, char **content) {
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 11aabaf..6aa5d37 100644
+index b9fe96635d..f168d7f890 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -48,7 +48,7 @@ static int write_hibernate_location_info(void) {
+@@ -54,7 +54,7 @@ static int write_hibernate_location_info(void) {
  
          /* if it's a swap partition, we just write the disk to /sys/power/resume */
          if (streq(type, "partition")) {
 -                r = write_string_file("/sys/power/resume", device, WRITE_STRING_FILE_DISABLE_BUFFER);
 +                r = write_string_file("/sys/power/resume", device, 0);
                  if (r < 0)
-                         return log_debug_errno(r, "Faileed to write partitoin device to /sys/power/resume: %m");
+                         return log_debug_errno(r, "Failed to write partition device to /sys/power/resume: %m");
  
-@@ -84,12 +84,12 @@ static int write_hibernate_location_info(void) {
+@@ -98,14 +98,14 @@ static int write_hibernate_location_info(void) {
  
          offset = fiemap->fm_extents[0].fe_physical / page_size();
          xsprintf(offset_str, "%" PRIu64, offset);
@@ -344,13 +346,15 @@ index 11aabaf..6aa5d37 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write offset '%s': %m", offset_str);
  
+         log_debug("Wrote calculated resume_offset value to /sys/power/resume_offset: %s", offset_str);
+ 
          xsprintf(device_str, "%lx", (unsigned long)stb.st_dev);
 -        r = write_string_file("/sys/power/resume", device_str, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/sys/power/resume", device_str, 0);
          if (r < 0)
                  return log_debug_errno(r, "Failed to write device '%s': %m", device_str);
  
-@@ -103,7 +103,7 @@ static int write_mode(char **modes) {
+@@ -121,7 +121,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -359,7 +363,7 @@ index 11aabaf..6aa5d37 100644
                  if (k >= 0)
                          return 0;
  
-@@ -122,7 +122,7 @@ static int write_state(FILE **f, char **states) {
+@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -368,17 +372,8 @@ index 11aabaf..6aa5d37 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-@@ -217,7 +217,7 @@ static int rtc_write_wake_alarm(uint64_t sec) {
- 
-         xsprintf(buf, "%" PRIu64, sec);
- 
--        r = write_string_file("/sys/class/rtc/rtc0/wakealarm", buf, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/sys/class/rtc/rtc0/wakealarm", buf, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write '%s' to /sys/class/rtc/rtc0/wakealarm: %m", buf);
- 
 diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index b7dafb7..bab4907 100644
+index 77d95e513f..25ce4abfb1 100644
 --- a/src/udev/udevadm-trigger.c
 +++ b/src/udev/udevadm-trigger.c
 @@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
@@ -388,44 +383,26 @@ index b7dafb7..bab4907 100644
 -                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
 +                r = write_string_file(filename, action, 0);
                  if (r < 0) {
-                         log_debug_errno(r, "Failed to write '%s' to '%s', ignoring: %m", action, filename);
-                         continue;
+                         log_full_errno(r == -ENOENT ? LOG_DEBUG : LOG_ERR, r,
+                                        "Failed to write '%s' to '%s': %m", action, filename);
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 140ec35..33063a9 100644
+index cb5123042a..ea309a9e7f 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -1185,7 +1185,7 @@ static int synthesize_change(sd_device *dev) {
-                  */
-                 log_debug("Device '%s' is closed, synthesising 'change'", devname);
-                 strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
--                write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                write_string_file(filename, "change", 0);
- 
-                 FOREACH_DEVICE(e, d) {
-                         const char *t, *n, *s;
-@@ -1200,7 +1200,7 @@ static int synthesize_change(sd_device *dev) {
- 
-                         log_debug("Device '%s' is closed, synthesising partition '%s' 'change'", devname, n);
-                         strscpyl(filename, sizeof(filename), s, "/uevent", NULL);
--                        write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                        write_string_file(filename, "change", 0);
-                 }
- 
-                 return 0;
-@@ -1208,7 +1208,7 @@ static int synthesize_change(sd_device *dev) {
- 
-         log_debug("Device %s is closed, synthesising 'change'", devname);
-         strscpyl(filename, sizeof(filename), syspath, "/uevent", NULL);
--        write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        write_string_file(filename, "change", 0);
+@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
  
+         filename = strjoina(syspath, "/uevent");
+         log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
+-        r = write_string_file(filename, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(filename, "change", 0);
+         if (r < 0)
+                 return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
          return 0;
- }
 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 67dc2e4..01b83d0 100644
+index 75d052ae70..5a15c939d8 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -116,7 +116,7 @@ static int toggle_utf8(const char *name, int fd, bool utf8) {
+@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -434,6 +411,3 @@ index 67dc2e4..01b83d0 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
deleted file mode 100644
index 565deba1d0..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 010f917cf222d2c7205584056fe0e4c581a2e1b1 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Thu, 16 May 2019 22:09:46 +0300
-Subject: src/udev/udev-event.c must #include <sys/wait.h>
-
-Fixes the following build failure with musl:
-../git/src/udev/udev-event.c: In function 'spawn_wait':
-../git/src/udev/udev-event.c:600:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
-         r = sd_event_add_child(e, NULL, spawn->pid, WEXITED, on_spawn_sigchld, spawn);
-                                                     ^~~~~~~
-
-This looks like a bug in udev-event.c that could also have broken
-the compilation after some future glibc header reshuffle.
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- src/udev/udev-event.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index cab1b5ac0c..a0a7ac0f9e 100644
---- a/src/udev/udev-event.c
-+++ b/src/udev/udev-event.c
-@@ -7,6 +7,7 @@
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/wait.h>
- #include <unistd.h>
- 
- #include "sd-event.h"
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
new file mode 100644
index 0000000000..105d1dac30
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
@@ -0,0 +1,25 @@
+Include wait.h
+
+Fixes:
+src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
+  158 |         r = sd_event_add_child(w->manager->event, &w->child_event_source, w->child, WEXITED, on_brightness_writer_exit, w);
+      |                                                                                     ^~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ src/login/logind-brightness.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/login/logind-brightness.c b/src/login/logind-brightness.c
+index 8dfa97d7ae..bddd4a2727 100644
+--- a/src/login/logind-brightness.c
++++ b/src/login/logind-brightness.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <wait.h>
+ #include "bus-util.h"
+ #include "device-util.h"
+ #include "hash-funcs.h"
diff --git a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
index df5506cc2b..49a334d090 100644
--- a/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -11,6 +11,8 @@ Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  meson.build                 | 4 ----
  tools/meson-make-symlink.sh | 3 ++-
@@ -18,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 56c98b9..3386546 100644
+index e5ceb1e169..79b762faeb 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -630,10 +630,6 @@ endforeach
+@@ -579,10 +579,6 @@ endforeach
  
  conf.set_quoted('TELINIT', get_option('telinit-path'))
  
@@ -33,23 +35,23 @@ index 56c98b9..3386546 100644
  
  gperf = find_program('gperf')
 diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
-index 501cd43..f4e4ac9 100755
+index da0d13a341..90bc0a93c2 100755
 --- a/tools/meson-make-symlink.sh
 +++ b/tools/meson-make-symlink.sh
 @@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
  if [ "$(dirname $1)" = . ]; then
-         ln -vfs -T "$1" "${DESTDIR:-}$2"
+     ln -vfs -T "$1" "${DESTDIR:-}$2"
  else
--        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
-+        rm -f "${DESTDIR:-}$2"
-+        lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
+-    ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
++    rm -f "${DESTDIR:-}$2"
++    lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
  fi
 diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
-index e2b2603..210d604 100755
+index a483d75b86..3c01c523f1 100755
 --- a/units/meson-add-wants.sh
 +++ b/units/meson-add-wants.sh
 @@ -25,4 +25,9 @@ case "$target" in
-                 ;;
+         ;;
  esac
  
 -ln -vfs --relative "$unitpath" "$dir"
@@ -59,6 +61,3 @@ index e2b2603..210d604 100755
 +else
 +        lnr "$unitpath" "$dir"
 +fi
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
new file mode 100644
index 0000000000..7ee0d48fa6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
@@ -0,0 +1,27 @@
+Include signal.h
+
+Fixes several signal set related errors:
+src/basic/copy.c:92:19: error: implicit declaration of function 'sigemptyset' [-Werror=implicit-function-declaration]
+src/basic/copy.c:93:19: error: implicit declaration of function 'sigaddset' [-Werror=implicit-function-declaration]
+src/basic/copy.c:93:34: error: 'SIGINT' undeclared (first use in this function)
+src/basic/copy.c:95:13: error: implicit declaration of function 'sigtimedwait' [-Werror=implicit-function-declaration]
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ src/basic/copy.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/copy.c b/src/basic/copy.c
+index ca311e021e..3cf7fc1697 100644
+--- a/src/basic/copy.c
++++ b/src/basic/copy.c
+@@ -12,6 +12,7 @@
+ #include <sys/xattr.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <signal.h>
+ 
+ #include "alloc-util.h"
+ #include "btrfs-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index fa8217e3da..a2aad40ac2 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -8,6 +8,8 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  meson.build                     |   1 +
  src/basic/meson.build           |   5 +
@@ -20,22 +22,22 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 79195c9748..0bffbf29c5 100644
+index 79b762faeb..7f8c679411 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -685,6 +685,7 @@ foreach header : ['crypt.h',
+@@ -613,6 +613,7 @@ endif
+ foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
-                   'linux/can/vxcan.h',
 +                  'printf.h',
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 91e0df3d2f..a732b554da 100644
+index d6caf28f14..32c1acf349 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -298,6 +298,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+@@ -312,6 +312,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
  endforeach
  
  basic_sources += generated_gperf_headers
@@ -428,6 +430,3 @@ index 5ef11fa1a4..6384ab620c 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
index 738f8eb7b6..f9c5996ffb 100644
--- a/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
@@ -13,23 +13,22 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [rebased for systemd 241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  rules/60-persistent-storage.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index 1d8880e..e53c8ea 100644
+index 7802b1c94f..c0534ae26a 100644
 --- a/rules/60-persistent-storage.rules
 +++ b/rules/60-persistent-storage.rules
 @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
  ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
  
  SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|zd*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|zd*|hd*", GOTO="persistent_storage_end"
+-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*", GOTO="persistent_storage_end"
++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*|hd*", GOTO="persistent_storage_end"
  
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
new file mode 100644
index 0000000000..9c5a393f37
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
@@ -0,0 +1,54 @@
+Handle __cpu_mask usage
+
+Fixes errors:
+
+src/test/test-cpu-set-util.c:18:54: error: '__cpu_mask' undeclared (first use in this function)
+src/test/test-sizeof.c:73:14: error: '__cpu_mask' undeclared (first use in this function)
+
+__cpu_mask is an internal type of glibc's cpu_set implementation, not
+part of the POSIX definition, which is problematic when building with
+musl, which does not define a matching type.  From inspection of musl's
+sched.h, however, it is clear that the corresponding type would be long,
+which does match glibc's actual __CPU_MASK_TYPE.  So, add a typedef to
+cpu-set-util.h defining __cpu_mask appropriately.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ src/shared/cpu-set-util.h | 2 ++
+ src/test/test-sizeof.c    | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
+index 27812dfd59..f698f9df83 100644
+--- a/src/shared/cpu-set-util.h
++++ b/src/shared/cpu-set-util.h
+@@ -6,6 +6,8 @@
+ #include "macro.h"
+ #include "missing_syscall.h"
+ 
++typedef long __cpu_mask;
++
+ /* This wraps the libc interface with a variable to keep the allocated size. */
+ typedef struct CPUSet {
+         cpu_set_t *set;
+diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
+index a710db5370..d1601ad929 100644
+--- a/src/test/test-sizeof.c
++++ b/src/test/test-sizeof.c
+@@ -1,6 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
+-#include <sched.h>
+ #include <stdio.h>
+ #include <string.h>
+ 
+@@ -8,6 +7,7 @@
+ #include <float.h>
+ 
+ #include "time-util.h"
++#include "cpu-set-util.h"
+ 
+ /* Print information about various types. Useful when diagnosing
+  * gcc diagnostics on an unfamiliar architecture. */
diff --git a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
index 5312083fdd..96175b5b5e 100644
--- a/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0005-rules-watch-metadata-changes-in-ide-devices.patch
@@ -26,20 +26,20 @@ is deprecated.
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 [rebased for systemd 241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  rules/60-block.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-block.rules b/rules/60-block.rules
-index a1458e9..3ba4b6b4 100644
+index 3134ab995e..cd72a494a1 100644
 --- a/rules/60-block.rules
 +++ b/rules/60-block.rules
-@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
- ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
+@@ -9,5 +9,5 @@ ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block",
  
  # watch metadata changes, caused by tools closing the device node which was opened for writing
--ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|nbd*", OPTIONS+="watch"
-+ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|dasd*|nbd*|hd*", OPTIONS+="watch"
--- 
-2.7.4
-
+ ACTION!="remove", SUBSYSTEM=="block", \
+-  KERNEL=="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*", \
++  KERNEL=="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|ubi*|scm*|pmem*|nbd*|zd*|hd*", \
+   OPTIONS+="watch"
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 47ee2795a7..adfc3b7861 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -11,6 +11,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -30,6 +32,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/libsystemd/sd-bus/bus-objects.c        |  1 +
  src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
  src/locale/keymap-util.c                   |  1 +
+ src/login/pam_systemd.c                    |  1 +
+ src/network/generator/network-generator.c  |  1 +
  src/nspawn/nspawn-settings.c               |  1 +
  src/shared/dns-domain.c                    |  1 +
  src/shared/journal-importer.c              |  1 +
@@ -40,19 +44,24 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/socket-proxy/socket-proxyd.c           |  1 +
  src/test/test-hexdecoct.c                  |  1 +
  src/udev/udev-builtin-path_id.c            |  1 +
+ src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 29 files changed, 40 insertions(+)
+ 32 files changed, 43 insertions(+)
 
+diff --git a/meson.build b/meson.build
+index 7f8c679411..81c061b768 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -572,6 +572,7 @@ foreach ident : [
+@@ -506,6 +506,7 @@ foreach ident : [
+                                  #include <unistd.h>'''],
+         ['get_mempolicy',     '''#include <stdlib.h>
                                   #include <unistd.h>'''],
-         ['explicit_bzero' ,   '''#include <string.h>'''],
-         ['reallocarray',      '''#include <malloc.h>'''],
 +        ['strndupa' ,         '''#include <string.h>'''],
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index dfd6805398..c2b2ace6ec 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -17,6 +17,7 @@
@@ -63,6 +72,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
          const char *subsystem, *sysname, *value;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index a6503cf2b6..ceef9a62c8 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -16,6 +16,7 @@
@@ -73,6 +84,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  #define VALID_CHARS_ENV_NAME                    \
          DIGITS LETTERS                          \
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 188a8d4406..1e16ec287a 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -91,6 +104,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 6b82eab640..51c6b78615 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -101,9 +116,11 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
          struct stat st;
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index 115a1494a2..07a34bfd53 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -19,6 +19,7 @@
+@@ -20,6 +20,7 @@
  #include "process-util.h"
  #include "stat-util.h"
  #include "string-util.h"
@@ -111,6 +128,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 09169cf963..f411ba897f 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -121,6 +140,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int proc_cmdline(char **ret) {
          const char *e;
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 7aaf95bfce..42ce53d5aa 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -131,6 +152,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 3018e81acb..4e2b3b66c1 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -28,6 +28,7 @@
@@ -141,6 +164,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static clockid_t map_clock_id(clockid_t c) {
  
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index 2f2313c599..c9937f9d62 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -15,6 +15,7 @@
@@ -151,6 +176,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_cgroup_device_policy, cgroup_device_policy, CGroupDevicePolicy);
  
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index 7862beaacb..19f6968cfe 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
@@ -161,6 +188,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index a91cfebc67..a45961013f 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -171,9 +200,11 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  #if HAVE_KMOD
  #include <libkmod.h>
+diff --git a/src/core/service.c b/src/core/service.c
+index 73b3c9c316..ef74f00a08 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
-@@ -42,6 +42,7 @@
+@@ -43,6 +43,7 @@
  #include "unit.h"
  #include "utf8.h"
  #include "util.h"
@@ -181,16 +212,20 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index 6d6bb1cf63..6666349a35 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -67,6 +67,7 @@
- #include "tmpfile-util.h"
+@@ -70,6 +70,7 @@
  #include "unit-name.h"
  #include "user-util.h"
+ #include "varlink.h"
 +#include "missing.h"
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index eb029e4453..f31fe9d5a8 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -201,6 +236,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index ae643cacc7..1b752271a5 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -211,6 +248,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 8de0a859ee..4fd0a2e692 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -221,9 +260,11 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  #define MAX_SIZE (2*1024*1024)
  
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index f8c36c94f5..41f5606aea 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
-@@ -23,6 +23,7 @@
+@@ -22,6 +22,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "tmpfile-util.h"
@@ -231,6 +272,32 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index 3f762cbbc3..005cfea658 100644
+--- a/src/login/pam_systemd.c
++++ b/src/login/pam_systemd.c
+@@ -28,6 +28,7 @@
+ #include "hostname-util.h"
+ #include "login-util.h"
+ #include "macro.h"
++#include "missing.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+ #include "process-util.h"
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index 0b5af33566..9c808cd014 100644
+--- a/src/network/generator/network-generator.c
++++ b/src/network/generator/network-generator.c
+@@ -13,6 +13,7 @@
+ #include "string-table.h"
+ #include "string-util.h"
+ #include "strv.h"
++#include "missing.h"
+ 
+ /*
+   # .network
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index 3a99736813..279fea4d88 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -241,6 +308,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index f62ad0a0f5..f1a27e158d 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -24,6 +24,7 @@
@@ -251,9 +320,11 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index 7c4fc7021d..a6ff2214df 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
-@@ -13,6 +13,7 @@
+@@ -14,6 +14,7 @@
  #include "parse-util.h"
  #include "string-util.h"
  #include "unaligned.h"
@@ -261,9 +332,11 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index b615c70dff..75b26e9c21 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
-@@ -38,6 +38,7 @@
+@@ -39,6 +39,7 @@
  #include "time-util.h"
  #include "utf8.h"
  #include "util.h"
@@ -271,6 +344,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index 7c20b100b4..e4209d3a95 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
@@ -281,6 +356,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static pid_t pager_pid = 0;
  
+diff --git a/src/shared/path-lookup.c b/src/shared/path-lookup.c
+index 6bf0ff0316..f6c8009cd2 100644
 --- a/src/shared/path-lookup.c
 +++ b/src/shared/path-lookup.c
 @@ -20,6 +20,7 @@
@@ -291,6 +368,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index 7cb7d8a477..8b12b91084 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -301,6 +380,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index abbbc9f2d6..6179b5851e 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -28,6 +28,7 @@
@@ -311,6 +392,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  #define BUFFER_SIZE (256 * 1024)
  
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index 52217429b1..a05e7782f6 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -321,6 +404,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index e8f1ce1354..8693cb02a4 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -23,6 +23,7 @@
@@ -331,23 +416,27 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index 8cfa2cdf23..b0670c77ec 100644
+--- a/src/udev/udev-event.c
++++ b/src/udev/udev-event.c
+@@ -35,6 +35,7 @@
+ #include "udev-util.h"
+ #include "udev-watch.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ typedef struct Spawn {
+         sd_device *device;
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index 1642f10535..fe2aa75478 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -40,6 +40,7 @@
- #include "udev.h"
+@@ -28,6 +28,7 @@
+ #include "udev-event.h"
+ #include "udev-rules.h"
  #include "user-util.h"
- #include "util.h"
 +#include "missing.h"
  
- #define PREALLOC_TOKEN          2048
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
---- a/src/login/pam_systemd.c
-+++ b/src/login/pam_systemd.c
-@@ -27,6 +27,7 @@
- #include "hostname-util.h"
- #include "login-util.h"
- #include "macro.h"
-+#include "missing.h"
- #include "parse-util.h"
- #include "path-util.h"
- #include "process-util.h"
+ 
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index b41f6c7bee..6d73d715ce 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,28 +1,63 @@
-From 67a988ae82c776d11be76de7180d50ea027ac442 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 14:24:20 +0800
-Subject: [PATCH 06/24] Include netinet/if_ether.h
+Include netinet/if_ether.h
 
 Fixes
 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
  struct ethhdr {
         ^~~~~~
 
+and related arphdr, arpreq, and arpreq_old errors
+/path/to/systemd/recipe-sysroot/usr/include/net/if_arp.h:22:8: error: redefinition of 'struct arphdr'
+ struct arphdr {
+        ^~~~~~
+
+The latter requires removing some includes of net/if_arp.h to avoid
+conflicting with netinet/if_ether.h.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
+ src/libsystemd-network/sd-dhcp6-client.c  | 1 -
  src/libsystemd/sd-netlink/netlink-types.c | 1 +
- src/network/netdev/tuntap.c               | 1 +
+ src/machine/machine-dbus.c                | 1 +
+ src/network/netdev/macsec.c               | 1 +
+ src/network/netdev/netdev.c               | 1 +
  src/network/networkd-brvlan.c             | 1 +
- src/udev/net/ethtool-util.c               | 1 +
- src/udev/net/ethtool-util.h               | 1 +
+ src/network/networkd-dhcp-common.c        | 1 +
+ src/network/networkd-dhcp4.c              | 2 +-
+ src/network/networkd-dhcp6.c              | 2 +-
+ src/network/networkd-link.c               | 2 +-
+ src/network/networkd-network.c            | 1 +
+ src/shared/ethtool-util.c                 | 1 +
+ src/shared/ethtool-util.h                 | 1 +
+ src/udev/net/link-config.c                | 1 +
  src/udev/udev-builtin-net_setup_link.c    | 1 +
- 6 files changed, 6 insertions(+)
+ 15 files changed, 14 insertions(+), 4 deletions(-)
 
+diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
+index d7a5349c70..68b41dfb6c 100644
+--- a/src/libsystemd-network/sd-dhcp6-client.c
++++ b/src/libsystemd-network/sd-dhcp6-client.c
+@@ -6,7 +6,6 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/ioctl.h>
+-#include <linux/if_arp.h>
+ #include <linux/if_infiniband.h>
+ 
+ #include "sd-dhcp6-client.h"
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index 9dcd3f2..e23ff4c 100644
+index de9b8b21ab..f64f6500f7 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -30,23 +65,45 @@ index 9dcd3f2..e23ff4c 100644
  #include <stdint.h>
  #include <sys/socket.h>
 +#include <netinet/if_ether.h>
+ #include <linux/can/vxcan.h>
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
- #include <linux/genetlink.h>
-diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c
-index 951138d..1ad499d 100644
---- a/src/network/netdev/tuntap.c
-+++ b/src/network/netdev/tuntap.c
-@@ -2,6 +2,7 @@
+diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
+index 0d58b5eb8b..01093c1f62 100644
+--- a/src/machine/machine-dbus.c
++++ b/src/machine/machine-dbus.c
+@@ -4,6 +4,7 @@
+ #include <string.h>
+ #include <sys/mount.h>
+ #include <sys/wait.h>
++#include <netinet/if_ether.h>
+ 
+ /* When we include libgen.h because we need dirname() we immediately
+  * undefine basename() since libgen.h defines it as a macro to the POSIX
+diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
+index cf281e75a6..269dc618ff 100644
+--- a/src/network/netdev/macsec.c
++++ b/src/network/netdev/macsec.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_macsec.h>
+diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
+index 7735b455b7..ed4eda4a44 100644
+--- a/src/network/netdev/netdev.c
++++ b/src/network/netdev/netdev.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
  
- #include <errno.h>
- #include <fcntl.h>
 +#include <netinet/if_ether.h>
- #include <linux/if_tun.h>
  #include <net/if.h>
- #include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ 
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index 8377623..132af60 100644
+index c3c5d535ac..ebea408c89 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
@@ -57,10 +114,76 @@ index 8377623..132af60 100644
  #include <linux/if_bridge.h>
  #include <stdbool.h>
  
-diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c
-index 0dcec03..3695b10 100644
---- a/src/udev/net/ethtool-util.c
-+++ b/src/udev/net/ethtool-util.c
+diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
+index 626b975839..42fe92f320 100644
+--- a/src/network/networkd-dhcp-common.c
++++ b/src/network/networkd-dhcp-common.c
+@@ -1,6 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
+ #include "networkd-dhcp-common.h"
++#include <netinet/if_ether.h>
+ #include "networkd-network.h"
+ #include "parse-util.h"
+ #include "string-table.h"
+diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
+index 662770b50e..c6ab62a94d 100644
+--- a/src/network/networkd-dhcp4.c
++++ b/src/network/networkd-dhcp4.c
+@@ -1,8 +1,8 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
+ 
+ #include "alloc-util.h"
+ #include "hostname-util.h"
+diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
+index 8ad736a82b..f41b4d834e 100644
+--- a/src/network/networkd-dhcp6.c
++++ b/src/network/networkd-dhcp6.c
+@@ -3,9 +3,9 @@
+   Copyright © 2014 Intel Corporation. All rights reserved.
+ ***/
+ 
++#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
+ #include "sd-radv.h"
+ 
+ #include "sd-dhcp6-client.h"
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index f5bb78890a..f13a36b791 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -1,8 +1,8 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
+ #include <unistd.h>
+ 
+ #include "alloc-util.h"
+diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
+index 2b8d0eb2fb..2f79ef25cd 100644
+--- a/src/network/networkd-network.c
++++ b/src/network/networkd-network.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <linux/netdevice.h>
+diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
+index b0961df72e..53fcbbd84b 100644
+--- a/src/shared/ethtool-util.c
++++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -68,10 +191,10 @@ index 0dcec03..3695b10 100644
  #include <net/if.h>
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
-diff --git a/src/udev/net/ethtool-util.h b/src/udev/net/ethtool-util.h
-index 618b26b..ebfe82a 100644
---- a/src/udev/net/ethtool-util.h
-+++ b/src/udev/net/ethtool-util.h
+diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
+index 8b32b243f3..262b819976 100644
+--- a/src/shared/ethtool-util.h
++++ b/src/shared/ethtool-util.h
 @@ -2,6 +2,7 @@
  #pragma once
  
@@ -80,8 +203,19 @@ index 618b26b..ebfe82a 100644
  #include <linux/ethtool.h>
  
  #include "conf-parser.h"
+diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
+index d44af64d5e..fd052f1591 100644
+--- a/src/udev/net/link-config.c
++++ b/src/udev/net/link-config.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
++#include <netinet/if_ether.h>
+ #include <linux/netdevice.h>
+ #include <netinet/ether.h>
+ 
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index a845dfa..177289a 100644
+index ee3ca9fa38..9aa4e82874 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
@@ -91,6 +225,3 @@ index a845dfa..177289a 100644
  #include "device-util.h"
  #include "alloc-util.h"
  #include "link-config.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
index aa2b4cbcf1..34f7f5fb74 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
@@ -15,17 +15,19 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
- src/basic/glob-util.c     | 13 ++++++++++++-
+ src/basic/glob-util.c     | 12 ++++++++++++
  src/test/test-glob-util.c | 16 ++++++++++++++++
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
- 3 files changed, 38 insertions(+), 1 deletion(-)
+ 3 files changed, 38 insertions(+)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 32c53f8..ae358d9 100644
+index b335af8d97..2cdfc11f16 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
-@@ -13,6 +13,12 @@
+@@ -14,6 +14,12 @@
  #include "path-util.h"
  #include "strv.h"
  
@@ -38,7 +40,7 @@ index 32c53f8..ae358d9 100644
  static void closedir_wrapper(void* v) {
          (void) closedir(v);
  }
-@@ -20,6 +26,7 @@ static void closedir_wrapper(void* v) {
+@@ -21,6 +27,7 @@ static void closedir_wrapper(void* v) {
  int safe_glob(const char *path, int flags, glob_t *pglob) {
          int k;
  
@@ -46,7 +48,7 @@ index 32c53f8..ae358d9 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -33,10 +40,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -34,9 +41,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -55,7 +57,6 @@ index 32c53f8..ae358d9 100644
          errno = 0;
 +#ifdef GLOB_ALTDIRFUNC
          k = glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
--
 +#else
 +        k = glob(path, flags, NULL, pglob);
 +#endif
@@ -63,7 +64,7 @@ index 32c53f8..ae358d9 100644
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index b4f4144..f0d474e 100644
+index b4f41445fe..f0d474ed14 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -13,6 +13,12 @@
@@ -114,7 +115,7 @@ index b4f4144..f0d474e 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index d9d1cc1..477d1e3 100644
+index 3c30612af1..14bc428085 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -63,6 +63,12 @@
@@ -130,7 +131,7 @@ index d9d1cc1..477d1e3 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1839,7 +1845,9 @@ finish:
+@@ -1853,7 +1859,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -140,7 +141,7 @@ index d9d1cc1..477d1e3 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1859,7 +1867,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1873,7 +1881,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -150,6 +151,3 @@ index d9d1cc1..477d1e3 100644
          };
          int r = 0, k;
          char **fn;
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index b54635e8a9..24e24e8e5a 100644
--- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -17,15 +17,17 @@ This is libc implementation specific, as glibc does not have this issue.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 243]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index f773eea..79af915 100644
+index b1c08fcade..0a7a1f7d89 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1546,7 +1546,7 @@ int set_oom_score_adjust(int value) {
+@@ -1474,7 +1474,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -33,8 +35,4 @@ index f773eea..79af915 100644
 +                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
  }
  
- int cpus_in_affinity_mask(void) {
--- 
-2.11.0
-
-
+ static const char *const ioprio_class_table[] = {
diff --git a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
deleted file mode 100644
index 37987b57f6..0000000000
--- a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 56fb30d93e96d7f983af0cb4dff9155da91dd671 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 16:37:19 +0800
-Subject: socket-util.h: include string.h
-
-Fix the following compile error:
-src/basic/socket-util.h:187:30: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
-
-Upstream-Status: Accepted
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/socket-util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/socket-util.h b/src/basic/socket-util.h
-index 6920fd99ba..36ec422f2c 100644
---- a/src/basic/socket-util.h
-+++ b/src/basic/socket-util.h
-@@ -9,6 +9,7 @@
- #include <netinet/in.h>
- #include <stdbool.h>
- #include <stddef.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <sys/un.h>
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
deleted file mode 100644
index ada404b053..0000000000
--- a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 56e3c9581e2c9b7435d5fcbd74b47c7ccf6b3891 Mon Sep 17 00:00:00 2001
-From: Andrej Valek <andrej.valek@siemens.com>
-Date: Thu, 18 Apr 2019 10:47:11 +0200
-Subject: fs-util.h: add missing sys/stat include
-
-fix error:
-| error: passing argument 5 of 'chase_symlinks_and_stat' from incompatible pointer type [-Werror=incompatible-pointer-types]
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-Upstream-Status: Accepted
----
- src/basic/fs-util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index b9651205e6..c153bc4448 100644
---- a/src/basic/fs-util.h
-+++ b/src/basic/fs-util.h
-@@ -7,6 +7,7 @@
- #include <stdbool.h>
- #include <stdint.h>
- #include <sys/inotify.h>
-+#include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_243.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_242.bb
rename to meta/recipes-core/systemd/systemd_243.bb
index 2c101cbbb4..6971fcaa16 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -37,7 +37,6 @@ SRC_URI_MUSL = "\
                file://0008-add-missing-FTW_-macros-for-musl.patch \
                file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch \
                file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
                file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
@@ -46,11 +45,11 @@ SRC_URI_MUSL = "\
                file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0001-src-udev-udev-event.c-must-include-sys-wait.h.patch \
-               file://0023-socket-util.h-include-string.h.patch \
                file://0024-test-json.c-define-M_PIl.patch \
-               file://0025-fs-utilh-add-missing-sys-stat-include.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
+               file://0002-src-login-brightness.c-include-wait.h.patch \
+               file://0003-src-basic-copy.c-include-signal.h.patch \
+               file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
                "
 
 PAM_PLUGINS = " \
@@ -653,13 +652,13 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
-pkg_postinst_${PN} () {
+pkg_postinst_${PN}_libc-glibc () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
 		-i $D${sysconfdir}/nsswitch.conf
 }
 
-pkg_prerm_${PN} () {
+pkg_prerm_${PN}_libc-glibc () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
 		-i $D${sysconfdir}/nsswitch.conf
-- 
2.21.0


