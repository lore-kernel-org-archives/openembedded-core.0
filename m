Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23180C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 12:55:12 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6492.1787230504167539103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 05:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=daxgoKL9;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1948; q=dns/txt;
  s=iport01; t=1787230504; x=1788440104;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W/GGYnOTOje+G0N6aydaFu7rNonBKaGL17nbu/ITa80=;
  b=daxgoKL9nHYT9G1o0OHh9mW/XykwyjJFulBooQJe0hj5VaJY5V+cQ+Zb
   OTD/APsG4X/omHkQYPoEX64d1o2ARm81kRzOagfaYpr4+CTvxI6zi/osJ
   KZEGulW2dymYgcGV2TsQSGtRNPhJ2H5bOO0GcWJputyqSd8gz/1DcLmzl
   WsM43r/pv204wp03jCtgz2d5V1/gPu1VroYSdsFxpty3W1OB+svvNLh1J
   /uFwCsGSHkhE+j8ljmiqc0zzaOvCmdzpq9bl8KEd/67avSUpKxK6qg3Ji
   Mtqo7LNVzF0MQw62u4NxeO9Tee0+Q2k9nqUY313p3vIP2CxVZTfC6cjBc
   g==;
X-CSE-ConnectionGUID: r4VvKj4RQ7Ss34ji3PuuBg==
X-CSE-MsgGUID: J5H/NHgxRMeFNyP5g/VaKw==
X-IPAS-Result: =?us-ascii?q?A0AwAwCw+IZq/5AQJK1aglmCV3ReQ0mTWQFPgTWhBQMPA?=
 =?us-ascii?q?QEBDzcaBAEBknICJjcGDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIcTARgBXVxEgwIBgnQDwgVCgiyBAYMoAYFU2zABCxQBgTiFP4gidoR8J?=
 =?us-ascii?q?xsbgXKBE4NrhRCFeASCIoEMk0pIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYhIXgQmCCgKCcIIGAgFJRQ4JFwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeOUSCCSzEoGwcTgimmJaEPCiiDdowhlToaM6psmQikWoRpg?=
 =?us-ascii?q?X4mgVlwFYMiCUoZD44tARXQGScyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:FI5mkawY29xy2XRj6Gh6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 WVODDiHM6zbZzGnco0lYdu+9k4AsZfQnIMxQVNqr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFtqA5M7+LpNOD517
 qdEKjFWVg2ere3jldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQhieS0boSFIo3iqcN9vBu44
 UTm8HTDJxw0Es2nlDXCzHuPmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Oj0Or6MxzlKTX8BcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:MkSYJmCsgnxBzaL6EzM7ylA3GJwfSyLm1yyMIU7jMXt0YrLAHA==
X-Talos-MUID: 9a23:BQO1WgguEUWUVYAJdyTESMMpFppIpIKOB1A3tJgondi8aCM3BT6+k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="814166809"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 12:54:41 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 0A69D18000355
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 12:54:41 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 9C097CC1611; Thu, 20 Aug 2026 05:54:40 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] cmake-native: use bundled nghttp2 with bundled curl
Date: Thu, 20 Aug 2026 05:54:32 -0700
Message-Id: <20260820125432.2365345-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 12:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243857

From: Himanshu Jadon <hjadon@cisco.com>

cmake.inc enables system library lookup through
CMAKE_USE_SYSTEM_LIBRARIES=1. cmake-native already keeps curl bundled,
but it did not also disable system nghttp2 lookup. With CMake 4.4.x,
the bundled cmcurl configure can enable nghttp2 when headers are found
on the host. The later compile uses only the OE native sysroot, so the
build can fail with:

  fatal error: nghttp2/nghttp2.h: No such file or directory

Disable system nghttp2 lookup for cmake-native also. This keeps it
consistent with the existing bundled curl setting instead of adding a
new native dependency because the host happened to expose nghttp2
during configure.

Add the bundled cmnghttp2 license checksum because the native build now
uses that copy explicitly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/cmake/cmake-native_4.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
index fe1136bd6c..aed38b7ed1 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
     file://Utilities/cmcurl/COPYING;md5=0515352b285b9c3f66464b135c9c0fdc \
+    file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
@@ -34,6 +35,7 @@ EXTRA_OECMAKE += "\
     -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_NGHTTP2=0 \
 "
 
 # Ensure e2fsprogs isn't found on the host to remove a build dependency and reproducible builds.
-- 
2.51.0


