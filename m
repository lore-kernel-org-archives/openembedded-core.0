Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 004B47EC65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=atEfXMgiiZctwf7w9//EUY5bggW5uOuj0Pha5ksG4no=;
	b=PoZyqlgJkHthoarsx8rQYbouu8
	Ips1ewzU81T3upMl2zBQ4BwNKe+65laCaX8ELFQuU9VChJIqpZgHQ0RiFzVylKwOZuYdrle52wiPn
	mfYbxGoSSfdSH3sFFOE/arzfTnHL4KFi+j13gEtdhWYq5bGcLd+7ngy4jaej70v81FB2SDPE0Qm1l
	k2LFQek7ZYj+53YNlu4sjTyc6TGVpVPXiuJ+ef6kmyQgkKWY0ERbERKySQqH0T8L9XrJLknOKyGul
	O6WvNrWSCVzSO8HNvZgPyY0urEbhOnd35WDYJr0ldJuViN9/P1oKJ3Cb4DcMOfn6+QNms/j5M3J0p
	L+WM8osg==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hnlD0-0008SD-5G; Wed, 17 Jul 2019 17:47:06 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hnlCf-00018L-Vx; Wed, 17 Jul 2019 17:46:45 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 17:46:43 +0300
Message-Id: <1563374803-4112-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 3.5 (+++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.10) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID: 1563374803-4112-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_20,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] freetype: add --tag CC to libtool arguments
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
X-List-Received-Date: Wed, 17 Jul 2019 14:47:08 -0000

Fixes build failures on aarch64:

aarch64-poky-linux-libtool: compile: unable to infer tagged configuration

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-graphics/freetype/freetype/use-right-libtool.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
index 2083881..3368f7d 100644
--- a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
+++ b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
@@ -11,4 +11,4 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 +++ freetype-2.6/builds/unix/unix-cc.in	2016-01-07 19:21:50.213112131 +0000
 @@ -19,1 +18,1 @@
 -LIBTOOL := $(FT_LIBTOOL_DIR)/libtool
-+LIBTOOL := $(FT_LIBTOOL_DIR)/@LIBTOOL@
++LIBTOOL := $(FT_LIBTOOL_DIR)/@LIBTOOL@ --tag CC
-- 
1.9.1


