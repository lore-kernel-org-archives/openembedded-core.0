Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyou-0000j8-MB
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9Idaq021055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:39 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:39 -0700
Message-ID: <d2b417d2b8c93063b06541fec6e6bb6c476e6f42.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:38:47 +0800
Date: Thu, 18 Aug 2011 17:18:35 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] slang: add homepage and update distro tracking fields
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 09:23:26 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Add slang homepage and bump up PR.
Update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 +++--
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ad4cabe..1190359 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5731,8 +5731,9 @@ RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-slang = "green"
 RECIPE_LATEST_VERSION_pn-slang = "2.2.4"
-RECIPE_LAST_UPDATE_pn-slang = "Apr 10, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 6, 2011"
+RECIPE_LAST_UPDATE_pn-slang = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
+RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-libnewt = "green"
 RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 4bf5737..77e63da 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -7,9 +7,10 @@ The S-Lang library, provided in this package, provides the S-Lang \
 extension language.  S-Lang's syntax resembles C, which makes it easy \
 to recode S-Lang procedures in C if you need to."
 
+HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
-PR = "r5"
+PR = "r6"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
-- 
1.7.5.1.300.gc565c



