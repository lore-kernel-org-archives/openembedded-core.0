Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DI-0006nV-TO
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:13 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so13612353lab.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OjiHjAvua7BRXqLFNspUurf0FD7ZILSzs0Zw9B2PupU=;
	b=vvT8UEm01dTsKb0XzP2CzzRqYAo18sZZ5TUYBiqZzksQp0zTU2zk6Gs6F0Do86mRNp
	Nm4WRBxtfedeQfFNkSMKggBwVLKV1owKXSBqq763QWdq7Zb853dsmN47K5XeGrNmbOsL
	gM/N/0IpbUXF2ebXwiefmPOwCU4lxr0Jy2vaBt4LD+21JcRC81mIeuxD5vdjwOd420la
	KM2IFPnuw2JQjIjQ3663bfSaamZz2kQzhgvar9/6izuR8jSBvVWlKZwfe0QbDr0CeKVA
	K0/mG/lwvWH3vf2FdhAQ2X6MJOP1rIW3xt43IUhEweCvGUasdzLQ96KoVF/gd3SWyTSA
	JCWw==
X-Received: by 10.152.148.129 with SMTP id ts1mr56597915lab.19.1357516204510; 
	Sun, 06 Jan 2013 15:50:04 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ne2sm21998128lab.10.2013.01.06.15.50.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyY-0001QO-9u; Mon, 07 Jan 2013 01:49:58 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:41 +0200
Message-Id: <1357516181-5358-16-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-15-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-9-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-10-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-11-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-12-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-13-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-14-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-15-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 15/15] flac: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:13 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../flac/flac-1.2.1/obsolete_automake_macros.patch       |   14 ++++++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb               |    6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch b/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
new file mode 100644
index 0000000..6eea418
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Fixed (https://sourceforge.net/p/flac/support-requests/146/)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd flac-1.2.1/configure.in flac-1.2.1/configure.in
+--- flac-1.2.1/configure.in	2007-09-13 18:48:42.000000000 +0300
++++ flac-1.2.1/configure.in	2013-01-03 08:20:07.454704587 +0200
+@@ -44,7 +44,7 @@
+ AC_CHECK_SIZEOF(void*,0)
+
+ #@@@ new name is AC_CONFIG_HEADERS
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_C_BIGENDIAN
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 903de6d..7fd7a03 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -14,14 +14,16 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
            file://disable-xmms-plugin.patch \
            file://flac-gcc43-fixes.patch \
            file://xmms.m4 \
            file://0001-No-AltiVec-on-SPE.patch \
-           file://asm-pic.patch"
+           file://asm-pic.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI[md5sum] = "153c8b15a54da428d1f0fadc756c22c7"
 SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf"
-- 
1.7.10.4



