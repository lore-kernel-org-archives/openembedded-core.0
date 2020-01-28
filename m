Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B994916DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 20:21:14 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gv17so1612365pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i2MANxzff4c54H9GCfGM4DQGHj9BjXbYbqfGEd3t+30=;
	b=lR/ROBrKcP+1Qtado+vHZe2c/81IwpWFnoTxC3TmhHw29BjhPiAr7yhFjAtuHhYdqS
	4TovtlYK6YNACCs4gmmIc2DVm0PFjY4eoYUUrTZOZQabmEscCdv9or3oO2/K8Cj51O63
	vxPJef0InZDY1lsBHdvV6qCfsou2Q2WC9Pt0G4TSBn/LKaTdh7jPVMzAosLgyozdME52
	umsm3sM0AXijyPuhWOwvlGQI8pGLjA119rbmrM8j4UvG5SKOBXtbAbnDqeMTxVt+Fr7t
	utLp83jpXfTbw12OmhcziHRUfekpLeXbG7JKs7UM0X4acfjKbORaoxaYr8AiEtb7GFzF
	JunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i2MANxzff4c54H9GCfGM4DQGHj9BjXbYbqfGEd3t+30=;
	b=SKEggoDR3y+LVFsjqMShDZVkKxrWre7q3fNewprgK8Hhc879mO2Mi+y87Y2RZPudSu
	biKyFtEGQnaLaVb6+DNCCdOPLmG1aGQ23oeAtA2iY91gklnbPk2Blztwz7wiUGqokdOk
	5P+YeSOxqYn+uZ5yMnbl/JwXSjIuECzHNnl+y47TPxoRNS3lJnbQXsxf8K2erJLotVTj
	RW2D7b8LvmkRyQe9AfxDDX8KTQ3ZgUCv2MY4WUF+vm5QUCUsqILTBoK8/TvhYooPR989
	jqQiO2OyuMmMWc21PjkNNltnZJTfqdI8t38l5REPyUsklw3K6TeDQEgzo3xwPl0GwfmV
	3bxQ==
X-Gm-Message-State: APjAAAW7udpz/Hiy8B5QFWNA23ziP55X0OdhHovREavwSnnxyYi7pKPS
	2g8i2JL5htSbevtH7SwsADUF1eWuc+c=
X-Google-Smtp-Source: APXvYqyvG+6hh/b/oeG6nvQ+ed6X8GKVxY4S1lihyzUksE5qy29BMK/6/FP9AmaabUYKAOiKQMk6jA==
X-Received: by 2002:a17:902:8f91:: with SMTP id
	z17mr24574666plo.234.1580242874576; 
	Tue, 28 Jan 2020 12:21:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id j21sm3541044pji.7.2020.01.28.12.21.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 12:21:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 12:21:14 -0800
Message-Id: <20200128202114.2213947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] systemd: Refresh the patches
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
X-List-Received-Date: Tue, 28 Jan 2020 20:21:14 -0000
Content-Transfer-Encoding: 8bit

Fixes

WARNING: systemd-1_243.4+gitAUTOINC+70e8c1978a-r0 do_patch: Fuzz detected:

Applying patch 0001-do-not-disable-buffer-in-writing-files.patch
...
QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-not-disable-buffer-in-writing-files.patch | 88 ++++++-------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index 2f4daf8665..d6d68a09ac 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -38,11 +38,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  17 files changed, 36 insertions(+), 36 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 7b5839ccd6..18f6e8ffc8 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -860,7 +860,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -860,7 +860,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -51,7 +49,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1142,7 +1142,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -60,7 +58,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -1160,7 +1160,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -69,7 +67,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
                  if (r < 0)
                          return r;
  
-@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1187,7 +1187,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -78,7 +76,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -1197,7 +1197,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -87,7 +85,7 @@ index 7b5839ccd6..18f6e8ffc8 100644
          if (r < 0)
                  return r;
  
-@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -2053,7 +2053,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -105,11 +103,9 @@ index 7b5839ccd6..18f6e8ffc8 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 42ce53d5aa..57512532a6 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -125,11 +121,9 @@ index 42ce53d5aa..57512532a6 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
-index 123d00e13e..e7ea78f349 100644
 --- a/src/basic/smack-util.c
 +++ b/src/basic/smack-util.c
