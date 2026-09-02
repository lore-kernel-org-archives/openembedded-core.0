Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AEBC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:00:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6583.1788332440579630965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 00:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L0UOiy6T;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so667084b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332440; x=1788937240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehiXiWiOBunQl6AbQUttlxPyceL45qPx3RdKtcRksJk=;
        b=L0UOiy6T5bAJmN8GFiXOTKizWPk4lFzCSVh58OPwBDLhs9ZgZWXViThRBH3mkFMJPV
         8MATywCMqSGPl2UsoV5VBNhCPX0Cormvwt1VDBtrMyARdsUjoYKFfzo9t8D06o47WPT0
         FZjvUEQSiudY0tQUrZlSiZ86hAGSUfYvqTM20TVyN5FbL+4hfrBz7F/U+64tmWMr+juj
         vSemPCLtH35noXDAGATGeI3GJdOztN2PY1/6PSLW1PAAwg6uYmtkL894d7gNGyDxtEuu
         6t+i39Qdu/MwcxvDH0ikz7e6XO9ZoGy/8ECFklfJSOUBB67BEFr7wTiEnteBYvXrW7Mq
         dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332440; x=1788937240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehiXiWiOBunQl6AbQUttlxPyceL45qPx3RdKtcRksJk=;
        b=TPIV34HJQSncsjfeZpqYOSHXh0oeVxkzgtZuPSSKDCq35B8blEw3mWqxuQaLNPyTJt
         c5aDT6fHkiWzDtPCCzCFUTRRr1CXQhLmNFHyZXHIQrlH7FtYeqj/bUeQEO25eGeZCy1h
         uwjAc9k89uD07NgduQSfkUiQHVSpIcF3md78MR5Bg1ai6wKwcQQKF/0MDyk8FBHrRA97
         95172zOt08D6XwtSza8KzzEhyMe+IYApnY4+Vsj6kSlGD/EfAOEAgKOpO/J+PMxXr5lE
         icwUlHQmyS/VxAdxrvHBtGTL6O91gFO9eXSy0YOykjRR+SHrqIEDn0r2tSsZsc0NmXGc
         F/ug==
X-Gm-Message-State: AFuF++lAluWGeRT+EAJjJB06jNHMDjWpVfOneRj1AT9Mpr1tjmj0G5Pc
	8OEbJ4T1IMRZDW1o9f+TIQ3WM71pFMC/PuoPBBtnc+OpIW6ZnIsQDBU4lgJa7A==
X-Gm-Gg: AR+sD12W/XVrbMrZ/CckjYwHT9nqodqP2i+R1WFRj9DS0/Y7EnuxomIjMKGwGebgolw
	aOBtGjlRP39pyKB4qAnjeM17t3xCzjxuUa+OMi3mxWf8dAsuYZX21s0OYJTFFS3OpbAN9vJK/1z
	yfhBrOjwFgNm8w1HwMfMDM7KjiROUFIfXuZgcXTAI643FZXzJsLOlp7ZQBmGIoAT+KhK+KG9nrh
	BiTt8A6sgIPIvpPKLwJINPPM8eb2Q95/rr/F4SHp0yblBZfuCO8aJj2LuuVicA0YbzCXqvNp7YF
	MA9tzyiyKo0XwiiliWz3KUDcNVtVMAKe31Dm519K/FFHo11tEeXzwKLsmlbmjfhw+my6uQfH7lT
	Qbwx1D+ljILxHXRmEsgoTVm4V4VJ2icaZjGf7VoVENWBRmjkPrYz7TNcZzXkUhCVbDHKExK6i7m
	Ps3cBtI2fAQSt/y+oCbDGReuX50Rur9FJtP49W9hPj97kflQqM01B6BFJquInODfu7h79ZXcSFJ
	A==
X-Received: by 2002:a05:6a21:33a0:b0:3d3:adad:f177 with SMTP id adf61e73a8af0-3d9afbfff25mr4190770637.25.1788332439259;
        Wed, 02 Sep 2026 00:00:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4338a9253sm202936a12.12.2026.09.02.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:00:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][wrynose][PATCH 1/1] wpa-supplicant: patch CVE-2026-58374
