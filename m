Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0Hh-0005vP-MO
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:49 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so279267wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=n75UIR7BhBdf/75kfHljsmL2cZIKDqnthfmF4Dk4zag=;
	b=nBQamF1eJodmOl8/e//iEre6EqlIyNZ/8DvbRpQxeDAbKibV9T36fJrbA1xvNy9AOn
	YnH006GIFG6ZQAfgkqpd9tifDERVgyHssSAaq7v1Lo3zr6HOYKJAEnKkjJ4yf990eIue
	b8hTRuReQwoAHH6sLJwznpHXlPwFw53PHPa7lfkrVGdduGOepB0UaB827ZaT/VyhIjH+
	deTTiHR1wgcOu/OmrlHoJG4QhQ/fkgMVYO3Eh5UWyi9NZhBrgXHoeawc/EoSLjFBjZ05
	PdTsRjMXPHsg1p6Nhx1fUg+QgIT7EVJuGNMY2usIt9GGYphk+vdxdNeYTbrVsnQ5lo7I
	+nsg==
Received: by 10.180.82.164 with SMTP id j4mr4015023wiy.18.1348698481013;
	Wed, 26 Sep 2012 15:28:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm28005633wib.2.2012.09.26.15.27.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:28:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:11 +0200
Message-Id: <3446810f37cfc917d94c08b92d0d13749a17dd7d.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/10] qt4: move patches from files to qt4-4.8.1
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:49 -0000

* faster lookup in FILESPATH as small bonus

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/0004-no-qmake.patch              | 0
 .../recipes-qt/qt4/{files => qt4-4.8.1}/0006-freetype-host-includes.patch | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/0008-qt-lib-infix.patch          | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/0009-support-2bpp.patch          | 0
 .../qt4/{files => qt4-4.8.1}/add_nostrip_for_debug_packages.diff          | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/blacklist-diginotar-certs.diff   | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/compile.test-lflags.patch        | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/configure-paths.patch            | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/fix-config-tests.patch           | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/fix_qkbdtty_qws.patch            | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/qt-config.patch                  | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/qt-dbus-const.patch              | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/qte.sh                           | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/set-OUTPUT_DIR-if-empty.patch    | 0
 meta/recipes-qt/qt4/{files => qt4-4.8.1}/target_qmake.patch               | 0
 15 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/0004-no-qmake.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/0006-freetype-host-includes.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/0008-qt-lib-infix.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/0009-support-2bpp.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/add_nostrip_for_debug_packages.diff (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/blacklist-diginotar-certs.diff (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/compile.test-lflags.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/configure-paths.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/fix-config-tests.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/fix_qkbdtty_qws.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/qt-config.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/qt-dbus-const.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/set-OUTPUT_DIR-if-empty.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.1}/target_qmake.patch (100%)

diff --git a/meta/recipes-qt/qt4/files/0004-no-qmake.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0004-no-qmake.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch
diff --git a/meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0006-freetype-host-includes.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0006-freetype-host-includes.patch
diff --git a/meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch
diff --git a/meta/recipes-qt/qt4/files/0009-support-2bpp.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0009-support-2bpp.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0009-support-2bpp.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0009-support-2bpp.patch
diff --git a/meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff b/meta/recipes-qt/qt4/qt4-4.8.1/add_nostrip_for_debug_packages.diff
similarity index 100%
rename from meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff
rename to meta/recipes-qt/qt4/qt4-4.8.1/add_nostrip_for_debug_packages.diff
diff --git a/meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff b/meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff
similarity index 100%
rename from meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
rename to meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff
diff --git a/meta/recipes-qt/qt4/files/compile.test-lflags.patch b/meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/compile.test-lflags.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch
diff --git a/meta/recipes-qt/qt4/files/configure-paths.patch b/meta/recipes-qt/qt4/qt4-4.8.1/configure-paths.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/configure-paths.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/configure-paths.patch
diff --git a/meta/recipes-qt/qt4/files/fix-config-tests.patch b/meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/fix-config-tests.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch
diff --git a/meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch b/meta/recipes-qt/qt4/qt4-4.8.1/fix_qkbdtty_qws.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/fix_qkbdtty_qws.patch
diff --git a/meta/recipes-qt/qt4/files/qt-config.patch b/meta/recipes-qt/qt4/qt4-4.8.1/qt-config.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/qt-config.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/qt-config.patch
diff --git a/meta/recipes-qt/qt4/files/qt-dbus-const.patch b/meta/recipes-qt/qt4/qt4-4.8.1/qt-dbus-const.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/qt-dbus-const.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/qt-dbus-const.patch
diff --git a/meta/recipes-qt/qt4/files/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
similarity index 100%
rename from meta/recipes-qt/qt4/files/qte.sh
rename to meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
diff --git a/meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.1/set-OUTPUT_DIR-if-empty.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/set-OUTPUT_DIR-if-empty.patch
diff --git a/meta/recipes-qt/qt4/files/target_qmake.patch b/meta/recipes-qt/qt4/qt4-4.8.1/target_qmake.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/target_qmake.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/target_qmake.patch
-- 
1.7.12



