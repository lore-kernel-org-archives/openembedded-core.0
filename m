Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQwBx-0001an-8W
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:19:57 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3964882wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=dhxzEce3YHsjf3foI+GfjWKI5VeE5/I+Rr3LJPeoffA=;
	b=lXT75tgPrq8WzW7hRuqQkCyzvfPZLpDKbjFk0qLldJgeszqsnRUOCVWG1Yr66gSisI
	mzkCHlWzztWNbWJqSAubvTG32j30W5i3eU8tD3HCdaOklIw3bEN/AEOkKxKfxJiAZdA2
	6k9yQrv1aYIXm2z1bwRBniRVM+rIh9F7vJ0ufv7+y6lXs3fDUmn9mXEyd1YAA9Hks84c
	B763CClHpyrPxS0wgr8toK21UBgAa/RQcTYlJheBFra3PMN9bZAH8Rjg8mK3Jh3GmD9E
	mTzx+udUL8pndVUx9HWwf5t4Vii/uRWjCnKDnmIdpR6+aSVpqaYOi7g9W5ydbig7OBFj
	vJXA==
Received: by 10.216.131.131 with SMTP id m3mr8043167wei.85.1351065990434;
	Wed, 24 Oct 2012 01:06:30 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm3534677wid.7.2012.10.24.01.06.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:06:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:05:15 +0200
Message-Id: <1351065917-14779-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V3 2/4] gnome-icon-theme: remove unused configure variable
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
X-List-Received-Date: Wed, 24 Oct 2012 08:19:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure: WARNING: unrecognized options: --disable-silent-rules, --with-libtool-sysroot, --disable-hicolor-check

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 2eb5fda..ab541ed 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
 SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
 
-EXTRA_OECONF = "--disable-hicolor-check"
-EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
+EXTRA_OECONF = "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
 
 inherit autotools perlnative
-- 
1.7.6.5



