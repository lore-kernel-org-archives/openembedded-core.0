Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhyVB-0001L5-O4
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 08:37:26 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so1714106iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8HD7Iyb6tOTAxqF9pHW00YkRuai/azE14Ug9nBqrBSc=;
	b=FIawPuaWdWW+iQnJeIXSIz38acSVrUadV+DdzQaPZ8v+MQNnDpd1GZ6eAVXhePqIf4
	lyyCmJGLutNq0j3L1GlMBrHT7pRPIqD9gu8IUUTEw4wgJ+PR57LogKzgHOaUinrqPj2L
	7V/rAKgTrV6C9f6wVQSg+5dn3WRrbFMOVjYDQ=
Received: by 10.42.162.194 with SMTP id z2mr4695969icx.79.1310798006403;
	Fri, 15 Jul 2011 23:33:26 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d5sm1339185ibi.62.2011.07.15.23.33.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 23:33:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 23:33:15 -0700
Message-Id: <e286a25378756398463d3bf34174005a8cef8841.1310797743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310797743.git.raj.khem@gmail.com>
References: <cover.1310797743.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] bitbake.conf: Change TERM default fallback to XTERM instead of GNOME_TERM
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
X-List-Received-Date: Sat, 16 Jul 2011 06:37:26 -0000

Its better to use xterm since some folks may not be using gnome
or KDE. Chances of having xterm on build machines are lot more
than having gnome-terminal.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 463991d..128b0b6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -571,8 +571,8 @@ KONSOLE_TERMCMD = 'konsole -T "$TERMWINDOWTITLE"'
 KONSOLE_TERMCMDRUN = '${KONSOLE_TERMCMD} -e $SHELLCMDS'
 
 # Set a default
-TERMCMD ?= "${GNOME_TERMCMD}"
-TERMCMDRUN ?= "${GNOME_TERMCMDRUN}"
+TERMCMD ?= "${XTERM_TERMCMD}"
+TERMCMDRUN ?= "${XTERM_TERMCMDRUN}"
 
 ##################################################################
 # Miscellaneous utilities.
-- 
1.7.4.1



