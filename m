Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA64C28B20
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.7051.1740828321497248595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OKEVnfll;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3vR6Ki1n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019551742351-eaeae9eb-2103-4f66-96cf-f048cb60ca46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OiE5Mi62mTdE0yZWN+k5sZ835VRGY+nQ0SADezVnRYk=;
	b=OKEVnfllSR28ZDxfWTzGQyDQGd1d3e9jX8h/vh1EUIrZsrduVsJh/XB6js/MS7jz
	uJogAn9HuT2taZQNU1ToVKRNYUgeZVL+tnCJrMN6UB8gHsbumf+Nou/Fcu3z0VnoPf5
	cWMQdjlryBQymXb51v0aczSNhimX5dIuls/HLXCE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OiE5Mi62mTdE0yZWN+k5sZ835VRGY+nQ0SADezVnRYk=;
	b=3vR6Ki1ngwlEgA5eZvUg3axwiEJfbs9qvuvizGh4TepukX4SYWzvhTBglIvPGCy0
	ivzAX6n5VS7SCbExGUO3a+OzZvUEzh3k76QG3oGVcOrt2yFlUtfZSbZQDkcu9GnS9/7
	byOKBqGG+8qVYE7ViPGk0Lm0NkVlRcdb4cFrp9iU=
Content-Type: multipart/mixed; boundary="===============1262506668248226722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.15 SUCCEEDED
Message-ID: <0101019551742351-eaeae9eb-2103-4f66-96cf-f048cb60ca46-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212111

--===============1262506668248226722==
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
From 86fa471f96afe4099db8d532598abd91931688ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 06:50:53 +0000
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


--===============1262506668248226722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.14.tar.xz file://rmnet.patch file://ofono file://CVE-2024-7539.patch file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.15.tar.xz file://ofono"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7328760 to 7328920 (+0%)
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4715027 to 4715074 (+0%)
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.14" to "2.15"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.14 [default] to 2.15 [default]

