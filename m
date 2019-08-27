Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id B143A7E3AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:46:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x4so45794716iog.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fCji6+UU0PoCg4/GdYjmd7RYv+ab04EbNXNMDs8qkrc=;
	b=iquepltJbve6kG4gDVLa6PwflM7qB4vRZJK1WZrBGA708Hlygj4uoMem5gR2GcdIFQ
	E7OO2xxzhS870IrrNd1cZEPS4/XenlPHC1LhYsRdNCKrU1c2ijXZzQYkGh5NqPDF7UST
	x8ESACZX09B79SMlzbiRuwa7eDJJQDYN1Yj6z2hHAjhWmKYEJyn/lb0dANUmJE64fIPa
	f8yyv0rTj6lm5WW9wk6gaIz5ybnqtvIoqBzPQEMR8avK0Zvm7nxTyGZ5XqA7QYb/G/NE
	J7FrKQrEUQ4hl1XOanveipJ//Tu3ik1L7T7SWu6UQ3mxbELno+r3DLhj3LhVgr/A8v3+
	D2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fCji6+UU0PoCg4/GdYjmd7RYv+ab04EbNXNMDs8qkrc=;
	b=SEbQGcXTkAbiil+qfe9vRF/ZOxhnbpuANzoPYGwc5CxvW6oHmmZBv8BPxRjC7sh80l
	Jgv3rE5EQquHHeAP/FV0+NLhtLx9iJvMCEDkA2kJ9UuZH+Drv+q8mNgvLANKORpY1ByL
	GQg06M0C9E2yU3K8eC3gt3hYNeH13YpQ5E5UM4BGhaHGeEh/uU2HzBV1H8WbZF1E2pq4
	BzQ6TKuzInCAU1n6E/tLLtfK6/0crBlUAOKIQH3kTvNnuRza9uVPVTOCGcnba8gJIT/z
	GiOVNNQTBEr4zDRuGHSFO3j3ktkrg4dpbbOqPd8bWzJxCv2soFxdJBpwM8PiYDnhS9ev
	SxFA==
X-Gm-Message-State: APjAAAWfYQ1IeVK39+5mj11SaUhoY6rbwnA8ah8oMytheAVQs98aReWA
	H/zQ2F27cV1vnNOcaByK1c8diYLC
X-Google-Smtp-Source: APXvYqyXSTu/EnMuZEoUWGPpY3UoBnQdFWwLPl8/F3qfIik3G9G6T9NTvWRYlFiJtzuvwvNaWSG23w==
X-Received: by 2002:a05:6638:3a9:: with SMTP id
	z9mr22214925jap.62.1566909982393; 
	Tue, 27 Aug 2019 05:46:22 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n203sm12955070iod.28.2019.08.27.05.46.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 05:46:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 07:46:17 -0500
Message-Id: <20190827124617.18207-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 12:46:21 -0000
Content-Transfer-Encoding: 8bit

perl is required to generate the OpenSSL documentation, and therefore
should be present at do_compile. If not, OpenSSL will skip the
documentation generation, which isn't reproducible

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1c.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 75159ac725c..da15bc22a7a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -10,6 +10,8 @@ LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 
 DEPENDS = "hostperl-runtime-native"
+# Perl is required to generate documentation
+DEPENDS_append_class-target = " perl-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-- 
2.21.0


