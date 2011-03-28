Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Q4HuC-0006O8-Ok
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 21:15:13 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2SHP3iH027262;
	Mon, 28 Mar 2011 10:25:05 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 28 Mar 2011 13:31:19 -0400
Message-Id: <4291f28327101ce51565d8b81558d0484914f8ab.1301333355.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301333355.git.bruce.ashfield@windriver.com>
References: <cover.1301333355.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1301333355.git.bruce.ashfield@windriver.com>
References: <cover.1301333355.git.bruce.ashfield@windriver.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/meta: fix SRCREV
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
X-List-Received-Date: Mon, 28 Mar 2011 19:15:13 -0000

The SRCREV that was pushed to meta isn't even a commit Id
on the meta branch. As a result, the recovery code for bad
SRCREV can't trigger and fix things up due to conflicting
files between the branches.

Updating to the right SRCEV fixes the problem.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 6ec74ba..d195a9d 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -109,7 +109,7 @@ SRCREV_machine_pn-linux-yocto_routerstationpro ?= "78214d7ac1c3103840fe69d3bbbf8
 SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "f700964852b98d6e5c7f5da24ade0256f97cd8cb"
 SRCREV_machine_pn-linux-yocto_beagleboard ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
 SRCREV_machine_pn-linux-yocto ?= "2b2ef940457f0bb40e0fb76937c921c2962364ca"
-SRCREV_meta_pn-linux-yocto ?= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
+SRCREV_meta_pn-linux-yocto ?= "212cae404e57ff9dc58c808035770d51325c3512"
 SRCREV_pn-linux-libc-headers-yocto ??= "17e49db8624324d090dd5aaa18ef977bb2dd5f6d"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 SRCREV_pn-matchbox-desktop-sato ??= "76"
-- 
1.7.0.4



