Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoHP1-0005Yi-7u for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:05:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69GsUFb009069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:54:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08270-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:54:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69GsMLZ009063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:54:23 +0100
Message-ID: <1341852863.8066.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 17:54:23 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf: Drop the old svn FETCH/UPDATE/RESUMECOMMAND variables
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
X-List-Received-Date: Mon, 09 Jul 2012 17:05:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The svn fetcher converted to use FETCHCMD a long time ago. This drops
several variables which are effectively useless.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3453a86..846c6c3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -575,16 +575,12 @@ FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
-FETCHCOMMAND = "ERROR, this must be a BitBake bug"
 FETCHCOMMAND_wget = "/usr/bin/env wget  -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 FETCHCOMMAND_cvs = "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
-FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
 CHECKCOMMAND_wget = "/usr/bin/env wget --spider  -t 2 -T 30 --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
-RESUMECOMMAND = "ERROR, this must be a BitBake bug"
 RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
-UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
-UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
+
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"




