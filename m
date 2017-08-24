Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD1E782F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 13:35:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 06:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,421,1498546800"; d="scan'208";a="1187719543"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2017 06:35:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 16:32:25 +0300
Message-Id: <20170824133226.43386-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824133226.43386-1-alexander.kanavin@linux.intel.com>
References: <20170824133226.43386-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] qemu: fix upstream version check
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
X-List-Received-Date: Thu, 24 Aug 2017 13:35:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
index 08eaf197375..204e36fd2e6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0001-osdep-Add-runtime-OFD-lock-detection.patch \
            file://0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch \
            "
+UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
+
 
 SRC_URI_append_class-native = " \
             file://fix-libcap-header-issue-on-some-distro.patch \
-- 
2.14.1


