Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TN32O-0005mS-W3
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Oct 2012 16:50:01 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so3285584pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2012 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=2yq86hc0Ueh9VfEifn4fi0Rm0L3Zz4C7y+XJngfty4U=;
	b=eFhXebTew49vXbPVjPjeP8wc2gJAseBYkEVx0hm1hrzNwaea6EVhx+Oi5sna/v/2Q7
	GPmn2irm6GBCoeomyF31rpv6A878Rbfnsai0plVpTRGjdwYmZDn7AFRjIfjpj4Xqdxiv
	B+4dodGLuhpvGGLGXZz2KtnSGzX1MJMmnr9CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2yq86hc0Ueh9VfEifn4fi0Rm0L3Zz4C7y+XJngfty4U=;
	b=LxMVLHWnhXd/oC8UHJ1w0ZXkAgUR2ran6gyljRQ2KFXf8OP+ZOUr6t4FKYSTRDSnDq
	ZXg3AoES1a1W2w77uVYsvnVqkAIFEcq85oEFbq5Jghm3dkbJS15u4vbs8fj1myMZzvMb
	MVxnIk/5M5QGy1vQO+ZTuD/Tx7VcGU35tCRt9byscNPBIXUgWFnXGUm8By1EGjzoMYwv
	hbVt6AhWygax8QZ/rYV7YjptXVELk8xv8Ojfl+Q7nMT06RfWCUvrLGEL0zUMbfMiPhuM
	8JuxqV83YFDhi9e3KgsgqkkOhNYCf1k0Bvx9ojkQwu02awHLzhehgxnYHiO4pXRCsdDW
	4EYQ==
Received: by 10.66.79.166 with SMTP id k6mr19447003pax.25.1350139007181;
	Sat, 13 Oct 2012 07:36:47 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o1sm6055792pax.21.2012.10.13.07.36.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Oct 2012 07:36:46 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Oct 2012 07:36:35 -0700
Message-Id: <1350138995-11220-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk+TqqH0WOa7jGpQemhitCRotMoAtIFaRycb4zruvmjwH5COFsiZ66rRgQfdzAYTvgWCTF+
Subject: [PATCH] sato-icon-theme: update mapping program location
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
X-List-Received-Date: Sat, 13 Oct 2012 14:50:01 -0000

When we changed the /usr/libexec default to be
/usr/lib/<pn>, the icon name mapping needed to
be updated also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 0bd4814..55cbf40 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -12,7 +12,7 @@ inherit autotools pkgconfig allarch gtk-icon-cache
 
 FILES_${PN} += "${datadir}"
 
-EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
+EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-name-mapping"
 
 # Explictly setting "Sato" as the default icon theme to avoid flickering from
 # the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 6405359..cd34cac 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
-- 
1.7.9.5



