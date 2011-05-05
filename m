Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTZ-0002qr-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:59:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="918292978"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2011 00:57:16 -0700
Message-Id: <7f6d6ff09b1e1f426a7280dcdd8e4a7d4a1aab57.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 14:32:45 +0100
Date: Thu, 05 May 2011  0:57:16 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 12/26] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Thu, 05 May 2011 07:59:57 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 4445081..c80faaa 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -131,6 +131,25 @@ do_install_basefilesissue () {
  	fi
 }
 
+<<<<<<< HEAD
+=======
+do_install_append_nylon() {
+	printf "" "" >${D}${sysconfdir}/resolv.conf
+	rm -r ${D}/mnt/*
+	rm -r ${D}/media
+	rm -rf ${D}/tmp
+	ln -sf /var/tmp ${D}/tmp
+}
+
+do_install_append_slugos() {
+	printf "" "" >${D}${sysconfdir}/resolv.conf
+	rm -r ${D}/mnt/*
+	rmdir ${D}/home/root
+	install -m 0755 -d ${D}/root
+	ln -s ../root ${D}/home/root
+}
+
+>>>>>>> d67f12d... Remove machine-specific metadata for machines no longer in oe-core
 do_install_append_linuxstdbase() {
 	for d in ${dirs3755}; do
                 install -m 0755 -d ${D}$d
-- 
1.7.1.1



