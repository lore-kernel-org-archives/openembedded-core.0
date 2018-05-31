Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2C19274EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 04:34:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2018 21:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,462,1520924400"; d="scan'208";a="53627359"
Received: from scng1-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.249.74.164])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2018 21:34:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 12:34:33 +0800
Message-Id: <20180531043433.19106-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180531043433.19106-1-anuj.mittal@intel.com>
References: <20180531043433.19106-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] qemux86-directdisk.wks: remove uvesafb.mode_option
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
X-List-Received-Date: Thu, 31 May 2018 04:34:41 -0000

Let this be dictated by the module parameter value being set by qemu
machine configuration.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index 1f8466af29..cfa32bd38a 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="vga=0 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.17.0


