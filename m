Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id DB214745D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 13:53:54 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id s1so22134955qte.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=9MKo2bW125urdq+ozXIbTsAm/uLvfcLM4xCqfKPkbK0=;
	b=r2EIxp7CQO6QSMDlAsX70dltCgTvqgSitS6dhEXV63Tj4e6uiIRSYxBRfgBO5iQNw4
	xnqg4d95WZ/txroFJTsilHQn4jQis1koGJRyOSAv1RCm0ukkg9pkpDYUwP0PTWHCsUop
	79qWUokT+vRuonYhABQmfiLFLl7IxMjV39+a151l2+vNNa0/g5GGp58XUWzMDjCY6ES2
	defuafM3oofyLC1WY3rwcf5hzuEowRVxPZ6Een9LXlDzK44tcO1RpiPEluwPTDWVLSnW
	u4D5CC056a7U5R3FaervN9P9VcvnLPD8YXl1j+1xNCBWpyMhLp50hVeS69vjJqTA90d6
	O+bw==
X-Gm-Message-State: APjAAAUBg8jCEKYg18sWmdjEPE1PwXplCQGqACEnSXqEmQO0AQ8Jfyd8
	0iVAsvciknNelCSfBLyRGjos/Pjz
X-Google-Smtp-Source: APXvYqzaAh8LkPRUAY8n50W4MIImlkKpjwIrIpbPmnpztblM1dcCodQaRw8U0I/DPbUYzAbl1ZMm/w==
X-Received: by 2002:ac8:371d:: with SMTP id o29mr2055556qtb.389.1553003635351; 
	Tue, 19 Mar 2019 06:53:55 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id n1sm7983276qkd.28.2019.03.19.06.53.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 06:53:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 10:53:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 10:53:47 -0300
Message-Id: <20190319135347.27444-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 13:53:55 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years updated
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index d03a225df8..57026596fa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -7,7 +7,7 @@ SECTION = "libs/network"
 # "openssl" here actually means both OpenSSL and SSLeay licenses apply
 # (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 
 DEPENDS = "hostperl-runtime-native"
 
@@ -22,8 +22,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "963deb2272d6be7d4c2458afd2517b73"
-SRC_URI[sha256sum] = "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41"
+SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
+SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
 
 inherit lib_package multilib_header ptest
 
-- 
2.21.0


