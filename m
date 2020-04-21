Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.414.1587430214285275147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 17:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: 6h8iQOOcw9sMAWApkfBbq5qIf0Xll2hEY3mcWIeOC0QGMDW4aztb47HTppPLZYg0tw2iFT/kw6
 VdfFygVTi1QA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 17:50:12 -0700
IronPort-SDR: RRhtvEWP8gDoq68DmVM/DLdkANwdhYl9/zKadlWnDireLbwcRNA+9f582LrtLYDM/JQU5D0Zqf
 OX5JGJowJeQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
   d="scan'208";a="279437832"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2020 17:50:11 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] enhanced weston automated tests
Date: Tue, 21 Apr 2020 08:50:08 +0800
Message-Id: <1587430209-55521-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

v02:
 - add retry checking for wayland processes up to 5 times, as
   it took different amount of time to initialize wayland 
   compositor inside qemu created by host machine

v03:
 - previous patch missed the DISTRO_FEATURES_remove = "x11"
   configuration in the building of core-image-weston, where
   the test was using x11 DISPLAY for initializing new 
   wayland compositor
 - replace the environment setup 'export DISPLAY=:0' which 
   use x11 with 'export WAYLAND_DISPLAY=wayland-0' since the
   target core-image-weston had removed x11 
 - include logging for wayland compositor initialization 
   to track detail for debugging in case test fail

Yeoh Ee Peng (1):
  oeqa/runtime/weston: Enhance weston tests

 meta/lib/oeqa/runtime/cases/weston.py | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

-- 
2.7.4

