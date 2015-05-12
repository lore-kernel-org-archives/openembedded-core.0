Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 435D474030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 08:58:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4C8wqCf008470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 01:58:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 01:58:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 May 2015 01:58:50 -0700
Message-ID: <15f8326018e6ffd2fe3ff553e76563ce8b7e9948.1431421106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431421106.git.liezhi.yang@windriver.com>
References: <cover.1431421106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] stat: fix SRC_URI
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
X-List-Received-Date: Tue, 12 May 2015 08:58:53 -0000
Content-Type: text/plain

The old SRC_URI is redirected to the new one, fixed:
WARNING: Failed to fetch URL ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/stat/stat_3.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 6754fb8..8a19b3b 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
                     file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-${PV}.tar.gz \
+SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
            file://fix-error-return.patch"
 
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
-- 
1.7.9.5


