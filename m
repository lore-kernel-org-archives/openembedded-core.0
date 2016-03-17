Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD597017D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so553769wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DxAVA8JvDgmh7nmlpU85CYq1JzDgRLAOEWK99JrkGSE=;
	b=TkuFRXCbRixBSaWtLcFILmEufn8+T9srhh6iveO/lEIIQV8QncIVNWgd5NXsB7WUTg
	3cUjMDf/mM/O0CAUN7ZnumA+17+E7dg1jNau1t/ksfmsO4xK5Fe67Cwgj32XcD9HuSJM
	bVuV/tMtiDV/qtqY6EWI944TdSCAgFN9HAM/MmcURkldO07XoBZnLqmtE4znvocAzEyA
	sWhOd5Ob2fyFSYnMXJRfbnfzMvL2dlT9xutR+qiJd9iTnlJAB8tujdBg7quG5/KhP+g0
	8ly341FQbAff9c5afsGRTQXD3UGRvnA67qquVKZlsE+WTtuoPDyRvIGcPCXq4kgLMEze
	HrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DxAVA8JvDgmh7nmlpU85CYq1JzDgRLAOEWK99JrkGSE=;
	b=StHAdE+VUKFAlxu2cfgq9fYvqHKQ6sxjfpO9ML/jKoXvVAu9orCUGj0AaDwlhSvIFK
	q3h0Vt9Xo735l60nXe2AW0YrpUv4YRWsdh+AYj5BuDdoK9gELhF8S5593cAx5NSAIKL/
	3Uqv5Hcl5H0ROsOSsIzzeuCDJFoOAXbNx9VjGmDjxm13WJgQ3ugOR0F9PHZzMrhdJ/Zj
	v/1qaNdVHE/qIK3E3a7yIwDC76LEXUbBTvLBafrafV525c2/L1ekPiTiV5YbxLByeZxX
	wk6wznHQX+fp+mH1XLIWh+YAuKzDojyhToolDlSgiPJNDa4CBn6ZGLFSjzZHrLfky7Xo
	mF/A==
X-Gm-Message-State: AD7BkJLZW6/DQx417i1ZXEr2bT4BJteYmJZ39D64f+ldE87b70PcVDkjTICCzcxlX+u4VA==
X-Received: by 10.194.143.82 with SMTP id sc18mr10970576wjb.14.1458235187159; 
	Thu, 17 Mar 2016 10:19:47 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:27 -0700
Message-Id: <1458235169-9267-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/8] gobject-introspection.bbclass: wrap comments at 80 columns
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 17:19:46 -0000

Whitespace and comment updates only, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index ef51629..d8b8b3e 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -1,22 +1,22 @@
 # Inherit this class in recipes to enable building their introspection files
 
-# This allows disabling introspection support in recipes
-# (and therefore avoiding the use of qemu)
-# if gobject-introspection-data is omitted from DISTRO_FEATURES and MACHINE_FEATURES.
+# This allows disabling introspection support (and therefore avoiding the use
+# of qemu) in recipes if gobject-introspection-data is omitted from
+# DISTRO_FEATURES or MACHINE_FEATURES.
 EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '--enable-introspection', '--disable-introspection', d)} "
 
 UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
-# Generating introspection data depends on a combination of native and target introspection tools,
-# and qemu to run the target tools.
+# Generating introspection data depends on a combination of native and target
+# introspection tools, and qemu to run the target tools.
 DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
 
-# This is necessary for python scripts to succeed - distutils
-# failes if these are not set
+# This is necessary for python scripts to succeed - distutils fails if these
+# are not set
 export BUILD_SYS
 export HOST_SYS
-export STAGING_LIBDIR
 export STAGING_INCDIR
+export STAGING_LIBDIR
 
 # This is used by introspection tools to find .gir includes
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
@@ -28,12 +28,10 @@ do_configure_prepend_class-target () {
     cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
 }
 
-
-# .typelib files are needed at runtime and so they go to the main package
-# (so they'll be together with libraries they support).
+# .typelib files are needed at runtime and so they go to the main package (so
+# they'll be together with libraries they support).
 FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib" 
     
-# .gir files go to dev package, as they're needed for developing (but not for running)
-# things that depends on introspection.
+# .gir files go to dev package, as they're needed for developing (but not for
+# running) things that depends on introspection.
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
-
-- 
1.9.1


