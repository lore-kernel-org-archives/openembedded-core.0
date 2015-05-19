Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2D216AD0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:13:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4J1DRAg016675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:13:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 18 May 2015 18:13:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 09:08:11 +0800
Message-ID: <dab8d367624b23612b3eca90704c9f9cb6d8bd7f.1431997609.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431997609.git.kai.kang@windriver.com>
References: <cover.1431997609.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/4] vala: upgrade to version 0.28.0
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
X-List-Received-Date: Tue, 19 May 2015 01:13:30 -0000
Content-Type: text/plain

Upgrade vala from version 0.26.1 to 0.28.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/vala/{vala_0.26.1.bb => vala_0.28.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.26.1.bb => vala_0.28.0.bb} (42%)

diff --git a/meta/recipes-devtools/vala/vala_0.26.1.bb b/meta/recipes-devtools/vala/vala_0.28.0.bb
similarity index 42%
rename from meta/recipes-devtools/vala/vala_0.26.1.bb
rename to meta/recipes-devtools/vala/vala_0.28.0.bb
index 3df9cd4..120906c 100644
--- a/meta/recipes-devtools/vala/vala_0.26.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.28.0.bb
@@ -2,5 +2,5 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
 
-SRC_URI[md5sum] = "723a03b822d4cc47abc4019685970a3e"
-SRC_URI[sha256sum] = "8407abb19ab3a58bbfc0d288abb47666ef81f76d0540258c03965e7545f59e6b"
+SRC_URI[md5sum] = "8d4ceac3451a0d5497e7be38e5e4c2ad"
+SRC_URI[sha256sum] = "0d9e3bd3f82145664875f7c29b2f544ba92d2814f75412948f774c0727fc977f"
-- 
1.9.1


