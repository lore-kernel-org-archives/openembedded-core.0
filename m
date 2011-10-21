Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH7kd-0004vt-9x
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:34:39 +0200
Received: by ywf9 with SMTP id 9so1063511ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xqLMEHs4KYydCozOvZBrCrRj3EAbrAPOYBAG7D7AnNw=;
	b=ls2YaIU5ZxLWH7iuTdz0HzmpWzjt+e0BeHjLfXf052h0NZfS2arPJjYL2AZLCK1hyU
	7k4k+MAPop00LhOHTiCc9IKp9gLtwYrB0k19EzsCuoTX6iO7YQjx3VYTgacC0CP5iuu7
	zlAOr4Y1dFMgrnOVJNM5hekBMMcR1BRSZXVAE=
Received: by 10.68.17.201 with SMTP id q9mr25221679pbd.15.1319174925769;
	Thu, 20 Oct 2011 22:28:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id y4sm26591313pbe.4.2011.10.20.22.28.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 22:28:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:28:42 -0700
Message-Id: <1319174922-31033-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCHv2] gcc-configure-sdk: Point sysroot to correct location
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
X-List-Received-Date: Fri, 21 Oct 2011 05:34:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index de80870..f130b47 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -4,10 +4,10 @@ require gcc-configure-common.inc
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
-EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
+EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_exec_prefix} \
                       --with-gxx-include-dir=${target_includedir}/c++ \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-                      --with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS} \
+                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 #
-- 
1.7.5.4



