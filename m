Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C34B8770C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:23:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Oct 2015 13:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="792867478"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga001.jf.intel.com with ESMTP; 14 Oct 2015 13:23:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:23:30 +0100
Message-Id: <66b23e87a518da018beeac90a49ac50c24fdcd4f.1444854089.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444854089.git.paul.eggleton@linux.intel.com>
References: <cover.1444854089.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444854089.git.paul.eggleton@linux.intel.com>
References: <cover.1444854089.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/5] classes/populate_sdk_ext: consistent indentation
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
X-List-Received-Date: Wed, 14 Oct 2015 20:23:52 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index c244d93..90033ba 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -238,11 +238,11 @@ sdk_ext_postinst() {
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
 
 	if [ "$prepare_buildsystem" != "no" ]; then
-	    printf "Preparing build system...\n"
-	    # dash which is /bin/sh on Ubuntu will not preserve the
-	    # current working directory when first ran, nor will it set $1 when
-	    # sourcing a script. That is why this has to look so ugly.
-	    sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+		printf "Preparing build system...\n"
+		# dash which is /bin/sh on Ubuntu will not preserve the
+		# current working directory when first ran, nor will it set $1 when
+		# sourcing a script. That is why this has to look so ugly.
+		sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
 	fi
 	echo done
 }
-- 
2.1.0


