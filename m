Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6BAC433F5
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 18:11:02 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.21847.1643566260888462393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 10:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5XIlFgI;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id s13so35968584ejy.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=L9FcEHtGyZNTFnlcm2f1NO0uGZS7/I9eJJos7v5NOr4=;
        b=B5XIlFgIdhHGfVN7rFaKdyf4rHDQAMhxbB5GftGJqzGoMhk3cXuMz0O2ZIrNZXPqDT
         K6burHXgORKsBrmDbl6Mz21sJ1Ldt/x2cEI6WY7DcW6yvwoG4zV8VTJU9hYlRO7Gzx0i
         cE6Y2Wq+6Vz3lROPUF/s2cBXoki9Y3F1ckycMDm3I6QCjTCfLnkZ6WryUaPxnpz5YSri
         /L+pQZh/g7Lhl9M5i35MpM3SZmpQJKkBiZ1d9L3irijBms8cJichk2GbEeatYnGyIu0M
         E52nD4anARqZfgQ6+JsgZTe8NbbGeFeCO9YjDpu8I9lH1HgrDTkwtr1jN2DcoOPMDn53
         Cocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L9FcEHtGyZNTFnlcm2f1NO0uGZS7/I9eJJos7v5NOr4=;
        b=sRwXqmGrMVO3+fmb55PJ0jEztVX//YdYZvC/SdHu2DF4/UCo5E6Nj2Zl6xw54h4NaV
         Co6kW3VrKfW5ZcE4jbT797fPtiDX2eDzz2cKKeqlgXyshDBN6VduA/poVq1AAAJc6EXj
         dFU42hiOTihqRgHftbV8VBtQAX+M3GW04EnUbtHnvE3pmuc6ixrTrv2LTprgx2hTI5DM
         JACJcAqqRDcrbgsLnX34982sc9fmeBhHFsC5/0IK+OIdgUOwMjF8aYcqLlO8HpShykzZ
         0R0q6dK3WqsAgYZ5cbILmUrnB47HmSHUGXCYqZc7HIQOzLP06Wn333N3hxjm43Rs2PjR
         yLrg==
X-Gm-Message-State: AOAM532UN3R4XFiMC4f1tq4ZGpI2skkFguqywKy+VdX9E+5swc5UN4YY
	vgdJB2ZPkGrpNZLdGDq9XlCVQhWi7xjplg==
X-Google-Smtp-Source: 
 ABdhPJyTn2rb4bbW6nww1mzT5VoN9ct09uQ6JWdjsSLO7zE9oug53Grnu+EXtC1TkfubDj9h1js5Ow==
X-Received: by 2002:a17:907:1c0f:: with SMTP id
 nc15mr14300024ejc.673.1643566258606;
        Sun, 30 Jan 2022 10:10:58 -0800 (PST)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 j15sm12424308ejx.120.2022.01.30.10.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 10:10:58 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] wpa-supplicant: upgrade 2.9 -> 2.10
