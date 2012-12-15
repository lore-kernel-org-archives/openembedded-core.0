Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjpl3-0001f9-HM
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 12:18:20 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1978709bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 03:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BqXgCgdb85WP6l9mTG1RKEryN6/YXuR7qOVMVfTeU4c=;
	b=WoJanaZm3gpqPOOakEhfdgsfa7GsP72r7XxCWfEGec6k17SaMsxupVdxjx0ruiTdK0
	j9FmxD34wP0LZWd/QQoEdP1fM/KTvIMF1XcJodxSHwiMEmmykKUfv75OLxlc7SSVnhbB
	wA86L+N0R3fKrZtXEKUhEe4WmalUztIpnDvaCOBMqaqSWJVVyflmIZrM4CJF99Vv8bHb
	UwNsPv0UGSBXsRK8DWmIBzIhBUR5BGmyg8OGiNiMSCOsK3tE++ankBvn2Yw0vxHZta8d
	Jqw08y4wyiea14xEN6wyiKsts1TEeqXYKz3zwB/E5nfRq4y/8Urc7YA5lQfn7ONNAdH9
	7AzQ==
Received: by 10.204.11.78 with SMTP id s14mr3843047bks.118.1355569420080;
	Sat, 15 Dec 2012 03:03:40 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id e22sm6171674bke.14.2012.12.15.03.03.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 03:03:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjpWr-0001Ac-C9; Sat, 15 Dec 2012 13:03:37 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 13:03:36 +0200
Message-Id: <1355569416-4468-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pixman: update to upstream version 0.28.2
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
X-List-Received-Date: Sat, 15 Dec 2012 11:18:21 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xorg-lib/{pixman_0.28.0.bb => pixman_0.28.2.bb}               |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.28.0.bb => pixman_0.28.2.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
index a3012f9..4ec0490 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
@@ -32,5 +32,6 @@ SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
             file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
 "
-SRC_URI[md5sum] = "703c3f62437b161c610056e076560570"
-SRC_URI[sha256sum] = "6056f9aa0e0578a0492e34fc2ce6dd7bfb181090ed687993c03b969c8cec4828"
+
+SRC_URI[md5sum] = "f6e3294c4edb7b6bca8459e604286348"
+SRC_URI[sha256sum] = "583686afbfa5a1dfc40a21e888a3eacf31fe0e02469d20b821b5d8f719165a51"
-- 
1.7.10.4



