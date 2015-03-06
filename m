Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE7DA738F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t269We8v012812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:40 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:37 -0800
Message-ID: <07207d00d28d2d30a85df99eb0c0c07c272075a9.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] resolvconf: 1.76 -> 1.76.1
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:38 -0000
Content-Type: text/plain

The old source is not available any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{resolvconf_1.76.bb => resolvconf_1.76.1.bb}   |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.76.1.bb} (94%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.1.bb
similarity index 94%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.76.1.bb
index 20a2c19..fb9ca2b 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.1.bb
@@ -16,9 +16,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz \
            file://99_resolvconf \
           "
 
-
-SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
-SRC_URI[sha256sum] = "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
+SRC_URI[md5sum] = "16f395f43ef5d832922b0cd4a82efcaa"
+SRC_URI[sha256sum] = "05318a7988f2b6fa400468ea096f0ccf73d166ac47a4fbab287ff63bea9502d3"
 
 inherit allarch
 
-- 
1.7.9.5


