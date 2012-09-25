Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGdtZ-000615-1R
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:46:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Sep 2012 15:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,486,1344236400"; d="scan'208";a="197637599"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 25 Sep 2012 15:33:34 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8PMW9Gn007402;
	Tue, 25 Sep 2012 15:32:09 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8PMW9x2007401;
	Tue, 25 Sep 2012 15:32:09 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 15:32:07 -0700
Message-Id: <40fc7f586f71cb47f3d2a96b2197fa8bcdae0499.1348612198.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348612198.git.elizabeth.flanagan@intel.com>
References: <cover.1348612198.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] ossp-uuid: LICENSE type corrections.
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
X-List-Received-Date: Tue, 25 Sep 2012 22:46:25 -0000

The LICENSE for ossp-uuid is MIT. As well, the LIC_FILES_CHKSUM
was missing the license text within uuid_md5.c

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index cc1ec75..7de0a58 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -11,10 +11,11 @@ Unique Identifiers (UUID) from the command-line."
 HOMEPAGE = "http://www.ossp.org/pkg/lib/uuid/"
 SECTION = "libs"
 
-LICENSE = "ossp_uuid"
-LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6ad9d9d769ee960e"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6ad9d9d769ee960e \
+	   file://uuid_md5.c;beginline=1;endline=28;md5=9c1f4b2218546deae24c91be1dcf00dd"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz \
 	   file://0001-Change-library-name.patch \
-- 
1.7.5.4



