Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB0D7FC39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:08 +0000 (UTC)
IronPort-SDR: sQD/hn3xKUIZcfC4JtdngGiA6kfPYB9/jUA7UvU9hzmmJBQqiyszQQN7vpq3ZFwgunkbw6Ovnb
	9w4BxMbXOuJKVmBtdq8RbxeErA617DpTSA7Q4CribcN3GORg51ElSKyuEgrK0j3uYNu3RK5pHG
	2Sp6iPK6wkcSXydl2MFmy8QGK3aQmwcoSwdoE0hgXnxu8N7WphQJJBfRf5t2iVyIoxGGSjgoPv
	+7lvFIpy4YbscDAPEw9Iq/FO3+oAHEUtYXMx2IzwE187HTv6U5kVSpm//2fNrU7HrifozR1LKE
	8GY=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160256"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:50 +0100
Message-Id: <20200108034455.10101-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 2/7] oe-pkgdata-browser: Clean the package view properly
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:09 -0000
Content-Transfer-Encoding: 8bit

Not all widgets were hidden when no package was selected.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 09544fff82..21e319481e 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -186,6 +186,9 @@ class PkgUi():
         self.depends_label.hide()
         self.recommends_label.hide()
         self.suggests_label.hide()
+        self.provides_label.hide()
+        self.files_view.hide()
+        self.files_label.hide()
 
         (model, it) = selection.get_selected()
         if it is None:
@@ -205,6 +208,7 @@ class PkgUi():
         else:
             self.files_view.hide()
             self.files_label.set_text("This package has no files.")
+        self.files_label.show()
 
         def update_deps(field, prefix, label, clickable=True):
             if field in data:
-- 
2.21.1


