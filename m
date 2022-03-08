Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA054C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:35:04 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6817.1646735703463962373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eHnnFEFg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735701; i=@fujitsu.com;
	bh=0AASe3p2mn4J6sCsHT5PsvYzEmm56BfOJfX5tT9mGrA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eHnnFEFgSChIW8yg6WdlWNwYldCFXAeYIhW5kjubG7M8S4RxGAPG3nNhnBOIbRmCp
	 Rfs9eDlRVXl5ITL96WtGjJU6RT9hwdChFm1gVip91NbuaYwHubMZENT+Oxd5rxPUKI
	 wupn4ozH9R1KIYgGXFK6wCB9fbn4IWRnr69uKiqmMsROwCswUqatB0Ez+WUZ5XnIag
	 jGdpmo5cdMqe+IHEg7zxDggFe1RCRsA+uHCKv47TkO8eYZQIgSq+CzapfIw21Tqy9e
	 X1M7AWruunxIXkpVKjkt1gn3Kz5mtQPuyMwm3bxjgbdK9OLFRGJGcJDMf0LsED7JAI
	 TT1gDVH/Fm8IA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqBtiqJ5
  kcHO1hcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFn32LmgrMcFcsvT2VvYLzJ3sXIySEk8JhR
  Ytr1Qgj7PJPEnu3CEPZxRom188JAbDYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48bsHbIywg
  JXEl+sdYDYLUHzZpj2sIDavgJNE2+GXYHEJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKEr
  MvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYx2iYVZaZnlOQmZuboGhoY6Boamuq
  aWQApvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUu3DvYLzT91Pv
  EKMkB5OSKG89m3qSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnePfpAOcGi1PTUirTMHGCEwKQlO
  HiURHhLtYDSvMUFibnFmekQqVOMilLivGtA+gRAEhmleXBtsKi8xCgrJczLyMDAIMRTkFqUm1
  mCKv+KUZyDUUmY9zXIFJ7MvBK46a+AFjMBLbYzUgNZXJKIkJJqYOqZV3tC88oppRlN/dX8Luo
  7L02f4X4xo9OxYCXTYjHRBuFVi5XKImcs2ndD9fancG2b2i0MB7P5v+/pdkmYuTYrM1PCpIP/
  1C2F/0r3fiReL/J7KvYlV5vh2UWJsF9COz5M/qXAF/4zmmVN2VnOsg0H086m+62e16iyRspbq
  fee1np3+6ZHb20sBZaee7xE+0TiHQt99fYcldSJn64xud55VLznjYpJY8WPq8Jak7OPrZ28hq
  O/O0fOftr1F8svFPD/lgpeaO8nqjmtdNOvCF6T8+tr98+uM7jxyuY8a+Yys+PXA95G2kyI0Pn
  /ovvntPnWeSoTt148t29BHq+Uw8F/02d+XNnvIFPnmCbXvEuJpTgj0VCLuag4EQDeSMiARQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-545.messagelabs.com!1646735700!3547!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18812 invoked from network); 8 Mar 2022 10:35:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:35:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 55B0B100198
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 45F1C10018E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:34:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.17.0 -> 1.17.1
Date: Tue, 8 Mar 2022 18:34:32 +0800
Message-ID: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162896

Changelog:
=========
* configure.ac: Bump QT LT version to C15/A0/R0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_1.17.0.bb => gpgme_1.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.17.0.bb => gpgme_1.17.1.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.17.0.bb b/meta/recipes-support/gpgme/gpgme_1.17.1.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.17.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.17.1.bb
index 382b2472ed..d95ed6c299 100644
--- a/meta/recipes-support/gpgme/gpgme_1.17.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.17.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            "
 
-SRC_URI[sha256sum] = "4ed3f50ceb7be2fce2c291414256b20c9ebf4c03fddb922c88cda99c119a69f5"
+SRC_URI[sha256sum] = "711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS:${PN}-cpp += "libstdc++"
-- 
2.25.1