-@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -138,8 +132,6 @@ index 123d00e13e..e7ea78f349 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/basic/util.c b/src/basic/util.c
-index 93d610bc98..97dca64f73 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -294,7 +294,7 @@ void disable_coredumps(void) {
@@ -151,11 +143,9 @@ index 93d610bc98..97dca64f73 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index aa9d811f2e..8c7f2dae7a 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
          if (!fn)
                  return log_oom();
  
@@ -164,7 +154,7 @@ index aa9d811f2e..8c7f2dae7a 100644
  }
  
  static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
  
          (void) delete_rule(rule);
  
@@ -182,11 +172,9 @@ index aa9d811f2e..8c7f2dae7a 100644
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
-diff --git a/src/core/main.c b/src/core/main.c
-index bcce7178a8..4199cedab9 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1285,7 +1285,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1303,7 +1303,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -195,7 +183,7 @@ index bcce7178a8..4199cedab9 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1509,7 +1509,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1527,7 +1527,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -204,11 +192,9 @@ index bcce7178a8..4199cedab9 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index b95e6239d4..fdbdaaaccb 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -327,17 +327,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -230,8 +216,6 @@ index b95e6239d4..fdbdaaaccb 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 17e7cd1a00..87a7667716 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -243,11 +227,9 @@ index 17e7cd1a00..87a7667716 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index c4a7f2f3d3..bcac758284 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -256,11 +238,9 @@ index c4a7f2f3d3..bcac758284 100644
          if (r < 0) {
                  if (r == -ELOOP)
                          return -EINVAL;
-diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 30b9a66334..cc1d577933 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1325,7 +1325,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+@@ -1323,7 +1323,7 @@ static int trigger_device(Manager *m, sd
                  if (!t)
                          return -ENOMEM;
  
@@ -269,11 +249,9 @@ index 30b9a66334..cc1d577933 100644
          }
  
          return 0;
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 0462b46413..7c53d41483 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -282,11 +260,9 @@ index 0462b46413..7c53d41483 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 2aec8041f0..841542f2f3 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2357,7 +2357,7 @@ static int reset_audit_loginuid(void) {
+@@ -2403,7 +2403,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -295,7 +271,7 @@ index 2aec8041f0..841542f2f3 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3566,13 +3566,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3612,13 +3612,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -311,11 +287,9 @@ index 2aec8041f0..841542f2f3 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 93bdcf11bf..68cddb7a9f 100644
 --- a/src/shared/sysctl-util.c
 +++ b/src/shared/sysctl-util.c
-@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -88,7 +88,7 @@ int sysctl_write_ip_property(int af, con
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -324,11 +298,9 @@ index 93bdcf11bf..68cddb7a9f 100644
  }
  
  int sysctl_read(const char *property, char **content) {
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index b9fe96635d..f168d7f890 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -54,7 +54,7 @@ static int write_hibernate_location_info(void) {
+@@ -54,7 +54,7 @@ static int write_hibernate_location_info
  
          /* if it's a swap partition, we just write the disk to /sys/power/resume */
          if (streq(type, "partition")) {
@@ -337,7 +309,7 @@ index b9fe96635d..f168d7f890 100644
                  if (r < 0)
                          return log_debug_errno(r, "Failed to write partition device to /sys/power/resume: %m");
  
-@@ -98,14 +98,14 @@ static int write_hibernate_location_info(void) {
+@@ -98,14 +98,14 @@ static int write_hibernate_location_info
  
          offset = fiemap->fm_extents[0].fe_physical / page_size();
          xsprintf(offset_str, "%" PRIu64, offset);
@@ -363,7 +335,7 @@ index b9fe96635d..f168d7f890 100644
                  if (k >= 0)
                          return 0;
  
-@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **states) {
+@@ -140,7 +140,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -372,24 +344,20 @@ index b9fe96635d..f168d7f890 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index 77d95e513f..25ce4abfb1 100644
 --- a/src/udev/udevadm-trigger.c
 +++ b/src/udev/udevadm-trigger.c
-@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
+@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerato
                  if (!filename)
                          return log_oom();
  
 -                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
 +                r = write_string_file(filename, action, 0);
                  if (r < 0) {
-                         log_full_errno(r == -ENOENT ? LOG_DEBUG : LOG_ERR, r,
-                                        "Failed to write '%s' to '%s': %m", action, filename);
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index cb5123042a..ea309a9e7f 100644
+                         bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
+ 
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
+@@ -1113,7 +1113,7 @@ static int synthesize_change_one(sd_devi
  
          filename = strjoina(syspath, "/uevent");
          log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
@@ -398,11 +366,9 @@ index cb5123042a..ea309a9e7f 100644
          if (r < 0)
                  return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
          return 0;
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 75d052ae70..5a15c939d8 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -117,7 +117,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
-- 
2.25.0


