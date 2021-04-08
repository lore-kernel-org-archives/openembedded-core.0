Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4096.1617860912048212765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EoFo5QS8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860910; i=@fujitsu.com;
	bh=r/XHsBRX6yPl3QyTucv/4vUmwft+H3nEEorkM1rnmkw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EoFo5QS8ma3ub4zm4Lq2MDdjLTM1QCHNSoJ5kM3HpW0jcpC34gmwR24eq3CcUtxuI
	 BmwXoqtWnapIfVe+gJJsHOMYNU6bc+CDI/E4/mu7p2OFn4744cU0Of29brCBtRZNS6
	 pusAR66dbjXwxkMV8eJwCMEMQCLbrF9Kx8/9873mPlXmX1JS8E+amHLFrc73z9pZXT
	 cQR3yPBpgypMyrO21y5YceJDXmGIc8KB4hHoRMJ/x3gtVuCbC6ADGP5HyI8Pqygr6C
	 d16VlesxDDQBPVxiBZCA71Ds1uAOl090uiWJX5iHFhy0AbiW8aemTTaQDeeV2VosnK
	 VoFhaz7CfmXBA==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A7/8A-46412-E299E606; Thu, 08 Apr 2021 05:48:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqqs7My/
  B4MMHE4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePS7ZtsBT/ZK+ZtOc/WwNjP3sXIxSEksIVJ
  4l/fCyYIZzejxNKfu5m7GDk52AR0Jc49XgtUxcEhIqAncfWfKEhYWMBcoq/pGguIzSKgIjHr8
  1owm1fAQ2Lru1uMILaEgILElIfvmSHighInZz4Bq2EWkJA4+OIFM8hICQFFidnT5SHKqyTOzv
  7CNIGRZxaSjllIOhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tLTQNTQ20Eus0k3SSy3VLU8
  tLtE11EssL9YrrsxNzknRy0st2cQIDKKUgmNNOxhPvv6gd4hRkoNJSZQ3a1JeghBfUn5KZUZi
  cUZ8UWlOavEhRhkODiUJXu0ZQDnBotT01Iq0zBxgQMOkJTh4lER426cDpXmLCxJzizPTIVKnG
  BWlxHkngiQEQBIZpXlwbbAousQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHc3yBSezLwSuO
  mvgBYzAS0uOZgLsrgkESEl1cDk5hgRFXdvVpE9Z3rclUtx35x86iqOPGlY9Shk27EpB7Jbzdf
  /3SyQbNszc5lixctKdfFZOznmdM4PnDo3MYV/B1t9Va8t79zfHBs6XLef57B+ULBlj9wVC8+f
  z5+dmFF+dP3yAImqB2cvyZzdufePyakc84WWW7MvTzzKozrfXmOdIGOi395PreWql8NNwo9aR
  xzYIT7hmM+xL02+Et3d2fxbv2mdKz9U1bZu0ftpR0/IT6qdPEn5/OmjG9dslWX6Yay47MW1I4
  z/g2KFX3jNe3Hm8Ufh2p9Wp1NdLcr6tSTeO7mrWkhP+nvtjCRL91wma7dXNdPimD69zr129Iq
  Ce41k8vZtyWrn25/c0f1zWYmlOCPRUIu5qDgRAPqii78dAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-291.messagelabs.com!1617860909!567950!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30691 invoked from network); 8 Apr 2021 05:48:29 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:48:29 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385mTUm029665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:48:29 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:48:27 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ruby: upgrade 3.0.0 -> 3.0.1
Date: Thu, 8 Apr 2021 22:20:14 +0800
Message-ID: <1617891614-52202-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.0.bb b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.0.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.1.bb
index 28e12c3cd7..944cb81c1d 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[sha256sum] = "a13ed141a1c18eb967aac1e33f4d6ad5f21be1ac543c344e0d6feeee54af8e28"
+SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1

