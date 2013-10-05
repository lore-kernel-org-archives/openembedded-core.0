Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 656CC6CD32
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:07 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so2254120eek.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=RCcdEeG7Emq9Hau3FEGOa1A5XnDtfIxfWhtIhwEDS3s=;
	b=is4Oj1o3vFQc6dUqztjyMxs08UpJeojsXyQBvj/anlEwJVkufNrznVs4m6yg3mcQ9f
	wUcO6jUcFHjt0fMkYriHbabh6+mqBx96Kdqp9gMFMuBI1nTGe0YRT5kzRAsGqeXcTBwq
	5QCFPsPAEHhmGOeI1f0faC1Z/wONRdrfCAFZUhp75WNYnI48nWmr2hrblssFLV/T7Ky+
	M0g6mT2w2edlhCu0LS0pn8W66IRTz6V8OEQZJSYPHU7+S5O4kuCNMwtDv6F48MNuYb8p
	hv6EBxkdVIJs+zQCdQnFzwwtecToIcVNOiAHMEa//n01OkcQzLdQ1rgMH2nDroRAJLKv
	QCNQ==
X-Received: by 10.14.180.73 with SMTP id i49mr2817837eem.55.1380975788943;
	Sat, 05 Oct 2013 05:23:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm39231314eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:00 +0200
Message-Id: <79776572cc65ad0fbaed7b948f4cb50a97f752ae.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 03/14] aspell: Add PACKAGECONFIG for curses
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:07 -0000

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


