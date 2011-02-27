Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyO-0007Da-Qi
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:28 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:07 -0800 (PST)
Received: by 10.216.163.203 with SMTP id a53mr3529126wel.104.1298799007499;
	Sun, 27 Feb 2011 01:30:07 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 16sm989299wet.8.2011.02.27.01.30.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:41 +0100
Message-Id: <cb28aa3f51fd18b9331a786c0102b3ca93f67b6f.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 31/50] package.bbclass: Fix debug sources directory creation to reference the target system
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 59a0601..c8adbb0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -225,7 +225,7 @@ def splitfile2(debugsrcdir, d):
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
     if debugsrcdir:
-       bb.mkdirhier(debugsrcdir)
+       bb.mkdirhier("%s%s" % (dvar, debugsrcdir))
 
        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
        processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
-- 
1.6.6.1



