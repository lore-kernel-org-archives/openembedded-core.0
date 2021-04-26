Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.928.1619398453420840329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +SDejQOSL9c7I6Txn46LHDi9VQ3/8Ij+ndVp9DZMclptHeQsJlENNWH7kEmFSvv1+OnwtLHLhI
 A3pERGbupt/A==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818055"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818055"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: Y/V3xn/LCYmQ/JkrIlYZopNlkr5IHsyAr5egjmmy5HjVOJXtTJ/X/zBICXcCfFVh1mMs+HKNxV
 hZC+UBcl/mog==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067253"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/64] linux-yocto-dev: add features/scsi/scsi-debug.scc features/gpio/mockup.scc to KERNEL_FEATURES
Date: Mon, 26 Apr 2021 08:52:40 +0800
Message-Id: <8e1d3f54cdba087d84a938ea1fc0e0b0b501b50b.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: He Zhe <zhe.he@windriver.com>

Add features/scsi/scsi-debug.scc and features/gpio/mockup.scc to
KERNEL_FEATURES to meet ptest requirement as what we did for other
linux-yocto*.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd27f302df886c27cb424191c27152ad9d0e8d80)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8725473d1c..ee41d612fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,5 +50,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
-- 
2.30.2

