Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qe7yo-00085M-OL for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:56:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qe7v9-0002lH-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:52:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jul 2011 16:52:18 +0100
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309881139.2410.14.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Tue, 05 Jul 2011 15:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This one evaded the earlier mass removal due to extraneous trailing
whitespace.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../bluez/bluez-dtl1-workaround_1.0.bb             |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez-dtl1-workaround_1.0.bb b/meta/recipes-connectivity/bluez/bluez-dtl1-workaround_1.0.bb
index b6b3d7d..103cfd9 100644
--- a/meta/recipes-connectivity/bluez/bluez-dtl1-workaround_1.0.bb
+++ b/meta/recipes-connectivity/bluez/bluez-dtl1-workaround_1.0.bb
@@ -1,8 +1,7 @@
 DESCRIPTION = "A nasty hack for for dtl1-cs driver to workaround suspend/resume."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-SECTION = "console" 
-PRIORITY = "optional" 
+SECTION = "console"
 PR = "r3"
  
 SRC_URI = "file://02dtl1_cs.sh \
-- 
1.7.2.5





