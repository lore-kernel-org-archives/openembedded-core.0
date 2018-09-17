Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 32DBB7961F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:29:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id A5D8C10C07A6;
	Mon, 17 Sep 2018 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219800; bh=2/sFKyJFGY5cF6qMrzgpbb2GUbx5NIXAi8hBQQuNKmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ch62310aHnGEwSb2rYBiRcZH1grS9RRboJixX81vAI9kybwWB6P15kRdsyde9dCxq
	hfhcLSCtDFtvqZLQLgsI2QOyCth41wPv/rX4mePiJPOZGAFFGYJIZvYiK3WKJk2gz1
	NOssvIt+V6tEEvZ77qor+GjwUQkle08Fhi1AzdIpUAOLJE4yb4xvDv5fw/ZBRP1To8
	TDwDbE0KMXIO8hP3LsSHpLFtzSJrTbqNeye1GzT/ttcZHlzCCeIPJpXpP2qKUxV6jq
	pr4ZJ0rtUXCwnQ+DtjqAF9EmWb+6SiYOx7NgZGwThQ5kxhbaQhB6DHHfFqqfHiBoJk
	WhVPJQaRBjL6g==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 6BE4A5503;
	Mon, 17 Sep 2018 14:29:59 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:37 +0300
Message-Id: <20180917212943.27237-5-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 04/10] openssl: Add support for ARC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2018 21:29:59 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb   | 2 +-
 meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
index b7297fc..84e086c 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
@@ -164,7 +164,7 @@ do_configure () {
 	linux-mips*)
 		target=debian-mips
 		;;
-	linux-microblaze* | linux-nios2* | linux-gnu*ilp32**)
+	linux-microblaze* | linux-nios2* | linux-gnu*ilp32** | linux-arc*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
index c13731f..ed3fbdd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
@@ -82,7 +82,7 @@ do_configure () {
 	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=linux64-mips64
 		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4)
+	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
-- 
1.8.3.1


