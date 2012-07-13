Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SphWf-00074r-UL
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 17:11:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6DDtIJk001603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 06:55:18 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Jul 2012 06:55:17 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2012 09:55:00 -0400
Message-ID: <1342187709-19368-12-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
References: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/20] telepathy-python: Update for python-native changes
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
X-List-Received-Date: Fri, 13 Jul 2012 15:11:27 -0000
Content-Type: text/plain

Add pythonnative to the inherits list

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../telepathy/telepathy-python_0.15.19.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 0113854..8b85c9a 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -10,9 +10,9 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://parallel_make.patch \
            file://remove_duplicate_install.patch"
 
-PR = "r4"
+PR = "r5"
 
-inherit autotools
+inherit autotools pythonnative
 
 SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
-- 
1.7.0.4



