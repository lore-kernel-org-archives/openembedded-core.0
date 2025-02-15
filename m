Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139C7C197BF
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8056.1739623333145012007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UvXFwtNI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=c5GktG1z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019509a17a01-987d94c5-6452-4e0f-9528-f90f020dfdda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pZ+3dGO/fvll58MOqAF7fk9/5+3QLnw0S69b7xBO6w4=;
	b=UvXFwtNIp5sGzFpN6JzXMg/mgDPWIblrpmg4MHkE8iGycfLXcUnPxtKQEynFRlz0
	fuqEzKCCMxMGfymuVXY5T11uAHhM7Q8OCUL2jZRB0kiiyWSOqJILpXsioYAJC48yOXH
	M/Rmww2QGqRdftUPhS0wy0wHwLDWE0Tlus7l3F8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pZ+3dGO/fvll58MOqAF7fk9/5+3QLnw0S69b7xBO6w4=;
	b=c5GktG1z4xsY9kCVrRqoffFRlEcJ9wXl05S7aCVG9a47V6R1GNqJY+DtEKXiB4t5
	22r4gGSloxyfXMKKJg/Wq0M8VzpyL0vUzgRpbpfu4m+0UFc+FDYT05Y9gePpLlPfaE3
	sbgkQMe8e1qp9F3864+o+Lp5xxI8JfnuPZvzne3Y=
Content-Type: multipart/mixed; boundary="===============6075133022631612266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.15 FAILED
Message-ID: <0101019509a17a01-987d94c5-6452-4e0f-9528-f90f020dfdda-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211408

--===============6075133022631612266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.15* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.14-2.15.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 32b2a5f924a4bb73901642ec04fd2678cec9939a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:27:02 +0000
Subject: [PATCH] ofono: upgrade 2.14 -> 2.15

