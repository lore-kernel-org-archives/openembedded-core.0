Received: from mail-qe0-f54.google.com ([209.85.128.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1UF6QM-0005us-Bc
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 18:22:13 +0100
Received: by mail-qe0-f54.google.com with SMTP id i11so2418123qej.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 10:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=/rLpJhUz1uKBSg9xNyuDOJyASA/tCCzR5joJ0gSAFZ8=;
	b=LowtfOMVtafyaXPkuGHLOIhGHTqbkvIAfpQLeCX1MGCs6Cfd6I5+Z2ESJxgahmWZzX
	C41nl7S0T3XJMHV6+xoS2k5v3R09v3OOJViw5uARvE+l3ZUfh95AKT5UVR5Y/25whzYb
	t5vbb0Zpb+VUtuqY6QrH9iu+PPDSm84ymt1ADw/83oX/DnYUNQVp4KLA4vjLeBpU8Gbn
	fImRhczZnyXDF3nHSGpp19+qL/sO15y6Mgq0nr1bFdwRP/iWEzsqvneGfxIGz9+kNWC8
	Otwiz5bt1ZliT/YvxiHU215uLVtCqdvAdmjAecxg8j8y5y33Z0T6OwP3lQcEUq9Lxepq
	LMfw==
X-Received: by 10.224.209.7 with SMTP id ge7mr18189292qab.10.1363021531848;
	Mon, 11 Mar 2013 10:05:31 -0700 (PDT)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id q6sm25596342qeu.1.2013.03.11.10.05.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 10:05:31 -0700 (PDT)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:05:22 -0400
Message-Id: <1363021522-14994-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [meta-oe][PATCH] gst-plugins-gl: allow empty packages
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
X-List-Received-Date: Mon, 11 Mar 2013 17:22:13 -0000

The patch to Poky (git://git.yoctoproject.org/poky) commit
bd73fa69f532ca3d81ec2452a79e7a333b3543c2 titled: "recipes: Fix
ALLOW_EMPTY with no package specified" breaks this recipe. This patch
specifies the allowed empty packages.

Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
---
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index ffda977..a6c74fb 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -17,3 +17,7 @@ inherit gettext gconf
 # way for machines to specify their preferred GL flavour this can be
 # automatically adapted.
 EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-apps = "1"
+ALLOW_EMPTY_${PN}-glib = "1"
-- 
1.7.9.5



