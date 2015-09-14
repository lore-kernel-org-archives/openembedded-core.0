Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0B576FD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:31 +0000 (UTC)
Received: by qgez77 with SMTP id z77so120009524qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7iH3kqfvdkDM7TTGbwNHqQCDF62xj5MSZO8w3Z1Xjo8=;
	b=AakiijN4TsZ7TDlZf/9RoQEYxsP7zzN895loDUfVluNgSjEYSTR21y+TH0TaUfTq8V
	MekwuD1lkcVa1TBblhzJKRbzBvo8AcADOjZz5HyFtGJMusPJUH7aTq2xie80os9g8peC
	Jn0IS4K4G4/tpt6vB59QSgtsjKl4jf4XjV2Wb2htVJ1hK807LxyB1B5VqYaqBK1wJ0f5
	Tf084+yUdFJS6VO4XBE91NycEPSVdd6U7zaV0n2X6N/VQk6DF7knQPWTr7BHuyl2HvJe
	oBA/9q+ivJ3wosKz97OqLkPVzLouqYrMjY9r6gp6OSv7y+iaoMOHkrF+A26kdzTa6btG
	xzmg==
X-Received: by 10.140.101.110 with SMTP id t101mr23155591qge.20.1442248292022; 
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:17 +0000
Message-Id: <2e8b33d5ff6928987dde0b059cd7403fc32a2e0b.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 02/12] hostap-utils: Use C99 stddefs in defining local typedefs
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:34 -0000

The code is creating more abstract types which is nice however it should
be using standard defines from stdint.h and not random defines to base
its own type system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch | 36 ++++++++++++++++++++++
 meta/recipes-bsp/hostap/hostap-utils.inc           |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch

diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
new file mode 100644
index 0000000..b44dca3
--- /dev/null
+++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
@@ -0,0 +1,36 @@
+From 742fb110d9841a04b3ced256b0bf80ff304dcaff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 05:45:08 +0000
+Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99 types
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ wireless_copy.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/wireless_copy.h b/wireless_copy.h
+index 8208258..1171a35 100644
+--- a/wireless_copy.h
++++ b/wireless_copy.h
+@@ -86,11 +86,11 @@
+ #else
+ #include <sys/types.h>
+ #include <net/if.h>
+-typedef __uint32_t __u32;
+-typedef __int32_t __s32;
+-typedef __uint16_t __u16;
+-typedef __int16_t __s16;
+-typedef __uint8_t __u8;
++typedef u_int32_t __u32;
++typedef int32_t __s32;
++typedef u_int16_t __u16;
++typedef int16_t __s16;
++typedef u_int8_t __u8;
+ #ifndef __user
+ #define __user
+ #endif /* __user */
+-- 
+2.5.1
+
diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/hostap/hostap-utils.inc
index 89d977a..140321d 100644
--- a/meta/recipes-bsp/hostap/hostap-utils.inc
+++ b/meta/recipes-bsp/hostap/hostap-utils.inc
@@ -10,7 +10,9 @@ SECTION = "kernel/userland"
 PR = "r4"
 
 SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
-	   file://hostap-fw-load.patch"
+           file://hostap-fw-load.patch \
+           file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch \
+"
 S = "${WORKDIR}/hostap-utils-${PV}"
 
 BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug \
-- 
2.5.2


