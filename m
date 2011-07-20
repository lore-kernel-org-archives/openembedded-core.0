Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje2y-000446-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:12 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=axpIHkBixS4Ht663uLKf1l7NMJSV9AR6zIZaD37Hfe8=;
	b=AmgjgPNuy1MkPnsRp9981s2gP50JHTKX/8HJaal12LRq4wsJOZD/8kxvxAQCPeSO5X
	UojavuF9uQgdNtFlSwoDeoYoZpdWxzMqBb2y6erMLj5Ibt+87ialQQK96RpRHOuDjZUf
	7xSVRqJgM41ODQwruqqI681sPYfez498SyJZQ=
Received: by 10.223.22.148 with SMTP id n20mr2953124fab.29.1311196028106;
	Wed, 20 Jul 2011 14:07:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e10sm936518fak.18.2011.07.20.14.07.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:07:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:22 +0200
Message-Id: <644356962890630dc522d66d5143afd13dd7fde2.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/10] shared-mime-info: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:12 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 64eef9d..8b10535 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext perlnative
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
-- 
1.7.6



