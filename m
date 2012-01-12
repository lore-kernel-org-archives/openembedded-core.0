Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHAy-00079y-2u
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 10:42:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so493358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=T3zpjyKgvj1PkT6I1YbxJIW8jU9hJp6huRlmuf7ZwqE=;
	b=tU7iH+uTZZXWZKGQjaPd3Og2qDH4BA1KugxFJDfedHFvdF18Kg7vk056HdCP82wGLv
	xSVOkQwpYTTdWZfjdSOpwP47+jiFZlOLwGXDI/HgB3EfRyaRZGdgNc9/QfFwWf9Ra3QQ
	LPJ0bjRvuCr7tg5LiVAO/jRZFlRky4oIiZ4Qo=
Received: by 10.14.15.229 with SMTP id f77mr1144134eef.13.1326360899517;
	Thu, 12 Jan 2012 01:34:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm17304520eef.7.2012.01.12.01.34.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:34:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:34:50 +0100
Message-Id: <ac5832462cb17b7664c233dc815d761633f38e5f.1326360842.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326360842.git.Martin.Jansa@gmail.com>
References: <cover.1326360842.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] alsa-utils: depend on libsamplerate0
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
X-List-Received-Date: Thu, 12 Jan 2012 09:42:28 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

We need to depend on libsamplerate0 because it's detected automatically
  and if we configure without it we get that issue at runtime trying
  to run the alsaloop program:
    No libsamplerate support.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 9eee60a..196128e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -5,8 +5,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
-DEPENDS = "alsa-lib ncurses"
-PR = "r3"
+DEPENDS = "alsa-lib ncurses libsamplerate0"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
-- 
1.7.8.3



