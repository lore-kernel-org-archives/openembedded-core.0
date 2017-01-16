Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60E6F71C10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 16 Jan 2017 08:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="54488016"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2017 08:10:28 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5C4C76A4006;
	Mon, 16 Jan 2017 08:09:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:35 +0200
Message-Id: <9f924944826fc9fcd6c6154f9a6b891ee33f1142.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 06/14] systemd-boot: make do_efi_populate depend on do_deploy
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:28 -0000

Added dependency do_efi_populate -> systemd-boot:do_deploy to make
sure EFI artifacts are depfloyed.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/systemd-boot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 6746886..b2c808d 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,6 +11,7 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}systemd-boot:do_deploy"
+do_efi_populate[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
 EFIDIR = "/EFI/BOOT"
 
-- 
2.1.4


