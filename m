Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptd0B-0007FD-Ah
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:33:19 +0100
Received: by wyb38 with SMTP id 38so2800557wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:40 -0800 (PST)
Received: by 10.216.183.195 with SMTP id q45mr3521731wem.94.1298798980148;
	Sun, 27 Feb 2011 01:29:40 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 16sm989143wet.8.2011.02.27.01.29.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:14 +0100
Message-Id: <85167fb28693fbd8c1f9ee0b00b7202a1e073513.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 09/50] poky-lsb.conf: remove OVERRIDES
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
X-List-Received-Date: Sun, 27 Feb 2011 09:33:19 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/poky-lsb.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/poky-lsb.conf b/meta/conf/distro/poky-lsb.conf
index 9a34a15..749c858 100644
--- a/meta/conf/distro/poky-lsb.conf
+++ b/meta/conf/distro/poky-lsb.conf
@@ -1,10 +1,9 @@
 require conf/distro/poky.conf
 
 DISTRO = "poky-lsb"
-DISTROOVERIDES = "poky:poky-lsb"
+DISTROOVERRIDES = "poky:poky-lsb"
 
 DISTRO_FEATURES += "pam"
 PREFERRED_PROVIDER_virtual/libx11 = "libx11"
 
-OVERRIDES = "local:${MACHINE}:poky:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
 
-- 
1.6.6.1



