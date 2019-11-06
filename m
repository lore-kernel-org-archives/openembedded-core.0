Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8A57F891
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pzsbzJBroDU/Oaso3hr6cHR9xn0opGBLddrkxeDytU4=;
	b=d2fugjGvk0w4d81QGK1chYw3bO
	mBRdiAmkwyLBW38DxONMZcsPlj6cdbGKuh+xGV9b0Vd7J21nTeaTzYX/AmEkFKAun2DgegPGYHkru
	GYHH/doWTGoyCi8P/gd5gWBAIFySUDZSB/wC0/Ml4/uz68nSU/5UtFcEo3JF3/LRNYLPSn8Rd2SjA
	nceUeacujVdH7QCuqy3luP7x/Wy88tUhObFbXSywkLFXJz0LHC5rCfKtODctnQQPaqIKjBiGETt0f
	f+YppedIItqHC3NtqmI1nf6a6Q6DRVkEHSp5hbu2X+8d3nSy1X1M+hQxu/w3y3KlaT2GxS4Bf90q3
	F0IeGkow==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOP-00009u-Lc; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO7-0007aa-8c; Wed, 06 Nov 2019 17:38:27 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:57 +0200
Message-Id: <87c8650afda3551605bbffca362d633d82d1a180.1573047195.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	87c8650afda3551605bbffca362d633d82d1a180.1573047195.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 42/47] openssl: set CVE vendor to openssl
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:46 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Differentiate it from openssl gem for Ruby.

(From OE-Core rev: 2ec481b19d6c9c20ce6573de77ae89e576d6b8cb)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
---
 meta/recipes-connectivity/openssl/openssl_1.0.2p.bb | 2 ++
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 5d41977..1bb9545 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -342,3 +342,5 @@ RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index e700626..84acff3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -168,3 +168,5 @@ FILES_${PN}-engines = "${libdir}/engines-1.1"
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
-- 
1.9.1


