Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14729.1795513637555616194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XCtRywGg;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5488; q=dns/txt;
  s=iport01; t=1795513638; x=1796723238;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dTfKNo76C2eoCqGxT74Ijqp360HT0tun/4JrJQEh8eA=;
  b=XCtRywGgdbrNAMox6P+xUyqcrDPspgZi6KO8LH9NgvhZKU0ZdEsKfUI2
   O7oxafLyEmB8FwPFvzJxgN8hA+EUNOmIt4orT/o5zVgnyyajCIpVjGSlK
   JmD4ij7dPFdvZlOOW7SQA4Df4EvmF7hYhC+XSjl7GXWFS3qozftR5Fl2+
   Rixr8KEODpdIx9k/DfcmMl5gu512Z+1yDJ/2mOXttMXM8Cwigunvgw6f7
   0Mmu8lOzgewsLlmMeZR0OACZ9l0/PmI4nOxJMkRZfpjkgS/7bBA9Zej1i
   u1LIzjzvnC/DGAjwF8SrmYxdaDKe/yitGmFHs3pQwvXOvVT5qJReSAgxX
   g==;
X-CSE-ConnectionGUID: AebAihtIQuSFx4vwaQtFYQ==
X-CSE-MsgGUID: ukFpPbc6SDCVWZvfIcEaxw==
X-IPAS-Result: =?us-ascii?q?A0BLAgBHXAVr/8xK/pBaglmCV3VgQ0mEV49TgiEDnimBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMjBAsBVgkTAwECAwImAgIrIwgQCYMCAYJ0AxGfP?=
 =?us-ascii?q?5pSGzd6fzOBAYNbBQkCQ1DbMwEFBhQBgQouhUKDIAGFA10YAYR9JxsbgXKBF?=
 =?us-ascii?q?YNqgQWBXAEBA4E1hASCagSCIoEMgVQejHkCgU+ISUiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUFIMaAYENASt7C?=
 =?us-ascii?q?lU6k0YHkkCBNZ9cCiiDeYwklToaM6pymQiOCpYBUIRqgWg8gUcLB3AVgyJTG?=
 =?us-ascii?q?Q9XjVQDCwuDYIF/gxTJSCYyCzIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:ePHcWaxzljBf+K8AGKt6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVWy
 mtMWT/Sa6rbZmLyL94ibt6/8UsAvJSHmoNqTQFtr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD5MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGg7N6QZ+vpWOHx12
 +xENi8EVwytttvjldpXSsE07igiBMDmJsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkycC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oa3b4GPK4zRLSlTtlubi
 Hr+9W+nOT0xCuOt1zSk+V+llvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:cbR1RKjO3Mg+WNYVb12JXeY1LHBQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AWeGNk2u3/CPSWsZnpT9hGBsC6IsMf3f0zXfMAna?=
 =?us-ascii?q?lMkh5FKOKQGaM1pJdxp8=3D?=
X-Talos-MUID: 9a23:KH3z6AnDh4l/wTYY08e4dnp/N+lw266lVnshuqs5ideKFCddMieC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62732983"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:47:15 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 44EBA180006C5
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:15 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id F056ACC2EFA; Tue, 24 Nov 2026 01:47:13 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/3] qemu: fix CVE-2026-3196
Date: Tue, 24 Nov 2026 01:47:12 -0800
Message-Id: <20261124094713.1557189-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124094713.1557189-1-devanshp@cisco.com>
References: <20261124094713.1557189-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250992
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.0 backport for CVE-2026-3196.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/83e9328eaacb2c4bd8d78d49306ac425dc1ee369
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3196

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-3196.patch             | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d13d2fc..d3e7362 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -55,6 +55,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-2243.patch \
            file://CVE-2026-3195_p1.patch \
            file://CVE-2026-3195_p2.patch \
+           file://CVE-2026-3196.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch
new file mode 100644
index 0000000..3102c02
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3196.patch
@@ -0,0 +1,96 @@
+From e224e5cc8d400ffa8e8aa84dcf6f0a8a80d4dad8 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/83e9328eaacb2c4bd8d78d49306ac425dc1ee369]
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
+index 8889abb62..742596481 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -158,7 +158,7 @@ static virtio_snd_pcm_set_params *virtio_snd_pcm_get_params(VirtIOSound *s,
+ static void virtio_snd_handle_pcm_info(VirtIOSound *s,
+                                        virtio_snd_ctrl_command *cmd)
+ {
+-    uint32_t stream_id, start_id, count, size;
++    uint32_t stream_id, start_id, count, size, tmp;
+     virtio_snd_pcm_info val;
+     virtio_snd_query_info req;
+     VirtIOSoundPCMStream *stream = NULL;
+@@ -184,14 +184,37 @@ static void virtio_snd_handle_pcm_info(VirtIOSound *s,
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

