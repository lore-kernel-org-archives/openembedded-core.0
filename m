Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYH0-0004Zc-67
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:34 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:54 -0700
Received: by weyt11 with SMTP id t11so4544448wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=69VcTsNsj2g7DX1FWqiCkn4UsEpXKFKSfD30Q9i49lA=;
	b=jRcVv/1O3FHCBQrP8KNckHYw+yIBmRopARt1HbD6babX3UP0W6oh7hzAfjeuvLC2eg
	4cOExhyeZQ04dbh0NCERIEh0jEdDR25n7novnQ05q32dJhIiWhEl7tFNT6duY0llnAso
	DpkpOx+Fz+T1g1c7fJOAh4CfYnrmizuNPEYeICnQPV0lGm6PjNWhiG1YpNE02GIihCZ4
	Tq3BKXTvKNZx3tB7Kog+wRI8v6nyuXBWdvJfBr2rwWomL0Cu00C/WyQHpkXaTRB3Bdz9
	YPynZFj1mhdHuMVJoGfzo1eL/4Ol7JhkSs6+U709cYbYtbdpV6T4tTDIPAG2R7osrFDM
	hlYw==
Received: by 10.180.84.164 with SMTP id a4mr16162655wiz.12.1343824312413;
	Wed, 01 Aug 2012 05:31:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:07 +0100
Message-Id: <5a2f3780e977d17706e6b1516c96a54abb05803a.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmeJ58lpnaeR6z3vPwlbp7SretaouSnqw9CL6X+Z7lRuxNcGZqXZwwck4BKuJw3tzkF8Djq
Subject: [PATCH 01/12] mesa: format the packages list nicely
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:34 -0000


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



