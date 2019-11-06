Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9024D7F889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GWLsiHfuG1ON0FG2A0stLfPLCPE96rQ9/0FlmupkNYI=;
	b=OYlpfIKe6pN4hjy/AZH3+ZWAGC
	zLnPzFBm2yJsL3Q5Ohx2W/dGpCSTxofvMSnr5+0iCq+7h/KULP+smSEkxsX81Yn5CJEiqsTuQRdWe
	HthuVfVeOZUpusBZrH8dAYWkqMGohun2Ubn1NTRaLTFyJcZ7VYHi1B2169AsrzY5zpptGUPwz95uZ
	MOpuimRMKi4BCOM6/Z5PtE3xtBveKOldEWJYphqqRbFJD0tp1+ZrYVvTDCWcU9egqwfiLKuEXW03r
	W4P6TDwZvq8FObUMFrLu4a1kfCYXfc0akYWkUtw5Iu+X1QjSgYhLIuV4CW8PMzP/Z396AdSOpfV3g
	n3BWOVfw==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOa-0000AJ-1y; Wed, 06 Nov 2019 17:38:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO6-0007YC-9B; Wed, 06 Nov 2019 17:38:26 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:45 +0200
Message-Id: <36c03aa60e1201a67000f013196249f01a8f1e9d.1573047194.git.mikko.rapeli@bmw.de>
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
	36c03aa60e1201a67000f013196249f01a8f1e9d.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 30/47] xserver-xorg: set CVE_PRODUCT
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:56 -0000

From: Chen Qi <Qi.Chen@windriver.com>

(From OE-Core rev: 8995f2c7d6f2f6f760811976af77e949d505a5d8)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index cf2286c..ae024f0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,6 +19,8 @@ XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 SRC_URI += "file://macro_tweak.patch"
 
+CVE_PRODUCT = "xorg-server"
+
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
-- 
1.9.1


