Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD1F7F890
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HfaIH9iP8XLynAN6LG3gIsiibYhqjNVLIkAOiqv6cZ4=;
	b=Z7esQTGVLTNnVZXUNE1ksVBo+8
	aDiDN29ykNGFCUtL8+iamYJ93DXt5zZWpZP32poFx/1xaeVumI3e5SiteGwpJSUfHumD8WjVUzwlV
	sBe8IyE5HU0Gkk1uAer6vJT/ulXDckInNa5Nvb6ITCv5pyTIoID+NL1lxOL5/3giuxJOAd8MWwScO
	r07pl/R/IdpOagH/PO529TnygiEFAgh67qKdcbYFi9fS6E00miJfI0gnnY5/kYwmo4x6c4zqvga92
	rJ7QVARFNL5d3CAXUIGr9Thr8IeXX4vJZUHik+uYtTPHJ2V7vOmhuUDFKZ9Xtp1D0ykQVpqnXB9qO
	yl5w4VsA==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOP-0000A7-LE; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO7-0007bc-Lz; Wed, 06 Nov 2019 17:38:27 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:38:02 +0200
Message-Id: <a8626b00893a0a27aef30b25a2dc741b5bfc7edd.1573047195.git.mikko.rapeli@bmw.de>
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
	a8626b00893a0a27aef30b25a2dc741b5bfc7edd.1573047195.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 47/47] git: set CVE vendor to git-scm
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

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Git.

(From OE-Core rev: f2adf5e4d3e9afc6d45665bbe728c69d195a46ef)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 8603c04..61247d2 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -15,6 +15,8 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+CVE_PRODUCT = "git-scm:git"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
1.9.1


