Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjmWt-0007b2-1L
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 08:14:39 +0200
Received: by yxi19 with SMTP id 19so492832yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 23:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zSJq4jelBmLhYrYKvkqp/nPaRog9vcXhpgAyUP8yHrM=;
	b=fc73kIfER1DIs/R1X9uE6siu6gNPCxcL8/IiHReoMMEuE+bDo+6rK8NWzaeJqNkf/u
	M+8OHSrImaFw2luTnPN0vfMOyX8xhO0IHQwvqOATcSGCpCs1kPHvnCUp3gAdjSFfjYOq
	ZUFtknjd0U53L2TEECmmQM9zBxu2PnMAAtaw4=
Received: by 10.150.140.15 with SMTP id n15mr172534ybd.446.1311228631621;
	Wed, 20 Jul 2011 23:10:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f14sm1398877icm.3.2011.07.20.23.10.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 23:10:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:10:15 -0700
Message-Id: <1311228617-29732-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
References: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/6] uclibc: Add patch header for sync_file_range2.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 06:14:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
index b5e972e..4b85a43 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
+++ b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
@@ -1,3 +1,10 @@
+Some architectures like ppc, arm use aligned 64 bit inputs so a register is not wasted
+this then uses __NR_sync_file_range2 syscall. Implement is
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
 Index: git/libc/sysdeps/linux/common/sync_file_range.c
 ===================================================================
 --- git.orig/libc/sysdeps/linux/common/sync_file_range.c	2011-07-19 14:23:35.000000000 -0700
-- 
1.7.4.1



