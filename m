Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86258701A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 05:53:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H5rN25012796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 22:53:23 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 22:53:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 13:53:09 +0800
Message-ID: <98c3e84cfd89aeaaaa853102374314f63af330bc.1405575611.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405575611.git.hongxu.jia@windriver.com>
References: <cover.1405575611.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] busybox: enable CONFIG_FEATURE_AWK_LIBM by default
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
X-List-Received-Date: Thu, 17 Jul 2014 05:53:26 -0000
Content-Type: text/plain

It was required by tzselect which is provided by eglibc utils.
The eglibc is a fundamental package, so enable math functions
of awk is reasonable.

Here is the error if we not enable that:
...
root@qemuarm:~# tzselect -c +4852+00220
awk: cmd. line:39: Math support is not compiled in
...

[YOCTO #6544]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 47eca21..0107231 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -377,7 +377,7 @@ CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
 CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
 CONFIG_AWK=y
-# CONFIG_FEATURE_AWK_LIBM is not set
+CONFIG_FEATURE_AWK_LIBM=y
 CONFIG_CMP=y
 CONFIG_DIFF=y
 # CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
-- 
1.8.1.2


