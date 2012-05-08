Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRlr7-0001NF-FZ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:57:44 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-l1.corp.ad.wrs.com [128.224.145.171])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48ElenO017426;
	Tue, 8 May 2012 07:47:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 10:47:37 -0400
Message-Id: <18a93648e7927a33bcaa3a7210fdee4ff5669b3b.1336487836.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336487836.git.bruce.ashfield@windriver.com>
References: <cover.1336487836.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1336487836.git.bruce.ashfield@windriver.com>
References: <cover.1336487836.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] kern-tools: integrate minor fixes
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
X-List-Received-Date: Tue, 08 May 2012 14:58:08 -0000

Updating the SRCREV to pick up two minor fixes:

1/2:
    kgit-init: correct spelling of createme

    kgit-init copies the kern-tools scripts and intends to copy createme.

    The typo is in the usage() of updateme as well.

    Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>

2/2:
    kconf_check: fix bad quoting around missing_required.cfg

    missing_required.cfg won't have it's path truncated (if applicable), since
    the quoting it wrong.

    Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1af22f6..b6fab39 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "369e67046a1b72b6447c208babd4d2065265a95e"
+SRCREV = "9bb704df0a86578b8ae1f4c85e45089bef28e026"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



