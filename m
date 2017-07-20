Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id DFF92782E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=gNfic1I8kMQK5dKFO4UekExC/CrWuiVPPHr+pK1/8O8=; 
	b=Xc82FjvDaw3MRTDL022VLutVunDqs9+EIBwEvJp2SymDHoNcCciyhGx1JDM0d6LupRtMBemimXgO/V9sGKiQUjLnKjm6LW1amdCVgjBpF4Cjh6VqA9W+Y5shKlGOcMBzymVSXvUcFYH7GNROjNzbBoHJ9moQMNDigyKNBMunhPOULZjZhylW6/exi4ehF9nMEgjuIvGbg6k0uisO19xLWq/kdvu17zaxkqfBvsBOtpSHojGKZavHQoFsBLEsNGM912KAcgNDSCuR9m/lRuAZtgxBaVGvHpnsc3VvqiGc1drQMzXLcdQ7Yyow75TzNDx8OpqyX15XEUohHgZuESWu/Q==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Mp-0z; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003SH-Vi; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:59 +0300
Message-Id: <1500556991-11471-12-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 11/23] libpcre_8.40.bb: set CVE_PRODUCT to prce
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:27 -0000

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2017-7246

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/libpcre/libpcre_8.40.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre_8.40.bb b/meta/recipes-support/libpcre/libpcre_8.40.bb
index 8563cd1..a897ac6 100644
--- a/meta/recipes-support/libpcre/libpcre_8.40.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.40.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "41a842bf7dcecd6634219336e2167d1d"
 SRC_URI[sha256sum] = "00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4"
 
+CVE_PRODUCT = "pcre"
+
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES += "pcre"
-- 
1.9.1


