Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2089.1794939643970610265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=UHRLasNx;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso36678f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939642; x=1795544442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1slHIS3yB40DyNYfoF9h+/ZutNqeoKPfI3ofve3928=;
        b=UHRLasNxRAriGEsCh43MYGyBELSSNyRQOb4TZeBuVXe0b4QC5Jz3XDx+eoWokx9zky
         w7WB2Usoe9hjBHaxL0fp3K1/LBhRXuMEZWYrKizuOsIRGCBuI1shspyMH/gURfELzDlB
         83//K/5ZCNMuC0xxO35tId7A4JMR71YzZxG1AtZ4x0xCKxbN5mvNI4jvk4S+O8/2selP
         DHg/tAy0ig4fTijhnOQD3RRVDiW/49KOMonA20ZFwULFOK5Neap4Qs/ESk3WPhM3SSdE
         NziS6xO75tC/9axh+a9qRe0OrOl6iGLB46DC8xeVI7MLvrodIqQHFjwaYunW76aGJe0p
         djlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939642; x=1795544442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B1slHIS3yB40DyNYfoF9h+/ZutNqeoKPfI3ofve3928=;
        b=VFSliLBGPuxS2IAGxzz+fG+qBqUnVB+Fk80DJW9IrbX5kf+pojBAKMoxCVopOWoqgu
         VAJ1WUcVesGK8e32F/9HuqYXOWaCiiyrBwMNKrzENr04VLXseCKaiETkFB+fePMyhEJL
         Xl2t6yYWvyyYFBv1iRuaV/rob9qrU7usStkP3mjh3gTF20W2ts4Qze+9mN9haKvFOa6/
         TVKfGMv9miDN2LOtJch8Mey6bjsKIVRrksFu4UfqA3SicG1867VkSqDMCaf2+/0X4gq6
         zJoee7FYvLu6sSFfUjnwfEbQyNV7jp8a0koZ1/fQQeB0zvdoBAxQR4lFtpgs6a6EnKsj
         x74w==
X-Gm-Message-State: APuU4Z8RdiZU3b2bpxilQGfC4EijSl2tVTxu0iQUKp3Q+kGPw8a8dYWJ
	0ll0y08Mu212yRiUnHzwB/ZbOiPBmu74RFqISHHLpBy5+cV5Vux+NBzUm4OekqyY1Ch/8RWAksf
	U8cx4b38=
X-Gm-Gg: AZFdTZfH6By2as1EeU2V+s4X/jVcN6WPvYqcMrQ0c05g4C8p/i8vhn+In4zcyrEtiXo
	zFKn6SWBs05Z1ZSMT9reGQy/dOtX01JwQOUFeEcmQq7gpJla08O220ZY+3h5tPjTbJWBKCQ2sle
	Nl73ZxUyI1cWhbI6W3BEhQ3k2Iy+Wb7ApR7CN/h7Wuq6RDN31d7dlPj++hrVG+M+in6cc2EeQz9
	mca0YagspZAXiqQMVaa+v+EtMKX8Klty3g+uUwol9q8h/HHyrC8UHY8R/PAUX5G6lIqFjLDsqrl
	q2YL3P7DHw8GmW1sccMhcfOmYcAeedgxQpfZONelGJ9AmVMHYQtHJKSsp1iOk2R4DnaUx1kAykt
	lO5VktaWHdH8J1iQQNLwi6K3ackbIny7IrJ8ltDHtrXaHSZomX+rIfFC/1kK4yqMkO10y1iBtzi
	yHE0oHhu3BTSvSdtl5Ht9krK9ZSnfjW5vxQZeWhOy49WIPJRa0a01IjiyDgkdmXPnCO9eOmchRZ
	+eMj+JbmHyBkM6L64tN/eI7yAP3dsKKAyuI9JHwDn4SYDJf+5qzxcHdpJEdscsZCuEB2TkW9+CI
	nX8hldveBqA7o8tDh+w7p0oxwma4T0p0iYbX/Cl1wBKEV2rPdCkRkgprJXVT8+1E1BAkyXUSop8
	2l4rF9IGPPFMZMwAOZmdUeg425gr/Xz5QOa8ny3z57vhD01hcbg==
X-Received: by 2002:a05:6000:98c:b0:497:9e2a:b27 with SMTP id ffacd0b85a97d-4a63d1d9bedmr516319f8f.38.1794939642049;
        Tue, 17 Nov 2026 10:20:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:41 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/17] bluez5: fix CVE-2026-19774
Date: Tue, 17 Nov 2026 19:20:13 +0100
Message-ID: <b03882286418bb2e8c913cab67acbd55e63d2de4.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250480
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream BlueZ codec capability storage fix [1]
and its required cache-loading correction [3] to version 5.86. The
public security advisory is referenced in [2]. Both upstream code
changes are preserved without adaptation.

Bound serialization and cache parsing while retaining normal endpoint
restoration and checking the decoded capability buffer length.

[1] https://github.com/bluez/bluez/commit/912f5efb0dd9bb08e408d33371a57182c5678aef
[2] https://www.zerodayinitiative.com/advisories/ZDI-26-589/
[3] https://github.com/bluez/bluez/commit/b7d71e5067856b0daf2f1f73b3fc95483236610e

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 .../bluez5/bluez5/CVE-2026-19774_p1.patch     | 63 +++++++++++++++++++
 .../bluez5/bluez5/CVE-2026-19774_p2.patch     | 62 ++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 75d76cf96de..0783a5c28dc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -81,6 +81,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
            file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
