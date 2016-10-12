Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2015071A03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 09:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9C9J8I4007532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:19:09 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 02:19:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2016 02:19:06 -0700
Message-ID: <66ca8239a28434c2db142e18a1a112122d13e910.1476263868.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476263868.git.liezhi.yang@windriver.com>
References: <cover.1476263868.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package_ipk/rpm/deb: remove unneeded dir settings
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
X-List-Received-Date: Wed, 12 Oct 2016 09:19:08 -0000
Content-Type: text/plain

There is a do_package_write_foo[cleandirs], so the
do_package_write_foo[dirs] is not needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_deb.bbclass | 1 -
 meta/classes/package_ipk.bbclass | 1 -
 meta/classes/package_rpm.bbclass | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fb6034c..8a2cc7e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -348,7 +348,6 @@ python do_package_write_deb () {
     bb.build.exec_func("read_subpackage_metadata", d)
     bb.build.exec_func("do_package_deb", d)
 }
-do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
 addtask package_write_deb after do_packagedata do_package
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index eb00932..d280513 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -288,7 +288,6 @@ python do_package_write_ipk () {
     bb.build.exec_func("read_subpackage_metadata", d)
     bb.build.exec_func("do_package_ipk", d)
 }
-do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
 addtask package_write_ipk after do_packagedata do_package
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c431545..817739d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -763,7 +763,6 @@ python do_package_write_rpm () {
     bb.build.exec_func("do_package_rpm", d)
 }
 
-do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 addtask package_write_rpm after do_packagedata do_package
-- 
2.9.0


