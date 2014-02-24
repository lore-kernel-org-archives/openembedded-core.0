Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CA0226F12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:06:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 08:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="487168782"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 08:06:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:05:47 +0000
Message-Id: <75eec57038feb9c85630c26958e3e116a2a66713.1393257867.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] documentation.conf: add a few missing task descriptions
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
X-List-Received-Date: Mon, 24 Feb 2014 16:06:26 -0000

We didn't really need these when the task descriptions were only used
for Toaster, but now we're showing them in -c listtasks they are useful
to have.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index d1f491d..617fd2a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -18,6 +18,8 @@ do_compile_ptest_base[doc] = "Compiles the runtime test suite included in the so
 do_configure[doc] = "Configures the source by enabling and disabling any build-time and configuration options for the software being built"
 do_configure_ptest_base[doc] = "Configures the runtime test suite included in the software being built"
 do_deploy[doc] = "Writes deployable output files to the deploy directory"
+do_devshell[doc] = "Starts a shell with the environment set up for development/debugging"
+do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
 do_fetch[doc] = "Fetches the source code"
 do_fetchall[doc] = "Fetches all remote sources required to build a target"
 do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
@@ -27,6 +29,8 @@ do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto sty
 do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
 do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
 do_kernel_link_vmlinux[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux kernel images"
+do_listtasks[doc] = "Lists all defined tasks for a target"
+do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
 do_package_index[doc] = "Creates or updates the index in the Package Feed area"
 do_package_write[doc] = "Creates the actual packages and places them in the Package Feed area"
-- 
1.8.5.3


