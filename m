Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBDDC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:04:03 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35527.1785917038324925413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NtrWwMKA;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1241; q=dns/txt;
  s=iport01; t=1785917038; x=1787126638;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n3UOkTdSowU62msC/lzzSc43PzivM1QOXdyRHWLd5jk=;
  b=NtrWwMKAdV37RQ7wQr9/WJL/ic9/TwzSeEXUgt9KXyNE5tr8NF6JLaeU
   bHs+QgmVqTCmRB0YK19F32TONZoNPjAa5kWf+O5CpCTsoCJyghvTQb5xD
   Fy8Y9U24LlI0VE3HSwZmiCyE1oXCDiU/eR34l9hIq03s2tY1h5FFN8KwJ
   zNi2OwubOgy5YqtniN0CELgN/FwSJuwBHYErgrtAqPWbFE5Qkd8G77FVb
   inqn60yGBWyzx10y8s5LMrI0Ey63QCqfJxKmoP6aVx02HBnNzW187R+cG
   805y19r8BwJRFNSU6Mj3H0dAirSsbpHoow26rtqgiC1mmOK3euvwH9Apf
   w==;
X-CSE-ConnectionGUID: eE8+Yv2BRQ+pxfmhowK5kQ==
X-CSE-MsgGUID: 8jtkfIflTrSYbenDmWBcNQ==
X-IPAS-Result: =?us-ascii?q?A0BAAgCV7XJq/81K/pBaHgEBCxIMggULgld0X0JJlCmgP?=
 =?us-ascii?q?4F+DwEBAQ89FAQBAZJtAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhxMBGAFdXDwIgwIBgnQDEb0ygiyBAYMoAT8CQ1DbLgELFAGBO?=
 =?us-ascii?q?IU/iCF1AYR8JxsbgXKEfoEFgVwBgi6FeASCIoEMgXiQWUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSiEbSMZNnyBCV6BLSplEheBCYJ7A?=
 =?us-ascii?q?oJ6bwsYDUgRLDcUGQQ+bgeNaCCCQIEOKwGCPZNpkXmhEgoog3WMIZU6GjOqb?=
 =?us-ascii?q?AuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444hWrKIjw1AjsBAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:+TzQzKg5Nx1kJmhXfuo9LAx0X161NBEKZh0ujC45NGQN5FlHY01je
 htvWjuAO6qDY2HyKIwlaIm2pE4Hv5Pdnd8wTgI6/is9EypjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/re8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUV17Y0MH8U3
 8YhaygdYBWDgP2VnbGCH7wEasQLdKEHPasWt2slyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIK4DRGpQIzy50o
 EqW/Xj6DDAUMOCF8guP/3SAg9DllgXCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:sXWuUaiVA88g6p+2k6b0oGr4wHBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:xZEdxW20VZjeO0GtuidIp7xfF+11MUzDll3qGgygGWhsSLqKagKTwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AI9bQ1AxXtTcK7mwW63/keLU4EyuaqPSsFEMDsJs?=
 =?us-ascii?q?Ch9O/BCZ9PRuYsx68ZLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="59437959"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:03:54 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id 129DC180001E6
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:03:54 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id AFEC4CC037D; Wed,  5 Aug 2026 13:33:52 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-58055
Date: Wed,  5 Aug 2026 13:33:34 +0530
Message-Id: <20260805080334.2604235-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242835

From: Deepak Rathore <deeratho@cisco.com>

CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
Upgrade requests with a Content-Length header and body.

The default recipe does not build nghttpx. Add a conditional
CVE_STATUS entry so the CVE remains unpatched if app support is
enabled, while default builds are marked not-applicable-config.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58055

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
index 71d5eef8d6..29a7d26819 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
@@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] = "-DENABLE_DOC=ON,-DENABLE_DOC=OFF"
 
 EXTRA_OECMAKE = "-DENABLE_LIB_ONLY=ON -DENABLE_PYTHON_BINDINGS=OFF"
 
+CVE_STATUS[CVE-2026-58055] = "${@bb.utils.contains('EXTRA_OECMAKE', '-DENABLE_LIB_ONLY=ON', 'not-applicable-config: nghttpx proxy is not built in the default nghttp2 configuration', 'unpatched', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


