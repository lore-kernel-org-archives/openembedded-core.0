Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAF-0001q3-7q
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:47 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:05 -0700
Received: by weyt11 with SMTP id t11so4667579wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=IB0dTAThzgbHLaj5TNpNOaxuRZPY+GG0/5AWRbc78K8=;
	b=ENdq34nAB7COR/NOMzgRA5d+NFeSI8EWSU/Y5tWOCwTBEHQqaXQ2GJciG0mm63p/Lx
	BP5OYFiXsDjBSQ96HKWR5QOHasm7NwZMbPirBFMFvzNIXL83BekbNYot43Rff+xzRfr6
	Ps5Z8yDwTdSrRU9qJ83LQxNjM4gbNmLJEURxFSOu9PMvz2SheD49gFJ82OXEQMB0+jtn
	9ufWc+2bSTBtpB8QtcP88DlBMpxTX9sPm9qHst5xUUH6ixLGYLv1W9ygRPiJ3Zb0QYbT
	bVeXSMilp+WCkhWcdnwDzm9hpyqY7/HSLFmSmfqukCkmTfFQbU59h0kWUo/268seqal9
	mKMQ==
Received: by 10.180.105.163 with SMTP id gn3mr17524917wib.2.1343835423674;
	Wed, 01 Aug 2012 08:37:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:28 +0100
Message-Id: <27f388953b2883eb4a2159af8494e51f2b90a2d9.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm0RvY85boE3quakAdYaPTB33jwsBbZdwQ2QnA6HAoTILkzQGkueH7dNZI0ZtOIDf5qDHHT
Subject: [PATCH 01/11] mesa: format the packages list nicely
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 120a256..2385f9d 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -39,7 +39,12 @@ EXCLUDE_FROM_WORLD = "1"
 # ie mesa-dri could be empty and mesa-dri-dev RDEPENDS on it
 ALLOW_EMPTY_${PN} = "1"
 
-PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
+PACKAGES =+ "libegl libegl-dev libegl-dbg \
+             libglu libglu-dev \
+             libosmesa libosmesa-dev \
+             libgl libgl-dev \
+            "
+
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
-- 
1.7.10



