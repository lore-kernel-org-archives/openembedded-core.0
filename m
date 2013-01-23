Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Txqzw-0003BD-Er
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 04:28:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N3C51I005826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 19:12:05 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 22 Jan 2013 19:12:03 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 23 Jan 2013 11:13:13 +0800
Message-ID: <8d07e3586ff422823b1fbd1353694cb5d58b8078.1358910000.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1358910000.git.kai.kang@windriver.com>
References: <cover.1358910000.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] createrepo-native: update dependency
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
X-List-Received-Date: Wed, 23 Jan 2013 03:28:08 -0000
Content-Type: text/plain

"RDEPENDS_${PN}_class-native" doesn't work for native recipe because no
-native package will be created. Then the dependencies listed here are
not built when bitbake createrepo-native.
Update and use DEPENDS_class-native instead.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../createrepo/createrepo_0.4.11.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 227ebcb..c977c2e 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-RDEPENDS_${PN}_class-native += "libxml2-native rpm-native"
+DEPENDS_class-native += "libxml2-native rpm-native"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
-- 
1.7.5.4



