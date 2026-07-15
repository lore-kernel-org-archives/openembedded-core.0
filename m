Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7318C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:25:05 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22.1784136297670579124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AgmlOsqY;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4843; q=dns/txt;
  s=iport01; t=1784136297; x=1785345897;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Julhq5YmtL1x/3ex1NdNt2nqhcjn+DJRE3H+9Wb2gns=;
  b=AgmlOsqYWXBam5SWZJAvxdA4LnSilB1gvQ5F5xE+YgPNfANwkUjvXZD+
   gy4giwYQq51VZMuqR8HO+2IaLAUoieNxXaPqeRZUVciEp7E4YTuGuINyY
   nG7P6GjKSUWiPIOlKhBWUJk/hTrd3FD730qf50jaR0e5oYb9QjVrn45IS
   nCc9F0jC9rqGadsACrEzN34FFcMSGdZaNr3hPa9TQ0EVx0Lx173IjPw5f
   WWafnkyyK469O4X/tNCe3ZH9VT3ud+/f12WIC2paZrSAY9OTlrP5J1mVB
   jSmAXO5tnHorUNoWhf4CKen1G29Q2i+vWzSEq4Id7nqK9bC/Ebb9b/M0E
   g==;
X-CSE-ConnectionGUID: Hk/rTgrZTySplWYGeieqUw==
X-CSE-MsgGUID: 3o1RKKa0R+CpbF8rLVjEgA==
X-IPAS-Result: =?us-ascii?q?A0BLAgDtwVdq/5T/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA4ETnQiBfg8BAQEPRA0EAQGFBQKNUQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwEYARsiHAMBAgMCJgICKyMIE?=
 =?us-ascii?q?AEIgwIBgnQDEQa9Pnp/M4EBgygBPwICQAFQ2y4BCxQBgQouhT+DHQGFAlwYA?=
 =?us-ascii?q?YR8JxsbgXKBFYJzdoEFgVwBA4FGg3OCagSCIoEMgVoej3lIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2BUIEChHYjHwM5f4EwdUp3LWoSF?=
 =?us-ascii?q?4FRghSBGgMLGA1IESw3FBsEPQFuB41KJYI/MV0BKQKCAy8cpVGhEgoog3WMI?=
 =?us-ascii?q?ZU6GjOqbAuYfY4KlTaBGoRpgWg8gUcLB3AVgyIJShkPji0LC4VfgxTJBTw1A?=
 =?us-ascii?q?gEIMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:FK1z66qRWoydzkjTaMO0U9+ABDZeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmObPaCZjGmKItxO9i28EIAuJaEyoNqSlBtqSE0FSpB9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8U435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sZ0Rnty+
 uYqFCE2dhS8ts27wb+id/Y506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHJ0MwRfC+
 jquE2LRWRZDDv+8wGK/sVm0jMGfhwfFWq8dPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvpUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:kys3OK0sgsqf/bbyuRihhQqjBJAkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faaslgssR0b9OxofZPwIk80lqQFhLX5Q43CYOCOggLBR+tfBMnZsl/d8kbFmdK1u5
 0NT0EHMr3NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AJwqq4GmHbMe1n/DsL72DhnAryk3XOV3ei23sLFW?=
 =?us-ascii?q?KNXdSULmqeHCd+a59rtU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AlNfZ7g9R5qtuY3+E/dFWwnKQf5xvup6NK0lVq9Y?=
 =?us-ascii?q?to8OqZTZUBTWwgx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510179240"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:24:56 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8776218000147
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:56 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id A838FCC037D; Wed, 15 Jul 2026 22:54:54 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 6/6] glib-2.0: fix CVE-2026-58015
Date: Wed, 15 Jul 2026 22:53:30 +0530
Message-Id: <20260715172330.1149253-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241031

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58015. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58015

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58015.patch    | 95 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015.patch
new file mode 100644
index 0000000000..4af0c1aa29
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015.patch
@@ -0,0 +1,95 @@
+From 90119b27e94759d942d2e8eb55b13d17237b423d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:47:30 +0100
+Subject: [PATCH] gdbusauthmechanismsha1: Validate cookie context
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without validation, the server could send a malicious context which
+contains path traversal characters, allowing it to exfiltrate a SHA-1
+hashed copy of arbitrary data from the client’s file system.
+
+To exploit this successfully would require the client to choose to
+connect peer-to-peer to a malicious D-Bus server and to choose the SHA-1
+authentication mechanism in preference to all the other mechanisms. This
+is vanishingly unlikely.
+
+Fixes: #3931
+
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a]
+
+Backport Changes:
+- Added <stdint.h> include because the target branch does not otherwise
+  expose uint8_t used by the upstream validation code during native builds.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit db9c8fae398b0c457e660ce63dd5afec8993046a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/gdbusauthmechanismsha1.c | 37 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
+index c8aa089..7f348d8 100644
+--- a/gio/gdbusauthmechanismsha1.c
++++ b/gio/gdbusauthmechanismsha1.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ 
++#include <stdint.h>
+ #include <string.h>
+ #include <fcntl.h>
+ #include <errno.h>
+@@ -1198,6 +1198,34 @@ mechanism_client_initiate (GDBusAuthMechanism   *mechanism,
+   return initial_response;
+ }
+ 
++/* Context names must be valid ASCII, nonzero length, and may not contain the
++ * characters slash ("/"), backslash ("\"), space (" "), newline ("\n"),
++ * carriage return ("\r"), tab ("\t"), or period (".").
++ *
++ * See https://dbus.freedesktop.org/doc/dbus-specification.html#auth-mechanisms-sha */
++static gboolean
++validate_cookie_context (const char *cookie_context)
++{
++  size_t i = 0;
++
++  g_return_val_if_fail (cookie_context != NULL, FALSE);
++
++  for (i = 0; cookie_context[i] != '\0'; i++)
++    {
++      if ((uint8_t) cookie_context[i] >= 128 ||
++          cookie_context[i] == '/' ||
++          cookie_context[i] == '\\' ||
++          cookie_context[i] == ' ' ||
++          cookie_context[i] == '\n' ||
++          cookie_context[i] == '\r' ||
++          cookie_context[i] == '\t' ||
++          cookie_context[i] == '.')
++        return FALSE;
++    }
++
++  return (i > 0);
++}
++
+ static void
+ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+                                const gchar          *data,
+@@ -1232,6 +1260,14 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+     }
+ 
+   cookie_context = tokens[0];
++  if (!validate_cookie_context (tokens[0]))
++    {
++      g_free (m->priv->reject_reason);
++      m->priv->reject_reason = g_strdup_printf ("Malformed cookie_context '%s'", tokens[0]);
++      m->priv->state = G_DBUS_AUTH_MECHANISM_STATE_REJECTED;
++      goto out;
++    }
++
+   cookie_id = g_ascii_strtoll (tokens[1], &endp, 10);
+   if (*endp != '\0')
+     {
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 9f1cdbe544..d3934fbee5 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -52,6 +52,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
            file://CVE-2026-58014.patch \
+           file://CVE-2026-58015.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


