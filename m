Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 743D27858F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:49:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2018 05:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,371,1517904000"; d="scan'208";a="215609407"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2018 05:49:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 15:43:06 +0300
Message-Id: <20180328124308.14893-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 1/3] linux-libc-headers: refresh 0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
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
X-List-Received-Date: Wed, 28 Mar 2018 12:49:42 -0000

It's only applied with musl and so was missed in the big batch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
index a3fa59001d2..064a39193de 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
@@ -80,12 +80,11 @@ Index: linux-4.15/include/uapi/linux/libc-compat.h
  
  /* Definitions for if.h */
  #ifndef __UAPI_DEF_IF_IFCONF
-@@ -262,7 +253,7 @@
+@@ -262,6 +253,6 @@
  #define __UAPI_DEF_XATTR		1
  #endif
  
 -#endif /* __GLIBC__ */
 +#endif /* __KERNEL__ */
  
- /* Definitions for if_ether.h */
- /* allow libcs like musl to deactivate this, glibc does not implement this. */
+ #endif /* _UAPI_LIBC_COMPAT_H */
-- 
2.16.1


