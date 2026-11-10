Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12904.1794282757680919991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Th/ilYO8;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso275595a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282757; x=1794887557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVnAfL3uIlxiPJLYGHlAs/ZoQsppFiiiGK1J3a5ux4=;
        b=Th/ilYO8l3Z1nXeaCaYC8bD7lammaSEc5UAB85CkXq1Vycyd681ivWT1RNoefPHtZH
         LWQ/jbKBWZPLNOY0qO10bt5dyLWzpFGEC5NTMTy+RBGPklQ2Aj9fOMKPgUiYufwl931w
         QChpwEL/zLO/ay9RAHCqtc8rvuOEh5M2bD1No4mhpWfyVzzAb3K2JiD4/DZMZYwgOuww
         wlx2tlx/JRhSFACyt944Fl8O+k/enQLbj3YcHUQ/MItTsDtahfN3yZqHQ1QT0bKJiZwH
         ZghYI25Jd0yapXmmqb80t2pOMF0i4tABz3/xCNbyFKiv0fK+7viAlgecVuYayLcBYlBl
         aANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282757; x=1794887557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVnAfL3uIlxiPJLYGHlAs/ZoQsppFiiiGK1J3a5ux4=;
        b=o4R8WfHzsNshBIooMwFY8lxYnKgpb9OEpIfNRmexhD8sxhUmu3P75YaL6wwD9Oio3y
         OIf4ILEdmyESFMQN+gJmiacbgHt8hJ7UheeQ7tTZizWVXYKUOjCFCJ40slDtaIAH7shP
         S5zZgoUuddUaDEjw2KtxQFZPFqtK34e7J/Q6JA8ApVskSmXylHl3R1sUDuSttwUvdqZk
         jsCg1IQGyZTzuGhKsiinY6ntEZd1FSpEoV+j415PqA2fWNXkQQCm2F5gRjikvLwKxlJC
         hZ+i9Umx0gzi+UISNE3Ge3dAYPWJOGIaflCH2+4+r9CIvHzCOvhLS3zSAjO0Ziy7kIPL
         cRgQ==
X-Gm-Message-State: APuU4Z+rWlO8kFflwZoAAxIMLEkX1RfNFcLegKW4srWW0OQEPLas9Qsq
	bIgPNm0vIg5tyFe3gVlO0nbL+H5PF+Fpm/HfndWonXha6M7p52HTlvp33klevUDc
X-Gm-Gg: AYBFou1jPUNfPeGbL1F9qruj1C/m0WpCpEyT2ycrRDfHwLucyW2rJ0re+zgi4pQ9o7l
	pNLhn1G2WEyZlMrbsuFDAz31w8Ie0PXhMQgtneYlb2uz5dU0Xg2aMowA63tsiJayW9lxAyRB3Eg
	6k+HV+2A3HgoMvlUNXBecKy5lGNNiWHtpvYXz1JJVwbP1+l2MiU4LF0vx7vFqK0oz9LcMLpKoST
	Xgq2Yrh9QdMXQDRWKaYxMkaaiiwgtT39xVhq0wtfX+hSNBF3EYVE4ndC65pVGyQt4wold0/oBsG
	3aFQ1jdKMe8/4Wsp3knK/5/VCxNMFPqXJChimGR9SnKWn8V2wTf++ajSjj6HiqU3uyGaWPU9sVT
	oGkR/D/yR3TMZrPrOWh+MsdgsucTyZC4Kkkwehr0bgj6F7VzqtDARRdtfl/HUdy5E7JPCJ2bc+7
	iqECZ+57at30Tj6x54vfRIq5qhvsMvi0fud9jACOCHa6fauzmSGfvaVWD+0auCCm2YHgKoxZJxR
	GToA3PMXe37xXHxfwb5bMka5zZmz9sEpe7SE33oEYl1svGpZuJucJrdZIK21zBhRiF2gTiwxce5
	0WYIvb8G/7eSisH196BOkIkWQUXuTgpnWqlt2QcdLA2m/sUgS9venHblUtI2PQ==
