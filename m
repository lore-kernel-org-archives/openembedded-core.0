Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65CF26A9D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s88Jtiw7019844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:25 -0400
Message-ID: <34f896f4561a3ad2f51be8ecbcaf281247cb5440.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/3.10: update valleyisland-io merge branch
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:46 -0000
Content-Type: text/plain

Updating the topic branch that is used for valleyisland-io merges.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ec155089a8fb..2f22ba8ea690 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "1dfc94848e05989ab6c5fde2080f35546d81e798"
 SRCREV_machine_qemuppc ?= "81334ed6f11da157e13c306c48f3d49a051d9d89"
-SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
+SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 08b295ba629c..bd762f9fff29 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.43"
 KMETA = "meta"
 
 SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
+SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 44b6464258d5..298d2ca79923 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
 SRCREV_machine_qemux86-64 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
 SRCREV_machine_qemumips64 ?= "8affc1996043dfe2061953c074c714a9885fde6e"
 SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
+SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


