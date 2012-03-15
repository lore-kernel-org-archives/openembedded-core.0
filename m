Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809k-00034S-DJ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089803"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:13 -0700
Message-Id: <bb41438db25e3bf0090107a59a533660052ccceb.1331776832.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/8] ncurses: fix install error
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fix this issue:
| rm: cannot remove `/srv/home/nitin/builds/build-multilib/tmp/work/x86_64-poky-linux/ncurses-5.9-r6.1/image/usr/lib64/terminfo': No such file or directory
NOTE: package ncurses-5.9-r6.1: task do_install: Failed

PR not bumped as there is no change in the packages output.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3319949..4d64f5e 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -151,7 +151,7 @@ shell_do_install() {
                 ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
         fi
 
-        rm ${D}${libdir}/terminfo
+        rm -f ${D}${libdir}/terminfo
 
         if [ "${PN}" = "ncurses" ]; then
                 mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
-- 
1.7.6.4



