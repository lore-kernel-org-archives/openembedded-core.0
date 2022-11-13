Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20925C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 02:56:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.148.1668308187848361520
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 18:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D7hgy4iC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308185; i=@fujitsu.com;
	bh=NCLvnqMEH4uhXUIxBK03GM4xO+nwZhj8kocNI7duX8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D7hgy4iCHPk6uui4jMhGisy3SnK1/eaK17pyf/GIrfuHTX2ua/HBXqdSvvp8wGpRK
	 D3H94FBoDdNP1iBVRaieDvDQSjoeUVmo+YC9oCDOb2+kPeBB+YWW9Uy/22N9opL50b
	 k5XVrfBwPKFFDl9z7mfc0xdquFTYQLhGI9oAiF6SopcKZqKWcNqFA9Rg4bAo91O9ke
	 PplRzKQsBeiEaiJ7FtrPmJ7m+LSTZ7Q6Lt1bJgUxKMyU6fxqRIqdG+2acArFhEfK3/
	 4EBn2byXfeSnkXfS1Y0TEDUMGacduabp1ywyuf+zrYpU9m8wAn50G9RciFE/2lEQDW
	 ovePfTP8Y+MBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSfdGTEG
  ywdHtnBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bcVZYF9/kq3vXOZWtgfM3TxcjFISTwmFGi
  eddtVgjnGpPE5qsPmSCcPYwSS373snQxcnKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAncSz3/fBbBYBVYmTf5uZQWxeASeJvs1XweISAgoSUx6+h4oLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0LU4tKkst0jXVSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxJRipb4djF3L/ugd
  YpTkYFIS5U27np8sxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3d2RBspBgUWp6akVaZg4wKmDSE
  hw8SiK8FXZAad7igsTc4sx0iNQpRmOOq1eu7GXmmPm17QCzEEtefl6qlDivN8gkAZDSjNI8uE
  GwaL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3XxjQFJ7MvBK4fa+ATmECOuV7ZB7IKSW
  JCCmpBqaOWWu/mDHOKvm2aJaX8OqL0dOipKTDpb3n99qsXMfrZ7JNU7rhgtoXkVlVYoeSTxzm
  +cubsP5//pqkhQW5iZpv53jVWPrNUFRJS326otlwY6nrxRnTjGvPBDGozix8GMvPODPET63n5
  ISlb13uZN+tWn15Sa3TtQ9/Aq3+LDh8pyInS66+Iupp3ZxXn6cpunxrfBHXcVvL8I3KdNZbr1
  +v3LHtTM9WQfnmXu+GM15G99hdf/18wCez+ZCvZ+rzx/85M2ta7oc/Wf/7aN2O1Rk7Gtzs9md
  OVvwy80DH3zt+tpkP1rDczsk9Ib3mryof+y5xOwtWw2Wasqc2LNbaoOicWt4779US03fzFzVu
  WaauxFKckWioxVxUnAgAuymumVEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1668308184!401691!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13745 invoked from network); 13 Nov 2022 02:56:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 02:56:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D8DE11000E7
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:56:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CC8081000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:56:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 02:56:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gi-docgen: upgrade 2022.1 -> 2022.2
Date: Sun, 13 Nov 2022 10:56:04 +0800
Message-ID: <1668308164-14420-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173166

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since 2022.1
--------------------
* Use const.*.html instead of constant.*.html for search index links [!146]
* Remove "terms" from index.json, rewrite commandline search to work without it [!148]
* Add interface type description [!149]
* Fix failure to generate link to error domain [!151]
* Make log.log() thread safe [#129]
* Quote string constant values [#128]
* Set the license of the generated documentation [#133]
* Support (scope forever) [!155]
* Add a way to frame images [!156]
* Use the appropriate namespace for indices [#137]
* Fix type annotations for Repository packages and c_includes [!160]
* Add py.typed to comply with PEP561 [!159]
* Add links to external classes in the hierarchy [#132]
* Use definition lists for callable arguments [#123]
* Improve styles [!165]
* Use definition lists for callable arguments
* Clarify generated description for GError arguments
* Clarify generated description for nullable in/out arguments
* Add emblems for versions and stability
* Require a sufficient minimum dependency of markdown [!166]
* Add a "serve" command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 6a7124c3fe..9e5adca3df 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2022.1"
-SRCREV = "37b04455ff58cb2ec3f58917d0737c435344f2fb"
+PV = "2022.2"
+SRCREV = "bddd024b08650efdd24704c670f586eb12cec9c9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


