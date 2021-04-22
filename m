Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web12.9162.1619076578788608258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JAZhU2vn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619076577; i=@fujitsu.com;
	bh=dHKp4/6iab0Tf8ES+F/0wzVtgmQ3wowcedute6m7rUU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JAZhU2vnDxqQiU/tut3EHNdz3BirKYX91eri4P5WexQzvjdDCfj78C62oJDLMaItf
	 wcYmRnUy9OBuxCNI6xTfwPHfkwn6SEvYHWNbqUwbIG+QISF+KgiJvJCuryjqfx+emM
	 Uqv2SoPK5/Uu9Q7ZcP3MtsOVTAIW+bFp11fbFjz5vATNynkkkLhb0NAgX8NruER9Xs
	 +tzAPocGsigFqJTcT0NWSzXXx1RFuI0NfMumDVZiYfP0O2mt3mfkLuEah/c8k59pfz
	 nWZt2G5gsfI8gpyDj6qj0JZVdT6eIxYY9GB+9bRkcjQi4jz4NwTEtDDn1ZuFQVQDTV
	 RB00zcGua6b5g==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 0E/4F-64503-0E521806; Thu, 22 Apr 2021 07:29:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0X2g2ph
  g8OKSpsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF03i62goUcFRuf/WJuYDzE3sXIxSEkMItJ
  4lZjF1MXIyeQs5tRom1XEYjNJqArce7xWqAiDg4RAT2Jq/9EQcLCAtYSHTOns4PYLAKqEjsWP
  wBr5RXwkOjqmAMWlxBQkJjy8D0zRFxQ4uTMJywgNrOAhMTBFy+YQUZKCChKzJ4uD1FeKbF92l
  nGCYw8s5B0zELSsYCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hpYWuobmxXmKVbpJeaqlueWp
  xia6hXmJ5sV5xZW5yTopeXmrJJkZgCKUUHFu7g7HnzQe9Q4ySHExKorwL+RoThPiS8lMqMxKL
  M+KLSnNSiw8xynBwKEnwJgODUkiwKDU9tSItMwcYzjBpCQ4eJRFeFpA0b3FBYm5xZjpE6hSjo
  pQ4b4QKUEIAJJFRmgfXBouhS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVeBTOHJzCuBm/
  4KaDET0GLtKbUgi0sSEVJSDUyek4TqqpbKP75qbMy/vlWw4Md85ZMRHRtP+i87cG7KGWPm8GW
  WfE9a5klPrBV2sSqfbu51VPrAxuQNTIoi6+MaPjLELDimLblPxTl7yq77kr9V19r/uMdbET8l
  3DZBTP4g34WbCZYhUky6PnK2f7asuNt1v3ze7fgLQuvdDzqw2h0ze/Dk+O5TF4KOcD3kvfZL+
  r+9fxzjfJvqT/lPF56qTE2QyXx/VcTAwp29+IHrDfvvQvmZvbuu5Go94pqWYVHE8ar46663ds
  WNFktCb+xiu+lzxp0rp9RCJPbSh23RU01lIzZZ6zfftM5cIRKZc6Is1rLh1/4Ireo9DckRi/Z
  OKzsmKK3Eldt1IilXWImlOCPRUIu5qDgRAH5iThAcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1619076576!1642235!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13132 invoked from network); 22 Apr 2021 07:29:36 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:29:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7TaRH003150
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:29:36 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:29:34 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.9 -> 3.0.10
Date: Fri, 23 Apr 2021 00:01:28 +0800
Message-ID: <1619107288-54433-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libical/{libical_3.0.9.bb => libical_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.9.bb => libical_3.0.10.bb} (95%)

diff --git a/meta/recipes-support/libical/libical_3.0.9.bb b/meta/recipes-support/libical/libical_3.0.10.bb
similarity index 95%
rename from meta/recipes-support/libical/libical_3.0.9.bb
rename to meta/recipes-support/libical/libical_3.0.10.bb
index 4c7027d14b..30d6bbfd0f 100644
--- a/meta/recipes-support/libical/libical_3.0.9.bb
+++ b/meta/recipes-support/libical/libical_3.0.10.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "bd26d98b7fcb2eb0cd5461747bbb02024ebe38e293ca53a7dfdcb2505265a728"
+SRC_URI[sha256sum] = "f933b3e6cf9d56a35bb5625e8e4a9c3a50239a85aea05ed842932c1a1dc336b4"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.25.1

