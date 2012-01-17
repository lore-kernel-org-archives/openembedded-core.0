Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006iI-6P
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633075"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:33 -0800
Message-Id: <3c1cf8bf830eee78854598866b63d0dc976257e0.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 48/62] conf/bitbake.conf: allow wget to output error messages
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:52 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Use the -nv instead of -q command line option for wget so that if
fetching from a URL that the wget fetcher handles (e.g. http) fails, we
get a possibly useful error message (but it still remains relatively
quiet when the fetch succeeds.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d051363..2eb4a05 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -562,17 +562,17 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 
 FETCHCMD_svn = "/usr/bin/env svn"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 5 -q --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 5 -nv --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
 FETCHCOMMAND = "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget = "/usr/bin/env wget -t 5 -q --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
+FETCHCOMMAND_wget = "/usr/bin/env wget -t 5 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 FETCHCOMMAND_cvs = "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
 FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
 CHECKCOMMAND_wget = "/usr/bin/env wget --spider -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 RESUMECOMMAND = "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 5 -q --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
+RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 5 -nv --passive-ftp --no-check-certificate -P ${DL_DIR} '${URI}'"
 UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
-- 
1.7.6.5



