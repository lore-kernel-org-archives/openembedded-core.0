Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB005EA8559
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:19:39 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7706.1773033576743883269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 22:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G7Wa4bJ/;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1328; q=dns/txt;
  s=iport01; t=1773033576; x=1774243176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VSVitGZ9YpkLj8eeDgUKt4mm8UfbolnwZ5VjMagsMPE=;
  b=G7Wa4bJ/ttshlM1UxFPGgHc9bwpOETMwBQuk7u6cMk2VyPf1cxqU53Sl
   pVECBUX9mL5+7DuCoLBlIrf5gVgOw6/ZxZO7Vp85qacDXKrourrk5q+i7
   2OL6W5JbubXluKr+ImVZdMqw47HhMU/JcG+hzCKGdtLrzMnmjWNv6Xicz
   jTqbvGKcrJS4kyHJYEutMtkBTAX2gnrN5bvbYBXzsHhvLsq8jLnlx4JGg
   DBmwWTRMYXDQ0vLNMBiL8Jl7+Z9AA7NaKR8b769+i+7ZsdGd9Z4F47OH5
   ySLMgBL7f/TTBxE3CeAa2zTohc6h8rDejZnSNg6JyyXDGi5eJsC08S+3u
   Q==;
X-CSE-ConnectionGUID: VhOdeGTrSiyBZq89ZZPbzg==
X-CSE-MsgGUID: +b34J0mrQqu+zGHwWNUBqQ==
X-IPAS-Result: =?us-ascii?q?A0CaBQCtV65p/5L/Ja1agjQQGoJED3FeQ0m0aIF/DwEBA?=
 =?us-ascii?q?Q83GgQBAYUHjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02ARgBLTBcHQEmgwIBgnMDEa1ygiyBAYMoAbUOgU0BCxSBO?=
 =?us-ascii?q?YU8iBl0gkuCLycbgg2EBwdvhRCFdwSCInoUgX+IH4kNSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhT8PiHB0boETgwQDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?418PoItB4EOgimTQJJjoQ6QRJU6GjOqa5kGo3FohGiBaDyBWXCDNwlJGQ+OX?=
 =?us-ascii?q?8oCJjICOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:WeW9X649zRVhrmq2A7KgIAxRtHzGchMFZxGqfqrLsTDasY5as4F+v
 mVMUGmObqmDNGf9fI10bYi/9UMDusfQn95lHgJkqn09Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlMu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95f5IV+zvOOv1XbHYlHe2qU/PnMON58Xr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w014IoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBgGlYasNmRZ4yY
 +IaczlmdB3cbjVEO0wcD9Q1m+LAanzXLGUC8QvJ+PBni4TV5E97i+TPaN/PQ8WXBtd6vlmng
 F/s5l2sV3n2M/Tak1Jp6EmEgffCmy7+Uo8eGLC0s/VtmlC7wm0IFAZQUkO2p/S8gEOyV99Tb
 UsO9UITQbMa7kenSJz5Gha/unPB5k9aUNtLGOp84waIokbJ3zuk6qE/ZmYpQLQbWAUeHFTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:gPhL26AsyWIku5nlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: 9a23:MFtsnWHuwc6R2hynqmJZ9GkYF+8ZaEbc3V3iOh/pO1RRQq+aHAo=
X-Talos-MUID: 9a23:N7PyAgV11Fh1mPLq/Hzm321AbMJy2r2zS1IisYo5nfSuLBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="702114528"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 05:19:35 +0000
Received: from sjc-ads-7641.cisco.com (sjc-ads-7641.cisco.com [10.30.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 98D56180004B8;
	Mon,  9 Mar 2026 05:19:35 +0000 (GMT)
Received: by sjc-ads-7641.cisco.com (Postfix, from userid 1821000)
	id 5009BCBDE40; Sun,  8 Mar 2026 22:19:35 -0700 (PDT)
From: krkapate@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] python3-setuptools: drop Windows launcher executables on non-mingw builds
Date: Sun,  8 Mar 2026 22:19:33 -0700
Message-Id: <20260309051933.46422-1-krkapate@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.221.177, sjc-ads-7641.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 05:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232674

From: Krupal Ka Patel <krkapate@cisco.com>

setuptools installs Windows launcher executables (cli*.exe, gui*.exe)
into site-packages. These binaries are only used on Windows platforms
but are packaged for target, native, and nativesdk builds.

Remove the Windows launcher executables when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
---
 .../recipes-devtools/python/python3-setuptools_80.9.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
index 533d8ce3d4..833d610be5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
@@ -13,6 +13,15 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
 
+do_install:append() {
+	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools/*.exe ;;
+	esac
+}
+
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\
-- 
2.35.6


