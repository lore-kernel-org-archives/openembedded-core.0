Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94DA96E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131CRbk013013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:11 -0800
Message-ID: <9064ab59b68709ba0a351fe504d2f04c7965ff9c.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/21] elfutils 0.148: use BPN in SRC_URI
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:26 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 5e75f12..16db6b2 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 PR = "r11"
 
-SRC_URI = "https://fedorahosted.org/releases/e/l/${PN}/${BP}.tar.bz2"
+SRC_URI = "https://fedorahosted.org/releases/e/l/${BPN}/${BP}.tar.bz2"
 
 SRC_URI[md5sum] = "a0bed1130135f17ad27533b0034dba8d"
 SRC_URI[sha256sum] = "8aebfa4a745db21cf5429c9541fe482729b62efc7e53e9110151b4169fe887da"
-- 
1.7.9.5


