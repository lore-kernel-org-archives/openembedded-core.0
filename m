Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCBdz-00038j-79
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:43:23 +0200
Received: by yxj17 with SMTP id 17so3748459yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 07:37:44 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr11048376far.12.1317998264533;
	Fri, 07 Oct 2011 07:37:44 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u6sm12987149fan.17.2011.10.07.07.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 07:37:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 16:37:39 +0200
Message-Id: <1317998259-4330-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gnutls: disable p11-kit
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
X-List-Received-Date: Fri, 07 Oct 2011 14:43:23 -0000

| checking for P11_KIT... configure: error: Package requirements (p11-kit-1 >= 0.2) were not met:
|
| No package 'p11-kit-1' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables P11_KIT_CFLAGS
| and P11_KIT_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| + bbfatal 'oe_runconf failed'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-support/gnutls/gnutls.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 9257880..67e44ba 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -25,6 +25,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-lzo --disable-guile \
+              --without-p11-kit \
               "
 do_configure_prepend() {
 	for dir in . lib libextra; do
-- 
1.6.6.1



