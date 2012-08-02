Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymI-0006J8-Vm
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:39 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:57 -0700
Received: by wgbdr13 with SMTP id dr13so5542447wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=K0qympZd9VJu8gszjW9SCrogxumiGIcZkINsEQ3hEP8=;
	b=QXTpcWfEftXcvdpGkIXL1LyrWvAIUH+/1lQJz5YInHm0TmyI/yX/urxRKj6W8axqGq
	93zqh2dAQ+q6+88EcHvN6CvaE/7r08Fy3hevEcelxjwHmb4GEOAmzUivOW0wokln0b8q
	Goontve8b5tVJDl2lJP3fq055EYOGmNcqG71llGpTOrtrWuf26bYSo46orU5RwKBxgNG
	zKNVGiUms/+EuMBRwEnVNnT0bsJMyazHLQhOk6zHfTYA37Aa3Xunsh5IWKfWb2Z20tYy
	jyDbIGvcfk3E0fjcVIxYR7TgVdtuYqFsjkNt6Z+4NF1ByHZmtrdeOO9FD8MRQAQfv+ut
	zxUA==
Received: by 10.216.64.79 with SMTP id b57mr11770494wed.31.1343926192771;
	Thu, 02 Aug 2012 09:49:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:56 +0100
Message-Id: <9e029985feaa4d75cb2f5fbcc277dba71ced16e7.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlylIRQ8qjBwLjLeuL8voWvyNDKKb+0pt4t5GTELHgGrA6/heSBNWIPY0ebrZFOCpNqtKyU
Subject: [PATCH V3 02/11] mesa: format the packages list nicely
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 403a961..da628b3 100644
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



