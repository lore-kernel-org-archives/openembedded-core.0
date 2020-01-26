Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 77B6E9169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:00 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id x7so3904312pgl.11
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EZqe0m6t38vhH6Q1U/LjKwhfh7BC4cwoJqmab9YK+lM=;
	b=iueE3Be4QG3GEuhlilbZZbmAG8VCOSwkJqgViy8B8NB6yUYyNe8BUUtJ7WhC2bSybI
	H/XvIX9Yc+5tuIElhxCrGTx91T3HxNAQKLZY2ouQL3zRHtXMuO+u6NtrPFTLqf1L52Zz
	5z/amMjW4qvgKmVAixBseg5gXSQoq5J5RN4/VXTg4OtBz+tUkjdYzilfTC+kFBdnh612
	nVgrEsUXizztqJWw6AHh8I9tDzyMhVHbHfcS8/9tEjKi7/yRoJtSg4mzfZHjHqgCakL3
	TSlnDRfdIdJniNz56zkQ5nDT7C41NRlDB5eeFZGsF1FUOFijLrYuRU1HF/kI7iDUy/cZ
	qpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EZqe0m6t38vhH6Q1U/LjKwhfh7BC4cwoJqmab9YK+lM=;
	b=mfVVjMOTMWqEfwWbENTm4Ow/RkmyeDvM3MU8eNKpxPDeEmXI40qWR97QMRYgw/7YgK
	X5SH4kbDYvDRLuVd/YW7Ev8X/4EHMkK/YyIy7ZQqYd6n2d4AZoRQNMIvipqr1gTrQ1Sf
	55j2O6hOaMrHxNR18QCcGyPaNC4t0ZwMSp98i77W8ogcnYzfwSbYxc5qUm85U/j1711M
	EBw+ERVjntn949MnRhvBAk0QkhsYJXzGMbsjGGbqrgKNGsk9+Er4S7geIktD+F3Iha+S
	KKI4ywELSDbedw4qkr/lcMSgsdbmTgG39rX7qurdvksFGm62KOsHK8fZcWXYW0lgw/jb
	wiSg==
X-Gm-Message-State: APjAAAVj0kUGUwC9PXTt1PKm6kBJCW5N9ykrLvd3pyc/Xj6D5ReXFih9
	uIGz8anI4V0S9EZXkZwVnr16INit
X-Google-Smtp-Source: APXvYqzcjMx4h2lkBeb7G1L0+6f+LRseq3mNJnYMDLuZfdr5CgEDPNsGtSNm029k9LAg+qnTKN0asw==
X-Received: by 2002:a62:d10b:: with SMTP id z11mr2154057pfg.67.1580055901196; 
	Sun, 26 Jan 2020 08:25:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.00
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:30 -0800
Message-Id: <4b764c25d7396cba41c28c66a78a7a8f0ea3a5be.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 05/29] wpa-supplicant: fix CVE-2019-16275
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:00 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...re-management-frame-from-unexpected-.patch | 82 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.7.bb      |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
new file mode 100644
index 0000000000..7b0713cf6d
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
@@ -0,0 +1,82 @@
+hostapd before 2.10 and wpa_supplicant before 2.10 allow an incorrect indication
+of disconnection in certain situations because source address validation is
+mishandled. This is a denial of service that should have been prevented by PMF
+(aka management frame protection). The attacker must send a crafted 802.11 frame
+from a location that is within the 802.11 communications range.
+
+CVE: CVE-2019-16275
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 8c07fa9eda13e835f3f968b2e1c9a8be3a851ff9 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 29 Aug 2019 11:52:04 +0300
+Subject: [PATCH] AP: Silently ignore management frame from unexpected source
+ address
+
+Do not process any received Management frames with unexpected/invalid SA
+so that we do not add any state for unexpected STA addresses or end up
+sending out frames to unexpected destination. This prevents unexpected
+sequences where an unprotected frame might end up causing the AP to send
+out a response to another device and that other device processing the
+unexpected response.
+
+In particular, this prevents some potential denial of service cases
+where the unexpected response frame from the AP might result in a
+connected station dropping its association.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/ap/drv_callbacks.c | 13 +++++++++++++
+ src/ap/ieee802_11.c    | 12 ++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
+index 31587685fe3b..34ca379edc3d 100644
+--- a/src/ap/drv_callbacks.c
++++ b/src/ap/drv_callbacks.c
+@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
+ 			   "hostapd_notif_assoc: Skip event with no address");
+ 		return -1;
+ 	}
++
++	if (is_multicast_ether_addr(addr) ||
++	    is_zero_ether_addr(addr) ||
++	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
++			   " in received indication - ignore this indication silently",
++			   __func__, MAC2STR(addr));
++		return 0;
++	}
++
+ 	random_add_randomness(addr, ETH_ALEN);
+ 
+ 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index c85a28db44b7..e7065372e158 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
+ 	fc = le_to_host16(mgmt->frame_control);
+ 	stype = WLAN_FC_GET_STYPE(fc);
+ 
++	if (is_multicast_ether_addr(mgmt->sa) ||
++	    is_zero_ether_addr(mgmt->sa) ||
++	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
++			   " in received frame - ignore this frame silently",
++			   MAC2STR(mgmt->sa));
++		return 0;
++	}
++
+ 	if (stype == WLAN_FC_STYPE_BEACON) {
+ 		handle_beacon(hapd, mgmt, len, fi);
+ 		return 1;
+-- 
+2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
index 277bbaec63..542bbf4a9a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch \
            file://0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch \
            file://0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch \
+           file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
           "
 SRC_URI[md5sum] = "a68538fb62766f40f890125026c42c10"
 SRC_URI[sha256sum] = "76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074"
-- 
2.17.1


