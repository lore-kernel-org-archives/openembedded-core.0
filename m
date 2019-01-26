Return-Path: <>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 39DEC7C410
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:13 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k19-v6so10545987lji.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zgrh0u6+aCcKH/BhSMZQyAOWXaa1f4SoHqAYj+DzOmU=;
	b=WtZY/xVDROabfMvBbQS6CgPQss0heY75U4eibhjUq9/Q0c169VZYjEkBz/vI/siEEs
	H7HbeYCMrwbSM8v2RndsNqsoCrnb9NNjAFrbK7Es9a/3PTSzIWpsH9pa+BBAH04d1Q1F
	8PIHMjzVefmnitWMc3l2TDZvMjQFrVCxNdVEotDmGhfaGL70w27ffWm11fWfBoV+BlDj
	maZv2BKsbWf6tg68IruQbg9/mjhav9A3IOgHn2/psTElPXU169JLG9TaRdXrC8A0DRYc
	lR71dtei8enQUV0a8WEbaLNmGJVjQur1wVCLu6R+KMTUPwtnKuSefKgE+aJmRNJxVf0k
	6SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zgrh0u6+aCcKH/BhSMZQyAOWXaa1f4SoHqAYj+DzOmU=;
	b=BRv/uEXmINKgeW1beglzIfTNZiFBBfh0QrYf6hoas2vKrncuxB+DnsAVNEQreNEMQi
	ew7bP+k9s86vFIq1azxpd5NoxToPLFXnllyuNAWQxh1ATJ3N2uEtyrJZbLkFQUwvx3u9
	U7j5H5OYNMLH1nkz11fswat+035NZSbUWojjdUECKuUm0BZOgqEAkrr43uPYnPmRrZDS
	nOD78fYv6YuXWr/pDRQ6lx9NzoLyA1lEEs1YA2c4tmWJCR6NmDHylrvV8wihkX1ME5nU
	R0YejNeKqCqxJsQSZUai4JPmECcYXkvHDWBrkM1AhWH/4mczn7h908zKjA2czK+LOeyG
	VRTA==
X-Gm-Message-State: AJcUukcFcvyCopHRBOEXFuw3q2i8F4Ul8JPMe7dkM8AbHbBwPPYAouiW
	mMl+zO/dEcc/IzmGt9UCxjNB+x7FYZg=
X-Google-Smtp-Source: ALg8bN4RCrjO54VaM0NWaADwXVPmrVj2RU6P09yMF7McD/FWJh2BpZonahLsZEDlp9pHyoMZFHiC/A==
X-Received: by 2002:a2e:12d0:: with SMTP id
	77-v6mr11715725ljs.132.1548507614437; 
	Sat, 26 Jan 2019 05:00:14 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	f18sm2197140lfk.18.2019.01.26.05.00.13
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:13 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:58 +0200
Message-Id: <1548507480-22805-5-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH 4/6] connman: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 85b76e52d206 "connman: update to 1.36" dropped
0001-inet-Add-prefixlen-to-iproute_default_function.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 ...Add-prefixlen-to-iproute_default_function.patch | 63 ----------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch b/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
deleted file mode 100644
index dd7b356..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 508dc60a1f0758ebc586b6b086478a176d493086 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Thu, 5 Oct 2017 09:34:41 +0100
-Subject: [PATCH 1/4] inet: Add prefixlen to iproute_default_function
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-Add prefixlen parameter to this function in preparation for using
-it also in creating subnet route later, e.g.
-
-default via 192.168.100.1 dev eth0
-192.168.100.0/24 dev eth0
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=edda5b695de2ee79f02314abc9b46fdd46b388e1]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/inet.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/inet.c b/src/inet.c
-index b887aa0..ab8aec8 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -2796,7 +2796,7 @@ int __connman_inet_del_fwmark_rule(uint32_t table_id, int family, uint32_t fwmar
- }
- 
- static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
--			const char *gateway)
-+			const char *gateway, unsigned char prefixlen)
- {
- 	struct __connman_inet_rtnl_handle rth;
- 	unsigned char buf[sizeof(struct in6_addr)];
-@@ -2829,6 +2829,7 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
- 	rth.req.u.r.rt.rtm_protocol = RTPROT_BOOT;
- 	rth.req.u.r.rt.rtm_scope = RT_SCOPE_UNIVERSE;
- 	rth.req.u.r.rt.rtm_type = RTN_UNICAST;
-+	rth.req.u.r.rt.rtm_dst_len = prefixlen;
- 
- 	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req), RTA_GATEWAY,
- 								buf, len);
-@@ -2860,7 +2861,7 @@ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex,
- {
- 	/* ip route add default via 1.2.3.4 dev wlan0 table 1234 */
- 
--	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway);
-+	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, 0);
- }
- 
- int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
-@@ -2868,7 +2869,7 @@ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
- {
- 	/* ip route del default via 1.2.3.4 dev wlan0 table 1234 */
- 
--	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway);
-+	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, 0);
- }
- 
- int __connman_inet_get_interface_ll_address(int index, int family,
--- 
-2.7.4
-
-- 
1.9.1


