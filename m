Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22596CDE000
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:04 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18587.1782214253980438962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hFl/NF0P;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9557; q=dns/txt;
  s=iport01; t=1782214254; x=1783423854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hH9Rc6FxKHalUTQYOVqXIc6qP0FMYnAPJQXZ57ztfvc=;
  b=hFl/NF0PS1eEOKG02tBxYCv/z4aq13WOjzEO2ZZAqmBIUsWva7ruNw9a
   X9EoMVOMiHZ/UuZCF2o0gq6O4Kq/Nd4SB8heurvB0I1cI4kMIOO2abVd2
   knqEQ/WgvfUqCEh8IwiZuWH8PxheG80L1h5H/pg37UI1xUXFnjSDjQZcT
   O7wOnKOhuX9htq35j6hzPHjn2nZjabFXSTyYnYEdeXMODEi7wbfg62BO/
   oy1Q9khFkWajem3dr/zOK6U36933XegaZbo0kz+U3xC6hNQ4qNeE/8npw
   RCX5fIrpyOwY6zlM8lPuw0zsjRaRmcTj29Nxi2D79E8Fb7yg65KEDIH0I
   g==;
X-CSE-ConnectionGUID: sf3ZMN+7R+ytP6VLFEa6Ug==
X-CSE-MsgGUID: yO0wwb6lS3aVk/MKJK0GZw==
X-IPAS-Result: =?us-ascii?q?A0AaAACDbTpq/5X/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4RUiByJWAOeGxSBag8BAQEPRA0EAQGCEoJ0Ao1KAiY0C?=
 =?us-ascii?q?Q4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDIwQLA?=
 =?us-ascii?q?UYQHAMBAgMCJgICKyMIGYMCAYJzAgERnFaXFxo3en8zgQGDaAJDUNssAQsUA?=
 =?us-ascii?q?QWBBS4BhT6DHAGFAlsYAYR8JxsbgXKBFYNpgQWBXAKBIxWEA4JqBIIigQyBW?=
 =?us-ascii?q?hgGhAaLA0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYFug?=
 =?us-ascii?q?QSFAiMfAzl/gT+BJGRmFTA1gQEBER8KgSsDCxgNSBEsNxQbBD0BbgeMWhcPg?=
 =?us-ascii?q?W5IB3sTASoBIGMCgSccAjCScSqPbIIhoQ8KKIN1jCGVOhozhVulEQuYfY4Kl?=
 =?us-ascii?q?gBQhGiBaDyBWXAVgyIJShkPjioOC4NghAeBDMR+JDULAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AGBfAEB?=
IronPort-Data: A9a23:Opbk1aIv4Ozf6886FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgzcBz
 DBJUGzVaKyLNGWhKNtyPozl8E5VucLTyd4wQAod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWQvajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN11AhoEGKtbpdw0EH12q
 8I8Bh0EMC2M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEWojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjOmyYYKJJIXQLSlTtle//
 n3Z9Tr9OUoTCt/Y7Bmn0SqDtPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:3kTVoKs2A1GKG0MZT97JPvVS7skDqNV00zEX/kB9WHVpmwKj+P
 xG+85rsyMc6QxhP03I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4KScZD4bPLYWSSpPyKmTVQa+xQo+WvweSPmfrUyWtrQEVBbqFt6Bo8NyOge3cGPDWvwfECZe
 ChDg0tnUvaRUgq
X-Talos-CUID: =?us-ascii?q?9a23=3A6Pb+zGsdzF/pCRzjkeCJgIQ56Is+fCbv6VGTfHX?=
 =?us-ascii?q?7GHpRFoOxZ3KZpp5rxp8=3D?=
X-Talos-MUID: 9a23:pu4ddAt5t+6f6JRQNs2nlRY6K9hivaCVU0kzktIjmOunbQNCJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="497904612"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:53 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id D9FAD180001CF;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 40DC7CC124D; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
Date: Tue, 23 Jun 2026 04:30:32 -0700
Message-ID: <20260623113037.28968-8-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239354

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080
[2] https://security-tracker.debian.org/tracker/CVE-2026-41079

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-27447.patch            |  4 +-
 .../cups/cups/CVE-2026-34978.patch            | 25 +++++--
 .../cups/CVE-2026-34980-regression_p2.patch   |  8 +--
 .../cups/cups/CVE-2026-34990.patch            | 19 ++---
 .../cups/cups/CVE-2026-41079.patch            | 72 +++++++++++++++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c2bf572bf5..64f71c9465 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
            file://CVE-2026-39316.patch \
+           file://CVE-2026-41079.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
index 77a26dae64..1884acfa9f 100644
--- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md
 index 4a2e25d..0da2c55 100644
 --- a/CHANGES.md
 +++ b/CHANGES.md
-@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
+@@ -21,6 +21,8 @@
  Changes in CUPS v2.4.10 (2024-06-18)
- -----------------------------
+ ------------------------------------
  
 +- CVE-2026-27447: The scheduler treated local user and group names as case-
 +  insensitive.
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
index d05bc85588..b4b83a41d0 100644
--- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md
 index 7a5e8813f..429ee874f 100644
 --- a/CHANGES.md
 +++ b/CHANGES.md
