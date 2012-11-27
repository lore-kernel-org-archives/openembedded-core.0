Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdAX2-0003it-Fv
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 03:04:16 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so6027656lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 17:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gPzBbWsejoYpZKSMQB6COZFQNDg+TVD9cRvDSZCRpCc=;
	b=XCoOM0Ra/OBd2DXmaElSbcS4CYUE9E1A2iIzbQy304PAmJfL8lIWviDqbKKrcCyhd3
	XtLz/LgC0PLR9mpABhs8vHqw6i67ESee6LUEbVh1BC6JsKqbWCn6rItq8V/Zs6v8PVlA
	54agzuhCRCJtnNkPq2yCHFBgnfaiIM3iEdpnPPeHfLR/LmqKhd3sAdz3SELEvJRtoiq6
	KgzkMHoQzVfcqZ6qvwxBhdBKB/n173nxmXfeIS/jBtmCSE4WM6ZrmGJXzq6CI4rf/7JE
	BSx40Cn3gcPCllXypClV2VMNeZacS7goSlvVzAa5KarZ3+sezrIoKeKkVlhp3AOXGsYZ
	qyDQ==
Received: by 10.112.29.231 with SMTP id n7mr5998626lbh.107.1353981003904;
	Mon, 26 Nov 2012 17:50:03 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id b4sm6375880lbi.0.2012.11.26.17.50.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 17:50:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdAJE-0004tA-Qi; Tue, 27 Nov 2012 03:50:00 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 03:49:45 +0200
Message-Id: <1353980985-18762-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ccache: update to upstream version 3.1.8
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
X-List-Received-Date: Tue, 27 Nov 2012 02:04:16 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc      |    2 +-
 meta/recipes-devtools/ccache/ccache_3.1.7.bb |    8 --------
 meta/recipes-devtools/ccache/ccache_3.1.8.bb |    8 ++++++++
 3 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.7.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.8.bb

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index e9f7344..29ac409 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 LICENSE = "GPLv3+"
 
-SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.gz"
+SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.xz"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.7.bb b/meta/recipes-devtools/ccache/ccache_3.1.7.bb
deleted file mode 100644
index 40a7056..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.1.7.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ccache.inc
-
-PR = "r0"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
-
-SRC_URI[md5sum] = "bf49574730fabd666fc7ec3f8b203f41"
-SRC_URI[sha256sum] = "278f4d1d38fc530221c7ce73606f34bc3a5df7e269930e4fb1d9ac44f4345d11"
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.8.bb b/meta/recipes-devtools/ccache/ccache_3.1.8.bb
new file mode 100644
index 0000000..b445f0f
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.1.8.bb
@@ -0,0 +1,8 @@
+require ccache.inc
+
+PR = "r0"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
+
+SRC_URI[md5sum] = "ffa001305f31f44a3834be7c6c5102c5"
+SRC_URI[sha256sum] = "9c4134a88d2566ba41a070a6cedc53fa92e1008f40c116c61e73dde16453d63e"
-- 
1.7.10.4



