Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3E336ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A8VXQt002500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:31:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 01:31:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 01:31:28 -0700
Message-ID: <8e8271911615b4e69d526f79015de55b6a832603.1428654657.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428654657.git.liezhi.yang@windriver.com>
References: <cover.1428654657.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] wget: 1.16.2 -> 1.16.3
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
X-List-Received-Date: Fri, 10 Apr 2015 08:31:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../wget/{wget_1.16.2.bb => wget_1.16.3.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.16.2.bb => wget_1.16.3.bb} (45%)

diff --git a/meta/recipes-extended/wget/wget_1.16.2.bb b/meta/recipes-extended/wget/wget_1.16.3.bb
similarity index 45%
rename from meta/recipes-extended/wget/wget_1.16.2.bb
rename to meta/recipes-extended/wget/wget_1.16.3.bb
index 8a0161d..87755b2 100644
--- a/meta/recipes-extended/wget/wget_1.16.2.bb
+++ b/meta/recipes-extended/wget/wget_1.16.3.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
           "
 
-SRC_URI[md5sum] = "d33b130ff23155e360d0a5172575bf56"
-SRC_URI[sha256sum] = "311a28f211117a338501009bfaba5bfeb9cd71564a7b9ad5775b8f5f4369f972"
+SRC_URI[md5sum] = "f61d9011b99f824106a5d5a05dd0f63d"
+SRC_URI[sha256sum] = "9f1c6d09d7148c1c2d9fd0ea655dcf4dcc407deb2db32d4126251ca0245cb670"
 
 require wget.inc
-- 
1.7.9.5