--===============1262506668248226722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1882 targets, 50 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:cf91860f678433c5f52c545951c54719c3864aed"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 768 Local 701 Mirrors 0 Missed 67 Current 265 (91% match, 93% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 266 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 270 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 312 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 315 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_populate_lic_setscene)
NOTE: Running setscene task 320 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 321 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 330 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 338 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 346 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 367 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe ofono-2.15-r0: task do_populate_lic_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 394 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 397 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 415 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 424 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 426 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 449 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 452 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 453 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 456 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 461 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 469 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 470 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 482 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe ell-0.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 502 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 504 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 529 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 571 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 578 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 609 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 621 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 623 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 627 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 652 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 658 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 662 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 685 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 690 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 696 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 701 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 706 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 708 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 731 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 738 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 744 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 748 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 752 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 769 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 777 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 783 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 785 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 806 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 852 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 861 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 868 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 886 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 899 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 903 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 906 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 913 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 914 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 918 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 924 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 930 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 931 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 935 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 943 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 968 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 970 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 979 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 980 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 988 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 991 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 996 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 967 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1047 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: Running task 1114 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: Running task 1251 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1315 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_fetch)
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1335 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running task 1370 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_unpack)
NOTE: Running task 1392 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: Running task 1428 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.0-r0: task do_write_config: Started
NOTE: recipe libical-3.0.19-r0: task do_fetch: Started
NOTE: Running task 1495 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_fetch)
NOTE: Running task 1498 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_fetch)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1507 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_write_config)
NOTE: Running setscene task 1002 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1522 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: Running task 1532 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_recipe_qa)
NOTE: Running task 1533 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Started
NOTE: Running setscene task 1005 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1006 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Started
NOTE: Running task 1535 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.73-r0: task do_fetch: Started
NOTE: Running task 1536 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.73-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Started
NOTE: Running task 1537 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_unpack)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_unpack: Started
NOTE: Running task 1538 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_unpack)
NOTE: recipe ofono-2.15-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Succeeded
NOTE: Running task 1548 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_fetch)
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Started
NOTE: recipe ell-0.73-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1549 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1559 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_write_config)
NOTE: recipe libical-3.0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_patch)
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1591 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_write_config)
NOTE: Running task 1592 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_patch)
NOTE: Running task 1594 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_patch)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_fetch: Started
NOTE: Running task 1611 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1012 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_write_config: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1612 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_unpack)
NOTE: recipe libical-3.0.19-r0: task do_patch: Started
NOTE: Running task 1613 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_fetch)
NOTE: recipe ell-0.73-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_write_config: Started
NOTE: Running task 1614 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_patch)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_patch: Started
NOTE: recipe dbus-1.16.0-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_write_config: Succeeded
NOTE: Running task 1615 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_unpack: Started
NOTE: recipe ell-0.73-r0: task do_patch: Started
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: Running task 1706 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.27.0-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe ell-0.73-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_patch: Succeeded
NOTE: Running task 1752 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_generate_toolchain_file)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1753 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.15-r0: task do_unpack: Started
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: Running task 1754 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1755 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Started
NOTE: Running task 1758 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_patch)
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_patch: Succeeded
NOTE: Running task 1765 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1025 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_patch: Succeeded
NOTE: Running task 1769 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 1789 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_patch: Started
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1033 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2025 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2478 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_collect_spdx_deps)
NOTE: Running task 2642 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2671 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2672 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Succeeded
NOTE: Running task 2673 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2674 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Succeeded
NOTE: Running task 2675 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2676 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Succeeded
NOTE: Running task 2677 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2678 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot)
NOTE: Running task 2679 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2680 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2681 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2682 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2683 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2684 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2686 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe cairo-1.18.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe dbus-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2687 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_configure)
NOTE: recipe dbus-1.16.0-r0: task do_configure: Started
NOTE: recipe cairo-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 2688 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_compile)
NOTE: recipe cairo-1.18.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2690 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_compile)
NOTE: recipe dbus-1.16.0-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2692 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2694 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_install)
NOTE: recipe dbus-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 2695 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_install)
NOTE: recipe cairo-1.18.2-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 2696 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe cairo-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 2697 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2698 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2699 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2700 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2701 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2702 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_configure: Started
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2704 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_configure)
NOTE: recipe ell-0.73-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2705 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure)
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_configure: Succeeded
NOTE: Running task 2706 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2707 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_compile)
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_compile: Succeeded
NOTE: Running task 2708 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_install)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_install: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Started
NOTE: Running task 2710 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_install: Succeeded
NOTE: Running task 2711 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.27.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2712 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_populate_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.27.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2713 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_configure: Started
NOTE: recipe ell-0.73-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_compile)
NOTE: recipe ell-0.73-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_configure: Succeeded
NOTE: Running task 2716 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_compile: Succeeded
NOTE: Running task 2717 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_install)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_install: Started
NOTE: recipe ell-0.73-r0: task do_compile: Succeeded
NOTE: Running task 2718 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_install)
NOTE: recipe ell-0.73-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.50.0-r0: task do_install: Succeeded
NOTE: Running task 2719 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb:do_populate_sysroot)
NOTE: recipe ell-0.73-r0: task do_install: Succeeded
NOTE: Running task 2720 of 2801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Failed
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2720 tasks of which 2620 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301064943.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301064943.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.4/temp/log.do_packagedata.1418741
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.82.5-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.4/temp/log.do_packagedata.1418741
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata) failed with exit code '1'

--===============1262506668248226722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.14-2.15.patch"

