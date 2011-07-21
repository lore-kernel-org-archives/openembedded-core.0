Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8i-0001Eg-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787089"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:53:06 -0700
Message-Id: <969fc0c8d9606f49f8a01e3dd475c50365b34936.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/20] avahi: inherit perlnative
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:54 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index dc7a5ae..5695403 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -21,7 +21,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext perlnative
 
 EXTRA_OECONF = "--with-distro=debian \
              --with-avahi-priv-access-group=adm \
-- 
1.7.3.4



