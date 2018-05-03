Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id E1F546011F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 06:43:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2018 23:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="46407088"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 02 May 2018 23:43:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 09:37:33 +0300
Message-Id: <20180503063733.26270-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180503063733.26270-1-alexander.kanavin@linux.intel.com>
References: <20180503063733.26270-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] babeltrace: switch over to git
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
X-List-Received-Date: Thu, 03 May 2018 06:43:28 -0000

Tarball directory is gone.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
index 92d86b92e8b..5d7a7efd2f5 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
@@ -10,10 +10,10 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
 "
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
-SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
+S = "${WORKDIR}/git"
+SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
-- 
2.16.1


