Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyx-0003op-C4
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:58:03 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=lmdeFyBk+rFORmLxx6nCl6WxTNXsnYAlR8Jd7VMo53o=;
	b=hDZdAGXYShlNPo86vObI67/bsY6G+4mqmSWgwC+lR5o9oIUv8qAPKe3KyWllhSpIek
	0s023NiF54G4AFpY2IHuik3o96pnk1WnRTetudtXYd+LFlprERUKIyibOL0ijS6ZitLn
	9YASmL+RaK58MYGlFwdf8I0oAXuOkfZu4vgIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=m7DbuS0kRQJYJY+T9IbFxy0c+bzAmmiti1n3RQslUbnEfTRBqK67L0am3oJFSX8eNj
	Ut7Ymfg6Bhyw5lSpTKYUAQV0y8qIScFn+qyH1C998tyXtaR1vOWtYkLmc21LIGh4PrHs
	bbIxBhD7cAhefP41MTjDVaVaHmC6b+Q3OqjX4=
Received: by 10.68.23.65 with SMTP id k1mr7207327pbf.414.1303757736717;
	Mon, 25 Apr 2011 11:55:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p2sm4060876pbq.6.2011.04.25.11.55.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:30 -0700
Message-Id: <cdfaebc1801cd2f95f9f41e27da8278600f5c2ac.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 14/17] xorg-lib: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Mon, 25 Apr 2011 18:58:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb   |    4 +++-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb |    4 ++--
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb   |    3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
index 79078ef..793008b 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
@@ -6,10 +6,12 @@ both client-side and server-side."
 
 require xorg-lib-common.inc
 
+inherit gettext
+
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 
-DEPENDS += " xproto gettext"
+DEPENDS += " xproto"
 PROVIDES = "xau"
 
 PR = "r0"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
index d897dab..483dce3 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
@@ -8,6 +8,8 @@ autonomous display."
 
 require xorg-lib-common.inc
 
+inherit gettext
+
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d559fb26e129626022e052a5e6e0e123"
 
@@ -17,8 +19,6 @@ PROVIDES = "xdmcp"
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
index 335f020..19abe5a 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
@@ -16,7 +16,8 @@ PE = "1"
 PR = "r0"
 
 RDEPENDS_${PN}-dev = ""
-DEPENDS += "gettext"
+
+inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.4.1



