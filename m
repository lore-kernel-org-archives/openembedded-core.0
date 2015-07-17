Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF4B9760E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:31:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2Vmbt018272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:31:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:31:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 19:31:44 -0700
Message-ID: <61d915679bf8cfca48ce076d1f3a998cd21ff6cb.1437100265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] lttng-modules: 2.6.1 -> 2.6.2
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
X-List-Received-Date: Fri, 17 Jul 2015 02:31:51 -0000
Content-Type: text/plain

* Rename recipe name from lttng-modules_2.6.1.bb to lttng-modules_git.bb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...lttng-modules_2.6.1.bb => lttng-modules_git.bb} |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.6.1.bb => lttng-modules_git.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_git.bb
index 5bde7ec..54544fe 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
 
 inherit module
 
-SRCREV = "62080b2248fd8ec4111ffc379d0bc5eaf0a5c16d"
+SRCREV = "7a88f8b50696dd71e80c08661159caf8e119bf51"
+PV = "2.6.2+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
-- 
1.7.9.5


