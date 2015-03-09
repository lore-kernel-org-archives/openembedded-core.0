Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE75A738F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:15:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t297FFNT022653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 00:15:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 00:15:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 00:15:09 -0700
Message-ID: <cd62f62acc964a2d896fd7a7e2a26372589f40a0.1425885208.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425885208.git.liezhi.yang@windriver.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 07:15:16 -0000
Content-Type: text/plain

The www.xinetd.org is not available, use github as the HOMEPAGE and
pkgs.fedoraproject.org as the SRC_URI.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 288186e..f07a33f 100644
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
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/77358478fd58efa6366accae99b8b04c/${BP}.tar.gz \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
-- 
1.7.9.5


