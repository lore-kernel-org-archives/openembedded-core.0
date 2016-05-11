Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90057731D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 03:07:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4B37FTT004197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 20:07:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 20:07:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 20:07:09 -0700
Message-ID: <9ae38c3b24b387b02541142d40343d1dd0411c88.1462935990.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1462935990.git.liezhi.yang@windriver.com>
References: <cover.1462935990.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] gdb: fix QA warning (uClibc)
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
X-List-Received-Date: Wed, 11 May 2016 03:07:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

WARNING: QA Issue: gdb rdepends on libiconv, but it isn't a build dependency? [build-deps]

We already have virtual/libiconv which is set appropriately
in all environments, so let's use it to fix the issue.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 166ba8e..303373d 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE = "GPLv3+"
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses readline ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses readline virtual/libiconv ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-- 
2.8.0


