Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F319D58B2C
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28371.1773579761622847643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VSOwk8Cq;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1334; q=dns/txt;
  s=iport01; t=1773579765; x=1774789365;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LkAUPWoUivHuOxBW6qfiYtYcEFIQxQE5Hr/asDCkjdM=;
  b=VSOwk8CqDYkYUfNp84Q+fyiukCf4fonFsFrCbmN+ouwsCjOzEWUlByap
   nGAyh4ZieGIgw4J0S69CQniWYZQwPb5Ai3R15yK+xBbUZr+RmUxEwJVU6
   avHHPMEh9ww75kpECyCFFt1ivlQtl4K6LMu0tTfK9rFltrEePfzxFfRuy
   7f6K893fVysNErBIEU/TvP8gJr8G7n8TpA3XawNJ7SnMRvJYKHHkv6Dmu
   C9YbtiufsF12jTc8/bseXw7JJj6hTKMOGcmhjCukaf/7KmLQ2WUZPqQ5X
   CU9oaljxfACxkkb5OUnADGE01y0/fQ73lYvt4UeDMW+CekppQ/54Vyc8L
   A==;
X-CSE-ConnectionGUID: ZyHta++qTqeUHCt8qwmyVA==
X-CSE-MsgGUID: STLXDnokS0mbvjDS0l6K8Q==
X-IPAS-Result: =?us-ascii?q?A0C0BQDarLZp/4v/Ja1agjQQGoJED3FfQkmUKoIhA54ag?=
 =?us-ascii?q?X8PAQEBDzcaBAEBhQcCjSICJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbU9giyBAYMoA?=
 =?us-ascii?q?YFTtQgBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDoc7BotrSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB416PYIzAT0+E4FHaAE5pWOhDgoog3SMHpU6GjOqa5kGpFmEa?=
 =?us-ascii?q?IFpATqBWXAVgyIJSRkPjl/KAiM1AjsBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:xgcis6o9Ztn9uk1KRi//sYeCYEleBmJcZBIvgKrLsJaIsI4StFCzt
 garIBmEPareazT3eIwkYN6wox8DuZ6Gy4U1S1ZkrH0wRSIW8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8ni/vgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8U435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5EqU2M00Mi+7gx3R9zx4J
 U4kWZaYEW/FNYWU8AgRvoUx/yxWZcV7FLH7zXeXg92z00SFMGLQ2vhTLGoqbZQH//dJKDQbn
 RAYAGhlghGrnem6xve/D+JrnMlmdJOtN4IEsXYmxjbcZRokacmcGOORupkCgWp235sfdRrdT
 5JxhT5HYBnNeRRTOlA/A5Mll+DujX76G9FdgA3N+vposjKJk2Sd1pDWDP7lVtqNRv4Nm0yGp
 E79p2CnIUEjYYn3JT2ttyjEavX0tSTjVYQfEbe1+vJnjBiYwXYeIBkXTkeg5/6hh0izXthSJ
 0AZ9mwpt6dayaCwZsP2Uxv9pDuPuQQRHoIKVeY78wqKjKHT5m51G1Q5c9KIU/R+3OdeeNDg/
 gXhcw/BbdC3jICodA==
IronPort-HdrOrdr: A9a23:z2Pl+6idvYplSKcER9Z5WPHZSXBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3A7mEAD2tg4DL7aJS5DhB6jNfX6IsXY13BxTSTOnO?=
 =?us-ascii?q?hBFtJY6HFUECV6Z1Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ar0swaw2mVemdr2rCQIr8rw1BSTUj2JiKOGwLlpY?=
 =?us-ascii?q?948yOKy5cAG+Z0hfne9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707879227"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:44 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id B3F8618000222
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:44 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 636B4CC12B5; Sun, 15 Mar 2026 06:02:44 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 6/7] libunwind: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:47 -0700
Message-Id: <20260315125948.3002743-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233113

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libunwind to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/libunwind/libunwind_1.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
index bc1a108e42..59d2b1e937 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -45,7 +45,7 @@ do_install:append () {
 	oe_multilib_header libunwind.h
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # libunwind-1.8.1/src/elfxx.c:205:44: error: passing argument 3 of '_Uppc32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer-types]
 # libunwind-1.8.1/src/elfxx.c:279:52: error: passing argument 3 of '_Uppc32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer-types]
-- 
2.35.6


