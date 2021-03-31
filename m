Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.7492.1617200876621240376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DZutphSf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200874; i=@fujitsu.com;
	bh=KtEq5ICXpzoJyRWbxPkvoKxW7JsbWOJAAW86rBFdoBU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DZutphSfM/e334CCIuuJnpv5u9Eyh7js/EHvFnNbqxoMiwU7Eg65W6QpyAW9IWUlc
	 hYHFLQixSrpzzZE/C3tt8j6VVG0QO0pH1GlOfbXOS0MyCuU6atFOfj5ICosYngU1UV
	 5U/K3hVjDj2164HBlcjQsCej0pUASPS+f8xq0TXvOvzykTkYb48RxBHlecLC4Nt0CL
	 bP6JkOcUTnsW/Q1OjlRP/HssAHYP86nv7LsYNgzn2SCgp1SwcD6G11xbZQwQA4ycsG
	 NzEGtA3+CmEQfANfzYWtM2XeiwWCCsswO+ybG+wMqOcezn9fkSmfI/quQioSIlivbl
	 5O7XZI/aydaIg==
Received: from [100.113.7.82] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 4D/42-44603-AE684606; Wed, 31 Mar 2021 14:27:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRovuqLSX
  BYP80Hos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPG118sBdc4Ko5+3MzYwHiKvYuRi0NIYCuT
  xMPrp5ghnBOMEp+e7gZyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jAQeLi7
  P+sIDaLgKrE1ImvwWxeASeJr/8Og9kSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJWZfbm
  aBsKskOj8cZ5vAyDsLScssJC0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmuoaGVvoJVbpJum
  lluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAgMspZD13Q7GZ68/6B1ilORgUhLlfWSfkiDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgrcHGLJCgkWp6akVaZk5wGCHSUtw8CiJ8Hq0AqV5iwsSc
  4sz0yFSpxgVpcR5Q0D6BEASGaV5cG2wCLvEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3J8
  h4nsy8Erjpr4AWMwEtvvIoEWRxSSJCSqqBiaGTQ3npggmTkhmnRL5b+oHFu/GxJX9S7qpfP15
  Ff7dfFTxjEg//3X1ndLyEIu6IKDkq9u6OzPp267i6ukIhl3l+7XbxpXOtpO0FMys1e5VSeDjY
  7RSs9dRmazxm8r+cc+9G5lrzIxlT2Kd+rXo2NehnwQGOG65TGwL/fFXRNlrtvN89sc/q9k1GH
  80/7ccM7Xs3MbEHCYn+Kl/2z2nXvIcrVS5uL5p0Iytjins6q3l+3UfJv9YzNA94TqmMamzZr2
  70WpZ3g8yX5tN2x+f8MVoyO+J8tqpDWvS1ArXyapvF1VlSL7xVoo++vr5yhxlbQLRfcm/MG5v
  PKx7/0PUteRk8iavm4uz1Imrdr02UWIozEg21mIuKEwHW8S8YKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1617200873!173940!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31405 invoked from network); 31 Mar 2021 14:27:54 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:27:54 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VERr3Y001679
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:27:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:27:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ghostscript: upgrade 9.53.3 -> 9.54.0
Date: Wed, 31 Mar 2021 22:27:43 +0800
Message-ID: <1617200863-62170-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ghostscript_9.53.3.bb => ghostscript_9.54.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.53.3.bb => ghostscript_9.54.0.bb} (98%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
similarity index 98%
rename from meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
index cbf60c8c85..9ace037aa9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
@@ -41,7 +41,7 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[sha256sum] = "6eaf422f26a81854a230b80fd18aaef7e8d94d661485bd2e97e695b9dce7bf7f"
+SRC_URI[sha256sum] = "0646bb97f6f4d10a763f4919c54fa28b4fbdd3dff8e7de3410431c81762cade0"
 
 # Put something like
 #
-- 
2.25.1

