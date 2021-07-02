Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043471"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043471"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776426"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/22] linux-yocto/5.10: features/nft_tables: refresh config options
Date: Sat,  3 Jul 2021 00:19:53 +0800
Message-Id: <c3f2e4c0314d56053b235ed4f0455aa49b79ebed.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The nft tables feature had become out of sync with current config
options. Refreshing the support with the following commits:

Integrating the following commit(s) to linux-yocto/.:

    da478fab290 nft: add CONFIG_NFT_SOCKET
    54e2d36b291 nft: add CONFIG_NFT_TUNNEL
    6fefc38049a nft: add CONFIG_NFT_CONNLIMIT
    cb0b5fc7ed5 nft: enable NF_TABLES_NETDEV
    d36b304d614 nft: drop rbtree
    0a70fa87ee0 nft: merge chain nat types
    c226e82038a nft: merge route type to core
    79968ab78bb nft: masq options merged
    8a0bff8cc5f nft: _set is now built-ins
    5952a26c4f7 nft: consolidate _set options
    0941f794363 nf: META is now builtin
    2fcc2c1b552 nf: EXTHDR is part of core, drop config
    e909f08155d nf: ARP is bool, set to y
    3bc18ee0615 nf: make nf_tables =y
    b90241a5403 nf: set CONFIG_NF_TABLES_IPV6, since dependencies are =y
    32ae602ab4d nf: set CONFIG_NF_TABLES_IPV4, since dependencies are =y
    2a9be72daea nf: make inet_tables =y

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cce1ed5973455666c09dd56ecf3d0c373bdb3fb2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 30dbb5d832..ea2c854649 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
-SRCREV_meta ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 33339f5ca1..d73b1d0305 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
 SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9d7690dcd1..c3342da193 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
 SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
 SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
 SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.31.1

