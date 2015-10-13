Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A79CF65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:53:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 13 Oct 2015 09:53:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="810083388"
Received: from porlows1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.182])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2015 09:53:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 17:53:03 +0100
Message-Id: <f28a52e3d049bbcdb69239b457650373c8df8473.1444755142.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444755142.git.paul.eggleton@linux.intel.com>
References: <cover.1444755142.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444755142.git.paul.eggleton@linux.intel.com>
References: <cover.1444755142.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/populate_sdk_ext: consistent indentation
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
X-List-Received-Date: Tue, 13 Oct 2015 16:53:20 -0000

Make the indentation consistent before doing further work on this part
of the code.

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


