Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: J2bZxUwol29NBYggZ5iWZ84m1q8ga5BFjQ9s/lu+hae5ENEvwpGgnmybNdZObwbmIPOCTMQPy+
 k9VQ2kJYfn0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428914"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:56 -0800
IronPort-SDR: AVlu5JIhfH29DTLWGbZTX8Spwck7Ppxb3WL/49xOk2wQUFBC4h5hB42rx8XB+T/rK3mgv0s4IJ
 r+/Kwt5PW7/A==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490121"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:54 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/22] qemuboot.bbclass: Fix a typo
Date: Fri,  6 Nov 2020 14:28:16 +0800
Message-Id: <6f57e056e09271bf74f4a1ef3c9dbe594bb1eeec.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 2b5fb66344432390aa0cc199ad3f9ec2a4da26bb)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aea9a37ae327d1685cf2473a9f8f84e22352f5ec)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 824676216e..4b7532b304 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -43,7 +43,7 @@
 #                          QB_NETWORK_DEVICE_prepend might be used, since Qemu enumerates the eth*
 #                          devices in reverse order to -device arguments.
 #
-# QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
+# QB_TAP_OPT: network option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
 #
-- 
2.28.0

