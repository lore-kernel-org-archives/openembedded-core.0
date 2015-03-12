Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1977399D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 01:39:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2C1d1qS018892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:39:02 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 18:39:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 18:38:57 -0700
Message-ID: <4e7d93d076cb420ae6e7acb6661d57d16af61439.1426124214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426124214.git.liezhi.yang@windriver.com>
References: <cover.1426124214.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 01:39:01 -0000
Content-Type: text/plain

The www.xinetd.org is not available, use github as the HOMEPAGE and
SRC_URI.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 288186e..ffc03e5 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Socket-based service activation daemon"
-HOMEPAGE = "http://www.xinetd.org"
+HOMEPAGE = "https://github.com/xinetd-org/xinetd"
 
 # xinetd is a BSD-like license
 # Apple and Gentoo say BSD here.
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 DEPENDS = ""
 PR = "r2"
 
-SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
+SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
@@ -20,8 +20,9 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.service \
       "
 
-SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
-SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
+SRCREV = "68bb9ab9e9f214ad8a2322f28ac1d6733e70bc24"
+
+S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd
 
-- 
1.7.9.5


