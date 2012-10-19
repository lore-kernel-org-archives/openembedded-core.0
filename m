Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TPAr0-0002uJ-2Q
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:35:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9JBLd5I013156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Oct 2012 04:21:40 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 19 Oct 2012 04:21:39 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@intel.com>
Date: Fri, 19 Oct 2012 19:22:05 +0800
Message-ID: <44a03f4c870063fd0405695db1de2bfaae976a71.1350645464.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1350645464.git.kai.kang@windriver.com>
References: <cover.1350645464.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] nativesdk-autoconf: add dependencies
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
X-List-Received-Date: Fri, 19 Oct 2012 11:35:02 -0000
Content-Type: text/plain

When use toolchain gmae to compile iptables, autoreconf needs perl and
some perl modules. It is too many item to put in the .bb file, so just
add nativesdk-perl-modules to provide them.

[Yocto 3100]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    4 +++-
 meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 315e773..29d67a0 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -10,7 +10,9 @@ DEPENDS_virtclass-native = "m4-native gnu-config-native"
 DEPENDS_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 RDEPENDS_${PN} = "m4 gnu-config"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
+RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config \
+                                      nativesdk-perl nativesdk-perl-modules \
+                                     "
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 2c4c675..a4afd33 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r9"
+PR = "r10"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.5.4



