Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661DF417F7
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:57:00 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16580.1773068211717171448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MnypQT2v;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=938; q=dns/txt;
  s=iport01; t=1773068211; x=1774277811;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ksb4mYoB10fdVpAX0xCi8LnV2ClUjqmKocR7QPvfELw=;
  b=MnypQT2vD7SqG661RcKcYFjyN1nyBvWERjuf1vB2JAi2iR1KOVw2sVn4
   zsL2Y/rk1GipI+rzzuJayaYFoY5W2L5M07CyEHXrHHlSky87wMFzddSdt
   jhrhrwEX4ThkIq3+g5nUcNKZHxNIpFKPHoXxtqFXM8QuL6VH+FkvutLgH
   gRdCshKB2eylT9e1miGkR6K3t4xdE8MIs7vzC+bXHAkou8ckTDZ10h+Fe
   cGxi+//3R+et8zt9L308tQymST5/7IkEUTxwVmvcyRkLbuTH7J2NHUG3n
   xJKI0wrLLrtyGYlmFM3wrF0mQj+5Y3QuwhVZ9A39x+agQbGvLB3aM1r7x
   g==;
X-CSE-ConnectionGUID: Xb5Z07diTxqDjSNvPyWoGA==
X-CSE-MsgGUID: D8YuOxp0QGygvNHPF3/1Uw==
X-IPAS-Result: =?us-ascii?q?A0CKBQA7365p/4z/Ja1aglmCSA9xX0JJk1tPoD6Bfw8BA?=
 =?us-ascii?q?QEPNxoEAQGSKQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIcTAXZcRIMCAYJzAgGsfoIsgQHgIgELFAGBOIU8iBmFbicbG4Fyh?=
 =?us-ascii?q?Ad2hRCFdwSCIoEOgXkGkRxIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QsbBwWFIA+IcnRugRODAwMLGA1IESw3FBsEPm4HjWo+gjM+UoFGaAGmHKEOC?=
 =?us-ascii?q?iiDdIwelToaM6prmQakWYRogWg8gVlwFYMiCUkZD45fzGkjNTwCBwsBAQMJk?=
 =?us-ascii?q?2cBAQ?=
IronPort-Data: A9a23:YUeCcaJQUoatOH+2FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShjcBy
 2UXWmrTO/+Kajfxf910bNuw8kxSuMfRytQ1GgEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGYlajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1eBhwEZdIU+9pnGE1Mz
 toGECEyaT+q0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjuizYIOEJIbRLSlTtmrIl
 3/h73yhOz4LO8K56QKrqTX1u/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:oG3AU6sNKCXgdAOwjeS1qYmm7skDY9V00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4pgPW
 AKSdkaNOHN
X-Talos-CUID: 9a23:5eiW5WCenAqORbv6ExltqXxMRcwkTm3E4HXrBVGAGFluZ5TAHA==
X-Talos-MUID: 9a23:3dXKngavHJJbIeBTm2/dmRZyLJ9RzLWhFmYtqbtd/JC5Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="686819623"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 14:56:50 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A3694180001C7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 14:56:50 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 4BA5CCC12B5; Mon,  9 Mar 2026 07:56:50 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][scarthgap][PATCH] tcp-wrappers: extend recipe for native/nativesdk builds
Date: Mon,  9 Mar 2026 07:56:40 -0700
Message-Id: <20260309145640.3432992-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232726

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require tcp-wrappers to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index bcd1d6f792..26eaeab1ac 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -132,3 +132,4 @@ do_install () {
 }
 
 FILES:${PN} += "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.deny"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


