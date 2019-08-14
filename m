Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8077EC64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uDI4CGMU4LLRQuH/nIuIvyHcQaSsGZrpUVfL8ObI4Vc=;
	b=x7H5iQWbLL0DgbM9MYJ+XW0DAS
	ozqVJW0j1HZ/LXOy3fD1aqU5xqUVgTWgW0EXT0NqRT0snKtf203OmQjw7S7/xATVCTu2W4Fd+N6uN
	/M0StY5zTO2kgA4yd7fc3JIzlVROE9nnh2vaYjTxGsZOjIR87RrdErl5R1obczfR+YqWdOw9n8W46
	1bOgrYnvPgLYqAusc9ShcoZFMiwwYn9Z8qbWJ+ibG3wEiaxgvkEiH8lmHD6twu6kvnX/M0d5E+djo
	szL4HeARQJqOycyri3ZbN6wt/iNYSMk/ve9157FIcnAbMrTHtkKVXt/V7rZ9NoVNIEF7oMfUsRoEX
	rJINpoEQ==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hxv0Y-0000w6-7V; Wed, 14 Aug 2019 18:16:14 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hxv0O-0004p4-13; Wed, 14 Aug 2019 18:16:04 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 18:15:54 +0300
Message-Id: <1565795754-15572-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 1.2 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.09) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1565795754-15572-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH v2] stress-ng: provide stress
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
X-List-Received-Date: Wed, 14 Aug 2019 15:16:16 -0000

Since stress-ng replaces and is compatible with stress,
provide stress to be compatible with the old recipe
and binary packages.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 5 +++++
 1 file changed, 5 insertions(+)

v2: added RCONFLICTS and RREPLACES, removed -dev package since it's actually empty,
    decided not to add transition support for stress-ng-bashcompletion because
    I don't need it

v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285724.html

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
index e800040..7d194b3 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
@@ -14,6 +14,11 @@ SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa52
 
 DEPENDS = "coreutils-native"
 
+PROVIDES = "stress"
+RPROVIDES_${PN} = "stress"
+RREPLACES_${PN} = "stress"
+RCONFLICTS_${PN} = "stress"
+
 inherit bash-completion
 
 do_install() {
-- 
1.9.1


