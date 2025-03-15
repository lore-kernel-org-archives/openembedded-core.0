Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0F2C3600D
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10328.1742048293317838247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KFXPlZo6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m6XHQNms;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2b6f49-1bf2e176-83b4-4cc1-9687-28373aa83c4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jf4TxxKTJuv3K7sx3CsCD68lcK4tuxuo3KjzGCJGrT0=;
	b=KFXPlZo6kbeGD6lag9+P5ZT4Q/zjDx9OprZ5PClHSN8rD/KsyXuu048WqcptBPn0
	jT41cUHIKuRt9Q7CuVpTCDaCyxZb9TLbOoGSClX4aOFdL1GHTqcvWn4whS55DNhQ+3A
	pXBNyAMqNqFEQn3Hd9ogRVL7xzbeSxRnP/cu0dIk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jf4TxxKTJuv3K7sx3CsCD68lcK4tuxuo3KjzGCJGrT0=;
	b=m6XHQNmsrMKaCrCC3A4gFZ4K/sb/oe4HoAPK7/tzuSJdXHqCR+CJt9Z69aYXeka4
	V+B/zrhG58qB4/SSKMlIOw8orD+VJTchPQEVfoF3kgOEqA5jATSHEdnPomzSwBdZFei
	xV/nOk6ZDU1KJmBltJulAfd8wz9JkU/Q8iNZOq6c=
Content-Type: multipart/mixed; boundary="===============1941498648100024834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.15 SUCCEEDED
Message-ID: <010101959a2b6f49-1bf2e176-83b4-4cc1-9687-28373aa83c4d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212890

--===============1941498648100024834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.15* has Succeeded.

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
From cdb55c674de09397e8264e0c6d1d19ef14ce95aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:13:41 +0000
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


