Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RE1be-0005vP-Kh
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 18:24:34 +0200
Received: by eyd9 with SMTP id 9so913241eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 09:18:48 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr47487491far.12.1318436328245;
	Wed, 12 Oct 2011 09:18:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a1sm4470635fab.4.2011.10.12.09.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 09:18:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 18:18:43 +0200
Message-Id: <1318436323-9334-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bitbake.conf: Exclude MACHINE from MACHINE_OVERRIDES variable dependency list
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
X-List-Received-Date: Wed, 12 Oct 2011 16:24:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 11d76b8..8cf7a60 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -670,6 +670,7 @@ OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVE
 DISTROOVERRIDES ?= "${DISTRO}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 OVERRIDES[vardepsexclude] = "MACHINE"
+MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
 CPU_FEATURES ?= ""
 CPU_FEATURES_arm ?= "vfp"
-- 
1.6.6.1