-@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
- Changes in CUPS v2.4.10 (2024-06-18)
- ------------------------------------
- 
+@@ -24,6 +24,8 @@
  - CVE-2026-27447: The scheduler treated local user and group names as case-
    insensitive.
-- Fixed cupsd crash if user does not exist (Issue #1555)
+ - Fixed cupsd crash if user does not exist (Issue #1555)
 +- CVE-2026-34978: The RSS notifier could write outside the scheduler's RSS
 +  directory.
  - Fixed error handling when reading a mixed `1setOf` attribute.
@@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644
 +	{
 +	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
 +	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)
+@@ -6010,6 +6016,12 @@ create_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
index 73846cb8a3..0cf63b10af 100644
--- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
@@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644
  #
  # Test the lp command.
  #
--# Copyright © 2020-2024 by OpenPrinting.
-+# Copyright © 2020-2026 by OpenPrinting.
- # Copyright © 2007-2019 by Apple Inc.
- # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2019 by Apple Inc.
+ # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
  #
 @@ -72,8 +72,8 @@ echo ""
  
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
index e3d6e10a23..916cdc09a3 100644
--- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
@@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644
    {
      OSStatus		status;		/* Status */
      char		authdata[HTTP_MAX_VALUE];
-@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
  #endif /* HAVE_AUTHORIZATION_H */
  #if defined(SO_PEERCRED) && defined(AF_LOCAL)
--  else if (!strncmp(authorization, "PeerCred ", 9) &&
+-  else if (PeerCred != CUPSD_PEERCRED_OFF && !strncmp(authorization, "PeerCred ", 9) &&
 -           con->http->hostaddr->addr.sa_family == AF_LOCAL && con->best)
 +  else if (PeerCred != CUPSD_PEERCRED_OFF &&
 +           !strncmp(authorization, "PeerCred ", 9) &&
@@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644
    {
      send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local users can create a local printer."));
      return;
-@@ -5621,9 +5621,15 @@ create_local_printer(
- 
-   ptr = ippGetString(device_uri, 0, NULL);
- 
--  if (!ptr || !ptr[0])
-+  if (!ptr || !ptr[0])
-  {
--    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%s\" has empty value."), "device-uri");
-+    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%s\" has empty value."), "device-uri");
+@@ -5634,6 +5634,12 @@ create_local_printer(
  
      return;
    }
 +  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
 +  {
 +    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-uri \"%s\"."), ptr);
-+ 
++
 +    return;
 +  }
+ 
+   printer_geo_location = ippFindAttribute(con->request, "printer-geo-location", IPP_TAG_URI);
+   printer_info         = ippFindAttribute(con->request, "printer-info", IPP_TAG_TEXT);
 diff --git a/scheduler/job.c b/scheduler/job.c
 index 880c25f..6c033de 100644
 --- a/scheduler/job.c
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
new file mode 100644
index 0000000000..f216c84e30
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
@@ -0,0 +1,72 @@
+From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 13 Apr 2026 11:50:23 -0400
+Subject: [PATCH] Limit num_bytes for SNMP string values.
+
+CVE: CVE-2026-41079
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080]
+
+(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ cups/snmp-private.h | 6 +++---
+ cups/snmp.c         | 8 ++++++--
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/cups/snmp-private.h b/cups/snmp-private.h
+index 52b8740..015f53e 100644
+--- a/cups/snmp-private.h
++++ b/cups/snmp-private.h
+@@ -1,7 +1,7 @@
+ /*
+  * Private SNMP definitions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2014 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;	/**** ASN1 request/object types ****/
+ 
+ typedef struct cups_snmp_string_s	/**** String value ****/
+ {
+-  unsigned char	bytes[CUPS_SNMP_MAX_STRING];
+-					/* Bytes in string */
+   unsigned	num_bytes;		/* Number of bytes */
++  unsigned char	bytes[CUPS_SNMP_MAX_STRING + 1];
++					/* Bytes in string */
+ } cups_snmp_string_t;
+ 
+ union cups_snmp_value_u			/**** Object value ****/
+diff --git a/cups/snmp.c b/cups/snmp.c
+index 54e348f..3222ff3 100644
+--- a/cups/snmp.c
++++ b/cups/snmp.c
+@@ -1,7 +1,7 @@
+ /*
+  * SNMP functions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,	/* I - Buffer */
+ 	        case CUPS_ASN1_OCTET_STRING :
+ 	        case CUPS_ASN1_BIT_STRING :
+ 	        case CUPS_ASN1_HEX_STRING :
+-		    packet->object_value.string.num_bytes = length;
+ 		    asn1_get_string(&bufptr, bufend, length,
+ 		                    (char *)packet->object_value.string.bytes,
+ 				    sizeof(packet->object_value.string.bytes));
++
++		    if (length >= sizeof(packet->object_value.string.bytes))
++		      packet->object_value.string.num_bytes = sizeof(packet->object_value.string.bytes) - 1;
++		    else
++		      packet->object_value.string.num_bytes = length;
+ 	            break;
+ 
+ 	        case CUPS_ASN1_OID :
+-- 
+2.43.7
+
-- 
2.44.4


