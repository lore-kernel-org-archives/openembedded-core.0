Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A51C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:10:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.261.1668309051712667829
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dxPRYGqa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309050; i=@fujitsu.com;
	bh=MKJNw8OgPM+udr7L+VupsBCFeIv3/A+++7Uj1E2lK7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dxPRYGqa9GEE3wp2fWub0zCPSqaYcnjCrlELdCRcbMjti3AmqoVpZBgvIoPSDvGgZ
	 zXLEQ0GjZT15VZ8GKs/h1dfSnZQvcviLn4hYG6aTK9man7mdA+1tnFQRo1ZSlLe4Jh
	 CHp07clQRBU8ds3rjU3O80uV2Y3lvCbP1V7QXEQcUebVXNLrou3+pyWkpsJqmUDSfH
	 jeFLeU6Kq6qQL7GZyfnOkH24PgW2xM/IGTG1cefP/7Z6AGPatQhkeC0XlKCbJwWwCo
	 bZzWQr10x2w+iT9EveRikeLPwO1OC3LP4hsVkktxg6E3DkstZnYTo/47ra9I3yjhw0
	 Ar6TMInxFrQDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSdcioSD
  ZYN5zFYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPeXO2CeXwVLTM3MDYw7uDpYuTkEBJ4zCjx
  8atOFyMXkH2NSeLovFtsEM4eRomvx1sYQarYBKQkbtz/D5Tg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAosf7EFLByFgFViS1PrzGD2LwCThKHT79iBbElBBQkpjx8DxUXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtooZdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGIgpxSwPdjDuWPZH
  7xCjJAeTkihv2vX8ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvL8jC5KFBItS01Mr0jJzgFEBk
  5bg4FES4a2wA0rzFhck5hZnpkOkTjEac1yYfnUvM0fz/98HmIVY8vLzUqXEeRPigUoFQEozSv
  PgBsGi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd610UBTeDLzSuD2vQI6hQnolO+ReSC
  nlCQipKQamFYnnlI09yza1WIp+PL0bNsrPa/m5262OROXGF2UWPjIXP1096xjD753aXUFcn/y
  vL61T+dzIY/704VfWa2i9KWWc1Rc1E8tWFqRHVSwKjNgds9r882l/ct0Hs76rbb+malY0iefp
  5seeR7piFdcFe33MeZySMRGI2VDwXu2AlcFBC5JJ+27ctpnccuZdYeao+7lvlR8J24+/yXf5q
  ntTxPWVlXoZN51aKzTEDKdXrlzamrg9xObN/a61Mx+b6f/QO3Aukru87m5gn9L1DI2ce/4cLS
  ++6qb9MtZsxdsjLxoNK/+39x/8sr33q15eSvNO7RkbUn9l/9+k58Z79rX6+eYUvIofv1kA6af
  ad0XrZVYijMSDbWYi4oTAdqqXWxRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1668309048!853975!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7471 invoked from network); 13 Nov 2022 03:10:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:10:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3D8DD1000E9
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:10:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 314511000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:10:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:10:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sed: update 4.8 -> 4.9
Date: Sun, 13 Nov 2022 11:10:29 +0800
Message-ID: <1668309029-15189-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173180

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
-URL of license changed from
 https://www.gnu.org/philosophy/why-not-lgpl.html
 to https://www.gnu.org/licenses/why-not-lgpl.htm
-Copyright year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/sed/{sed_4.8.bb => sed_4.9.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sed/{sed_4.8.bb => sed_4.9.bb} (90%)

diff --git a/meta/recipes-extended/sed/sed_4.8.bb b/meta/recipes-extended/sed/sed_4.9.bb
similarity index 90%
rename from meta/recipes-extended/sed/sed_4.8.bb
rename to meta/recipes-extended/sed/sed_4.9.bb
index 31e971aeac..c4d89c34b2 100644
--- a/meta/recipes-extended/sed/sed_4.8.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -2,8 +2,8 @@ SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
-                    file://sed/sed.h;beginline=1;endline=15;md5=fb3c7e6fbca6f66943859153d4be8efe \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://sed/sed.h;beginline=1;endline=15;md5=4e8e0f77bc4c1c2c02c2b90d3d24c670 \
                     "
 SECTION = "console/utils"
 
@@ -11,8 +11,7 @@ SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "6d906edfdb3202304059233f51f9a71d"
-SRC_URI[sha256sum] = "f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
+SRC_URI[sha256sum] = "6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181"
 
 inherit autotools texinfo update-alternatives gettext ptest
 
-- 
2.25.1


