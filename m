Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0296971984
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 08:45:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v638joWT011633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jul 2017 01:45:50 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Jul 2017 01:45:49 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jul 2017 04:45:47 -0400
Message-ID: <25eeffeafa3ec6d9fc76386102fd7615442bb65a.1499071491.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499071491.git.dengke.du@windriver.com>
References: <cover.1499071491.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grep: upgrade to 3.1
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
X-List-Received-Date: Mon, 03 Jul 2017 08:45:50 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/grep/{grep_3.0.bb => grep_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_3.0.bb => grep_3.1.bb} (89%)

diff --git a/meta/recipes-extended/grep/grep_3.0.bb b/meta/recipes-extended/grep/grep_3.1.bb
similarity index 89%
rename from meta/recipes-extended/grep/grep_3.0.bb
rename to meta/recipes-extended/grep/grep_3.1.bb
index b2940d5429..05b6b93949 100644
--- a/meta/recipes-extended/grep/grep_3.0.bb
+++ b/meta/recipes-extended/grep/grep_3.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "fa07c1616adeb9c3262be5177d10ad4a"
-SRC_URI[sha256sum] = "e2c81db5056e3e8c5995f0bb5d0d0e1cad1f6f45c3b2fc77b6e81435aed48ab5"
+SRC_URI[md5sum] = "feca7b3e7c7f4aab2b42ecbfc513b070"
+SRC_URI[sha256sum] = "db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.11.0


