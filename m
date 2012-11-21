Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TbEyi-0002aG-QM
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 19:24:52 +0100
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DA3FB20349
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 13:01:06 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 21 Nov 2012 13:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:content-type:mime-version; s=smtpout; bh=ubrnOwZpHqxf18LcB/8kJK
	Zqlrk=; b=P6DM21FNDZ91rIyUX7qY9TRlxKD1NhG9xawPaanHzhQeEpp+r0XiVM
	eLuHFJ81CPhzfB2A/Em9RV4aYyoQqvh0ocKgxW5OdLgHMEVHNF41W4F5t0wNULuW
	qpAenFJyOrZnDvRkj9cIAwDBnDbABPM3aJhypwCbOFBCZxhY4Hk7k=
X-Sasl-enc: J3LFU0mk+l9C8uMzxGTiw1S2f/WBRd2Sg4Ks0SroGL9Z 1353520866
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 97A9C482656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 13:01:06 -0500 (EST)
Message-ID: <1353520830.11924.2.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 13:00:30 -0500
X-Mailer: Evolution 3.4.4 (3.4.4-2.fc17) 
Mime-Version: 1.0
Subject: [PATCH] gcc: Add --enable-linker-build-id
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
X-List-Received-Date: Wed, 21 Nov 2012 18:24:53 -0000
X-Groupsio-MsgNum: 31624
Content-Type: multipart/mixed; boundary="=-VJRBd/WDC6jx0XeyKS29"

--=-VJRBd/WDC6jx0XeyKS29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See https://fedoraproject.org/wiki/Releases/FeatureBuildId for the
benefits this brings.  As far as I can tell from searching the
discussion archives, there doesn't appear to be a reason not to enable
this, and the benefits are real.

Both the Red Hat Enterprise Linux 6, all Fedora, and Ubuntu Quantal
GCC builds are configured with this on.  I plan to use it in
gnome-ostree.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



--=-VJRBd/WDC6jx0XeyKS29
Content-Disposition: attachment; filename="0001-gcc-Add-enable-linker-build-id.patch"
Content-Type: text/x-patch; name="0001-gcc-Add-enable-linker-build-id.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 89fefde42161eb17973538c5958967663bd32cd0 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Wed, 21 Nov 2012 12:49:30 -0500
Subject: [PATCH] gcc: Add --enable-linker-build-id

See https://fedoraproject.org/wiki/Releases/FeatureBuildId for the
benefits this brings.  As far as I can tell from searching the
discussion archives, there doesn't appear to be a reason not to enable
this, and the benefits are real.

Both the Red Hat Enterprise Linux 6, all Fedora, and Ubuntu Quantal
GCC builds are configured with this on.  I plan to use it in
gnome-ostree.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 1a3e09b..378caf0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -92,6 +92,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--disable-libmudflap \
 			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
+			--enable-linker-build-id \
 			--with-ppl=no \
 			--with-cloog=no \
 			--enable-checking=release \
-- 
1.7.7.6


--=-VJRBd/WDC6jx0XeyKS29--
