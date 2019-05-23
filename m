Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B81E17E43C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:18:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4N9H7Cg006437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 02:17:17 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 23 May 2019 02:16:56 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 23 May 2019 16:25:57 +0800
Message-ID: <20190523082558.3805-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190523082558.3805-1-kai.kang@windriver.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Thu, 23 May 2019 09:18:03 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Move configurations from local.conf.sample.extended to local.conf.sample
to make systemd as default init manager for poky.

[YOCTO #13031]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-poky/conf/local.conf.sample          | 9 +++++++++
 meta-poky/conf/local.conf.sample.extended | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 9068e567dc..3a07105e44 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -249,3 +249,12 @@ PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 # track the version of this file when it was generated. This can safely be ignored if
 # this doesn't mean anything to you.
 CONF_VERSION = "1"
+
+#
+# Use systemd for system initialization
+#
+DISTRO_FEATURES_append = " systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index 26603debe6..e20fc5dbf3 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -377,12 +377,3 @@ DISTRO_FEATURES_remove = "x11"
 #VIRTUAL-RUNTIME_initscripts = "initscripts"
 #VIRTUAL-RUNTIME_keymaps = "keymaps"
 #DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-
-#
-# Use systemd for system initialization
-#
-#DISTRO_FEATURES_append = " systemd"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-#VIRTUAL-RUNTIME_login_manager = "shadow-base"
-#VIRTUAL-RUNTIME_init_manager = "systemd"
-#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
-- 
2.18.0


