Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 83076770E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:01:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 06 Nov 2015 05:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844153918"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:01:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:01:16 +0000
Message-Id: <aada8af39507762968ef74d8ea50f9e07b65e1f5.1446814828.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] meta: Fix typos in Upstream-Status labels
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
X-List-Received-Date: Fri, 06 Nov 2015 13:01:35 -0000

We need these to be consistent so they are possible to programmatically
read.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch              | 2 +-
 meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch         | 2 +-
 .../alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
index c397af2..af3989f 100644
--- a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
+++ b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
@@ -1,4 +1,4 @@
-Upsteram Status: Backport
+Upstream-Status: Backport
 
 When building on x32 systems where the default type is 32bit, make sure
 we can transparently represent 64bit integers.  Otherwise we end up with
diff --git a/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch b/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
index de126ed..fc5a71b 100644
--- a/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
+++ b/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
@@ -1,6 +1,6 @@
 [PATCH] redirect the dir of mklibsrc-log.tx
 
-Upstream-Statue: Pending
+Upstream-Status: Pending
 
 redirect mklibsrc-log.tx to builddir, not /tmp; otherwise mklibsrc-log.tx
 maybe unable to be written if other users is building autogen at the same time.
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch b/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
index f67283d..5309c4e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
@@ -1,6 +1,6 @@
 [PATCH] assume storing is success if not sound card device
 
-Upstream-Statue: Pending
+Upstream-Status: Pending
 
 Systemd will report failure when run alsa-*, if the machine has not the
 sound card. To void this annoyed message, alsa-restore/alsa-state ignore
-- 
2.1.0


