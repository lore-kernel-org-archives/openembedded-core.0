Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qh2uq-0003Gc-RH
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 19:08:04 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qh2r2-0004iI-KL
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 19:04:08 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 18:04:07 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310576648.2378.34.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] busybox: respect ${LDFLAGS}
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
X-List-Received-Date: Wed, 13 Jul 2011 17:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids a GNU_HASH QA warning.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/busybox/busybox.inc       |    2 ++
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c51cf6a..5eba0ca 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 SECTION = "base"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
+export EXTRA_LDFLAGS = "${LDFLAGS}"
+
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index 9d3d5b1..d18af6f 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.4.1





