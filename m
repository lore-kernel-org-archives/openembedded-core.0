Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rdn8u-0005AK-T1
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:13:25 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBMI6DQP013678;
	Thu, 22 Dec 2011 10:06:16 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Dec 2011 13:05:59 -0500
Message-Id: <d04a337630865f4ee19463cab68e55c3bc91c6a4.1324576164.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1324576164.git.bruce.ashfield@windriver.com>
References: <cover.1324576164.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1324576164.git.bruce.ashfield@windriver.com>
References: <cover.1324576164.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/4] kern-tools: update SRCREV to pickup git operation fixes
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
X-List-Received-Date: Thu, 22 Dec 2011 18:13:25 -0000

Updating the kern-tools SRCREV to pickup the following commit:

[
    kgit-meta: add error checking and autoconfiguration to git commands

    When git commands are embedded into feature descriptions, they can
    fail for a variety of reasons. The current meta series processing does
    not trap errors, and will continue to process potentially failing
    commands. All git commands are now checked for their return code, and
    in case of error, the error code is passed up via early exit.

    A second common git issue is on a new machine that has not been
    configured with a username/email for commits. This is now detected
    by checking for a global user.name. If one is not found, a local
    user name of "Auto Configured" and email of "auto.configured" is
    created to allow git operations to succeed.
]

Fixes [YOCTO #1838]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index fb66211..6bb9c85 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "eb3ed64cea80d23ffb28dfeaeb02cdfe3fb29340"
+SRCREV = "806f1452eeced0bbd05433456ac0d6786d5362dc"
 PR = r12
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



