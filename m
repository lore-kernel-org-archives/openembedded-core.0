Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 772926BEC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:01:58 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so347489eak.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=RCcdEeG7Emq9Hau3FEGOa1A5XnDtfIxfWhtIhwEDS3s=;
	b=mTGdpxmn4XA80Coa1uBY1FICkfwk7ASQ6FiBYRrJ9iNCyaC9RvatmRXlunZWgneWzJ
	XU69W9PYlg9vToGuPca+FwsTx+L1//Ovc6oD8QqvUarOAjZvNCpY3invwSTQW0BN/gos
	3VtklNkWAxqQNNjasWndl7sOMVW72x2RWnd/ZWZ2BwePTvU88WrIWo6LfJb1HAxXFh4b
	PGQTNXrjHA+j3YuDtA2QFvVIocpoNkIscPsJvFF4T8I0lqO9HNBd9g6Fo6bzc04Cn17p
	WidPnqUqfITwTHUHQpCToWgwDsskBPBLOkbRU4xM0V/6Hp8F4LaQ0NRTLw4tjNrs/EHz
	a3hw==
X-Received: by 10.15.73.134 with SMTP id h6mr3905083eey.76.1377792118921;
	Thu, 29 Aug 2013 09:01:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47237984eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:01:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:50 +0200
Message-Id: <31e31f822f71fbd90142d1d006f911e986536d56.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 03/20] aspell: Add PACKAGECONFIG for curses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 16:01:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/aspell/aspell_0.60.6.1.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 64611cb..b196d96 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -1,12 +1,16 @@
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
-SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 PR = "r1"
+
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
+SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
+
 PACKAGES += "libaspell libpspell libpspell-dev aspell-utils"
 
 FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
-- 
1.8.3.2


