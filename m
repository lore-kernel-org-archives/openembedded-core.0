Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U0D6G-0008NB-CJ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:27:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Jan 2013 07:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="196280512"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 07:11:43 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:12:34 +0200
Message-Id: <ec539703f5d43d81606d305dcb431ee1a96a5bb6.1359470548.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
Subject: [PATCH v4 1/3] autotools.bbclass: add EXTRACONFFUNCS variable
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
X-List-Received-Date: Tue, 29 Jan 2013 15:28:01 -0000

- add EXTRACONFFUNCS variable in order to make it possible
to inject tasks after autotools_preconfigure

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/autotools.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 9d1a299..b19a871 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -122,7 +122,9 @@ autotools_postconfigure(){
 	fi
 }
 
-do_configure[prefuncs] += "autotools_preconfigure"
+EXTRACONFFUNCS ??= ""
+
+do_configure[prefuncs] += "autotools_preconfigure ${EXTRACONFFUNCS}"
 do_configure[postfuncs] += "autotools_postconfigure"
 
 autotools_do_configure() {
-- 
1.7.11.7



