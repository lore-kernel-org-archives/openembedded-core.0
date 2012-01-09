Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RkO6Y-0006oC-0a
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 23:54:14 +0100
Received: from mizar.localdomain (87.9.229.96) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6301DA75E9; Mon, 9 Jan 2012 23:46:48 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon,  9 Jan 2012 23:46:13 +0100
Message-Id: <b34b8fc553874406bd92ef5f4d323d7ba49a8ad4.1326148886.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1326148886.git.andrea.adami@gmail.com>
References: <cover.1326148886.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1326148886.git.andrea.adami@gmail.com>
References: <cover.1326148886.git.andrea.adami@gmail.com>
Subject: [PATCH 1/2 v3] kexec-tools: split packaging of kexec and kdump
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
X-List-Received-Date: Mon, 09 Jan 2012 22:54:14 -0000

* from meta-oe (originally from org.openembedded.dev)
* There are no reasons to install kdump when only kexec is needed.
*
* In oe-core/meta there are no references to kexec-tools so
* the recipes inn external layers rdepending on kexec-tools should be
* fixed and rdepend on kexec and/or kdump.
*
* Bump PR.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
index caed816..8d2e606 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
@@ -2,8 +2,13 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " file://fix_for_compiling_with_gcc-4.6.0.patch"
 SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
 SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
+
+PACKAGES =+ "kexec kdump"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump"
-- 
1.7.3.4