+           file://CVE-2026-19774_p1.patch \
+           file://CVE-2026-19774_p2.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
new file mode 100644
index 00000000000..5a7d42b522f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
@@ -0,0 +1,63 @@
+From d4b922a688f5cd50f31afd663835ff05f294a85b Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Mon, 15 Jun 2026 09:44:11 -0400
+Subject: [PATCH] a2dp: Fix handling of codec capability storage
+
+Codec capability is one byte long (max 255) the storage format is
+02hhx which means each byte ends up as 2 characters so the buffer
+needs to be doubled in order to handle capabilities of that size.
+
+CVE: CVE-2026-19774
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/912f5efb0dd9bb08e408d33371a57182c5678aef]
+
+Reported-by:  p0her (_@p0her_) in TeamH4C working with TrendAI Zero Day Initiative
+Reported-by: Michael Bommarito <michael.bommarito@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ profiles/audio/a2dp.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
+index 7a37003a2..aec54728e 100644
+--- a/profiles/audio/a2dp.c
++++ b/profiles/audio/a2dp.c
+@@ -971,7 +971,7 @@ static void store_remote_sep(void *data, void *user_data)
+ {
+ 	struct a2dp_remote_sep *sep = data;
+ 	GKeyFile *key_file = user_data;
+-	char seid[4], value[256];
++	char seid[4], value[9 + 512];
+ 	struct avdtp_service_capability *service = avdtp_get_codec(sep->sep);
+ 	struct avdtp_media_codec_capability *codec;
+ 	unsigned int i;
+@@ -2373,7 +2373,7 @@ static void load_remote_sep(struct a2dp_channel *chan, GKeyFile *key_file,
+ 		uint8_t codec;
+ 		uint8_t delay_reporting;
+ 		GSList *l = NULL;
+-		char caps[256];
++		char caps[513];
+ 		uint8_t data[128];
+ 		int i, size;
+ 
+@@ -2386,10 +2386,10 @@ static void load_remote_sep(struct a2dp_channel *chan, GKeyFile *key_file,
+ 			continue;
+ 
+ 		/* Try loading with delay_reporting first */
+-		if (sscanf(value, "%02hhx:%02hhx:%02hhx:%s", &type, &codec,
++		if (sscanf(value, "%02hhx:%02hhx:%02hhx:%512s", &type, &codec,
+ 					&delay_reporting, caps) != 4) {
+ 			/* Try old format */
+-			if (sscanf(value, "%02hhx:%02hhx:%s", &type, &codec,
++			if (sscanf(value, "%02hhx:%02hhx:%512s", &type, &codec,
+ 								caps) != 3) {
+ 				warn("Unable to load Endpoint: seid %u", rseid);
+ 				g_free(value);
+@@ -2398,7 +2398,7 @@ static void load_remote_sep(struct a2dp_channel *chan, GKeyFile *key_file,
+ 			delay_reporting = false;
+ 		}
+ 
+-		for (i = 0, size = strlen(caps); i < size; i += 2) {
++		for (i = 0, size = strlen(caps); i < size && i >= 2; i += 2) {
+ 			uint8_t *tmp = data + i / 2;
+ 
+ 			if (sscanf(caps + i, "%02hhx", tmp) != 1) {
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch
new file mode 100644
index 00000000000..88dcd66c3ee
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch
@@ -0,0 +1,62 @@
+From 1bbcccb35c946e079074e64c217c81089442a568 Mon Sep 17 00:00:00 2001
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Date: Fri, 10 Jul 2026 12:28:17 +0500
+Subject: [PATCH] a2dp: Fix loading of remote SEP from cache
+
+Commit 912f5efb0dd9 ("a2dp: Fix handling of codec capability storage")
+added an 'i >= 2' condition to the loop that parses the stored codec
+capabilities. Since i starts at 0 the loop body never runs, i stays 0,
+and the subsequent 'if (i != size)' check discards every endpoint found
+in the cache:
+
+  load_remote_sep() Unable to load LastUsed: rseid 6 not found
+
+With no remote SEP loaded, avdtp_discover() can no longer take the
+cached path and issues AVDTP Discover/Get All Capabilities on every
+reconnect, and a2dp_setup_remote_path() returns NULL so the transport
+ends up at /org/bluez/hciX/dev_YY/fd0 instead of .../sepN/fd0.
+
+The condition was presumably meant to bound the writes into data[128],
+which the original commit did not actually fix: caps is read with
+'%512s' so size / 2 can be up to 256. Validate size up front instead.
+
+CVE: CVE-2026-19774
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b7d71e5067856b0daf2f1f73b3fc95483236610e]
+
+Fixes: https://github.com/bluez/bluez/issues/2285
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ profiles/audio/a2dp.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
+index aec54728e..93cf11fe1 100644
+--- a/profiles/audio/a2dp.c
++++ b/profiles/audio/a2dp.c
+@@ -2398,7 +2398,16 @@ static void load_remote_sep(struct a2dp_channel *chan, GKeyFile *key_file,
+ 			delay_reporting = false;
+ 		}
+ 
+-		for (i = 0, size = strlen(caps); i < size && i >= 2; i += 2) {
++		size = strlen(caps);
++
++		g_free(value);
++
++		if (size % 2 || size / 2 > (int) sizeof(data)) {
++			warn("Unable to load Endpoint: seid %u", rseid);
++			continue;
++		}
++
++		for (i = 0; i < size; i += 2) {
+ 			uint8_t *tmp = data + i / 2;
+ 
+ 			if (sscanf(caps + i, "%02hhx", tmp) != 1) {
+@@ -2407,8 +2416,6 @@ static void load_remote_sep(struct a2dp_channel *chan, GKeyFile *key_file,
+ 			}
+ 		}
+ 
+-		g_free(value);
+-
+ 		if (i != size)
+ 			continue;
+ 
