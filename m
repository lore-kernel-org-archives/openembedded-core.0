Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10936.1794198361342267298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 20:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PXsJ9gm6;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7234; q=dns/txt;
  s=iport01; t=1794198361; x=1795407961;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZiM8kuisdnhufb/cf/M+kJjzCiYELSjVCyb/RsFh2h8=;
  b=PXsJ9gm6vOEE07UtwkChaXE7KdmdJTDdGwBQjvByQvdFspb7M1QqJ2pW
   FN0qXZo/oN+p3+9ThmSNmzIUEZtTmIGcJlGl8zKA963FP9Vj8nZUNXmXw
   vWEW9B5YOgqadD5F6jn97e7CzSJlV0JYu7ZbNq5UlFVXWM4RvpGvNHUUk
   e3AIrKqj8R6ovX+K0HB0wHhZwYlxbPJU3bq2eVPUvTktDOX+9Q31RGX7C
   rmMTuvkgK0o9WO0IKMyziA/rRFKWPrKIuA7fOsUkPrMRldnT6pjJLSRmm
   8j84jL9edoETdKymHCihT4UKNqyI//mV9ro4jTOjPDO+hVqfJKRiwqBHR
   A==;
X-CSE-ConnectionGUID: D/n0tphiS92aIPLcckFxFQ==
X-CSE-MsgGUID: Oz+QQ5z1Ty6UL1E90goveQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgDlSfFq/5L/Ja1aglmCV3VhQkmWS4EWilKSPIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEqCwFGLAMBAk8LIyGDAgGCOgM3AgERuhGBeTOBAYNbA?=
 =?us-ascii?q?4Eg2EwNgloBBQYUAQWBM4VCgwCFJF0YAYR9JxsbgXKBFYJzdoEFgRpCAoFKh?=
 =?us-ascii?q?lwEgiKBDIFaHox6AoFRhntIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+Gwo2GA1IESw3F?=
 =?us-ascii?q?RkEPm4HkkKDEgEsYQErInY4NCiTNQMRki2gIHEKKIN4jCSPPoV8GjOEBJQZk?=
 =?us-ascii?q?lQLmH2OCoQKkkeEaYFoPIFZcBWDIlMZD44tAQsLg2DKMCM1AgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJABASYHb2ABAQ?=
IronPort-Data: A9a23:F2rCUaB1xiEn6xVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDwi1TcFn
 2YeXT+DbPuNa2X2KY92Ptjl8R4E6MTSz9FnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE77JoVF0uPYwjq7x+IFlq/
 vcbBiAjV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FEtjea3YYCFJbRmQ+1yjAWhn
 z/UpljoXCw+bfHOkTWC7H+V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:MQAoha3mRD/+EpDJ8yFxaAqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:Rr7zhGDwdZhQdmn6EwUg8hYIAsAkSSyHxVboB0SzCkh5ZoTAHA==
X-Talos-MUID: 9a23:V9mnIgZy53ZwzeBTkC2vvQg/Jp5U8vqTLBkgwM0JvNeJDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,203,1787011200"; 
   d="scan'208";a="545629287"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Nov 2026 04:26:00 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 18E001800023E;
	Mon,  9 Nov 2026 04:26:00 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id B19E1CC1634; Sun,  8 Nov 2026 20:25:59 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-Core][wrynose][PATCH] bluez5: fix CVE-2026-19774
Date: Sun,  8 Nov 2026 20:25:55 -0800
Message-Id: <20261109042555.1097654-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 04:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249784
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
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 .../bluez5/bluez5/CVE-2026-19774_p1.patch     | 63 +++++++++++++++++++
 .../bluez5/bluez5/CVE-2026-19774_p2.patch     | 62 ++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d857c23a57..a748d40768 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -76,6 +76,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
+           file://CVE-2026-19774_p1.patch \
+           file://CVE-2026-19774_p2.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
new file mode 100644
index 0000000000..5a7d42b522
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
index 0000000000..88dcd66c3e
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
-- 
2.35.6

