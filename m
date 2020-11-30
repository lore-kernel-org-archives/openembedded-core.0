Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LHefEpJXk3lcMvwdo0XQNmPArC+IRA8bNGdqZfyAyINORtWEYmWDTWg5OZiuA9xLm0iTTtHXYq
 00m2N1PuV1og==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004359"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:51 -0800
IronPort-SDR: rVsvD+k62nq/IoG+jlz5KDETy9hxliJpbwZ31z7couYVk5/S0giw+jGwiyGC4qnLwXSATHXNQz
 gvTvGA/csyQw==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302614"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:50 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/21] linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
Date: Mon, 30 Nov 2020 09:11:18 +0800
Message-Id: <7c8b7ed2ece21b5473eca2144c8b9a01d0197475.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    356914747645 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73ee256e5c1194ec5d0843dee274d29cc0efe993)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 183acce226..4db2b33aef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e500e89811e268ab5c420744c41b10d12c9844a0"
+SRCREV_machine ?= "1fe1ef9c7272caf75d92b3e9166a0f29c4f06141"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f6190be8da..f6ed7f35ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2c7da912c6b5bd36d84f75e0aff4afd0814f1bd3"
-SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemuarm ?= "83d064534da33ab41108a786d917068f282a9bf2"
+SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 23fc5ea819..0330a9d159 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dbac8d2939bca0a92226cfd55543331715dd642d"
-SRCREV_machine_qemuarm64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemumips ?= "819cf265755f21768f6bb98312cb568c6db8b1e8"
-SRCREV_machine_qemuppc ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemuriscv64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemux86 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemux86-64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemumips64 ?= "bb9110d96ce8a2c56466e5b4314b93175af3d80d"
-SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemuarm ?= "879db1ae1856cf5a9fe4609fdbcbe2e3c7bade5f"
+SRCREV_machine_qemuarm64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemumips ?= "190c3ce9c2dbc709c3dcf02d8cfa80adc8a063d2"
+SRCREV_machine_qemuppc ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemuriscv64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemux86 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemux86-64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemumips64 ?= "98b1fc2eafc28e5c198e23579e38a76626c66182"
+SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.28.0

