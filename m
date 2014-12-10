Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 758AA72369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYJYZ005459
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:19 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:18 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:06 -0500
Message-ID: <7dfbda374e62a02d101095dd0c771ced8001d527.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] lttng/perf: depend on virtual/kernel:do_install
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:21 -0000
Content-Type: text/plain

To ensure that the minimal environment has been created for out of
tree module builds, perf and lttng should depend on the do_install
task of the kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 1 +
 meta/recipes-kernel/perf/perf.bb                 | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index 6ff961a9b189..f66118011afe 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_install"
 
 inherit module
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d375e246ce30..a42aa73c53c9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -32,7 +32,7 @@ DEPENDS = " \
     bison flex \
 "
 
-do_configure[depends] += "virtual/kernel:do_patch"
+do_configure[depends] += "virtual/kernel:do_install"
 
 PROVIDES = "virtual/perf"
 
-- 
2.1.0


