Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.3534.1620958408532049514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 19:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=St27aWp/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958406; i=@fujitsu.com;
	bh=62BAS9ngVt+zd36qjR8au8oIt1JT0ne4/mAaagWAwIE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=St27aWp/LQALcgjbfTNFI8tMmO974+0hxkUrA65fDR6aiuGcfFmEfF3A0t1D0+hYU
	 wkQSJ+87Bq0sjejj4JYNaM1hNwhyGpVOK3uS44ZMJEF3xxZkR++Ao9JY2WG0BSFhwT
	 4UFNQnUoOAS0Gp6nupPbC6LbRFlBpNd6S7XPfcpZpWhXtStf6UbyilgFc9gvnaPiuG
	 A1SoecNHq2fBB5p90JPZeCyenZ3utjbkVfCmBZVuHIGO0dPjmi62JRhMQ1ZrHLGr+W
	 bQhge5dh6d6Qk+21xovOzuW0hapn44DIaCDYhieq3GkE0lSfJWGAkoSHT70TofCOOo
	 1S/14ENFr6y9A==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id C6/23-19780-6CCDD906; Fri, 14 May 2021 02:13:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MRonvsztw
  Egxt32Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ow17zqZClayV1zo129g3MnWxcjFISQwi0li
  5q7tjBDObkaJLYuOMHcxcnKwCehKnHu8lr2LkYNDREBP4uo/UZCwsIC1RMf6rUwgNouAqsTkn
  pssIDavgIfEjINXwGwJAQWJKQ/fM0PEBSVOznwCFmcWkJA4+OIFM8hICQFFidnT5SHKKyRmzN
  jGNoGRZxaSjllIOhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNY10jU11Eus0k3USy3VTU7NKyl
  KBErqJZYX6xVX5ibnpOjlpZZsYgSGUEohk/EOxmuvP+gdYpTkYFIS5T3pOTtBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgTv91tzE4QEi1LTUyvSMnOA4QyTluDgURLh/QOS5i0uSMwtzkyHSJ1iD
  Od4s3bJImaOt2Cy7d5dINkOJmcuOLiamWMWmLzffghIPgCRQix5+XmpUuK8wreBxgmAjMsozY
  NbBovXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEea+CHMWTmVcCd9MroHOZgM69MX0WyLk
  liQgpqQamKa98D++b13eKq7n/4jGm4CPOvDMCN0dYNAhdeW28dG2RhsCX3mMXOM+u6VZL95KJ
  T9GYMVNqmsW2+PbzXzPyEmW60vXfxcxJX/Di4hvzI+ci1SLOLP/O6S5ryW65ULmG9a29bcHZK
  p4Ca8NcjpsPk12uN58yc6+fmxVwMUx00vVDbacO7U0MZZBZ0P2atUbjj+zWjA4z53vzLGoevz
  daoObC+VB14rSyJavWt3a6G3rk7ziU1Bfzk0+Qv0Gb+cAUXjGWepO70T85OpwKXDfsfit3Xln
  i39ewKbnnt853WRLMbpbk7dzRHZF01K5B68DVJfH2mqo1U7c2T/v+tqJ54YmodX3/zidvcFO+
  7KfEUpyRaKjFXFScCAB8JQg8UgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1620958405!213930!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9186 invoked from network); 14 May 2021 02:13:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:13:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2DPAV000775
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 03:13:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:13:23 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysklogd: upgrade 2.2.2 -> 2.2.3
Date: Fri, 14 May 2021 10:12:43 +0800
Message-ID: <1620958363-16358-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.2.2.bb => sysklogd_2.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.2.2.bb => sysklogd_2.2.3.bb} (96%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
similarity index 96%
rename from meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
index 5dfeca5326..be34ec7b38 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
            "
 
-SRCREV = "f507ed8ff3f1e9d71bb6f85acbf5d14b2fa4e5f7"
+SRCREV = "17b68ca89ab814bb623b615c4e7088d619ed8829"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

