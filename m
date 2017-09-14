Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3218785E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDl92k027571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:59 -0400
Message-ID: <a9d9d4b81a8f0cf6d6127360335112e795460739.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/4.10: bluetooth: CVE-2017-1000251
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:09 -0000
Content-Type: text/plain

Integrating the following commit:

[
    commit 16de0149674ed12d983b77a453852ac2e64584b4
    Author: Ben Seri <ben@armis.com>
    Date:   Sat Sep 9 23:15:59 2017 +0200

    Bluetooth: Properly check L2CAP config option output buffer length

    Validate the output buffer length for L2CAP config requests and
    responses to avoid overflowing the stack buffer used for building the
    option blocks.

    Cc: stable@vger.kernel.org
    Signed-off-by: Ben Seri <ben@armis.com>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 17d819153e58..f93d9530ebc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
+SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index 7730da60fa62..31396ab3032e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.10.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
+SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 6e5c726b336e..7fcc753a705c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "97253eca8592c9cba7c7665277e1118b048b9639"
-SRCREV_machine_qemuarm64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_machine_qemumips ?= "52e935b59800868731e7620caf49cc257f1b9946"
-SRCREV_machine_qemuppc ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_machine_qemux86 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_machine_qemux86-64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_machine_qemumips64 ?= "7b6d7feb4b0143d6f9146784f6072ffd171dd7ba"
-SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
+SRCREV_machine_qemuarm ?= "ae12e19cecc19af66f64a50538909cb1cad185f9"
+SRCREV_machine_qemuarm64 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_machine_qemumips ?= "b71b80fd679a17dfb4f73b352263c49273f721d4"
+SRCREV_machine_qemuppc ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_machine_qemux86 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_machine_qemux86-64 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_machine_qemumips64 ?= "8bb135e71037c46175bbcc7acf387309b2e17133"
+SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
+SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
-- 
2.5.0


