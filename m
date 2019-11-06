Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBA07F8CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v9x0CyhNPAf4cFbL6P9co6bkJ9lxOci863vZSczb+BE=;
	b=xP+4s3X4KMWNG7Tn4wInOZsd+r
	2hMlplzFed2xajwNgHag8jmmOlgUuBL8v8EVVDH4QQWhUDW8WKoOd7dma9jlnIvjtWkMP8dzgj9dv
	n1GgC2urGR5K/qJ2v2oF5bYeEDhtgCLtZUH069SB3HBJokDSupXNqx4XWP4EKCWceQ2NWx1PjjDBc
	PGtSKxeC+rhPGaZte4YxXxycPT1Rr+Z7jQjmM1RuGr3ngi+SfhY03CCPYnnLD1DJRxZOFC79DwRKb
	+yfDYl9RC9vRZ4pH0Ko4AP6DDBxBZKyXOt+k3yyNvttk4i06Rwd0bQU+Zq4PZFXxhI+UC/SgoszIv
	csOTAC2Q==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009j-GP; Wed, 06 Nov 2019 17:38:48 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007UG-BH; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:20 +0200
Message-Id: <b4b6db82dd8ce735a5d9f5be4a7c327d8b736c17.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 8.3 (++++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: IP_SCORE(-0.19)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID:
	b4b6db82dd8ce735a5d9f5be4a7c327d8b736c17.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC CFH][sumo 05/47] flac: also add flac to CVE_PRODUCT
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:50 -0000

From: Chen Qi <Qi.Chen@windriver.com>

flac uses both 'flac' and 'libflac' as cve product.

(From OE-Core rev: 3a043a078f6cc89bcc097823fa37cd1311805ae7)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/flac/flac_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
index 028a429..3e67fa2 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
 SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
 SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
 
-CVE_PRODUCT = "libflac"
+CVE_PRODUCT = "libflac flac"
 
 inherit autotools gettext
 
-- 
1.9.1


