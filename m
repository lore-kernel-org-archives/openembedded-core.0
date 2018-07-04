Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8843778AE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:24:08 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id q10-v6so4579104wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+mTH0LAZJlp9QsnQdrS1LkHI9IhyRIbQQ8q4XDXy/cY=;
	b=aGw7TVH0ShkAxax2+wFcr+8/4emTE/P/vD+NcShuB0ldAT+AaE6GEOQklnCV8uKrLD
	vOBuMTxOks2AjM02/w7iFyBqdYuT6vYVmIGuvsvAtiWMcXaG4MTXIgW2EtknELp2SJDu
	mj9VSeYo9jAqPBY6nm8jgVo1Z7Vn/wciesSQ2R/vv2qEdOZfS2HfOTUvYRDJht/vD3iG
	KFRMSXvRmOFxJVMrdVO0OEU/8jFWCHHes+9KAgLioonRuvC5EujW6yOYX3XIhj6KawEw
	Ffp6dPExi0zXPPMXuh0hMuN1Bl/FKhOwDJlHOzEVffqAlrEkjQr4hOnakZBqRut6aAlB
	XnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+mTH0LAZJlp9QsnQdrS1LkHI9IhyRIbQQ8q4XDXy/cY=;
	b=XDAvmcmHzr2RjgRYM2IyI7m8AJvX5O//nEorH78bgMe9duJ1LgfDDfVHdh690V76AE
	lxgepoDkuvLBUimVJzTjLdXGpzxIWSMGM2gJlkjjfTTacLwu0RJpQE2NkQDBPAEG+z+Q
	524DeX1OS6kay5otJimHkyfDxP12iNMbb4RPsFvKUd5vTwk4bZxVJgfliZdhrioNDg8P
	yKRdB+KGyH7qbcsS8p5RjiHYAtQe2HQ9kZyQsc3k0Mu7rFMB4gOraLZyToTSKeDCOzyl
	Snbtu/RzSu/ZFy7aajxW8iR3GQUnVI7wDzFInRog5GbRoscjy3uYEZl2gruP9OZkvX4r
	j/Ig==
X-Gm-Message-State: APt69E3o6eRl+NVo2udtJ2Wsor/u2EgtSdT8r2mWLzn824a5cMSq46WA
	Q3qlMbh1Vtyy4XoJjRWf61JccJRL
X-Google-Smtp-Source: AAOMgpf6wcWNl2KCE7G7WHlwnA6p0tTn4+O1b1NvvubiEVbQ6cdZj3RCKIAFjAMRH6zO1Np0qZddUA==
X-Received: by 2002:adf:e285:: with SMTP id v5-v6mr939314wri.54.1530696249004; 
	Wed, 04 Jul 2018 02:24:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o42-v6sm9019021wrc.50.2018.07.04.02.24.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 02:24:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 10:24:06 +0100
Message-Id: <20180704092406.4319-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: add lost Upstream-Status tag
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
X-List-Received-Date: Wed, 04 Jul 2018 09:24:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
index 669e6558d16..545752274e4 100644
--- a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
@@ -11,6 +11,7 @@ on glibc since sys/types.h is included through another
 system headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [7dfdfbf8c37e52e7b9b09f7d1d434edad3ebc864]
 ---
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
-- 
2.11.0