--===============1941498648100024834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 75 recipes from the core2-64 sysroot...done.
Removing 103 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:34f07741098db223c2926c05989351d231383036"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 756 Local 694 Mirrors 0 Missed 62 Current 277 (91% match, 93% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 284 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 296 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 303 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_populate_lic_setscene)
NOTE: Running setscene task 319 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 320 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 323 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 365 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 367 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 368 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 382 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_populate_lic_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 390 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 413 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 417 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 427 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 432 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 435 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 436 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 439 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 452 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 454 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 461 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 468 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 469 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 473 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 490 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.73-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 494 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 501 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ell-0.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 502 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 523 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 530 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 535 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 536 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 552 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 558 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 563 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 576 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libsm/1.2.5/temp/log.do_packagedata_setscene.466679
NOTE: Running setscene task 577 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 578 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_package_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libx11/1.8.11/temp/log.do_packagedata_setscene.467247
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 648 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 654 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_package_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 677 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 681 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 683 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 685 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 687 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 691 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 712 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 723 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 743 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 779 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 784 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 822 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 832 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xtrans/1.5.2/temp/log.do_packagedata_setscene.468914
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 837 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 961 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1040 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1085 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: Running setscene task 863 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: Running task 1167 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1192 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1219 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: Running task 1220 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe libical-3.0.19-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1233 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: Running setscene task 876 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.19-r0: task do_unpack: Started
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: Running task 1290 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: Running task 1293 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: Running task 1366 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_fetch)
NOTE: Running task 1369 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_fetch)
NOTE: recipe libical-3.0.19-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Started
NOTE: Running task 1377 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_patch)
NOTE: Running task 1379 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_write_config)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 1386 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_unpack)
NOTE: Running task 1406 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_fetch)
NOTE: Running task 1414 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_fetch)
NOTE: Running task 1415 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe ell-0.73-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_fetch: Started
NOTE: Running task 1423 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_write_config)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Started
NOTE: Running task 1434 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_unpack)
NOTE: Running task 1435 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_unpack)
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Started
NOTE: recipe ofono-2.15-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe ofono-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1463 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_unpack)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_write_config: Started
NOTE: Running task 1467 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_unpack)
NOTE: Running task 1468 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: Running task 1469 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_write_config)
NOTE: Running task 1470 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe ell-0.73-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_write_config: Succeeded
NOTE: Running task 1485 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_patch)
NOTE: Running task 1503 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: recipe ofono-2.15-r0: task do_unpack: Started
NOTE: recipe libical-3.0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_write_config: Started
NOTE: Running task 1514 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_generate_toolchain_file)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: Running task 1530 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.73-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_patch)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe ell-0.73-r0: task do_patch: Started
NOTE: Running task 1614 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_patch)
NOTE: recipe ofono-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1621 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_patch)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe ell-0.73-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1625 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_patch: Started
NOTE: recipe ofono-2.15-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_patch: Succeeded
NOTE: Running task 1628 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_deploy_source_date_epoch unihash changed to 165ea457e7d0f97d76e6ffc33e3af5087195f369df401fa6cf94440db276f0bd
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 1631 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 1632 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe cairo-1.18.2-r0: task do_patch: Started
NOTE: recipe cairo-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 877 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 879 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 883 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1644 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 1650 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 917 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 927 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 939 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 942 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 960 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 962 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 967 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 969 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 972 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 985 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 996 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1024 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1025 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2138 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2240 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata)
NOTE: Running task 2272 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata: Started
NOTE: Running task 2367 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2479 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2590 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2643 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata)
NOTE: Running task 2647 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2675 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2686 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 2687 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2688 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: Running task 2689 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe cairo-1.18.2-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2690 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_collect_spdx_deps)
NOTE: Running task 2691 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_collect_spdx_deps)
NOTE: Running task 2692 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.16.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairo-1.18.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_compile)
NOTE: recipe cairo-1.18.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2694 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2695 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2696 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2697 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2698 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2700 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe cairo-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 2701 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_install)
NOTE: recipe cairo-1.18.2-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 2702 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe cairo-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 2703 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot)
NOTE: Running task 2704 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2705 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_package: Started
NOTE: Running task 2706 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2707 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: Running task 2708 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to bdf4a1b2069ff22545b2e3981bcc426d8b6d1c1a0df3340e309b323f6cd13b09
NOTE: Setscene tasks completed
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package: Started
NOTE: Running task 2709 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2710 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2711 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2712 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_configure: Started
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2713 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_configure)
NOTE: recipe ell-0.73-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure)
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_compile)
NOTE: recipe cairo-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_compile: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata unihash changed to f4cba87468925f9883d1380425d0ae8f640a77e12757bfdce50a50b01cbbab9a
NOTE: Setscene tasks completed
NOTE: Running task 2717 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2718 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_compile)
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2719 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_install)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_install: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2720 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package: Succeeded
NOTE: Running task 2721 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_install)
NOTE: Running task 2722 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata)
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_install: Succeeded
NOTE: Running task 2723 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_package)
NOTE: Running task 2724 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata unihash changed to 2fa356be017e2761aca8cff0f189c047c9b68dfb34781697718e6bd4e51706fd
NOTE: Setscene tasks completed
NOTE: Running task 2725 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx)
NOTE: Running task 2726 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_ipk)
NOTE: Running task 2727 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_deb)
NOTE: Running task 2728 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_rpm)
NOTE: Running task 2729 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_qa)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_package_write_ipk: Started
NOTE: recipe dbus-1.16.2-r0: task do_package_write_deb: Started
NOTE: recipe dbus-1.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package_qa: Started
NOTE: Running task 2730 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2731 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package)
NOTE: Running task 2732 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_populate_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2733 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.16.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2734 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_ipk unihash changed to e15cc41334ab47e6b341bf9bc110adab7640e77fbe6646d8115b08445cf206f9
NOTE: recipe ell-0.73-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2735 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_configure)
NOTE: recipe ell-0.73-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_rpm unihash changed to 01507aa5bc37a23e4e65aa08f7447b98b88f42c3e4ed1e77db096fbf409a0d46
NOTE: recipe dbus-1.16.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_qa unihash changed to 57799991d32dce9dea3617fb33e51cfbed7d746135ab59738387330b6701a3ad
NOTE: recipe python3-pycairo-1.27.0-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_packagedata unihash changed to f2a6f3895c0b02309f11b694b3bab614fee8a4e55162ed508eac183842a9b283
NOTE: Setscene tasks completed
NOTE: Running task 2737 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_create_spdx)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2738 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2739 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package_write_deb unihash changed to acc758508d00e7cfb91679b6663f23b05b139a74fdf401ccd3192d2794864cd5
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata unihash changed to c8c4df87d8ea50149bd27553bae8604185c503a5f0752b18a3a920ee8763dc8f
NOTE: Setscene tasks completed
NOTE: Running task 2740 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_compile)
NOTE: recipe ell-0.73-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_create_spdx)
NOTE: Setscene tasks completed
NOTE: Running task 2742 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_compile)
NOTE: Running task 2743 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_ipk)
NOTE: Running task 2744 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_deb)
NOTE: Running task 2745 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_compile: Started
NOTE: Running task 2746 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_qa)
NOTE: recipe python3-dbus-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe ell-0.73-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_qa: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_ipk unihash changed to 7fc285108d9576b3f4c8de630e96672f25c710ac8aae1836cc93024450154172
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_qa unihash changed to 0fecd26514824c3c7ab0465f8ea07296c001ceda5901604b0d2e968165e44bee
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_rpm unihash changed to 2c4e1a3c4286efcfc1886fbcfb8752a17cfce118aedd407d8124bbedd8e76adf
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_deb unihash changed to 4d8b8e844faa72187c6aa0494a2a71fbe9d67c74c9a82cdfa862e561f529c739
NOTE: recipe python3-pygobject-3.50.0-r0: task do_compile: Succeeded
NOTE: Running task 2747 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_install)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_install: Started
NOTE: recipe ell-0.73-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_install)
NOTE: recipe ell-0.73-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_install: Succeeded
NOTE: Running task 2749 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package)
NOTE: Running task 2750 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_populate_sysroot)
NOTE: recipe ell-0.73-r0: task do_install: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package: Started
NOTE: Running task 2751 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package)
NOTE: Running task 2752 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_populate_sysroot)
NOTE: recipe ell-0.73-r0: task do_package: Started
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_packagedata unihash changed to 601898ab52bb03f4b0ff58a64d95d5317f7d30c51b598e8807b1232795461d8d
NOTE: Setscene tasks completed
NOTE: Running task 2754 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_create_spdx)
NOTE: Running task 2755 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_ipk)
NOTE: Running task 2756 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_deb)
NOTE: Running task 2757 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_rpm)
NOTE: Running task 2758 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_qa)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_qa: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_create_spdx: Succeeded
NOTE: recipe ell-0.73-r0: task do_package: Succeeded
NOTE: Running task 2759 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_packagedata)
NOTE: recipe ell-0.73-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_ipk unihash changed to 752913269787ce7c032599c11905bd376c226a0a9463e968f14b2035596840ab
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_qa unihash changed to f933505383c51cd295cb27463b4b80d6768946a3cb9a8b30d72885ca341ebc24
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.73-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_rpm unihash changed to 95863d0c179125848a4618dfdd44768f9e14bd3f734d3c655bbc14ed4d927849
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_packagedata unihash changed to baef821e5947c685a2f3bc803b1d27ff53a913e419600cc78331e8ca4e78e62e
NOTE: Setscene tasks completed
NOTE: Running task 2760 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_package_write_deb unihash changed to 29aee325ec608bbbb0ff169359ab1594cc38fb16e4bd1b7d3460d6a8c9d19332
NOTE: recipe ell-0.73-r0: task do_create_spdx: Started
NOTE: recipe ell-0.73-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 2761 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 2762 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 2763 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2764 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2765 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_configure)
NOTE: recipe libical-3.0.19-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 2766 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to 2ef778c732efd0d08fcc8e6bfae918b85ff8fd7d9a08a89d93a27e85545ca213
NOTE: Setscene tasks completed
NOTE: Running task 2767 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 2768 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2769 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_compile)
NOTE: recipe libical-3.0.19-r0: task do_compile: Started
NOTE: recipe libical-3.0.19-r0: task do_compile: Succeeded
NOTE: Running task 2770 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_install)
NOTE: recipe libical-3.0.19-r0: task do_install: Started
NOTE: recipe libical-3.0.19-r0: task do_install: Succeeded
NOTE: Running task 2771 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_populate_sysroot)
NOTE: Running task 2772 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package)
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_package: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2773 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2774 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure)
NOTE: recipe bluez5-5.79-r0: task do_configure: Started
NOTE: recipe libical-3.0.19-r0: task do_package: Succeeded
NOTE: Running task 2775 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata)
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata unihash changed to 500a9b260a978dae78515e215310b9f11e3f532f21ee57b48804bffefd5c5b66
NOTE: Setscene tasks completed
NOTE: Running task 2776 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_create_spdx)
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2777 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2778 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2779 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile)
NOTE: recipe bluez5-5.79-r0: task do_compile: Started
NOTE: recipe bluez5-5.79-r0: task do_compile: Succeeded
NOTE: Running task 2780 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2781 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install)
NOTE: recipe bluez5-5.79-r0: task do_install: Started
NOTE: recipe bluez5-5.79-r0: task do_install: Succeeded
NOTE: Running task 2782 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2783 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_package)
NOTE: Running task 2784 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.79-r0: task do_package: Started
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2785 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2786 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_configure)
NOTE: recipe ofono-2.15-r0: task do_configure: Started
NOTE: recipe bluez5-5.79-r0: task do_package: Succeeded
NOTE: Running task 2787 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata)
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata unihash changed to eaad0cd11a496f25650789800c983f4fe104d1a1b88e2b220ce66486553f2a25
NOTE: Setscene tasks completed
NOTE: Running task 2788 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx)
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Succeeded
NOTE: Running task 2789 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.15-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2790 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_compile)
NOTE: recipe ofono-2.15-r0: task do_compile: Started
NOTE: recipe ofono-2.15-r0: task do_compile: Succeeded
NOTE: Running task 2791 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_install)
NOTE: recipe ofono-2.15-r0: task do_install: Started
NOTE: recipe ofono-2.15-r0: task do_install: Succeeded
NOTE: Running task 2792 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_package)
NOTE: Running task 2793 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_populate_sysroot)
NOTE: recipe ofono-2.15-r0: task do_package: Started
NOTE: recipe ofono-2.15-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.15-r0: task do_package: Succeeded
NOTE: Running task 2794 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_packagedata)
NOTE: recipe ofono-2.15-r0: task do_packagedata: Started
NOTE: recipe ofono-2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2795 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_create_spdx)
NOTE: Running task 2796 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_package_write_ipk)
NOTE: Running task 2797 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_package_write_deb)
NOTE: Running task 2798 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_package_write_rpm)
NOTE: Running task 2799 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_package_qa)
NOTE: recipe ofono-2.15-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.15-r0: task do_package_write_ipk: Started
NOTE: recipe ofono-2.15-r0: task do_package_write_deb: Started
NOTE: recipe ofono-2.15-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-2.15-r0: task do_package_qa: Started
NOTE: recipe ofono-2.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2800 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_create_package_spdx)
NOTE: recipe ofono-2.15-r0: task do_create_package_spdx: Started
NOTE: recipe ofono-2.15-r0: task do_package_write_ipk: Succeeded
NOTE: recipe ofono-2.15-r0: task do_package_qa: Succeeded
NOTE: recipe ofono-2.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-2.15-r0: task do_create_package_spdx: Succeeded
NOTE: recipe ofono-2.15-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2801 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_build)
NOTE: Tasks Summary: Attempted 2801 tasks of which 2634 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-src went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-dbg went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-staticdev went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-dev went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-doc went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm-locale went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsm went backwards which would break package feeds (from 1:1.2.6-r0 to 1:1.2.5-r0) [version-going-backwards]
ERROR: libsm-1_1.2.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.12-r0 to 1:1.8.11-r0) [version-going-backwards]
ERROR: libx11-1_1.8.11-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-src went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-dbg went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-staticdev went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-dev went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-doc went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans-locale went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package xtrans went backwards which would break package feeds (from 1:1.6.0-r0 to 1:1.5.2-r0) [version-going-backwards]
ERROR: xtrans-1_1.5.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1941498648100024834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.14.tar.xz file://rmnet.patch file://ofono file://CVE-2024-7539.patch file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.15.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7328760 to 7328920 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4715027 to 4715074 (+0%)
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.14 [default] to 2.15 [default]

--===============1941498648100024834==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.14-2.15.patch"

RnJvbSBjZGI1NWM2NzRkZTA5Mzk3ZTgyNjRlMGM2ZDFkMTllZjE0Y2U5NWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6MTM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
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

--===============1941498648100024834==--

