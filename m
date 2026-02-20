Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8684CC54EFC
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32604.1771565685718979248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gWSCKD38;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2535; q=dns/txt;
  s=iport01; t=1771565685; x=1772775285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O8SR6U+bdA1Wp2hQ9N7Qf1aCBSztoRgEJvHWKiEOFaA=;
  b=gWSCKD38s+qRt6+1ciDZDOLwl1oc3jv7N8eYZe8Vbm2g6oIChnxP1tc+
   nE6skESNAuWonedgNPDXXJ+MlbxBTctYqUM99PaEmjemnywe6uuIVnHn+
   GnsFMtjDMSX9c+/xbKPjY9jqhgurydrE+CR92OHKc9uN5U9KzSgNkLPXM
   Z+bemYM7iA0Yw64pZe1CL1hc2WRbve3EUSm5kXipY9DY+5+fMwTLDmjHH
   ltPYlMvpfATfBCELF+soAi4MuMt2R8WEsAQJDRuwryojPo7DIH5PysTVR
   KgVeL2ohl1YRWQHayOgU9DFXNvpIfvuCbtRYMTriQFHGlOhSXrIJP8sDh
   Q==;
X-CSE-ConnectionGUID: K3DWlE9bRx2jD6AcoqKYOA==
X-CSE-MsgGUID: V3i+coZ/ThO26tqxu1g51A==
X-IPAS-Result: =?us-ascii?q?A0BDBACY8Jdp/5D/Ja1agjQQGoJED4FQQkmWSwOLZJI2g?=
 =?us-ascii?q?X8PAQEBD1EEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4ThlyGWwIBAzIBRhAgMSALKxmDAoI7AzYCAaoGgiyBAYR8s?=
 =?us-ascii?q?ikNglIBCxQBgTiFPIJ5hSBaGoR6JxsbgXKEB3aCH4JxhXcEgiKBDpNPSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFh1MPiQV4boEggRsDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB44vP4IANAEeNDtFbKcboB1xCiiDdJtchXwaM6prmQaSEpJHh?=
 =?us-ascii?q?GiBaDyBWXAVgyJSGQ/YYiI1PAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:ofmimKkz12X+Dz+CbIjI8x7o5gw7JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWzuGPPyJY2Wnfdknb9u19E5X78OHm9E3SwI+pSs9FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav668CgUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZS31GONgWYubDpOsfrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukMCdPpETb5LwYW8P49mAcksYJ
 N9l7fRcQi9xVkHAdXh0vxRwS0lD0aN6FLDvAiOTjsi+nkf8YyHu76tHB0YvHrw/07MiaY1O3
 aRwxDEldBuPgaeyhbm8UOQp3ptlJ8jwN4RZsXZlpd3bJa95GtaYHOOQuIIehWts7ixNNa62i
 84xaTdzdB3cSxZOIVwQTpk5mY9Eg1GhI20B8QjI/PZfD2778ldwk7PqAp3pevvQG9lMjlvBq
 T+f1jGsav0dHJnFodafyVqrnuLJkCbxVY4eGbH9/flwjXWXx3cPE1sRTVa9rPyzh0KyVt4ZL
 FYbkhfCtoAo/0CtC924VBqirTvc4VgXWsFbFKsx7wTlJrfo3jt1z1MsFlZpAOHKfudvLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:KjW+5qviNKfxYi1p4Pj0/1my7skDcdV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmSTSa3BkXCF+xFK+qjgzJyV
X-Talos-CUID: 9a23:zDxAuWz/8IgpFuOAwJ/LBgU3QewadlCMxk3AeU2UV09iT6S2eHi5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aw3ZeHgyP5wadoDpHiVjVGEkiUh6aqJr1CQMGlqd?=
 =?us-ascii?q?Bh8mjb3JsIieA1TvqG6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="688112514"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:44 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id BBF9E18000203;
	Fri, 20 Feb 2026 05:34:44 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 64596CC8CF4; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 04/34] cve-check-map: add new statuses
Date: Thu, 19 Feb 2026 21:34:13 -0800
Message-Id: <20260220053443.3006180-4-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231454

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