Date: Sun, 30 Jan 2022 18:10:54 +0000
Message-Id: <20220130181054.83475-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 18:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161113

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...re-management-frame-from-unexpected-.patch |  82 ----------
 ...allow-event-subscriptions-with-URLs-.patch | 151 ------------------
 ...-systemd-install-Alias-with-WantedBy.patch |  52 ------
 ...nt-message-generation-using-a-long-U.patch |  62 -------
 ...HTTP-initiation-failures-for-events-.patch |  50 ------
 .../wpa-supplicant/CVE-2021-0326.patch        |  45 ------
 .../wpa-supplicant/CVE-2021-27803.patch       |  58 -------
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 --------------
 ...pplicant_2.9.bb => wpa-supplicant_2.10.bb} |  18 +--
 9 files changed, 5 insertions(+), 636 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.9.bb => wpa-supplicant_2.10.bb} (80%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
deleted file mode 100644
index 7b0713cf6d..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-hostapd before 2.10 and wpa_supplicant before 2.10 allow an incorrect indication
-of disconnection in certain situations because source address validation is
-mishandled. This is a denial of service that should have been prevented by PMF
-(aka management frame protection). The attacker must send a crafted 802.11 frame
-from a location that is within the 802.11 communications range.
-
-CVE: CVE-2019-16275
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 8c07fa9eda13e835f3f968b2e1c9a8be3a851ff9 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Thu, 29 Aug 2019 11:52:04 +0300
-Subject: [PATCH] AP: Silently ignore management frame from unexpected source
- address
-
-Do not process any received Management frames with unexpected/invalid SA
-so that we do not add any state for unexpected STA addresses or end up
-sending out frames to unexpected destination. This prevents unexpected
-sequences where an unprotected frame might end up causing the AP to send
-out a response to another device and that other device processing the
-unexpected response.
-
-In particular, this prevents some potential denial of service cases
-where the unexpected response frame from the AP might result in a
-connected station dropping its association.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/ap/drv_callbacks.c | 13 +++++++++++++
- src/ap/ieee802_11.c    | 12 ++++++++++++
- 2 files changed, 25 insertions(+)
-
-diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
-index 31587685fe3b..34ca379edc3d 100644
---- a/src/ap/drv_callbacks.c
-+++ b/src/ap/drv_callbacks.c
-@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
- 			   "hostapd_notif_assoc: Skip event with no address");
- 		return -1;
- 	}
-+
-+	if (is_multicast_ether_addr(addr) ||
-+	    is_zero_ether_addr(addr) ||
-+	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
-+		/* Do not process any frames with unexpected/invalid SA so that
-+		 * we do not add any state for unexpected STA addresses or end
-+		 * up sending out frames to unexpected destination. */
-+		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
-+			   " in received indication - ignore this indication silently",
-+			   __func__, MAC2STR(addr));
-+		return 0;
-+	}
-+
- 	random_add_randomness(addr, ETH_ALEN);
- 
- 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
-diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
-index c85a28db44b7..e7065372e158 100644
---- a/src/ap/ieee802_11.c
-+++ b/src/ap/ieee802_11.c
-@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
- 	fc = le_to_host16(mgmt->frame_control);
- 	stype = WLAN_FC_GET_STYPE(fc);
- 
-+	if (is_multicast_ether_addr(mgmt->sa) ||
-+	    is_zero_ether_addr(mgmt->sa) ||
-+	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
-+		/* Do not process any frames with unexpected/invalid SA so that
-+		 * we do not add any state for unexpected STA addresses or end
-+		 * up sending out frames to unexpected destination. */
-+		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
-+			   " in received frame - ignore this frame silently",
-+			   MAC2STR(mgmt->sa));
-+		return 0;
-+	}
-+
- 	if (stype == WLAN_FC_STYPE_BEACON) {
- 		handle_beacon(hapd, mgmt, len, fi);
- 		return 1;
--- 
-2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
deleted file mode 100644
index 53ad5d028a..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 5b78c8f961f25f4dc22d6f2b77ddd06d712cec63 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Wed, 3 Jun 2020 23:17:35 +0300
-Subject: [PATCH 1/3] WPS UPnP: Do not allow event subscriptions with URLs to
- other networks
-
-The UPnP Device Architecture 2.0 specification errata ("UDA errata
-16-04-2020.docx") addresses a problem with notifications being allowed
-to go out to other domains by disallowing such cases. Do such filtering
-for the notification callback URLs to avoid undesired connections to
-external networks based on subscriptions that any device in the local
-network could request when WPS support for external registrars is
-enabled (the upnp_iface parameter in hostapd configuration).
-
-Upstream-Status: Backport
-CVE: CVE-2020-12695 patch #1
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/wps/wps_er.c     |  2 +-
- src/wps/wps_upnp.c   | 38 ++++++++++++++++++++++++++++++++++++--
- src/wps/wps_upnp_i.h |  3 ++-
- 3 files changed, 39 insertions(+), 4 deletions(-)
-
-Index: wpa_supplicant-2.9/src/wps/wps_er.c
-===================================================================
---- wpa_supplicant-2.9.orig/src/wps/wps_er.c
-+++ wpa_supplicant-2.9/src/wps/wps_er.c
-@@ -1298,7 +1298,7 @@ wps_er_init(struct wps_context *wps, con
-			   "with %s", filter);
-	}
-	if (get_netif_info(er->ifname, &er->ip_addr, &er->ip_addr_text,
--			   er->mac_addr)) {
-+			   NULL, er->mac_addr)) {
-		wpa_printf(MSG_INFO, "WPS UPnP: Could not get IP/MAC address "
-			   "for %s. Does it have IP address?", er->ifname);
-		wps_er_deinit(er, NULL, NULL);
-Index: wpa_supplicant-2.9/src/wps/wps_upnp.c
-===================================================================
---- wpa_supplicant-2.9.orig/src/wps/wps_upnp.c
-+++ wpa_supplicant-2.9/src/wps/wps_upnp.c
-@@ -303,6 +303,14 @@ static void subscr_addr_free_all(struct
- }
-
-
-+static int local_network_addr(struct upnp_wps_device_sm *sm,
-+			      struct sockaddr_in *addr)
-+{
-+	return (addr->sin_addr.s_addr & sm->netmask.s_addr) ==
-+		(sm->ip_addr & sm->netmask.s_addr);
-+}
-+
-+
- /* subscr_addr_add_url -- add address(es) for one url to subscription */
- static void subscr_addr_add_url(struct subscription *s, const char *url,
-				size_t url_len)
-@@ -381,6 +389,7 @@ static void subscr_addr_add_url(struct s
-
-	for (rp = result; rp; rp = rp->ai_next) {
-		struct subscr_addr *a;
-+		struct sockaddr_in *addr = (struct sockaddr_in *) rp->ai_addr;
-
-		/* Limit no. of address to avoid denial of service attack */
-		if (dl_list_len(&s->addr_list) >= MAX_ADDR_PER_SUBSCRIPTION) {
-@@ -389,6 +398,13 @@ static void subscr_addr_add_url(struct s
-			break;
-		}
-
-+		if (!local_network_addr(s->sm, addr)) {
-+			wpa_printf(MSG_INFO,
-+				   "WPS UPnP: Ignore a delivery URL that points to another network %s",
-+				   inet_ntoa(addr->sin_addr));
-+			continue;
-+		}
-+
-		a = os_zalloc(sizeof(*a) + alloc_len);
-		if (a == NULL)
-			break;
-@@ -889,11 +905,12 @@ static int eth_get(const char *device, u
-  * @net_if: Selected network interface name
-  * @ip_addr: Buffer for returning IP address in network byte order
-  * @ip_addr_text: Buffer for returning a pointer to allocated IP address text
-+ * @netmask: Buffer for returning netmask or %NULL if not needed
-  * @mac: Buffer for returning MAC address
-  * Returns: 0 on success, -1 on failure
-  */
- int get_netif_info(const char *net_if, unsigned *ip_addr, char **ip_addr_text,
--		   u8 mac[ETH_ALEN])
-+		   struct in_addr *netmask, u8 mac[ETH_ALEN])
- {
-	struct ifreq req;
-	int sock = -1;
-@@ -919,6 +936,19 @@ int get_netif_info(const char *net_if, u
-	in_addr.s_addr = *ip_addr;
-	os_snprintf(*ip_addr_text, 16, "%s", inet_ntoa(in_addr));
-
-+	if (netmask) {
-+		os_memset(&req, 0, sizeof(req));
-+		os_strlcpy(req.ifr_name, net_if, sizeof(req.ifr_name));
-+		if (ioctl(sock, SIOCGIFNETMASK, &req) < 0) {
-+			wpa_printf(MSG_ERROR,
-+				   "WPS UPnP: SIOCGIFNETMASK failed: %d (%s)",
-+				   errno, strerror(errno));
-+			goto fail;
-+		}
-+		addr = (struct sockaddr_in *) &req.ifr_netmask;
-+		netmask->s_addr = addr->sin_addr.s_addr;
-+	}
-+
- #ifdef __linux__
-	os_strlcpy(req.ifr_name, net_if, sizeof(req.ifr_name));
-	if (ioctl(sock, SIOCGIFHWADDR, &req) < 0) {
-@@ -1025,11 +1055,15 @@ static int upnp_wps_device_start(struct
-
-	/* Determine which IP and mac address we're using */
-	if (get_netif_info(net_if, &sm->ip_addr, &sm->ip_addr_text,
--			   sm->mac_addr)) {
-+			   &sm->netmask, sm->mac_addr)) {
-		wpa_printf(MSG_INFO, "WPS UPnP: Could not get IP/MAC address "
-			   "for %s. Does it have IP address?", net_if);
-		goto fail;
-	}
-+	wpa_printf(MSG_DEBUG, "WPS UPnP: Local IP address %s netmask %s hwaddr "
-+		   MACSTR,
-+		   sm->ip_addr_text, inet_ntoa(sm->netmask),
-+		   MAC2STR(sm->mac_addr));
-
-	/* Listen for incoming TCP connections so that others
-	 * can fetch our "xml files" from us.
-Index: wpa_supplicant-2.9/src/wps/wps_upnp_i.h
-===================================================================
---- wpa_supplicant-2.9.orig/src/wps/wps_upnp_i.h
-+++ wpa_supplicant-2.9/src/wps/wps_upnp_i.h
-@@ -128,6 +128,7 @@ struct upnp_wps_device_sm {
-	u8 mac_addr[ETH_ALEN]; /* mac addr of network i.f. we use */
-	char *ip_addr_text; /* IP address of network i.f. we use */
-	unsigned ip_addr; /* IP address of network i.f. we use (host order) */
-+	struct in_addr netmask;
-	int multicast_sd; /* send multicast messages over this socket */
-	int ssdp_sd; /* receive discovery UPD packets on socket */
-	int ssdp_sd_registered; /* nonzero if we must unregister */
-@@ -158,7 +159,7 @@ struct subscription * subscription_find(
-					const u8 uuid[UUID_LEN]);
- void subscr_addr_delete(struct subscr_addr *a);
- int get_netif_info(const char *net_if, unsigned *ip_addr, char **ip_addr_text,
--		   u8 mac[ETH_ALEN]);
-+		   struct in_addr *netmask, u8 mac[ETH_ALEN]);
-
- /* wps_upnp_ssdp.c */
- void msearchreply_state_machine_stop(struct advertisement_state_machine *a);
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
deleted file mode 100644
index a476cf040e..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 94c401733a5a3d294cc412671166e6adfb409f53 Mon Sep 17 00:00:00 2001
-From: Joshua DeWeese <jdeweese@hennypenny.com>
-Date: Wed, 30 Jan 2019 16:19:47 -0500
-Subject: [PATCH] replace systemd install Alias with WantedBy
-
-According to the systemd documentation "WantedBy=foo.service in a
-service bar.service is mostly equivalent to
-Alias=foo.service.wants/bar.service in the same file." However,
-this is not really the intended purpose of install Aliases.
-
-Upstream-Status: Submitted [hostap@lists.infradead.org]
-
-Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>
----
- wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in | 2 +-
- wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in   | 2 +-
- wpa_supplicant/systemd/wpa_supplicant.service.arg.in         | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
-index 03ac507..da69a87 100644
---- a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
-+++ b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
-@@ -12,4 +12,4 @@ Type=simple
- ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-nl80211-%I.conf -Dnl80211 -i%I
- 
- [Install]
--Alias=multi-user.target.wants/wpa_supplicant-nl80211@%i.service
-+WantedBy=multi-user.target
-diff --git a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
-index c8a744d..ca3054b 100644
---- a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
-+++ b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
-@@ -12,4 +12,4 @@ Type=simple
- ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-wired-%I.conf -Dwired -i%I
- 
- [Install]
--Alias=multi-user.target.wants/wpa_supplicant-wired@%i.service
-+WantedBy=multi-user.target
-diff --git a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
-index 7788b38..55d2b9c 100644
---- a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
-+++ b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
-@@ -12,4 +12,4 @@ Type=simple
- ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-%I.conf -i%I
- 
- [Install]
--Alias=multi-user.target.wants/wpa_supplicant@%i.service
-+WantedBy=multi-user.target
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
deleted file mode 100644
index 59640859dd..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From f7d268864a2660b7239b9a8ff5ad37faeeb751ba Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Wed, 3 Jun 2020 22:41:02 +0300
-Subject: [PATCH 2/3] WPS UPnP: Fix event message generation using a long URL
- path
-
-More than about 700 character URL ended up overflowing the wpabuf used
-for building the event notification and this resulted in the wpabuf
-buffer overflow checks terminating the hostapd process. Fix this by
-allocating the buffer to be large enough to contain the full URL path.
-However, since that around 700 character limit has been the practical
-limit for more than ten years, start explicitly enforcing that as the
-limit or the callback URLs since any longer ones had not worked before
-and there is no need to enable them now either.
-
-Upstream-Status: Backport
-CVE: CVE-2020-12695 patch #2
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/wps/wps_upnp.c       | 9 +++++++--
- src/wps/wps_upnp_event.c | 3 ++-
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/wps/wps_upnp.c b/src/wps/wps_upnp.c
-index 7d4b7439940e..ab685d52ecab 100644
---- a/src/wps/wps_upnp.c
-+++ b/src/wps/wps_upnp.c
-@@ -328,9 +328,14 @@ static void subscr_addr_add_url(struct subscription *s, const char *url,
-	int rerr;
-	size_t host_len, path_len;
-
--	/* url MUST begin with http: */
--	if (url_len < 7 || os_strncasecmp(url, "http://", 7))
-+	/* URL MUST begin with HTTP scheme. In addition, limit the length of
-+	 * the URL to 700 characters which is around the limit that was
-+	 * implicitly enforced for more than 10 years due to a bug in
-+	 * generating the event messages. */
-+	if (url_len < 7 || os_strncasecmp(url, "http://", 7) || url_len > 700) {
-+		wpa_printf(MSG_DEBUG, "WPS UPnP: Reject an unacceptable URL");
-		goto fail;
-+	}
-	url += 7;
-	url_len -= 7;
-
-diff --git a/src/wps/wps_upnp_event.c b/src/wps/wps_upnp_event.c
-index d7e6edcc6503..08a23612f338 100644
---- a/src/wps/wps_upnp_event.c
-+++ b/src/wps/wps_upnp_event.c
-@@ -147,7 +147,8 @@ static struct wpabuf * event_build_message(struct wps_event_ *e)
-	struct wpabuf *buf;
-	char *b;
-
--	buf = wpabuf_alloc(1000 + wpabuf_len(e->data));
-+	buf = wpabuf_alloc(1000 + os_strlen(e->addr->path) +
-+			   wpabuf_len(e->data));
-	if (buf == NULL)
-		return NULL;
-	wpabuf_printf(buf, "NOTIFY %s HTTP/1.1\r\n", e->addr->path);
---
-2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
deleted file mode 100644
index 8a014ef28a..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 85aac526af8612c21b3117dadc8ef5944985b476 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Thu, 4 Jun 2020 21:24:04 +0300
-Subject: [PATCH 3/3] WPS UPnP: Handle HTTP initiation failures for events more
- properly
-
-While it is appropriate to try to retransmit the event to another
-callback URL on a failure to initiate the HTTP client connection, there
-is no point in trying the exact same operation multiple times in a row.
-Replve the event_retry() calls with event_addr_failure() for these cases
-to avoid busy loops trying to repeat the same failing operation.
-
-These potential busy loops would go through eloop callbacks, so the
-process is not completely stuck on handling them, but unnecessary CPU
-would be used to process the continues retries that will keep failing
-for the same reason.
-
-Upstream-Status: Backport
-CVE: CVE-2020-12695 patch #2
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/wps/wps_upnp_event.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/wps/wps_upnp_event.c b/src/wps/wps_upnp_event.c
-index 08a23612f338..c0d9e41d9a38 100644
---- a/src/wps/wps_upnp_event.c
-+++ b/src/wps/wps_upnp_event.c
-@@ -294,7 +294,7 @@ static int event_send_start(struct subscription *s)
-
-	buf = event_build_message(e);
-	if (buf == NULL) {
--		event_retry(e, 0);
-+		event_addr_failure(e);
-		return -1;
-	}
-
-@@ -302,7 +302,7 @@ static int event_send_start(struct subscription *s)
-					 event_http_cb, e);
-	if (e->http_event == NULL) {
-		wpabuf_free(buf);
--		event_retry(e, 0);
-+		event_addr_failure(e);
-		return -1;
-	}
-
---
-2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
deleted file mode 100644
index 8c90fa3421..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Mon, 9 Nov 2020 11:43:12 +0200
-Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
- client
-
-Parsing and copying of WPS secondary device types list was verifying
-that the contents is not too long for the internal maximum in the case
-of WPS messages, but similar validation was missing from the case of P2P
-group information which encodes this information in a different
-attribute. This could result in writing beyond the memory area assigned
-for these entries and corrupting memory within an instance of struct
-p2p_device. This could result in invalid operations and unexpected
-behavior when trying to free pointers from that corrupted memory.
-
-Upstream-Status: Backport
-CVE: CVE-2021-0326
-
-Reference to upstream patch:
-[https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e]
-
-Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
-Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- src/p2p/p2p.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
-index a08ba02..079270f 100644
---- a/src/p2p/p2p.c
-+++ b/src/p2p/p2p.c
-@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
- 	dev->info.config_methods = cli->config_methods;
- 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
- 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
-+	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
-+		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
- 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
- 		  dev->info.wps_sec_dev_type_list_len);
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
deleted file mode 100644
index 004b1dbd19..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Tue, 8 Dec 2020 23:52:50 +0200
-Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
-
-p2p_add_device() may remove the oldest entry if there is no room in the
-peer table for a new peer. This would result in any pointer to that
-removed entry becoming stale. A corner case with an invalid PD Request
-frame could result in such a case ending up using (read+write) freed
-memory. This could only by triggered when the peer table has reached its
-maximum size and the PD Request frame is received from the P2P Device
-Address of the oldest remaining entry and the frame has incorrect P2P
-Device Address in the payload.
-
-Fix this by fetching the dev pointer again after having called
-p2p_add_device() so that the stale pointer cannot be used.
-
-Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-
-Upstream-Status: Backport
-CVE: CVE-2021-27803
-
-Reference to upstream patch:
-[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- src/p2p/p2p_pd.c | 12 +++++-------
- 1 file changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
-index 3994ec0..05fd593 100644
---- a/src/p2p/p2p_pd.c
-+++ b/src/p2p/p2p_pd.c
-@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
- 			goto out;
- 		}
- 
-+		dev = p2p_get_device(p2p, sa);
- 		if (!dev) {
--			dev = p2p_get_device(p2p, sa);
--			if (!dev) {
--				p2p_dbg(p2p,
--					"Provision Discovery device not found "
--					MACSTR, MAC2STR(sa));
--				goto out;
--			}
-+			p2p_dbg(p2p,
-+				"Provision Discovery device not found "
-+				MACSTR, MAC2STR(sa));
-+			goto out;
- 		}
- 	} else if (msg.wfd_subelems) {
- 		wpabuf_free(dev->info.wfd_subelems);
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
deleted file mode 100644
index e2540fc26b..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 13 Mar 2021 18:19:31 +0200
-Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
-
-The supported hash algorithms do not use AlgorithmIdentifier parameters.
-However, there are implementations that include NULL parameters in
-addition to ones that omit the parameters. Previous implementation did
-not check the parameters value at all which supported both these cases,
-but did not reject any other unexpected information.
-
-Use strict validation of digest algorithm parameters and reject any
-unexpected value when validating a signature. This is needed to prevent
-potential forging attacks.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-Upstream-Status: Backport
-CVE: CVE-2021-30004
-
-Reference to upstream patch:
-[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- src/tls/pkcs1.c  | 21 +++++++++++++++++++++
- src/tls/x509v3.c | 20 ++++++++++++++++++++
- 2 files changed, 41 insertions(+)
-
-diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
-index 141ac50..e09db07 100644
---- a/src/tls/pkcs1.c
-+++ b/src/tls/pkcs1.c
-@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
-+		    hdr.payload, hdr.length);
- 
- 	pos = hdr.payload;
- 	end = pos + hdr.length;
-@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
-+		    hdr.payload, hdr.length);
- 	da_end = hdr.payload + hdr.length;
- 
- 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
-@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
-+		    next, da_end - next);
-+
-+	/*
-+	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
-+	 * omit the parameters, but there are implementation that encode these
-+	 * as a NULL element. Allow these two cases and reject anything else.
-+	 */
-+	if (da_end > next &&
-+	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
-+	     !asn1_is_null(&hdr) ||
-+	     hdr.payload + hdr.length != da_end)) {
-+		wpa_printf(MSG_DEBUG,
-+			   "PKCS #1: Unexpected digest algorithm parameters");
-+		os_free(decrypted);
-+		return -1;
-+	}
- 
- 	if (!asn1_oid_equal(&oid, hash_alg)) {
- 		char txt[100], txt2[100];
-diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
-index 1bd5aa0..bf2289f 100644
---- a/src/tls/x509v3.c
-+++ b/src/tls/x509v3.c
-@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
- 
- 	pos = hdr.payload;
- 	end = pos + hdr.length;
-@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
-+		    hdr.payload, hdr.length);
- 	da_end = hdr.payload + hdr.length;
- 
- 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
-@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
-+		    next, da_end - next);
-+
-+	/*
-+	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
-+	 * omit the parameters, but there are implementation that encode these
-+	 * as a NULL element. Allow these two cases and reject anything else.
-+	 */
-+	if (da_end > next &&
-+	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
-+	     !asn1_is_null(&hdr) ||
-+	     hdr.payload + hdr.length != da_end)) {
-+		wpa_printf(MSG_DEBUG,
-+			   "X509: Unexpected digest algorithm parameters");
-+		os_free(data);
-+		return -1;
-+	}
- 
- 	if (x509_sha1_oid(&oid)) {
- 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
similarity index 80%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 25cd8ef82c..68d664974f 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -4,9 +4,9 @@ DESCRIPTION = "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac OS X, and
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=279b4f5abb9c153c285221855ddb78cc \
-                    file://README;beginline=1;endline=56;md5=e7d3dbb01f75f0b9799e192731d1e1ff \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=0a8b56d3543498b742b9c0e94cc2d18b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
+                    file://README;beginline=1;endline=56;md5=e3d2f6c2948991e37c1ca4960de84747 \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=76306a95306fee9a976b0ac1be70f705"
 DEPENDS = "dbus libnl"
 RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -25,17 +25,9 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
-           file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
-           file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
-           file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
-           file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
-           file://CVE-2021-0326.patch \
-           file://CVE-2021-27803.patch \
-           file://CVE-2021-30004.patch \
           "
-SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
-SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
+SRC_URI[md5sum] = "d26797fcb002898d4ee989179346e1cc"
+SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
 CVE_PRODUCT = "wpa_supplicant"
 
-- 
2.17.1


