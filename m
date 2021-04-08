Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.4222.1617860931298662680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WWjWZ347;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860929; i=@fujitsu.com;
	bh=4UDERn/aQCvI98bXeinCZU4ql3MIRKgD4RFE0wfzO8Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WWjWZ347uNymNVKuIZyBr31KydPAVH+0NA83JcHy/KXjnQOwcYcYBJsowxg5nXjmL
	 iZsoSiD5xIlnY4iuxIIx/MNv1SUDcaB9U6ERv/+oqA5IsW3cRBzRi/rAkLohFRra7X
	 by4Cgwn7gpSU04EnaMVeQTht8kFUC4OeW5NwXR4bgrb1pW1FggJQXk9fmtjfVj7OxI
	 9/feNkshXJWaftawxetmmK8YrUtWrJaEUeMpr52cjWn+6N+Q/A3c55e5enhKI7VNJR
	 Wbw+d1ppOiiwzn2eRbSF1ixpHkyB/DB4RFa835GSS5fNIpixC0oDL4svLl0gHLDk70
	 Dl8QEnovl1sDw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 0C/73-41911-1499E606; Thu, 08 Apr 2021 05:48:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MRqus4My/
  B4PIrcYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN832G2gj8cFb1fzrE3MM7n6GLk5BAS2MIk
  8XuRVBcjF5C9m1Hiz7/FrCAJNgFdiXOP17J3MXJwiAjoSVz9JwoSFhZwkPjybDsLiM0ioCLx6
  M8HZhCbV8BDYtXpWWC2hICCxJSH76HighInZz4Bq2cWkJA4+OIFM8hICQFFidnT5SHKqyTOzv
  7CNIGRZxaSjllIOhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNY11DU11Eus0k3USy3VTU7NKyl
  KBErqJZYX6xVX5ibnpOjlpZZsYgSGUEoho/EOxoOvP+gdYpTkYFIS5c2alJcgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYJXewZQTrAoNT21Ii0zBxjOMGkJDh4lEd726UBp3uKCxNzizHSI1CnGW
  I4rq5YsYuZ4sxZEvgWTbffuAsl2MDlzwcHVzByzwOT99kNA8gGIFGLJy89LlRLnnQgyVABkaE
  ZpHtxKWOxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxtkCk9mXgncZa+AjmYCOrrkYC7
  I0SWJCCmpBibxBw0c4jpxf7fotcX1xwou/38r3dfB2IvvecIOqQm+fTzXMh8v2MUQ1dsRw9BR
  tENGt4XJZ0uOYHXQxQrjtxPPMgnkbLDYfKty5/7fJiv8lve6V75YtuC8mWcKd1zTif1ij188k
  1tYaDNVRqNh9q59pqy+51XX6079d+WkULWOYfpkES+mN+4CCz7N79y0dZVmfcYR1sjJhSonL5
  9h1mcQEGxh3hKRIK7stM33yoS303P7tz2LUj/9Yl8rk11SDsuRimfsKRvatCZver2zvuD2mYV
  8RdYHrq/wP6F3acWGhp0L73en3ih/9NFujbDX/YRFlx8pij63Y9Ir/SOmZLtgg1zi6ce7vd+4
  rCx8XanEUpyRaKjFXFScCABGz1JJWAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-226.messagelabs.com!1617860928!689054!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9875 invoked from network); 8 Apr 2021 05:48:49 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:48:49 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385mm47030677
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:48:48 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:48:47 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libva-utils: upgrade 2.10.0 -> 2.11.1
Date: Thu, 8 Apr 2021 22:20:33 +0800
Message-ID: <1617891633-52249-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libva/{libva-utils_2.10.0.bb => libva-utils_2.11.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.10.0.bb => libva-utils_2.11.1.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.10.0.bb b/meta/recipes-graphics/libva/libva-utils_2.11.1.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.10.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.11.1.bb
index 828f4fb317..096d80b68d 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.11.1.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.10-branch"
-SRCREV = "f112ee75fcd1472131b20f901b93f6ac1d293fad"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.11-branch"
+SRCREV = "c0145a895ebe9b24cde5c441733f90482f1e3d71"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.25.1

