Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCcZ3-0007Il-AM
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:00:22 +0200
Received: by yenm3 with SMTP id m3so280125yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zF9hZ0RUuSurdfLY3W0NkxsQGL9XOq6G6uqdb/vWrjQ=;
	b=AClYHCbuAz13c2FFSpjLdgE7cM3jq/CW2A/heKYseihctna56cQMi7MkdjtAAAQrQH
	N/ZZAXBYUBTMsooaup5hJBfc1a6x0yl38ypUzcH7F/y6jcc55zgLUqZZq9slF4GJtZU0
	+UzD12Z3vklyFA2bF3jCxNlREAqjfoOk0CXk38GZbZBIjdaMWboyr44DhH7LGNb7pf6p
	LvfBrS8pvysbNExxP63NPJWycJSaR+HytUbB/OTQVxZXgvrpecxBT/xM43htePp+kVJ2
	zOvVSYS9qigi+ckxEjY0mN7xu3RYOCR+10BlydCii2msifzi770q99wF+3zb24HCKpVq
	RtFw==
Received: by 10.60.1.4 with SMTP id 4mr33690530oei.28.1332877879346;
	Tue, 27 Mar 2012 12:51:19 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id v9sm797626obo.9.2012.03.27.12.51.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 12:51:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:51:09 -0500
Message-Id: <1332877869-12195-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>, edmar@freescale.com
Subject: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Tue, 27 Mar 2012 20:00:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

This allows setting DEFAULTTUNE to powerpc or powerpc-nf rather than just the
more specific cpu/machine tuning.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c5fd6b7..3438b46 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -26,6 +26,8 @@ AVAILTUNES += "powerpc powerpc-nf"
 TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
 BASE_LIB_tune-powerpc-nf = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
+TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
 TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
+TUNE_PKGARCH_tune-powerpc = "powerpc"
-- 
1.7.7



