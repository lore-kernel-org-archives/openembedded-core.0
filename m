Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TaSOt-0003O9-3Y
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 15:32:39 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 60E1ACA8E21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:12:59 +0100 (CET)
Received: from eb-e6520.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 13B954B0112
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:12:54 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 15:12:53 +0100
Message-Id: <1353334373-16509-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] kmod: fix git repo URL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 14:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-kernel/kmod/kmod.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod=
/kmod.inc
index e4b4a98..3cd963f 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe \
                    "
 inherit autotools gtk-doc
=20
-SRC_URI =3D "git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=3Dm=
aster \
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://0001-man-disable-man-page-generation-because-we-don-t-=
hav.patch \
           "
--=20
1.7.7.6



