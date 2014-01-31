Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9A76E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:05:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2014 09:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,758,1384329600"; d="scan'208";a="467886828"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2014 09:04:48 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 19:07:37 +0200
Message-Id: <0e9f87e994030bcb32179c91a99f3d2df4001085.1391188004.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1391188004.git.cristian.iorga@intel.com>
References: <cover.1391188004.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1391188004.git.cristian.iorga@intel.com>
References: <cover.1391188004.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] minicom: fix for multilib and x32 build crash
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
X-List-Received-Date: Fri, 31 Jan 2014 17:05:36 -0000

For source URI, the use of ${PN}-${PV} leads to
build failures for multilib and x32.
${BP} is properly used instead.

Partial fix for [YOCTO #5781].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/minicom/minicom_2.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index 9f8ebe4..291b918 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/file/3977/${PN}-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/file/3977/${BP}.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-"
+          "
 
 SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
 SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4"
-- 
1.8.3.2


