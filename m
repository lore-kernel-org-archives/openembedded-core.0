Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.3235.1616642899108915618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 20:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g+mHYKLm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616642897; i=@fujitsu.com;
	bh=jNyd4PMMSmq1j+52ryyLHsLu1pXAMLyU3VFLsMx+28w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g+mHYKLmB80LuJdEZtBhQarGInsRqfuBGLds0D2eRqXSvGzMFdqslyZb+dYKnLUZF
	 foAJz1rktOEOZ27zKe2+qwLacKnnsR9JhDc61hjXNAfLs5W5X3vSnn7aci7LcXJxBt
	 HCVzgPG+2p66q/npz1Y/eDc8oRAjlJLcrpocDseExXXwg0kBZEBnzJe/c5e6cYrW16
	 oztIqvQnW2TbihRlzW1EVvvfPmyR1vJrN5suNJfEfBIc8uuSRockNlb07P9wDCWTlv
	 i/J9CLgxsJb2qGE7XdKyy06JKtL/s97TDu2uyXwcSswwoTLFhTNqkICO3NDMYIYxDn
	 R4nkdD6DbITeA==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 6C/3F-55623-0530C506; Thu, 25 Mar 2021 03:28:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVTeAOSb
  B4M8mVos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPnlTOMBa84KpY8MGlg/MTexcjFISSwmUli
  +8PrUM4JRolr5/8xdzFycrAJqElMv3WDtYuRg0NEQE/i6j9RkDCzgLrEpXUtLCC2sICdxJ2Tp
  1hBbBYBVYmOrVeYQcp5BZwkfjYng4QlBBQkpjx8DzaRV0BQ4uTMJywQYyQkDr54wQxRoygx+3
  IzC4RdJbGmYxrbBEbeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdY19DSRC+xSjd
  RL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYXCmFzId2MD55/UHvEKMkB5OSKK/1hugE
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8uUwxCUKCRanpqRVpmTnAQIdJS3DwKInwWoOkeYsLE
  nOLM9MhUqcYFaXEeUVBEgIgiYzSPLg2WHRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM68
  kINIUnM68EbvoroMVMQIs3/ogEWVySiJCSamDqbWbI32od1jJ74kqnCEMFH49gvpmrvTgkFDZ
  tjlz3quVAyWsxl4SVdnv1MvT03fk1ojUl7klbn7UJZjVdLvpK0TpzXu7UAPPLzWxaZhXSfuwh
  WVdWNp3e2/G2y/mfyiFNO7aZBS/enRA/fOrmqzV73T3PMLx98S3gtn21+r1X1xmDpi7evmV/l
  OUaPTsVX+2yj3YL09g5efZuStRdycpW0p4bu3vR2QVzzNbGejxwZdv8JHK/QMzl04kMnOvXB/
  n0u6rdXcfbu9fx68HUCy/4DxxdGRL9c9bB27c4LC6b3Xmg6HzeuDP5kulRwS8szQ+bIoS4417
  eiT65cccG9g6Ha9+c816lFmnHWYmdrldiKc5INNRiLipOBABzy4bgKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-232.messagelabs.com!1616642895!2271!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32067 invoked from network); 25 Mar 2021 03:28:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Mar 2021 03:28:16 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12P3S9NV017660
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 03:28:15 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 25 Mar 2021 03:28:08 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] webkitgtk: upgrade 2.30.5 -> 2.30.6
Date: Thu, 25 Mar 2021 11:28:00 +0800
Message-ID: <1616642880-44580-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
index ff4c496e2a..f5d55a2c6f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://musl-lower-stack-usage.patch \
            "
 
-SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
+SRC_URI[sha256sum] = "50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

