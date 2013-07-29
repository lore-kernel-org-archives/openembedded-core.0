Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DBCDB6B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:58:24 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id jh10so5906660pab.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5uYHl+dXs04nMV33WeN+5EMF3Wh2b/yNniQbfEq+GUI=;
	b=iC0VLIsDRqETHMNgYuZSseOEMuOrZOx0ZnsVlJaAU15bHVFlBdBXJXx2Ijl8XkxzXD
	yX5Nqwna6wfKnx7MD6y4ztss5SJXk6wOoULEtuuR6qnTj6IjwcVG3604MEjrSJpUTTRr
	pO7HFmrWzWa0FUtm10zO4lSA5z7sdwjzI1NEeq7D+rOGu3OMccRbxI1e3JJDvgmCZ3au
	GyH8MbVL+ndpu994s8D4gnjS+Emc56VQGuiZdfeDPZXylaOxlihXmOtBk9WiB+0rye9+
	6dT8wGv8Tomyi5s7xHWudmzzvKxc0mxTJ9yEpnPq2sFOsT0VjUZh7Nw/qgtvDqCesXTR
	5IWw==
X-Received: by 10.68.200.104 with SMTP id jr8mr68556167pbc.43.1375106305719;
	Mon, 29 Jul 2013 06:58:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ue9sm21035782pab.7.2013.07.29.06.58.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 06:58:25 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 00:15:14 +1000
Message-Id: <1375107314-30636-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] syslinux: update to 4.07
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
X-List-Received-Date: Mon, 29 Jul 2013 13:58:25 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/syslinux/{syslinux_4.06.bb => syslinux_4.07.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/syslinux/{syslinux_4.06.bb => syslinux_4.07.bb} (93%)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.06.bb b/meta/recipes-devtools/syslinux/syslinux_4.07.bb
similarity index 93%
rename from meta/recipes-devtools/syslinux/syslinux_4.06.bb
rename to meta/recipes-devtools/syslinux/syslinux_4.07.bb
index c2e69f6..bba5dda 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.06.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.07.bb
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "0384ef35b724615074e77b1fc89d5b47"
-SRC_URI[sha256sum] = "dbb7774e36c4596de68fa5e6788ad57809ab31a1760e5d7626e697766d30ad26"
+SRC_URI[md5sum] = "9ff6e1b94efab931fb4717b600d88779"
+SRC_URI[sha256sum] = "1240a4e4219b518bdaef78931b6e901befeff35e6894ac6db785115848a7a05a"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
-- 
1.8.3.4


