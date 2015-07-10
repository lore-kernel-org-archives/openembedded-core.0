Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD0E65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F23U007645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:56 -0700
Message-ID: <0047e43da6b1002b7550eb03ea08983bb53ef743.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] perf: remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

The current kernel supports WERROR now, and there is no Werror in
tools/perf/Makefile, remove both sed commands.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index eb27374..0cadcdc 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -120,12 +120,6 @@ do_configure_prepend () {
     rm -rf ${B}/
     mkdir ${B}/
 
-    #kernels before 3.1 do not support WERROR env variable
-    sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
-    if [ -e "${S}/tools/perf/config/Makefile" ]; then
-        sed -i 's,-Werror ,,' ${S}/tools/perf/config/Makefile
-    fi
-
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
     # build, with a 64 bit multilib, the arch won't match and the detection of a 
-- 
1.7.9.5


