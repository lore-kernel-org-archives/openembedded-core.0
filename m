Return-Path: <shantanu@senic.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 039C878291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 19:20:43 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 7so4532133pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Hpj52xOobOmgCz1O5/hm6dnDB60X4IISy7O/3zFR0FI=;
	b=Wb++j3UJWfTbQuSYTbl+w33GMofyPvKcXFsXCnE/XK55IKGwH+uk1TityCteD2lHIJ
	gynvCKgnWmrk9+ZU39AWdoY0YvGk6Z8TzoYkLaM1gJ15SkhHIL33yiV6zam8j56x8D9z
	gJNYJq2DWyKVwnBHtGVZJu9vlPpe+ygaKKWREkNxwMBQRbx0QD22A8sRDEbXMiBMDLxJ
	xAMU8lKNFxAnZNeRCI/l65PqEgq+0vyZq1Ko2rJPfJEtfeAPTjvc5i9GxgjOGSL779Wq
	LxCQCKFW0vhm/psphr8TWRkvIfEN7aD+dZd/aF7SRJqJjr89zQhO7D7gSBi9Onx59NPH
	LPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hpj52xOobOmgCz1O5/hm6dnDB60X4IISy7O/3zFR0FI=;
	b=TUR9FaZumW3Ivjbfu2sT2hV3X1YDRukJIswus952SZG7kMVwwXsQIHgasY4rXaztRl
	8XNSkvG8X9V0wTJ7eOqIdxszzXUaHzzcszoyZpvlTBnvMZwwBpBAM9uqB/RPIT2Bv3PJ
	erKt/R3q8uYXWiqeNBEL99WssuWY6+O72TdEDgspEmyRnxJR79CPSjCZDUR03kGC8ug+
	MrXbdKeaik8ss9Wc0v+WXoMFl04XTGT0d0L3bu3vf++64kSdihrIhiJj1hbV3WGQzEMY
	4YQkwNHEpjZFac23ykHdqx3yI6UDgKuOp9JkI/2cJSvF+DC6bRA6qMtJdNUd1TZeTcqV
	3Z/A==
X-Gm-Message-State: AHPjjUg51MFJKqpzqSdBS/FQMrsAgKAWqG0nwGzo+Vcd+aI7uH5TFXUB
	HllTQ0H1eIC9qunvBoscu7/wJnGS
X-Google-Smtp-Source: AOwi7QDlYqG0b4pzUQd1yATjZ2FVn2I40UocOsqg+Xs6NnZgYqyaDeLyiuiBhXhRtNfHM9lpxaJ4lA==
X-Received: by 10.99.109.65 with SMTP id i62mr8452556pgc.83.1506367244828;
	Mon, 25 Sep 2017 12:20:44 -0700 (PDT)
Received: from k-bhumi.domain.name ([45.126.64.155])
	by smtp.gmail.com with ESMTPSA id
	l6sm7261510pfc.112.2017.09.25.12.20.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 12:20:44 -0700 (PDT)
From: baali <shantanu@senic.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:50:34 +0530
Message-Id: <1506367234-1401-1-git-send-email-shantanu@senic.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: Added option to enable http2 protocol.
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
X-List-Received-Date: Mon, 25 Sep 2017 19:20:44 -0000

With default --without-nghttp2 flag set there was no way to get
http2 protocol support using nghttp2 library. Instead moved it to
PACKAGECONFIG options

Signed-off-by: baali <shantanu@senic.com>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index 54f3b66..04aeee7 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -48,13 +48,13 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 
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


