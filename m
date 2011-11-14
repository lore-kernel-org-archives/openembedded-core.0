Received: from ausc60ps301.us.dell.com ([143.166.148.206])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael_e_brown@dell.com>) id 1RPpXD-0007sN-IZ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 06:56:47 +0100
X-Loopcount0: from 10.9.160.253
From: michael_e_brown@dell.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 23:49:16 -0600
Message-Id: <1321249756-23563-1-git-send-email-michael_e_brown@dell.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Michael Brown <Michael_E_Brown@dell.com>
Subject: [PATCH] gcc-4.6: fix toolchain build for SH4
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
X-List-Received-Date: Mon, 14 Nov 2011 05:56:47 -0000

From: Michael Brown <Michael_E_Brown@Dell.com>

Signed-off-by: Michael Brown <Michael_E_Brown@dell.com>

Port patch from base openembedded. Since 4.6 already has fixes for config.gcc,
the fix only requires a one line change to gcc-cross4.inc.

The patch was imported from the OpenEmbedded git server
(git://git.openembedded.org/openembedded) as of commit id
3aa8afe97e9cf1340feb9c4442a6ed88b7e32c96.

gcc-4.5: Fix toolchain builds for SH4/SH3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross4.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross4.inc b/meta/recipes-devtools/gcc/gcc-cross4.inc
index ea20a24..4a20818 100644
--- a/meta/recipes-devtools/gcc/gcc-cross4.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross4.inc
@@ -1 +1,3 @@
 require gcc-cross.inc
+
+EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
-- 
1.7.6.4



