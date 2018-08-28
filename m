Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9776778F04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k5-v6so1043111wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ugaw6poH66LuYULHs05IeSrIgzbIH5P5mUewmmloHB0=;
	b=YbvK4Tp+YhRUzOf53Py6fj7V4WkyoX1ihi/h7CNSMfk6GWynx46I3t7PSRnYLB4n7N
	MTOOMXxmJXWCl9y5kiCcS9d1JL/H3h2hJ/Y6eZZpqPb3Nf0iEC2bOO/JfQDgt0jlxWkS
	S3uFa7NV0OXAngIg1zOlIdqwm6lyyz/PVr/cRJg6h78tgXUO7GBp4J/rfjRdNFrBcxR2
	IWhaqpNcDz3FfaGfxgwBbuqQ4ikrcBgj+Zv1UYVDYV8ZYprT0CmtXPoUJ3SnwWPuT1Y8
	TfYCScZQRLG5c/GnwCjLDt96ns4enG1OhEvTepJfQJdt9j2fn9SPcspL45LSmuCe/HZD
	4/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ugaw6poH66LuYULHs05IeSrIgzbIH5P5mUewmmloHB0=;
	b=efMEgWyMcvHpFkpdv+0cA7eHreQd0JHzXO9SZxnSXgX0qE/2+0HX4dUmXvzblvgeYE
	ngLplY9M8kVsiWd11KNV9gCJx18OR4tQVcXrbAVJ8y1mYtCoxPO9aWbxx8LaYxQHxlBL
	tTvIQiTQtUSa2pVEF6c6+j3AdaAb49TpwWffkH9Tpwab8iwaoxicebUc9cpS8pvTkA2K
	fVZ5tCSThKe0eOGfz4BjsyhDsShThlV3+f6CZULpRaWrjRFN4qyJWXOztAWT/eZBWK9H
	RTJVrkREnkgJmCOmFXEl6EsLGUY9/dHFIPKR019VNw3gOzTs28E5f3mNUc3n6N1//2yE
	FaOQ==
X-Gm-Message-State: APzg51B5Bbu+tzQzD/DdRPY/ylOi65kR/eThFGjldqUG6/XGgqrUt5dH
	PCndk/2FxIPl0WZz698v7Mq1nzi+
X-Google-Smtp-Source: ANB0Vdb+HP5m6vXQw7ieH4G48pVRad6rcbpcfp0BDGHm58v+aSYyjg4rkGOYSOrma/ujZ8RfotLUvw==
X-Received: by 2002:adf:a936:: with SMTP id
	u51-v6mr713004wrc.175.1535451808111; 
	Tue, 28 Aug 2018 03:23:28 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:17 +0200
Message-Id: <c971e5fd32f999781ff4174c7c1ca6d0e54dea65.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 6/6] ca-certificates: update to 20180409
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:28 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

License-Update: URI fix
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20170717.bb => ca-certificates_20180409.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
similarity index 95%
rename from meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
index 24d3a6e..0d57083 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0+ & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need c_rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
+SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.7.4


