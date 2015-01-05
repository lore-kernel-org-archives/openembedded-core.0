Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D73FA60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:59 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so29007384pde.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MFWwPQ/FZKC/Jnq3QOfQTxpso3lOI88CgCa5tw0BA/U=;
	b=XuyW5STjhGwWySYm2hz49wuaQt61WNPEfNIUODhn6RHO8RjFYKONIKo8KnRSPyYKuM
	Ns6JqiFXFZ+xg1EIHDoO640dzgrsqyXgej1TPFDhI1lcr+Dwpt+2BHcMYoOAsm9UdTOg
	pqpH9DvCnqj9VqO32oWBuZV1bZA2oC0okT8q2x6wVqrtT+9CAPoeQZ61BP5sMOwzKfTd
	B+RyklvIaT9iGhC2Cvl0wVCCky/dTT/yRaB22b64I+0+YjZ9rKjqhKDPaiaELO07ctmq
	DY7Ue1lPPvIaQ3V2I0gkkg4ZsVmCLNV4JuIPkyDZIF/l43vO1JetKoulwbTFeSgkSAH7
	LZYg==
X-Received: by 10.70.25.98 with SMTP id b2mr108186662pdg.10.1420490460864;
	Mon, 05 Jan 2015 12:41:00 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:43 -0800
Message-Id: <bda0962bf888f4d41922f3df13ff33da1e587d8a.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 09/12] linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:59 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the 3.14 tree to the latest korg 3.14.26, as well as
integrating 3.14 LTSI content, and refreshing preempt-rt. Minor
conflict resolutions were performed between ltsi, stable and -rt

(From OE-Core rev: 8c30cec8233605cbec334fcc5c2b9ef5cf8f6482)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index fc86725..7dbf82c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "baad552ea168dc31db31f0be188edefaa28a4aec"
-SRCREV_machine_qemuppc ?= "db4221ed2e1c6c617ad07d3374f630bbb59cf8b5"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine ?= "7f0712d10247ffca8e48e944f49707bcf9117ead"
+SRCREV_machine_qemuppc ?= "8bed2a975d491c963cff56496f7e35f5bcff926f"
+SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index d168a2a..67bf462 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index c30227e..706cb7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b768ebfe28a20b65aba734b9f6646a3fa0adc89b"
-SRCREV_machine_qemumips ?= "c76146e6c8a015c1225141fc55d867a3e47453c6"
-SRCREV_machine_qemuppc ?= "e54ab8451c482b695ff7a0c580ef2fb1be605299"
-SRCREV_machine_qemux86 ?= "146fcb1dd7b3c5547d67f04d50b082f0723741e9"
-SRCREV_machine_qemux86-64 ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_machine_qemumips64 ?= "71621ee758600abd3cf7187d7a8e7d51f4052c53"
-SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
-SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
+SRCREV_machine_qemuarm ?= "6166316d47b859aa38bfecc61f4808828af03937"
+SRCREV_machine_qemumips ?= "4ececcc09c6550a0896728163907e729d817c2fd"
+SRCREV_machine_qemuppc ?= "1cc5b09f8bb7f40b289d149d370c62dcc8109501"
+SRCREV_machine_qemux86 ?= "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
+SRCREV_machine_qemux86-64 ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_machine_qemumips64 ?= "737272b1dfd361d9ea19812a9717e2798e3c4576"
+SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
+SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.9.1


