Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UFJtS-0007Ux-5U
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:45:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2C7SP5l004297
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:28:26 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 12 Mar 2013 00:28:26 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 15:29:53 +0800
Message-ID: <2d51158e8a1412fc29ef3bb2abdfeb7948ca3abd.1362991307.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1362991307.git.kai.kang@windriver.com>
References: <cover.1362991307.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] external-python-tarball: rename output package
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
X-List-Received-Date: Tue, 12 Mar 2013 07:45:08 -0000
Content-Type: text/plain

Update TOOLCHAIN_OUTPUTNAME to rename the output package which is the
similiar style to name packages meta-toolchain-*.

[YOCTO #3996]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-core/meta/external-python-tarball.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/external-python-tarball.bb
index 2513cf6..5f8cc96 100644
--- a/meta/recipes-core/meta/external-python-tarball.bb
+++ b/meta/recipes-core/meta/external-python-tarball.bb
@@ -29,7 +29,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-chrpath \
     "
 
-TOOLCHAIN_OUTPUTNAME ?= "python-nativesdk-standalone-${SDKMACHINE}"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-python-nativesdk-standalone-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
-- 
1.7.5.4



