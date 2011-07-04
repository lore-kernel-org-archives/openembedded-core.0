Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMA-0005UJ-Nw
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:46 +0200
Received: by rex (Postfix, from userid 1000)
	id EEB16306CF; Mon,  4 Jul 2011 17:46:30 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:23 +0100
Message-Id: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/8] oprofile: Fix QA warnings
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:46 -0000

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
index eb707e0..603500d 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
@@ -15,6 +15,10 @@ DEPENDS = "popt binutils"
 RDEPENDS_${PN} = "binutils-symlinks"
 RRECOMMENDS_${PN} = "kernel-vmlinux"
 
+FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*.so.* ${datadir}/${BPN}"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*.so ${libdir}/${BPN}/lib*.la"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
+
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/oprofile/oprofile-${PV}.tar.gz \
-- 
1.7.4.1



