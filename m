Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1236861577
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:02:20 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hj3so3597771wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gEH0Jx1WAXWF+QV2IZf0CfKTXw3O9FmUGoksGNH43UE=;
	b=M6gXXsaxEC06jZ47/xbk4CRvEVmxIrdtnnKnG5hBHy5KwdRCUYQCwlyHCUqqdAmijt
	V9gA/MhaiBwgzQ6O6hlLhuP88vZhMz6307a8iqN7JtQhoLdrKucjE07w+/OiAXKUk97i
	67HP1iZtGWfcmf8SU+vHj7phEjaYC7txZliwqYWvz1IvDK531EzQD7Kip65nwTREjCcX
	rmJ0cRb3Z16yWGM2Xzie3kJ/QH3l2SD5Jfuk75ixbBZXXg+cSx5S/2fsScl/aXaCQIMX
	r30czqxIdtX6g6k6HFp8d0P7Au7N2EHK4PdrNd1dDT2BWyBzGfuEBZoi/NALPCzqee/e
	gMWw==
X-Gm-Message-State: ALoCoQneu83aQkt/rL+XBaBNu56Fnz2zJvAQe5vhdk/d6oVGyVTBtA8lJM0Ze8D2oiJ71tQxTfo4
X-Received: by 10.180.160.165 with SMTP id xl5mr9991587wib.48.1379343742658;
	Mon, 16 Sep 2013 08:02:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mz14sm24198374wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 08:02:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 16:02:10 +0100
Message-Id: <1379343731-7492-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
References: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] xserver-xorg: change mesa dependency to virtual/mesa
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
X-List-Received-Date: Mon, 16 Sep 2013 15:02:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index ab8171c..969b84e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -124,7 +124,7 @@ EXTRA_OECONF += "--with-fop=no \
 
 PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto mesa xf86driproto"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
 
-- 
1.7.10.4


