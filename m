Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14729.1795513637555616194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aUHJWIbk;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6201; q=dns/txt;
  s=iport01; t=1795513637; x=1796723237;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EoePeZ9gET1R0PWEPSoi7F55kAtJ90hjUK3mtbnXSFo=;
  b=aUHJWIbkhtvOWRfDRIUXxXlKLU1NS4lcvQjBZzobhjxsHMzg7riQ4sRi
   96hoa8np7zoZRikvN+UHPdmYZ3/3/P9oSbl9OdeOW9+6jq5ntj6zFcV3R
   M59radCaM9gKDo2U7ScRGgViqS9TPBKKn15/lp/cOI+Oa62FsbPMeIkCm
   nEq8SSJTLTzAVtBCROcr0k8laeu6c2hP/Fd6BvtC64X8X6+vVwMIYx/yj
   7VADyaCYGv6vQ43Xr2YBk3Nt/Lqh18TZmwYbdUo8I7hs/wUB2K3ZH4vca
   VEEQORYBPRyardF0zD3iQ6TEHLjesS1F+dBoum/Z2c0mpZst+mFqHkKN7
   g==;
X-CSE-ConnectionGUID: tyE965SGSMm24MvJuiHKPQ==
X-CSE-MsgGUID: 8Pw/HWr4SR29a7I4sTwNpg==
X-IPAS-Result: =?us-ascii?q?A0BDAgBHXAVr/9VK/pBaglmCV3VgQ0mUKoIhniyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgEtCwFyAwECWiMhgwIBgnQDEboRGzeBeTOBAYNbBQkCQ1DbM?=
 =?us-ascii?q?wEFBhQBgTiFQogkXRgBhH0nGxuBcoR/gQWBXAEBA4gjBIIigQyBVB6MeQKBT?=
 =?us-ascii?q?4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdg?=
 =?us-ascii?q?SsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeUFIMaASwQUQEre4EZW6UyoREKKIN5jCSVOhozhASUGpJUmQiOCpZRh?=
 =?us-ascii?q?GqBaDyBRwsHcBWDIlMZD1eNVAMLC4NggX+DFMlIJjILMgEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:P1EDV6nOnOCUAmpjVvAoglPo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCmnUaPjZMzfxe9h/b4S+9kkDv5DVm4QySFNkrS9mFltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf7b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZEJ17cpXFphz
 tkdcmwocDKehsKV+IvuH4GAhux7RCXqFIoSoDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQUUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGISPJYfQFJUP9qqej
 jL+4CPZPQtGD+bFmDPa0y63uvDphSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:gWTEzayAUo74VTL0nXqLKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:eVmSuG2dKbKi5zJ+5lE2wLxfBtEIIyOA91jrBkriVUN3aqCUaXyowfYx
X-Talos-MUID: 9a23:rv4sRAnweNuQcsxE/z2kdnoyDNgvw5u0VHs3y8QP5OjYLhBvHS+S2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62732982"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:47:15 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 428A518000210
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:15 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id EA09CCC2EF3; Tue, 24 Nov 2026 01:47:13 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/3] qemu: fix CVE-2026-3195
Date: Tue, 24 Nov 2026 01:47:11 -0800
Message-Id: <20261124094713.1557189-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250991
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.0 backport for CVE-2026-3195.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/d5f91db5498f008094809bba6d63fd5bc1032706
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
index 1f510cb..d13d2fc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -53,6 +53,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p2.patch \
            file://CVE-2026-0665.patch \
            file://CVE-2026-2243.patch \
+           file://CVE-2026-3195_p1.patch \
+           file://CVE-2026-3195_p2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch
new file mode 100644
index 0000000..b8c5a10
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p1.patch
@@ -0,0 +1,48 @@
+From 322ffc56fbba976b8fa3592c3c77d453cdffb3c7 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d5f91db5498f008094809bba6d63fd5bc1032706]
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
+index abfb5afc1..41ac62d30 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -1255,6 +1255,12 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
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
index 0000000..dad3cf9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3195_p2.patch
@@ -0,0 +1,55 @@
+From 665c2d1c936d2e71f00131762fec1a14b12d078b Mon Sep 17 00:00:00 2001
+From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+Date: Fri, 20 Feb 2026 11:40:16 +0200
+Subject: [PATCH] virtio-snd: tighten read amount in in_cb
+
+The amount of bytes to read passed to AUD_read() should never surpass
+the maximum available buffer length. Tighten the current amount by
+MIN(<amount>, max_size - <existing size>).
+
+CVE: CVE-2026-3195
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/c081363741014a3b764dc16c190990ce4901cd8e]
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
+index 41ac62d30..8889abb62 100644
+--- a/hw/audio/virtio-snd.c
++++ b/hw/audio/virtio-snd.c
+@@ -1240,7 +1240,7 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
+ {
+     VirtIOSoundPCMStream *stream = data;
+     VirtIOSoundPCMBuffer *buffer;
+-    size_t size, max_size;
++    size_t size, max_size, to_read;
+ 
+     WITH_QEMU_LOCK_GUARD(&stream->queue_mutex) {
+         while (!QSIMPLEQ_EMPTY(&stream->queue)) {
+@@ -1266,10 +1266,12 @@ static void virtio_snd_pcm_in_cb(void *data, int available)
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

