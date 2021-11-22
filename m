Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC813C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:59:51 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.7640.1637593190608331984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BlPNfYZm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593189; i=@fujitsu.com;
	bh=Z3TAwtP3zLJHhoago2y6sOrGGNzxKQOhqHvhOgNf2+s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BlPNfYZmGRuB9nCBqG3SJEBqKxCOftOeYHi1x5AvUot8V61clUQVJjaBFtSPieBtO
	 9TqCyxgA4J/R+EFkz5mU2DXCibd2uDfsSRigwlvrtmoZzZmDhcPgNEg4Cqadxz0PUv
	 i0mUWUGZj12VQ7QNLc7p1RsKyzRqgap0cnBqvDoacf6bzHil1gf1JXbQnOIc+XLAZO
	 H1h/RndhMrMGLBeuMg7dCvmj+0vXO2jvKuizpxEUwqhBAzsLnOMk0PVRp3ukfF5XRA
	 PDlnPHM3UNKoWqHJpYBHdPXCr8Yk6n1KTk0qA+Io3n4/eU2z4piBbVM21gTI46PmYB
	 TXKgrohmMj8yg==
Received: from [100.112.194.37] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 16/45-05531-460BB916;
 Mon, 22 Nov 2021 14:59:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVTdpw+x
  Eg3cdPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aF9v0sBR84Kha8XMTUwNjM0cXIxSEkMINJ
  4sDkAywQzglGif/3FjF1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgIPEk
  c+NLCA2i4CqxKxnDcwgNq+Ak8St17/AxkgIKEhMefgeKi4ocXLmExaIORISB1+8YIaoUZSYfb
  mZBcKukJg1q41pAiPvLCQts5C0LGBkWsVonlSUmZ5RkpuYmaNraGCga2hopGtoaaJrZqaXWKW
  bqJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERhcKQWHnHYwvn/9Qe8QoyQHk5Ior9Hs2YlC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHgfrwPKCRalpqdWpGXmAAMdJi3BwaMkwusAkuYtLkjML
  c5Mh0idYlSUEudtXg+UEABJZJTmwbXBousSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeKp
  ApPJl5JXDTXwEtZgJafPr4dJDFJYkIKakGpum//A/cSWApPr2dUTBk9sKH29N0V+1ijqmefEe
  99qXQZSmud9kdG14oPJ0TftvBhFXyfuO8kgV95xtNt0hel0rxux5edDC2e0/wioczH0x5PaPS
  e+bZR/WtT6yPLF74obLnd8bByyVWibOP363ZfvVWvNfWrtXllyMD/58tM/1QOZ/zRzR/Unnar
  bNcSXJNX5gP6yXoHJU9eSXnUDqLnrG31qIsFxd3+6Ne/2p3bKpj+rv7r8bGs8yL2Sr5tm5bb7
  Vxg1Hmty1Jr+++37lhaaOUxt4J5+5d+XpGj0d+zWm2uDcej77KcTEt5tl9UfPnk1TGIKFW4xi
  NTX79YQl8zQGppxt8xdivqHAxPHh21lKJpTgj0VCLuag4EQCm09ykKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-271.messagelabs.com!1637593185!426557!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22017 invoked from network); 22 Nov 2021 14:59:46 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 14:59:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMExjm8028960
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:59:45 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:59:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.13.06 -> 0.13.07
Date: Mon, 22 Nov 2021 22:59:32 +0800
Message-ID: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158575

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.13.06.bb => stress-ng_0.13.07.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.06.bb => stress-ng_0.13.07.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb
index 4c4d8a9c57..b96d16fa7b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRCREV = "97fc3d7795bd36a516b5ec80a9ef85d682d234ca"
+SRCREV = "924a37f50f73207fa230ae27a63897c77ff8e6cc"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


