Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje3M-000446-2O
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:36 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Y41RxFYCLr3i56r+WDU+0leUAhh+866r+hR9TT9jOTA=;
	b=kpzkvC6gfAYmdQ9BII8rfN/jD4nAOCjJQGAY/Z3kyvMSbZ5lh/iZrBvtiJL5NSkGHP
	lBwTXxLWmbsoU+SSFOWV7DcWV6FvvFi+U5/FMk0zhNFudDFcLxM5mNzFylf0mPa8IP3/
	3ecSK0eSC6CBeXSLjG7q58l8Vo+bwcbbnCYzw=
Received: by 10.223.15.141 with SMTP id k13mr3385923faa.118.1311196051731;
	Wed, 20 Jul 2011 14:07:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n27sm938996faa.4.2011.07.20.14.07.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:07:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:25 +0200
Message-Id: <0154fb9a6780bf0a0c121ab2be9f444202667e8f.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/10] vte: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:36 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/vte/vte.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 6138f8c..1ff0ba0 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1+"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome
+inherit gnome perlnative
 
 EXTRA_OECONF = "--disable-gtk-doc --disable-python"
 
-- 
1.7.6



