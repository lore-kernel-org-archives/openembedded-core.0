Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.408.1585597399149814363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 12:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: UI8X+9AzJDCGvbItkQfwSQE85/LEHy52yfb62YfMZG/lotYwpZd6x5Zdl1Lcn0vckaPe/RY8rW
 dBGxAcrCboDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 12:43:26 -0700
IronPort-SDR: eEk4C3CgaGzcMof8fkJxTjKKRwmbE1JosDX2Mb994J5/XjQLWI0q1DpkuJG0KWu+QHkHVzDU+G
 M4vwMw2x/6ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="359273419"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 12:43:26 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/4] sanity.bbclass: recommend using install-buildtools
Date: Mon, 30 Mar 2020 12:43:01 -0700
Message-Id: <20200330194302.30032-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For old tar versions (1.24 and 1.28), recommned using
scripts/install-buildtools

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca5cdad17..0cf955a341 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -533,9 +533,9 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
-        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+).\n"
+        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+). You could use the project's buildtools-tarball from our last release or use scripts/install-buildtools\n"
     if LooseVersion(version) < LooseVersion("1.28"):
-        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release).\n"
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.24.0

