Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAMcS-0000gW-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:34:32 +0100
Received: by wera1 with SMTP id a1so991151wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pdC6CDlGd1XE8XUYRI1uVeytFhIhecsbNNKu2GMPNZ0=;
	b=09EpEU8lJ4HSK4sHTy5UAzDhl+6YKUtOX44TdbLwJ2G1iM/eZp0Xagz55+iOE4dHZ3
	mSg6p81Ajl8ARiohT0RX/YGhiwnZ9zJfVrgzLmv0/62SPcGSyj4fxVxrRHgupuOG9a/q
	fPDBePycQ0pCV3CelcCM01DJmpaPZq4G8tKomZBg4/cjnGRUtIYXMA9SsDLOfqHiM3Wu
	Vt7q3nbaIc23/4SdXuq8GmeLORmLajaIoMU427/+2kKnffYmyv+0zaG/aSO440cu3NMm
	c+hCbPTDfvpGvNu//dt5MQIIavNH5hKE8GUxJp6VGV/lFgUkqwv+rJDEcrs6d5c9CTiz
	W6pw==
Received: by 10.180.101.230 with SMTP id fj6mr38908720wib.13.1332339938922;
	Wed, 21 Mar 2012 07:25:38 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id fl2sm8122399wib.4.2012.03.21.07.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 07:25:38 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 15:25:26 +0100
Message-Id: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 14:34:32 -0000

* This move will allow the testing of meta-kde for users without meta-openembedded.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/recipes-devtools/giflib/giflib_4.1.6.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/giflib/giflib_4.1.6.bb

diff --git a/meta/recipes-devtools/giflib/giflib_4.1.6.bb b/meta/recipes-devtools/giflib/giflib_4.1.6.bb
new file mode 100644
index 0000000..bd7b495
--- /dev/null
+++ b/meta/recipes-devtools/giflib/giflib_4.1.6.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "shared library for GIF images"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
+PR = "r2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
+
+inherit autotools
+
+DEPENDS = "libsm"
+
+PACKAGES += "${PN}-utils"
+FILES_${PN} = "${libdir}/libgif.so.*"
+FILES_${PN}-utils = "${bindir}"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
+SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
-- 
1.7.5.4



