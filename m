Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW97D-00032e-Ey
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:47 +0200
Received: by rex (Postfix, from userid 1000)
	id 947F820C14; Mon, 13 Jun 2011 16:28:05 +0100 (BST)
From: y@tim.rpsys.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:48 +0100
Message-Id: <748e5f9c4e8fbb93593b6270739ff4b8bbbd5fdc.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
References: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
References: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Mon, 13 Jun 2011 17:46:11 +0200
Subject: [PATCH 02/11] formfactor: Inhibit toolchain dependencies as its just config files
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
X-List-Received-Date: Mon, 13 Jun 2011 15:31:47 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/formfactor/formfactor_0.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 28624a6..abf20e0 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+INHIBIT_DEFAULT_DEPS = "1"
 
 do_install() {
 	# Only install file if it has a contents
-- 
1.7.4.1



