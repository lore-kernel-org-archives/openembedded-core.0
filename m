Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E65A47036C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLYKq012408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:35 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:26 -0400
Message-ID: <11ccbd8cec32612d79a4e544650684cfcf029ded.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto: intel-common: Enable Industrial IO
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:41 -0000
Content-Type: text/plain

Updating the META branch SRCREV to import iio configuration settings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 77215f6a517e..78209b1070ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "8ef1733b66a1646b85338a310f787e0057a6a4e9"
 SRCREV_machine_qemuppc ?= "3079c794c30b0de82bc87b19cf477d82405a9094"
-SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
+SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index e28054fc4cf4..47be35769d0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14.5"
 KMETA = "meta"
 
 SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
-SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
+SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 7b8b65382775..1e397e902648 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "5b327970eb1dba02c65cb8330dc8f3049c4fa580"
 SRCREV_machine_qemux86-64 ?= "5724bf17acbf54cf61003ab242448fd96d189384"
 SRCREV_machine_qemumips64 ?= "34837892b66eaa034cd3e3d339cab0ea6f594511"
 SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
-SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
+SRCREV_meta ?= "54d07ec2566afe2a4c1eee4995781aab5599b5d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


