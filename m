Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D0FC87E681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YCkY3l1Zz8p
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 19:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561483589;
	bh=kA0/h7uzalnWLPJV7H7X0YGnLpLQgl4AoSiKhGGyvlY=;
	h=From:To:Subject:Date:From;
	b=H7YGqC/RxhmCugOAmktRuZIsqZO3oWxJhwQBKDBnNYHobnCEvQ7qC1w05lMTSmXB7
	fnhSftQMV2Ab8bxHTDd40mvpSDszzaAPADScXaitmBdL6VTfEXKz2Gim0R/btP4hp0
	XJwqmMdE1DElTcIfXm5z29rvhK8F5CvrjV9VSWpkYpLwjqRV+qXtXnqIA8Sn/xImoM
	OHPdr+3xc1wkYokrytp/9Gu5edzB04/bwXjdthPmnh9wANwh/yiolkGA93DrRZBfQr
	t3nFSS+UJ0vKBMAmGw5V6YNx6tQCRv1vEF2hQgzRnV3iKhxJKS9rrlhb6iwINslgLH
	6qPp9wqPOfCZjhXM50H7oi7oXbJCIuX8P0B4MpPwvYDCgJWBUC4Yy83/fdz6Ko2MWR
	V1LpSboHikA/bb8F/r1EA4KwLMSy09P1nDDOGro+J6o4lOchIuZFC+7CjWRpM+n7PL
	vhF76j5ZQyJLbQEnwiSt0Pnib0+iXU21pxcZ4NTs6ssxGitqBRy59wjuBq7q2sUQA0
	kFLKSCrd7qygtha32I35KZzsYXEEBco6nfim0DY/HJoYB1na31gXyBLmErcqKgRFnT
	djzvF96qfzqsv5WlTf7qs3oAbwwMpelpeN+kOpER7SiDmHHievvYJT8ZJNCE485hhg
	rQ+fY5SlQ29hMDSv6P8X9M24=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 20:26:26 +0300
Message-Id: <20190625172627.24662-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cups: Remove unnecessary dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 17:26:29 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5010f0861f..46fb2dded3 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -2,7 +2,7 @@ SUMMARY = "An Internet printing system for Unix"
 HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
-DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb1"
+DEPENDS = "gnutls libpng jpeg dbus zlib libusb1"
 
 SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tar.gz \
            file://use_echo_only_in_init.patch \
-- 
2.17.1


