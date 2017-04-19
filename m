Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2AB71C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 21:25:43 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 14:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="91528956"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.141])
	by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2017 14:25:43 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 16:30:07 -0500
Message-Id: <1492637407-15757-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1492637407-15757-1-git-send-email-anibal.limon@linux.intel.com>
References: <1492637407-15757-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: richerd.purdie@linuxfoundation.com, flavio.santes@intel.com,
	saul.wold@intel.com
Subject: [PATCH 2/2] kexec-tools: Add again the x32 patch
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
X-List-Received-Date: Wed, 19 Apr 2017 21:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kexec-tools upstream previously integrated the patch into master rev
587778e24c9 but for a bug report it was remove [1][2], after an intensive
testing on OpenSUSE 13.1 64 bits and in poky variants: qemux86 [3],
qemux86-64-x32 [4] and generix86-64 (minnow) [5] it worked.

I think that the upstream revert was due to some integration issue while
testing into OpenSUSE [2], i will try to push again to upstream.

[1] http://lists.infradead.org/pipermail/kexec/2015-March/013482.html
[2] https://github.com/horms/kexec-tools/commit/5041d45b1c6b66a0e6c48f6121c24cd9be506c68
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11050#c3
[4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11050#c4
[5] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11050#c4

[YOCTO #11050]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index 1062457..90d5985 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -18,6 +18,7 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.g
             file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
             file://0001-x86-x86_64-Fix-format-warning-with-die.patch \
             file://0002-ppc-Fix-format-warning-with-die.patch \
+            file://kexec-x32.patch \
          "
 
 SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
-- 
2.1.4


