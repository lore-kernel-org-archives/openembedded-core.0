Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6D-0004F6-2P
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:01:09 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMm004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:54 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:51 -0700
Message-Id: <b4b519d901203c4b44cb67d856e55e2a3da99445.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 7/9] site/common-linux: Add ac_cv_file__dev_zero=yes
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
X-List-Received-Date: Wed, 27 Jul 2011 23:01:09 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/common-linux |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 14d671b..e75864d 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -1,3 +1,6 @@
+# apr
+ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
+
 # samba
 samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
 samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
-- 
1.7.0.4



