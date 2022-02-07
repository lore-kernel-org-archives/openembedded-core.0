Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D8DC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 14:29:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.22836.1644244170134927026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 06:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XbeFmmZd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644244167; i=@fujitsu.com;
	bh=5RgSdeiy/YTTFVam0ym9sGc4421S4ij/ooK2Pr+lDV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XbeFmmZdXDl0/ipxlK/JeMns31v3ucwmRAslh43ngGIIo+as9cCJVTaYWg09Ss1My
	 9EErRKfYmF0ShWF1otZCpEPu+ArFlm1gAez4lFjntI8K7iZlIVsPdZLZwpb5icEv7N
	 ElXq8U95DrLGE4PUS1T2a78WAW0uqvLS5z2OqlTwmbQBg00qup3ghx74ar91MJ5eSF
	 S38/oaI00FwddS+B17EkynfxbgBYMrsfxOv6fSp5DQhZ7HIk45f4Pa9m0tMI2+9VOd
	 dfVdWNo+06/QeAg/VCmWJ9TRE8tap8GMSVsXDHo4CFTCXD7DLbp0c12rLi0f6SUXTa
	 +klsaN0aPKq4Q==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 14/F4-28285-7CC21026;
 Mon, 07 Feb 2022 14:29:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSfe4DmO
  Swf570hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a7n8sZC6ZwVbzZ5djA2MfZxcjFISTwmFFi
  78w77BDOeSaJX1/msEI4xxkl3s3/ydbFyMnBJqAmMf3WDaAEB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFLiTNNs1hBbBag+KXXx8FsXgFHiVXXJzCC2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TXTNTI00Eus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzJlGK2SzsY
  5/b91DvEKMnBpCTKu+UzQ5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4TGoxJQoJFqempFWmZO
  cD4gElLcPAoifAmawGleYsLEnOLM9MhUqcYFaXEeU+AJARAEhmleXBtsJi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmYd7c20BSezLwSuOmvgBYzAS3+uuhfItDikkSElFQD04YgJmvFTWe
  Urp+qvhtamyC2fMXKpJf5XMmOgW+tW3hVE8wv9qxfwVAncXXFX2/vO7mWi/6/3fC3lzmJJeay
  0F+Fsi/PdLtclnYc2nVi8s1Pls1iPA8XyJ5+ukXunNMr8Y01lxY1ra0JnPvo18TvPh0us1Vnf
  xVQbzKZsTDb8mWfBPsf9Y/c3LoyVS6P3VNf1f0yVhL9cl7ocblWqu5dgSc1QXPm/v/zJ+1+XL
  8sy8zIuGsaFucCWaZ2VhlrCrOIfi5+NiPJ3aUi45aDwRdzqZdJPoIfhbMvtTexbd0/J/qB2Id
  1EhGXF03MVZmiuP+JRJ/fx9PCcnZmUrvXCX8puhrkPnPBlh9r6nUmb77MqcRSnJFoqMVcVJwI
  ACfudQVEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1644244167!1366!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1742 invoked from network); 7 Feb 2022 14:29:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Feb 2022 14:29:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 08868100445
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Feb 2022 14:29:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F037C100440
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Feb 2022 14:29:26 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Feb 2022 14:29:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 202 -> 203
Date: Mon, 7 Feb 2022 22:29:01 +0800
Message-ID: <1644244141-3014-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 14:29:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161460

Changelog:
=========
* Improve documentation for --timeout due to a few misconceptions.
  Add an allowed-to-fail test regarding a regression in directory handling.
* Tidy control flow in Difference._reverse_self a little.
* Fix diffing CBFS names that contain spaces.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_202.bb => diffoscope_203.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_202.bb => diffoscope_203.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_202.bb b/meta/recipes-support/diffoscope/diffoscope_203.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_202.bb
rename to meta/recipes-support/diffoscope/diffoscope_203.bb
index 8273056c59..ec0f2bdbe6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_202.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_203.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cf0d4e1505818403ec8678fd9b8b4c3b955fb1d041c5d826e69f20021bff8a1e"
+SRC_URI[sha256sum] = "d048dbbef81c6a77985f76b9a358e014461ac5c7b36920449fdc999e314654e7"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1


