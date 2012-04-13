Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SImlM-0001pV-Vi
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 22:06:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2012 12:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="132210543"
Received: from unknown (HELO localhost) ([10.255.12.66])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2012 12:56:05 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 14:56:03 -0500
Message-Id: <7b42c79c8ffbb283bfe036b5028c003db2a38edd.1334346682.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <e1cc1d55074d9755f1e7e20a3b07718b40cb9515.1334346682.git.tom.zanussi@intel.com>
References: <e1cc1d55074d9755f1e7e20a3b07718b40cb9515.1334346682.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1334346682.git.tom.zanussi@intel.com>
References: <cover.1334346682.git.tom.zanussi@intel.com>
Subject: [PATCH 2/2] systemtap: disable document generation by default
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
X-List-Received-Date: Fri, 13 Apr 2012 20:06:33 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Building the systemtap documentation adds significantly to the build
time, so disable it by default.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 1d2c9f3..91bccd1 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -20,6 +20,10 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_avahi_client=no \
 	     ac_cv_file__usr_include_avahi_common=no "
 
+STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
+
+EXTRA_OECONF += "${STAP_DOCS} "
+
 inherit autotools gettext
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4



