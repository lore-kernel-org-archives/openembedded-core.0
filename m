Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F790C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 06:21:23 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.13122.1721370072260028933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 23:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=QqK5eTrb;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: w.egorov@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1721370069; x=1723962069;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q2Jv7z/BnybUSl5EkGRZTKu2W4ULgXVRpZ2iLstlkPk=;
	b=QqK5eTrb84faQVDlPqySfwUsA+z3jCZgM9n0X0EHCuVnRGxD1ldJqz9lAbiOx5+5
	RZSSUibdeKF0p2ofK5CXCLQ07mekNu8ciaoA1BuQAZZEu78nbRBaYgyk6blVn2dI
	wIdOGWMZjcAGbbJvfSlvHumkVGTZwPcyarRfJEJU5BI=;
X-AuditID: ac14000a-03251700000021bc-48-669a05d531ce
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5D.D5.08636.5D50A966; Fri, 19 Jul 2024 08:21:09 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 19 Jul
 2024 08:21:09 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <openembedded-core@lists.openembedded.org>, <upstream@lists.phytec.de>
Subject: [scarthgap+][PATCH] watchdog: Set watchdog_module in default config
Date: Fri, 19 Jul 2024 08:21:01 +0200
Message-ID: <20240719062101.373909-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWyRpKBR/cq66w0g6WzZCzu/HzHbtH9Tt2B
	yePcxhWMHv3dLawBTFFcNimpOZllqUX6dglcGQu3b2Ip+MNW8aj1F1MDYxdbFyMnh4SAicTE
	M68Zuxi5OIQEljBJPGvYwwbhPGaUmPHxATtIFZuAusSdDd9YQWwRAS+Jd+feg8WFBXwkluy6
	zwRiswioShxadpkFxOYVsJDYvLCdFWKDvMTMS9/ZIeKCEidnPgGrYQaKN2+dzQxhS0gcfPEC
	zBYCir+4tJwFpnfaudfMEHaoxNYv25kmMPLPQjJqFpJRs5CMWsDIvIpRKDczOTu1KDNbryCj
	siQ1WS8ldRMjKPBEGLh2MPbN8TjEyMTBeIhRgoNZSYTX79vMNCHelMTKqtSi/Pii0pzU4kOM
	0hwsSuK8qzuCU4UE0hNLUrNTUwtSi2CyTBycUg2Mm8MzxXbqH9NqjDhlqxPbsf+qK+/hW4ua
	XvW/mf/7h/bMA5PdYjJcDNduOFC+5fKxh6LB3sx8W3uiYz+fCp3f+s65gHWzjRxHg795csDs
	lZsWTU57wnm54O1sg3qB+80LX7qsLnzq8Sjt9XOfqUqHzn9aO7Xg+GaOQ75ik4/fXbB+SoHn
	637fP0osxRmJhlrMRcWJAAMiEIIqAgAA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202250

systemd started to warn about used but unset environment variables.
Let us set watchdog_module=none which is used by the watchdog.service to get
rid of the following warning:

  watchdog.service: Referenced but unset environment variable evaluates to an empty string: watchdog_module

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
index 647d5abca5bd..cee5fdc2b6f7 100644
--- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
+++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
@@ -1,2 +1,3 @@
 # Start watchdog at boot time? 0 or 1
 run_watchdog=1
+watchdog_module=none
-- 
2.25.1


