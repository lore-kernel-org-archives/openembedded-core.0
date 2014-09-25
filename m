Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 83AA87148D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 23:13:27 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id p10so8406392wes.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 16:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=627wLtz/F50p+zELWfObIjxt0bZgF4eYW4LLRnp4MMc=;
	b=hV7jVagNo+V2ix8qJRRg2MR5eFySIucYkoB97eiOMYrGxErExrKCPkJCDbreQCGeEC
	vWS8Clz4LhXHaB2phi3vh+aDJSPWEsskHBvpJSPPLsybRBaK9eNvSpYv9z83KMVmZrS4
	5124J1wI2gvHGvsQDU3nzDKNwJ0210xVsqUsKx0g4q+bzY9QEHAjRmYxo7yqs3WvAXrx
	G+MIj2dfQ6ft3AS0yxyJ8anLoMULPj6sAClusYsdigYaDMGgOckg0D0jmo/Bu82KnJv9
	DbqidutTvURtRKBWX2rGNX7k/AsVV/Nb0+qfldi5mcq1yuOp1MG3frY2ZhJ8gxQfpC54
	x1CA==
X-Gm-Message-State: ALoCoQmZwHJakHe63/nBe7oHtozZOOAb7rE5xGL4f+cTZYFZJXUmhj6pVTm3RrLI+hb5cL1InXug
X-Received: by 10.180.95.230 with SMTP id dn6mr41357481wib.14.1411686808126;
	Thu, 25 Sep 2014 16:13:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id kx2sm4231828wjb.6.2014.09.25.16.13.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Sep 2014 16:13:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 00:13:22 +0100
Message-Id: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] curl: add a PACKAGECONFIG for librtmp
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
X-List-Received-Date: Thu, 25 Sep 2014 23:13:33 -0000

Otherwise this is a non-deterministic build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 8bcd9ba..e2852e3 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 
 EXTRA_OECONF = "--without-libssh2 \
                 --without-libidn \
-- 
1.7.10.4


