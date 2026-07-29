Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C989DC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:54:46 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7117.1785315282354275412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mzf/n7oQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1567; q=dns/txt;
  s=iport01; t=1785315282; x=1786524882;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oFmullD0uLl9UgMf9QSsuYfM8XVTMoepNXCnH7RGtE4=;
  b=Mzf/n7oQ5FvIGP04OI/G+j0ss1wiAf+TqFR9IJpEB7yc+a2R6l1vxsBe
   2fL7R2zmo68TUE8zkKib62LoBBBXnJZ37t7CG6vQJ9oBCFs8UKsu+ZxlD
   k4hUWam4MUhkG2KE3amiUNvdVAlPxdiQXtwdJZxA/3r45CRL/oKPqDcUt
   qB4SCVE8KYR9bfMtF8khmY8qJKENv/2QaRPVb8VD8Sg8RdyyqrkHZFndx
   VcqrNym9h73gUWlhqgcOiD0vJMDXrzsdlpI/KjUnLc9fpm00gcw7bxtGJ
   meANjE8ibgeMUQVZClc4y0HXDE85IUjZ9VejIo6nFYo5WaJlhePYcZQOg
   Q==;
X-CSE-ConnectionGUID: Sl1EK8FbT6+U5Dl86quiZw==
X-CSE-MsgGUID: VaPG3eL3S0+oDj/S3df/HA==
X-IPAS-Result: =?us-ascii?q?A0BBAgBKvmlq/5EQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBNBIwXESDAgGCdAMRvhCCLIEBhH3bLgELFAGBOIU/iCB1hHwnG?=
 =?us-ascii?q?xuBcoR+hRCFeASCIoEMgw+PIEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsHBYEdgSw/hFcjGTZ/gS91SnctaQESF4EagzkCgkEDCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB41vIYJFAYENgUSVEJF6oQ8KKIN1jCGVOhozqmwumFqjfV2EaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ/gfScyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:fUgTQ6o/DN7inHi+n3it4aV5veNeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmCPfneMTT3KI11YY7n8EhTsZeByodhTlQ9pX9nEHhHo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jifHgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0t1zWExtp
 dISFG5OU02vg7Lo2a+6ePY506zPLOGzVG8eknhkyTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtKYH49tL/Aan3Xcz9RpFWTjaE2+GPUigd21dABNfKFIoPaHpULxh3wS
 mTuwW3BLUoXEIekkXmC3nDrvbTDk2TbcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:5jIXZ6CaDUS0wkvlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:CdXz2G7ayeti0s1AE9ssz0pNN+N1XHfhkjTtfmO8WThwVbynVgrF
X-Talos-MUID: 9a23:DeDSvAkoZnSRYWwbWk19dnpcPf9HuKmKU3tV0pIquY6/biB+fBe02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="807838603"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:54:41 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 3E29718000225;
	Wed, 29 Jul 2026 08:54:41 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id CA7B6CC1611; Wed, 29 Jul 2026 01:54:40 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-certifi: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:54:31 -0700
Message-Id: <20260729085431.2315023-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242262

From: "mark.yang" <mark.yang@lge.com>

NVD tracks certifi as certifi:certifi, so the default python:certifi
vendor prefix never matches and its CVEs are not evaluated at all.
Use the exact vendor:product pair.

For scarthgap, python3-certifi is 2024.2.2. CVE-2024-39689 affects
certifi versions before 2024.7.4, but this recipe already carries
CVE-2024-39689.patch. With this mapping, cve-check can evaluate that
existing backport against the correct NVD product instead of missing
the CVE mapping.

Note: Original commit was for python3-certifi_2026.2.25.bb. This is
adjusted for scarthgap where recipe version is
python3-certifi_2024.2.2.bb.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c49743ec431a3cc39803664eec8851be75756e)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-certifi_2024.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index 116add2079..b3d6cf080c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -12,6 +12,8 @@ SRC_URI += "file://CVE-2024-39689.patch \
 
 SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
+CVE_PRODUCT = "certifi:certifi"
+
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


