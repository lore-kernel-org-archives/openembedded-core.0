Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW97F-00032q-1g
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:49 +0200
Received: by rex (Postfix, from userid 1000)
	id BC57320D70; Mon, 13 Jun 2011 16:28:06 +0100 (BST)
From: y@tim.rpsys.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:53 +0100
Message-Id: <c85dd323c0df2ab9cde81f5287de4e4db93e48d4.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
References: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
References: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Mon, 13 Jun 2011 17:46:11 +0200
Subject: [PATCH 07/11] initscripts: makedevs is no longer used anywhere so drop dependency. Also inhibit compiler/libc dependencies as they're unused
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
X-List-Received-Date: Mon, 13 Jun 2011 15:31:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 720c252..48b65b9 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "SysV init scripts"
 DESCRIPTION = "Initscripts provide the basic system startup initialization scripts for the system.  These scripts include actions such as filesystem mounting, fsck, RTC manipulation and other actions routinely performed at system startup.  In addition, the scripts are also used during system shutdown to reverse the actions performed at startup."
 SECTION = "base"
 PRIORITY = "required"
-DEPENDS = "makedevs"
-RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r125"
+PR = "r126"
+
+INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://functions \
            file://halt \
-- 
1.7.4.1



