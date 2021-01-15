Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.2284.1610707647875009812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MdW-0004dP-Pd; Fri, 15 Jan 2021 12:47:23 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MdW-0009cj-OB; Fri, 15 Jan 2021 12:47:22 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][dunfell][gatesgarth][master] cairo: whitelist CVE-2013-0800
Date: Fri, 15 Jan 2021 12:47:14 +0200
Message-Id: <20210115104714.36449-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210115104714.36449-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

It affects only cairo embedded into Firefox.

https://security-tracker.debian.org/tracker/CVE-2013-0800

"The description is misleading: Firefox embeds a copy of Cairo, the interdiff
shows the respective change at mozilla-esr17/gfx/cairo/cairo/src/cairo-image-surface.c
Apparently the forked copy has changed, the code isn't present in vanilla Cairo"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 8663dec404..29088ab0d6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -29,6 +29,9 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://CVE-2019-6462.patch \
           "
 
+# Affects only embedded cairo in Firefox
+CVE_CHECK_WHITELIST += "CVE-2013-0800"
+
 SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
 SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
 
-- 
2.20.1

