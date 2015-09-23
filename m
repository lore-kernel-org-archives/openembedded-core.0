Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA86B76FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:32:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2015 11:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="811415663"
Received: from nravicha-mobl.amr.corp.intel.com (HELO
	alimonb-MOBL1.amr.corp.intel.com) ([10.254.117.132])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2015 11:32:10 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 13:29:26 -0500
Message-Id: <1443032966-19802-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443032966-19802-1-git-send-email-anibal.limon@linux.intel.com>
References: <1443032966-19802-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] kmod: Change SRCREV to fix return code in error path
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
X-List-Received-Date: Wed, 23 Sep 2015 18:32:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Systemd is failing trying to load kdbus [1] because kmod have
an error in return code when try to insert module [2].

This change of SRCREV is a MINOR one only include the fix
described.

[YOCTO #8377]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8377#c0
[2] http://lists.freedesktop.org/archives/systemd-devel/2015-July/033549.html

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index e9aa67d..71ffdf8 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc
 
-SRCREV = "0d833715eaa65636dda2705b89359a1e0154dc58"
+SRCREV = "114ec87c85c35a2bd3682f9f891e494127be6fb5"
 # Lookout for PV bump too when SRCREV is changed
 PV = "21+git${SRCPV}"
 
-- 
1.9.1


