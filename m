Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SObng-0007WL-Pl
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 23:37:00 +0200
Received: by wibhj13 with SMTP id hj13so1937989wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 14:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=h1jRzAwLWSk5O3Vgnlad+eR1XGaoDXBxQiXTn6POeCU=;
	b=cUxzWGNz64Y1lnjiE2mOhlV/5PUo6x3ZfG3UqFtjHBaly6p3NAxWRQrSb0D0klq1zO
	v0SdEj+AYtcioofbZ1nE/Rjd1bN+CS8ZoeeLt2q4VinisXkHBQZFkAksVfb987RppQSt
	oBgmPbgEv8NVvGjfVbwHiNh+Zd5G3jqCmVOOvghl2oKhpEMGVoqM6mr3lX8L0jjgMPUa
	TFIFoC7Vt7U517AQP0xyJp14Wn2hTUGpMEud//EWAqJW3XfNny39pq32LVO3gGZJEPTU
	msZ8mQqFpX0i9vZH+A1xwcKhiwydBgQrPZzQpdOHcVBUBcQ9H17QCGefZ0akvOEV1Sw7
	svAg==
Received: by 10.180.103.35 with SMTP id ft3mr13181057wib.0.1335734839695;
	Sun, 29 Apr 2012 14:27:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm37413539wib.6.2012.04.29.14.27.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 14:27:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 23:27:15 +0200
Message-Id: <cover.1335734193.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 0/3] glib-2.0, gobject-introspection, libsoup-2.4 upgrade
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
X-List-Received-Date: Sun, 29 Apr 2012 21:37:00 -0000

Tested on my images and fixed failing recipe, mostly it's about including header files like:
glib-2.0/glib/gthread.h:28:2: error: #error "Only <glib.h> can be included directly."

The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:

  bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME (2012-04-26 10:59:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2

Martin Jansa (3):
  glib-2.0: upgrade to 2.32.1
  gobject-introspection: upgrade to 1.32.1
  libsoup-2.4: upgrade to 2.38.1

 .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 ++++++++++++++------
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
 .../{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb}     |    6 +--
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 ..._1.31.20.bb => gobject-introspection_1.32.1.bb} |   13 +++--
 ...libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} |    8 ++--
 6 files changed, 53 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb => glib-2.0_2.32.1.bb} (91%)
 rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb => gobject-introspection_1.32.1.bb} (52%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} (55%)

-- 
1.7.8.6



