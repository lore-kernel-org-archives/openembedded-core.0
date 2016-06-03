Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11B45774EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440113"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:38 +0300
Message-Id: <1dab6cf3994b8cba38a2214ae49bf73b44476e5b.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/25] gdbm: upgrade to 1.12
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:10 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gdbm/{gdbm_1.11.bb => gdbm_1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.11.bb => gdbm_1.12.bb} (88%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.11.bb b/meta/recipes-support/gdbm/gdbm_1.12.bb
similarity index 88%
rename from meta/recipes-support/gdbm/gdbm_1.11.bb
rename to meta/recipes-support/gdbm/gdbm_1.12.bb
index adf8c5b..c380073 100644
--- a/meta/recipes-support/gdbm/gdbm_1.11.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "72c832680cf0999caedbe5b265c8c1bd"
-SRC_URI[sha256sum] = "8d912f44f05d0b15a4a5d96a76f852e905d051bb88022fcdfd98b43be093e3c3"
+SRC_URI[md5sum] = "9ce96ff4c99e74295ea19040931c8fb9"
+SRC_URI[sha256sum] = "d97b2166ee867fd6ca5c022efee80702d6f30dd66af0e03ed092285c3af9bcea"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.8.1


