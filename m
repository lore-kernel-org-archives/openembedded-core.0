Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1A665CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 07:37:25 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so14490889pab.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dJbTpMBqrHUBPp3JMMtmltjYJzjw07UXAA+iQuCADMw=;
	b=jneFMYlHPACHkB+ZW2tQgKl6NnRqL/vjy6Zwf5M3CARxEHMG0GltrnR+8yuWgrB4no
	z/mb8yVzvJwPcGujFTT8+8BABlhRRbYO6K7ly27xSoscac305no7wdMX2CUbzPplqGMp
	neg0uIgKAXLJfp7xcx4WCjLSQ9YSG82N8cvMakDgOTl+Ab7WBKfiiidp17xUJpzjpXNH
	ZNKjbUjuML0rpKNSSBDvfuHrf6+wUEM1h1QXmnqRJVFnO/dZv6sWzQ3ZSHrh4anEUgSe
	7QudtTxEqovA2BWwNghznXmNUIGIGjp82Nhw1O90fYvrmqbZ++j1tPCJeUSqqISXSDeX
	FiRw==
X-Received: by 10.67.12.175 with SMTP id er15mr1032169pad.143.1407915446159;
	Wed, 13 Aug 2014 00:37:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-162-180-210.hsd1.ca.comcast.net.
	[73.162.180.210])
	by mx.google.com with ESMTPSA id am2sm1130593pbc.59.2014.08.13.00.37.24
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Aug 2014 00:37:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 00:36:55 -0700
Message-Id: <1407915415-9047-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1407915415-9047-1-git-send-email-armccurdy@gmail.com>
References: <1407915415-9047-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] curl: --with-random is only applicable with openssl
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
X-List-Received-Date: Wed, 13 Aug 2014 07:37:25 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 4b7f9ec..8bcd9ba 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -24,12 +24,11 @@ PACKAGECONFIG_class-native = "ipv6 ssl zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[ssl] = "--with-ssl,--without-ssl,openssl"
+PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
 EXTRA_OECONF = "--without-libssh2 \
-                --with-random=/dev/urandom \
                 --without-libidn \
                 --enable-crypto-auth \
                 --disable-ldap \
-- 
1.8.3.2


