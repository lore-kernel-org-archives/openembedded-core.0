Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE90C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:05:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.5181.1678003519689116455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZhI0DT1A;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003517; i=@fujitsu.com;
	bh=sBuUpttmD/fWJjYW0GMhPnsYcU55qTPID2y9NylxwUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZhI0DT1AgdVibid6p58ggav08K0iPEHqAqojLvTJSlUl6J4ey8ZojGYP5kV8nPGJF
	 61j2lXjoWJqaQ0gQeLVYqtqpPgoJDvcfDa3Jr1pw/G6pylrmTLeFKtOvL1yegMa0Dy
	 Te7C/tsCPsdLjtnc8TydKxTxbYMz3M8SiThqKQLHpnH4/y4Tqe+49ddAeyQrbIeFL+
	 7VCVE8uOPgf7zXSL2OLawu2zGpxC1T8roibce50EVLHZbdzFsdk1pXYSOk2AqR0ztL
	 6iG5592e3OtLwf8moU2dt2k3cG1RjLL7XnpG8GZDfNyIkUfEoUXz7lsLbgtBfEOase
	 qDwt+gn0H2mtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqGvry5J
  i8GmmmMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnGpaxZzwUTOihuruRsYF3N0MXJxCAk8ZpR4
  Nf8NE4RznUli74YTbBDOHkaJA98msXcxcnKwCUhJ3Lj/HyjBwSEioCdx9Z8oSJhZQEXixe8es
  BJhARuJtXd6wWwWoHh/z01WEJtXwEni9d95YHEJAQWJKQ/fM4PYnALOEivmvASrEQKqub72Nj
  tEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQEj0yp
  G0+LUorLUIl1zvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSS
  TYzAwE0pVp65g3FZ31+9Q4ySHExKoryBv5hThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwPnVjS
  RESLEpNT61Iy8wBRhFMWoKDR0mE96EnUJq3uCAxtzgzHSJ1ilGXY23Dgb3MQix5+XmpUuK8W7
  yBigRAijJK8+BGwCL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXicPoCk8mXklcJteAR3
  BBHSExmkGkCNKEhFSUg1MywyX+97MkNj3vmGXmfDOy/W3w30LKjYcmpTEW9D2xMAhpD9k6qPH
  S8/+CTKsYAjZ+9g5LFVP56LAp2qJVwY6nF/Erijz7zQtf8+Y8ue8mUtxRsLdnXpLS+unHtzmX
  eLW2fIq001HlIe/9I1U/fTtq07/FuE/tVwjt6El6MsD5hNKclsyig9Y2xrUbD+1OpqdsUgm+Y
  u7xO+t+3cX2AruULGboHKX6csBgQUpnzvM+zKE12+VbPD7la5v2nX41jKODxc+i1dszrB6wjN
  jgrT/ez5pt0i2U+khCyYsbJvGprtwssYKidunZ67WCWszCpXU2J0aYv/9aecJH726rb33D/9U
  Oc542nHRqwCNtEAlluKMREMt5qLiRABxNECyYwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1678003517!294690!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15304 invoked from network); 5 Mar 2023 08:05:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:05:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 166FA1001A2
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:17 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 09F0C10018D
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:05:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] font-util: upgrade 1.3.3 -> 1.4.0
Date: Sun, 5 Mar 2023 16:04:57 +0800
Message-ID: <1678003500-30452-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
References: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
gitlab CI: stop requiring Signed-off-by in commits
Add COMPRESS_FLAGS to pass options to compression command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-font/{font-util_1.3.3.bb => font-util_1.4.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.3.bb => font-util_1.4.0.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
index 64c705770d..db82104afe 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
@@ -16,7 +16,7 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2"
+SRC_URI[sha256sum] = "9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
 
-- 
2.34.1


