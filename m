Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D83096608F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050050"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:01:00 +0100
Message-Id: <68b7d8bb7884dedd264de8d1b6d68e67daaf0ff5.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] openssh: move packaging definitions to the end
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
X-List-Received-Date: Tue, 13 May 2014 11:02:40 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index e784cf4..5173a93 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -10,13 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 DEPENDS = "zlib openssl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-RPROVIDES_${PN}-ssh = "ssh"
-RPROVIDES_${PN}-sshd = "sshd"
-
-RCONFLICTS_${PN} = "dropbear"
-RCONFLICTS_${PN}-sshd = "dropbear"
-RCONFLICTS_${PN}-keygen = "ssh-keygen"
-
 SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
            file://nostrip.patch \
            file://sshd_config \
@@ -141,6 +134,13 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
+RPROVIDES_${PN}-ssh = "ssh"
+RPROVIDES_${PN}-sshd = "sshd"
+
+RCONFLICTS_${PN} = "dropbear"
+RCONFLICTS_${PN}-sshd = "dropbear"
+RCONFLICTS_${PN}-keygen = "ssh-keygen"
+
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 
-- 
1.9.0


