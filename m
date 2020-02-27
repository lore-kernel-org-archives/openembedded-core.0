Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03B39606AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:05:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so1190626pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VPWVEXv9gjKqSpoGh1cnZWEjkOCq2RthSfQcuTOEMCc=;
	b=lzJYQsYUfq5GOBddCEVdgOuFbK2OZJs6gvK7vMO+ozCjwiOEuDzEOMwFXR7e7s4Pnn
	Ea/6VluEdcL4t12IsTbOIgm65Ousy1w4XP0im6BQKmUAG3lXSalooD1Itiy2YAbE+bRO
	kxMt/jniFd5CMfnOnuY0HpPWwddyAIWI9mj5kpeQ3hAxMSYa/EMdgtYQAnbEPiLZlv6I
	fTeaIhERosekqoIk9xtvQ/C5aYcDG4rOcGIo5eTMi4ZGtohakhq7xEUGu7DuHGtUas3T
	eGMiNYxouMZhtyxKkaLaH7CNmopghJ+WNPnApyZu8NecJcACY/HQAlUOxITk8ILwD7DY
	eATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VPWVEXv9gjKqSpoGh1cnZWEjkOCq2RthSfQcuTOEMCc=;
	b=CkpvXPjvhECNt2kTlfumBn7UBxiUuqs9Cy6jVbJxN3FYGtElkW3+ETsqVO8Kl3XreE
	Dd/+MADsY6p1tJtXCv+UEAtR8QMZchE7zn7/s+BRLREjcKKmXjWZy6cy0XOnyR8r40WG
	wjW1XRyrBD2YUifG0t2W6N9vw4WB9OOSu/CV8cj8C1zIfRnOkp0XeS+/LZnCa5pVjwHw
	lzqf8GXfqoAulrkhqU6GpnKy1CMCr1IcZ5yYw7TIRqyOgDx4cuFOTg4bkK2wRjDndhHl
	UFPLSWonADQLHzsBuAVsLv+MyZIyQMLL4MDbeGYVgZ/mwdw+49WNTcHwGon0aUDIx8ae
	DrDg==
X-Gm-Message-State: APjAAAU6WlLBJ2Bs5EtBVrJ+d5H1WmPSFxioWCZIP3ccT1RBAHZvmGuh
	P3AAXehk46SQAMRedCM2UIDun9/89eI=
X-Google-Smtp-Source: APXvYqy5m0sT93HdzieYhKshyHz7uifOnPT6vAxq4obqn/slKxSLRxHwsdkYiMEs9MyhiBQ6y/LTNA==
X-Received: by 2002:a63:ef03:: with SMTP id u3mr2827803pgh.77.1582790753448;
	Thu, 27 Feb 2020 00:05:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	188sm1431753pfa.62.2020.02.27.00.05.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 00:05:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 00:05:55 -0800
Message-Id: <20200227080558.3819138-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227080558.3819138-1-raj.khem@gmail.com>
References: <20200227080558.3819138-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] linux-libc-headers: Drop patches manipulating __UAPI_DEF_ETHHDR
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
X-List-Received-Date: Thu, 27 Feb 2020 08:05:53 -0000
Content-Transfer-Encoding: 8bit

__UAPI_DEF_ETHHDR has been defined in kernel UAPI [1]

and musl already defined it to 0 via [2]

So these patches can now be dropped.

[1] https://patchwork.ozlabs.org/patch/872502/
[2] https://git.musl-libc.org/cgit/musl/commit/?id=b583c5d3b4cc2c54c68eef5eb7855ecfacee8bfc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...muslc-ethhdr-protection-to-uapi-file.patch | 31 -------------------
 ...revent-redefinition-of-struct-ethhdr.patch | 30 ------------------
 .../linux-libc-headers_5.4.bb                 |  2 --
 3 files changed, 63 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
deleted file mode 100644
index 68b244698f..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 897736166fd709906a5fdf16eb23f8fddff770b5 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Thu, 1 Mar 2018 18:31:01 -0500
-Subject: [PATCH] if_ether: move muslc ethhdr protection to uapi file
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-Upstream-Status: Pending
----
- include/uapi/linux/if_ether.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
-index 153c9c2..7b69b73 100644
---- a/include/uapi/linux/if_ether.h
-+++ b/include/uapi/linux/if_ether.h
-@@ -149,6 +149,12 @@
-  *	This is an Ethernet frame header.
-  */
- 
-+#ifdef _NETINET_IF_ETHER_H /* musl */
-+#define __UAPI_DEF_ETHHDR 0
-+#else /* glibc uses __NETINET_IF_ETHER_H, and includes the kernel header. */
-+#define __UAPI_DEF_ETHHDR 1
-+#endif
-+
- /* allow libcs like musl to deactivate this, glibc does not implement this. */
- #ifndef __UAPI_DEF_ETHHDR
- #define __UAPI_DEF_ETHHDR		1
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
deleted file mode 100644
index fb7e1de17a..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 75ba4a547282f91d653872a4bba5f5eae234ea6c Mon Sep 17 00:00:00 2001
-From: rofl0r <retnyg@gmx.net>
-Date: Wed, 22 Jan 2014 00:57:48 +0100
-Subject: [PATCH 2/3] libc-compat.h: prevent redefinition of struct ethhdr
-
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted
-
- include/uapi/linux/if_ether.h    | 4 +++-
- include/uapi/linux/libc-compat.h | 6 ++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-Index: linux-4.15/include/uapi/linux/libc-compat.h
-===================================================================
---- linux-4.15.orig/include/uapi/linux/libc-compat.h	2018-02-05 17:40:42.338370731 -0500
-+++ linux-4.15/include/uapi/linux/libc-compat.h	2018-02-05 17:40:42.334370603 -0500
-@@ -51,6 +51,12 @@
- 
- #ifndef __KERNEL__ /* we're used from userspace */
- 
-+#ifdef _NETINET_IF_ETHER_H /* musl */
-+#define __UAPI_DEF_ETHHDR 0
-+#else /* glibc uses __NETINET_IF_ETHER_H, and includes the kernel header. */
-+#define __UAPI_DEF_ETHHDR 1
-+#endif
-+
- /* Coordinate with libc net/if.h header. */
- #if defined(_NET_IF_H)
- 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
index 50377394f3..8a12103ee5 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
@@ -2,10 +2,8 @@ require linux-libc-headers.inc
 
 SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
-    file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
-    file://0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch \
     file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
    "
 
-- 
2.25.1


