Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F98C75CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F1hs007642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:54 -0700
Message-ID: <7d5bbc78be038866b68264f1527e4a3bb0b2cfa5.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] python: remove invalid sed command
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

There is no ccache in Makefile any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb |    2 --
 meta/recipes-devtools/python/python_2.7.9.bb  |    3 ---
 2 files changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 7eb99b1..3efa7de 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -92,8 +92,6 @@ do_compile() {
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache\ ,'$(CCACHE) ', Makefile
 
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 7918550..19190c3 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -59,9 +59,6 @@ do_compile() {
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache\ ,'$(CCACHE) ', Makefile
-
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
 
-- 
1.7.9.5


