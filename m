Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF127297B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:09 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so5201544pad.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=t0/eaeUqzo5p3ROImIoASyWfIKUW/Y1KlSYI86S2baw=;
	b=ea//L5ksiIB1DGuzy1ONh5XUt+IyFUH8PeV3hKK8l0vzJ1wknP/76NdwZDlTZIQE9G
	T3t5aMdLymbSd7lwcDznBEA7sXUciD0ktiMASMoGLp0P4ZBeNqLH4lrey28T0vvw69rX
	1jgLnkfas/BFsEhTl8QS3MQQzJPM5wI3yUdcZ6MRapjJXO81PofCF89NHZzqYE9dyKLQ
	snmg7reffw5z8C2IgeybeJtGdsjIKwWS1q67z90V4ZQWZZWXiOqqwiKi73C6KngpopKf
	o23ByTG+YdQ8nCCwxODdFw5rIoYmUp1sK5SUeOUyanYBtE603iMEKZoG9usXX+SYKBnj
	3+qA==
X-Received: by 10.68.197.8 with SMTP id iq8mr5998129pbc.66.1419224110123;
	Sun, 21 Dec 2014 20:55:10 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:54:57 -0800
Message-Id: <1419224101-24900-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH 1/5] xclock: move from meta-oe to core.
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:14 -0000

core "xinit" package has a dependency to xclock so
move it from meta-oe to core.

core image "core-image-x11" includes xinit.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/xclock_1.0.5.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-app/xclock_1.0.5.bb

diff --git a/meta/recipes-graphics/xorg-app/xclock_1.0.5.bb b/meta/recipes-graphics/xorg-app/xclock_1.0.5.bb
new file mode 100644
index 0000000..9573761
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xclock_1.0.5.bb
@@ -0,0 +1,15 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "analog / digital clock for X"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
+
+DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[md5sum] = "eaf124bbc9d13e1a12a29faaa2ed3612"
+SRC_URI[sha256sum] = "53a9169e24f3814fbfcfee3ca0b98637840a3156ed7c7e36ae03940fabae4c9a"
+
+inherit distro_features_check
-- 
1.9.1


