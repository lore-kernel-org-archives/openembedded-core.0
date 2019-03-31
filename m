Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14CB26C376
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:29:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h16so5896804ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=blXjqJCZzWrC6/lVmHMJa2+XU3WTBFSNrmrkbqc4HeI=;
	b=Kf8pJauagmEPXg5iTH9UM9igdO7HEkXugamwEozFAyjhJh3OWE1IVQHA2w5iE1KRHO
	qAF91U7fxwBLPC8gHPCZm2euinYGbdlNFJcosd53Z3tgiC8nuufFMPEFLc/PIYWVvtJ+
	iTkjNvD1aKciM4IRhfdYW0tA3Eq9aYNOFSsx7eKi2hFe6wwNflfiZE8QWls5jLHDG5dx
	Yg9fqEraAP5KWiFlaYipw/owOSF/t6h6rqeS5CU4Jc10e5eXjsoI9A5pVN+DKUsP1pcP
	UClNjrx7U+vPC7SfCx4mU6LwDrbkXclLquSMyURhHZV8Tl/1K4YKLQANUGrfy8YOzejg
	s6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=blXjqJCZzWrC6/lVmHMJa2+XU3WTBFSNrmrkbqc4HeI=;
	b=LoP8jUr+zf4rGJnNB9o4Q7u/3LNiRLhqxCvzmyIat+p2JwtaUAnFCKog9aIcmHjdnc
	+JegGAIPIrKv/mV6L8MQht8f2kyFMDxFQTZDh72vWFwOr/XngWNMazR0INivk3UrqAFB
	oNnMddQEVU5MjLiFCo8gfrw0oah1O1SC4ogxjbj7s6Ku2IFVZrxX9OQYo0J0JjzgXgf8
	QSlpg7YfiaBJqby6gLLE+hd8IloEM0SACVOR97G8p+pPgPeFg5Z28UMRoGCMUiRL1Dus
	cIUeZEwA3o4jTI1Nw5kH0FwB0HT8CB9Xzf4JyT5Ey5GnVIbF5BmPdL75LYJhjpxFvVLK
	9gtw==
X-Gm-Message-State: APjAAAXG4qT42ap1oHed5PFO43dlG/SY7s28f8RhOE7j7Q+bmIWKtIRp
	8USOJ8QDsVnqYf3b7rUlGHUbHE7LSN4=
X-Google-Smtp-Source: APXvYqyUbqeSl7rFOnuoDaWFOjt219Rb7cBLBL1Cn61zcsc9Z7Wv1ldGRrO1OXc2eEMzueUxa/LgoA==
X-Received: by 2002:a2e:454:: with SMTP id 81mr23967084lje.23.1554049799176;
	Sun, 31 Mar 2019 09:29:59 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id r1sm1373908lfm.7.2019.03.31.09.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:29:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:29:56 +0200
Message-Id: <20190331162956.3066-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] curl: update to 7.64.1
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
X-List-Received-Date: Sun, 31 Mar 2019 16:29:59 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.64.0.bb b/meta/recipes-support/curl/curl_7.64.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.64.0.bb
rename to meta/recipes-support/curl/curl_7.64.1.bb
index a1b5e7d579..47c28beff6 100644
--- a/meta/recipes-support/curl/curl_7.64.0.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
-SRC_URI[sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
+SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
+SRC_URI[sha256sum] = "4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.17.1


