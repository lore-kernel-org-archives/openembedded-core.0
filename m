Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UbieV-000497-E1
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 04:38:18 +0200
Received: by mail-pd0-f177.google.com with SMTP id g10so4064698pdj.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TavgdWHN4EJcd4oxACPV2xB1DXyQ+DjOm3w0M/prExg=;
	b=x1RlE9ijowoEZys7dtpsSoEAOu+tzAFeTK9zuIP4Ji/x2TJOkkjEE2gvCI3UmyfkBU
	mWEpNv0I9afHxhIwLXOWcTfhJ1WHGevUSBfw5m1iNDDQguXY9cMoWxZdgigeHet73fZm
	UEqrtc11mw+u2NBh/yOi37nFrSregyi4qakw7gZrCN2PzIUOgnvwowGHAT4UBCbd7DBj
	bHjv+wWlBtRpkMNw43lV1wfkA3w87FGaxhmIR7xgaZ8nUfyxtKHgge4d2l7BTF7/bqd/
	4PYiIzFVkiOqWLZD48Z1CoPnEGHJBnmC4KdZNOVKteUJVQ1IuxPBW1Of8hosf1E0BWOV
	PCQw==
X-Received: by 10.66.157.67 with SMTP id wk3mr10749691pab.88.1368411605761;
	Sun, 12 May 2013 19:20:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm11921016pbr.45.2013.05.12.19.20.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:20:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:32:49 +1000
Message-Id: <1368412369-6445-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1368412369-6445-1-git-send-email-net147@gmail.com>
References: <1368412369-6445-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/1] xf86-video-modesetting: upgrade to 0.7.0
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
X-List-Received-Date: Mon, 13 May 2013 02:38:32 -0000

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



