Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBE16D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:58 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k13so1476132pgq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=qHipgQo4USs5ifMqRzqGRjpPrN24Tbm/CrbD7YTjbD18AN8l5HGJLSej85C9kavf/x
	Z4qSHk39t2J0BWL5YI+DvXHozZ+99S/zYRrIz8RYrfL2kcB6MHqhOsUXPWuTxlcqut+J
	+evmY1StZKGYdANwBGov2jRx1pvVzs5rDeqY9tUqY8X36YSQfuut/qePzv6MCo4hnNqm
	i76NcgiFELnrB2LUG20JFT4Gpp9tZ5etPMcrqoIyJpgWi8D3emUnAKTs075Acq5XT2Et
	BIVD9DwjTnnuP1L5dlUM/I89EizXjvGyjDmJGuB/m6+3ROGlzgPLn7BZ4nhs/JWaCEeJ
	S38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=CGQMadFCEHeakyFvLoWpiVQC31J2JJsddMx39au9HSdcGft132T8whH7UIYX2fpSDM
	K0tlMctBf7zpzaAQ+CfinjWONwT+wCGUJ/Qkj7rW1D+PIBqdMg7skLT1o5B6EPCReA/s
	CaqORBmP2C7j7euSji9YW8g6vIwYgEezTlNUZ0CKjezL1x9PlK9abK217HItffgEJNX3
	PKd1aWVqa7KTFnrM76mPDx+okV1Xsv1Z2hOhecNGNHXueYXriEyk2/Pr2PAmsUx6ujKD
	NY4FGEx0i2uiaC0ezxYpLEUjkENMXM3aYRTYPaH0D2Rlyw7KTalRuKrChmsbCKKgswXs
	M5/w==
X-Gm-Message-State: APjAAAW0Y2FaS0nLdA6nZkmlxWkcpVID+JZvowzR6rsgUib4XeYXhkH6
	eYdwJUBuu+RL7v/pgJZFjzLJsksVLb4=
X-Google-Smtp-Source: APXvYqzsLumqMKqGiyyaQagXrxsVp3EsqZVYw94kROHyR5r9SoeRBHCqqUgSLoetqtzpbM8LicCZ0g==
X-Received: by 2002:a63:6d4a:: with SMTP id i71mr4116267pgc.106.1561568039347; 
	Wed, 26 Jun 2019 09:53:59 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:25 -0700
Message-Id: <16785ebdc50f38ef4bc30d477a6833bdd4b541d1.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 24/25] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ba99fb6..3326c0d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
-tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
+tar -xJf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
 ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
   ${UNINATIVE_LOADER} \
-- 
2.7.4


