Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682C8C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:33:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.11775.1642429993688330103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Jn/plRTE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429991; i=@fujitsu.com;
	bh=aM1Qjh8grYhXVgO/8PP9c3+dkC3f7SQmwaFxLEEHza4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Jn/plRTE5oI4v3blLZSdxotGtbf7cpEx4g9AZXkfjFtuyDSXzYWaJe0C96v5OKN1f
	 oZ7HSMOa2dk2i0ovSXF5fF/teQgLOQzBVTGD8j+qPyEi9WlPWUZuFmI4/2ATJd+3nk
	 u4ayCt4IWlJhYJWseqfzggk8paM+PBdIuo8b+XKMUAXPnKOyMbPNIrFZdc9B3o39C9
	 SrCbpXOcMpyCPYEPt2T7T+xLGtF769OEA9NYNmMVOHmWOIFy1iQNgPvQ2+wcsT3JDo
	 u/TUF0gPqXJWyK1h8EOATKgYMntDOqMUBImf5YtsyT2nR25qVzku2N+YkTp1beRIn9
	 Zq4NKM78zzV5Q==
Received: from [100.115.7.63] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id EB/A8-10124-72E75E16;
 Mon, 17 Jan 2022 14:33:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRoqte9zT
  RYMZHPos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNn9wW2grUcFWevrGJpYDzP3sXIxSEkMINJ
  Ys37JcwQzglGid/HTgJlODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHrASYQFjiU2f7
  rOA2CwCqhJ9c7vAynkFnCQWzAcrlxBQkJjy8D0ziM0rIChxcuYTFogxEhIHX7xghqhRlJh9uZ
  kFwq6QmDWrjWkCI+8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGiqa6JraayXWKWbqJd
  aqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYXinFLLE7GLf2/dQ7xCjJwaQkyssZ9jRR
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv7RqgnGBRanpqRVpmDjDUYdISHDxKIrzatUBp3uKCx
  NzizHSI1ClGRSlxXmaQhABIIqM0D64NFl+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzZo
  JM4cnMK4Gb/gpoMRPQ4lUfH4EsLklESEk1MNX6b7V6vs+3pvtICf//O7xK0pzBIXIOXVU/H6Q
  uWb7+d5eSxNuGxwv256kkrzotV7Ylbor8n++7+4uqz+mtdDR7ZF9pO7lW6nbFRJk/aWs2sv3+
  bLHvHc/Bg0VXngTx/qj6aK758uKBub1RgnZrLRf9df8b9FfqZeDiL07uxnoP/E7PsNz2SZRnp
  kt3xq2Ml1p+mmGnnzue3/P3aUcYp0DXy5WsonMkNLunhESKn6z7krBZNYd/x9IH/azcFbwtCu
  tWy+93fpXtFrExyW8e56t/Gy80G0rfvvX2grNPiLib76UlDD5n7wgsO5P9Zv3lzws3thofFvp
  5nZthsoTXn1Lzt9nHPMNjSsxrfS42bFJiKc5INNRiLipOBACebkDrKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1642429990!25704!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26005 invoked from network); 17 Jan 2022 14:33:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:33:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20HEXASJ024473
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:33:10 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:33:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pigz: upgrade 2.6 -> 2.7
Date: Mon, 17 Jan 2022 22:33:01 +0800
Message-ID: <1642429981-13967-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160652

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/pigz/{pigz_2.6.bb => pigz_2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pigz/{pigz_2.6.bb => pigz_2.7.bb} (94%)

diff --git a/meta/recipes-extended/pigz/pigz_2.6.bb b/meta/recipes-extended/pigz/pigz_2.7.bb
similarity index 94%
rename from meta/recipes-extended/pigz/pigz_2.6.bb
rename to meta/recipes-extended/pigz/pigz_2.7.bb
index 3566e18b7e..9a1c591b27 100644
--- a/meta/recipes-extended/pigz/pigz_2.6.bb
+++ b/meta/recipes-extended/pigz/pigz_2.7.bb
@@ -9,7 +9,7 @@ LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
+SRC_URI[sha256sum] = "b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707"
 PROVIDES:class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.25.1


