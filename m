Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TL4nZ-0003dn-7j
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 06:18:33 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so8693126ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2012 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=iMVmGBLUnkqYFtGoWrhH4HlEceBwP/Q/C9BTnCzxeJc=;
	b=xuWnYxLO0slufQdLlyMdqqIfQLC4C3GeMunDtGFAmAYt5TNiOdIVEwP89yze4SdwY3
	1972v/OYUnyBblTET3MEo7tYGgM4NYgXa52dFD+AKN8YkseO+dSWD/5aZpsQvdVDQLku
	JSmeGOIrEzqrUKOGO2eBCxOUre4Ok/cwvyv376ZYeVogC/c3FTSw+kn6Dpz5TzuBAtM/
	EOQ7jLA31TPgIvMDEcVWGlqwuD2pi80WwqZ04v/UdKLFUdHorUWM19J6Ocp5PrpWj0KO
	tbrrmUHejm9IUZuxpJSjkDNsFX/BICKyP3lBZ9ln86n4CZzhPkHHMaH83JqHeA4RNLMY
	gK3w==
Received: by 10.50.51.234 with SMTP id n10mr7041177igo.74.1349669127063;
	Sun, 07 Oct 2012 21:05:27 -0700 (PDT)
Received: from localhost.localdomain ([96.44.93.233])
	by mx.google.com with ESMTPS id d19sm6175073igp.6.2012.10.07.21.05.24
	(version=SSLv3 cipher=OTHER); Sun, 07 Oct 2012 21:05:26 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Oct 2012 00:05:18 -0400
Message-Id: <1372b8b867ac48d1900f2327251125259054236c.1349668552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349668552.git.bruce.ashfield@windriver.com>
References: <cover.1349668552.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1349668552.git.bruce.ashfield@windriver.com>
References: <cover.1349668552.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/3.4: fix kconfig warnings and unnecessary options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 04:18:33 -0000

Updating the kernel configuration fragments to fix the following
issues:

  - remove options that are no longer in the 3.4 kernel
  - disable unused, but large kernel modules
  - fix kconfig audit warnings for x86 BSPs
  - make uprobes reusable by multiple fragments

The following meta branch commits are represented by this update:

  3da1172 uprobes: split into enable and patch fragments
  17ec51a meta: cleanup invalid/obselete 3.4 CONFIG options
  b5cee42 meta: disable OCFS2 by default
  efe937e meta: drm: tag DRM options as 'hardware'
  10b5155 meta: emenlow: clean emenlow configuration warnings
  a907b82 meta: add CONFIG_SHMEM to standard kernel config

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 2f8f957..135187c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
 SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_meta ?= "5bdc655034a58a7147176a8a882d81e2fd51e4b9"
+SRCREV_meta ?= "3da11722e36591bafab908141876c89d1dfb229d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



