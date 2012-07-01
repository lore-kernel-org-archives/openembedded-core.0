Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SlGgz-0005Jc-3e
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Jul 2012 11:43:45 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:41348 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SlGWJ-000112-Kw for openembedded-core@lists.openembedded.org;
	Sun, 01 Jul 2012 05:32:43 -0400
Date: Sun, 1 Jul 2012 05:32:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207010531450.30586@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: bitbake.conf: Tidy up a few comment typoes; no functional changes.
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
X-List-Received-Date: Sun, 01 Jul 2012 09:43:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9377ee6..0a177c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -368,7 +368,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"

 ##################################################################
-# SDK variables,
+# SDK variables.
 ##################################################################

 SDK_NAME_PREFIX ?= "oecore"
@@ -395,9 +395,9 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
 IMAGE_OVERHEAD_FACTOR ?= "1.3"
-# This option allow for adding addition space in K above and beyond what the
+# This option allows for adding additional space in K above and beyond what the
 # IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
-# To set a fixed size then overrideing IMAGE_ROOTFS_SIZE with the max size one wants
+# To set a fixed size then overriding IMAGE_ROOTFS_SIZE with the max size one wants
 # should do the trick
 IMAGE_ROOTFS_EXTRA_SPACE ?= "0"

@@ -418,7 +418,7 @@ CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
 export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
-# Assign CCACHE_DIR a default vaule to fix a bug of ccache 3.1.7,
+# Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
 # since it would always create CCACHE_DIR/.ccache even if
 # CCACHE_DISABLE = 1.
 export CCACHE_DIR ??= "${@os.getenv('HOME')}"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


