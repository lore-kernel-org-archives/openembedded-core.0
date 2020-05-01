Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8564.1588335698061933827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 05:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=g1t5ADOk;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id EA59060218;
	Fri,  1 May 2020 14:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1588335696;
	bh=i55boJsXbJFMopcMmt78ay/o6ylFn8n3F8Hl5UmN8tw=;
	h=From:To:Cc:Subject:Date:From;
	b=g1t5ADOkqHRpZAmCVYUwDPfZ38yjmCFhvXbaqd+yCkMiIEglZz9MkzvZfi/K5x8PC
	 O8zSuFTGRte7cElhSvA/JtpSSwG2gzBpQXn/x2OFJE2IucTrdM87dq6baveXgCr0ZY
	 eKbtWpvKW/rd5mLwhGSB5vABtTziLUc6ometx8JW05Nwh+SR3bn/mhIVf+bungVbZL
	 5ccn72rNdzQGC8KYpfY8UEjRiEeQ5JTM+gWhggCFzgpWG32GTw/VtPt7VUTrUXacRm
	 aJmWwy9w7Fw/EwejFFXdi4EbLRtnUIb1rVIp/bj6jRcqO3FRuwDwfTQc2t5kxVuAB8
	 BWHy8oWVISWcw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH 1/2] curl: upgrade 7.69.1 -> 7.70.0
Date: Fri,  1 May 2020 14:19:27 +0200
Message-Id: <1588335568-12407-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://curl.haxx.se/changes.html#7_70_0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.69.1.bb => curl_7.70.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.69.1.bb => curl_7.70.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.70.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.69.1.bb
rename to meta/recipes-support/curl/curl_7.70.0.bb
index e854e8d..d3d8d2c 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.70.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a56c4de8"
+SRC_URI[md5sum] = "db69aa37476dfdf9abaa2fb01b8bbf1a"
+SRC_URI[sha256sum] = "a50bfe62ad67a24f8b12dd7fd655ac43a0f0299f86ec45b11354f25fbb5829d0"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4

