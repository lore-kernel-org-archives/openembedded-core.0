Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D5EDF039
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:04:02 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38786.1770872637189369158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=L0lfwa+9;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2396; q=dns/txt;
  s=iport01; t=1770872637; x=1772082237;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C3WOpSvXz4LpPOOe885qStO0vHemfC7gay4U8lKyjOk=;
  b=L0lfwa+91RL2nEWakupcGObmMqvKjPzT8/nLOd9DNJZwTEw4LcJA29Ka
   zR458ouscTZYuUscrb1+ZBWs+OCpUCVu+l0MqbXz+1vDtHQYbNCAyqTfw
   YR5r9zRd6SfYDgyc4oEW/TW/HjvjInarrW34n8Vt5hUfRhjzSpOEO8sWR
   bycn1D8oNFJjq2tZhJaI6peZ7nRDg16ANrPd4IMa7mGwdqKH6WoY0CJoy
   rvbBl/J2Wc3umanca/DDvM3dNBnjf1Sm5qKS1s9X+TAu5RmAMC5pToAqU
   tUpRWsOa9dMa4vkz6MR59LDgck+UGzkgL2CwQ5xWewHCg34hXhu3hP+0u
   Q==;
X-CSE-ConnectionGUID: muPz26fSQUaipuxxcdm+uQ==
X-CSE-MsgGUID: +V52CQP5RfKWABnzOpkl3A==
X-IPAS-Result: =?us-ascii?q?A0DrAwCDXo1p/47/Ja1aglmCSA9xX0JJlCqgPoF/DwEBA?=
 =?us-ascii?q?Q83GgQBAZImAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaATgBGAFZAwECWiMhgwIBgnMCAahTgiyBAYMoAYFT2yYBCxQBg?=
 =?us-ascii?q?TiFO4gYWxmEeCcbG4FyhH2ECoEGhXcEgiKBDoFkNpFUSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFiBUPiQ94cIEgcgMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?ktBgjNZNYIGpkahDgoog3SMHpU6GjOFW6N5gReZBqRZhGiBaDyBWXAVgyIJS?=
 =?us-ascii?q?RkPjl+KErsQIjUCOgIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:ZMJwG6iXCpV5FdrR0J6u6zRbX161MREKZh0ujC45NGQN5FlHY01je
 htvUWDXb6mOYGvxfYh2YNzn/U4A6JHTmtMyGlFpqyozEHtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUd595lWz9Az
 sUlITEVcwCTjO6zg6+CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JIPSHZsLzxjDz
 o7A1yfHX0sxDeTC8zSmzVuGgP3ohSD/A6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:6crGiaxAva2vniesMPneKrPwOb1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTnjAsi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbcLB1bbaknDHik379
 YET5RD
X-Talos-CUID: 9a23:HcIWC2ErKpVnUVcmqmJi6XYGQJ4rSUTgxXbIPl+oAmpsC6CsHAo=
X-Talos-MUID: 9a23:7gpHCAhdoypfIJozRbJov8Mpd/k1uY+XMB03n7Y5kuOCJwtoODPGpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="670066963"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:03:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 5E2E918000223
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:03:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 07677CC12B5; Wed, 11 Feb 2026 21:03:56 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [master] [PATCH] cmake-native: disable libidn2 for native build
Date: Wed, 11 Feb 2026 21:03:26 -0800
Message-ID: <20260212050352.4090817-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231010

From: Deepak Rathore <deeratho@cisco.com>

CMake's bundled curl forces USE_LIBIDN2 to ON, which makes the build include
<idn2.h>. The native sysroot does not provide that header, so the build fails
and we end up with a native dependency loop. Allow the option to be overridden
and default it to OFF when it is not preset.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
index 128fef8a6e..9e1aae379e 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch \
             file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
+            file://0003-Disable-libidn2-in-bundled-curl.patch \
             "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
diff --git a/meta/recipes-devtools/cmake/cmake/0003-Disable-libidn2-in-bundled-curl.patch b/meta/recipes-devtools/cmake/cmake/0003-Disable-libidn2-in-bundled-curl.patch
new file mode 100644
index 0000000000..bafa0ae89b
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0003-Disable-libidn2-in-bundled-curl.patch
@@ -0,0 +1,26 @@
+From 7c6b3d07d8087cae729ba7d82602f50b82086e39 Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Mon, 10 Feb 2026 00:00:00 +0000
+Subject: [PATCH] cmcurl: disable libidn2 for native build
+
+CMake's bundled curl forces USE_LIBIDN2 to ON, which makes the build include
+<idn2.h>. The native sysroot does not provide that header, so the build fails
+and we end up with a native dependency loop. Allow the option to be overridden
+and default it to OFF when it is not preset.
+
+Upstream-Status: Inappropriate [native-only configuration]
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ Utilities/cmcurl/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
+index ab5f1c50c6..c1fb0e3e6d 100644
+--- a/Utilities/cmcurl/CMakeLists.txt
++++ b/Utilities/cmcurl/CMakeLists.txt
+@@ -105,1 +105,3 @@
+-set(USE_LIBIDN2 ON)
++if(NOT DEFINED USE_LIBIDN2)
++  set(USE_LIBIDN2 OFF)
++endif()
-- 
2.35.6


