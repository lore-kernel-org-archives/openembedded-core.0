Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53F60801
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 16:24:45 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q5-v6so9141272lff.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Qx/IyBifz2adyQXfEb4zREzv8xmTIj+dr18sPO6TxPQ=;
	b=wJ+kI8KlF82oi9k5GAaHxuQSsm3LPaJ1tcuFl7x26Q2/awnqI5c+kBnOfebsGbxZQX
	uYqz8A0mb9Jq2X02m7c6yDaEV4REZRjRzK7ypPKzqsjIVAfok2ZTcWpovl+XKOK2L03n
	brs8MFkilHQgZB4AFJWLWtC+GMFlra0SuPdOCuAOQsPOZxyMtzEGmMvDMkrmDbehFWy7
	hFG2ZYcHSDz7y5DWErvY8YBNcPTwYtw6AuBbIllzLRNt8LhF4Yop0DfNgPA9Elb1Thba
	4uT0dcKHUzkj0P4uwE9WcyRTRBigrjEOkD0Mug6dVIpaEVmDLhzjC4BSRysymHHP10a2
	dMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Qx/IyBifz2adyQXfEb4zREzv8xmTIj+dr18sPO6TxPQ=;
	b=Sku9jQeJnBnEo1oZ9JpEYVkhpIip/r96zIkC88cMsV9MSSVobX6r8xg6vJEb0swsxn
	sEifbbO4PkQtIjMD+3b7O5A+/U4p0C5tKOTvI4Emp2E0c2pXQn3huxHn5zL9BelgN3zV
	6gyPXq3U3SjRWcVDWlt3g9taAWP7D54vEnsTIQ1hZiBt/Tt+hvj0W0ELJck6Nl+K6R5l
	KXnnFWWzbPh4UO9krYPZola01yRnCgx7j7bIecf12Ht02OS2tgHnutChaDybu4SLoCG4
	UC1UzBBcU0BrFrgcQ9bePzFR8vNUNmDCG+YOB7a7L0XyCwqLqlz6T4Haa3bsw4Oixs8O
	P6UQ==
X-Gm-Message-State: ALQs6tB31m8buJatX0xtCgWiJ/wc6jGnOiYFOJcd9njBRtWVXMukJcY6
	kOrnmd6xIgtxJ6UnH/uwUTQ7se7V
X-Google-Smtp-Source: AIpwx49eWge6nkjITCLXefWY43X0uuq36Im/+ffG7ZMPtib6oEgf5cNZObYmGNGn/DeqH9aG13ilnA==
X-Received: by 10.46.126.5 with SMTP id z5mr9557377ljc.28.1524327885980;
	Sat, 21 Apr 2018 09:24:45 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:b5e4:fd3f:4815:8269])
	by smtp.gmail.com with ESMTPSA id q1sm1526951ljc.13.2018.04.21.09.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Apr 2018 09:24:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Apr 2018 18:24:36 +0200
Message-Id: <20180421162436.17402-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] curl: upgrade to 7.59.0
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
X-List-Received-Date: Sat, 21 Apr 2018 16:24:46 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.59.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.58.0.bb
rename to meta/recipes-support/curl/curl_7.59.0.bb
index d2d0180268..c244c60d69 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.59.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "fa049f9f90c1ae473a2a7bcfa14de976"
-SRC_URI[sha256sum] = "1cb081f97807c01e3ed747b6e1c9fee7a01cb10048f1cd0b5f56cfe0209de731"
+SRC_URI[md5sum] = "a2192804f7c2636a09320416afcf888e"
+SRC_URI[sha256sum] = "b5920ffd6a8c95585fb95070e0ced38322790cb335c39d0dab852d12e157b5a0"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.17.0


