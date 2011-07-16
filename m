Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhuDp-0002An-TZ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 04:03:14 +0200
Received: by iyj12 with SMTP id 12so272193iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 18:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8HD7Iyb6tOTAxqF9pHW00YkRuai/azE14Ug9nBqrBSc=;
	b=pn+TOc36OQjRz3nLVNhDFYd95XHE+V3LQfJ9NE/fmKQIwpSE2Cl3y1h/H4uvvaGNU2
	kWrmYIAfwnVbpBBAMbNqvInkO7vhxZKYLTMLDU5bE+xLaZu+yhVRAh5fQrlaZ//DIdgm
	RV7M7sG5vdNsdL9vi9agRTtDYXdP9uxuSMYHg=
Received: by 10.42.151.138 with SMTP id e10mr4509636icw.251.1310781552168;
	Fri, 15 Jul 2011 18:59:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id hq1sm2001828icc.14.2011.07.15.18.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 18:59:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 18:59:02 -0700
Message-Id: <e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310781382.git.raj.khem@gmail.com>
References: <cover.1310781382.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] bitbake.conf: Change TERM default fallback to XTERM instead of GNOME_TERM
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
X-List-Received-Date: Sat, 16 Jul 2011 02:03:14 -0000

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



