Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9BE7108D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:38:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T8cfI8012862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:38:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 01:38:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 01:38:39 -0700
Message-ID: <f840b13c5d0cb073e74d2474122770caa5ae0241.1409300104.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409300104.git.liezhi.yang@windriver.com>
References: <cover.1409300104.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] local.conf.sample.extended: update for RPM_PREFER_ELF_ARCH
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
X-List-Received-Date: Fri, 29 Aug 2014 08:38:41 -0000
Content-Type: text/plain

Updated as the rpm upstream suggested:
- RPM_PREFER_COLOR -> RPM_PREFER_ELF_ARCH
- 3 -> 4

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index f7d8798..3211997 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -145,12 +145,12 @@
 #MULTILIBS = "multilib:lib32"
 #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 
-# Set RPM_PREFER_COLOR to configure preferred ABI when using rpm packaging
+# Set RPM_PREFER_ELF_ARCH to configure preferred ABI when using rpm packaging
 # backend to generate a rootfs, choices are:
 # 1: ELF32 wins
 # 2: ELF64 wins
-# 3: ELF64 N32 wins (for mips64 or mips64el only)
-#RPM_PREFER_COLOR ?= "2"
+# 4: ELF64 N32 wins (for mips64 or mips64el only)
+#RPM_PREFER_ELF_ARCH ?= "2"
 
 # The network based PR service host and port
 # Uncomment the following lines to enable PRservice.
-- 
1.7.9.5


