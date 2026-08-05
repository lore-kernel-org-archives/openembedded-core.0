Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F92BC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:23 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35939.1785918678618008042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RcIComYb;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1679; q=dns/txt;
  s=iport01; t=1785918678; x=1787128278;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K5/X0mMallG24p345CxAgojhjfZ73NUHlleFz7Uhc7A=;
  b=RcIComYbLwDx2xe/qJSd6MLWjRk+ZtTzdzi0ItuqZGNqvRyXUE8eZTPp
   fN6FcDNgb/hTfXkOUeOrGGms8CShm5TxyzRN224IY38Er5Ytazd3GtElC
   +chA3YT+GwKviC+nx4r5iti9W9IEENHYjvUwX5rHjLYPfzr99kFEmds36
   3epZtJFXZWQLrq+b/KGI+v3IYQ4n5e1I8VMZMMPeZK9xuowTcU3Mf83Kr
   V29IySFNvfQRmUed7PHz4gyyHMfZD7yxTbR4nydQY3IRT/zCC83SGklf1
   DgLBkNwsfc9IBrwysKUriHTe5oc4e0S8VnG7mv/Q/48HZNIKiPeVuYgkh
   A==;
X-CSE-ConnectionGUID: jrOBGTDKRZS8gRuQyocRMg==
X-CSE-MsgGUID: EicIcGZLQQeuHx+D+xmDbQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgD/83Jq/9FK/pBaHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhlsCAQMyARgBPSAxKysRCIMCAYJ0AxEGvVSCLIEBg?=
 =?us-ascii?q?ygBPwICQAFQ2y4BCxQBgTiFP4ghdQGCSYIzJxsbgXKEfoEFgVwDARiCE4V4B?=
 =?us-ascii?q?IIigQyBeFA5JI8sSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFg?=
 =?us-ascii?q?R2BKIRtIxk2fIEJXoEtKmUSF4EJgnsCgnpvCxgNSBEsNxQZBD5uB41oIIJAA?=
 =?us-ascii?q?Q9KBy0qAQGCNwalYqESCiiDdYwhlToaM6psLphajgqWUIRpgWg8OYEgcBU7g?=
 =?us-ascii?q?mcJFjQZD444iH6BLcVhPDUCAQE5AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:rlmkNK/THsST5Ggu9ICzDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2EcCzjVaf7fMGP0etglaYy/9EIGsZPUyYdhSAVr+XpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k0J6oy1dpbIlt8z
 qwXEi00fxeIvce5lefTpulE3qzPLeHiMZlavjRryivUSK52B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwYYaIKoDSFK25mG61p
 2nn9EvLJigjOcG/2XmpsWKpquX2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:PiqR9a5YSVDltYX+OQPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3A+JoJtmgAaQBLYkWgBV94AKfYJjJucGf65ljsD2y?=
 =?us-ascii?q?CO105R4eIcE6X85lBnJ87?=
X-Talos-MUID: 9a23:jdVgjguPtIDQVQlQsc2nqTBpFcxH0YCXMU0QsYVFl4qUMAB6AmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="59458409"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:16 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 121221800019A
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:16 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id BB4EDCBEFAA; Wed,  5 Aug 2026 14:01:14 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/8] curl: set CVE_STATUS for CVE-2026-8924
Date: Wed,  5 Aug 2026 14:00:57 +0530
Message-Id: <20260805083103.2633995-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242840

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-8924 protects cookie domain handling when public
  suffix list support is enabled in curl. [1]
- Wrynose curl 8.19.0 is configured with --without-libpsl,
  so the PSL check path is not built by the default recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-8924.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index ae57776eab..5bec405eb7 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -35,6 +35,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.35.6


