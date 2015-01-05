Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 97CC77286B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:58 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so29016425pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7aN+/0I7S5jUKpI7WtZQseskuRXeH42l3lhoPbw9caQ=;
	b=vLCgP97X1Wcqh+0AXm7U+AZDjJo+P86LmLptkvmPd8DzmK/9m0we5/saga76YJ7lS7
	hYWrqWYs+hBHfvY/zfSY+viqfDg6xBfyR6iopbFOy33Ij3R8HfUmJqm7tPEUMLTueIso
	46FKlBeIc0PKs7EHiNKJL7vKNYeW6yXUkJ0HDwZaqI6Yzp/H9VN7bt6R6EIUDzILLZgy
	AjwfNlMcaTQ7oBNCKZPi2dB66udKkYTj3RE7Rbdiy3kFONlHz9tSxlPbt0vmWZB14zmC
	v7/c69F49fcHVDoodDaN3cW+qcRA+SzvPcCLfShQjJKKwgaCvA62em0BlAXqo+Cv3V+K
	uS0Q==
X-Received: by 10.68.69.78 with SMTP id c14mr147422389pbu.68.1420490458977;
	Mon, 05 Jan 2015 12:40:58 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:42 -0800
Message-Id: <d5c5d855baeab8aa9b7aeb94631f328e175564f9.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 08/12] linux-yocto/3.14: update to v3.14.24
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
X-List-Received-Date: Mon, 05 Jan 2015 20:41:00 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

(From OE-Core rev: e2c2960ae79953b5ef69444d91f2e784a35bfefd)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index b2ad078..fc86725 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "0a875ce52aa7a42ddabdb87038074381bb268e77"
-SRCREV_machine_qemuppc ?= "b993661d41f08846daa28b14f89c8ae3e94225bd"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine ?= "baad552ea168dc31db31f0be188edefaa28a4aec"
+SRCREV_machine_qemuppc ?= "db4221ed2e1c6c617ad07d3374f630bbb59cf8b5"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 79bd693..d168a2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index a2f4b4d..c30227e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "127b621f2a4d3b1111e24423c12fac001e047c1c"
-SRCREV_machine_qemumips ?= "c3b9f1b2397f0847ab4844d1cdb8e02574434d78"
-SRCREV_machine_qemuppc ?= "73e2411cdd91764d0601c0869857f53381c2a177"
-SRCREV_machine_qemux86 ?= "e19a1b40de44e756defdfb40349342d8037609bd"
-SRCREV_machine_qemux86-64 ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_machine_qemumips64 ?= "1c4d70272dde4b695697dd8705a031420480f712"
-SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine_qemuarm ?= "b768ebfe28a20b65aba734b9f6646a3fa0adc89b"
+SRCREV_machine_qemumips ?= "c76146e6c8a015c1225141fc55d867a3e47453c6"
+SRCREV_machine_qemuppc ?= "e54ab8451c482b695ff7a0c580ef2fb1be605299"
+SRCREV_machine_qemux86 ?= "146fcb1dd7b3c5547d67f04d50b082f0723741e9"
+SRCREV_machine_qemux86-64 ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_machine_qemumips64 ?= "71621ee758600abd3cf7187d7a8e7d51f4052c53"
+SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.9.1


