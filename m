Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14484.1795513614619777830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UiPC2rsz;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5578; q=dns/txt;
  s=iport01; t=1795513614; x=1796723214;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G1UmFU6Gmohc4oG8BEnAB+8RlyOQG2T+Amxj6OzPXPM=;
  b=UiPC2rsz2vlEZN267/lbpEjbicgrvKEsrPGU5nPsJvO3dOjN50tXbqxp
   t9jpjncIX8AmrTGzZWnr+CYXtGCKx0CxumyeXDGWjDgzY9ov9eIYXdQW9
   aGGCrS+8rRyo1/S/7GfOBS7w6ibU5QFoyVCYOvc3sItQtEiS7cGB0N0rS
   tU3gRpZdpmc6tE5DC9G6UTmNpErhduufc4Dt7foPH0l9XDclvHbzzA8jQ
   /ZQ1Oea7doPmWrQMwyDWzSgIP6+41S3vbSjMlVN3EpUjxuUqtTEz5AFOM
   kNsFLFAHcO4rn4k7k6QOWhr1MQr9MrXSJyvCZhItQo5odfANuJ1BV4SS4
   w==;
X-CSE-ConnectionGUID: Tk28hK9BQsivsxDxkWdxKA==
X-CSE-MsgGUID: sW4Ch+C6Q9Wqw3qAB8p41A==
X-IPAS-Result: =?us-ascii?q?A0BLAgBeWgVr/9NK/pBaglmCV3VgQ0mEV49TgiEDnimBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMjBAsBVgkTAwECAwImAgIrIwgQCYMCAYJ0AxGfQ?=
 =?us-ascii?q?ppSGzd6fzOBAYNbBQkCQ1DbMwELFAGBCi6FQoMgAYUDXRgBhH0nGxuBcoEVg?=
 =?us-ascii?q?2qBBYFcAQEDgTWEBIJqBIIigQyBVB5tjAwCgU+ISUiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUFIMaAYENASsiW?=
 =?us-ascii?q?QpVOpNGB5JAgTWfXAoog3mMJJU6GjOFW6UXmQiOCpYBUIRqgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPV41UAwsLg2CBf4MUyUgmMgsyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:tbgWR6+Uk/00AaB1ky3NDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TYWUWyBO/bYZDf8Kdp0Yduw9U5Vu5/WndVrTFNr+HpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kKPtdI+sUmK1hV9
 OIDOBwdbS+Pl8GflefTpulE3qzPLeHiMZlavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOnWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaIaJIozWH625mG6Dm
 T7t/yfSXChLC8WAkiOs2CK02rbmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:krgdVaC0n/6uyu3lHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AVJ+xi2pXhIJwP5DR8yLRWJfmUfwmKC3d7yb6GlS?=
 =?us-ascii?q?5F315ZK2WdlOA24oxxg=3D=3D?=
X-Talos-MUID: 9a23:ghY1WghwgwFgcdbhWkMWRMMpL/g0yKTtIx40wKofpJKdHAYgI2vEpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60440842"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:46:50 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 78CB11800031B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:46:50 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 28D04CC2EFA; Tue, 24 Nov 2026 01:46:49 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/3] qemu: fix CVE-2026-3196
Date: Tue, 24 Nov 2026 01:46:48 -0800
Message-Id: <20261124094649.1556576-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124094649.1556576-1-devanshp@cisco.com>
References: <20261124094649.1556576-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250989
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-3196.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/d84fbf241d0322f19adfbe466c60bed5f50de262
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3196

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-3196.patch             | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f40a14d..3f494e1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-48914.patch \
            file://CVE-2026-3195_p1.patch \
            file://CVE-2026-3195_p2.patch \
