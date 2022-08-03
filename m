Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DCFC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:40:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6276.1659516047363765692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=go6zeXTh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516050; i=@fujitsu.com;
	bh=iLGnuyz8F1mxbnkKYYpsevEnqTOhaR8tRS8i6eDWxo4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=go6zeXThf7XsZSHMbeKFxVvRHD8/ajfuonN+1+40hDXIDFoolYwiYQVzSa8DkMqtj
	 r9unNRuhuj0DeqPdKmbvIfUfmD7mR8gP3aHC5IbBL7hTvlGzqV1Fp/gjWlI+5/af3h
	 PAUt5x8k9sE4/Uav85F5iugj1J0pqi2Y8ySHBi75OF0BFpmWNtUS9Z7Yu4w4iOHxP3
	 CRp01fhC01wJt4JHMQlPhLokRnhMXw6alJnuk806Enjn96I4a/a/og21trE2jQ0/+B
	 6TNmIuHs7T1SHd0zXdssTZtFJhIcLszDyNPJT/E9gQ41x1KnQW5UbAYwD8rg+vAbdj
	 OimFfJm5W4Vhw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSXeiyas
  kg/cfDS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oy5+5oYC5q5Kjbt7GFrYJzA2cXIxSEk8JhR
  YsHEu6wQzjUmiSWLZrNDOLsZJa4de8zYxcjJwSagJjH91g2gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICrhIzp61gA7FZgOKftv4Fs3kFnCR+XFsJNkZCQEFiysP3zCA2p4CzRN+pBhaQkUJANS
  0vTSHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itEoqykzPKMlNzMzRNTQw0DU0NNUFkqYmeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgSGcUswwawfjrL6feocYJTmYlER5mRRfJQnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4M3QAsoJFqWmp1akZeYA4wkmLcHBoyTCK6wElOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl
  6qlDivnjFQkQBIUUZpHtwIWGxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMq2oENIUnM68
  EbtMroCOYgI7Q4XoBckRJIkJKqoEpofKht97zMqXijJnf+x4lbmxzMXqXGRsguuDCtK0+8599
  WHS+dkvzJb51btVbq66WCmw031fIuD7gSfefxws2PBG5+TKdf2mFu8etDN8VKrldBj4btxlFv
  GMPUxRwPV4/5b+/lKGgGcNe9eObjJijC+0DtqlwXG+rWVI+dftpz2hfE8/Kma/X1cQt5DrQtz
  rBM0/MPO7gyocbjG4sOJ546Ae/258DalN90mtFL+RrtOt/1OJ238S8oECo4X+alvauT7d37H5
  5K/GoedjCZY8+7q5/9CrR/Dz/ZeEHz1l/5hlK6TnsXNcWKdw4938gf7fBv2svC3aJZljXfb/l
  7i9qfu1muLjmgz38rMrvTMKVWIozEg21mIuKEwHeqEYpaAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1659516049!134377!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6962 invoked from network); 3 Aug 2022 08:40:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:40:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5B6801000CE
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4E8411000C2
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:40:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.28.1 -> 0.28.4
Date: Wed, 3 Aug 2022 16:40:29 +0800
Message-ID: <1659516030-31123-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
References: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168805

Changelog:
==========
    setup.py: Fix ModuleNotFoundError
    ofono template: Fix conversion to f-strings (Debian #1015286)
    Ship FMF tests in release tarballs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.28.1.bb => python3-dbusmock_0.28.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.28.1.bb => python3-dbusmock_0.28.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb
index d6889f4313..e895d87b7b 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "6434e544c055e3570b20e341e50a3d2dd50b19d9e55d579b919e14879f9f1e57"
+SRC_URI[sha256sum] = "52ad024a44d46602084fd91c0c467ab95b7ecf27c4e2168e0d2160623f18c0a2"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


