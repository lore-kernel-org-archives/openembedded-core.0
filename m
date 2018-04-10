Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 4C48574B3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:14:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="32526552"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Apr 2018 05:14:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:07:47 +0300
Message-Id: <20180410120747.41814-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Subject: [RFC][PATCH 5/5] openssh: update to 7.7p1 and depend on libressl
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
X-List-Received-Date: Tue, 10 Apr 2018 12:14:11 -0000

Please see the previous commit for the libressl rationale.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssh/{openssh_7.6p1.bb => openssh_7.7p1.bb}                  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.6p1.bb => openssh_7.7p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_7.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index a2288dfe08e..78cad4727d4 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
 # openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
-DEPENDS = "zlib openssl10"
+DEPENDS = "zlib libressl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
@@ -29,8 +29,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "06a88699018e5fef13d4655abfed1f63"
-SRC_URI[sha256sum] = "a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723"
+SRC_URI[md5sum] = "68ba883aff6958297432e5877e9a0fe2"
+SRC_URI[sha256sum] = "d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.16.1