+           file://CVE-2026-3196.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch
new file mode 100644
index 0000000..0c067c1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch
@@ -0,0 +1,96 @@
+From 7fde9475930e90376791e87c5c99dbb7baf18c36 Mon Sep 17 00:00:00 2001
+From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Date: Fri, 20 Feb 2026 11:40:14 +0200
+Subject: [PATCH] virtio-snd: handle 5.14.6.2 for PCM_INFO properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The section 5.14.6.2 of the VIRTIO spec says:
+
+  5.14.6.2 Driver Requirements: Item Information Request
+
+  - The driver MUST NOT set start_id and count such that start_id +
+    count is greater than the total number of particular items that is
+    indicated in the device configuration space.
+
+  - The driver MUST provide a buffer of sizeof(struct virtio_snd_hdr) +
+    count * size bytes for the response.
+
+While we performed some check for the second requirement, it failed to
+check for integer overflow.
+
+Add also a check for the first requirement, which should limit exposure
+to any overflow, since realistically the number of streams will be low
+enough in value such that overflow is improbable.
+
+CVE: CVE-2026-3196
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d84fbf241d0322f19adfbe466c60bed5f50de262]
+
+Cc: qemu-stable@nongnu.org
+Reported-by: 罗铭源 <myluo24@m.fudan.edu.cn>
+Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20260220-virtio-snd-series-v1-3-207c4f7200a2@linaro.org>
+(cherry picked from commit 61679d7dcfa2dffc8fb115aa19b09e0e7cf5ea5c)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ hw/audio/virtio-snd.c | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
+index eecf3c3de..ede3cd5b8 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -156,7 +156,7 @@ static virtio_snd_pcm_set_params *virtio_snd_pcm_get_params(VirtIOSound *s,
+ static void virtio_snd_handle_pcm_info(VirtIOSound *s,
+                                        virtio_snd_ctrl_command *cmd)
+ {
+-    uint32_t stream_id, start_id, count, size;
++    uint32_t stream_id, start_id, count, size, tmp;
+     virtio_snd_pcm_info val;
+     virtio_snd_query_info req;
+     VirtIOSoundPCMStream *stream = NULL;
+@@ -182,14 +182,37 @@ static void virtio_snd_handle_pcm_info(VirtIOSound *s,
+     count = le32_to_cpu(req.count);
+     size = le32_to_cpu(req.size);
+ 
+-    if (iov_size(cmd->elem->in_sg, cmd->elem->in_num) <
+-        sizeof(virtio_snd_hdr) + size * count) {
++    /*
++     * 5.14.6.2 Driver Requirements: Item Information Request
++     * "The driver MUST NOT set start_id and count such that start_id + count
++     * is greater than the total number of particular items that is indicated
++     * in the device configuration space."
++     */
++    if (start_id > s->snd_conf.streams
++        || !g_uint_checked_add(&tmp, start_id, count)
++        || start_id + count > s->snd_conf.streams) {
++        error_report("pcm info: start_id + count is greater than the total "
++                     "number of streams, got: start_id = %u, count = %u",
++                     start_id, count);
++        cmd->resp.code = cpu_to_le32(VIRTIO_SND_S_BAD_MSG);
++        return;
++    }
++
++    /*
++     * 5.14.6.2 Driver Requirements: Item Information Request
++     * "The driver MUST provide a buffer of sizeof(struct virtio_snd_hdr) +
++     * count * size bytes for the response."
++     */
++    if (!g_uint_checked_mul(&tmp, size, count)
++        || !g_uint_checked_add(&tmp, tmp, sizeof(virtio_snd_hdr))
++        || iov_size(cmd->elem->in_sg, cmd->elem->in_num) <
++           sizeof(virtio_snd_hdr) + size * count) {
+         /*
+          * TODO: do we need to set DEVICE_NEEDS_RESET?
+          */
+         error_report("pcm info: buffer too small, got: %zu, needed: %zu",
+                 iov_size(cmd->elem->in_sg, cmd->elem->in_num),
+-                sizeof(virtio_snd_pcm_info));
++                sizeof(virtio_snd_pcm_info) * count);
+         cmd->resp.code = cpu_to_le32(VIRTIO_SND_S_BAD_MSG);
+         return;
+     }
-- 
2.35.6

