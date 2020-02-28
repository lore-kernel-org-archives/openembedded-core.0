Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 516EF61972
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:07 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272011"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:25 +0800
Message-Id: <a02934484605e5f81e67798d4d8eeb24e70591e6.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 01/22] glibc-testsuite: Remove the do_install task
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:06 -0000

From: Nathan Rossi <nathan@nathanrossi.com>

This task is not intended to be run as this recipe does not produce any
packages or install any sysroot content. Additionally running this task
behaves differently from a normal glibc build, and can result in issues.

[YOCTO #13737]

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b51252cb8bd9badfa28794f9ef9431b48752e3d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.30.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
index 657fd4d..c44f30b 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
@@ -58,3 +58,4 @@ addtask do_check after do_compile
 
 inherit nopackages
 deltask do_stash_locale
+deltask do_install
-- 
2.7.4


