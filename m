Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qgi8T-00017N-Bi
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:56:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="29496864"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 11:52:39 -0700
Message-Id: <182b882de84ecedd28205d998ffd5796270de4e7.1310496679.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <664a92ced9bc0614d5ba98244bfdfc32e3e2b637.1310496679.git.nitin.a.kamble@intel.com>
References: <664a92ced9bc0614d5ba98244bfdfc32e3e2b637.1310496679.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310496679.git.nitin.a.kamble@intel.com>
References: <cover.1310496679.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] eglibc: fix installed but not packaged files
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
X-List-Received-Date: Tue, 12 Jul 2011 18:56:45 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes these package QA warnings:

WARNING: For recipe eglibc, the following files were installed but not shipped in any package:
WARNING:   /etc/localtime

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index dd40af1..03f2205 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -88,6 +88,10 @@ DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through
 
 inherit libc-common
 
+do_install_append () {
+	rm -f ${D}${sysconfdir}/localtime
+}
+
 do_install_locale () {
 	dest=${D}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
-- 
1.7.4.4



