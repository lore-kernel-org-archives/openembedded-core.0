Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMIrS-0001CW-9h for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 13:54:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMIoh-0004Xu-4c
	for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 13:51:59 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.linuxtogo.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 12:51:58 +0100
Message-ID: <1305633118.2429.188.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] image-prelink: remove hardcoded reference to /usr/sbin
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
X-List-Received-Date: Tue, 17 May 2011 11:54:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

---
 meta/classes/image-prelink.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index ee0951c..cefd983 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -21,7 +21,7 @@ prelink_image () {
 	fi
 
 	# prelink!
-	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
+	${STAGING_DIR_NATIVE}${sbindir}/prelink --root ${IMAGE_ROOTFS} -amR
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" == "true" ]; then
-- 
1.7.1





