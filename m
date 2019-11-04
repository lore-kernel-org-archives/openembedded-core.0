Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E13346D230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:15:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n1so16794901wra.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WaUowR7CIBOAqD7BfZvb1JM7oO7YJljynd7INaP02p4=;
	b=lb/OD2wg/v7JS+W1uiO7lPqq4fua5W/nPIFo/lkUiKh4HJDmZFrMeNMyPKovDMffOE
	U+RKNULweWJlwdFO2+XAc7hZJwbmQMl39LfJHbCBk0+yo62omQPpcFzv5H6lOjWNe4is
	EiNk9hExCkMzfdV3QOkJpEDhNi6u2+QxSEWWdRVk4vT7t6nzRped9d2iytPa/UZqjcrg
	jt1AKzNhjuJVG4GT67xCOhfAzwjxro4d0oWEOsbr4sLA31tvmivFD1RpFpppzhOixsnG
	Kj0tom8dwBPgbL8BUFgMShB9oE/CR5ufpk39xUL1cJpVPZPFOQVgWqALRryRA/LksX0j
	mSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WaUowR7CIBOAqD7BfZvb1JM7oO7YJljynd7INaP02p4=;
	b=YYWXzr6vhvdzOFE+GWlEf8WunG5ka0e79J37B/20kwg+mupPORLbqrLebkoSSjdY/C
	giHA9gx8ioSTqRB1eVaIj8U4J1kGAa4u2B9a8wxTwqpoL3IHPvGdUVwmsnRfPRJnqrQW
	NOGh+y6/ycWEfQZhlPrXhsxPTnmrUEoD5OpTX28aqxViQYXXldkW3Y0UmU1mzNaOvTfB
	FqF6Y8Zcspj6SHpUxUzhpp4SV8COjpnv89k+zUbIAEvgjVwDFdVfClLJkiO9YKOuVpwr
	qUFsi2cdHmWzSlU9ZQPqPXiK07QcTWTGkAqADT/JxDa212JUX8sVmni4g/y5z46tGYIZ
	WWAQ==
X-Gm-Message-State: APjAAAWrUfwnd5E5nv/cVMGOAMfB3Wa9omZ0Y2sum7k24+rRgyoGg/8X
	NUOUKMvwdWKIarWhOl6ahVnEa/WhxFk=
X-Google-Smtp-Source: APXvYqylC0lFYFoJUimBokeuVKtFOz0TUgwDZ1ftCOjF+CuLbf3wC/niDSRtQSeCCxmCnJrh0J72Rw==
X-Received: by 2002:adf:e886:: with SMTP id d6mr1287323wrm.188.1572869701891; 
	Mon, 04 Nov 2019 04:15:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b3sm15388077wma.13.2019.11.04.04.15.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:15:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:14:56 +0000
Message-Id: <20191104121457.22123-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104121457.22123-1-ross.burton@intel.com>
References: <20191104121457.22123-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] file: remove redundant upstream check workaround
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
X-List-Received-Date: Mon, 04 Nov 2019 12:15:02 -0000
Content-Transfer-Encoding: 8bit

This tag has been removed, so we don't need to work around it anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 71801f9d479..80e8b91058b 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -11,9 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
 
-# Blacklist a bogus tag in upstream check
-UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
-
 SRC_URI = "git://github.com/file/file.git \
            file://CVE-2019-18218.patch"
 
-- 
2.20.1


