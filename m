Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5608F7CE41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:37:04 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id w20so4039537qka.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=PohJJY0XFuGQ0NnZbb+FO9njzQk0uQZPfF/D5EBjS8U=;
	b=VwSDBUZ5g6NWKd2KTtJXq+jil0a9NjxkHgYkoqGYsldZ7vc9wTLIm6Qc5LOgxPUBoY
	D8oYUjp/QON/O+BEADYo7w3glRKOaK7IOqk3bvFFIr6b9zVsy56x8pHnEz+INBjVCzJb
	uL7Alkt1TLWWjWRjt5qQDT8hcDHvu65oTYMBvFyiBhUEB1GIpQOXjMjP5XqTAFN1/KXS
	f9semRLX3wIp/Jpi1P9rGwUgUM/CWdSXoRB5uitxFGnRxjtKdcJ57E6hR1cmqnTVkghV
	gI3q2iafXGettXbzgwNjA4wFqKnv4AAPhHZ/bx8zaAdtf8sGJ07PPs7gy/XqRWtYiTgj
	nP4Q==
X-Gm-Message-State: APjAAAUINaJQq7om+GwTETqWEIZxrObuLw1ZKC3rTY+vna/AxdCKBDT0
	bH+w5PWaIFx3rU2s5XSxjLpWBR1K
X-Google-Smtp-Source: APXvYqxpg0gmF85ngNMPYAerpd1+8wOo8hI4nClJXgTj8xPG/+dzRfUpXM+TOD4rOdgvEQHGwH1Vjg==
X-Received: by 2002:a37:7d86:: with SMTP id y128mr2676145qkc.36.1553013424978; 
	Tue, 19 Mar 2019 09:37:04 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	o71sm8015041qka.18.2019.03.19.09.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 09:37:04 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 13:37:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 13:36:51 -0300
Message-Id: <20190319163652.24216-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319163652.24216-1-otavio@ossystems.com.br>
References: <20190319163652.24216-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 2/3] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 16:37:04 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years updated
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
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
index 506d6d378c..450ef930c5 100644
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


