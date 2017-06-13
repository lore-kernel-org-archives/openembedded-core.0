Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7AEC67829E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:30:13 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 13 Jun 2017 07:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="114340466"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2017 07:30:15 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9446958010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:30:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:29:47 +0300
Message-Id: <1497364193-519-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497364193-519-1-git-send-email-maxin.john@intel.com>
References: <1497364193-519-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/7] libpcre: switch from ftp to https
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
X-List-Received-Date: Tue, 13 Jun 2017 14:30:14 -0000

For the same reasons as Debian:
https://www.debian.org/News/2017/20170425

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libpcre/libpcre_8.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.40.bb b/meta/recipes-support/libpcre/libpcre_8.40.bb
index 6396872..8563cd1 100644
--- a/meta/recipes-support/libpcre/libpcre_8.40.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.40.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=60da32d84d067f53e22071c4ecb4384d"
-SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
+SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
            file://run-ptest \
-- 
2.4.0


