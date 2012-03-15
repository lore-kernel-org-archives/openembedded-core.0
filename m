Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8Cek-0002cA-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:31:58 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A3A5D2FEAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:23:00 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:22:57 -0700
Message-Id: <b2fba45d2a2d0fa77ba80ebf068cb48e4cf466ef.1331824888.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A3A5D2FEAF.95B24
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/4] base-passwd: upgrade to 3.5.24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 15:31:58 -0000

Includes minor formatting cleanups.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../nobash.patch                                   |    0
 .../root-home.patch                                |    0
 ...base-passwd_3.5.22.bb => base-passwd_3.5.24.bb} |   16 ++++++++--------
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 => base-passwd-3.5.24}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 => base-passwd-3.5.24}/root-home.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.22.bb => base-passwd_3.5.24.bb} (95%)

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.24/nobash.patch
similarity index 100%
rename from meta/recipes-core/base-passwd/base-passwd-3.5.22/nobash.patch
rename to meta/recipes-core/base-passwd/base-passwd-3.5.24/nobash.patch
diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.24/root-home.patch
similarity index 100%
rename from meta/recipes-core/base-passwd/base-passwd-3.5.22/root-home.patch
rename to meta/recipes-core/base-passwd/base-passwd-3.5.24/root-home.patch
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.24.bb
similarity index 95%
rename from meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.5.24.bb
index ae3864c..6eeee5c 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.24.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r9"
+PR = "r0"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -9,18 +9,13 @@ SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://nobash.patch \
            file://root-home.patch"
 
-SRC_URI[md5sum] = "47f22ab6b572d0133409ff6ad1fab402"
-SRC_URI[sha256sum] = "d34acb35a9f9f221e7e4f642b9ef4b22083dd77bb2fc7216756f445316d842fc"
+SRC_URI[md5sum] = "8f6b9420c50e90edaff41eb2fb7e9e16"
+SRC_URI[sha256sum] = "196083d6f675190d4e2cede0a5fa6b3c91088705c5386f76292fec8e74b6369e"
 
 S = "${WORKDIR}/base-passwd"
 
 inherit autotools
 
-PACKAGES =+ "${PN}-update"
-FILES_${PN}-update = "${sbindir}/* ${datadir}/${PN}"
-
-ALLOW_EMPTY_${PN} = "1"
-
 SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
 
 do_install () {
@@ -85,6 +80,11 @@ fi
 
 addtask do_package after do_populate_sysroot
 
+ALLOW_EMPTY_${PN} = "1"
+
+PACKAGES =+ "${PN}-update"
+FILES_${PN}-update = "${sbindir}/* ${datadir}/${PN}"
+
 pkg_postinst_${PN}-update () {
 #!/bin/sh
 if [ -n "$D" ]; then
-- 
1.7.5.4



