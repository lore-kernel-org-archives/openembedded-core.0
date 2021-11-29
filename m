Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A16C4332F
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:00:16 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.62055.1638198014848866563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WL84oRai;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198012; i=@fujitsu.com;
	bh=dQEB468WU0NRDrwDT21KAoPM2PcXQkj3nWpuyudtlx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WL84oRai3Vps1YgoBnZcLE75B0uePtINWmozJZkXPA9MmBerFRsYa8NZQr6E6QE2u
	 OVR280rBThCCVIgbSoHcI0xg3bKnB05ndZ/c8eYRvK6hkL2dYha3VVFN6oFZnvptID
	 JViMoGf6hY9z3ZU3LH4PYxeoozt/PQ94xEDB6jYZOfdIVWkVsOBvtyOikqLjbmVNUz
	 qav6Vl4e0x71frXGuvvJ/2KkmRI+01eLtOoRY65XxaMHPTzButpSywPD7XeEpgGam3
	 G7oWbS1V5AF2ww9nKKr4k8SB+GhnIjCzsl8fPGfKGzbAHuKmEbrByvsHb59vTnX7WS
	 +0o7bemUZgL5w==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id B9/BC-06911-CFAE4A16;
 Mon, 29 Nov 2021 15:00:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqPvn1ZJ
  Eg209khZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b00wUFZzkrbs9UaWC8x9HFyMUhJPCYUWLj
  zhVMEM55Jok5M/ZCOScYJR5tfcPcxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg
  4SFBRwkLs2tAwmzCKhKXH3TwgYS5hVwlti1KB8kLCGgIDHl4XuwgZwCLhJvp51mBikRAio5+r
  8WJMwrIChxcuYTFojhEhIHX7xghmhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FTXWNfCTC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzBwU4qZw3Yw/un9qXeIUZKDSUmUN2vJkkQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErz7nwHlBItS01Mr0jJzgFEEk5bg4FES4S1+AZTmLS5IzC3OTIdInWJUlBLnTXoJlBAASW
  SU5sG1wSL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tcgU3gy80rgpr8CWswEtPjt0sU
  gi0sSEVJSDUzRpVwiuok8K/gWuPs1ztN68Hbukp/PmRuToues6RFa8+OdUYbnqqdyfvJZngIV
  Pd63T5d/2isiLPROqHb36m3NsT7O7YYP7sV/ubdp5c+tKjc2reWXqf1T9eJ+k6Og8eeulCUv+
  0rLGydlTf+whl9FitfUXdYpkUOz2iHNOztJw/CfXZiVyWIxu3t2jhebDOecWrXg9UXXJQJ97N
  fkSlUOT65XWLNE74qCEouU+3SOV7Jb07vzkhTv1RUcW16tO02zOPAAm1i84/d+K95zH9e6asf
  trNghlGOh1ZQZ1zrD/4OlLafDipdM98pMQ7d+9prSVquosFDvx6R1ya0/vx9KaO+cxS50tMFm
  ua2AEktxRqKhFnNRcSIA8rFUXVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1638198012!46796!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15236 invoked from network); 29 Nov 2021 15:00:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:00:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E45721009E5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CF3D6100242
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:00:06 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsoup-2.4: upgrade 2.74.1 -> 2.74.2
Date: Mon, 29 Nov 2021 22:59:50 +0800
Message-ID: <1638197991-118955-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
References: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158942

Changes in libsoup from 2.74.1 to 2.74.2:

    * Error when libsoup3 is already loaded before libsoup2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup-2.4_2.74.1.bb => libsoup-2.4_2.74.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.74.1.bb => libsoup-2.4_2.74.2.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 7f1ceab431..9b3a57dab0 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dc27a3b8fa30bc8ff950b5a75958757d2242e3e51e4e2d9c4e623ef75f793bf8"
+SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.25.1


