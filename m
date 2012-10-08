Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TL4nY-0003dm-SS
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 06:18:33 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so8693090ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2012 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=RzK1Nl7uxRUGXz8I6i6VM1EoXRMyt7TqmEucBKANIvw=;
	b=KGCRkAcRJM7WO+DtMaUsZxrQ57EGEbtjJ3N6BVpJ+JqX7o/o2gOww2C/k/eNCHzaFf
	GjB+v5ZxYfPGsi0EiKAXqRZU+yMRaIx82Her79HD3Y+xp80NixMmnZBTUUFqcldEcVvV
	DsOsn7daLVbIBbd/1935ATsimMeNvsqALoi4cVRtD2jEEfJ8jzlconoJiXdHeU1O7+Zv
	yTCWbOY33H7etd42AsXLkaLo6wobXbiYZkMI3cJLee1b8x8dbBybhvQO8XjQe0jpTS+l
	3wZkiO9G28w5TbIw1M32KK+qTpGh2zdqeNsrbtan3zQX/1CjxcxOEXicWqbFcZk2UBhc
	5Ckg==
Received: by 10.50.37.196 with SMTP id a4mr4862263igk.27.1349669129226;
	Sun, 07 Oct 2012 21:05:29 -0700 (PDT)
Received: from localhost.localdomain ([96.44.93.233])
	by mx.google.com with ESMTPS id d19sm6175073igp.6.2012.10.07.21.05.27
	(version=SSLv3 cipher=OTHER); Sun, 07 Oct 2012 21:05:28 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Oct 2012 00:05:19 -0400
Message-Id: <069bc2cf8e59c8d4e688f131b427fd77c97d4fc8.1349668552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349668552.git.bruce.ashfield@windriver.com>
References: <cover.1349668552.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1349668552.git.bruce.ashfield@windriver.com>
References: <cover.1349668552.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.4: tiny: Add qemu KMACHINE to common-pc-tiny.scc
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

Updating the meta SRCREV to pickup the following change:

  Ensure the qemux86 machine is defined in common-pc-tiny as it is
  for -standard and -rt.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 135187c..6b1f0fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
 SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_meta ?= "3da11722e36591bafab908141876c89d1dfb229d"
+SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



