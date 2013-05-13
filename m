Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubj2x-00089I-Ca
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 05:03:36 +0200
Received: by mail-pd0-f177.google.com with SMTP id g10so4017660pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FKt4jfK2Ycw3PxOZuhBLbbzs1ti2Fk+3lr64KkoKm4I=;
	b=go0mfGLwAewkoUdo4TWaeYDy4vKwgPp2iK0l3wbjKlAIP1frfeczQgxoXRHE0309QJ
	6qhODq4xBYtie2+cXc8eqU3Dr85Kbxg2PepJ1FwpqWUKDsA9TKVf9b1q2/ejybU8LeDu
	ewSuq4Pw8b+qJbdURGxEn5i4b5uaJv6iraCcmfQOYjp37apA1CXTo9/32UfZ2x0xGxmF
	qJXbMba8fNIM99u6OakijlvXuD/Ib+k4+Xjao5050TvLaNF1mcv9PYSqDVVgrqVzeqAW
	gojX1Drd9NoTlS2kOW04cz9cTu3xAw9VF7MYHd9RlGJ/skvfMmngLDNh/Es8vG8r3TzT
	c8lA==
X-Received: by 10.66.88.38 with SMTP id bd6mr28459819pab.184.1368413117541;
	Sun, 12 May 2013 19:45:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	gc5sm12031541pbb.19.2013.05.12.19.45.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:45:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:58:04 +1000
Message-Id: <1368413884-7667-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1368413884-7667-1-git-send-email-net147@gmail.com>
References: <1368413884-7667-1-git-send-email-net147@gmail.com>
Subject: [PATCH v2 1/1] xf86-video-modesetting: upgrade to 0.7.0
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
X-List-Received-Date: Mon, 13 May 2013 03:03:41 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb | 8 --------
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
deleted file mode 100644
index 02f4667..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
-
-DESCRIPTION = "X.Org X server -- modesetting display driver"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "d8a771d5d2d75ea9d234c6928153c08b"
-SRC_URI[sha256sum] = "852f9ddb213913f75e1e65ad7ce9c6b5bc7f43a93d8087b6e59666ea4eb3d0d6"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
new file mode 100644
index 0000000..e45703f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
+
+DESCRIPTION = "X.Org X server -- modesetting display driver"
+
+SRC_URI[md5sum] = "38e64eb09cef9bdf1de400bbe9818321"
+SRC_URI[sha256sum] = "2bc55f776eaee7b4e13df13238d36c4facf1cdca095a11519baf2376f5c996ac"
-- 
1.8.2.3



