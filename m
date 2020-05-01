Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.8790.1588335698745677047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 05:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=sHzwRnKs;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 55C8260357;
	Fri,  1 May 2020 14:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1588335697;
	bh=QIPTTSUcSKGSUzmiBxKMOsXKlLmxSV6k1vWnjTs1r3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sHzwRnKsm2RFpcGWdMjdfKuTIJRJZaijhr/JmdtJSWoHIrYHmd6Y91VgkAuSkbikz
	 kZmPepWksO6JUjYt/75O8o1xpPRFK9armkbJwug+HFJuPBrxaGr5LwTSLTmrnnOBFc
	 0wSMMEulsEg4lM5L7GByosWRCDu5mFlvhyVjgVYXYUvmh3vH57p6aNtyxdJ0g4lauS
	 +EoglBwjO2FkLc0iKCUam/sUjAD2w1jENN1eJYzFUUs1G+2z/uBgaa2XJm+1E0NojM
	 mBLn35UcyWL/yHe8xJKk23JJYXWWUubcx6iU8gbCp6gD5bjh3r/RrQDadEba1DDZsu
	 QFFhI1QBxpKoA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH 2/2] curl: support mqtt in PACKAGECONFIG
Date: Fri,  1 May 2020 14:19:28 +0200
Message-Id: <1588335568-12407-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588335568-12407-1-git-send-email-pjtexier@koncepto.io>
References: <1588335568-12407-1-git-send-email-pjtexier@koncepto.io>

The version 7.70.0 of curl add experimental support for this
protocol.

So, add PACKAGECONFIG for mqtt.

See [1] for more informations.

[1] - https://github.com/curl/curl/blob/master/docs/MQTT.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/curl_7.70.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.70.0.bb b/meta/recipes-support/curl/curl_7.70.0.bb
index d3d8d2c..baf72f8 100644
--- a/meta/recipes-support/curl/curl_7.70.0.bb
+++ b/meta/recipes-support/curl/curl_7.70.0.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
+PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
 PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-- 
2.7.4

