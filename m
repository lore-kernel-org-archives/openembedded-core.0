Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7EA7E624
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d126so6708455pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9JoKEMqiReoDQscuzKYfwrtzyZAE95g2dGWC6Q9+7VM=;
	b=N14m9oSNSXR8r8W2BbuwXCmPUSwU+gq3vf1lKIH5j74wvU7EGzVVj6Yy+ixGdGQrXJ
	8ncwAWMKXXDRrBrSRP2YxsdNo7JEITwe7c89HbZaqBnPmhjZeGFyvz6kTKmoF5zVYDln
	h7ZrTMrcbQ39KVIPevtaudZciOddWYVJHdXB6m50Y4RVFNl9q384tlFY4PN+ipTB5kTg
	FCxqF+pEqYJVM6kCEVHWFftWjdrYP3A6f58NphuMPBHewae50PdWEBFqchKNM4LmIqZC
	jO6wa0R0mHxxmeQTpG+q9/gFiSrx0MNywsFd6Ca5Sh4pevH/nVJhxpePMRyjj9MD10Rv
	DbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9JoKEMqiReoDQscuzKYfwrtzyZAE95g2dGWC6Q9+7VM=;
	b=eI7Aiw1j1CCddjB9mye/+vb+oCgBHpm4gYCp/OodZsjMZD7heYybIuu/jlPOt2dT9L
	EKgOzkN6n4pFE/QvHX0ud8f0rWorSle6OXIK6MajNXhRPSYrANejEi5GKT3k1rcRM6fn
	DJ0s/tk7JNfZjjF8NMLbb3hVTBX0dAqeI40cgCO+KLYaQM0bR5CIYpq2gbRTJSKw/Nj7
	1H8kp/ZxhZjXK5gbcqrjJ5tPlaUNItP0cEFyhOXqkCwC0X4nlV8x/wpHvU4Plmbku8Vq
	o6C++wQJfuEqoedbPUmr86WbdVjTCimNq1YghQ4I2J4+uoMLcurTCR+gOqWAZdXqwtoO
	DkxA==
X-Gm-Message-State: APjAAAVV6iBq0ihoUGZ9FwQlrKKtyOUkPdEreQ+YyKJBK8wCT4XGb72/
	uohoiOPBHbrOh7B1sptOMn/8XuKlZps=
X-Google-Smtp-Source: APXvYqzTdPUX2kxf4xpBjfvscAAbg91wZny5ms6quI2v5kCZ0TqZVghKKrAXPwV7BF1zRvRQi6meFQ==
X-Received: by 2002:a65:408d:: with SMTP id t13mr30653801pgp.373.1561348471014;
	Sun, 23 Jun 2019 20:54:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:08 -0700
Message-Id: <c988b0ee3f6a84ba3b12ebef6901c02fed2cab76.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 09/19] openssl: fix failure of ptest test_shlibload
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:30 -0000

From: Kai Kang <kai.kang@windriver.com>

It fails to run ptest case test_shlibload which requires libcrypto.so
and libssl.so with version numbers now.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1b.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index d3404d2..df2698f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -167,8 +167,8 @@ do_install_ptest () {
 	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
 
 	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/libcrypto.so
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/libssl.so
+	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
+	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
 
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-- 
2.7.4


