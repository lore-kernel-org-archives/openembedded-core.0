Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED4965E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:06:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I66cUf026317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:06:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:06:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:06:33 -0700
Message-ID: <4a6c27bc8a4fb1db09447348a674645e0661c7de.1408341623.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408341623.git.liezhi.yang@windriver.com>
References: <cover.1408341623.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] sed: add sed to RDEPENDS sed-ptest
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
X-List-Received-Date: Mon, 18 Aug 2014 06:06:40 -0000
Content-Type: text/plain

Its test scripts require /bin/sed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/sed/sed_4.2.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index 74ac16b..ea39dae 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
 inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make locale-base-ru-ru"
+RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
 
 EXTRA_OECONF = "--disable-acl \
                 ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex-tests', '', d)}"
-- 
1.7.9.5


