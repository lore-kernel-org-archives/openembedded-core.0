Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 697847804E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:27:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2017 11:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="901938612"
Received: from swold-mobl2.jf.intel.com ([10.24.10.67])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2017 11:27:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 19 Sep 2017 11:27:34 -0700
Message-Id: <20170919182734.15741-4-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919182734.15741-1-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
Subject: [PATCH 3/3] systemd-boot: Should not build x32
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
X-List-Received-Date: Tue, 19 Sep 2017 18:27:34 -0000

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


