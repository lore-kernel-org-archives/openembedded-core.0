Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3698BC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:39:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.4896.1665477581230952841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BFDWwESO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665477579; i=@fujitsu.com;
	bh=g9OoBaQOFGDQtMtF1F9Vg7vAc4zZZjGM6WtcyAwb0VM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BFDWwESOfqnlNFQcd1EfuU9vsyrlS4S/d+3AxQNFKtg5TGFHq0xTx/w/iumzL2kGA
	 KphOEnBXBEnfl/GN8/4gXkX4ORxgEFkjBJdooTPMawcoIurbRYFTEqKYq7/bOg1BZ0
	 6+Ve3eMAHZXWeAbvbYdU+BZ4J4T6xhv/8jHuH16EpQpgyNHuk0lk4eyieEa5gUk+ud
	 NmO3ilo331fbSSq91DSfFiNfAVUrN+w+MEfeb1NYsLmUqXIEWEklRH+yCZO+euaQOu
	 RgSyu70tCR5cgEGYPOdfR4qRY56JofNr/LvGToMM6+xlDUXvimWOpKm+7ArVwGnqLP
	 BW/88Q0ZUKC7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqHtK2zX
  Z4MADfYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPWrMOsBZc4K65ueMPWwHiXo4uRi0NI4DGj
  xPW1R9i6GDmBnGtMEusPaUAk9jBKHOr/DpZgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBZ4lfTx4wgtgsAqoSR/Z3gdm8Ak4SV5pnsYLYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU
  0MNA1NDTVNTbXNbTUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMmUYlXh
  HYwdK3/qHWKU5GBSEuXtUndNFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB660FlBMsSk1PrUjLz
  AHGB0xagoNHSYR3qQpQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rwWwGgTEgApyijNgx
  sBi9VLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5I0Cm8GTmlcBtegV0BBPQESevOoEcUZK
  IkJJqYArzivxr2ZbmF+NofrW4clnI78dCeVx2epoqOs/cdixgMXgsdLdnz6Nt/j13Lnuv1dN3
  viwUr1JSYFP1UueVNM/X7qPFMs8vX6m+4V4eKyaSJ2mltdMvZ6GAXo3n50K/9WxMu+PYneJU0
  /qZ3D/vnu0eyJEwb8Kv5TG9IqyxK38ZSatW9rzP/Ho7aqd1E6MfV4n09Vv/NnRmlP1deGv+Fx
  XvVXIdsSsXZsy6nM16bPum/BkXun+U54ZrTDRRj7kmHntToWSqerTwidc7OrRfOG575GvWnah
  VGCMVznT2afCmkPLjrA9EuA33r2/ffLJkAudfRhUniTdaIX4yat/e+9nJzXpdseqm6cccFQsl
  luKMREMt5qLiRABqONMVUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1665477578!314346!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20925 invoked from network); 11 Oct 2022 08:39:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:39:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7A4BE10018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E7EF100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:39:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
Date: Tue, 11 Oct 2022 16:39:19 +0800
Message-ID: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171611

Changelog:
==========
Fixed a crash caused by trying to deallocate already freed graphics buffers in certain situations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
index 5f776c13e6..708201043b 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629"
+SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.25.1


