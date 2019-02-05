Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 421EE6BCDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 14:48:11 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id w18so8971354ite.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wq8CxzDwF7KT3sQ2HtXMglukUPk5MvGxOXJ4t5M1s20=;
	b=SvsHOtKjLKjqpkcuyDd0ULbpnk2J9A9e9DMZn8VJVfXCGV1SmQHDSgZlWqp7AH8CTI
	dDXAIUzB3jXm3xJj1kbVNVJSklcjUCbx7vpXNbhTxxEuvcsPEo/TSIQarRwE1yQaCDuL
	QuTPg+NzuUkcecl/jPKkRmBDL3sjkqzTryJ1xRVwkK6oAK4mmcTvVocIh/yQBWQfPMWa
	GlhLpDOG6WmiJBWtAQRU8yhdXUqsS6bvlJa8dRTCaFpxBveqztLOPpnN1HbTUaF4g9oD
	eGiDBRveHi+DRjhccE/141cwEjOQctByOQtSHxnfHnJdyyKp3eSGLokvPtzjm639mOCB
	82TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wq8CxzDwF7KT3sQ2HtXMglukUPk5MvGxOXJ4t5M1s20=;
	b=IMz1uNg67TcGgAub4w/mq+rdU99gR9aspHXu86nkVl1iu9e90/3q3UgXYUOSCQHqGc
	FNSQ+s8VDv/rc9ffF0xdXs8Sa0DHmgm8H3jACHBKioD/o1ENRfQ/+JDM695BZIfOJpUL
	dxlXEFZWyYNkZN/YQpUtj0hseZxE21zzmqCRjOL1XPGbstzMmbtGzgfHAQJKMRemdrl1
	bNsg+JlH4zNattKiyZQFP4eKC+zuaKv/1zXhm8ww+fBaqHEpOPQdG2d94sQhUVan5s6t
	ym7ZYx8wuYnGf1oB1rkP//M9a74WG8S5VUhSU+gu1/IbRZ/kuPPUH6Il7EiuwMNe/ibm
	5l7g==
X-Gm-Message-State: AHQUAuYAZ8bLmEyTwu9+l+KsBhJMJhXuyuaMdVfylqFvVmThO869DmJ0
	kgP+QHM2NBXtDje5K0BZZGtlbVy8
X-Google-Smtp-Source: AHgI3IZL5lj39M5mcCxxNffuayK4jMRL5e8Gh2ZZGXCmDOJ76Bb4CvcX6nlUb1luMe9nKG8vNMDS3Q==
X-Received: by 2002:a02:7129:: with SMTP id n41mr2887630jac.98.1549378091927; 
	Tue, 05 Feb 2019 06:48:11 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id t7sm1506386iom.27.2019.02.05.06.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 06:48:11 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 09:47:51 -0500
Message-Id: <20190205144752.4956-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libxml-sax-base-perl: extend nativesdk
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
X-List-Received-Date: Tue, 05 Feb 2019 14:48:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index b3e01e9ace..373b522d6a 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -21,4 +21,4 @@ S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
 inherit cpan ptest-perl
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


