Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id A4E3D607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:34:12 +0000 (UTC)
Received: from [192.168.2.31] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YvLv2-0003rz-KA; Thu, 21 May 2015 10:33:32 +0200
Message-ID: <555D9883.5090305@kernelconcepts.de>
Date: Thu, 21 May 2015 10:34:11 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] [RESEND] gtk-engines: Make gtk-engines-dev installable by dropping dependency to not generated gtk-engines package.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2015 08:34:14 -0000
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit

---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 33b6afe..036aa27 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -29,6 +29,8 @@ FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
  CFLAGS_prepend = "-DHAVE_ANIMATION "
 +RDEPENDS_${PN}-dev = ""
+
 inherit gnomebase
  python populate_packages_prepend() {
-- 
2.1.4



