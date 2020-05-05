Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jQRaOtebZ3PJZ41A4MQBQqAiPa6HG3Hd+HhZOTKaw7DTu94Y9XpjeiI6QNDrkDcnM6iFGfjXLM
 WBkGtEQIss2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:26 -0700
IronPort-SDR: vM/2MwcMJLOhry75lDCMlGBeU1oGB3qZeegZZmErRaB8r0KaIXYY5HR93v5odI+Mwk2wm/4nQp
 GmwCo64GEyRw==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144798"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 09/18] qemu: Add PACKAGECONFIG for glusterfs
Date: Tue,  5 May 2020 14:56:44 +0800
Message-Id: <b249fddf46b1e1ebeedf3c599acdadd93e6d046a.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: haiqing <haiqing.bai@windriver.com>

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ad4ff52892..4e09a9b181 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -167,6 +167,7 @@ PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
+PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs,glusterfs"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.4