Date: Wed,  2 Sep 2026 19:00:28 +1200
Message-ID: <20260902070028.1938818-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244895

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Apply patches recommended by upstream[1] as mentioned in the NVD[2]

[1] https://w1.fi/security/2026-1/
[2] https://nvd.nist.gov/vuln/detail/cve-2026-58374

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wpa-supplicant/CVE-2026-58374-1.patch     | 52 ++++++++++++++++++
 .../wpa-supplicant/CVE-2026-58374-2.patch     | 47 ++++++++++++++++
 .../wpa-supplicant/CVE-2026-58374-3.patch     | 55 +++++++++++++++++++
 .../wpa-supplicant/CVE-2026-58374-4.patch     | 46 ++++++++++++++++
 .../wpa-supplicant/CVE-2026-58374-5.patch     | 47 ++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  5 ++
 6 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch
new file mode 100644
index 00000000000..625371c2b55
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch
@@ -0,0 +1,52 @@
+From 708a4247581c98c0cc46504e4abb874b4c835ffe Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 23:24:04 +0300
+Subject: [PATCH 1/5] AP MLD: Fix link ID validation in Basic MLE parsing
+
+Link ID 15 can be indicated in the field, but that is not a valid value
+and must be rejected to avoid issues pointing beyond the array of links
+for a non-AP MLD. Without this, an invalid MLE could result in writing
+beyond the end of the buffer and causing process termination or
+unexpected behavior.
+
+Fixes: 5f5db9366cde ("AP: MLO: Process Multi-Link element from (Re)Association Request frame")
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=46dd5a4ffc9bcf44cf8fc45120b3e1e5ec922187]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ap/ieee802_11_eht.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/ap/ieee802_11_eht.c b/src/ap/ieee802_11_eht.c
+index b935ee889a89..804808c0dbfd 100644
+--- a/src/ap/ieee802_11_eht.c
++++ b/src/ap/ieee802_11_eht.c
+@@ -1262,6 +1262,7 @@ u16 hostapd_process_ml_assoc_req(struct hostapd_data *hapd,
+ 		size_t sub_elem_len = *(pos + 1);
+ 		size_t sta_info_len;
+ 		u16 control;
++		u8 link_id;
+ 
+ 		wpa_printf(MSG_DEBUG, "MLD: sub element len=%zu",
+ 			   sub_elem_len);
+@@ -1302,8 +1303,13 @@ u16 hostapd_process_ml_assoc_req(struct hostapd_data *hapd,
+ 			goto out;
+ 		}
+ 		control = WPA_GET_LE16(pos);
+-		link_info = &info->links[control &
+-					 EHT_PER_STA_CTRL_LINK_ID_MSK];
++		link_id = control & BASIC_MLE_STA_CTRL_LINK_ID_MASK;
++		if (link_id >= MAX_NUM_MLD_LINKS) {
++			wpa_printf(MSG_DEBUG,
++				   "MLD: Invalid Link ID in Per-STA Profile subelement");
++			goto out;
++		}
++		link_info = &info->links[link_id];
+ 		pos += 2;
+ 		ml_len -= 2;
+ 		sub_elem_len -= 2;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch
new file mode 100644
index 00000000000..07dd9d3a65f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch
@@ -0,0 +1,47 @@
+From 00e74b2f6e21e4d01aa58433a441ca4c81fb10ab Mon Sep 17 00:00:00 2001
+From: Amarnath Hullur Subramanyam <amarnathhs@google.com>
+Date: Thu, 30 Apr 2026 18:24:35 -0700
+Subject: [PATCH 2/5] BSS: Add bounds check for link_id in Basic MLE parsing
+
+In wpa_bss_parse_basic_ml_element() in bss.c, an extracted link_id is
+used without validation against the maximum allowed links
+(MAX_NUM_MLD_LINKS). Processing a malformed Basic Multi-Link element
+(MLE) with an out-of-bounds link_id could lead to memory corruption.
+However, the modified location is within the body of the received frame
+and as such, this does not result in additional issues since that area
+is controlled by the transmitter of the frame. In any case, it is better
+to be explicit with validating the Link ID value.
+
+This commit introduces a strict bounds check immediately after link_id
+extraction. If link_id exceeds or equals MAX_NUM_MLD_LINKS, parsing is
+gracefully aborted with a debug log entry.
+
+Fixes: de5e01010cb2 ("wpa_supplicant: Support ML probe request")
+Signed-off-by: Amarnath Hullur Subramanyam <amarnathhs@google.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=aa9d345887389a251c63a3781d2ad2940d079193]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wpa_supplicant/bss.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/wpa_supplicant/bss.c b/wpa_supplicant/bss.c
+index e8aaf6fe1848..11950064a1b6 100644
+--- a/wpa_supplicant/bss.c
++++ b/wpa_supplicant/bss.c
+@@ -1710,6 +1710,11 @@ int wpa_bss_parse_basic_ml_element(struct wpa_supplicant *wpa_s,
+ 			  ETH_ALEN);
+ 
+ 	link_id = ml_basic_common_info->variable[0] & EHT_ML_LINK_ID_MSK;
++	if (link_id >= MAX_NUM_MLD_LINKS) {
++		wpa_printf(MSG_DEBUG, "MLD: Invalid link ID %u in Basic MLE",
++			   link_id);
++		goto out;
++	}
+ 
+ 	bss->mld_link_id = link_id;
+ 	seen = bss->valid_links = BIT(link_id);
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch
new file mode 100644
index 00000000000..9e28d0a95a3
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch
@@ -0,0 +1,55 @@
+From ae24a10634f6e19d75888f5d786f380bb7af5b86 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 23:16:08 +0300
+Subject: [PATCH 3/5] MLD: Validate MLE Link ID fields in association rejection
+ case
+
+The Link ID Info field in the Common Info field needs to ignore the
+reserved bits to be more extensible for future. Both that link ID for
+the association link and the link IDs for other links need to be
+verified to be within the valid range (0-14), so check that here. The
+parsed link ID was not used for anything yet, but it is better to make
+sure this in theory common parser is not exposing invalid data to the
+caller should it be used for additional purposes in the future.
+
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=a8531e3d871e6fa72f2f85d91e9f787326b2af8b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wpa_supplicant/events.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 49917f7aaf72..600718d8efc4 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -3864,7 +3864,12 @@ static unsigned int wpas_ml_parse_assoc(struct wpa_supplicant *wpa_s,
+ 	pos = common_info->variable;
+ 
+ 	/* Store the information for the association link */
+-	ml_info[i].link_id = *pos;
++	ml_info[i].link_id = *pos & EHT_ML_LINK_ID_MSK;
++	if (ml_info[i].link_id >= MAX_NUM_MLD_LINKS) {
++		wpa_printf(MSG_DEBUG,
++			   "MLD: Invalid Link ID value for assoc link");
++		goto out;
++	}
+ 	pos++;
+ 
+ 	/* Skip the BSS Parameters Change Count */
+@@ -3999,6 +4004,10 @@ static unsigned int wpas_ml_parse_assoc(struct wpa_supplicant *wpa_s,
+ 			   MAC2STR(pos + 1), nstr_bitmap_len);
+ 
+ 		ml_info[i].link_id = ctrl & EHT_PER_STA_CTRL_LINK_ID_MSK;
++		if (ml_info[i].link_id >= MAX_NUM_MLD_LINKS) {
++			wpa_printf(MSG_DEBUG, "MLD: Invalid Link ID value");
++			goto out;
++		}
+ 		os_memcpy(ml_info[i].bssid, pos + 1, ETH_ALEN);
+ 
+ 		pos += sta_info_len;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch
new file mode 100644
index 00000000000..1f42a4017f1
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch
@@ -0,0 +1,46 @@
+From c4fc1bf2fd7fe6bebf72d32385bc2bd20d144093 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Mon, 18 May 2026 15:45:15 +0300
+Subject: [PATCH 4/5] AP MLD: Verify AP MLD link ID validity before updating
+ bitmap of links
+
+Link ID is 0..14, so ignore value 15 if an invalid frame is processed.
+It does not look like the invalid value was actually used to reference
+any local array, but in any case, it is better to not mark an invalid
+link as being specified.
+
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=ce1a8612e309fe86133ecf05ffb452b0bdf3b035]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ap/beacon.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/ap/beacon.c b/src/ap/beacon.c
+index cec0c9829fd9..cc295c18f61b 100644
+--- a/src/ap/beacon.c
++++ b/src/ap/beacon.c
+@@ -1305,6 +1305,7 @@ static bool parse_ml_probe_req(const struct ieee80211_eht_ml *ml, size_t ml_len,
+ 	for_each_element_id(sub, 0, pos, len) {
+ 		const struct ieee80211_eht_per_sta_profile *sta;
+ 		u16 sta_control;
++		u8 link_id;
+ 
+ 		if (*links == 0xffff)
+ 			*links = 0;
+@@ -1324,7 +1325,9 @@ static bool parse_ml_probe_req(const struct ieee80211_eht_ml *ml, size_t ml_len,
+ 		 * partial profile was requested.
+ 		 */
+ 		sta_control = le_to_host16(sta->sta_control);
+-		*links |= BIT(sta_control & EHT_PER_STA_CTRL_LINK_ID_MSK);
++		link_id = sta_control & BASIC_MLE_STA_CTRL_LINK_ID_MASK;
++		if (link_id < MAX_NUM_MLD_LINKS)
++			*links |= BIT(link_id);
+ 	}
+ 
+ 	if (!for_each_element_completed(sub, pos, len)) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch
new file mode 100644
index 00000000000..34a0c0af3ba
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch
@@ -0,0 +1,47 @@
+From dad0d98570e3615b441d1c1e72e2945483a6fe77 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 17:47:03 +0300
+Subject: [PATCH 5/5] MLD: Fix length check in common info for association
+ failure cases
+
+It is not sufficient to check that the indicated common info length is
+sufficiently large to contain the information; there needs to be a check
+for the indicated value to not be too large to go beyond the end of the
+MLE as well. Without this, invalid MLE might result in ml_len wrapping
+around to a huge value and reading beyond the end of the buffer for the
+received frame. This could result in process termination.
+
+Add the missed check for the Common Info field not being truncated in
+the MLE in association failure cases.
+
+Fixes: a58a0c592e20 ("MLD: Fix Multi-Link element parsing for association failures")
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=41c86a2ebed50567c73de23c102c2bf83eb883f2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wpa_supplicant/events.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 600718d8efc4..d81578438588 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -3852,6 +3852,13 @@ static unsigned int wpas_ml_parse_assoc(struct wpa_supplicant *wpa_s,
+ 		goto out;
+ 	}
+ 
++	if (sizeof(*ml) + common_info->len > ml_len) {
++		wpa_printf(MSG_DEBUG,
++			   "MLD: Truncated common info (common_info->len=%u ml_len=%zu)",
++			   common_info->len, ml_len);
++		goto out;
++	}
++
+ 	wpa_printf(MSG_DEBUG, "MLD: address: " MACSTR,
+ 		   MAC2STR(common_info->mld_addr));
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c13..7d1f9ffc6d6 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -21,6 +21,11 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
            file://CVE-2025-24912-01.patch \
            file://CVE-2025-24912-02.patch \
+           file://CVE-2026-58374-1.patch \
+           file://CVE-2026-58374-2.patch \
+           file://CVE-2026-58374-3.patch \
+           file://CVE-2026-58374-4.patch \
+           file://CVE-2026-58374-5.patch \
            "
 SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
 

