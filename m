Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8EB782FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 00:52:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 25 Sep 2017 17:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="1223658173"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.78.59])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2017 17:52:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 25 Sep 2017 17:52:18 -0700
Message-Id: <20170926005218.2066-4-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170926005218.2066-1-sgw@linux.intel.com>
References: <20170926005218.2066-1-sgw@linux.intel.com>
Subject: [PATCH 3/3 v2] systemd-boot: Should not build x32
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
X-List-Received-Date: Tue, 26 Sep 2017 00:52:19 -0000

Since systemd-boot is a bootloader, it needs to be built for
the native IA instruction set size and x32 is not valid.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/systemd/systemd-boot_234.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
index 655797f3cc..7b18b25e35 100644
--- a/meta/recipes-core/systemd/systemd-boot_234.bb
+++ b/meta/recipes-core/systemd/systemd-boot_234.bb
@@ -21,6 +21,7 @@ EXTRA_OECONF = " --enable-gnuefi \
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove = "-mfpmath=sse"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST_linux-gnux32 = "null"
 
 do_compile() {
 	SYSTEMD_BOOT_EFI_ARCH="ia32"
-- 
2.11.0


