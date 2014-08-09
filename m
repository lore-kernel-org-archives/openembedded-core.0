Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5EE870A73
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:38 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so6869982wes.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LCV+CYP0NlCKEXPlbQQypr2Pqj+smEkm1X9SA2kgJMQ=;
	b=FbhvluYVvzvpgzuB+RQ2lRQtvFCIFTj7T3RyMi2AZAX/s5l/v14/ZP2dFDRn2Jl/Xf
	YyA4kTqeI3tm2O0jwTiCfucf0ENLwhYZzOJCOpIvW2DUvZB/RgoQz3b6MtTEI9Ky3c6h
	Qg4/sA4hKeILjIos/4MUuc+NRoYu7VQE0d2ahemAltreH910NBjZa+ptrwTn3eHJtFZA
	X/5WcJplpLi26/rejmaWbK7BCQxURLn01WZxyHKOTjx0h1731bODZcsYVfUUYZSjKFv8
	HCa5AE7se02jX8TVGXAs0mQt5JkPm+AWP9RmgLw5JADNwfs6la64uzN0JvwJGzUUWapD
	B3jw==
X-Received: by 10.194.216.163 with SMTP id or3mr38620918wjc.31.1407600458819; 
	Sat, 09 Aug 2014 09:07:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u3sm20423381wif.12.2014.08.09.09.07.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:07:59 +0200
Message-Id: <1407600483-31215-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] libarchive: add PACKAGECONFIG for nettle
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:39 -0000

* fixes following floating dependencies:
  libarchive/libarchive/latest lost dependency on  nettle
  libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 2a2d0f9..96e2d50 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
+PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
-- 
2.0.4


