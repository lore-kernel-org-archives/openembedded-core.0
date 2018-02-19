Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E8B837881C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="176393973"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 19 Feb 2018 00:35:04 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id CC51F5802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:03 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:04 +0200
Message-Id: <1519029438-11092-14-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 13/27] util-linux: define bashcompletiondir
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:03 -0000

After moving to pkgconf, util-linux package qa test fails without it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 248e8be..0104ca1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -50,6 +50,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --enable-libuuid --enable-libblkid --enable-fsck \
                        --disable-minix --disable-bfs --without-udev \
                        usrsbin_execdir='${sbindir}' \
+                       --with-bashcompletiondir='${datadir}/bash-completion/' \
 "
 
 EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
-- 
2.4.0


