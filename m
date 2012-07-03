Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sm4ym-0007lD-1n
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:25:28 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63FELjb005061;
	Tue, 3 Jul 2012 08:14:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  3 Jul 2012 11:14:12 -0400
Message-Id: <789c7a8fba0e31b4b365f086ea908438add95174.1341327589.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/4] linux-yocto/3.4: add qemumipsel machine mapping
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
X-List-Received-Date: Tue, 03 Jul 2012 15:25:28 -0000

Updating the meta branch with a board description and configuration
that can be found from the linux-yocto recipes without doing a
MACHINE -> KMACHINE mapping.

From the meta branch commit:

    The mti malta board description for a little endian config can't
    be found by default unless it has a matching KMACHINE, or the
    KMACHINE is set in a kernel recipe. In this case, it is easier to
    just add qemumipsel in the KMACHINE list, so the recipe doesn't
    need to do the mapping.

The little endian mips support reuses everything but the endianess
settings from the big endian mti malta board emulation.

This change adds the required mappings and SRCREVs, but does not
update the machine compatibilty, since official support is still
pending. The compatibility can be set in addon layers until that
time.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index fde9020..4afcf65 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "4a688295a1c6d44f3eea409d51a0344c8830d829"
 SRCREV_machine_qemuppc ?= "83843542dd524007547eddba507690cd4bab393b"
-SRCREV_meta ?= "d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0"
+SRCREV_meta ?= "51f94f06fe908a910564687942fdd82809f82348"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 0247d24..892f058 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -5,17 +5,19 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemuppc  = "standard/qemuppc"
 KBRANCH_qemumips = "standard/mti-malta32"
+KBRANCH_qemumipsel = "standard/mti-malta32"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
 SRCREV_machine_qemuarm ?= "4e354f7fa345464f284525a27eb1544cbc60968d"
 SRCREV_machine_qemumips  ?= "c65bc98cd501459bb6ffc7b5ec5a7e72c41dceef"
+SRCREV_machine_qemumipsel ?= "c65bc98cd501459bb6ffc7b5ec5a7e72c41dceef"
 SRCREV_machine_qemuppc ?= "ee3475b4ca8c9e26f55f6e107101d832e7dec7ac"
 SRCREV_machine_qemux86 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
 SRCREV_machine_qemux86-64 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
 SRCREV_machine ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
-SRCREV_meta ?= "d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0"
+SRCREV_meta ?= "51f94f06fe908a910564687942fdd82809f82348"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



