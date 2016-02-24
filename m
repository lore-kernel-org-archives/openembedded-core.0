Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39C37772F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 20:30:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2016 12:30:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="752638324"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by orsmga003.jf.intel.com with ESMTP; 24 Feb 2016 12:30:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 09:29:55 +1300
Message-Id: <c858c420cac09fe1e0744fe519f3d1b5f87baf65.1456345722.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456345722.git.paul.eggleton@linux.intel.com>
References: <cover.1456345722.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456345722.git.paul.eggleton@linux.intel.com>
References: <cover.1456345722.git.paul.eggleton@linux.intel.com>
Subject: [jethro][PATCH 1/1] os-release: put double-quotes around variable contents
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 20:30:39 -0000

From: Craig McQueen <craig.mcqueen@innerrange.com>

This makes the resulting /etc/os-release file have valid shell
assignment syntax. This makes it loadable by a shell script, using the
'source' command:

    source /etc/os-release

(From OE-Core master rev: f6e0ea000fa3b9a726ab56500f643f9902371618)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index c690b82..df19ca2 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -29,7 +29,7 @@ python do_compile () {
         for field in d.getVar('OS_RELEASE_FIELDS', True).split():
             value = d.getVar(field, True)
             if value:
-                f.write('{0}={1}\n'.format(field, value))
+                f.write('{0}="{1}"\n'.format(field, value))
     if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
         rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
         bb.utils.mkdirhier('${B}/rpm-gpg')
-- 
2.5.0


