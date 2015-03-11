Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4231E73ACC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2B8ZhOU022281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:35:44 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 01:35:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 01:35:40 -0700
Message-ID: <65b213ba776607778e25b5dea91eab036a62b8ae.1426062917.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426062917.git.liezhi.yang@windriver.com>
References: <cover.1426062917.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] kernelsrc.bbclass: fix KERNEL_VERSION
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
X-List-Received-Date: Wed, 11 Mar 2015 08:35:43 -0000
Content-Type: text/plain

The kernel-abiversion is now in STAGING_KERNEL_BUILDDIR not in S.

Fixed rpm pkg like perf: (note the None version)
perf-None-r9.qemux86.rpm

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernelsrc.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 4208eff..9efd46a 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -4,7 +4,7 @@ do_unpack[depends] += "virtual/kernel:do_patch"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
-KERNEL_VERSION = "${@get_kernelversion_file("${S}")}"
+KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
-- 
1.7.9.5


