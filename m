Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA34617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgGmh001365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:52 -0400
Message-ID: <67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] lttng-modules: re-enable ARM builds
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:35 -0000
Content-Type: text/plain

With lttng 2.4.2 and gcc 4.9, we can now enable lttng-modules for ARM.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index 5a99a5adae8b..d87374163556 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -12,8 +12,7 @@ inherit module
 
 SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
 
-# lttng currently blacklists arm with gcc-4.8
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-- 
1.8.1.2


