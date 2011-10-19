Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGP3F-0008AE-VG
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 07:50:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J5j2xF016944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2011 22:45:02 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 22:45:02 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 13:45:58 +0800
Message-ID: <0220f31ffe3bbaca8fd7cdd25d563e2026b8eddb.1318995438.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318995438.git.kai.kang@windriver.com>
References: <cover.1318995438.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 5/5] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Wed, 19 Oct 2011 05:50:54 -0000
Content-Type: text/plain

Update packages tracking fields including ghostscript, libsdl,
libxml-sax-perl and liburi-perl.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index abc2cbf..ef0c49d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5867,6 +5867,24 @@ RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jul 27, 2011"
 
+RECIPE_STATUS_pn-libxml-sax-perl = "green"
+RECIPE_LATEST_VERSION_pn-libxml-sax-perl = "0.99"
+RECIPE_MAINTAINER_pn-libxml-sax-perl = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-libxml-sax-perl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libxml-sax-perl = "Oct 19, 2011"
+
+RECIPE_STATUS_pn-liburi-perl = "green"
+RECIPE_LATEST_VERSION_pn-liburi-perl = "1.59"
+RECIPE_MAINTAINER_pn-liburi-perl = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-liburi-perl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-liburi-perl = "Oct 19, 2011"
+
+RECIPE_STATUS_pn-ghostscript = "red"
+RECIPE_LATEST_VERSION_pn-ghostscript = "9.04"
+RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-ghostscript = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn = "Oct 19, 2011"
+
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
 RECIPE_MAINTAINER_pn-createrepo = "Saul Wold <sgw@linux.intel.com>"
@@ -5943,7 +5961,13 @@ RECIPE_MAINTAINER_pn-linux-yocto = "Darren Hart <dvhart@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
 RECIPE_MAINTAINER_pn-linux-yocto-rt = "Darren Hart <dvhart@linux.intel.com>"
 
+RECIPE_STATUS_pn-libsdl = "green"
+RECIPE_LATEST_VERSION_pn-libsdl = "1.2.14"
+RECIPE_LAST_UPDATE_pn-libsdl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
+
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
-- 
1.7.5.1.300.gc565c



