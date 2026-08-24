Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEE2C61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:05 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14165.1787569318363138362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QiXxA4pM;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=927; q=dns/txt;
  s=iport01; t=1787569318; x=1788778918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N6il3btERSb6qyUx0WJsxjZ1wx4zq9AvyDb6bfIB0m0=;
  b=QiXxA4pM6DGkhDHx0aL0UXsdNYqIFOiIZo6sWi1Wh1JO6KX9V3qQ4X6J
   Lcbpx/rt0/5bBO2U5+psk9B9woQqW4l52GkfHt3M0uspwrk+s/Rxnnye8
   ooGzQeKrcFhrbEqcUyliwiMh5CV/7uPrLiAFlStQIy+DSLWyGVhbV3uX3
   /ooGYhEpcZ4Lat1xZQkbSAUhvVWUaB+nsq+Zdl231rwxfF8APYIeGqXUM
   +1LacRLWsYQdsDRas9u+9KVVFpBrvk06X30or36bUA31ctgq3R9nQhQ9F
   Eh5WCx6Kdzea06Ao/TKUxCPm7upUkAHVT7604eE2dSr/O+PURWj4zNXKA
   w==;
X-CSE-ConnectionGUID: bQJyp1JIQ4eJ2zmGu7JeuQ==
X-CSE-MsgGUID: iyQSLitlSkupgwbNqMiOeA==
X-IPAS-Result: =?us-ascii?q?A0D3AgAuI4xq/5IQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPCaYIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDJNaSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWQBEheBCYIHAoJaggUCAUlDD?=
 =?us-ascii?q?gdHIgsYDUgRLDcUGQQ+bgeOXh+CRwE8URmCABaUJZF6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgW8HLkaBE3AVgyIJShkP3lwnMgIBPAcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:8ccnhq7weWEPOsV0XBSm3gxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mAbX22BbvfZNGD8ctpxbN6x9E5UscXcyt9mTAJsriw8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eN7Q66/4uI0B3q
 fE6ciIIQQ3cpe+r+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Mn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOFKoLXGJ0M9qqej
 mPXxl/dAw0eD9+C0TWa+FS1o+7okAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:8lycbaG1nNalYoTRpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:sjU/N2w0rhavmQK8pz1wBgUeI+I0aiT/7U6MLm3iG2NGVeK3REKprfY=
X-Talos-MUID: 9a23:C0maCQRIQaP2dL6SRXTtlQhZEMZ055+tFVgCjp8gouyFEiFZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="818865501"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 7FF4C1800016E;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 1AE39CC124A; Mon, 24 Aug 2026 04:01:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] glib-2.0: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:57 -0700
Message-Id: <20260824110157.25841-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244087

From: Devansh Patel <devanshp@cisco.com>

The current product-only mapping generates a vendor-wildcard CPE.
gnome:glib is the active NVD dictionary CPE and configuration identity,
and is also used by CNA affected-data records for the packaged GNOME
GLib source.

This changes the generated product identity. With the frozen
sbom-cve-check database, the 35-entry CVE report is unchanged, so this is
an identity correction with no CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
index ef80cc47cf..f401ea9c23 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
@@ -1,2 +1,3 @@
 require glib.inc
 
+CVE_PRODUCT = "gnome:glib"
-- 
2.35.6

