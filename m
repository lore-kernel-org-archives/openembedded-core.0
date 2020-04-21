Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.111.1587507938020922549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 15:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.100, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: G22UOHhEa1uPR6eCTEpcgstvIXZV9Bt4tGJspZJXsympoF08LXThD4eCay902thVPq9XNvJX99
 PyhNvOiw+NZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 15:25:37 -0700
IronPort-SDR: uSd5th5+l3tx6skkpk7oXhACzrZLSUq76w45sMZjSV0W1WdjWusQ5px5u+pYQGLI0igDWIbx85
 zLBH8aoo3VJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="273677995"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2020 15:25:37 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [master][dunfell][PATCH] scripts/install-buildtools: bump to 3.1 release by default
Date: Tue, 21 Apr 2020 15:25:08 -0700
Message-Id: <20200421222508.1372-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, use the extended buildtools installer from the
Yocto Project 3.1 "dunfell" release.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 9da364981e5..c6b3a1eed72 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.1_M3'
-DEFAULT_INSTALLER_VERSION = '3.0+snapshot'
-DEFAULT_BUILDDATE = "20200315"
+DEFAULT_RELEASE = 'yocto-3.1'
+DEFAULT_INSTALLER_VERSION = '3.1'
+DEFAULT_BUILDDATE = ''
 
 # Python version sanity check
 if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
-- 
2.24.0

