Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335E4FCD0B4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:39:17 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7591.1773812349398889198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A62EaP50;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2535; q=dns/txt;
  s=iport01; t=1773812349; x=1775021949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O8SR6U+bdA1Wp2hQ9N7Qf1aCBSztoRgEJvHWKiEOFaA=;
  b=A62EaP50w8yYyP1OqFDwp+XgqRpfjID4gAVnF+OGinFUGAitcgK9L95H
   Uu2DdtNlHUaavhNxtnO5KwL4JrKY6dEq2JSNXlkcwlVPNx+xMe6L8laA4
   7F7qp4kxGp+eA113t49Dmf89j+jDOin7/IiZyHThI3I7c3WgzWKWZn3FG
   2Qj7AMk91IagESGrIL6zeeXwJfEX41/9jlX1tH5MhEVK9DlLfWjkVx5VG
   2lQ8+lzp4phsCnqVuGXghuW88ndFpNBIeNDweoQC4ver1CWIz60TOSb9k
   /BefF5CGKlLA+R85G3cD0mYU42E8v2sD73LaBLq4PHqFTPNM5yYWPlmrE
   A==;
X-CSE-ConnectionGUID: pEinnSt3TBC4eotn9E5zAQ==
X-CSE-MsgGUID: T6V3JBhGRk66gvZD6JSR+Q==
X-IPAS-Result: =?us-ascii?q?A0DzBQCqObpp/4oQJK1aHgEBCxIMggULgkgPgVBCSZZLA?=
 =?us-ascii?q?4tkkjaBfw8BAQEPUQQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZchlsCAQMyAUYQIDEgCysZgwKCOwM2AgGzDoIsg?=
 =?us-ascii?q?QGEfNhHDYJSAQsUAYE4hTyCeYUgWhqEeicbG4FyhAd2gh+CcYV3BIIigQ6Sf?=
 =?us-ascii?q?EiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYQAD4htdG2BE4QMA?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeNTzuCADQBHjQ7RWynG6AdcQoog3SbXIV8GjOqa5kGk?=
 =?us-ascii?q?hKSR4RogWg8gVlwFYMiUhkP2BQjNT0CBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:pSon/a11Jvn/nbo9PPbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bp2QGn
 zYfDG+CPvrbNDOmeY92aIu190tSu5SEx9JnGgY53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2UtbTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFGw3O4sj5r1LK0oS+
 PsELmEgMwKqvrfjqF67YrEEasULJc3vOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Sojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FAsjOC2bYSPIbRmQ+1pwHjDh
 EjG0F76XE8VKu6zlxi+yDGV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:CXyNAKAc+Q1NEuPlHemr55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: 9a23:kx/qjmHXy5eBJcR/qmJ/2U8SHPs5KUH35yvdJFO+WEs0WpSsHAo=
X-Talos-MUID: 9a23:8B8YwwrCyS/9/Yg6rGwezw08CpxKyaSBMkNTz5oYieXaFxdKeA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,126,1770595200"; 
   d="scan'208";a="454035623"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 05:39:08 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 508751800019B;
	Wed, 18 Mar 2026 05:39:08 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id E9E78CE2A7A; Tue, 17 Mar 2026 22:39:07 -0700 (PDT)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH v1 3/4] cve-check-map: add new statuses
Date: Tue, 17 Mar 2026 22:39:05 -0700
Message-Id: <20260318053906.26606-4-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260318053906.26606-1-hetpat@cisco.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233360

From: Marta Rybczynska <rybczynska@gmail.com>

Add 'fix-file-included', 'version-not-in-range' and 'version-in-range' generated
by the cve-check.

'fix-file-included' means that a fix file for the CVE has been located.

'version-not-in-range' means that the product version has been found outside of
the vulnerable range.

'version-in-range' means that the product version has been found inside of the
vulnerable range.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d25f1817752bc8a84c40dcbef75f7559801ce15e)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/conf/cve-check-map.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index 17b0f15571..ac956379d1 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -8,11 +8,17 @@ CVE_CHECK_STATUSMAP[backported-patch] = "Patched"
 CVE_CHECK_STATUSMAP[cpe-stable-backport] = "Patched"
 # use when NVD DB does not mention correct version or does not mention any verion at all
 CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
+# use when a fix file has been included (set automatically)
+CVE_CHECK_STATUSMAP[fix-file-included] = "Patched"
+# do not use directly: automatic scan reports version number NOT in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-not-in-range] = "Patched"
 
 # used internally by this class if CVE vulnerability is detected which is not marked as fixed or ignored
 CVE_CHECK_STATUSMAP[unpatched] = "Unpatched"
 # use when CVE is confirmed by upstream but fix is still not available
 CVE_CHECK_STATUSMAP[vulnerable-investigating] = "Unpatched"
+# do not use directly: automatic scan reports version number IS in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-in-range] = "Unpatched"
 
 # used for migration from old concept, do not use for new vulnerabilities
 CVE_CHECK_STATUSMAP[ignored] = "Ignored"
@@ -26,3 +32,6 @@ CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
+
+# use when it is impossible to conclude if the vulnerability is present or not
+CVE_CHECK_STATUSMAP[unknown] = "Unknown"

