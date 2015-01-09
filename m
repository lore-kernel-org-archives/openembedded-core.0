Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9176472ACC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 05:33:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t095XhYE010711
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Jan 2015 21:33:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 21:33:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Jan 2015 21:33:39 -0800
Message-ID: <dddb23918ea58dc6676fd02b20ad5ca6df2586aa.1420781433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420781433.git.liezhi.yang@windriver.com>
References: <cover.1420781433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] python-git: upgrade to 0.3.3
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
X-List-Received-Date: Fri, 09 Jan 2015 05:33:48 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...python-git_0.3.2.RC1.bb => python-git_0.3.3.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_0.3.2.RC1.bb => python-git_0.3.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb b/meta/recipes-devtools/python/python-git_0.3.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
rename to meta/recipes-devtools/python/python-git_0.3.3.bb
index 02a0eac..860c37b 100644
--- a/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
+++ b/meta/recipes-devtools/python/python-git_0.3.3.bb
@@ -10,8 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 DEPENDS = "python-gitdb"
 
 SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
-SRC_URI[md5sum] = "849082fe29adc653a3621465213cab96"
-SRC_URI[sha256sum] = "fd6786684a0d0dd7ebb961da754e3312fafe0c8e88f55ceb09858aa0af6094e0"
+
+SRC_URI[md5sum] = "c9fdde02c476c11168fd620659496aba"
+SRC_URI[sha256sum] = "08193acf4e22b57a471cde3748ebce7c17e0f15f1e5042db74ca2c5e9e3e4db5"
 
 S = "${WORKDIR}/GitPython-${PV}"
 
-- 
1.7.9.5


