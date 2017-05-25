Return-Path: <yin.thong.choong@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 90B4D78229
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 00:05:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 25 May 2017 17:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,394,1491289200"; d="scan'208";a="107113383"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga006.fm.intel.com with ESMTP; 25 May 2017 17:05:20 -0700
From: Choong YinThong <yin.thong.choong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 09:54:43 -0700
Message-Id: <1495731283-11636-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495731283-11636-1-git-send-email-yin.thong.choong@intel.com>
References: <1495731283-11636-1-git-send-email-yin.thong.choong@intel.com>
Cc: otc.embedded.malaysia@intel.com
Subject: [PATCH] unfs3: Rename mirror tarball to avoid clash
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
X-List-Received-Date: Fri, 26 May 2017 00:05:19 -0000

Rename the mirror tarball to align with recipe name
and avoid clash if user have local svn version.

[YOCTO #11501]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index 52aa17e..cebc866 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -17,7 +17,8 @@ S = "${WORKDIR}/trunk"
 # Only subversion url left in OE-Core, use a mirror tarball instead since
 # this rarely changes.
 # svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/trunk_svn.code.sf.net_.p.unfs3.code_497_.tar.gz \
+# rename the tarball in mirror to avoid clash with user local svn tarball
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.tar.gz \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
-- 
2.7.4


