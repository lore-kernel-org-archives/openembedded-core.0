Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhptY-0005G0-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 23:26:00 +0200
Received: by iwn4 with SMTP id 4so1487449iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8HD7Iyb6tOTAxqF9pHW00YkRuai/azE14Ug9nBqrBSc=;
	b=NPyzDZ+qZMvAQeobO89IR2j/0ed+ZmXhTxBALmol99+TAiYkWxdEA0keqfoHikCKes
	MW8W0uZfReNnt7c8J6gihWV45fDImnOplWTJHFx5Jzqu9fvTwXz+2otexUVESC1XeOMU
	shkzQLdx4T9ERA9CQtBVeEW1pL03PXPKpBHb4=
Received: by 10.42.154.201 with SMTP id r9mr135205icw.473.1310764919056;
	Fri, 15 Jul 2011 14:21:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1771141icw.5.2011.07.15.14.21.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 14:21:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:23:07 -0700
Message-Id: <1310764987-26717-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bitbake.conf: Change TERM default fallback to XTERM instead of GNOME_TERM
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
X-List-Received-Date: Fri, 15 Jul 2011 21:26:00 -0000

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



