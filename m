Return-Path: <shantanu@senic.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 44B4571A18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 19:12:36 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id p87so4276864pfj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AYBFJDgieuuXWeQ/gDOzwnpj2z4KCG1PYX5p+XuW+jk=;
	b=tKdTH0ME3GzzkXqcYr84c9H5er1ZUSWgpPoStQMwoqRknwZ9JiuYI/C38SDFGzrYVQ
	l2tEp6IGxBBXy4yUsOK7tG+A66JZfe5FayJQnr/zRj04iHlekENYTZLEeBbZgSAeIDzg
	HHHYQfKjKV9IUY9ZCNu7vGhPa5ddYLPxpVBMvL/+LUJltK7PBlfPRmEtPEao6z/1JO4z
	oC7FKtxwaZBXbqDIxu2M9UEefK7bbyUmHJDSIG9EdHXF9+JNrJcW4rc6fn1YOrA3uj3E
	yfacD4DNjIvmdKxre8rVm7mzz3obOGw0RQo2TCTq2tvSfUAZK25lX+KUiz6wMjiOjL/J
	Jyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AYBFJDgieuuXWeQ/gDOzwnpj2z4KCG1PYX5p+XuW+jk=;
	b=Ld5s0Vk1Jd4l2lxhbmcsS6fmCyV0xNiedvbIrkhBtXvtDr1H+345cu9MDNXclJmrKS
	fS47rDwOiYT6tQ/6tf+HIcqbjW3KI0LeUC4S0WVq+2JxaI2ns3WJ1+m0419D+rRFKF7n
	whJ7CXyJ1qumFNUIYVSkiROKveAPhhoGtW9EPkg0w0JuuFWLEy9ffBNSpRn1+sut6pcH
	R2u9sHs5KYqODZg8oN458b9aNt9UvJkBKHTD5ywvwkqAz9zC3Ya4eLPyb3erbdEe5Jy7
	Z8f9V0QGP37D9jCcPFP1kGhtrmBb6Ok3GrRwXC8onA9ndc0c54cuseP7RcpxTTqxDOJU
	AKwg==
X-Gm-Message-State: AHPjjUgwcnUUS5P29K17YwYz85+GM+ElUUABEE5N0IJxBo8iOJsaI0h1
	LbGJP13/R5uDY25KaAdiNpXzCEXf
X-Google-Smtp-Source: AOwi7QDrMV7lz8L6yjtKsV+jKvpi2dme/RY0z01K/HllB/46JMg/O0maoxYymrEXYACE9MMnXjWj5A==
X-Received: by 10.98.202.138 with SMTP id y10mr8403821pfk.151.1506366758074;
	Mon, 25 Sep 2017 12:12:38 -0700 (PDT)
Received: from k-bhumi.domain.name ([45.126.64.155])
	by smtp.gmail.com with ESMTPSA id
	d23sm6502029pfe.115.2017.09.25.12.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 12:12:37 -0700 (PDT)
From: baali <shantanu@senic.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:42:17 +0530
Message-Id: <1506366738-1064-1-git-send-email-shantanu@senic.com>
X-Mailer: git-send-email 2.7.4
Cc: baali <baali@muse-amuse.in>
Subject: [PATCH 1/2] curl: option to enable http2 protocol support.
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
X-List-Received-Date: Mon, 25 Sep 2017 19:12:37 -0000

From: baali <baali@muse-amuse.in>

With default --without-nghttp2 flag set there was no way to get
http2 protocol support using nghttp2 library. Instead moved it to
PACKAGECONFIG options.

Signed-off-by: baali <baali@muse-amuse.in>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index 54f3b66..c22c827 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -48,13 +48,13 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2"
 
 EXTRA_OECONF = " \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libmetalink \
     --without-libpsl \
-    --without-nghttp2 \
 "
 
 do_install_append() {
-- 
2.7.4


