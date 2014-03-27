Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0346F9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPQHp026230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:26 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:25:06 -0400
Message-ID: <3e22f60e1bba64b5c626555382222fb2c4abeb6f.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 11/13] linux-libc-headers: add 3.14 libc headers
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:28 -0000
Content-Type: text/plain

Introduce the 3.14 linux-libc-headers recipe, now that the 3.14 kernel is
available, and the default for the qemu reference BSPs.

The three patches which were required for the previous 3.10 libc-headers
are not required for 3.14 and can be ignored.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers/linux-libc-headers_3.14.bb           | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
new file mode 100644
index 000000000000..e881d16bfcdb
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
@@ -0,0 +1,13 @@
+require linux-libc-headers.inc
+
+# The hardcoded -rc8 is temporary, we are pretending that 3.14-rc is the full 3.14
+# tree, to avoid needing to shuffle the recipe name when it releases.
+FETCH_VER="3.14-rc8"
+
+S="${WORKDIR}/linux-${FETCH_VER}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v3.x/testing/linux-${FETCH_VER}.tar.xz"
+
+SRC_URI[md5sum] = "f7295bcc13c47b6bee924dde5057f1e8"
+SRC_URI[sha256sum] = "20b3a956e2b5b56b5addcf46a92722eb96830e2d24efe8ea11ce1ec4a1a874ba"
+
+
-- 
1.8.1.2


