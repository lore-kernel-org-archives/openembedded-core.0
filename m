Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8212BC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:54:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.7214.1646135658403728412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S+LhA1zh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135656; i=@fujitsu.com;
	bh=o5Xnatw9sX6s1BgqDyGcJtSAyaORVyNOKkeScSPGNpI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S+LhA1zhCJmuI/hV5veaJycipT5BbItqL8CLVBS5o9U4X3SviNImqegpWUU8Ih0+p
	 a8U6Gft8dZn7ONXCP9ghTAgS05abN9FTj73ZqQRSi9s6t61JFsRuEzbvwSH9d4bsZj
	 TRRpHtcDuo9Hb45HKpZiTubdcUUXyT1tc0twBg9IvmhrOeYVr62UJv6zNEzEW2ZJkq
	 TtKtOEHVc+7e6Rv8knhK+mG+4Bn0TAyUBILv0IEidwkLFoentPdH8wq0NE2JtpJbsx
	 WylH9nObv00ZVirM6xY65lBS/+jrVg/jm4C0Biiynkfn/E5UfzDOyetvmLWD1/xNY7
	 h7gT2AUX3Uc3Q==
Received: from [100.115.1.160] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 44/10-21232-8690E126;
 Tue, 01 Mar 2022 11:54:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSTeDUy7
  J4MN3QYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPG3/nsBa/4Kta23GZtYFzH28XIxSEk8JhR
  YtufXewQznkmiY39Z9kgnOOMEq9uXwFyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAlUTbwXSQMAtQ+MO9yUwgNq+Ak8Smlw+YQWwJAQWJKQ/fg9mcAs4SW963s4PYQkA1d0
  /9ZIeoF5Q4OfMJC8R4CYmDL15A9SpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqgskTU30Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzilmGHWDsZZfT/1DjFKcjApifKq3ZRNEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBu51dLklIsCg1PbUiLTMHGE8waQkOHiUR3jgWoDRvcUFibnFmOkTqFKOilDivBwdQQgAkkV
  GaB9cGi+FLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5t4BM4cnMK4Gb/gpoMRPQ4r/BUiC
  LSxIRUlINTI3zZspebjiuZd1j2DhviUeOasXZ/raWv1KLNb+c0VgRp5XMoPzWN7gtXtzqvZQZ
  36nUgD+bZiyUm7usPEVYO0T5aPPhwxkF4X+kJdjmv1984/baRr73vNqCHxYxFs1fdPrhxJPFd
  6Sap1VsfWmpPP+YReWauEV/N4p1pKY9k/wkYp0rcbaO+Yvzv/VTrA/eM929KbHLofJMbeaGKU
  rW9nkTLVivXDps8crt/Nt3LRIOd5RMn0+tP8G23Flpk3GR72fOKcanQ98LJh7YfIqxt2NG3fq
  DdQYPNZ7eYhH8d+r6ic3zrSTENC1Ej302XB1no7PmlnfJHQae5UtuWFguOH1kt90Tc45PS+Z2
  PDy5c7USS3FGoqEWc1FxIgCQQ5iBXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1646135656!28527!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27788 invoked from network); 1 Mar 2022 11:54:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:54:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D2B7210034F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AE8F8100452
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:54:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:54:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva: upgrade 2.13.0 -> 2.14.0
Date: Tue, 1 Mar 2022 19:53:53 +0800
Message-ID: <1646135633-39009-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646135633-39009-1-git-send-email-wangmy@fujitsu.com>
References: <1646135633-39009-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162546

Changelog:
=========
* add: Add av1 encode interfaces
* add: VA/X11 VAAPI driver mapping for crocus DRI driver
* doc: Add description of the fd management for surface importing
* ci: fix freebsd build
* meson: Copy public headers to build directory to support subproject

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-initial_2.13.0.bb => libva-initial_2.14.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.13.0.bb => libva_2.14.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.13.0.bb => libva-initial_2.14.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.13.0.bb => libva_2.14.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.13.0.bb b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.13.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.14.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index dcdc1f378c..8ebec8159a 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "fad383f39f36115814bd0eda1496a4cc01761643bd962635400df2d4470ad460"
+SRC_URI[sha256sum] = "511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb b/meta/recipes-graphics/libva/libva_2.14.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.13.0.bb
rename to meta/recipes-graphics/libva/libva_2.14.0.bb
-- 
2.25.1


