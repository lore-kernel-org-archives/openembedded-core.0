Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UPPI9-0007Uw-56
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 05:32:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r393EvXW016006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 20:14:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 8 Apr 2013 20:14:57 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Tue, 9 Apr 2013 11:16:38 +0800
Message-ID: <cee1398450813ace46c04a4d79979df1134a59db.1365477246.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1365477246.git.kai.kang@windriver.com>
References: <cover.1365477246.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libpng12: remove prefer version and add it to lsb packagegroup
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
X-List-Received-Date: Tue, 09 Apr 2013 03:32:47 -0000
Content-Type: text/plain

Because rename libpng_1.2.50 to libpng, remove the perfer verion from
default-versions.inc and add libpng12 to lsb packagegroup.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/distro/include/default-versions.inc      |    3 ---
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 0a5b2f4..53ec2e7 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -9,6 +9,3 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
-# Set libpng default version for linuxstdbase
-PREFERRED_VERSION_libpng_linuxstdbase ?= "1.2.50"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index d692a26..cf04f0f 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -161,6 +161,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     ncurses \
     zlib \
     nspr \
+    libpng12 \
 "
 
 SUMMARY_packagegroup-core-lsb-perl = "LSB Runtime Languages (Perl)"
-- 
1.7.5.4



