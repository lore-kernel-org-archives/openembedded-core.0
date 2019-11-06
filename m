Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 288377F88B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GG7FH2LmY7qetVZ8Po3/O357XZCNxQMLIkj85KPUjT4=;
	b=begwDECx0iZ4bmQFdrFtJf9tnd
	XBWujoza+WEfZhaF7c3Xgl6vacb3fr+3f3LhoUAmmwrJNKqLL7bhAFh+yMTCXapzEfqplCs86P5Tr
	9uWt4ADlBDOvPfnqlhtGe0jCNsaQT4/D1WhYU8/KexPlI7uwoP/DUXdd9VaBuhYZwl5KxNRoys8en
	fonzwNAjnO6XHNXfUf1WHuxUoS3EBewTgLITm9DnQiWMWpZghQNqqewdOaYzYvs8SvJX9wjfmpqMv
	oeibDlI3HtFFrdgmG9haP5Yv9jzcl+9m3+BfepfmyteQ+l8xsveZNSPv4oAPrE4Q8o8wW3gEVaRLy
	eVMsAC1Q==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOP-0000A1-Kg; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO7-0007bM-JG; Wed, 06 Nov 2019 17:38:27 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:38:01 +0200
Message-Id: <994b3f7ceb564a18bf2bf1c280d74d4dd1c80246.1573047195.git.mikko.rapeli@bmw.de>
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
	994b3f7ceb564a18bf2bf1c280d74d4dd1c80246.1573047195.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 46/47] subversion: set CVE vendor to Apache
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

There's a Jenkins plugin for Subversion.

(From OE-Core rev: ac115c3b5f1dcb95fb7d39537693fe0dcd330451)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-devtools/subversion/subversion_1.12.0.bb
---
 meta/recipes-devtools/subversion/subversion_1.9.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.7.bb b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
index 57735f7..0dee5a9 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.7.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
@@ -10,6 +10,8 @@ BBCLASSEXTEND = "native"
 
 inherit gettext pkgconfig
 
+CVE_PRODUCT = "apache:subversion"
+
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
-- 
1.9.1


