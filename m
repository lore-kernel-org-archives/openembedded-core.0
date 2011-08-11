Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrYDP-0002k1-0N
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:34:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 09:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38285544"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 09:30:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 09:29:53 -0700
Message-Id: <23a2a8333105b2dcbde8e74bc3fd88841656980d.1313079549.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/10] python-dir: specify am_cv_python_pythondir & am_cv_python_pyexecdir
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
X-List-Received-Date: Thu, 11 Aug 2011 16:34:39 -0000

From: Kumar Gala <galak@kernel.crashing.org>

autoconf will try and set these to via python.m4:

am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages

However this is problematic as this doesnt respect libdir and where
we've actually set python's site package dir to.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/python-dir.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index 1ceb929..526b3bf 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,3 +1,6 @@
 PYTHON_BASEVERSION ?= "2.6"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
+
+EXTRA_OECONF += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECONF += "am_cv_python_pyexecdir=${PYTHON_SITEPACKAGES_DIR}"
-- 
1.7.3.4



