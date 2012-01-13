Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RllGv-0007aO-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:50:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 09:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95565804"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.110])
	by azsmga001.ch.intel.com with ESMTP; 13 Jan 2012 09:43:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 17:42:57 +0000
Message-Id: <2654e02dfc8bb66bcca60ea3adc4e5d19a302330.1326476501.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] conf/bitbake.conf: allow wget to output error messages
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
X-List-Received-Date: Fri, 13 Jan 2012 17:50:38 -0000

Use the -nv instead of -q command line option for wget so that if
fetching from a URL that the wget fetcher handles (e.g. http) fails, we
get a possibly useful error message (but it still remains relatively
quiet when the fetch succeeds.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 43eedad..d047338 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -556,17 +556,17 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 
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
1.7.5.4



