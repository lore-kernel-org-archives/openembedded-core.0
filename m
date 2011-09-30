Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9dVn-0001bl-40
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:52:24 +0200
Received: by fxi1 with SMTP id 1so3081976fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dvVSSC3SxqrgEp1DDQ17MTEnlW46VJ2jZYY8oye9bvQ=;
	b=fIyHwH3eXUlHgOphXXDysSDCc4HR3apouDBxf7ipZ3lJ0sI7jKy9HJvWJ0eTPoDxwu
	W7w+tb98Kx6VJ7KwaGe1wezQUYCxq5jBbHnmpAE7esub207LC/W89NF6I2BuVK9q1cjP
	qIzq/yZ1Y8C/xd1kgmr0mRwEsLbwm1NjWpfhE=
Received: by 10.223.66.88 with SMTP id m24mr1588488fai.68.1317390394939;
	Fri, 30 Sep 2011 06:46:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm6763942fam.22.2011.09.30.06.46.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 06:46:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 15:46:26 +0200
Message-Id: <1317390386-22424-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCHv2] libproxy: upgrade to 0.4.7
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
X-List-Received-Date: Fri, 30 Sep 2011 13:52:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{libproxy_0.4.6.bb => libproxy_0.4.7.bb}       |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libproxy/{libproxy_0.4.6.bb => libproxy_0.4.7.bb} (85%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
similarity index 85%
rename from meta/recipes-support/libproxy/libproxy_0.4.6.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.7.bb
index d907c55..2793b41 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -11,10 +11,8 @@ DEPENDS = "gconf"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
-SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
-
-PR = "r2"
+SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
+SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
 
 inherit cmake pkgconfig
 
-- 
1.7.6.1



