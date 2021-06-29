Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.9517.1624979128785438279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GsqlkM1M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624979126; i=@fujitsu.com;
	bh=Wno5evEB0VXw3I+3ffFOwycKMpPaC1N4oGs58MHbJN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GsqlkM1MkVdZMZHbILe7AOJoVrFVqw5sSCLaxyn+oZ8p4w+l/FU1OpFi15BZFl5OS
	 suVaVAf2/6Dsvh3mq9TR4pTkxdffv6SwWcsKBBXV+jbs7CUZrU6ktfb7UtsdMz8oo1
	 3+TxAzQoq4umxM3dqbGStKT2caql1Z6inCjrf0YB7AlRIdA5OO22p2rzxJ44AqX6Ww
	 v77eJTuFpZ5bH1RJ/QWkeeHlEvOUJU6R71tTRkGwoSbfAtJJiC0pkcV3zeWM2eUL2K
	 yE8DcK+jrU8gzx0w+4rMJT/8gp0iUFfk1NkyEjVwj6wkLZMFcysOjaSUy/uuQTO/ob
	 ovGQzx573lEWA==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 67/14-03136-6B63BD06; Tue, 29 Jun 2021 15:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVXeb2e0
  Eg+UfWCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyuT3cZC/6wVyx6OoGxgXEKexcjF4eQwCwm
  id1PDkI5JxglJl2cy9jFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+97CD2MICVhJfj
  11jArFZBFQlbkyazAJi8wo4Sax7uRKsRkJAQWLKw/fMIDangLPE5n0g4zmAdjlJLP4sCVEuKH
  Fy5hMWiPESEgdfvGCGaFWUmH25mQXCrpB4ffgS8wRG/llIWmYhaVnAyLSK0TKpKDM9oyQ3MTN
  H19DAQNfQ0FjXUNfQxEgvsUo3US+1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGI4phYx9
  Oxgnvvmgd4hRkoNJSZT3kt7tBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvBdMgHKCRanpqRVpm
  TnA2IBJS3DwKInwTgZJ8xYXJOYWZ6ZDpE4xKkqJ83KaAiUEQBIZpXlwbbB4vMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmPc2yHiezLwSuOmvgBYzAS1e9OQmyOKSRISUVAOTtk3SWbM/7xi
  cCnYFKCpFGr1d5vdh0gpfRml5juTGjXLmO5RaWb0OMxawXW8sm3N/culKp6yZkz8X57OUr+dn
  Y33y8E/Gh1An8dgXb3n+b6sqOhnmzlM8LfZCfisX25w1Lr7uq8/HcR1P9FpdenKarsvjFev4J
  7qb9YTGPb19/cfTJ6XzmyqnbBQr0pmf4rcxdM82lm3ftxUVLfr1/sUe5s3r8hsFnvWsyVpv0H
  L2y6mcv6K/5qaw9swSytveG7ZlnuCyy+dPFnE1Nr2c+o7JSu+pamqazddtZesf/fHW7lJ1TFv
  Yp1Egu2nH30d3D9vZL1l0u2ZpZ84VgW2uqnsDWNykQnR+80zuPfN/s5ybEktxRqKhFnNRcSIA
  eea3kEIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1624979125!47265!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11341 invoked from network); 29 Jun 2021 15:05:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2021 15:05:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TF5Ixv001011
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 16:05:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 16:05:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.15.1 -> 1.16.0
Date: Tue, 29 Jun 2021 23:04:50 +0800
Message-ID: <1624979093-98912-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
References: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_1.15.1.bb => gpgme_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.15.1.bb => gpgme_1.16.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.15.1.bb b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.15.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.16.0.bb
index dc38aa8e3c..da413c80a0 100644
--- a/meta/recipes-support/gpgme/gpgme_1.15.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[sha256sum] = "eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad"
+SRC_URI[sha256sum] = "6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.25.1

