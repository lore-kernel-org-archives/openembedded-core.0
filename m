Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14483.1795513614469599690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Dtw48N0y;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4690; q=dns/txt;
  s=iport01; t=1795513614; x=1796723214;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=L+S/jzLz9b32VSugcoEZlWepusFY/oQrcNTsWaOYuTY=;
  b=Dtw48N0yZQTQ1T+JwRe0cfrkGItvvtqj2RLEcO6xNdsSTVC4KkKAWZHq
   y3h4lOu8Oa+/zxVZYLstnEDb3ddcmmF5m3DAk8xW3D5cuz/VlV6arXOMp
   FOc6njPOmU73imCvcS2vp41DXy2jcvVda+wsx8L7s9AXxV/rHCWlXbKLv
   mbXDwyvlDdUtL15yMtL9DUggyslG2CeZHrd6UX5YTz/jG55Wg1UhYUMNg
   WQB1xsvj/LX3Q/bfPdB9LWCfxcoNDcwfqLdtTwcopenWh3rkv22n/gFon
   apDX7v71O9gj6oKYO7kDpAGzw3ZfpCk2yzkU9VLMin/8pX8iestqMtkwX
   g==;
X-CSE-ConnectionGUID: vJClFCEGQo6FAQoI7T4ETA==
X-CSE-MsgGUID: fdsZl/rzTx+g+037jnn+Fg==
X-IPAS-Result: =?us-ascii?q?A0BKAgBHXAVr/9NK/pBaglmCV3VgQ0mEV49TgiEDgROdF?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMPAVYcAwECAwImAgIrIwgQCYMCAYJ0AxG6E?=
 =?us-ascii?q?Rs3eoEygQGDWwUJAkNQ2zMBCxQBgQouhUKDIAGFA10YAYR9JxsbgXKBFYJ0d?=
 =?us-ascii?q?oEFgVwBAQOFOYJqBIIigQyBVB5tjAwCgU+ISUiBAhwDWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJ?=
 =?us-ascii?q?j4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUFIMTBwGBDQErIlmBA?=
 =?us-ascii?q?hdmknGSNqERCiiDeYwklToaM4VbpReZCIsngmOVNYEchGqBaDyBRwsHcBWDI?=
 =?us-ascii?q?glKGQ9XjVQDCwuDYIF/gxTJSCYyCzIBAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:4nYznaJ1ChpeIfmfFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS1mdTy
 GoYXT3QaKqPNzTwKNgiYNjjoUNQsceAzNdgQFAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1wLmoyE6Y11d9wX09nz
 Ps5dwxRQyyq0rfeLLKTEoGAh+wqIdOuOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQviue8bYCJJbRmQ+1bkl2qo
 iXc7VjpQR5ZbIfAyzyDsVyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIk/KS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:014btq3vP27X0Lzr64v8IQqjBJAkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faaslgssR0b9OxofZPwIk80lqQFhLX5Q43CYOCOggLBR+tfBMnZsl/d8kbFmdK1u5
 0NT0EHMr3NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:8oyNV2zS+Kf5dmhIGlrmBgUKOOshXFbw407XfWGRMGFIF4HJZGO5rfY=
X-Talos-MUID: 9a23:SMaKsAQeDqnNWItMRXTiiCpQMIBy8Zi+S09Oyc5Zuc+CdgJ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62795247"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:46:50 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 7C5C218000B73
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:46:50 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 2EEF1CCA798; Tue, 24 Nov 2026 01:46:49 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/3] qemu: fix CVE-2026-3842
Date: Tue, 24 Nov 2026 01:46:49 -0800
Message-Id: <20261124094649.1556576-3-devanshp@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250988
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-3842.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/85af4e937016ed2f20122eb116597d1abb30c5c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3842

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-3842.patch             | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3f494e1..e62a684 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -46,6 +46,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-3195_p1.patch \
            file://CVE-2026-3195_p2.patch \
            file://CVE-2026-3196.patch \
+           file://CVE-2026-3842.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch
new file mode 100644
index 0000000..d582941
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch
@@ -0,0 +1,87 @@
+From bb8f9f4c4ad3a0ea1855db2dfee74dcf6eafedc5 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Mon, 9 Mar 2026 13:20:35 +0100
+Subject: [PATCH] hyperv/syndbg: check length returned by
+ cpu_physical_memory_map()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If cpu_physical_memory_map() returns a length shorter than the one
+that was passed into the function, writing the full out_len bytes
+causes an access beyond the memory allocated to the guest; or in
+the case of the MMIO bounce buffer, an out-of-bounds access in a
+heap-allocated object.
+
+Add a check similar to the one already in handle_send_msg(),
+and take the occasion to remove repeated computations of
+recv_byte_count + UDP_PKT_HEADER_SIZE and clarify that the
+code does not write past out_len bytes.
+
+CVE: CVE-2026-3842
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/85af4e937016ed2f20122eb116597d1abb30c5c0]
+
+Reported-by: Oleh Konko <https://github.com/1seal>
+Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
+Fixes: CVE-2026-3842
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 4f28b87fdd24df2049626106b7c24d0180952115)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ hw/hyperv/syndbg.c | 23 +++++++++++------------
+ 1 file changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
+index bcdfdf6af..134dadb89 100644
+--- a/hw/hyperv/syndbg.c
++++ b/hw/hyperv/syndbg.c
+@@ -193,7 +193,7 @@ static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
+     uint16_t ret;
+     g_assert(MSG_BUFSZ >= qemu_target_page_size());
+     QEMU_UNINITIALIZED uint8_t data_buf[MSG_BUFSZ];
+-    hwaddr out_len;
++    hwaddr out_len, out_requested_len;
+     void *out_data;
+     ssize_t recv_byte_count;
+ 
+@@ -222,29 +222,28 @@ static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
+     if (is_raw) {
+         out_len += UDP_PKT_HEADER_SIZE;
+     }
++    out_requested_len = out_len;
+     out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
+-    if (!out_data) {
+-        return HV_STATUS_INSUFFICIENT_MEMORY;
++    ret = HV_STATUS_INSUFFICIENT_MEMORY;
++    if (!out_data || out_len < out_requested_len) {
++        goto cleanup_out_data;
+     }
+ 
+     if (is_raw &&
+-        !create_udp_pkt(syndbg, out_data,
+-                        recv_byte_count + UDP_PKT_HEADER_SIZE,
++        !create_udp_pkt(syndbg, out_data, out_len,
+                         data_buf, recv_byte_count)) {
+-        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+         goto cleanup_out_data;
+     } else if (!is_raw) {
+-        memcpy(out_data, data_buf, recv_byte_count);
++        memcpy(out_data, data_buf, out_len);
+     }
+ 
+-    *retrieved_count = recv_byte_count;
+-    if (is_raw) {
+-        *retrieved_count += UDP_PKT_HEADER_SIZE;
+-    }
++    *retrieved_count = out_len;
+     ret = HV_STATUS_SUCCESS;
+ 
+ cleanup_out_data:
+-    cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
++    if (out_data) {
++        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
++    }
+     return ret;
+ }
+ 
-- 
2.35.6

