Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 649A07743F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 08:25:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 03 Jun 2016 01:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="968073907"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2016 01:25:35 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0E2096A4008
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 02:13:01 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 11:25:55 +0300
Message-Id: <1464942355-23398-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] ofono: update to 1.18
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
X-List-Received-Date: Fri, 03 Jun 2016 08:25:34 -0000

1.17 -> 1.18

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.17.bb => ofono_1.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.17.bb => ofono_1.18.bb} (52%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.17.bb b/meta/recipes-connectivity/ofono/ofono_1.18.bb
similarity index 52%
rename from meta/recipes-connectivity/ofono/ofono_1.17.bb
rename to meta/recipes-connectivity/ofono/ofono_1.18.bb
index 69f3957..b070731 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.18.bb
@@ -4,7 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
-SRC_URI[md5sum] = "d280b1d267ba5bf391d2a898fea7c748"
-SRC_URI[sha256sum] = "cbf20f07fd15253c682b23c1786d517f505c3688f7c4ea93da777e1523b89635"
+SRC_URI[md5sum] = "0a6b37c8ace891cb2a7ca5d121043a0a"
+SRC_URI[sha256sum] = "53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.4.0


