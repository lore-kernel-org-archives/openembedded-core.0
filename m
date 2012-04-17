Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkH-0002cS-7u
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:09 +0200
Received: by mail-yx0-f175.google.com with SMTP id m3so3178107yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CgcPMoFzZI3QX28JWFK1yE9keg8r9y2gSCDJXO/cv2A=;
	b=gwUaeVmOzIE4ldVnDFeyogS8ZA3V1ICZ2HXL86Yhtb+wTc8ZBboWsiwZlJOEyp/EyI
	BNQlEmwcHFxYDPtKpNblHSRDXv/qxinyYnVMGPinjH7l8J2r54rfclCt06D2+zvx4+bp
	s7ZONw+SFgo3NOOgdk1SBwr+dcO1oeet4kZehOHqwjJQG9IM3nQuAT18AhNBk1llLgK5
	4MVYqCqfw8+fzVoKFMhlfNJlgoHRM2E8FNE6qz6XwDWhOSSf9cmn3LPndYdFaIWgHN1I
	KCa6//GqutxmXtJHGUHMVCLCWPWNwHpP1HxvTl/kiyhYwxq0UMdJ1k5bHNXveFg/1ZFp
	Yj5g==
Received: by 10.60.8.129 with SMTP id r1mr21861783oea.28.1334677544988;
	Tue, 17 Apr 2012 08:45:44 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:14 -0500
Message-Id: <c1bfa3bdc3bb5f58a95c11e8c970ac49e1bcf150.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 4/6] tcmode-external-csl: use the existing precompiled locale files
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
X-List-Received-Date: Tue, 17 Apr 2012 15:55:09 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 1fc366c..3b54e35 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -35,6 +35,10 @@ PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 
+# No need to re-compile the locale files
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
+ENABLE_BINARY_LOCALE_GENERATION = ""
+
 TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
 TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
 
-- 
1.7.7



