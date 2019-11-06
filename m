Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 223A17F889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dCJKtxLAlj1VedhvFZ86eAM28Jmc/NFjiWM5T47hVuU=;
	b=B/3NqXgKZFsFliJgljESA/y1hQ
	jRoJ2KDWD6dRuQwUZEquSapT5SQ0qLsujmQGmqK/naYe4N8OxJKyIVc5zoGlKYFnJNPnJeuUOzqBJ
	bKz83e6oY3XWWKmyiJClqoknGm3DwQwpQK4qAwsjOeeaVVDWhVbx+qKrvPbM9COJ9k+5WDoVg9zRr
	AvM/N+YqZl9galDHV9OleQK/jCFkykmYADuvDmH10+mSZ23lmGNpkvF7lY9JaKAk/ucSid2NQCnaO
	PdJOaC+er9lTFn0qaXLtdX38Tdt6Cu8mFXCkKZITuCyfS3mUj5mi4k8GxMHwB4Ny8ANpqaVh6e+p0
	wurIz0wg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOP-0000AJ-Nw; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO7-0007a2-5o; Wed, 06 Nov 2019 17:38:27 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:56 +0200
Message-Id: <57017cad7ceeb6360d0fd8cc3116146117212d96.1573047195.git.mikko.rapeli@bmw.de>
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
	57017cad7ceeb6360d0fd8cc3116146117212d96.1573047195.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 41/47] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:45 -0000

From: Ross Burton <ross.burton@intel.com>

This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
recipe.

(From OE-Core rev: 341e43ebd935daeb592cb073bf00f80c49a8ec2d)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-multimedia/libpng/libpng_1.6.37.bb
---
 meta/recipes-multimedia/libpng/libpng_1.6.34.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
index 3877d6c..2edf268 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
@@ -30,3 +30,6 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2019-17371 is actually a memory leak in gif2png 2.x
+CVE_CHECK_WHITELIST += "CVE-2019-17371"
-- 
1.9.1


