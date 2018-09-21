Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id F031B798E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:16 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 483F324E264F;
	Fri, 21 Sep 2018 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539978; bh=h8PBkTQAh51eNQh1ns9KrlHWH4jJNPSkeJN6bKPqI2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eOQoCga0MLvgIct3TltHPUtcEa3OJtY8OgTopkVXsnDiGBdhdxRhtG1Bhu1AcXjoI
	DzKsxeRC9PmjLDr8yr3ttGncv8SDCKL2jla27OLLpqwOuqhcsI3hhj1xSjQ4BiWNgi
	fzUTxuhtWzkF37ktLf+faGZfvRuQud1Y76KthivNHYmd0DIwUxtGdHRivQc9rZa9jF
	C8B1rjsy3v3G14Xqyrx32StLeMNeI6AavKhn+fXnrS8o0+4yYVj7RDMPTCT+HnKJ4L
	lJQvYLQVNAL5Cw5ea2y09wPnnExqD3/WmLi8r/bSZ5qaMb4Cestej1a612EQkQ2SvP
	maSABjUfYKovA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id E0B245D20;
	Fri, 21 Sep 2018 07:26:16 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:26:02 +0300
Message-Id: <20180921142608.36203-4-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 3/9] openssl: Add support for ARC
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:17 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v3.

No changes in v2.

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


