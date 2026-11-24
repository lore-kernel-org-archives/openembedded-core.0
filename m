Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14482.1795513613142364474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XRoiptaz;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6335; q=dns/txt;
  s=iport01; t=1795513613; x=1796723213;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBVklBdsFVxeYAiO9SgO+piClyKjQdH/2bOiXth3STM=;
  b=XRoiptazOVPutPdVc9UFpLfwYPdUYgYbkFr98mBx7HwT0n8+ulO4LeYt
   D7x4OE5R41F66vCw0Hx6ISE1g42HMvr4ISRqd76e4LH/kLBEVljydhpZ1
   zycshzietxSuACvOcIehaLgoPj26jIVU5qWd/I4aI6rnUncK9RxaDlAeb
   Iny+8DQLb1RBBRArLoqXbN8tlka5GtLYCGZb3eRkFOFQ4u7pbZHW8sQXx
   aPOWwDvZC5errNutn14w+GTr/NNOAaW63lWI5v3VS809kMeUpj6bgkQ+c
   6IrM5DvSOeH/448EWuV0vvb7YbY1yB3DTdSxqcyj3U0bSQGfgHSKrMBSv
   g==;
X-CSE-ConnectionGUID: F1p4U9IRSiWFt6TeRmdVGA==
X-CSE-MsgGUID: dHZpmyUoTEa4FWlzO0Dq3A==
X-IPAS-Result: =?us-ascii?q?A0BDAgBZWwVr/85K/pBaglmCV3VgQ0mUKoIhniyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgEtCwFyAwECWiMhgwIBgnQDEboSGzeBeTOBAYNbBQkCQ1DbM?=
 =?us-ascii?q?wELFAGBOIVCiCRdGAGEfScbG4FyhH+BBYFcAQEDiCMEgiKBDIFUHm2MDAKBT?=
 =?us-ascii?q?4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdg?=
 =?us-ascii?q?SsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeUFIMaASwQUQErIlmBGTQnpTKhEQoog3mMJJU6GjOEBIFXkkOSVJkIj?=
 =?us-ascii?q?gqWUYRqgWg8gUcLB3AVgyIJShkPV41UAwsLg2CBf4MUyUgmMgsyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:GrtG36wBIoOF0jCh6Ix6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 moXXGiEOfeIZWfzKN5zPI+w/U0BsZ+DytBgHApk+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG9vJdElq8dNOmBx2
 +BGFD03axy9qMvjldpXSsE07igiBMDmJsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyeC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oa1aYuLKoPWLSlTtkq4l
 HrD7ln+PjwTaPKgzSiiql613caayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:MLXKqKOXpLdbwMBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:9M0gHWNxWauXB+5DdnB/qHNFO/oec0Lz0CnsLnW9BVhGYejA
X-Talos-MUID: 9a23:bMFnbgn9TU0fnUEzNtE1dnpuFPVw5rWTD3wgmMkohM2WEnRcImy02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60196874"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:46:50 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 6C1EA1800039B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:46:50 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 23853CC2EF3; Tue, 24 Nov 2026 01:46:49 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/3] qemu: fix CVE-2026-3195
Date: Tue, 24 Nov 2026 01:46:47 -0800
Message-Id: <20261124094649.1556576-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250987
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-3195.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/a730f98a7a199706c44dd86a39d961e80e2ad18f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3195

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2026-3195_p1.patch          | 48 ++++++++++++++++
 .../qemu/qemu/CVE-2026-3195_p2.patch          | 55 +++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6a217cd..f40a14d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p2.patch \
            file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
            file://CVE-2026-48914.patch \
