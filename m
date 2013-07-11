Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C06862009
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 02:49:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6B2nFRA025905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jul 2013 19:49:15 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 10 Jul 2013 19:49:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 11 Jul 2013 10:48:58 +0800
Message-ID: <4b68b770c8ca8ef2cd231b176167502025c695f2.1373510675.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373510675.git.kai.kang@windriver.com>
References: <cover.1373510675.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] packagegroup-core-tools-profile: exclude systemtap and valgrind for mips64
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
X-List-Received-Date: Thu, 11 Jul 2013 02:49:14 -0000
Content-Type: text/plain

systemap and valgrind are not buildable for mips64, so exclude them for
mips64 from packagegroup-core-tools-profile.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index bb1b78b..9eb1458 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -38,6 +38,7 @@ PROFILETOOLS = "\
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 SYSTEMTAP_mips = ""
+SYSTEMTAP_mips64 = ""
 SYSTEMTAP_aarch64 = ""
 
 # lttng-ust uses sched_getcpu() which is not there on uclibc
@@ -64,6 +65,7 @@ BABELTRACE_aarch64 = ""
 VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
 VALGRIND_mips = ""
+VALGRIND_mips64 = ""
 VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 
-- 
1.8.1.2


