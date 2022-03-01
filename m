Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD2AC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:53:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.7209.1646135596261993619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RZV2KjUO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135594; i=@fujitsu.com;
	bh=JHvfq2cniYuym1brTZTb1ZwYoNHAbAVvgg5AacV9EFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RZV2KjUOWCJQHd/hEx35ADPLOAp4gyb/pgKSO50PAHqm9WFvY38yqeSCe3DDlx2Y7
	 6V48/aFnSXJsbVqq7BF2+1CtiQd/D7YBO50GU/rPfagbSq2Tpmb1YRxUgVxZcQyn6p
	 3lmQhpHyOaviIaN7qvDnQNk72Ty3c2qjNYebEjlrJrcN0BSkMJk/61suVoY/VhdIw5
	 UhMwtgPCFg3UFrs79/MeuTPBEGXxegnl9D0AVwJfSTVecllEwwzwTvZnIojFReDcsh
	 Mg1j/yL5NH0CyVfhetMpcSraHvzeOenUCZTLgy60m8DRDtVKLeJMtnteVyE5JLMw+7
	 e0kpoSmoDsdlg==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 92/1C-21232-A290E126;
 Tue, 01 Mar 2022 11:53:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqKvJKZd
  k8OWiucWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHx/E7GghVcFWevr2JvYFzB2cXIySEk8JhR
  Ys1Xzy5GLiD7PJNE99FGdgjnOKPE7mdfmUGq2ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFzi2tZVYOUsQPElz9aCxXkFnCS2/DjEBGJLCChITHn4HqyGU8BZ4t/tR8wQRzhJNF
  1ZyAxRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrDWqmmsTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprqGukaG5nqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIEhnFLMeHMHY2vfT71DjJIcTEqivGo3ZZOE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfBuZ5dLEhIsSk1PrUjLzAHGE0xagoNHSYQ3jgUozVtckJhbnJkOkTrFqCglzuvBAZQQAE
  lklObBtcFi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4tIFN4MvNK4Ka/AlrMBLT4b7A
  UyOKSRISUVAOTzKeASMuFHaqzDM8YVP47/FWrWdftqOBBqRaO+zsvv113kkE+U+HNtKVHDYr8
  ft/csc4+J89732d/0eyoH0aaNWnNa5SmiCYt2C3hV3/5XHleuSz/5i3s/2yOTskXPLHgeGHGA
  VELce8zZTN/NAdIld/oVUg9aPQ4WU44U3L+llaW+vId7fkPrHpNglbPMF0XMdks4qGnVLmzv9
  rct6HXcyLd/MzOlfUwBb79O1v8sg3bYbd1rj51VtOjFloHcao1WXyYUHLUWzXhuoZmicRGnSi
  v6w7Omq4iBxbmHnjOY23rs/vYMr55yxLULXbUXpjAdTk+vqI5ctHWb7/ZpznLzdv9ySC6ZYPT
  dJstd5RYijMSDbWYi4oTAYxLixxcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1646135593!3785!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12608 invoked from network); 1 Mar 2022 11:53:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:53:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5F9DC1001A9
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4EB2F10018F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:53:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.5.1 -> 4.6
Date: Tue, 1 Mar 2022 19:52:50 +0800
Message-ID: <1646135571-38971-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646135571-38971-1-git-send-email-wangmy@fujitsu.com>
References: <1646135571-38971-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162545

License-Update:
 year updated to 2022
 version of library updated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.5.1.bb => ccache_4.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.5.1.bb => ccache_4.6.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.5.1.bb b/meta/recipes-devtools/ccache/ccache_4.6.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.5.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.6.bb
index 11d939c7aa..f019679cf1 100644
--- a/meta/recipes-devtools/ccache/ccache_4.5.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fe0fdfdc7a892516526b86c28d06a16"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=ff5327dc93e2b286c931dda3d6079da9"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "f0d3cff5d555d6868f14a7d05696f0370074e475304fd5aa152b98f892364981"
+SRC_URI[sha256sum] = "73a1767ac6b7c0404a1a55f761a746d338e702883c7137fbf587023062258625"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.25.1


