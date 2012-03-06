Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1S4wO2-0001g9-9F
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 16:33:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q26FOZCw017900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2012 07:24:35 -0800 (PST)
Received: from yow-bashfiel-l1.wrs.com (147.11.118.51) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 6 Mar 2012 07:24:35 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2012 10:24:32 -0500
Message-ID: <2fb5cfc0812dcf851bcc9ba20f5ecc0bca99c920.1331047183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331047183.git.bruce.ashfield@windriver.com>
References: <cover.1331047183.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto/meta: fix incorrect config references
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
X-List-Received-Date: Tue, 06 Mar 2012 15:33:14 -0000
Content-Type: text/plain

Updating the meta SRCREV to pickup the following fixes:

  a9ffedb meta/fri2/sys940x: fix incorrect cfg includes
  3d1a678 meta/sys940x: fix incorrect emgd branch merge

During the merge of the 3.0 BSPs forward to 3.2, a few moved config
fragments were missed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index efb1bc9..872289f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "3652b606f1ab7769a7ecc86c70d22db4ef99fb2a"
 SRCREV_machine_qemuppc ?= "0c8f5214bc15699b41369751cdecea45f717c79c"
-SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
+SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 2d2542a..6da16c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
 SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
 SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
 SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
-SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
+SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



