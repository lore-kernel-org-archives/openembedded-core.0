Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14489.1795513637490892540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gC75UcaN;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4599; q=dns/txt;
  s=iport01; t=1795513637; x=1796723237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zEzs6pnhE8qqXDvQfF8PqJrw20BEpIGgpkrJ+CzaFDE=;
  b=gC75UcaNAfltSPlnlWCSfIoMVkf+DRMJZJd1SRpOJ0k1rZ8OtrQLSX4I
   w2dUdXReXDsYcISVAHyMnsRg42E4Pg1dTq5oPfnE0iyPLmkX37jcCdQfe
   WQNX6OpmyVysJEby17pgBQlbqP41iRZqN3xLqolHNCjZeV6Cbg2QBdcwg
   PBpIqguqKDGoi+UDf3/9Lf3ZLNV+xunPKm1Bf/wUf8j4dE6fm9bieKAdU
   Qyyt6psJpRuhHU7mZzlDXGNxLLSkts37jL8dmoZ7itZdloTIyiaaxALZW
   68HWNm+d2onVvfKksyH9++t25gVyIWc0S7r6k7yMBome0YZiW80Cz6QrB
   A==;
X-CSE-ConnectionGUID: sjhtYpr1TBGI80ABSXtI+w==
X-CSE-MsgGUID: 8ecaL3ZbRJCyuPjgPgUyQA==
X-IPAS-Result: =?us-ascii?q?A0BKAgDQWwVr/9VK/pBaglmCV3VgQ0mEV49TgiEDgROdF?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMPAVYcAwECAwImAgIrIwgQCYMCAYJ0AxG6E?=
 =?us-ascii?q?Bs3eoEygQGDWwUJAkNQ2zMBBQYUAYEKLoVCgyABhQNdGAGEfScbG4FygRWCd?=
 =?us-ascii?q?HaBBYFcAQEDhTmCagSCIoEMgVQejHkCgU+ISUiBAhwDWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJ?=
 =?us-ascii?q?j4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUFIMTBwGBDQEre4ECF?=
 =?us-ascii?q?2aScZI2oREKKIN5jCSVOhozqnKZCIsngmOVNYEchGqBaDyBRwsHcBWDIlMZD?=
 =?us-ascii?q?1eNVAMLC4NggX+DFMlIJjILMgEBBwIHAQwBAwuBaJF+AQE?=
IronPort-Data: A9a23:dYTAna3V6CgLGSYb2/bD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzcAm
 msbXmuCb/aOMTehLdFyYITi8EpXu8Pdy9NqHQFt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGF0M2IbwA4L9LK05vp
 aQxAgs9cjHAmLfjqF67YrEEasULJcTxeYdasXZ6wHSAV7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU+ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZjuKyYIWFJITiqcN9zkuTr
 0adzW7DIDoLKeSdxgKKz2OVr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:EfP/n6tSOkHTfrm/Ux3SyZCy7skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:53cSw2CXnIv9R9/6EzJl9FIlAtp8Tlfy7SeICmWDOXpIC6LAHA==
X-Talos-MUID: 9a23:UJGhzwYRsPRb6+BT5zLnjRU5Bs1SwY+/FXgPnq0Jhti9HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62787860"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:47:15 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 4F98318000232
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:15 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 020E4CCA798; Tue, 24 Nov 2026 01:47:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/3] qemu: fix CVE-2026-3842
Date: Tue, 24 Nov 2026 01:47:13 -0800
Message-Id: <20261124094713.1557189-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124094713.1557189-1-devanshp@cisco.com>
References: <20261124094713.1557189-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250990
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream stable-10.0 backport for CVE-2026-3842.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit links
are recorded in the embedded patch headers when the fix expands to
multiple commits.

[1] https://github.com/qemu/qemu/commit/903addd92fc8dd352f3f08ba8f603d54a087b863
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3842

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-3842.patch             | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d3e7362..da2eafa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -56,6 +56,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-3195_p1.patch \
            file://CVE-2026-3195_p2.patch \
            file://CVE-2026-3196.patch \
+           file://CVE-2026-3842.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch
new file mode 100644
index 0000000..c5b5ed1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-3842.patch
@@ -0,0 +1,88 @@
+From e845c44cfb85a07e621c45f05697e164e10340d6 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/903addd92fc8dd352f3f08ba8f603d54a087b863]
+
+Reported-by: Oleh Konko <https://github.com/1seal>
+Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
+Fixes: CVE-2026-3842
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 4f28b87fdd24df2049626106b7c24d0180952115)
+(Mjt: context fixup for 10.0.x)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ hw/hyperv/syndbg.c | 23 +++++++++++------------
+ 1 file changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
+index 065e12fb1..9fdec1146 100644
+--- a/hw/hyperv/syndbg.c
++++ b/hw/hyperv/syndbg.c
+@@ -189,7 +189,7 @@ static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
+ {
+     uint16_t ret;
+     uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
+-    hwaddr out_len;
++    hwaddr out_len, out_requested_len;
+     void *out_data;
+     ssize_t recv_byte_count;
+ 
+@@ -218,29 +218,28 @@ static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
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