RnJvbSA4NmZhNDcxZjk2YWZlNDA5OWRiOGQ1MzI1OThhYmQ5MTkzMTY4OGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNjo1MDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuMTQgLT4gMi4xNQoKLS0tCiAuLi4vb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQt
NzUzOS5wYXRjaCAgICAgICAgICAgfCA4OCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4wMjQtNzU0
MF9DVkUtMjAyNC03NTQxX0NWRS0yMDI0LTc1NDIucGF0Y2ggfCA1MiAtLS0tLS0tLS0tLQogLi4u
L29mb25vL29mb25vL3JtbmV0LnBhdGNoICAgICAgICAgICAgICAgICAgIHwgNDUgLS0tLS0tLS0t
LQogLi4uL29mb25vL3tvZm9ub18yLjE0LmJiID0+IG9mb25vXzIuMTUuYmJ9ICAgIHwgMTIgKy0t
CiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTkzIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZF
LTIwMjQtNzUzOS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQtNzU0MF9DVkUtMjAyNC03NTQxX0NWRS0yMDI0LTc1
NDIucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vL3JtbmV0LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
Zm9uby97b2Zvbm9fMi4xNC5iYiA9PiBvZm9ub18yLjE1LmJifSAoODQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQtNzUzOS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQtNzUzOS5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTQxNTk2OTU5Yi4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0LTc1
MzkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw4OCArMCwwIEBACi1Gcm9tIDM4OWUyMzQ0Zjg2
MzE5MjY1ZmI3MmFlNTkwYjQ3MDcxNmUwMzhmZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBTaWNlbG8gQS4gTWhsb25nbyA8YWJzaWNzekBnbWFpbC5jb20+Ci1EYXRlOiBUdWUsIDE3
IERlYyAyMDI0IDExOjMxOjI5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHVzc2Q6IGVuc3VyZSB1
c3NkIGNvbnRlbnQgZml0cyBpbiBidWZmZXJzCi0KLUZpeGVzOiBDVkUtMjAyNC03NTM5Ci0KLUNW
RTogQ1ZFLTIwMjQtNzUzOQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvb2Zvbm8vb2Zvbm8uZ2l0L2NvbW1pdC8/aWQ9Mzg5
ZTIzNDRmODYzMTkyNjVmYjcyYWU1OTBiNDcwNzE2ZTAzOGZkY10KLQotU2lnbmVkLW9mZi1ieTog
WW9naXRhIFVyYWRlIDx5b2dpdGEudXJhZGVAd2luZHJpdmVyLmNvbT4KLS0tLQotIGRyaXZlcnMv
YXRtb2RlbS91c3NkLmMgICAgICB8IDUgKysrKy0KLSBkcml2ZXJzL2h1YXdlaW1vZGVtL3Vzc2Qu
YyAgfCA1ICsrKystCi0gZHJpdmVycy9zcGVlZHVwbW9kZW0vdXNzZC5jIHwgNSArKysrLQotIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYXRtb2RlbS91c3NkLmMgYi9kcml2ZXJzL2F0bW9kZW0vdXNzZC5jCi1p
bmRleCAzMmE5ZmU5Li45OWRhNTU5IDEwMDY0NAotLS0tIGEvZHJpdmVycy9hdG1vZGVtL3Vzc2Qu
YwotKysrIGIvZHJpdmVycy9hdG1vZGVtL3Vzc2QuYwotQEAgLTkzLDcgKzkzLDcgQEAgc3RhdGlj
IHZvaWQgY3VzZF9wYXJzZShHQXRSZXN1bHQgKnJlc3VsdCwgc3RydWN0IG9mb25vX3Vzc2QgKnVz
c2QpCi0JY29uc3QgY2hhciAqY29udGVudDsKLQlpbnQgZGNzOwotCWVudW0gc21zX2NoYXJzZXQg
Y2hhcnNldDsKLS0JdW5zaWduZWQgY2hhciBtc2dbMTYwXTsKLSsJdW5zaWduZWQgY2hhciBtc2db
MTYwXSA9IHswfTsKLQljb25zdCB1bnNpZ25lZCBjaGFyICptc2dfcHRyID0gTlVMTDsKLQlsb25n
IG1zZ19sZW47Ci0KLUBAIC0xMTMsNiArMTEzLDkgQEAgc3RhdGljIHZvaWQgY3VzZF9wYXJzZShH
QXRSZXN1bHQgKnJlc3VsdCwgc3RydWN0IG9mb25vX3Vzc2QgKnVzc2QpCi0JaWYgKCFnX2F0X3Jl
c3VsdF9pdGVyX25leHRfbnVtYmVyKCZpdGVyLCAmZGNzKSkKLQkJZGNzID0gMDsKLQotKwlpZiAo
c3RybGVuKGNvbnRlbnQpID4gc2l6ZW9mKG1zZykgKiAyKQotKwkJZ290byBvdXQ7Ci0rCi0JaWYg
KCFjYnNfZGNzX2RlY29kZShkY3MsIE5VTEwsIE5VTEwsICZjaGFyc2V0LCBOVUxMLCBOVUxMLCBO
VUxMKSkgewotCQlvZm9ub19lcnJvcigiVW5zdXBwb3J0ZWQgVVNTRCBkYXRhIGNvZGluZyBzY2hl
bWUgKCUwMngpIiwgZGNzKTsKLQkJc3RhdHVzID0gNDsgLyogTm90IHN1cHBvcnRlZCAqLwotZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHVhd2VpbW9kZW0vdXNzZC5jIGIvZHJpdmVycy9odWF3ZWltb2Rl
bS91c3NkLmMKLWluZGV4IDVlMWM5MDcuLjNkMTY1YzggMTAwNjQ0Ci0tLS0gYS9kcml2ZXJzL2h1
YXdlaW1vZGVtL3Vzc2QuYwotKysrIGIvZHJpdmVycy9odWF3ZWltb2RlbS91c3NkLmMKLUBAIC0z
OCw3ICszOCw3IEBAIHN0YXRpYyB2b2lkIGN1c2RfcGFyc2UoR0F0UmVzdWx0ICpyZXN1bHQsIHN0
cnVjdCBvZm9ub191c3NkICp1c3NkKQotCWludCBzdGF0dXM7Ci0JaW50IGRjcyA9IDA7Ci0JY29u
c3QgY2hhciAqY29udGVudDsKLS0JdW5zaWduZWQgY2hhciBtc2dbMTYwXTsKLSsJdW5zaWduZWQg
Y2hhciBtc2dbMTYwXSA9IHswfTsKLQljb25zdCB1bnNpZ25lZCBjaGFyICptc2dfcHRyID0gTlVM
TDsKLQlsb25nIG1zZ19sZW47Ci0KLUBAIC01NSw2ICs1NSw5IEBAIHN0YXRpYyB2b2lkIGN1c2Rf
cGFyc2UoR0F0UmVzdWx0ICpyZXN1bHQsIHN0cnVjdCBvZm9ub191c3NkICp1c3NkKQotCi0JZ19h
dF9yZXN1bHRfaXRlcl9uZXh0X251bWJlcigmaXRlciwgJmRjcyk7Ci0KLSsJaWYgKHN0cmxlbihj
b250ZW50KSA+IHNpemVvZihtc2cpICogMikKLSsJCWdvdG8gb3V0OwotKwotCW1zZ19wdHIgPSBk
ZWNvZGVfaGV4X293bl9idWYoY29udGVudCwgLTEsICZtc2dfbGVuLCAwLCBtc2cpOwotCi0gb3V0
OgotZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BlZWR1cG1vZGVtL3Vzc2QuYyBiL2RyaXZlcnMvc3Bl
ZWR1cG1vZGVtL3Vzc2QuYwotaW5kZXggYWFmYTRiYy4uYTVlZmRlMCAxMDA2NDQKLS0tLSBhL2Ry
aXZlcnMvc3BlZWR1cG1vZGVtL3Vzc2QuYwotKysrIGIvZHJpdmVycy9zcGVlZHVwbW9kZW0vdXNz
ZC5jCi1AQCAtMzcsNyArMzcsNyBAQCBzdGF0aWMgdm9pZCBjdXNkX3BhcnNlKEdBdFJlc3VsdCAq
cmVzdWx0LCBzdHJ1Y3Qgb2Zvbm9fdXNzZCAqdXNzZCkKLQlpbnQgc3RhdHVzOwotCWludCBkY3Mg
PSAwOwotCWNvbnN0IGNoYXIgKmNvbnRlbnQ7Ci0tCXVuc2lnbmVkIGNoYXIgbXNnWzE2MF07Ci0r
CXVuc2lnbmVkIGNoYXIgbXNnWzE2MF0gPSB7MH07Ci0JY29uc3QgdW5zaWduZWQgY2hhciAqbXNn
X3B0ciA9IE5VTEw7Ci0JbG9uZyBtc2dfbGVuOwotCi1AQCAtNTQsNiArNTQsOSBAQCBzdGF0aWMg
dm9pZCBjdXNkX3BhcnNlKEdBdFJlc3VsdCAqcmVzdWx0LCBzdHJ1Y3Qgb2Zvbm9fdXNzZCAqdXNz
ZCkKLQotCWdfYXRfcmVzdWx0X2l0ZXJfbmV4dF9udW1iZXIoJml0ZXIsICZkY3MpOwotCi0rCWlm
IChzdHJsZW4oY29udGVudCkgPiBzaXplb2YobXNnKSAqIDIpCi0rCQlnb3RvIG91dDsKLSsKLQlt
c2dfcHRyID0gZGVjb2RlX2hleF9vd25fYnVmKGNvbnRlbnQsIC0xLCAmbXNnX2xlbiwgMCwgbXNn
KTsKLQotIG91dDoKLS0tCi0yLjQwLjAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQtNzU0MF9DVkUtMjAyNC03NTQxX0NWRS0yMDI0LTc1
NDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL0NWRS0yMDI0
LTc1NDBfQ1ZFLTIwMjQtNzU0MV9DVkUtMjAyNC03NTQyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCBmZDk3ZDRiNTFiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vQ1ZFLTIwMjQtNzU0MF9DVkUtMjAyNC03NTQxX0NWRS0y
MDI0LTc1NDIucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1MiArMCwwIEBACi1Gcm9tIDI5ZmY2
MzM0YjQ5MjUwNGFjZTEwMWJlNzQ4YjI1NmU2OTUzZDJjMmYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiAiU2ljZWxvIEEuIE1obG9uZ28iIDxhYnNpY3N6QGdtYWlsLmNvbT4KLURhdGU6
IFR1ZSwgMTcgRGVjIDIwMjQgMTE6MzE6MjggKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gYXRtb2Rl
bTogc21zOiBlbnN1cmUgYnVmZmVyIGlzIGluaXRpYWxpemVkIGJlZm9yZSB1c2UKLQotRml4ZXM6
IENWRS0yMDI0LTc1NDAKLUZpeGVzOiBDVkUtMjAyNC03NTQxCi1GaXhlczogQ1ZFLTIwMjQtNzU0
MgotCi1DVkU6IENWRS0yMDI0LTc1NDAKLUNWRTogQ1ZFLTIwMjQtNzU0MQotQ1ZFOiBDVkUtMjAy
NC03NTQyCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbmV0d29yay9vZm9uby9vZm9uby5naXQvY29tbWl0Lz9pZD0yOWZmNjMzNGI0OTI1
MDRhY2UxMDFiZTc0OGIyNTZlNjk1M2QyYzJmXQotU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28g
PHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPgotLS0tCi0gZHJpdmVycy9hdG1vZGVtL3Ntcy5jIHwg
NiArKystLS0KLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQotCi1kaWZmIC0tZ2l0IGEvZHJpdmVycy9hdG1vZGVtL3Ntcy5jIGIvZHJpdmVycy9hdG1vZGVt
L3Ntcy5jCi1pbmRleCBkOTk0ODU2Yi4uMDY2OGM2MzEgMTAwNjQ0Ci0tLS0gYS9kcml2ZXJzL2F0
bW9kZW0vc21zLmMKLSsrKyBiL2RyaXZlcnMvYXRtb2RlbS9zbXMuYwotQEAgLTM5OSw3ICszOTks
NyBAQCBzdGF0aWMgdm9pZCBhdF9jbXRfbm90aWZ5KEdBdFJlc3VsdCAqcmVzdWx0LCBncG9pbnRl
ciB1c2VyX2RhdGEpCi0gCXN0cnVjdCBzbXNfZGF0YSAqZGF0YSA9IG9mb25vX3Ntc19nZXRfZGF0
YShzbXMpOwotIAlHQXRSZXN1bHRJdGVyIGl0ZXI7Ci0gCWNvbnN0IGNoYXIgKmhleHBkdTsKLS0J
dW5zaWduZWQgY2hhciBwZHVbMTc2XTsKLSsJdW5zaWduZWQgY2hhciBwZHVbMTc2XSA9IHswfTsK
LSAJbG9uZyBwZHVfbGVuOwotIAlpbnQgdHBkdV9sZW47Ci0gCi1AQCAtNDY2LDcgKzQ2Niw3IEBA
IHN0YXRpYyB2b2lkIGF0X2NtZ3Jfbm90aWZ5KEdBdFJlc3VsdCAqcmVzdWx0LCBncG9pbnRlciB1
c2VyX2RhdGEpCi0gCXN0cnVjdCBzbXNfZGF0YSAqZGF0YSA9IG9mb25vX3Ntc19nZXRfZGF0YShz
bXMpOwotIAlHQXRSZXN1bHRJdGVyIGl0ZXI7Ci0gCWNvbnN0IGNoYXIgKmhleHBkdTsKLS0JdW5z
aWduZWQgY2hhciBwZHVbMTc2XTsKLSsJdW5zaWduZWQgY2hhciBwZHVbMTc2XSA9IHswfTsKLSAJ
bG9uZyBwZHVfbGVuOwotIAlpbnQgdHBkdV9sZW47Ci0gCi1AQCAtNjQ4LDcgKzY0OCw3IEBAIHN0
YXRpYyB2b2lkIGF0X2NtZ2xfbm90aWZ5KEdBdFJlc3VsdCAqcmVzdWx0LCBncG9pbnRlciB1c2Vy
X2RhdGEpCi0gCXN0cnVjdCBzbXNfZGF0YSAqZGF0YSA9IG9mb25vX3Ntc19nZXRfZGF0YShzbXMp
OwotIAlHQXRSZXN1bHRJdGVyIGl0ZXI7Ci0gCWNvbnN0IGNoYXIgKmhleHBkdTsKLS0JdW5zaWdu
ZWQgY2hhciBwZHVbMTc2XTsKLSsJdW5zaWduZWQgY2hhciBwZHVbMTc2XSA9IHswfTsKLSAJbG9u
ZyBwZHVfbGVuOwotIAlpbnQgdHBkdV9sZW47Ci0gCWludCBpbmRleDsKLS0tIAotMi4zMC4yCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vcm1uZXQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vL3JtbmV0LnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxMWRmZDVkYjE4Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vcm1uZXQucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw0NSArMCwwIEBACi1Gcm9tIGdpdEB6IFRodSBKYW4gIDEgMDA6MDA6
MDAgMTk3MAotU3ViamVjdDogW1BBVENIXSBybW5ldDogSGFuZGxlIHRvb2xjaGFpbnMgd2l0aCBv
bGQga2VybmVsIGhlYWRlcnMKLUZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgotRGF0ZTogVGh1LCAxOSBEZWMgMjAyNCAxMzo0NzoxNSArMDAw
MAotTWVzc2FnZS1JZDogPGUyYjZhOTRkZDlhMzc4OWUzMWRhZmFkZmM3MGM1M2I1NjVkMWRiMDQu
Y2FtZWxAbGludXhmb3VuZGF0aW9uLm9yZz4KLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9InV0Zi04IgotQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogN2JpdAotCi1UaGUgUk1ORVRfRkxBR1NfKkdSRVNTX01BUF9DS1NVTVY1IGRlZmluZXMgd2Vy
ZSBhZGRlZCB0byB0aGUga2VybmVsIGluCi01LjE0WzFdIGFuZCBzb21lIHRvb2xjaGFpbnMgdXNl
IG9sZGVyIGhlYWRlcnMsIHNvIGFkZCBmYWxsYmFjayBkZWZpbmVzCi1pbiBjYXNlIHRoZXkgYXJl
IG5lZWRlZC4KLQotWzFdIGxpbnV4IGI2ZTVkMjdlMzJlZjYwODlkMzE2Y2U3ZTFlY2FmNTk1NTg0
ZDRiODQKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29mb25vL2UyYjZhOTRkZDlhMzc4OWUzMWRhZmFkZmM3MGM1M2I1NjVkMWRiMDQuY2FtZWxA
bGludXhmb3VuZGF0aW9uLm9yZy9ULyN1XQotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBzcmMvcm1uZXQuYyB8IDEwICsrKysrKysrKysKLSAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL3JtbmV0
LmMgYi9zcmMvcm1uZXQuYwotaW5kZXggNDJiMDMyNDkuLjlhN2Y1MmZiIDEwMDY0NAotLS0tIGEv
c3JjL3JtbmV0LmMKLSsrKyBiL3NyYy9ybW5ldC5jCi1AQCAtMjcsNiArMjcsMTYgQEAKLSAjZGVm
aW5lIE1BWF9NVVhfSURTIDI1NFUKLSAjZGVmaW5lIERFRkFVTFRfTVRVIDE0MDBVCi0gCi0rLyoK
LSsgKiBUaGVzZSB3ZXJlIGFkZGVkIGluIDUuMTQgc28gZGVmaW5lIHRoZW0gaGVyZSBpZiB0aGUg
dG9vbGNoYWluJ3Mga2VybmVsIGhlYWRlcnMgYXJlIG9sZC4KLSsgKi8KLSsjaWZuZGVmIFJNTkVU
X0ZMQUdTX0lOR1JFU1NfTUFQX0NLU1VNVjUKLSsjZGVmaW5lIFJNTkVUX0ZMQUdTX0lOR1JFU1Nf
TUFQX0NLU1VNVjUgKDFVIDw8IDQpCi0rI2VuZGlmCi0rI2lmbmRlZiBSTU5FVF9GTEFHU19FR1JF
U1NfTUFQX0NLU1VNVjUKLSsjZGVmaW5lIFJNTkVUX0ZMQUdTX0VHUkVTU19NQVBfQ0tTVU1WNSAo
MVUgPDwgNSkKLSsjZW5kaWYKLSsKLSBzdHJ1Y3Qgcm1uZXRfcmVxdWVzdCB7Ci0gCXVpbnQzMl90
IHBhcmVudF9pZmluZGV4OwotIAlybW5ldF9uZXdfaW50ZXJmYWNlc19mdW5jX3QgbmV3X2NiOwot
LS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9u
by9vZm9ub18yLjE0LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18y
LjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vZm9uby9vZm9ub18yLjE1LmJiCmluZGV4IDlhOTFhZmFhN2IuLjQwZWViM2EwODYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTUuYmIKQEAg
LTcsMTQgKzcsMTAgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZWI3
MjNiNjE1MzlmZWVmMDEzZGU0NzZlNjhiNWM1MGEgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vc3JjL29mb25vLmg7YmVnaW5saW5lPTE7ZW5kbGluZT02O21kNT0xM2U0MjEzMzkzNWNlZWNm
YzliY2I1NDdmMjU2ZTI3NyIKIERFUEVORFMgPSAiZGJ1cyBnbGliLTIuMCB1ZGV2IG1vYmlsZS1i
cm9hZGJhbmQtcHJvdmlkZXItaW5mbyBlbGwiCiAKLVNSQ19VUkkgPSAiXAotICAgICR7S0VSTkVM
T1JHX01JUlJPUn0vbGludXgvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IFwKLSAgICBmaWxl
Oi8vcm1uZXQucGF0Y2ggXAotICAgIGZpbGU6Ly9vZm9ubyBcCi0gICAgZmlsZTovL0NWRS0yMDI0
LTc1MzkucGF0Y2ggXAotICAgIGZpbGU6Ly9DVkUtMjAyNC03NTQwX0NWRS0yMDI0LTc1NDFfQ1ZF
LTIwMjQtNzU0Mi5wYXRjaCBcCi0iCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTgzY2JmZDVlMWUx
YTQxMGJhN2FkMmRiN2Y1MGZhZGM5MWU1MGIyOWYxZWRlNDBjZGM3M2Y5NDFkYTdiYTk1ZiIKK1NS
Q19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3JrLyR7QlBOfS8ke0JQfS50
YXIueHogXAorICAgICAgICAgICBmaWxlOi8vb2Zvbm8gXAorICAgICAgICAgICAiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMWFmOTNhYjcyYTcwNTAyNDUyZmUzZDAyOTdhNmVhZWExMzc1MGNhY2Fl
MWZmZjNiNjQzZGQyMjQ1YTY0MDhjYSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVw
ZGF0ZS1yYy5kIHN5c3RlbWQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEKIAotLSAKMi40NC4x
Cgo=

--===============1262506668248226722==--

