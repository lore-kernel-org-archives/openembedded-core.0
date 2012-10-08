Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TL9kH-0003r5-3B
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 11:35:29 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so3495918pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5srZV+y9rBi8l9202Rwlv8vcsmopBzwh6NHyZlQuOWA=;
	b=YEfgGcjJAW2MckXs0Fp9/y+HyCwMJCgSmQSEWfkpGiJXykOHzrGQnYQPuub6885cA2
	iyIkMZICTLFWTsabq4RZ/UEt5/D72Cg7O3eBbJmj4GO8xm3bs4hP0cuGHOlaPqQ5NDBa
	4X2oiGtMGK7zIht9lQyVN4AOjPR5xln2QG4Vv0b2S+oFfacxwMrGpNxLBLHsAgK1LAsy
	OZdgAezaVSJ41mMdrE/vNDHC5G1XEEvmRQiido4XfqqX+PWPjuObtmvr985ukWIaU+70
	s+eVgNsCOoKfgjB1kPyUrDffwLE/LxPDrVNhhjZyF5FHFhyoEFWBP60LVGkpC0z+c6iV
	1MoA==
Received: by 10.68.225.199 with SMTP id rm7mr51990871pbc.150.1349688142466;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
Received: from swamp81.fooishbar.org (115-64-155-100.static.tpgi.com.au.
	[115.64.155.100])
	by mx.google.com with ESMTPS id nd6sm6887983pbc.68.2012.10.08.02.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 02:22:21 -0700 (PDT)
Received: by swamp81.fooishbar.org (Postfix, from userid 1000)
	id 82A401165; Mon,  8 Oct 2012 20:22:17 +1100 (EST)
From: Daniel Stone <daniel@fooishbar.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 20:22:16 +1100
Message-Id: <1349688137-22470-2-git-send-email-daniel@fooishbar.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349688137-22470-1-git-send-email-daniel@fooishbar.org>
References: <1349687945.15658.100.camel@ted>
	<1349688137-22470-1-git-send-email-daniel@fooishbar.org>
X-Gm-Message-State: ALoCoQkqg0M3iPNSewqSin2jlAHP1MzPCGtMStDAol4RVSexK4Q6jeDFiWPL7pQ27LifNoIwYnCm
Subject: [PATCH 2/3] DRM: Bump git recipe to latest 2.4.39+ revision
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 09:35:29 -0000

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
---
 meta/recipes-graphics/drm/libdrm_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 4f4d4f7..5d7f953 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -6,7 +6,7 @@ S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "1b1a4f0a779f7ab2ba5673b9c9fe2a37047fe765"
-PV = "2.4.37+git${SRCPV}"
+SRCREV = "14db948127e549ea9234e02d8e112de3871f8f9f"
+PV = "2.4.39+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.7.10.4



