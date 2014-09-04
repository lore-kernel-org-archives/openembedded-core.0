Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id F3B97713B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:22 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hz20so11058596lab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KWpNu4pade139nNyAwQfwgHkhMOFmUdX0in0rjWrZkY=;
	b=SA/xTM6WGdTsghJbHGCvmcG9LwT9lw3W2BW+VNioNIwC8Kq4MzD6Rd70uns7hS/Xz7
	58bCuiUWl8wGrkYIVE0M6NK0/+pYol3lsSLAi1KAf09fquUhBMTh/aiSjRyi+nI3qYPC
	jG/yC6hOapdIOlO/yJeEBwfYJA+MMHrJdekddANXqwCzihPuuxzg57O5xxjBnidDRg+d
	OC0eFH+EG1TN1mnLfR51zMy1LQw+yLNcaaW0Kidz53bzY1aPeqUgF4/nfUTFME4Xz7wA
	EWBXNkHhYF4oifNZLlrstpSYrqbs2LX0kr1F+1nJT0StCr7rVRRRLCCP741Xy1SEAAe0
	4lOQ==
X-Received: by 10.112.235.199 with SMTP id uo7mr898538lbc.50.1409791703426;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id xo1sm918325lac.13.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:21 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDo-0008VQ-ES; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:15 +0300
Message-Id: <5f69db7a3b75248ce543cb11f1fabe57b491a340.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
References: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 4/6] pixman: update to 0.32.6
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:25 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
index 51cca5d..f9ad814 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
@@ -31,7 +31,7 @@ SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
 "
 
-SRC_URI[md5sum] = "cdb566504fe9daf6728c7b03cc7ea228"
-SRC_URI[sha256sum] = "ae2bd664057e330d41b40336ed296d3512318ce7f2401cc42601f2613d371e4c"
+SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
+SRC_URI[sha256sum] = "201fc0d7d6bc0017496f2bd27b3ca14224aea0df6b624c5ee2dc0307a4ff14a4"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.1.0


