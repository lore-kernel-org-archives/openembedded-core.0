Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BED6E72858
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:20:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E9KfVu022493
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 01:20:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 01:20:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 01:20:36 -0800
Message-ID: <4515e28010c74411110c9ee5302bcab5ad7693b0.1421227202.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421227202.git.liezhi.yang@windriver.com>
References: <cover.1421227202.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] mkelfimage: set CLEANBROKEN
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
X-List-Received-Date: Wed, 14 Jan 2015 09:20:48 -0000
Content-Type: text/plain

Fix when rebuild:
| DEBUG: Executing shell function autotools_preconfigure
| Makefile:1: Makefile.conf: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index bcf68a8..28aff91 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
            file://fix-makefile-to-find-libz.patch   \
           "
 
+CLEANBROKEN = "1"
+
 S = "${WORKDIR}/git/util/mkelfImage"
 
 CFLAGS += "-fno-stack-protector"
-- 
1.7.9.5


