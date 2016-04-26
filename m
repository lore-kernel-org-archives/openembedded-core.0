Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6B270100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:48:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 26 Apr 2016 01:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,536,1455004800"; d="scan'208";a="92043342"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2016 01:48:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 521BD6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:36:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 11:48:25 +0300
Message-Id: <1461660505-24823-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1461660505-24823-1-git-send-email-maxin.john@intel.com>
References: <1461660505-24823-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] libxml2: fix dependencies and QA Issues
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
X-List-Received-Date: Tue, 26 Apr 2016 08:48:49 -0000

Fix the following QA warnings:

WARNING: libxml2-2.9.3-r0 do_package_qa: QA Issue: libxml2 rdepends on
libiconv, but it isn't a build dependency, missing libiconv in DEPENDS
or PACKAGECONFIG? [build-deps]

WARNING: libxml2-2.9.3-r0 do_package_qa: QA Issue: libxml2-python
rdepends on libiconv, but it isn't a build dependency, missing libiconv
in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.3.bb b/meta/recipes-core/libxml/libxml2_2.9.3.bb
index 9c9873f..481346c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib virtual/libiconv"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
-- 
2.4.0


