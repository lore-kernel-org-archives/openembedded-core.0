Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejt-0008D3-0O
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:53 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343N022189;
	Wed, 14 Nov 2012 07:03:10 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:03:03 -0500
Message-Id: <93224a342aad308f6d239566534b21b24c694c1c.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] kern-tools: flexibility and usability enhancements
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
X-List-Received-Date: Wed, 14 Nov 2012 15:18:53 -0000

Updating the SRCREV to import the following changes.

 [updateme: find the board description with the highest score]

   This removes the requirement that a custom linux-yocto .scc file have
   define KTYPE <foo>, where <foo> is typically "standard". The tools can
   now match on a .scc file that only matches the board, but will still
   chose one that matches the board and kernel type, if available.

 [updateme: allow for tabs or spaces in defines]

   define KMACHINE<tab>$MACHINE was missed by the regex.

 [scc/kgit-meta: detect and avoid duplicating patching]

   To allow feature description to be included multiple times, they were
   previously split into -enable and 'patch' descriptions. With this change
   the patches will be detected as already included, and skipped
   automatically. Removing the need to do this split. It also cleans up
   the ability to warn about multiple includes.

 [kconf_check: add "verify" configuration fragment type]

   This adds the ability for a BSP to have a kernel configuration
   fragment that lists options that must be present. If they are not
   present it is a hard error. "required" is a similar fragment, but
   it adds them to the build, and audits them at the end, but does
   not abort the build if they are present. This is a minor distinction,
   but one that is useful when creating flexible, shared kernel config
   structures.

 [kconf_check: improve kernel audit report formatting]
 [kconf_check: perform validity checks on non-hardware options]
 [kconf_check: cleanups and verbose flag]

   The existing output was verbose and not always useful to the reader.
   This change makes the output more compact, audits non-hardware options
   and gives information

     [invalid (54)]: meta/cfg/preempt-rt/common-pc/invalid.cfg
        This BSP sets config options that are not offered anywhere within this kernel

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ce94885..f2cd39f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "a802ee9c8d9334c0f7932dfd40d45599addb7c90"
+SRCREV = "6f68c9473b43c3e39755a72aef8733cbd0bf1a59"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



