Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6519B799D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:18:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s12-v6so2525782wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9Mmk6ypEOhGpRCF5eTJ5627YjiG4sDpkobofsSXwvXs=;
	b=pvtQiapkXSMYjCQVCAR0PL55H3g6Sr1ZLi1HiXcDyujhIMdufuYbFJzxbJ1PY9oZNL
	52XB/0fpstvtPmesMlD8FoVvgYVjQoXV9s6Ysk0VPuhdbZiMihu3w/LAdJKommAwyff+
	qbEe/0zleG92FwC/Lg2aooq3ifXTHyH+KteNyevCsciEIZcD0mhrRVNNG0wCLnG0018n
	M4l+vSjfwksO8l0uwnNnq3dRwdZ1I/fOk8mwnPFjsx+xp0eSuf3d+ERakfH6RpvwdpTM
	YtewKf1+rPOBlAuCFGt/tjAoRHCcePV11IoafaY6brY6XU0wrYSJCMBcNp90iuoNildB
	+MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Mmk6ypEOhGpRCF5eTJ5627YjiG4sDpkobofsSXwvXs=;
	b=P6hlG2A2DSSqhucCRseVuYJNiWbROQedQ0Lna/2Iie9RVmLg4QYMfAsI07HFKW77M+
	7y9TInh+jjmglAohgYkjOAUXyeNnCz9isLE5VA61g78OmjZopYLzOSbYWp5OWXaBofQn
	3ed9ZmK5OTxBVJO/UfazLC170Zbe/PaT6adehUSaIS+W189g40jJjn8oMZF7940EbjgQ
	Wl36M5sZSDn0oye4MSYKmyivdMywYkwUpeIKn4Wp+ncYQFeTKL64hHDgdbaqZVuXlvSv
	RrKhSDs/mRYP6E/WXfOlI/mvMjs+xKd9yuCulE8zOekKnyMxN6J912XI3ygwIE7vhc1A
	b+DA==
X-Gm-Message-State: APzg51BK7SIlyztcXLN0rBcU3h1AFsN62Zu9AiNKtcZjYzzOnc2T8D4x
	QIh7Me91s3y0RmTr8F1+SjVm7p1aKzI=
X-Google-Smtp-Source: ANB0VdbKGdK6DiXouSqVGxj/vSQuNuR6xnhSgoZD0/tjYYzZ/Fiolhl9QZ9LcDSttpeaAe1h1HskgQ==
X-Received: by 2002:a1c:1ec5:: with SMTP id
	e188-v6mr3001942wme.1.1536941885703; 
	Fri, 14 Sep 2018 09:18:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j2-v6sm3163025wmj.5.2018.09.14.09.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Sep 2018 09:18:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 18:18:00 +0200
Message-Id: <20180914161800.33095-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssl: update to 1.1.1 final
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
X-List-Received-Date: Fri, 14 Sep 2018 16:18:05 -0000

This is the new LTS release with support for TLS 1.3.

Release announcement:
https://www.openssl.org/blog/blog/2018/09/11/release111/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{openssl_1.1.1-pre9.bb => openssl_1.1.1.bb}        | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1-pre9.bb => openssl_1.1.1.bb} (94%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
similarity index 94%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index c13731feac8..09b2c010249 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -10,11 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
 DEPENDS = "hostperl-runtime-native"
 
-# This short sort lower than 1.1.1 final, to avoid package version going downwards issue
-PV = "1.1.1~pre9"
-S = "${WORKDIR}/openssl-1.1.1-pre9"
-
-SRC_URI = "http://www.openssl.org/source/openssl-1.1.1-pre9.tar.gz \
+SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            "
@@ -23,8 +19,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "6aa32e976e2c9a4aee858ced135d2573"
-SRC_URI[sha256sum] = "95ebdfbb05e8451fb01a186ccaa4a7da0eff9a48999ede9fe1a7d90db75ccb4c"
+SRC_URI[md5sum] = "7079eb017429e0ffb9efb42bf80ccb21"
+SRC_URI[sha256sum] = "2836875a0f89c03d0fdf483941512613a50cfb421d6fd94b9f41d7279d586a3d"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1


