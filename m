Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE85260670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 19:29:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Feb 2015 11:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,654,1418112000"; d="scan'208";a="683974443"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2015 11:29:21 -0800
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 26 Feb 2015 11:29:21 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX113.amr.corp.intel.com (10.22.240.9) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 26 Feb 2015 11:29:21 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.156) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 26 Feb 2015 11:29:20 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2015 16:29:14 -0300
Message-ID: <1424978954-25411-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.156]
Subject: [PATCH] mkefidisk: change filesystem to be writeable on grub
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
X-List-Received-Date: Thu, 26 Feb 2015 19:29:23 -0000
Content-Type: text/plain

This patch changes grub configuration so the filesystem will be writeable
instead, just read only when running the script.
---
 scripts/contrib/mkefidisk.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index b96b7d4..9b84831 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -342,7 +342,7 @@ if [ -e "$GRUB_CFG" ]; then
 	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
 
 	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
-	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUB_CFG
+	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw rootwait quiet @" $GRUB_CFG
 fi
 
 # Look for a gummiboot installation
-- 
1.9.1


