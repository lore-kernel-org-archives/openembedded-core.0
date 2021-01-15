Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.2290.1610707708078822045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MeX-0004qy-Ay; Fri, 15 Jan 2021 12:48:26 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MeX-000AwQ-9W; Fri, 15 Jan 2021 12:48:25 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][dunfell][gatesgarth][master] zip: whitelist CVE-2018-13410 and CVE-2018-13684
Date: Fri, 15 Jan 2021 12:48:07 +0200
Message-Id: <20210115104807.40671-1-mikko.rapeli@bmw.de>
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
 Message-ID: 20210115104807.40671-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
also Debian considers it not a vulnerability:

https://security-tracker.debian.org/tracker/CVE-2018-13410

http://seclists.org/fulldisclosure/2018/Jul/24
"Negligible security impact, would involve that a untrusted party controls the -TT value."

https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also Debian concludes this:

https://security-tracker.debian.org/tracker/CVE-2018-13684

"NOT-FOR-US: smart contract implementation for ZIP"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-extended/zip/zip_3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index c00a932763..47e6fc5278 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
+CVE_CHECK_WHITELIST += "CVE-2018-13410"
+CVE_CHECK_WHITELIST += "CVE-2018-13684"
+
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.20.1

