Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D4476783F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:05:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5FI5BfJ005222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Jun 2017 19:05:12 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLZ8p-0005lx-Mg; Thu, 15 Jun 2017 19:05:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 19:05:07 +0100
Message-Id: <1497549909-22148-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 15 Jun 2017 19:05:12 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] package_deb: Drop obsolete comments/variables
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
X-List-Received-Date: Thu, 15 Jun 2017 18:05:15 -0000

These comments/variables appear to be long dead, remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 10 ----------
 meta/classes/rootfs_deb.bbclass  |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9cab80b..7bfdf81 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -39,16 +39,6 @@ def debian_arch_map(arch, tune):
     if arch == "arm":
         return arch + ["el", "hf"]["callconvention-hard" in tune_features]
     return arch
-#
-# install a bunch of packages using apt
-# the following shell variables needs to be set before calling this func:
-# INSTALL_ROOTFS_DEB - install root dir
-# INSTALL_BASEARCH_DEB - install base architecutre
-# INSTALL_ARCHS_DEB - list of available archs
-# INSTALL_PACKAGES_NORMAL_DEB - packages to be installed
-# INSTALL_PACKAGES_ATTEMPTONLY_DEB - packages attempted to be installed only
-# INSTALL_PACKAGES_LINGUAS_DEB - additional packages for uclibc
-# INSTALL_TASK_DEB - task name
 
 python do_package_deb () {
     from multiprocessing import Process
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 10af4b5..12002c4 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -32,6 +32,3 @@ python () {
     elif darch == "arm":
          d.setVar('DEB_SDK_ARCH', 'armel')
 }
-
-# This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
-DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
-- 
2.7.4


