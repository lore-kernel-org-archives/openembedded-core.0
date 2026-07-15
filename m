Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746FC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:24:01 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.409.1784136240275108992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NmG2bh+Y;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6002; q=dns/txt;
  s=iport01; t=1784136240; x=1785345840;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OzbvPQXOhj6PBKi3nLWOxyHFInYRQvvMD0TSxBdBhSU=;
  b=NmG2bh+YqiGoPhTIBwlEP4+gnnQXPffjCmQLEYTDrDY/S3C3fDSf2VKH
   De5hTPcNarwh1GIywxv4+CYG8Oh5tmg/6biSCRPWtYSsjgxoeQuhjjn4Y
   57dT7nh5uDq14sgeqA0uXWFPm8FOdWwriS00U1UummkSHduRm9dnGKLEK
   djAlxfJJPoDuIypb+xD+IdncRB7tOP+/tALY7MceCDPjMezDwd6lYYw34
   dAkn4X1ck0SWgz0Td982q2om0aZQiHGi1XZ5GcV9jChYY8WaCReE0gz2E
   uwkc/ik0fEmKZvgip6YGiSo/bPTz6NIn26tGKbVKYPRzh0feWsbF7Bydv
   w==;
X-CSE-ConnectionGUID: y80LzUmHT+2gJ+Q0ofPYsg==
X-CSE-MsgGUID: 7WOlTsdEQGGNJSpkaKbtrQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgCFwFdq/43/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhnh6Bfg8BAQEPRA0EAQGSWAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaASkPARgBWQMBAgMCJgItIxgBCIMCAYJ0AxG9HXqBM?=
 =?us-ascii?q?oEBgygBPwJDUNsuAQsUAYEKLoU/gx0BhQJcGAGEfCcbG4FygRWDaYEFgVwBg?=
 =?us-ascii?q?SiEFIJqBIIigQyBWh6PeEiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XN?=
 =?us-ascii?q?FgbBwWBHYFQgQKEdiMfAzl/gTB1SnctahIXgVGCFIEYAwsYDUgRLDcUGwQ9A?=
 =?us-ascii?q?W4HjUklgj8BHlwTAQohIoFjJyKTE5I+oRIKKIN1jCGVOhozhASUF5JRC5h9j?=
 =?us-ascii?q?gqWUIRpgWg8gUcLB3AVgyIJShkPjioDCwuFX4MUyS88NQIBCDIBAQcCBw4DC?=
 =?us-ascii?q?4FokACBfgEB?=
IronPort-Data: A9a23:lwjMQ6LeJovZluwLFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3zJRm
 jNLWz+AaP+IYDP1e48iYYvg8k0B75/Qy4A3Sgsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1/XBkSL7Ad2to0W25st
 sVALz41XwuM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG1aouNKoPULSlTthmng
 Wb65GjUOz41Ev6k0TmM0XiwnNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:cARWH6zVEGoCXrUOOfRGKrPwGr1zdoMgy1knxilNoHtuA6mlfq
 GV7ZYmPHDP5gr5NEtMpTniAtjifZqjz/9ICOAqVN/INjUO01HGEGgN1+ffKkXbexHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: 9a23:NgahcWEp1Lz06/BcqmJ2pBYwCP0gUkGelnjyYHbgDmhReaaaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AJsxS7w7H+g3EdV7mpOf4IK1Kxow33IOqNFsBvKw?=
 =?us-ascii?q?plO+mDjRzMhSXkC6OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510290876"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:23:59 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B3BD51800018F
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:23:58 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D5CDDCC037D; Wed, 15 Jul 2026 22:53:56 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-58010
Date: Wed, 15 Jul 2026 22:53:25 +0530
Message-Id: <20260715172330.1149253-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241026

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58010. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e824f0ac77484cc997f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58010.patch    | 113 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch
new file mode 100644
index 0000000000..842d53af5c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch
@@ -0,0 +1,113 @@
+From 333f164f00fb874e3c670ce70d2a2a3667b9ebf9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sun, 29 Mar 2026 19:10:41 +0100
+Subject: [PATCH] gvariant: Fix an off-by-one error in an offset comparison
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows a single byte out-of-bounds read off the end of the
+(potentially untrusted) byte array backing a `GVariant` when it’s
+being checked for normal form.
+
+I can’t see how this could practically be exploited, but it’s certainly
+a security bug as the `GVariant` normal form checking code is supposed
+to be robust to malicious inputs.
+
+Spotted by linhlhq as #YWH-PGM9867-190, and fix and reproducer provided
+by them too, thanks. Confirmed and turned into a unit test by me.
+
+Fixes: #3915
+
+CVE: CVE-2026-58010
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e824f0ac77484cc997f]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit aa1cb87d56111ef989811e824f0ac77484cc997f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gvariant-serialiser.c |  2 +-
+ glib/tests/gvariant.c      | 48 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 4e4a73ad1..99a1d3fbd 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1247,7 +1247,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+ 
+       while (offset & alignment)
+         {
+-          if (offset > value.size || value.data[offset] != '\0')
++          if (offset >= value.size || value.data[offset] != '\0')
+             return FALSE;
+           offset++;
+         }
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index c8f13360c..55e2cee00 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5637,6 +5637,52 @@ test_normal_checking_tuple_offsets5 (void)
+   g_variant_unref (variant);
+ }
+ 
++/* This is a regression test that looping over the padding bytes in a short
++ * (non-normal) tuple doesn’t overflow the input data.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/3915 */
++static void
++test_normal_checking_tuple_offsets6 (void)
++{
++  /*
++   * Type: (ynqiuxthdsog) — 12 members, first member 'y' (byte) has
++   * alignment 0, second 'n' (int16) has alignment 1.
++   * With 1 byte of data (0x28), after reading the first byte member,
++   * offset=1, alignment check for 'n' requires offset to be even,
++   * so the while loop checks value.data[1] — but size is only 1.
++   *
++   * Use heap allocation via GBytes so ASan reports heap-buffer-overflow.
++   */
++  guint8 *heap_data = NULL;
++  GBytes *bytes = NULL;
++  const GVariantType *data_type = G_VARIANT_TYPE ("(ynqiuxthdsog)");
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3915");
++
++  heap_data = g_malloc (1);
++  heap_data[0] = 0x28;
++  bytes = g_bytes_new_take (heap_data, 1);
++
++  variant = g_variant_new_from_bytes (data_type, bytes, FALSE);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++
++  expected = g_variant_new_parsed ("(byte 0x28, int16 0, uint16 0, 0, uint32 0, int64 0, uint64 0, handle 0, 0.0, '', objectpath '/', signature '')");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an otherwise-valid serialised GVariant is considered non-normal if
+  * its offset table entries are too wide.
+  *
+@@ -5890,6 +5936,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets4);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets5",
+                    test_normal_checking_tuple_offsets5);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets6",
++                   test_normal_checking_tuple_offsets6);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-sized",
+                    test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index b8212c9d12..32e578db3c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -47,6 +47,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1489-02.patch \
            file://CVE-2026-1489-03.patch \
            file://CVE-2026-1489-04.patch \
+           file://CVE-2026-58010.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


