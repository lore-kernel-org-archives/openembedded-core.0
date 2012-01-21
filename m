Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RoUVh-0003rF-NQ
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:33:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98235463"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:25:22 -0800
Message-Id: <f420586954a9aeb2db1ca5404ee23d601ef68ba6.1327127051.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
References: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1327127051.git.nitin.a.kamble@intel.com>
References: <cover.1327127051.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/4] guile: fix a quote in description
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
X-List-Received-Date: Sat, 21 Jan 2012 06:33:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index 60fbe32..f6f7a8e 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
  Guile is a library designed to help programmers create flexible applications.\
  Using Guile in an application allows the application's functionality to be\
  extended by users or other programmers with plug-ins, modules, or scripts.\
- Guile provides what might be described as "practical software freedom,"\
+ Guile provides what might be described as 'practical software freedom,'\
  making it possible for users to customize an application to meet their\
  needs without digging into the application's internals."
 
@@ -24,7 +24,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
 SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.6.4



