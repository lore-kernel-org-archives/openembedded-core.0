Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qz8so-0004W6-18
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 17:08:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qz8o4-0006d9-Nd
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 17:03:52 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2011 16:03:52 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314889432.19905.189.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] useradd.bbclass: remove hardcoded reference to /usr/bin
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
X-List-Received-Date: Thu, 01 Sep 2011 15:08:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise the class doesn't work if ${bindir} is set to a different value;
likewise for /var vs ${localstatedir}.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/useradd.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ba8d8dc..5f5b68d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -74,8 +74,8 @@ fi
 }
 
 useradd_sysroot () {
-	export PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
-	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
+	export PSEUDO="${STAGING_DIR_NATIVE}${bindir}/pseudo"
+	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}${localstatedir}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
 	# before do_install
-- 
1.7.4.1





