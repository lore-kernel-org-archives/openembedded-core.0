Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW97F-00032w-VH
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:50 +0200
Received: by rex (Postfix, from userid 1000)
	id E8D66218A4; Mon, 13 Jun 2011 16:28:06 +0100 (BST)
From: y@tim.rpsys.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:55 +0100
Message-Id: <1b34b170620bb444bb2289950b6ed3ed2e909177.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
References: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
References: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Mon, 13 Jun 2011 17:46:11 +0200
Subject: [PATCH 09/11] initrdscripts: Inhibit compiler/libc dependencies as this is just a configuration file
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
 .../initrdscripts/initramfs-live-install_1.0.bb    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index c92ee31..c792fe0 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -15,6 +15,7 @@ do_install() {
 # simple script, reality is that it is Host specific based
 # on the COMPATIBLE_HOST below, which needs to take precedence
 #inherit allarch
+INHIBIT_DEFAULT_DEPS = "1"
 
 FILES_${PN} = " /install.sh "
 
-- 
1.7.4.1



