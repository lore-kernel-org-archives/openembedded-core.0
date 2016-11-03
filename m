Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFB371AAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:35:34 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 5so133755vkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=MJ57BLo6rnfnDr5dI60u3hmPRrdhOp5mBF0lK3dMAek=;
	b=ez8S5KVCkJF0hm4+crJCwYckmvUzwFkNFXXcM6mpk+c1O7JaTBWjWhf+gtHk7rJv7a
	XLnz8Pa51yfp1osuAYjry46s8M6cuwHjdI/9wThUXKAUGok8uE3ovktPjYWFtrzFCdMk
	lmJjhtY9TUt6tVitoeZvohnDAL7V/DS0Bvkvfbl4wKA97M3tNw6G+yl0BoIp+ZIeBSvy
	dYegQxnyB/BIZ8c4LFyea9l64DcRf8AWgt6P8PzsLubseyf1r3WD5AX//yooNZO5rAk7
	a35HiTOEJi6qA+BA4Uhrc28GqHCMtFcIpKAk+ByiYKUOfvbfF64lbgJaF3WzltvPioGI
	oyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=MJ57BLo6rnfnDr5dI60u3hmPRrdhOp5mBF0lK3dMAek=;
	b=SgHeGZtJ7YhVCmMUgsbPILv8zaAI2iFmajRw8HL6N0FivFCdycT8Ruq4MnrsQ5kHge
	aer0ZmuLxt1cnu2aIWtaZWb6GzPBSdULDYzYuGhOgvWBWbUd2Op2k0KzrKAF+QJywji3
	G1t2mWDsYwxs/mpV2WvtHh4hiLie+rJ/nb8iP9hLNLc4GHgRuiT+feEXLDp/GZ3QSbzT
	EO9GXwLGDHtcsOtVnv3c5E619QMZUZl/Uns5KLMpIB2U6GDgFA7a3usrDbAOPmQcnVPJ
	ZYiS9ojQChTeBE7LnvE32W09ZHvZzNKYGa/jmGql+eP2P3gUzSGmg3FgmQt8Cjt4bddZ
	SHLQ==
X-Gm-Message-State: ABUngvfOr6ekn4vxdL9EiZA5GOAV+6mrAPTsZVwPKHO2zS3zyMvd/iwiC4xynSjlBl9/Tw==
X-Received: by 10.31.163.4 with SMTP id m4mr6378601vke.176.1478205335171;
	Thu, 03 Nov 2016 13:35:35 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id
	s15sm2162032vkb.25.2016.11.03.13.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 13:35:33 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 18:35:01 -0200
Message-Id: <1478205301-1956-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v3]] serf: Update to version 1.3.9
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
X-List-Received-Date: Thu, 03 Nov 2016 20:35:35 -0000

Change SRC_URI to use APACHE_MIRROR to download serf from apache
project page and remove UPSTREAM_CHECK_URI.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} (67%)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.9.bb
similarity index 67%
rename from meta/recipes-support/serf/serf_1.3.8.bb
rename to meta/recipes-support/serf/serf_1.3.9.bb
index c498d90..2be5a06 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -1,12 +1,10 @@
 SUMMARY = "High-Performance Asynchronous HTTP Client Library"
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch"
 
-SRC_URI[md5sum] = "713beaf05d7f3329de121e218e2fcb93"
-SRC_URI[sha256sum] = "77134cd5010664ca023585bce50978bd4005906ed280ff889f591f86df7c59e4"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
+SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
+SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
2.1.4


