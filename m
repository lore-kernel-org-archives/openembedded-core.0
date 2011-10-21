Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH7LZ-00040E-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:08:46 +0200
Received: by ggnj1 with SMTP id j1so1980355ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=eVp0NUInPTyj8DMSjpu3i9w/rAvQdp9BpwVGzqeOrKg=;
	b=J5TtFSFLiyUyL9Pm6JY2cccp5XRYWcby6Ddgp5pVfbFmrXzaX5sH5XwVlCqrRFOXjA
	CVdUr+C+7TOy+rje6I7AwQj3zGVBafzEdUnPichDZGPzrjeTy1/7cYEjRTZ9uamzAuF4
	dUTGyAvDnOaSqz6ytGU4ZL17/r6R8WL0BuESs=
Received: by 10.68.14.198 with SMTP id r6mr4273786pbc.104.1319173372237;
	Thu, 20 Oct 2011 22:02:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id w4sm26362890pbf.6.2011.10.20.22.02.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 22:02:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:02:41 -0700
Message-Id: <1319173361-11527-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct location
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
X-List-Received-Date: Fri, 21 Oct 2011 05:08:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index de80870..98fd4c1 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -7,7 +7,7 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
                       --with-gxx-include-dir=${target_includedir}/c++ \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-                      --with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS} \
+                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 #
-- 
1.7.5.4



