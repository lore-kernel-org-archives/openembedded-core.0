Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C486EA8558
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:18:40 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7579.1773033510144091433
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 22:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z/oIF/Bv;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1378; q=dns/txt;
  s=iport01; t=1773033510; x=1774243110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ffau+W9v7yVKhH3InNBRW3v4VuLhJM6gMWFnuNkmGJY=;
  b=Z/oIF/BvJvZYnGuYDHWEDOashWqTAmYwdYODACmCUkPKCCwI4Q9tCLMk
   WjWRkg1L8UvFcrC9kSw7XM4mfV5FXHWxfdJlHXST3YDrSg2/Ikz0jE6NY
   GP/ellowuI2DZym2zmw2A5y0JicJFvn8zinfaN3uqEqYwr3REBr4PTWH5
   CDWH5zMDcUrwwA6fZHyuSv1BD5Xi3Y7xYCEoaxtup8/s5Hy2c9gf24swY
   25WfQZwstw5R8Gtb0ZFho7pN+NXTEIuIFwWNL8++IiW3BPKbDSEKeD9S7
   KPRXVn8LX/VThi05ymNYn3ienbqeGz0wFsOEyTWoRjAMjanaeuXvQfJtz
   Q==;
X-CSE-ConnectionGUID: WIPSfCezSPmlRp1aM9NSFg==
X-CSE-MsgGUID: PRCZWOFZRNeSnq73WF7Ghw==
X-IPAS-Result: =?us-ascii?q?A0CZBQCoVq5p/5P/Ja1agjQQGoJED3FeQ0mWS54dgX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQeNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGXTYBRjBcHQEmgwIBgnMDrgKCLIEBuDeBTQELFAGBOIU8i?=
 =?us-ascii?q?Bl0gkuCLycbgg2EB3aFEIV3BIIigQ6Bf4gfggOHCkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBCxsHBYU/D4hwdG6BE4MEAwsYDUgRLDcUGwQ+bgeNf?=
 =?us-ascii?q?D6CLQeBDgEpgR1ik0CSY6EOkESVOhozqmuZBqNxaIRogWg8gVlwgzcJSRkP2?=
 =?us-ascii?q?GEmMjwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:fKBY3a4okgWqQsexLaD7iAxRtHzGchMFZxGqfqrLsTDasY5as4F+v
 mMaXz2GP6reajajf4h2PY7i8x4DvMLRnd9hHlRqrXxmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlMu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95f4AECEv+ee3Xb+dn/W26xnKRAQBqMXr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w13oIoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBgGhYasNmRZ4yY
 +IaczlmdB3cbjVEO0wcD9Q1m+LAanzXLGUC8QvJ/fdni4TV5DRL+4rSF/TnQPqHfsNMwR2ni
 D3p/3usV3n2M/Tak1Jp6EmEgffCmy7+Uo8eGLC0s/VtmlC7wm0IFAZQUkO2p/S8gEOyV99Tb
 UsO9UITQbMa7kenSJz5Gha/unPB50ZaUNtLGOp84waIokbJ3zuk6qE/ZmYpQLQbWAUeH1TGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:csmw1qk73zpeG4EbADz9aUwzvA7pDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:vBiCg2/O+a0Jz1stAMiVv3E1IvsrWXDP90/VJ3WgUG9MGZuuZ1DFrQ==
X-Talos-MUID: 9a23:itGqrgsa6cvxHGbeHM2nvAtJBvhPzZaULk02l4xZ4PaqagNwJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="702114058"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 05:18:29 +0000
Received: from sjc-ads-7641.cisco.com (sjc-ads-7641.cisco.com [10.30.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id EA46918000A4B;
	Mon,  9 Mar 2026 05:18:28 +0000 (GMT)
Received: by sjc-ads-7641.cisco.com (Postfix, from userid 1821000)
	id 9BC04CBDE40; Sun,  8 Mar 2026 22:18:28 -0700 (PDT)
From: krkapate@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] python3-pip: drop unused Windows distlib launcher templates
Date: Sun,  8 Mar 2026 22:18:26 -0700
Message-Id: <20260309051826.45191-1-krkapate@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.221.177, sjc-ads-7641.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 05:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232673

From: Krupal Ka Patel <krkapate@cisco.com>

pip vendors distlib which ships Windows launcher template binaries
(*.exe) under pip/_vendor/distlib. These files are only used on
Windows systems but are installed and packaged for target, native,
and nativesdk builds.

Remove the distlib *.exe templates when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries and
reduce package noise.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
---
 meta/recipes-devtools/python/python3-pip_26.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_26.0.bb b/meta/recipes-devtools/python/python3-pip_26.0.bb
index 0a284a1f6b..a1b2ba3350 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.bb
@@ -28,6 +28,15 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "3ce220a0a17915972fbf1ab451baae1521c4539e778b28127efa79b974aff0fa"
 
+do_install:append(){
+	# pip vendors distlib which ships Windows launcher templates (*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/pip/_vendor/distlib/*.exe ;;
+	esac
+}
+
 RDEPENDS:${PN} = "\
   python3-compile \
   python3-html \
-- 
2.35.6


