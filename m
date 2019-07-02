Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 199B47EA97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:20:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="166050131"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2019 21:13:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:12:47 +1200
Message-Id: <b64ece6a36e04c2c356ad8d1b56fe4ef42ed759f.1562040724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562040724.git.paul.eggleton@linux.intel.com>
References: <cover.1562040724.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] list-packageconfig-flags: print PN instead of P
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
X-List-Received-Date: Tue, 02 Jul 2019 04:20:14 -0000
Content-Transfer-Encoding: 8bit

P (which is ${PN}-${PV}) isn't terribly useful in this context - we
don't really care what the version is, but we do want to know what the
recipe is so we can find it or set PACKAGECONFIG_pn-<PN> in our
configuration, so display ${PN} instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/list-packageconfig-flags.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index b1d6c852d86..d6de4dc84d2 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -65,7 +65,7 @@ def collect_pkgs(data_dict):
     for fn in data_dict:
         pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
         pkgconfigflags.pop('doc', None)
-        pkgname = data_dict[fn].getVar("P")
+        pkgname = data_dict[fn].getVar("PN")
         pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
 
     return pkg_dict
-- 
2.20.1


