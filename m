Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7699D58B2B
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:03:01 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28186.1773579775815054892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dGocj/Vu;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1104; q=dns/txt;
  s=iport01; t=1773579775; x=1774789375;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UvKyiz5KmTg10TDQ3vsrtvPpXb6JZ289YI+q62Ay0hs=;
  b=dGocj/VuklGGcqyavUXP8YVffNm1AYBj3pqivKPgA9iKBIfsdIuQV0qt
   Z7IMATJCvLM6atUab4MIiEnfVhMwwxMilmmaK6sO14ZJ7/YMVvuNdbcmt
   fQFaYF2a5FkBK38Ql/uzc61a3/zUCf3rIGPe1CUEvcj1Oa8qGPjUoz5cJ
   bPj/MGwb68BkhrNxjFGNVggIQsWrcP3dAeO/OwTu7/wdcSUBD+aIglUDg
   /Dcz6BcYKIizUctS7C3RmAOLZ3Sm6lU7ugv8uNsnCDqZHvDLdXcJu0fMj
   cAbHkZbi99miQA5fLOQEhEnF63nx5TuTLMRp7u7CpGES2LKF6/7PRELrd
   Q==;
X-CSE-ConnectionGUID: eEaCydWQQh2Cn2iWlm23/Q==
X-CSE-MsgGUID: g3nKzUP8SouOXrZJCL/7vQ==
X-IPAS-Result: =?us-ascii?q?A0CqBACUrbZp/43/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbFrgiyBAYMoAdx5A?=
 =?us-ascii?q?QsUAYE4hTyIGXSEeicbG4FyhAd2hRCFdwSCIoEOgX+RLUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYUaD4hydG2BE4MtAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geNej2CMwE9UQGBRmgBphyhDgoog3SMHpU6GjOqa5kGpFmEaIFoPIFZcBWDI?=
 =?us-ascii?q?glJGQ+OX8xyIzUCOwIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:h0CziaMLhS5zaRLvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoh12FSn
 zQfWGuEb6zZM2bxed8kOtuy80xUvceGzYA2GXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/hDBWonMbIhw+YtKmcU9
 MMcLWpWKSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvgeK3aIeJJYLiqcN9kR2eh
 XD7xzTCBQw9BMat6xGhtS2yv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:M3YGr6o8MfR+6gtPl1YdQVEaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3AoN96u2u+++YWXdSedVQs+xb26IsoX3T23XvvGna?=
 =?us-ascii?q?4U01vEryqTVrKo+Rdxp8=3D?=
X-Talos-MUID: 9a23:ySWYzAoNaW5Etzt65oUezz45MuR63pz+M0cQtqUcieuvEWsvJQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="692205476"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:42 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 6BD91180001B7
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:42 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 1AF99CC12B5; Sun, 15 Mar 2026 06:02:42 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 5/7] libtraceevent: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:46 -0700
Message-Id: <20260315125948.3002743-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233115

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libtraceevent to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
index 0dee0ebcc2..83b72c56b8 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
@@ -19,3 +19,4 @@ EXTRA_OEMESON = "-Ddoc=false"
 PACKAGES += "${PN}-plugins"
 
 FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
+BBCLASSEXTEND += "native  nativesdk"
\ No newline at end of file
-- 
2.35.6


