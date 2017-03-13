Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B26B776AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 02:34:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D2Ytnq020105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 19:34:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 19:34:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Mar 2017 10:35:44 +0800
Message-ID: <ff2d00ed30b887122389996161d3079b175accfa.1489372509.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489372509.git.Qi.Chen@windriver.com>
References: <cover.1489372509.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc-target.inc: create symlinks for gcov and gcov-tool
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
X-List-Received-Date: Mon, 13 Mar 2017 02:34:56 -0000
Content-Type: text/plain

Create symlinks for gcov and gcov-tool and that they can be used trivially
on target.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index f436fa2..7fbcccc 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -179,6 +179,8 @@ do_install () {
 	ln -sf ${TARGET_PREFIX}g++ g++
 	ln -sf ${TARGET_PREFIX}gcc gcc
 	ln -sf ${TARGET_PREFIX}cpp cpp
+	ln -sf ${TARGET_PREFIX}gcov gcov
+	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool
 	install -d ${D}${base_libdir}
 	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
 	ln -sf g++ c++
-- 
1.9.1


