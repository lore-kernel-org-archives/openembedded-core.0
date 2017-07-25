Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 96D127197B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 10:17:27 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 33so60387922wrz.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Rf2In7KeQBuAYxFC1X8cs45L70a/GfsqbSZkgfBICcc=;
	b=PYDaLeGZQ1y/Cvr41fyZEXLV0ZOWO1mP2kWL1DqW0ffhaBUR7X+q3UkimvAQvahnW6
	WXQUnkrhD+god5O09RknDzdkCqp3ynqSNmr4mg087cXvqgNra30fTuuQ7PH3NbuTTSbG
	YrqYsMXukxL/OYbMFv7ldJsNjP2Ha9+scxvk8f4jQWtHt3qSSWMSNKc1ZlPemMW22cY/
	aDMeWqDxLRAZSI22+OSy8dkHdmL33ILuaRUSbJQgoLhKsTlmTyDtFUGFvaee2Tpv5wSk
	5/bOPHBvRedQjI5kwcPo+wOZ0Vm0Is/zRunTAtFFHDHgdT1NxPoZtWx3UzKDOz5jMwIH
	KlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Rf2In7KeQBuAYxFC1X8cs45L70a/GfsqbSZkgfBICcc=;
	b=pfI/E7kAtDJXgyXKLrDhKTkRLfIkW42y6zJKe1Su9wZgG2USGF0D9DqeBVxcJhl7ME
	L3cZzR33s8z1gLQ8pGmHsQZN+pDv/dS7iG+gav11zHX8onl9ynKNf8Cufpm8j0M7dKhr
	CwXfir5M/mw9zBikSKEIFrX8eN02icutSmHQlDDrS6K6BLsUaVMutZKCq+i5YBBxL1xN
	vY6O0a1XieIGwnVcDJNnAJKM4hc6oSWABtwIRvIpYQv+72fnbCc5Xd33Xnk72RNSlkrP
	Prq7T3kmUtRLqzPJ7tjYWRJQUx94Egx/ZqhP9exnMi3C9lYPhTLaMiF5akc5lCgXKTcs
	XYLA==
X-Gm-Message-State: AIVw1135pgGUquHEpY3lCNE0vpk9uRJJfT10gEgaz6bd30K+ec7G2Xeo
	V9FWHDXJy5KWQUzglkk=
X-Received: by 10.223.150.200 with SMTP id u66mr17329171wrb.216.1500977848009; 
	Tue, 25 Jul 2017 03:17:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r199sm10645623wmd.11.2017.07.25.03.17.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 03:17:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 11:17:17 +0100
Message-Id: <20170725101719.2172-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] elfutils: use HTTP instead of FTP to fetch
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
X-List-Received-Date: Tue, 25 Jul 2017 10:17:28 -0000

FTP is inferiour to HTTP is all respects, so use the HTTP URL for the tarball.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.168.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
index c0a4f234020..0717616ec0a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -5,7 +5,7 @@ LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
-SRC_URI = "ftp://sourceware.org/pub/elfutils/${PV}/${BP}.tar.bz2"
+SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
 SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
 
-- 
2.11.0


