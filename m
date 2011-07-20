Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje3G-000444-VO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:44 +0200
Received: by fxh10 with SMTP id 10so2396656fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=c48PIlcVRWccD+/OjIQQQ8lROul4QZEvNr1epvBKHpA=;
	b=mWkzYdIVJ2etwr19sgeGmR27/tMQUDNBZRkrs3kmYuryJMNhuWSbOTVymbRp5V1LxR
	sp5qjm/VNsiJbQQJXPthwrCIoVswKbmrLXFkjt7mPzun6QQyYGunJ2RHZjv614gojPfH
	96SmQ5FWkOJNq//ibwtSxSZN6TTmEKU7f8JJA=
Received: by 10.223.9.217 with SMTP id m25mr839607fam.122.1311195996058;
	Wed, 20 Jul 2011 14:06:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 22sm933301fas.35.2011.07.20.14.06.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:06:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:18 +0200
Message-Id: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/10] tcmode-default: set preferred version also for (e)glibc-locale
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e27a1b4..86538f1 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -50,10 +50,12 @@ PREFERRED_VERSION_binutils-cross-canadian ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-nativesdk ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial-nativesdk ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
-- 
1.7.6



