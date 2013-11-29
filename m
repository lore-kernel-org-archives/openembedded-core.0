Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84A6F6DEB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:48:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATCmCt4027993
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:48:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:48:12 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:25 +0800
Message-ID: <84bccc4b42142e693bc36392d526d25cf04e3788.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/18] pax-utils: add bash runtime dependency
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
X-List-Received-Date: Fri, 29 Nov 2013 12:48:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make pax-utils explicitly rdepend on bash so that the rootfs task will
not fail for the reason of implicit runtime bash dependency.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_0.7.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
index 30fb0e6..f8e567f 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
+RDEPENDS_${PN}_class-target = "bash"
+
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "8ae7743ad11500f7604f2e817221d877"
-- 
1.7.9.5


