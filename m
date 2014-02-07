Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B216E6E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:48:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Feb 2014 08:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,801,1384329600"; d="scan'208";a="477699831"
Received: from ryanpete-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.135])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2014 08:48:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 16:47:33 +0000
Message-Id: <1391791653-12182-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH] guile: fix the depends for target recipes
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
X-List-Received-Date: Fri, 07 Feb 2014 16:48:11 -0000

The depenency on guild-native and libatomics-ops is missing
in multilib build, fix the depends with class-target.

(From OE-Core master rev: 88f1913f7cea54f0e4e1024ea506b5ce9faea96b)

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/guile/guile_2.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.7.bb b/meta/recipes-devtools/guile/guile_2.0.7.bb
index e7191a7..8274686 100644
--- a/meta/recipes-devtools/guile/guile_2.0.7.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.7.bb
@@ -36,7 +36,7 @@ BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi"
 # add guile-native only to the target recipe's DEPENDS
-DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
+DEPENDS_append_class-target = " guile-native libatomics-ops"
 
 RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
 
-- 
1.8.5.3


