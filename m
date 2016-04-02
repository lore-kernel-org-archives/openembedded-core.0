Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2B87709E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3209ZIb002595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Apr 2016 17:09:35 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:25 -0400
Message-ID: <d4dda80a440397490903e66c2c868f832c7b5983.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/4.4: UVC: Add support for R200 depth camera
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:35 -0000
Content-Type: text/plain

Integrating the following commit:

[
    Add support for Intel R200 depth camera in uvc driver.
    This includes adding new uvc GUIDs for the new pixel formats,
    adding new V4L pixel format definition to user api headers,
    and updating the uvc driver GUID-to-4cc tables with the new formats.

    Tested-by: Greenberg, Aviv D <aviv.d.greenberg@intel.com>
    Signed-off-by: Aviv Greenberg <aviv.d.greenberg@intel.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index a3b743b1d984..87b46e48c5ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "1970b2704b881effa78c3e5f79c0fd3bff1fd028"
+SRCREV_machine ?= "8611de4e967b16bd5b63714045329d621ee744d0"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 67e261c6a6c6..9446da989371 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 0494564a5bdb..7aeb7c35db23 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8abee78b727ce6a4df262d1befcbecfa26742ae0"
-SRCREV_machine_qemuarm64 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
-SRCREV_machine_qemumips ?= "475e28c3240610c26ee0b7866dc0ce701d0c27e1"
-SRCREV_machine_qemuppc ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
-SRCREV_machine_qemux86 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
-SRCREV_machine_qemux86-64 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
-SRCREV_machine_qemumips64 ?= "8d34fd84b9c53507b3d10a4a44294c479237319c"
-SRCREV_machine ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine_qemuarm ?= "8809b2c36a60829bb9a7c3b04cdf42e95d8e93ae"
+SRCREV_machine_qemuarm64 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine_qemumips ?= "6a62ed62536c0f50050e24ee385b9e3965d43c97"
+SRCREV_machine_qemuppc ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine_qemux86 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine_qemux86-64 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine_qemumips64 ?= "c61be23279c09c6906571de734b583dc7eacedc6"
+SRCREV_machine ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