+           file://CVE-2026-3195_p1.patch \
+           file://CVE-2026-3195_p2.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch
new file mode 100644
index 0000000..e4037a3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch
@@ -0,0 +1,48 @@
+From 3e37ca953a3da622e96f85912e162d22a7b11c1d Mon Sep 17 00:00:00 2001
+From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Date: Fri, 20 Feb 2026 11:40:15 +0200
+Subject: [PATCH] virtio-snd: fix max_size bounds check in input cb
+
+In 98e77e3d we calculated the max size and checked that each buffer is smaller than it.
+
+We neglected to subtract the size of the virtio_snd_pcm_status header
+from the max size, and max_size was thus larger than the correct value,
+leading to potential OOB writes.
+
+If the buffer cannot fit the header or can fit only the header, return
+the buffer immediately.
+
+CVE: CVE-2026-3195
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a730f98a7a199706c44dd86a39d961e80e2ad18f]
+
+Cc: qemu-stable@nongnu.org
+Fixes: 98e77e3dd8dd6e7aa9a7dffa60f49c8c8a49d4e3 ("virtio-snd: add max size bounds check in input cb")
+Reported-by: DARKNAVY <vr@darknavy.com>
+Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20260220-virtio-snd-series-v1-4-207c4f7200a2@linaro.org>
+(cherry picked from commit bcb53328aa70023f1405fade4e253e7f77567261)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ hw/audio/virtio-snd.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
+index 9101560f3..d07b2614d 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -1253,6 +1253,12 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
+             }
+ 
+             max_size = iov_size(buffer->elem->in_sg, buffer->elem->in_num);
++            if (max_size <= sizeof(virtio_snd_pcm_status)) {
++                return_rx_buffer(stream, buffer);
++                continue;
++            }
++            max_size -= sizeof(virtio_snd_pcm_status);
++
+             for (;;) {
+                 if (buffer->size >= max_size) {
+                     return_rx_buffer(stream, buffer);
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p2.patch
new file mode 100644
index 0000000..b178033
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p2.patch
@@ -0,0 +1,55 @@
+From ee0153e8c5bfd59afade37cad98e84d4d7d547a0 Mon Sep 17 00:00:00 2001
+From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Date: Fri, 20 Feb 2026 11:40:16 +0200
+Subject: [PATCH] virtio-snd: tighten read amount in in_cb
+
+The amount of bytes to read passed to AUD_read() should never surpass
+the maximum available buffer length. Tighten the current amount by
+MIN(<amount>, max_size - <existing size>).
+
+CVE: CVE-2026-3195
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/298986525140149bd749c236c17cfbb507c69e23]
+
+Cc: qemu-stable@nongnu.org
+Fixes: 98e77e3dd8dd6e7aa9a7dffa60f49c8c8a49d4e3 ("virtio-snd: add max size bounds check in input cb")
+Reported-by: DARKNAVY <vr@darknavy.com>
+Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20260220-virtio-snd-series-v1-5-207c4f7200a2@linaro.org>
+(cherry picked from commit 7994203bb1b83a6604f3ab00fe9598909bb66164)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ hw/audio/virtio-snd.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
+index d07b2614d..eecf3c3de 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -1238,7 +1238,7 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
+ {
+     VirtIOSoundPCMStream *stream = data;
+     VirtIOSoundPCMBuffer *buffer;
+-    size_t size, max_size;
++    size_t size, max_size, to_read;
+ 
+     WITH_QEMU_LOCK_GUARD(&stream->queue_mutex) {
+         while (!QSIMPLEQ_EMPTY(&stream->queue)) {
+@@ -1264,10 +1264,12 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
+                     return_rx_buffer(stream, buffer);
+                     break;
+                 }
++                to_read = stream->params.period_bytes - buffer->size;
++                to_read = MIN(to_read, available);
++                to_read = MIN(to_read, max_size - buffer->size);
+                 size = AUD_read(stream->voice.in,
+-                        buffer->data + buffer->size,
+-                        MIN(available, (stream->params.period_bytes -
+-                                        buffer->size)));
++                                buffer->data + buffer->size,
++                                to_read);
+                 if (!size) {
+                     available = 0;
+                     break;
-- 
2.35.6

