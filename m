Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW97F-00032v-V3
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:50 +0200
Received: by rex (Postfix, from userid 1000)
	id D570D20F41; Mon, 13 Jun 2011 16:28:06 +0100 (BST)
From: y@tim.rpsys.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:54 +0100
Message-Id: <6f4e9fce810d403af2352e8cf2946ea1c1140aa3.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
References: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
References: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Mon, 13 Jun 2011 17:46:11 +0200
Subject: [PATCH 08/11] sysvinit-inittab: Inhibit compiler/libc dependencies as this is just a configuration file
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
X-List-Received-Date: Mon, 13 Jun 2011 15:31:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 9f34b27..ba60c74 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -9,6 +9,8 @@ SRC_URI = "file://COPYING \
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
+INHIBIT_DEFAULT_DEPS = "1"
+
 do_configure() {
 	cp ${WORKDIR}/COPYING ${S}/
 }
-- 
1.7.4.1



