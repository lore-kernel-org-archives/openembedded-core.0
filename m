Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7477ED4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:17:07 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id e17so28105507ljf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NVkSC7WB1h4KnMhCWNK37ucZMgnT9vdpqHKbt79wi3Y=;
	b=FPyAw7GFPEKQb3GRWim4C3b3uc9PJNKeayS0FCf3ZxxoEfMUN7/B08Ar8dILiWWITC
	qjlPPQdJSaWvANIzzKvlxOMqDG4XAJ5wBOVKyjESd7k9bB/Mr9CwZ48ppFqosb/6QOas
	vipMQiRq3V8rs3dohhL05jK4agUC8bB3eEEVRRIWMxSgXgCi2GiY3R0aQSn4y5ZfDeJE
	LqlSStB5vnUMAY2LsljY0KjeTnr2aCmKJBtLQ8y4sNOcQg6ZzafOwBNsP6IgsRyDl2Bz
	YJg32xjmNOdIPpIG5xhm9fLxTPyWOKufOFKj+bYmNFLKClARILaXlG39A+iKC/jvajhZ
	lkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NVkSC7WB1h4KnMhCWNK37ucZMgnT9vdpqHKbt79wi3Y=;
	b=HikzXMEw1YekSx8UFDJxP7ClzoqXd43eFUmmFmWkL4RhbNOzeJnw7lY7wUG6x7KMHn
	kyVme1R7ypu/GvIslUbMdAuJR53kzfSKm16gJlgbdhNuJ/lU+R+iL6/8aoyasNX666cO
	jvVO/GfPgsbA1ru5Kn16Q0lFwwTznCDdRrwg6FJfZgqIv+gUyP6eDBvqvCHy2Lh7ePQ7
	a7HQh9GFwr0zdHcCj0bN018upnwn3AwZvhUkddcbe5Qg5PTDCdam01UA4zx4xyje5+5I
	rOrkdiZt/yEsvOX6y9FffG3Tz6DylfDN/2GToCJuJd6Wrj2cSrdzSeaIR3sjYItxxwwr
	xX4w==
X-Gm-Message-State: APjAAAWjVMnhtjX/6ep9GuudE8WRtt6VpN6bcIXyRXiLzCCA2QRcZ+2I
	266J3C30tDcA8WBZaGLurhYSwc4kveg=
X-Google-Smtp-Source: APXvYqwM0suZmeuZvf2fS68pow4tG9ENI0QLNnqbBtbhNfauECTCEcVjYYhLLCChZsw1Db8DN0DS0w==
X-Received: by 2002:a05:651c:202:: with SMTP id
	y2mr31559623ljn.4.1568402228420; 
	Fri, 13 Sep 2019 12:17:08 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id v6sm6437433ljk.17.2019.09.13.12.17.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 12:17:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 21:17:05 +0200
Message-Id: <20190913191705.32022-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] curl: update to 7.66.0
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
X-List-Received-Date: Fri, 13 Sep 2019 19:17:08 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.65.3.bb b/meta/recipes-support/curl/curl_7.66.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.65.3.bb
rename to meta/recipes-support/curl/curl_7.66.0.bb
index 96f90fb8ba..d1975f2460 100644
--- a/meta/recipes-support/curl/curl_7.65.3.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
-SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
+SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
+SRC_URI[sha256sum] = "6618234e0235c420a21f4cb4c2dd0badde76e6139668739085a70c4e2fe7a141"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.17.1


