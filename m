Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA478CF45D4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:16:10 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55734.1768299365442045929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TXteDgyQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1405; q=dns/txt;
  s=iport01; t=1768299366; x=1769508966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6b95BqvIcczSyglHYtzUfM3ZTMDuhLJS/OfeyC8uzPU=;
  b=TXteDgyQ1VdofSlvw1PB7L5dSHokvNqIZteFSvLP4cuSmkUDmiY8QLzS
   J9hKSbh9njXSwjK8luMpr986+LCG1x9EvIQGWlGf1ssNr6QzueffSiMKe
   RFd3AmQG1mCGQr+u39wHLeENJvBsoSwfWYXYVEDZFXTI7xu9/ZaJCtm4f
   oEWXeCNGkmer5+plCI4Vlg/6sJvhE6wcBTQ7Tv020xWfW8/1w9HeYDzzQ
   Vu7tPoE2MW9jUP7S+oZH6e40GlJlJFctG97EtvOVUrnWYd76YftZjL1zf
   I75CdNvP/Ma+WYAGNJHXTU4YNhQpTjfMV0nNJQw6K6joKq+Jwu699fpvY
   A==;
X-CSE-ConnectionGUID: 7BtrzHBMQeeBuc3f7Az8oQ==
X-CSE-MsgGUID: ZkjIqEiwSuKaUn41eW0pWg==
X-IPAS-Result: =?us-ascii?q?A0D6AgC+GmZp/4z/Ja1aglmCSA9xX0JJlkuLd5ImgX8PA?=
 =?us-ascii?q?QEBDzEgBAEBhQeMbgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXTYBRoEMRIMCAYJzAgGrL4IsgQGEfNlBgWMBCxQBgTiNU?=
 =?us-ascii?q?leFEicbgUlEhH2CYQKCLYV3BIIigQ6UHkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBChsHBYF4Boh9D4lFejoDCxgNSBEsNxQbBD5uB480giVGBwF6B?=
 =?us-ascii?q?A8sgUWUHkWPV4IhoQ6EJoRwhy6VOhozhVulDwGZBos2mSOEaIFoPIFZcBWDI?=
 =?us-ascii?q?glJGQ+SIYVkuVoiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:7mTa36lZhq6ZD/Z27euJEvno5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDTuOafeONDSje4p+PNjg/RsFu5SBn9BkGVBq/nwyE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZS31GONgWYubDpNsvnb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdIy5vxlIUtrz
 PEVAi0GNR7crvDmx4vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9Ausrn74eTxEr06OjaE2+GPUigd21dABNfKJIYHVFZgKxhzwS
 mTuzWf7Iwg3NcOk1BmMz3Tw3+LwxTvEV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:7GIBUKDHsfFJlxnlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: 9a23:1x85y2G/x0p19DF0qmI43lIOCOAPV0TQwV3NKBS2Vk97GLqsHAo=
X-Talos-MUID: 9a23:G5SSvQbRo4NcFuBThTzupShPNdhT/oenNUZRyJg549G7Onkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,222,1763424000"; 
   d="scan'208";a="435785702"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jan 2026 10:16:05 +0000
Received: from sjc-ads-1437.cisco.com (sjc-ads-1437.cisco.com [171.70.59.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 6FF57180001FA;
	Tue, 13 Jan 2026 10:16:04 +0000 (GMT)
Received: by sjc-ads-1437.cisco.com (Postfix, from userid 500841)
	id 275C4CC8CBA; Tue, 13 Jan 2026 02:16:04 -0800 (PST)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] patch.py: add check for existing localpath
Date: Tue, 13 Jan 2026 02:15:32 -0800
Message-Id: <20260113101532.1505036-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.59.129, sjc-ads-1437.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229239

All URLs from SRC checked to be a patch.
In some rare cases, when we have "diff" or
"patch" into URL it is treated as a patch not
like proper resource (e.g. repository).

In this specific case, the problem fixed with
git fetcher which behaves differently in case of
using mirrors. Without pre-downloaded repository
archive we have directory into downloads and exit
from patch_path. As a workaround, we check if the
patch file exists.

Error example for this URL:
git://github.com/pkg/diff;name=diff;\
destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https

ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 do_patch: \
Importing patch 'github.com.pkg.diff' with striplevel '1'
FileNotFoundError(2, 'No such file or directory')

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 246fc6221f..30462ef1ad 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -889,6 +889,8 @@ def patch_path(url, fetch, unpackdir, expand=True):
     """Return the local path of a patch, or return nothing if this isn't a patch"""
 
     local = fetch.localpath(url)
+    if not os.path.exists(local):
+        return
     if os.path.isdir(local):
         return
     base, ext = os.path.splitext(os.path.basename(local))
-- 
2.35.6


