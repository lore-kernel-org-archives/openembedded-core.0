Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZc-0003kk-D2
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:12 +0100
Received: by mail-yx0-f175.google.com with SMTP id q1so1491528yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=LVhKHtscfaq1ozwI0bSN7KwScYqMGYpaluNSm3cvtw8=;
	b=QHSCgYvN3Mrb0y21zokQjyZpPtxwUX7vYd65pU9KM4075e8xzIPnrs4bGPqsWXv6jR
	aA9h7MyVT3dIO9kGlVbYaEfdFmysUElzOZRiscroN/QaFpo0XeyRbsIqAYRHeRzC1JkO
	MRHLeauUlSXFBCR1Bx4sqp3xTvwGSYWdNvgi4=
Received: by 10.236.85.174 with SMTP id u34mr16463386yhe.28.1323148887372;
	Mon, 05 Dec 2011 21:21:27 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l19sm57929084anc.14.2011.12.05.21.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:16 -0800
Message-Id: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] tcmode-default: Remove pinning u-boot-mkimage-native to non-existing version
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
X-List-Received-Date: Tue, 06 Dec 2011 05:28:12 -0000

2009.08 does not exist anywhere and ppc builds complain about
it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c22e7dc..997400c 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,9 +23,6 @@ EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "3.1"
 
-# Temporary preferred version overrides for PPC
-PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
-
 # Temporary workaround for gcc 4.6.0 ICE with beagleboard
 # gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
 TARGET_CC_ARCH_arm_pn-mesa-xlib := "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
-- 
1.7.5.4



