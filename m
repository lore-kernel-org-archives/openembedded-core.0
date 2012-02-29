Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1S2qaV-0002CZ-TH
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 21:57:27 +0100
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 4395E1D36171;
	Wed, 29 Feb 2012 21:39:13 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 21:33:15 +0100
Message-Id: <1330547595-11631-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.9
MIME-Version: 1.0
Subject: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
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
X-List-Received-Date: Wed, 29 Feb 2012 20:57:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

| ln: failed to create symbolic link `beagleboard/systemd-image-beagleboa=
rd.tar.bz2': File exists
NOTE: package systemd-image-1.0-r0: task do_rootfs: Failed

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 5b48a09..adab573 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -61,7 +61,7 @@ runimagecmd () {
         # And create the symlinks
         if [ -n "${IMAGE_LINK_NAME}" ]; then
             for type in ${subimages}; do
-                ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${I=
MAGE_LINK_NAME}.$type
+                ln -fs ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${=
IMAGE_LINK_NAME}.$type
             done
         fi
 }
--=20
1.7.9



