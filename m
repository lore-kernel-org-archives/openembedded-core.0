Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SUbEn-0005PF-Op
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 12:13:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4GA3hjV010327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 03:03:43 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 16 May 2012 03:03:43 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 18:10:54 +0800
Message-ID: <a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337162056.git.xiaofeng.yan@windriver.com>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Wed, 16 May 2012 10:13:46 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Ncurses failure non-gplv3 build by race issue. So disable parallel \
make when building this package.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ae99e2c..b115e46 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -29,6 +29,8 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 # natives don't generally look in base_libdir
 base_libdir_virtclass-native = "${libdir}"
 
+PARALLEL_MAKE = ""
+
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
 # $@ the arguments to pass to configure
-- 
1.7.0.4