---
 .../ofono/ofono/CVE-2024-7539.patch           | 88 -------------------
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 -----------
 .../ofono/ofono/rmnet.patch                   | 45 ----------
 .../ofono/{ofono_2.14.bb => ofono_2.15.bb}    | 12 +--
 4 files changed, 4 insertions(+), 193 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/rmnet.patch
 rename meta/recipes-connectivity/ofono/{ofono_2.14.bb => ofono_2.15.bb} (84%)

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
deleted file mode 100644
index e41596959b..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 389e2344f86319265fb72ae590b470716e038fdc Mon Sep 17 00:00:00 2001
-From: Sicelo A. Mhlongo <absicsz@gmail.com>
-Date: Tue, 17 Dec 2024 11:31:29 +0200
-Subject: [PATCH] ussd: ensure ussd content fits in buffers
-
-Fixes: CVE-2024-7539
-
-CVE: CVE-2024-7539
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- drivers/atmodem/ussd.c      | 5 ++++-
- drivers/huaweimodem/ussd.c  | 5 ++++-
- drivers/speedupmodem/ussd.c | 5 ++++-
- 3 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/atmodem/ussd.c b/drivers/atmodem/ussd.c
-index 32a9fe9..99da559 100644
---- a/drivers/atmodem/ussd.c
-+++ b/drivers/atmodem/ussd.c
-@@ -93,7 +93,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	const char *content;
-	int dcs;
-	enum sms_charset charset;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -113,6 +113,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	if (!g_at_result_iter_next_number(&iter, &dcs))
-		dcs = 0;
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	if (!cbs_dcs_decode(dcs, NULL, NULL, &charset, NULL, NULL, NULL)) {
-		ofono_error("Unsupported USSD data coding scheme (%02x)", dcs);
-		status = 4; /* Not supported */
-diff --git a/drivers/huaweimodem/ussd.c b/drivers/huaweimodem/ussd.c
-index 5e1c907..3d165c8 100644
---- a/drivers/huaweimodem/ussd.c
-+++ b/drivers/huaweimodem/ussd.c
-@@ -38,7 +38,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	int status;
-	int dcs = 0;
-	const char *content;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -55,6 +55,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-
-	g_at_result_iter_next_number(&iter, &dcs);
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
-
- out:
-diff --git a/drivers/speedupmodem/ussd.c b/drivers/speedupmodem/ussd.c
-index aafa4bc..a5efde0 100644
---- a/drivers/speedupmodem/ussd.c
-+++ b/drivers/speedupmodem/ussd.c
-@@ -37,7 +37,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	int status;
-	int dcs = 0;
-	const char *content;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -54,6 +54,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-
-	g_at_result_iter_next_number(&iter, &dcs);
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
-
- out:
---
-2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
deleted file mode 100644
index fd97d4b51b..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 29ff6334b492504ace101be748b256e6953d2c2f Mon Sep 17 00:00:00 2001
-From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
-Date: Tue, 17 Dec 2024 11:31:28 +0200
-Subject: [PATCH] atmodem: sms: ensure buffer is initialized before use
-
-Fixes: CVE-2024-7540
-Fixes: CVE-2024-7541
-Fixes: CVE-2024-7542
-
-CVE: CVE-2024-7540
-CVE: CVE-2024-7541
-CVE: CVE-2024-7542
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- drivers/atmodem/sms.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/atmodem/sms.c b/drivers/atmodem/sms.c
-index d994856b..0668c631 100644
---- a/drivers/atmodem/sms.c
-+++ b/drivers/atmodem/sms.c
-@@ -399,7 +399,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 
-@@ -466,7 +466,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 
-@@ -648,7 +648,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 	int index;
--- 
-2.30.2
-
diff --git a/meta/recipes-connectivity/ofono/ofono/rmnet.patch b/meta/recipes-connectivity/ofono/ofono/rmnet.patch
deleted file mode 100644
index 11dfd5db18..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/rmnet.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From git@z Thu Jan  1 00:00:00 1970
-Subject: [PATCH] rmnet: Handle toolchains with old kernel headers
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 19 Dec 2024 13:47:15 +0000
-Message-Id: <e2b6a94dd9a3789e31dafadfc70c53b565d1db04.camel@linuxfoundation.org>
-MIME-Version: 1.0
-Content-Type: text/plain; charset="utf-8"
-Content-Transfer-Encoding: 7bit
-
-The RMNET_FLAGS_*GRESS_MAP_CKSUMV5 defines were added to the kernel in
-5.14[1] and some toolchains use older headers, so add fallback defines
-in case they are needed.
-
-[1] linux b6e5d27e32ef6089d316ce7e1ecaf595584d4b84
-
-Upstream-Status: Submitted [https://lore.kernel.org/ofono/e2b6a94dd9a3789e31dafadfc70c53b565d1db04.camel@linuxfoundation.org/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/rmnet.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/rmnet.c b/src/rmnet.c
-index 42b03249..9a7f52fb 100644
---- a/src/rmnet.c
-+++ b/src/rmnet.c
-@@ -27,6 +27,16 @@
- #define MAX_MUX_IDS 254U
- #define DEFAULT_MTU 1400U
- 
-+/*
-+ * These were added in 5.14 so define them here if the toolchain's kernel headers are old.
-+ */
-+#ifndef RMNET_FLAGS_INGRESS_MAP_CKSUMV5
-+#define RMNET_FLAGS_INGRESS_MAP_CKSUMV5 (1U << 4)
-+#endif
-+#ifndef RMNET_FLAGS_EGRESS_MAP_CKSUMV5
-+#define RMNET_FLAGS_EGRESS_MAP_CKSUMV5 (1U << 5)
-+#endif
-+
- struct rmnet_request {
- 	uint32_t parent_ifindex;
- 	rmnet_new_interfaces_func_t new_cb;
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes-connectivity/ofono/ofono_2.15.bb
similarity index 84%
rename from meta/recipes-connectivity/ofono/ofono_2.14.bb
rename to meta/recipes-connectivity/ofono/ofono_2.15.bb
index 9a91afaa7b..40eeb3a086 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -7,14 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=6;md5=13e42133935ceecfc9bcb547f256e277"
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
-SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-    file://rmnet.patch \
-    file://ofono \
-    file://CVE-2024-7539.patch \
-    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
-"
-SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+           file://ofono \
+           "
+SRC_URI[sha256sum] = "1af93ab72a70502452fe3d0297a6eaea13750cacae1fff3b643dd2245a6408ca"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.1


--===============6075133022631612266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:749ef203f571c1e9decce1b19a7c3f7f73b8445f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 425 Local 412 Mirrors 0 Missed 13 Current 650 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2388 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_recipe_qa)
NOTE: recipe ofono-2.15-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.15-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2910 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_fetch)
NOTE: recipe ofono-2.15-r0: task do_fetch: Started
NOTE: recipe ofono-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 2911 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_unpack)
NOTE: Running task 2912 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.15-r0: task do_unpack: Started
NOTE: recipe ofono-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 2913 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_patch)
NOTE: Running task 2914 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.15-r0: task do_patch: Started
NOTE: recipe ofono-2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.15-r0: task do_patch: Succeeded
NOTE: Running task 2915 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2916 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_populate_lic)
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.15-r0: task do_populate_lic: Started
NOTE: recipe ofono-2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2917 of 2929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_configure)
NOTE: recipe ofono-2.15-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.71.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_25
 7.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta
 /recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'vala', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 
 'libffi', 'libical', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing existing aclocal.m4
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/ofono-2.15/build-aux/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/ofono-2.15/build-aux/ --force -I build-aux
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'build-aux'.
| libtoolize: copying file 'build-aux/libtool.m4'
| libtoolize: copying file 'build-aux/ltoptions.m4'
| libtoolize: copying file 'build-aux/ltsugar.m4'
| libtoolize: copying file 'build-aux/ltversion.m4'
| libtoolize: copying file 'build-aux/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/ofono-2.15/build-aux/ --force -I build-aux
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot-native/usr/bin/autoconf --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/ofono-2.15/build-aux/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot-native/usr/bin/autoheader --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/ofono-2.15/build-aux/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:25: installing 'build-aux/compile'
| configure.ac:10: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../ofono-2.15/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking how to create a pax tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot accepts -fsanitize=undefined... yes
| checking for gawk... (cached) gawk
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot   option to reload object files... -r
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot object... ok
| checking for sysroot... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot
| checking for a working dd... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for _init in -lasan... no
| checking for _init in -llsan... no
| checking for _init in -lubsan... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for dlopen in -ldl... yes
| checking for glib-2.0 >= 2.68... yes
| checking for dbus-1 >= 1.6... yes
| checking for libudev >= 143... yes
| checking for ell >= 0.72... no
| configure: error: Embedded Linux library >= 0.72 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886:279 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886, line 279
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886, line 255
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886, line 225
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886, line 283
NOTE: recipe ofono-2.15-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2917 tasks of which 2908 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215062642.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215062642.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/log.do_configure.1076886
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.15-r0 do_configure: configure failed
ERROR: ofono-2.15-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/run.do_configure.1076886' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.15/temp/log.do_configure.1076886
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_configure) failed with exit code '1'

