Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrxZK-0003CQ-DY
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 22:15:46 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so13492525lab.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 13:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AG4CWRoFNMuBkqL6JUErMpfYyHx04JIeSed58vtVkl8=;
	b=pnIPXDDOCOG+HSDgilA+b28wN3BghuA9zTlF2GjG4l+EWRiTzkHlDTo7y5w34StNbq
	kVexJZc0402aV/K2JFAaVKeJlAadLj/aTxDID6IlMzDZ5jZL2aISU7Z5EGUGnlHtF8pF
	1V96aUhCYoxC0xicC0z+4bDps4BZDMgAeOQ9/3Gbae2mQbftq1XNh0/keIoTzQn6sBH5
	TiiYWqWJGSOp9zuGP3THMH0EpGdVTwLHj7nNIwSsguMaNCWX7yfbyZdfqCvIk2+L0Wn5
	RoVFLwZQ5XH62YT0aK4Xp0ppJbc0GGlHWedSx5j6/d1BnAZphsdwp17upXoHzrSD36k3
	gEZw==
X-Received: by 10.112.44.164 with SMTP id f4mr23499366lbm.111.1357506038195;
	Sun, 06 Jan 2013 13:00:38 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ie3sm812471lab.4.2013.01.06.13.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 13:00:37 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrxKd-0000tA-I8; Sun, 06 Jan 2013 23:00:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2013 22:59:50 +0200
Message-Id: <1357505990-3365-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357505990-3365-1-git-send-email-cazfi74@gmail.com>
References: <1357505990-3365-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] prelink: update to git head
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
X-List-Received-Date: Sun, 06 Jan 2013 21:15:46 -0000

Compatible with automake-1.13.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 610302e..ae9931f 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
+SRCREV = "4e313edb125db215d4c456ce62c74ee16841a365"
 PV = "1.0+git${SRCPV}"
-PR = "r10"
+PR = "r0"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.10.4



