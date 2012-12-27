Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1To7H2-0002gu-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 07:49:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBR6Y5uq020941
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 22:34:05 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 26 Dec 2012 22:34:05 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 14:34:58 +0800
Message-ID: <7d6422bb19c3e06ed1a74907c4f02133637ae597.1356514771.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1356514770.git.kai.kang@windriver.com>
References: <cover.1356514770.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3] autoconf: update RDEDENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 06:49:03 -0000
Content-Type: text/plain

The only file Glob.so provided by perl-module-file will be moved to
package perl-module-file-glob. So remove perl-module-file from RDEDENDS.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    1 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 2c46117..2fde9d4 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -14,7 +14,6 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-constant \
 		  perl-module-errno \
 		  perl-module-exporter \
-		  perl-module-file \
 		  perl-module-file-basename \
 		  perl-module-file-compare \
 		  perl-module-file-copy \
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 730c89e..7512951 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r10"
+PR = "r11"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.5.4



