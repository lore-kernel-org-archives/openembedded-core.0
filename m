Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 165FF70E41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:24:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6OCj6026471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:24:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:24:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:24:08 -0700
Message-ID: <bb89e1e1ef8d33bab02acc1a340fc5e73b140401.1408342506.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342506.git.liezhi.yang@windriver.com>
References: <cover.1408342506.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] pm-utils: add bash to RDEPENDS_pm-utils
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
X-List-Received-Date: Mon, 18 Aug 2014 06:24:12 -0000
Content-Type: text/plain

Bash script:
pm-utils/usr/lib64/pm-utils/sleep.d/98video-quirk-db-handler

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 21d2704..8d35187 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4
 
 inherit pkgconfig autotools
 
-RDEPENDS_${PN} = "grep"
+RDEPENDS_${PN} = "grep bash"
 
 do_configure_prepend () {
 	( cd ${S}; autoreconf -f -i -s )
-- 
1.7.9.5


