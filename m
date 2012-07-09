Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SoFbe-0005TE-QS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:10:35 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69ExLVF001403;
	Mon, 9 Jul 2012 07:59:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  9 Jul 2012 10:59:06 -0400
Message-Id: <5159ada08992b0499eaeb8d0dc063fe8a6d53e42.1341845577.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341845577.git.bruce.ashfield@windriver.com>
References: <cover.1341845577.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341845577.git.bruce.ashfield@windriver.com>
References: <cover.1341845577.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.4: perf scripting & unionfs fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 15:10:35 -0000

Updating the SRCREVs to pickup the following changes:

standard/base:
 95c79fb Unionfs: update ->show_options prototype
 49f1599 perf: change --root to --prefix for python install
 8ff1ab6 perf: add 'libperl not found' warning
 b4bc865 perf: use pkg-config instead of python-config
 a2257bf Revert "perf: hard-code NO_LIBPERL/NO_LIBPYTHON"

meta:
 a8cf770 features/ftrace: enable FTRACE_SYSCALLS

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 44d944f..d2ba6c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "684f3c1886618c919b54e8b362e72da3d128c532"
-SRCREV_machine_qemuppc ?= "fb15c26f9deae3912ca7e2aaf8c818127ef27d82"
-SRCREV_meta ?= "62cdf67899a36efeab3ac20dcb27f1ebc238d3af"
+SRCREV_machine ?= "6767c6a0821b8bb782bee9faa8aec6593a9d39dd"
+SRCREV_machine_qemuppc ?= "575b10dd912557cce881ea519c7ac2b84fbe7b47"
+SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index fe6f6cd..2ea9aa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,13 +10,13 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "168ed084c978a39eabf0071f0049b623bc05c856"
-SRCREV_machine_qemumips  ?= "66dbebd43d65eb070e0afa25f63f6b69ddd47c65"
-SRCREV_machine_qemuppc ?= "bc74ca65c9cae025861455d7f0a259458cd4a829"
-SRCREV_machine_qemux86 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
-SRCREV_machine_qemux86-64 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
-SRCREV_machine ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
-SRCREV_meta ?= "62cdf67899a36efeab3ac20dcb27f1ebc238d3af"
+SRCREV_machine_qemuarm ?= "93bb8cf97a0c5aead15a97c825d8fd504759f038"
+SRCREV_machine_qemumips  ?= "b9b9aeb414c14f2587690d91052c9348e9ccd72a"
+SRCREV_machine_qemuppc ?= "53ca8948fa64ee445001392a1cd03491befa9f35"
+SRCREV_machine_qemux86 ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
+SRCREV_machine_qemux86-64 ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
+SRCREV_machine ?= "95c79fb2f965f1feb33bffe46c20ddb0b8e9da0d"
+SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



