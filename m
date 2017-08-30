Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 668BE783C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494536"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:15 +1200
Message-Id: <8ce0806ff6334c0a1848b0ee166232532fa1f21a.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/13] recipetool: create: detect Eclipse licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2017 23:55:32 -0000

Add detection of EPL 1.0 and EDL 1.0 license files.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2b30385..4788691 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1099,6 +1099,10 @@ def crunch_license(licfile):
     crunched_md5sums['1daebd9491d1e8426900b4fa5a422814'] = 'LGPLv2.1'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
     crunched_md5sums['2ebfb3bb49b9a48a075cc1425e7f4129'] = 'LGPLv3'
+    # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v10
+    crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] = 'EPL-1.0'
+    # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/edl-v10
+    crunched_md5sums['0a9c78c0a398d1bbce4a166757d60387'] = 'EDL-1.0'
     lictext = []
     with open(licfile, 'r', errors='surrogateescape') as f:
         for line in f:
@@ -1131,7 +1135,7 @@ def guess_license(srctree, d):
     md5sums = get_license_md5sums(d)
 
     licenses = []
-    licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*']
+    licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v10']
     licfiles = []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
-- 
2.9.5


