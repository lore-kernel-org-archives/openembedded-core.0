Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 863267020E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:29:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FETDRd012853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:29:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:29:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:29:12 -0700
Message-ID: <da31fe7e746c7ffaf031672eed2a40318715d83a.1405434230.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405434230.git.liezhi.yang@windriver.com>
References: <cover.1405434230.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-distribute: add python to RDEPENDS_python-distribute
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
X-List-Received-Date: Tue, 15 Jul 2014 14:29:17 -0000
Content-Type: text/plain

We don't need this in theory since:
python-distribute -> python-distutils -> python-core

But the rpmdeps can't figure out the dependencies recursively, and add python
to fix the warning.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python-distribute_0.6.32.bb             |    1 +
 .../python/python3-distribute_0.6.32.bb            |    1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
index 58bb8b4..56d9787 100644
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -42,6 +42,7 @@ do_install_append() {
 RDEPENDS_${PN} = "\
   python-distutils \
   python-compression \
+  python \
 "
 
 RPROVIDES_${PN} += "python-setuptools"
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
index 573096c..3aaa518 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -42,6 +42,7 @@ do_install_append() {
 RDEPENDS_${PN} = "\
   python3-distutils \
   python3-compression \
+  python3 \
 "
 
 RPROVIDES_${PN} += "python3-setuptools"
-- 
1.7.9.5


