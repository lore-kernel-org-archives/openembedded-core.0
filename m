Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id D31677988C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:47 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 5273B24E0DB7;
	Thu, 20 Sep 2018 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476169; bh=csYRxwQDK6DdkPfSlHSi8E6mVLsopEU96VkHgAQDFVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z5uR9b0H1id8kwDaIy2KtuVWAgaltdCaHAOnNCCidAAsz1DuyDiBnsvD6w3Vp/BCw
	xSvuFiT5VrZ4gfW/hk5hLO56dXmCBJwv3xTvNUvFS29ij5wIzx8eIMptHOYzfZf+lf
	+JVVI3nSVUOgAMGmIqjdcRh6HzHC5/tfcA+bejk4dSx9IOSpLMfyEXI6LDrYUk9uT/
	DCGM6DyPbi+aANTkeKAha1v1ziNoL4X+DbRKHm1T0RbMkEKijCSSW3g21YsbrztsGe
	ItbHVxLLucZT7k8XicV33qfXTY4IJGB8wzRlcvWuvJyfK5kZix7IDdhv1zCpTHoGdj
	u36UZSYm3Yh9Q==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 27DBC3A90;
	Thu, 20 Sep 2018 13:42:47 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:26 +0300
Message-Id: <20180920204232.10583-4-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 3/9] openssl: Add support for ARC
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:48 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v2

 meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb | 2 +-
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
index b7297fce02..84e086c2f6 100644
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 09b2c01024..73bcb27160 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -78,7 +78,7 @@ do_configure () {
 	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=linux64-mips64
 		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4)
+	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
-- 
2.16.2