--===============6075133022631612266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.14-2.15.patch"

RnJvbSAzMmIyYTVmOTI0YTRiYjczOTAxNjQyZWMwNGZkMjY3OGNlYzk5MzlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6Mjc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjE0IC0+IDIuMTUKCi0tLQogLi4uL29mb25vL29mb25vL0NWRS0yMDI0
LTc1MzkucGF0Y2ggICAgICAgICAgIHwgODggLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uMDI0LTc1
NDBfQ1ZFLTIwMjQtNzU0MV9DVkUtMjAyNC03NTQyLnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0KIC4u
Li9vZm9uby9vZm9uby9ybW5ldC5wYXRjaCAgICAgICAgICAgICAgICAgICB8IDQ1IC0tLS0tLS0t
LS0KIC4uLi9vZm9uby97b2Zvbm9fMi4xNC5iYiA9PiBvZm9ub18yLjE1LmJifSAgICB8IDEyICst
LQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE5MyBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL0NW
RS0yMDI0LTc1MzkucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1NDBfQ1ZFLTIwMjQtNzU0MV9DVkUtMjAyNC03
NTQyLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
Zm9uby9vZm9uby9ybW5ldC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMTQuYmIgPT4gb2Zvbm9fMi4xNS5iYn0gKDg0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1MzkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1Mzku
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGU0MTU5Njk1OWIuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby9DVkUtMjAyNC03
NTM5LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODggKzAsMCBAQAotRnJvbSAzODllMjM0NGY4
NjMxOTI2NWZiNzJhZTU5MGI0NzA3MTZlMDM4ZmRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogU2ljZWxvIEEuIE1obG9uZ28gPGFic2ljc3pAZ21haWwuY29tPgotRGF0ZTogVHVlLCAx
NyBEZWMgMjAyNCAxMTozMToyOSArMDIwMAotU3ViamVjdDogW1BBVENIXSB1c3NkOiBlbnN1cmUg
dXNzZCBjb250ZW50IGZpdHMgaW4gYnVmZmVycwotCi1GaXhlczogQ1ZFLTIwMjQtNzUzOQotCi1D
VkU6IENWRS0yMDI0LTc1MzkKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9uZXR3b3JrL29mb25vL29mb25vLmdpdC9jb21taXQvP2lkPTM4
OWUyMzQ0Zjg2MzE5MjY1ZmI3MmFlNTkwYjQ3MDcxNmUwMzhmZGNdCi0KLVNpZ25lZC1vZmYtYnk6
IFlvZ2l0YSBVcmFkZSA8eW9naXRhLnVyYWRlQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBkcml2ZXJz
L2F0bW9kZW0vdXNzZC5jICAgICAgfCA1ICsrKystCi0gZHJpdmVycy9odWF3ZWltb2RlbS91c3Nk
LmMgIHwgNSArKysrLQotIGRyaXZlcnMvc3BlZWR1cG1vZGVtL3Vzc2QuYyB8IDUgKysrKy0KLSAz
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS9kcml2ZXJzL2F0bW9kZW0vdXNzZC5jIGIvZHJpdmVycy9hdG1vZGVtL3Vzc2QuYwot
aW5kZXggMzJhOWZlOS4uOTlkYTU1OSAxMDA2NDQKLS0tLSBhL2RyaXZlcnMvYXRtb2RlbS91c3Nk
LmMKLSsrKyBiL2RyaXZlcnMvYXRtb2RlbS91c3NkLmMKLUBAIC05Myw3ICs5Myw3IEBAIHN0YXRp
YyB2b2lkIGN1c2RfcGFyc2UoR0F0UmVzdWx0ICpyZXN1bHQsIHN0cnVjdCBvZm9ub191c3NkICp1
c3NkKQotCWNvbnN0IGNoYXIgKmNvbnRlbnQ7Ci0JaW50IGRjczsKLQllbnVtIHNtc19jaGFyc2V0
IGNoYXJzZXQ7Ci0tCXVuc2lnbmVkIGNoYXIgbXNnWzE2MF07Ci0rCXVuc2lnbmVkIGNoYXIgbXNn
WzE2MF0gPSB7MH07Ci0JY29uc3QgdW5zaWduZWQgY2hhciAqbXNnX3B0ciA9IE5VTEw7Ci0JbG9u
ZyBtc2dfbGVuOwotCi1AQCAtMTEzLDYgKzExMyw5IEBAIHN0YXRpYyB2b2lkIGN1c2RfcGFyc2Uo
R0F0UmVzdWx0ICpyZXN1bHQsIHN0cnVjdCBvZm9ub191c3NkICp1c3NkKQotCWlmICghZ19hdF9y
ZXN1bHRfaXRlcl9uZXh0X251bWJlcigmaXRlciwgJmRjcykpCi0JCWRjcyA9IDA7Ci0KLSsJaWYg
KHN0cmxlbihjb250ZW50KSA+IHNpemVvZihtc2cpICogMikKLSsJCWdvdG8gb3V0OwotKwotCWlm
ICghY2JzX2Rjc19kZWNvZGUoZGNzLCBOVUxMLCBOVUxMLCAmY2hhcnNldCwgTlVMTCwgTlVMTCwg
TlVMTCkpIHsKLQkJb2Zvbm9fZXJyb3IoIlVuc3VwcG9ydGVkIFVTU0QgZGF0YSBjb2Rpbmcgc2No
ZW1lICglMDJ4KSIsIGRjcyk7Ci0JCXN0YXR1cyA9IDQ7IC8qIE5vdCBzdXBwb3J0ZWQgKi8KLWRp
ZmYgLS1naXQgYS9kcml2ZXJzL2h1YXdlaW1vZGVtL3Vzc2QuYyBiL2RyaXZlcnMvaHVhd2VpbW9k
ZW0vdXNzZC5jCi1pbmRleCA1ZTFjOTA3Li4zZDE2NWM4IDEwMDY0NAotLS0tIGEvZHJpdmVycy9o
dWF3ZWltb2RlbS91c3NkLmMKLSsrKyBiL2RyaXZlcnMvaHVhd2VpbW9kZW0vdXNzZC5jCi1AQCAt
MzgsNyArMzgsNyBAQCBzdGF0aWMgdm9pZCBjdXNkX3BhcnNlKEdBdFJlc3VsdCAqcmVzdWx0LCBz
dHJ1Y3Qgb2Zvbm9fdXNzZCAqdXNzZCkKLQlpbnQgc3RhdHVzOwotCWludCBkY3MgPSAwOwotCWNv
bnN0IGNoYXIgKmNvbnRlbnQ7Ci0tCXVuc2lnbmVkIGNoYXIgbXNnWzE2MF07Ci0rCXVuc2lnbmVk
IGNoYXIgbXNnWzE2MF0gPSB7MH07Ci0JY29uc3QgdW5zaWduZWQgY2hhciAqbXNnX3B0ciA9IE5V
TEw7Ci0JbG9uZyBtc2dfbGVuOwotCi1AQCAtNTUsNiArNTUsOSBAQCBzdGF0aWMgdm9pZCBjdXNk
X3BhcnNlKEdBdFJlc3VsdCAqcmVzdWx0LCBzdHJ1Y3Qgb2Zvbm9fdXNzZCAqdXNzZCkKLQotCWdf
YXRfcmVzdWx0X2l0ZXJfbmV4dF9udW1iZXIoJml0ZXIsICZkY3MpOwotCi0rCWlmIChzdHJsZW4o
Y29udGVudCkgPiBzaXplb2YobXNnKSAqIDIpCi0rCQlnb3RvIG91dDsKLSsKLQltc2dfcHRyID0g
ZGVjb2RlX2hleF9vd25fYnVmKGNvbnRlbnQsIC0xLCAmbXNnX2xlbiwgMCwgbXNnKTsKLQotIG91
dDoKLWRpZmYgLS1naXQgYS9kcml2ZXJzL3NwZWVkdXBtb2RlbS91c3NkLmMgYi9kcml2ZXJzL3Nw
ZWVkdXBtb2RlbS91c3NkLmMKLWluZGV4IGFhZmE0YmMuLmE1ZWZkZTAgMTAwNjQ0Ci0tLS0gYS9k
cml2ZXJzL3NwZWVkdXBtb2RlbS91c3NkLmMKLSsrKyBiL2RyaXZlcnMvc3BlZWR1cG1vZGVtL3Vz
c2QuYwotQEAgLTM3LDcgKzM3LDcgQEAgc3RhdGljIHZvaWQgY3VzZF9wYXJzZShHQXRSZXN1bHQg
KnJlc3VsdCwgc3RydWN0IG9mb25vX3Vzc2QgKnVzc2QpCi0JaW50IHN0YXR1czsKLQlpbnQgZGNz
ID0gMDsKLQljb25zdCBjaGFyICpjb250ZW50OwotLQl1bnNpZ25lZCBjaGFyIG1zZ1sxNjBdOwot
Kwl1bnNpZ25lZCBjaGFyIG1zZ1sxNjBdID0gezB9OwotCWNvbnN0IHVuc2lnbmVkIGNoYXIgKm1z
Z19wdHIgPSBOVUxMOwotCWxvbmcgbXNnX2xlbjsKLQotQEAgLTU0LDYgKzU0LDkgQEAgc3RhdGlj
IHZvaWQgY3VzZF9wYXJzZShHQXRSZXN1bHQgKnJlc3VsdCwgc3RydWN0IG9mb25vX3Vzc2QgKnVz
c2QpCi0KLQlnX2F0X3Jlc3VsdF9pdGVyX25leHRfbnVtYmVyKCZpdGVyLCAmZGNzKTsKLQotKwlp
ZiAoc3RybGVuKGNvbnRlbnQpID4gc2l6ZW9mKG1zZykgKiAyKQotKwkJZ290byBvdXQ7Ci0rCi0J
bXNnX3B0ciA9IGRlY29kZV9oZXhfb3duX2J1Zihjb250ZW50LCAtMSwgJm1zZ19sZW4sIDAsIG1z
Zyk7Ci0KLSBvdXQ6Ci0tLQotMi40MC4wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1NDBfQ1ZFLTIwMjQtNzU0MV9DVkUtMjAyNC03
NTQyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby9DVkUtMjAy
NC03NTQwX0NWRS0yMDI0LTc1NDFfQ1ZFLTIwMjQtNzU0Mi5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggZmQ5N2Q0YjUxYi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1NDBfQ1ZFLTIwMjQtNzU0MV9DVkUt
MjAyNC03NTQyLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTIgKzAsMCBAQAotRnJvbSAyOWZm
NjMzNGI0OTI1MDRhY2UxMDFiZTc0OGIyNTZlNjk1M2QyYzJmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQotRnJvbTogIlNpY2VsbyBBLiBNaGxvbmdvIiA8YWJzaWNzekBnbWFpbC5jb20+Ci1EYXRl
OiBUdWUsIDE3IERlYyAyMDI0IDExOjMxOjI4ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGF0bW9k
ZW06IHNtczogZW5zdXJlIGJ1ZmZlciBpcyBpbml0aWFsaXplZCBiZWZvcmUgdXNlCi0KLUZpeGVz
OiBDVkUtMjAyNC03NTQwCi1GaXhlczogQ1ZFLTIwMjQtNzU0MQotRml4ZXM6IENWRS0yMDI0LTc1
NDIKLQotQ1ZFOiBDVkUtMjAyNC03NTQwCi1DVkU6IENWRS0yMDI0LTc1NDEKLUNWRTogQ1ZFLTIw
MjQtNzU0MgotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL25ldHdvcmsvb2Zvbm8vb2Zvbm8uZ2l0L2NvbW1pdC8/aWQ9MjlmZjYzMzRiNDky
NTA0YWNlMTAxYmU3NDhiMjU2ZTY5NTNkMmMyZl0KLVNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KLS0tLQotIGRyaXZlcnMvYXRtb2RlbS9zbXMuYyB8
IDYgKysrLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL2RyaXZlcnMvYXRtb2RlbS9zbXMuYyBiL2RyaXZlcnMvYXRtb2Rl
bS9zbXMuYwotaW5kZXggZDk5NDg1NmIuLjA2NjhjNjMxIDEwMDY0NAotLS0tIGEvZHJpdmVycy9h
dG1vZGVtL3Ntcy5jCi0rKysgYi9kcml2ZXJzL2F0bW9kZW0vc21zLmMKLUBAIC0zOTksNyArMzk5
LDcgQEAgc3RhdGljIHZvaWQgYXRfY210X25vdGlmeShHQXRSZXN1bHQgKnJlc3VsdCwgZ3BvaW50
ZXIgdXNlcl9kYXRhKQotIAlzdHJ1Y3Qgc21zX2RhdGEgKmRhdGEgPSBvZm9ub19zbXNfZ2V0X2Rh
dGEoc21zKTsKLSAJR0F0UmVzdWx0SXRlciBpdGVyOwotIAljb25zdCBjaGFyICpoZXhwZHU7Ci0t
CXVuc2lnbmVkIGNoYXIgcGR1WzE3Nl07Ci0rCXVuc2lnbmVkIGNoYXIgcGR1WzE3Nl0gPSB7MH07
Ci0gCWxvbmcgcGR1X2xlbjsKLSAJaW50IHRwZHVfbGVuOwotIAotQEAgLTQ2Niw3ICs0NjYsNyBA
QCBzdGF0aWMgdm9pZCBhdF9jbWdyX25vdGlmeShHQXRSZXN1bHQgKnJlc3VsdCwgZ3BvaW50ZXIg
dXNlcl9kYXRhKQotIAlzdHJ1Y3Qgc21zX2RhdGEgKmRhdGEgPSBvZm9ub19zbXNfZ2V0X2RhdGEo
c21zKTsKLSAJR0F0UmVzdWx0SXRlciBpdGVyOwotIAljb25zdCBjaGFyICpoZXhwZHU7Ci0tCXVu
c2lnbmVkIGNoYXIgcGR1WzE3Nl07Ci0rCXVuc2lnbmVkIGNoYXIgcGR1WzE3Nl0gPSB7MH07Ci0g
CWxvbmcgcGR1X2xlbjsKLSAJaW50IHRwZHVfbGVuOwotIAotQEAgLTY0OCw3ICs2NDgsNyBAQCBz
dGF0aWMgdm9pZCBhdF9jbWdsX25vdGlmeShHQXRSZXN1bHQgKnJlc3VsdCwgZ3BvaW50ZXIgdXNl
cl9kYXRhKQotIAlzdHJ1Y3Qgc21zX2RhdGEgKmRhdGEgPSBvZm9ub19zbXNfZ2V0X2RhdGEoc21z
KTsKLSAJR0F0UmVzdWx0SXRlciBpdGVyOwotIAljb25zdCBjaGFyICpoZXhwZHU7Ci0tCXVuc2ln
bmVkIGNoYXIgcGR1WzE3Nl07Ci0rCXVuc2lnbmVkIGNoYXIgcGR1WzE3Nl0gPSB7MH07Ci0gCWxv
bmcgcGR1X2xlbjsKLSAJaW50IHRwZHVfbGVuOwotIAlpbnQgaW5kZXg7Ci0tLSAKLTIuMzAuMgot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL3JtbmV0
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby9ybW5ldC5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMTFkZmQ1ZGIxOC4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL3JtbmV0LnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNDUgKzAsMCBAQAotRnJvbSBnaXRAeiBUaHUgSmFuICAxIDAwOjAw
OjAwIDE5NzAKLVN1YmplY3Q6IFtQQVRDSF0gcm1uZXQ6IEhhbmRsZSB0b29sY2hhaW5zIHdpdGgg
b2xkIGtlcm5lbCBoZWFkZXJzCi1Gcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KLURhdGU6IFRodSwgMTkgRGVjIDIwMjQgMTM6NDc6MTUgKzAw
MDAKLU1lc3NhZ2UtSWQ6IDxlMmI2YTk0ZGQ5YTM3ODllMzFkYWZhZGZjNzBjNTNiNTY1ZDFkYjA0
LmNhbWVsQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PSJ1dGYtOCIKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDdiaXQKLQotVGhlIFJNTkVUX0ZMQUdTXypHUkVTU19NQVBfQ0tTVU1WNSBkZWZpbmVzIHdl
cmUgYWRkZWQgdG8gdGhlIGtlcm5lbCBpbgotNS4xNFsxXSBhbmQgc29tZSB0b29sY2hhaW5zIHVz
ZSBvbGRlciBoZWFkZXJzLCBzbyBhZGQgZmFsbGJhY2sgZGVmaW5lcwotaW4gY2FzZSB0aGV5IGFy
ZSBuZWVkZWQuCi0KLVsxXSBsaW51eCBiNmU1ZDI3ZTMyZWY2MDg5ZDMxNmNlN2UxZWNhZjU5NTU4
NGQ0Yjg0Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZm9uby9lMmI2YTk0ZGQ5YTM3ODllMzFkYWZhZGZjNzBjNTNiNTY1ZDFkYjA0LmNhbWVs
QGxpbnV4Zm91bmRhdGlvbi5vcmcvVC8jdV0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxy
b3NzLmJ1cnRvbkBhcm0uY29tPgotLS0tCi0gc3JjL3JtbmV0LmMgfCAxMCArKysrKysrKysrCi0g
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3NyYy9ybW5l
dC5jIGIvc3JjL3JtbmV0LmMKLWluZGV4IDQyYjAzMjQ5Li45YTdmNTJmYiAxMDA2NDQKLS0tLSBh
L3NyYy9ybW5ldC5jCi0rKysgYi9zcmMvcm1uZXQuYwotQEAgLTI3LDYgKzI3LDE2IEBACi0gI2Rl
ZmluZSBNQVhfTVVYX0lEUyAyNTRVCi0gI2RlZmluZSBERUZBVUxUX01UVSAxNDAwVQotIAotKy8q
Ci0rICogVGhlc2Ugd2VyZSBhZGRlZCBpbiA1LjE0IHNvIGRlZmluZSB0aGVtIGhlcmUgaWYgdGhl
IHRvb2xjaGFpbidzIGtlcm5lbCBoZWFkZXJzIGFyZSBvbGQuCi0rICovCi0rI2lmbmRlZiBSTU5F
VF9GTEFHU19JTkdSRVNTX01BUF9DS1NVTVY1Ci0rI2RlZmluZSBSTU5FVF9GTEFHU19JTkdSRVNT
X01BUF9DS1NVTVY1ICgxVSA8PCA0KQotKyNlbmRpZgotKyNpZm5kZWYgUk1ORVRfRkxBR1NfRUdS
RVNTX01BUF9DS1NVTVY1Ci0rI2RlZmluZSBSTU5FVF9GTEFHU19FR1JFU1NfTUFQX0NLU1VNVjUg
KDFVIDw8IDUpCi0rI2VuZGlmCi0rCi0gc3RydWN0IHJtbmV0X3JlcXVlc3QgewotIAl1aW50MzJf
dCBwYXJlbnRfaWZpbmRleDsKLSAJcm1uZXRfbmV3X2ludGVyZmFjZXNfZnVuY190IG5ld19jYjsK
LS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9f
Mi4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29mb25vL29mb25vXzIuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNS5iYgppbmRleCA5YTkxYWZhYTdiLi40MGVlYjNhMDg2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE1LmJiCkBA
IC03LDE0ICs3LDEwIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWVi
NzIzYjYxNTM5ZmVlZjAxM2RlNDc2ZTY4YjVjNTBhIFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3NyYy9vZm9uby5oO2JlZ2lubGluZT0xO2VuZGxpbmU9NjttZDU9MTNlNDIxMzM5MzVjZWVj
ZmM5YmNiNTQ3ZjI1NmUyNzciCiBERVBFTkRTID0gImRidXMgZ2xpYi0yLjAgdWRldiBtb2JpbGUt
YnJvYWRiYW5kLXByb3ZpZGVyLWluZm8gZWxsIgogCi1TUkNfVVJJID0gIlwKLSAgICAke0tFUk5F
TE9SR19NSVJST1J9L2xpbnV4L25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiBcCi0gICAgZmls
ZTovL3JtbmV0LnBhdGNoIFwKLSAgICBmaWxlOi8vb2Zvbm8gXAotICAgIGZpbGU6Ly9DVkUtMjAy
NC03NTM5LnBhdGNoIFwKLSAgICBmaWxlOi8vQ1ZFLTIwMjQtNzU0MF9DVkUtMjAyNC03NTQxX0NW
RS0yMDI0LTc1NDIucGF0Y2ggXAotIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4M2NiZmQ1ZTFl
MWE0MTBiYTdhZDJkYjdmNTBmYWRjOTFlNTBiMjlmMWVkZTQwY2RjNzNmOTQxZGE3YmE5NWYiCitT
UkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29yay8ke0JQTn0vJHtCUH0u
dGFyLnh6IFwKKyAgICAgICAgICAgZmlsZTovL29mb25vIFwKKyAgICAgICAgICAgIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjFhZjkzYWI3MmE3MDUwMjQ1MmZlM2QwMjk3YTZlYWVhMTM3NTBjYWNh
ZTFmZmYzYjY0M2RkMjI0NWE2NDA4Y2EiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyB1
cGRhdGUtcmMuZCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhCiAKLS0gCjIuNDQu
MQoK

--===============6075133022631612266==--

