Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EBBC71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 21:48:08 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.8152.1749851286693914445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 14:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=k3/sDkwc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025061321475939701c6370fff3ec89-dx_lc1@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025061321475939701c6370fff3ec89
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Jun 2025 23:48:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YvXqfRt8/kZhH+TH1Bl/q4Dn+M8pTG/FyZ2gF5S+UYo=;
 b=k3/sDkwc1pn/hjsYV6HdElwHhMZyXr5LRznMhx52XObQwhVTNqXAC2JPFRGgiz/OW8EWml
 L+CfIkgHRFfHndpuHC3rJWT9tg/FVwqE+LQS6mNHtPOCkVwjhOYsEXh6NDqKE96M7v9gSdHY
 Ka3zis98w4VmIJhPl395jXk8PMzPtzI9KAsVHuVPgAxI1yywHxMRLeF3MVaXUYSx2xJR/t8j
 KsZpL2CACc0xqZU9BruB610RoQ9VUEGEcWX0i/2yroYg7ts0D7H5XrhlAAPdFW+lqPiN2nzl
 IslrNPSP5YhJIOwxvCToRD9vSEPo9pvo8OF+md2FgNkMavEZUByhr1GA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] systemd: upgrade 257.5 -> 257.6
Date: Fri, 13 Jun 2025 23:46:54 +0200
Message-Id: <20250613214654.1418492-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 21:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218630

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-4598

Rebase patches

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ative_257.5.bb => systemd-boot-native_257.6.bb} |  0
 ...systemd-boot_257.5.bb => systemd-boot_257.6.bb} |  0
 ..._257.5.bb => systemd-systemctl-native_257.6.bb} |  0
 meta/recipes-core/systemd/systemd.inc              |  2 +-
 ...llback-parse_printf_format-implementation.patch |  2 +-
 ...12-do-not-disable-buffer-in-writing-files.patch | 14 +++++++-------
 .../systemd/0014-Handle-missing-gshadow.patch      |  4 ++--
 ...rrno-util-Make-STRERROR-portable-for-musl.patch |  7 +++----
 .../systemd/{systemd_257.5.bb => systemd_257.6.bb} |  0
 9 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.5.bb => systemd-boot-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.5.bb => systemd-boot_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.5.bb => systemd-systemctl-native_257.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.5.bb => systemd_257.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.5.bb b/meta/recipes-core/systemd/systemd-boot-native_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.5.bb
rename to meta/recipes-core/systemd/systemd-boot_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 243053a8c7..5ed84757f3 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
+SRCREV = "00a12c234e2506f5cab683460199575f13c454db"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index f9a45bb40b..47b8583e7a 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -25,7 +25,7 @@ diff --git a/meson.build b/meson.build
 index bffda86845..4146f4beef 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -773,6 +773,7 @@ foreach header : ['crypt.h',
+@@ -770,6 +770,7 @@ foreach header : ['crypt.h',
                    'linux/ioprio.h',
                    'linux/memfd.h',
                    'linux/time_types.h',
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
index 00b4b777f4..0bbc6bbac7 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -71,7 +71,7 @@ diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
 index 332e8cdfd5..804498127d 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -354,12 +354,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -359,12 +359,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -154,7 +154,7 @@ diff --git a/src/core/cgroup.c b/src/core/cgroup.c
 index 6933aae54d..ab6fccc0e4 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -5167,7 +5167,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -5175,7 +5175,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
          if (r < 0)
                  return r;
  
@@ -180,7 +180,7 @@ diff --git a/src/core/main.c b/src/core/main.c
 index 172742c769..e68ce2a6d8 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1812,7 +1812,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1826,7 +1826,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -231,7 +231,7 @@ diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-
 index 01fa90b1ff..83ab655bf4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2563,7 +2563,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2564,7 +2564,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -359,7 +359,7 @@ diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
 index 805503f366..3234a1d76e 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -173,7 +173,7 @@ void disable_coredumps(void) {
+@@ -180,7 +180,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -372,7 +372,7 @@ diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
 index 1213fdc2c7..4c26e6a4ee 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -495,7 +495,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -498,7 +498,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -381,7 +381,7 @@ index 1213fdc2c7..4c26e6a4ee 100644
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -511,7 +511,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -514,7 +514,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
index 08d4e384ff..0aabae6d82 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -140,7 +140,7 @@ diff --git a/src/shared/userdb.c b/src/shared/userdb.c
 index ff83d4bf90..54d36cc706 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1041,13 +1041,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1042,13 +1042,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -157,7 +157,7 @@ index ff83d4bf90..54d36cc706 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1060,6 +1062,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1061,6 +1063,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index 791079a19f..56083cc7b3 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -11,8 +11,8 @@ Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/basic/errno-util.h | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
+ src/basic/errno-util.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
 index 48b76e4bf7..6e7653e2d9 100644
@@ -23,9 +23,8 @@ index 48b76e4bf7..6e7653e2d9 100644
   *
   * Note that we use the GNU variant of strerror_r() here. */
 -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN)
--
 +static inline const char * STRERROR(int errnum);
-+
+ 
 +static inline const char * STRERROR(int errnum) {
 +#ifdef __GLIBC__
 +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN);
diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.5.bb
rename to meta/recipes-core/systemd/systemd_257.6.bb

