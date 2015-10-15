Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 740D4770F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:47:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 15 Oct 2015 04:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,685,1437462000"; d="scan'208";a="827558456"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2015 04:47:16 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5A5866A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:46:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2015 10:00:40 +0300
Message-Id: <1444892440-15251-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] toolchain-shar-extract.sh: provide proper path for env_setup_script
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
X-List-Received-Date: Thu, 15 Oct 2015 11:47:21 -0000

The toolchain install script suggest the user to source env_setup_script
from wrong path now. eg:

" Each time you wish to use the SDK in a new shell session, you need to
source the environment setup script e.g.
$ . /opt/poky/2.0//opt/poky/2.0/environment-setup-armv5e-poky-linux-gnueabi
"

fix it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 2ffc2d1..2eeb290 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -183,7 +183,7 @@ fi
 echo "SDK has been successfully set up and is ready to be used."
 echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-	echo " \$ . $target_sdk_dir/$env_setup_script"
+	echo " \$ . $env_setup_script"
 done
 
 exit 0
-- 
2.4.0


