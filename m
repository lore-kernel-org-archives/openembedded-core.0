Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.6278.1627542414268916095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kZGeBcYr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542412; i=@fujitsu.com;
	bh=cgZqxPbWK4MwCHT7MkJbAbAVafemhb7l/9n2YTBhldg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kZGeBcYrwKwO8+n8URkLORgxkmLtkxreLfeWN21RP771FfMdpQqr7jS1AGPSjIuLL
	 LLIiVfJeftUnM1jgvCJCzUrWpiys9HSXE5ivxhEX/SiJNMkUHWhVmkms+4EXY9WOfz
	 Rwurneh62+UE0mt9e7lf0aRBJnS5sHxYPmxlfOoDSZrqxH+0m+VHYMq6H/xBVPTV2s
	 NvxZRWOyqGg5yaIIvBhXqZHv7dxVYLm0NP06CWddQgbQEtZ7mHn6XUpg4sg/ONT4Oe
	 cmFVXUsyXy2Ups9ko1qSEusPLWK8H/UozeTsMKtTLGxCWMEeOCN9Y40S0t2DH9KWvh
	 YY3Aq1h7UmGhg==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 15/D3-07839-B8352016; Thu, 29 Jul 2021 07:06:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVbc7mCn
  RYMFZXYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePjv3MsBe0cFV+P7mdqYFzF3sXIxSEkMItJ
  4vWPdcwQzglGiY67W4EcTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhawlDi/+
  CiYzSKgKtE09ycLiM0r4CTx6t1lsLiEgILElIfvwUZyCjhLdH9YzwQyUgioZuJaSYhyQYmTM5
  +wQIyXkDj44gUzRKuixOzLzSwQdoXErFltTBMY+WchaZmFpGUBI9MqRoukosz0jJLcxMwcXUM
  DA11DQyNdQ0sTIDbSS6zSTdRLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMxpSCQwd2MC57
  80HvEKMkB5OSKO8vO6ZEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8m4KAcoJFqempFWmZOcDIg
  ElLcPAoifAKBQCleYsLEnOLM9MhUqcYFaXEeRcHAiUEQBIZpXlwbbBovMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmDcUZApPZl4J3PRXQIuZgBbXljCCLC5JREhJNTCFdPYUXDXrrqy+937
  m2iVrWo2uvH+utOt/eOETidXxS95s6DgnK+3RcS31EPeFBZWvc7bst2o6zb3Lcedk9uqV90rM
  840yZ8e+mfn7PKPwC3P1Oe0aEaUnZwdNsEpaJHN3iuIts7Z56y4Evmv8l7lzQpkhp+P2LP6V7
  /zeHfd4/VElTK1q7kFW46nZb5LW+n1ITHbZfubi3AmRR5LSnGZdK04N41e+ZvrSsffUbK2nC/
  JWPll4lzXl0BXVHM39qds8D+Wu+vUg7Ln7h33Lozwq8naFXV1teY5TZoZFyuXif4+nSu/3epD
  MZJCmOHePy0uftVly+9zlF6zcYve8+prEkZYv0lJNMh+OBTbn79F8r8RSnJFoqMVcVJwIAP4M
  6qVBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-267.messagelabs.com!1627542411!64643!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20446 invoked from network); 29 Jul 2021 07:06:51 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:06:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T76gGd001513
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 08:06:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:06:43 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 177 -> 178
Date: Thu, 29 Jul 2021 15:06:27 +0800
Message-ID: <1627542388-24698-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627542388-24698-1-git-send-email-wangmy@fujitsu.com>
References: <1627542388-24698-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_177.bb => diffoscope_178.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_177.bb => diffoscope_178.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_177.bb b/meta/recipes-support/diffoscope/diffoscope_178.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_177.bb
rename to meta/recipes-support/diffoscope/diffoscope_178.bb
index 0d9061dda0..4bf6ee64c9 100644
--- a/meta/recipes-support/diffoscope/diffoscope_177.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_178.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8ac0cad150914bab2a53caa3f21876a78b092f3d2a36b9134874cd5c04a26b2e"
+SRC_URI[sha256sum] = "7454cf417725ef81ffad16e8cc2f62753282f5171b1c651732b99c0b3c19e137"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1

