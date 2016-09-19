Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 981C4602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 18:06:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2016 11:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,362,1470726000"; d="scan'208";a="10921616"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.32])
	by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2016 11:06:16 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 11:50:19 -0500
Message-Id: <1474303819-30154-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/runtime/parselogs.py: Add ignore of tsc calibration fail in x86
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
X-List-Received-Date: Mon, 19 Sep 2016 18:06:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are experimenting failures to calibrate CPU's using TSC in x86
VM's due to usage of nested KVM [1], this is a known issue [2][3]
in virtualization environments, for detail explnation see [4].

Also we already have an ignore for 'TSC Fast calibration fail'.

[1] http://errors.yoctoproject.org/Errors/Details/83684/
[2] https://bugzilla.redhat.com/show_bug.cgi?id=814231
[3] https://lists.nongnu.org/archive/html/qemu-devel/2010-09/msg01547.html
[4] https://www.kernel.org/doc/Documentation/virtual/kvm/timekeeping.txt

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index b5017c2..763c42f 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -68,6 +68,7 @@ qemux86_common = [
     'Getting VBE info block failed',
     'vbe_init() failed with -22',
     'uvesafb: mode switch failed',
+    'tsc: HPET/PMTIMER calibration failed',
 ] + common_errors
 
 ignore_errors = { 
-- 
2.1.4


