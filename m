Return-Path: <jpewhacker@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id ADEF27E90C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:55:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d126so1287725pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rxsRI5I6jtYTG8nTO4YrMkZf2rPfALvShF7APw0Y4HE=;
	b=LhxfiGA25JAcfnmPPkVi2FrtmAd+5mCwbwunMvuMIHgfkT0EPFTD41gvrsXV9uVOXK
	gcTvPOYXdTmYKFpKdQ3zsf+zvix+QytUWeAMNLF+vxywRIaX/LRtLWrcSLbD2UM8GHm9
	F8W5VGTr1d8d5SlKkiyOJpG/GK2CcDNwIoA5FZUr0d5BQw2KCHa9u4icK+6KkX6neq0w
	oGggOrlWkNFVNeAoxfuo5zjcclYZGzVjtcIS757m1unpIaQuebfy6rjDij0FMBJyuXoV
	8GHQHShpSCeY2I0qCTh9RrvKAI/nR3JaWALnzNF+RY0fnW/fXO3uRBV/x8SHYhNNfn2W
	JTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rxsRI5I6jtYTG8nTO4YrMkZf2rPfALvShF7APw0Y4HE=;
	b=dU3XEQrVTj8s9HrBQu5DMdolpKtHRk2znQ0ZhpocCBgfQpgZVKx7hSTeIenB0SRAMD
	yWooP14XUCkv8cPED8R0ZsXsy7ammMuQPK5Guu4KUVHSBXiHwwVOzFiR2xX6G5t9+8y3
	GqsIbqcGRNbX0n3eaLIsmNWVNULbwpZt6ppxTdt8KEK7XdlQs+9HKOhdG26EuoCih1ge
	8/+KBa060ZNoZqKxWAchEF2/pD1nSvJemCzbI8KzfDUDfeB61Qg8+9P3+fGYGWIjdw/9
	Px2u7EEKt4jy9bFSGNviuBK0/F/0NGNwxC72QQ7peHmaIvxRHzf63E11fXqxyIdN07MM
	6hsA==
X-Gm-Message-State: APjAAAUQkZLUiKfrstkuppT1hkTrd/W929alhZ92vS+h+3H3jT+BCm0/
	iQj5TedBmnDlvc9qsXarFb7ByC9z
X-Google-Smtp-Source: APXvYqyf8JBXNMK9K6h03sTqL+yJqTchOh/pItyXVbEgqBRXEdIkoBOgVY+V7eestQC4m7oP8gNklQ==
X-Received: by 2002:a17:90a:2305:: with SMTP id
	f5mr6563437pje.128.1561643744604; 
	Thu, 27 Jun 2019 06:55:44 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x7sm3140854pfa.125.2019.06.27.06.55.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 06:55:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 08:55:39 -0500
Message-Id: <20190627135539.16014-1-JPEWhacker@gmail.com>
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
X-List-Received-Date: Thu, 27 Jun 2019 13:55:43 -0000
Content-Transfer-Encoding: 8bit

perl is required to generate the OpenSSL documentation, and therefore
should be present at do_compile. If not, OpenSSL will skip the
documentation generation, which isn't reproducible

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1c.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 01174073167..c57626d8f6d 100644
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


