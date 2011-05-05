Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTq-0003KW-MA
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2011 00:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="742664707"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2011 00:57:13 -0700
Message-Id: <937d8a605c88f76608a174e7eeed29f31564447b.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 16:45:21 +0800
Date: Thu, 05 May 2011  0:57:13 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 10/26] foomatic-filters: added to pass LSB commands check
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
X-List-Received-Date: Thu, 05 May 2011 08:00:14 -0000

From: Kang Kai <kai.kang@windriver.com>

foomatic-filters provided foomatic-rip to pass LSB commands check
Part fixes [Yocto 520]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../foomatic/foomatic-filters_4.0.7.bb             |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
new file mode 100644
index 0000000..8d70400
--- /dev/null
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
@@ -0,0 +1,23 @@
+SUMMARY = "OpenPrinting printer support - filters"
+DESCRIPTION = "Foomatic is a printer database designed to make it easier to set up \
+common printers for use with UNIX-like operating systems.\
+It provides the "glue" between a print spooler (like CUPS or lpr) and \
+the printer, by processing files sent to the printer. \
+ \
+This package consists of filters used by the printer spoolers \
+to convert the incoming PostScript data into the printer's native \
+format using a printer-specific, but spooler-independent PPD file. \
+"
+
+DEPENDS += "cups perl libxml2"
+PR = "r0"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
+SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
+
+inherit autotools
-- 
1.7.1.1



