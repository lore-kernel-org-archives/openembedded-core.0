Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4093.1617860874179369161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y7Wcz+6m;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860872; i=@fujitsu.com;
	bh=iRsf+ahMFNTVPsO00qvYWuBNoR5s2AQr6OwePMzkb1I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y7Wcz+6m5TQRhq8M7n1zoiyKP1tKjyjgz8Zcml4TANGhmx8+ZLNjqMsVs/qDge6/T
	 aiz6i41wvLqeCweyiN0B0fthfcGaQtQoTRKWWHs/x4EHjTBPXeA86C6OJH5Ege6ODS
	 4BXfjKR/RXfZ69F5ybdRvN84rld2S3pSfN9KhK6IQ/6QO51Yo8VQvSQ+D7DW28e2+z
	 Se25gICiB1RbcsFDpQ4+huSuAtISmMvvsXxpB59OGVFEPTe3blw43U/Qjn+lG6n2JD
	 hlFBJY7j408PVLwSSQKBq++BHVQuLsOVvNSuz3P4jWHIYwxpdFG7iPh5t3v4C7hD/T
	 bO90t7Jkf7rJQ==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id BF/D7-07430-8099E606; Thu, 08 Apr 2021 05:47:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1WWfmZd
  gMOGTmsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH0xSS2goc8FU+/dbA2MF7m7mLk4hAS2MIk
  cWDZDSYIZzejxNurU1m7GDk52AR0Jc49XsvexcjBISKgJ3H1nyhIWFjASuLghDXsIDaLgIrEs
  geb2UBsXgEPifXNl8HiEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzyEgJAUWJ2dPlIcqrJM
  7O/sI0gZFnFpKOWUg6FjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ01jXSNTXUS6zSTdRLLdVNTs0
  rKUoESuollhfrFVfmJuek6OWllmxiBAZRSiGT8Q7Ga68/6B1ilORgUhLlzZqUlyDEl5SfUpmR
  WJwRX1Sak1p8iFGGg0NJgld7BlBOsCg1PbUiLTMHGNAwaQkOHiUR3vbpQGne4oLE3OLMdIjUK
  UZFKXHeiSAJAZBERmkeXBssii4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubdDTKFJzOvBG
  76K6DFTECLSw7mgiwuSURISTUweU1fdchj81zDYN5pv6M9FzJ5xPfnzea40cl+6/Yv7VcruO8
  95UjdXrb987Xt+b5hrfdfvCx+aJ/t8irCheHI+eItK3oTBa+e/2Vfr/moO9In58yRv+eePwoI
  uMn127m4WLQlW4YjRtnW+nreZNbb0o9PnTwuvX/7xmT7FcFHspuEIvSFDt436HP99KVy1ffiH
  Sc+x/2ft2PVL+nQCQYhGXMa2xyPZSmtrf58OitKf+2c9l2aPs+PX/bk5G3/23jmyGUeoVrzlU
  vNP55b5PBt4YoPbx7+X3avfqY2qzU/24sTfryvHaX5Tz1bPrHv/89mX8dn3k1bZcqs7sdEb9N
  t8vfSrSvf22r6N/BZ2POOlUosxRmJhlrMRcWJAL9S1tIdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1617860869!698364!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8041 invoked from network); 8 Apr 2021 05:47:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:47:51 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385lknw030458
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:47:49 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:47:44 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libva: upgrade 2.10.0 -> 2.11.0
Date: Thu, 8 Apr 2021 22:19:29 +0800
Message-ID: <1617891569-52153-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libva/{libva-initial_2.10.0.bb => libva-initial_2.11.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.10.0.bb => libva_2.11.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.10.0.bb => libva-initial_2.11.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.10.0.bb => libva_2.11.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.10.0.bb b/meta/recipes-graphics/libva/libva-initial_2.11.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.10.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.11.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index d251afa125..43d916cd1c 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "fa81e35b50d9818fce5ec9eeeeff08a24a8864ceeb9a5c8e7ae4446eacfc0236"
+SRC_URI[sha256sum] = "6e361117038b571ad4741d38c9280db8c140b17e76e8c01fc7a4d608d3ed7d5d"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.10.0.bb b/meta/recipes-graphics/libva/libva_2.11.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.10.0.bb
rename to meta/recipes-graphics/libva/libva_2.11.0.bb
-- 
2.25.1

