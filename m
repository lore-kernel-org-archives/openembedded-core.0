Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sc935-0005zw-Qw
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 07:44:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2012 22:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="152178203"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.144])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2012 22:34:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2012 22:34:22 -0700
Message-Id: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
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
X-List-Received-Date: Wed, 06 Jun 2012 05:44:52 -0000

Upstream Gnome projects are starting to migrate to the .xz compress format,
so we need to add this to allow recipes to override the default of .bz2 as
the upstreams make the transition.

[YOCTO #2241]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/gnomebase.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index a4209a0..80b78be 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -3,8 +3,9 @@ def gnome_verdir(v):
 	m = re.match("^([0-9]+)\.([0-9]+)", v)
 	return "%s.%s" % (m.group(1), m.group(2))
 
+GNOME_COMPRESS_TYPE ?= "bz2"
 SECTION ?= "x11/gnome"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
 
 DEPENDS += "gnome-common"
 
-- 
1.7.7.6



