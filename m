Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:04:17 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.23415.1636988656160945181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vhFBkpVC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988648; i=@fujitsu.com;
	bh=NG0AmKCjsTIguxFlT7sfDNmEuPU0Pd645T0b5q2aPmU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vhFBkpVCwNi8ZSO0G+VmXmjhatEfnsBH9OWYpSr7A0WoyVpfRczpgK7fuJ3AsWqvB
	 VKAc4K9P3EK2szQFeuAmBZfoI8iGmX8Q0e577WAR6P9d0dhQOaLQR4m4m/psZl0YFc
	 rmELa3ueWKtf5U4ISEwirgwEJM6c4d94VsxGtuEY7qcRZZv0FvBm04RLLXGHXoPx3N
	 BYj/ARjjwaaD7e6GJIs4B9CDiEg9Kd7ddCV5RJTPBeVzRN2FDOWKB5XtyagWwJ6dio
	 W0fqts4J0lw+7AwoL6T6KNjYs5dxJLrxcUFNaFeiDkzd6Opd7BL0fQ69Gs385Qohru
	 ChJldW/bnJ6kw==
Received: from [100.113.2.75] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F8/20-29929-8E672916;
 Mon, 15 Nov 2021 15:04:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSfdF2aR
  Eg7cHFS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ow5c+4wFczkrDh/bx9LA+Nxji5GLg4hgceM
  EnNnzWKHcM4zSSzvP8IG4ZxglFjVuQcow8nBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  4CVCAv4SnxuW84IYrMIqEp8Wf2UCcTmFXCSWDV7AwuILSGgIDHl4XtmiLigxMmZT1gg5khIHH
  zxghmiRlFi9uVmqPoKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11jXSNDM30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgSGZUsh0Ywfj
  t9cf9A4xSnIwKYny/tGflCjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnd3KVBOsCg1PbUiLTMHG
  B8waQkOHiURXoNioDRvcUFibnFmOkTqFKOilDjvNJA+AZBERmkeXBssJi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuYNABnPk5lXAjf9FdBiJqDF9vf6QRaXJCKkpBqYmHnTrDfuTrzzyTb
  qa2p7oMV7oaeHKq4pmbLWdjgcKnnsuavGMTPwe/yOW9+nH90+Z/WFZRxPnraszqkOqr58O0XV
  V0w1wyfeRjJOIj5xxfP1pj75Ojtf2uX7nqiafexQY8MCzpeMOmaeSYcz2t2yv/szv9+2Z2W89
  P3gjV5hv+4H7rLoev13taKNsemG3YfUWMNjX90/VN+QnnXy5v1whnUV1+ZVhGmdv3qf72Drs1
  gt7Y0ZR776vVLLuNNw9AX7BIdzS7bPyNT4/4u/++SMPbFzvz1wWaAg2TrlOpPdvs2bWRZtWvl
  gX8y11U2H3ormr9tafvzPAkPTG9HnyzpVm7g4rwRvW2O/6N7vvey7/JVYijMSDbWYi4oTAYOQ
  oQhEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1636988648!1021548!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23830 invoked from network); 15 Nov 2021 15:04:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:04:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0A8E9100456
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F2925100446
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:03:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.8.1 -> 4.8.2
Date: Mon, 15 Nov 2021 23:03:34 +0800
Message-ID: <1636988616-78740-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:04:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158299

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_4.8.1.bb => python3-importlib-metadata_4.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.8.1.bb => python3-importlib-metadata_4.8.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb
index 3f75668431..2e5aedd8db 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.8.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.8.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "f284b3e11256ad1e5d03ab86bb2ccd6f5339688ff17a4d797a0fe7df326f23b1"
+SRC_URI[sha256sum] = "75bdec14c397f528724c1bfd9709d660b33a4d2e77387a3358f20b848bb5e5fb"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


