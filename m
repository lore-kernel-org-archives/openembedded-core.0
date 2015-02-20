Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4484E73626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bN1H006897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:20 -0800
Message-ID: <4072b3336e1eb7a84051409991ecde87aaff16a3.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] python-gitdb: 0.6.1 -> 0.6.4
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:26 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...python-gitdb_0.6.1.bb => python-gitdb_0.6.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-gitdb_0.6.1.bb => python-gitdb_0.6.4.bb} (78%)

diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.1.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
similarity index 78%
rename from meta/recipes-devtools/python/python-gitdb_0.6.1.bb
rename to meta/recipes-devtools/python/python-gitdb_0.6.4.bb
index ead93e1..f0083bd 100644
--- a/meta/recipes-devtools/python/python-gitdb_0.6.1.bb
+++ b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
@@ -7,8 +7,8 @@ DEPENDS = "python-async python-smmap"
 
 SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "daeb85a5e97d2d100fd37cf522fd65d5"
-SRC_URI[sha256sum] = "0d784ec4a75e93c8f65d4aca219c17e388a052d461714ed0edfda657e542b716"
+SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
+SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
 
 S = "${WORKDIR}/gitdb-${PV}"
 
-- 
1.7.9.5


