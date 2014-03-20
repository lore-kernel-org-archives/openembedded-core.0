Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C21076E374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:18:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2014 08:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="502841112"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2014 08:15:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 15:15:10 +0000
Message-Id: <63b77e4834120f6943a61e814e1159b06debfeb7.1395328478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395328478.git.paul.eggleton@linux.intel.com>
References: <cover.1395328478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395328478.git.paul.eggleton@linux.intel.com>
References: <cover.1395328478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] python: add python-mmap to python-multiprocessing RDEPENDS
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
X-List-Received-Date: Thu, 20 Mar 2014 15:18:13 -0000

The multiprocessing module needs the mmap module. We got away with not
having this for the build appliance because python-mmap was added to
packagegroup-self-hosted, but this is the proper place to have it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 49dbc0b..a557cdc 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -151,7 +151,7 @@ RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
 FILES_${PN}-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
-RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes"
+RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
 FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
-- 
1.8.5.3


