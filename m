Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxz-0007Dk-Gt
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:03 +0100
Received: by wwb29 with SMTP id 29so736755wwb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:37 -0800 (PST)
Received: by 10.227.147.5 with SMTP id j5mr3818595wbv.41.1298798976965;
	Sun, 27 Feb 2011 01:29:36 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm2270671wbd.5.2011.02.27.01.29.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:11 +0100
Message-Id: <5f42aaa9cd05991ec0a545af9a7ed3b54c2273fd.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 06/50] poky-lsb.conf: Add DISTROOVERRIDES variable for poky
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:03 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/poky-lsb.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/poky-lsb.conf b/meta/conf/distro/poky-lsb.conf
index 86514d3..9a34a15 100644
--- a/meta/conf/distro/poky-lsb.conf
+++ b/meta/conf/distro/poky-lsb.conf
@@ -1,6 +1,10 @@
 require conf/distro/poky.conf
 
 DISTRO = "poky-lsb"
+DISTROOVERIDES = "poky:poky-lsb"
 
 DISTRO_FEATURES += "pam"
 PREFERRED_PROVIDER_virtual/libx11 = "libx11"
+
+OVERRIDES = "local:${MACHINE}:poky:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
+
-- 
1.6.6.1



