Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RDXwd-0007I7-HA
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 10:44:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B8cXGF020841
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 01:38:33 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 11 Oct 2011 01:38:33 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 16:38:37 +0800
Message-ID: <e4cf44bdf0b2a3b1a73e89f9a1fbeefa957087e7.1318321446.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318321446.git.kai.kang@windriver.com>
References: <cover.1318321446.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 1/1] distro_tracking_fields: update 6 packages information
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
X-List-Received-Date: Tue, 11 Oct 2011 08:44:16 -0000
Content-Type: text/plain

update the following packages distro tracking fields:
    ghostscript
    xdg-utils
    libsdl
    libxml-sax-perl
    eglibc
    liburi-perl

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7b6c4a9..a1e0b14 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5645,6 +5645,7 @@ RECIPE_LATEST_VERSION_pn-groff = "1.21"
 RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 
 RECIPE_STATUS_pn-eglibc = "red"
+RECIPE_MAINTAINER_pn-eglibc = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-lighttpd = "red"
 RECIPE_LAST_UPDATE_pn-lighttpd = "Jul 28, 2011"
@@ -5802,6 +5803,21 @@ RECIPE_LATEST_VERSION_pn-task-qte-toolchain-target = "1.0"
 RECIPE_MANUAL_CHECK_DATE_pn-task-qte-toolchain-target = "Feb 28, 2011"
 DISTRO_PN_ALIAS_pn-task-qte-toolchain-target = "Intel"
 
+RECIPE_STATUS_pn-ghostscript = "red"
+RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
+
+RECIPE_STATUS_pn-libsdl = "red"
+RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
+
+RECIPE_STATUS_pn-libxml-sax-perl = "red"
+RECIPE_MAINTAINER_pn-libxml-sax-perl = "Kai Kang <kai.kang@windriver.com>"
+
+RECIPE_STATUS_pn-liburi-perl = "red"
+RECIPE_MAINTAINER_pn-liburi-perl = "Kai Kang <kai.kang@windriver.com>"
+
+RECIPE_STATUS_pn-xdg-utils = "red"
+RECIPE_MAINTAINER_pn-xdg-utils = "Kai Kang <kai.kang@windriver.com>"
+
 RECIPE_STATUS_pn-mailx = "green"
 RECIPE_LATEST_VERSION_pn-mailx = "12.5"
 RECIPE_LAST_UPDATE_pn-mailx = "Jul 1, 2011"
-- 
1.7.5.1.300.gc565c



