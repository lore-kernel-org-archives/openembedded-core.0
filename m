Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8562577D07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UFRg3W010221; 
	Thu, 30 Mar 2017 16:27:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id houTABJuc3ou; Thu, 30 Mar 2017 16:27:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UFRepb010206
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 16:27:41 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctbzA-00075K-AS; Thu, 30 Mar 2017 16:27:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 16:27:38 +0100
Message-Id: <1490887659-27179-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490887659-27179-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] linux-libc-headers: Drop 4.4
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
X-List-Received-Date: Thu, 30 Mar 2017 15:27:45 -0000

We've been using 4.10 for a while now, I think 4.4 was accidentally left
behind so clean it up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
deleted file mode 100644
index 3763dc0..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require linux-libc-headers.inc
-
-SRC_URI_append_libc-musl = "\
-    file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
-    file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
-    file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
-   "
-SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
-SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-- 
2.7.4