X-Received: by 2002:a17:90b:17cd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b166d36090mr1497618a91.58.1794282756676;
        Mon, 09 Nov 2026 19:52:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/7] bluez5: upgrade 5.87 -> 5.88
Date: Tue, 10 Nov 2026 16:52:23 +1300
Message-ID: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249888
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Upstream deprecated gatttool[1]
- Dropped patches that are merged in the upstream version
- Refreshed 0001-tests-add-a-target-for-building-tests-without-runnin.patch

Changelog:
https://github.com/bluez/bluez/releases/tag/5.88

[1]https://github.com/bluez/bluez/commit/a7da60ed45e9b7aea429f1472588c9070ebecdf7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   8 --
 ...ct-delta-0-RSSI-to-proximity-filters.patch |  86 --------------
 ...x-Fix-ABORT-response-being-discarded.patch |  44 -------
 ...exd-Fix-FILE-leak-in-phonebook-dummy.patch |  47 --------
 ...ap-Fix-NewMissedCalls-parameter-size.patch | 110 ------------------
 ...p-Fix-u128_to_string-skipping-data-4.patch |  33 ------
 ...d-pbap-Report-NewMissedCalls-for-mch.patch |  74 ------------
 ...et-for-building-tests-without-runnin.patch |  10 +-
 .../bluez5/{bluez5_5.87.bb => bluez5_5.88.bb} |   3 +-
 9 files changed, 6 insertions(+), 409 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.87.bb => bluez5_5.88.bb} (92%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eff229567c8..815d374694b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -28,7 +28,6 @@ PACKAGECONFIG ??= "obex-profiles \
     hid-profiles \
     hog-profiles \
     tools \
-    deprecated \
     udev \
 "
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
@@ -56,7 +55,6 @@ PACKAGECONFIG[hfp-profiles] = "--enable-hfp,--disable-hfp"
 PACKAGECONFIG[asha-profiles] = "--enable-asha,--disable-asha"
 PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
-PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
@@ -66,12 +64,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
-           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
-           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
-           file://0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch \
-           file://0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch \
-           file://0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
deleted file mode 100644
index a92d3896fa4..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 7789da9b8d9a488e06fc7dbd33167228692de676 Mon Sep 17 00:00:00 2001
-From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
-Date: Wed, 15 Jul 2026 17:19:36 +0800
-Subject: [PATCH] adapter: restrict delta=0 RSSI to proximity filters
-
-When a discovery filter is active (filtered_discovery=true), BlueZ
-unconditionally calls device_set_rssi_with_delta(..., delta=0),
-causing every BLE advertisement to emit a PropertiesChanged(RSSI)
-signal regardless of whether the RSSI value changed.
-
-delta=0 is only needed when a client has expressed explicit proximity
-interest by setting an RSSI or pathloss threshold in its discovery
-filter. Filters that specify only transport type or UUIDs do not
-require per-packet RSSI precision; for those, the standard
-RSSI_THRESHOLD=8 rate-limiting is both correct and desirable.
-
-The problem is triggered on dual-mode adapters by a transport-only
-filter (e.g. Transport=le). In merge_discovery_filters(), the
-transport-specific scan type (SCAN_TYPE_LE=6) does not equal the
-adapter scan type (SCAN_TYPE_DUAL=7), so has_filtered_discovery is
-set, filtered_discovery becomes true, and delta=0 is applied even
-though no proximity condition was requested. With hundreds of BLE
-devices advertising simultaneously this generates hundreds of
-unnecessary PropertiesChanged(RSSI) signals per second.
-
-Confirmed on QCS6490 (BlueZ 5.72) with Transport=le filter:
-
-  adapter.c: filtered_discovery=1 (current_discovery_filter=set)
-  device.c:  device_set_rssi_with_delta() rssi=-86 delta_threshold=0
-  device.c:  device_set_rssi_with_delta() rssi=-79 delta_threshold=0
-
-Add discovery_filter_has_proximity() which walks discovery_list and
-returns true only when at least one active filter carries a real
-proximity condition (rssi != DISTANCE_VAL_INVALID or pathloss !=
-DISTANCE_VAL_INVALID). Use this to gate the delta=0 path.
-
-Other filter fields (transport, uuids, duplicate, discoverable)
-express capability or content criteria and carry no proximity
-implication, so they are intentionally excluded from the check.
-
-Upstream-Status: Backport [e004414a1751d29216ccab976d6c7174ec48d11c]
-Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
----
- src/adapter.c | 19 ++++++++++++++++++-
- 1 file changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/src/adapter.c b/src/adapter.c
-index 538f63e0a..6cdc27e80 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -7249,6 +7249,22 @@ static void filter_duplicate_data(void *data, void *user_data)
- 	*duplicate = client->discovery_filter->duplicate;
- }
-
-+static bool discovery_filter_has_proximity(struct btd_adapter *adapter)
-+{
-+	GSList *l;
-+
-+	for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
-+		struct discovery_client *client = l->data;
-+		struct discovery_filter *filter = client->discovery_filter;
-+
-+		if (filter && (filter->rssi != DISTANCE_VAL_INVALID ||
-+				filter->pathloss != DISTANCE_VAL_INVALID))
-+			return true;
-+	}
-+
-+	return false;
-+}
-+
- static bool device_is_discoverable(struct btd_adapter *adapter,
- 					struct eir_data *eir, const char *addr,
- 					uint8_t bdaddr_type, bool *auto_connect)
-@@ -7445,7 +7461,8 @@ void btd_adapter_device_found(struct btd_adapter *adapter,
- 	if (name_resolve_failed)
- 		device_name_resolve_fail(dev);
-
--	if (adapter->filtered_discovery)
-+	if (adapter->filtered_discovery &&
-+				discovery_filter_has_proximity(adapter))
- 		device_set_rssi_with_delta(dev, rssi, 0);
- 	else
- 		device_set_rssi(dev, rssi);
---
-2.43.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
deleted file mode 100644
index 74f83a01f5a..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7302872e85bbb655018ed21f4c449a22cf047235 Mon Sep 17 00:00:00 2001
-From: Jinwang Li <jinwang.li@oss.qualcomm.com>
-Date: Thu, 27 Aug 2026 16:36:51 +0800
-Subject: [PATCH] gobex: Fix ABORT response being discarded
-
-g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
-so the ABORT success response should be enqueued after transfer_complete().
-
-Fixes the following PTS test cases:
-- OPP/SR/OPH/BV-27-I
-- FTP/SR/OTR/BV-02-C
-- PBAP/PSE/PDF/BV-06-I
-- PBAP/PSE/PBF/BV-03-I
-
-Fixes: 7a35c12a6ceb ("gobex: Fix segfault caused by interrupted transfer")
-Assisted-by: Claude:claude-sonnet-5
-Upstream-Status: Backport [commit d094be10ff0cc9d48714d35557e0fd297f36f907]
-Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
----
- gobex/gobex-transfer.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/gobex/gobex-transfer.c b/gobex/gobex-transfer.c
-index c94d018b2..e4c7c557d 100644
---- a/gobex/gobex-transfer.c
-+++ b/gobex/gobex-transfer.c
-@@ -314,11 +314,12 @@ static void transfer_abort_req(GObex *obex, GObexPacket *req, gpointer user_data
- 
- 	err = g_error_new(G_OBEX_ERROR, G_OBEX_ERROR_CANCELLED,
- 						"Request was aborted");
--	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
--	g_obex_send(obex, rsp, NULL);
- 
- 	transfer_complete(transfer, err);
- 	g_error_free(err);
-+
-+	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
-+	g_obex_send(obex, rsp, NULL);
- }
- 
- static guint8 put_get_bytes(struct transfer *transfer, GObexPacket *req)
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
deleted file mode 100644
index 9b9cba331fa..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Fix-FILE-leak-in-phonebook-dummy.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 062fa5fc95282da2168dce96a6dc78cb2cefe572 Mon Sep 17 00:00:00 2001
-From: Jinwang Li <jinwang.li@oss.qualcomm.com>
-Date: Wed, 30 Sep 2026 15:39:53 +0800
-Subject: [PATCH 1/3] obexd: Fix FILE* leak in phonebook-dummy
-
-fdopen(fd, "r") transfers ownership of fd to the FILE stream, but the
-loop was calling close(fd) directly instead of fclose(fp), leaking the
-FILE structure and its stdio buffer on every vCard read. Also handle
-fdopen() failure, which was previously unchecked.
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/549f3d50686bbf18f01b949a913ddd10cb6e8b5c]
-Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
----
- obexd/plugins/phonebook-dummy.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/obexd/plugins/phonebook-dummy.c b/obexd/plugins/phonebook-dummy.c
-index 0dce13f66..188429a21 100644
---- a/obexd/plugins/phonebook-dummy.c
-+++ b/obexd/plugins/phonebook-dummy.c
-@@ -164,6 +164,14 @@ static int foreach_vcard(DIR *dp, vcard_func_t func, uint16_t offset,
- 		}
- 
- 		fp = fdopen(fd, "r");
-+		if (fp == NULL) {
-+			err = errno;
-+			error("fdopen(%s): %s(%d)", filename, strerror(err),
-+									err);
-+			close(fd);
-+			continue;
-+		}
-+
- 		v = Parse_MIME_FromFile(fp);
- 		if (v != NULL) {
- 			func(filename, v, user_data);
-@@ -171,7 +179,7 @@ static int foreach_vcard(DIR *dp, vcard_func_t func, uint16_t offset,
- 			n++;
- 		}
- 
--		close(fd);
-+		fclose(fp);
- 	}
- 
- 	g_slist_free_full(sorted, g_free);
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
deleted file mode 100644
index da5a7d634e7..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-NewMissedCalls-parameter-size.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From fd39102cd189c524b60915feb46f075d0c12c972 Mon Sep 17 00:00:00 2001
-From: Jinwang Li <jinwang.li@oss.qualcomm.com>
-Date: Tue, 27 Oct 2026 15:10:45 +0800
-Subject: [PATCH 2/3] obexd/pbap: Fix NewMissedCalls parameter size
-
-NewMissedCalls is a one-byte apparam, but was encoded with
-g_obex_apparam_set_uint16(). Use uint8 instead, and update the
-phonebook callback type to match.
-
-Fixes: 398d3e23533a ("obexd: Make use of GObexApparam API")
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/f1af76b9868ef8f7f403d572f07fc533b1908eda]
-Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
----
- obexd/plugins/irmc.c              | 4 ++--
- obexd/plugins/pbap.c              | 8 ++++----
- obexd/plugins/phonebook-tracker.c | 2 +-
- obexd/plugins/phonebook.h         | 2 +-
- 4 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/obexd/plugins/irmc.c b/obexd/plugins/irmc.c
-index cfd8a45d4..b9888bbed 100644
---- a/obexd/plugins/irmc.c
-+++ b/obexd/plugins/irmc.c
-@@ -74,7 +74,7 @@ static const char *owner_vcard =
- 		"END:VCARD\r\n";
- 
- static void phonebook_size_result(const char *buffer, size_t bufsize,
--					int vcards, int missed,
-+					int vcards, uint8_t missed,
- 					gboolean lastpart, void *user_data)
- {
- 	struct irmc_session *irmc = user_data;
-@@ -90,7 +90,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
- }
- 
- static void query_result(const char *buffer, size_t bufsize, int vcards,
--				int missed, gboolean lastpart, void *user_data)
-+			uint8_t missed, gboolean lastpart, void *user_data)
- {
- 	struct irmc_session *irmc = user_data;
- 	const char *s, *t;
-diff --git a/obexd/plugins/pbap.c b/obexd/plugins/pbap.c
-index 9f8684863..3ee54f1fe 100644
---- a/obexd/plugins/pbap.c
-+++ b/obexd/plugins/pbap.c
-@@ -159,7 +159,7 @@ static void cache_clear(struct cache *cache)
- }
- 
- static void phonebook_size_result(const char *buffer, size_t bufsize,
--					int vcards, int missed,
-+					int vcards, uint8_t missed,
- 					gboolean lastpart, void *user_data)
- {
- 	struct pbap_session *pbap = user_data;
-@@ -186,7 +186,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
- 		DBG("missed %d", missed);
- 	}
- 
--	pbap->obj->apparam = g_obex_apparam_set_uint16(pbap->obj->apparam,
-+	pbap->obj->apparam = g_obex_apparam_set_uint8(pbap->obj->apparam,
- 							NEWMISSEDCALLS_TAG,
- 							missed);
- 
-@@ -194,7 +194,7 @@ static void phonebook_size_result(const char *buffer, size_t bufsize,
- }
- 
- static void query_result(const char *buffer, size_t bufsize, int vcards,
--				int missed, gboolean lastpart, void *user_data)
-+			uint8_t missed, gboolean lastpart, void *user_data)
- {
- 	struct pbap_session *pbap = user_data;
- 
-@@ -224,7 +224,7 @@ static void query_result(const char *buffer, size_t bufsize, int vcards,
- 		pbap->obj->firstpacket = TRUE;
- 	}
- 
--	pbap->obj->apparam = g_obex_apparam_set_uint16(pbap->obj->apparam,
-+	pbap->obj->apparam = g_obex_apparam_set_uint8(pbap->obj->apparam,
- 							NEWMISSEDCALLS_TAG,
- 							missed);
- 
-diff --git a/obexd/plugins/phonebook-tracker.c b/obexd/plugins/phonebook-tracker.c
-index eb7a84f46..2f7411312 100644
---- a/obexd/plugins/phonebook-tracker.c
-+++ b/obexd/plugins/phonebook-tracker.c
-@@ -488,7 +488,7 @@ struct phonebook_data {
- 	GSList *contacts;
- 	phonebook_cache_ready_cb ready_cb;
- 	phonebook_entry_cb entry_cb;
--	int newmissedcalls;
-+	uint8_t newmissedcalls;
- 	GCancellable *query_canc;
- 	char *req_name;
- 	int vcard_part_count;
-diff --git a/obexd/plugins/phonebook.h b/obexd/plugins/phonebook.h
-index c73ae73b8..f3150e1f6 100644
---- a/obexd/plugins/phonebook.h
-+++ b/obexd/plugins/phonebook.h
-@@ -61,7 +61,7 @@ struct apparam_field {
-  * Contacts will be returned in the vcard format.
-  */
- typedef void (*phonebook_cb) (const char *buffer, size_t bufsize,
--		int vcards, int missed, gboolean lastpart, void *user_data);
-+		int vcards, uint8_t missed, gboolean lastpart, void *user_data);
- 
- /*
-  * Interface between the PBAP core and backends to
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
deleted file mode 100644
index 13adce3aa2e..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8b4a4176063831476bc9244d20f43b552e4b5554 Mon Sep 17 00:00:00 2001
-From: Jinwang Li <jinwang.li@oss.qualcomm.com>
-Date: Wed, 23 Sep 2026 11:29:57 +0800
-Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
-
-u128_to_string uses data[3] twice causing data[4] to be skipped and
-DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
-be printed with wrong values.
-
-Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
-Assisted-by: opencode:claude-sonnet-5
-Upstream-Status: Backport [commit 8b4a4176063831476bc9244d20f43b552e4b5554]
-Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
----
- obexd/client/pbap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
-index ce5e6cd5d..1970d3357 100644
---- a/obexd/client/pbap.c
-+++ b/obexd/client/pbap.c
-@@ -1099,7 +1099,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
- 	return snprintf(str, len, "%02X%02X%02X%02X%02X%02X%02X%02X"
- 					"%02X%02X%02X%02X%02X%02X%02X%02X",
- 					data[0], data[1], data[2], data[3],
--					data[3], data[5], data[6], data[7],
-+					data[4], data[5], data[6], data[7],
- 					data[8], data[9], data[10], data[11],
- 					data[12], data[13], data[14], data[15]);
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch
deleted file mode 100644
index b907c320881..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Report-NewMissedCalls-for-mch.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 615a26bd9b6c53a06c278d74dce790e557ddfb6e Mon Sep 17 00:00:00 2001
-From: Jinwang Li <jinwang.li@oss.qualcomm.com>
-Date: Tue, 27 Oct 2026 15:10:46 +0800
-Subject: [PATCH 3/3] obexd/pbap: Report NewMissedCalls for mch
-
-The dummy backend always reports zero NewMissedCalls. Count the
-vCards in the folder instead, capped at UINT8_MAX.
-
-Fixes PTS test PBAP/PSE/PBD/BV-05-C
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d987dbc0f0817fa7927be174920713dfe2aaff13]
-Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
----
- obexd/plugins/phonebook-dummy.c | 23 ++++++++++++++++++++++-
- 1 file changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/obexd/plugins/phonebook-dummy.c b/obexd/plugins/phonebook-dummy.c
-index 188429a21..d04cc98e0 100644
---- a/obexd/plugins/phonebook-dummy.c
-+++ b/obexd/plugins/phonebook-dummy.c
-@@ -41,6 +41,7 @@ struct dummy_data {
- 	char *folder;
- 	int fd;
- 	guint id;
-+	uint8_t newmissedcalls;
- };
- 
- struct cache_query {
-@@ -244,7 +245,8 @@ static gboolean read_dir(void *user_data)
- 	closedir(dp);
- done:
- 	/* FIXME: Missing vCards fields filtering */
--	dummy->cb(buffer->str, buffer->len, count, 0, TRUE, dummy->user_data);
-+	dummy->cb(buffer->str, buffer->len, count, dummy->newmissedcalls,
-+							TRUE, dummy->user_data);
- 
- 	g_string_free(buffer, TRUE);
- 
-@@ -360,6 +362,22 @@ static gboolean is_dir(const char *dir)
- 	return S_ISDIR(st.st_mode);
- }
- 
-+static uint8_t count_vcards(const char *folder)
-+{
-+	DIR *dp;
-+	uint16_t count = 0;
-+
-+	dp = opendir(folder);
-+	if (dp == NULL)
-+		return 0;
-+
-+	foreach_vcard(dp, NULL, 0, UINT8_MAX, NULL, &count);
-+
-+	closedir(dp);
-+
-+	return count;
-+}
-+
- char *phonebook_set_folder(const char *current_folder,
- 		const char *new_folder, uint8_t flags, int *err)
- {
-@@ -490,6 +508,9 @@ void *phonebook_pull(const char *name, const struct apparam_field *params,
- 	dummy->folder = folder;
- 	dummy->fd = -1;
- 
-+	if (g_strcmp0(name, PB_CALLS_MISSED) == 0)
-+		dummy->newmissedcalls = count_vcards(folder);
-+
- 	if (err)
- 		*err = 0;
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 0fc15c75a01..266b216d2e7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From e7407ddb1b52308d4b69036da94bbd6021f0c7ab Mon Sep 17 00:00:00 2001
+From 67e885ad913ebc0a5224ec1ed09f2ed98eac8122 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,12 +10,12 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 76c4ab5..91a6277 100644
+index 37302ed..7efff21 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -812,6 +812,9 @@ endif
- TESTS = $(unit_tests)
- AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
+@@ -892,6 +892,9 @@ if FUNCTIONAL_TESTING
+ check: check-functional
+ endif
  
 +# This allows building tests without running them
 +buildtests: $(TESTS)
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb b/meta/recipes-connectivity/bluez5/bluez5_5.88.bb
similarity index 92%
rename from meta/recipes-connectivity/bluez5/bluez5_5.87.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.88.bb
index 08682b70d83..009c6aa3b8a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.88.bb
@@ -2,7 +2,7 @@ require bluez5.inc
 
 LDFLAGS += " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,-z,nostart-stop-gc', '', d)}"
 
-SRC_URI[sha256sum] = "26bdcf2cebd7310c6f598850606b037ef0c515fe6608ebc54d22c50c4c32b35f"
+SRC_URI[sha256sum] = "6952c39eb5f8b0ee712cc50ab3bcff03be17c410dd97ca640f4849d9a1653ba3"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 CVE_STATUS[CVE-2020-12351] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
@@ -12,7 +12,6 @@ CVE_STATUS[CVE-2026-19774] = "fixed-version: Fixed from version 5.87"
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'deprecated', 'attrib/gatttool', '', d)} \
     tools/obex-client-tool \
     tools/obex-server-tool \
     tools/bluetooth-player \
