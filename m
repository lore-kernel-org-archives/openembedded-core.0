Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 20A3C7CDE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 13:57:37 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id w5so13868018qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 06:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=uVJdTHnIZXMTtoPeHSvqmDhyyQiAiFZu6WMOlNn3CGY=;
	b=NZH61aDzSFhwHHh7378cH3XT+yE3bDtR7TG9meWkfd3p18ddBSmlEfpPsSCbuz8JNI
	uVKidlrBM0u/80ekhile6fWCUZetMZYnYYwSrh53Yf2JjWYJcnUpCLSZoDwcOwkB+PIW
	EESuqK7Y616b0t18rhHNROX5ndX7NJWFWlIge7JuAE6TLcFkICF0fSouY0MHwH9ZCG4G
	XXcquFUaQTDNxo4PgmF55YpmM+uq1LsuGSD+2HUoYVvf5HW5flVABo8ZCzecyiBS14PH
	MThJvxubv7mTh7KOel1W5ObPpXseoGhUbGy47K8Wmoppci93AfVgEcQs9T+0YVQ1uXT2
	ix8A==
X-Gm-Message-State: APjAAAXsmuy1Nagi294eBLE50NMvd5ZHXHoy6kSGtBcj6Q7KXHjr+6tY
	wx201vt7gPKso9qkDJx0XUH6vhBd
X-Google-Smtp-Source: APXvYqza72yozpwZvdczoFLUUV29LcXCF98ooSSiU0FrG/jb3KIDd3PnVOBtoXsLZ/uhstQV43QyIg==
X-Received: by 2002:ac8:16c5:: with SMTP id y5mr2105828qtk.117.1553003858727; 
	Tue, 19 Mar 2019 06:57:38 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	h10sm12319693qta.3.2019.03.19.06.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 06:57:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 10:57:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 10:57:27 -0300
Message-Id: <20190319135727.31246-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319135727.31246-1-otavio@ossystems.com.br>
References: <20190319135727.31246-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 2/2] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 13:57:38 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years updated
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 .../openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index c5900ad536..08f8253156 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -7,7 +7,7 @@ SECTION = "libs/network"
 # "openssl" here actually means both OpenSSL and SSLeay licenses apply
 # (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
@@ -20,8 +20,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "963deb2272d6be7d4c2458afd2517b73"
-SRC_URI[sha256sum] = "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41"
+SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
+SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
 
 inherit lib_package multilib_header ptest
 
-- 
2.21.0


