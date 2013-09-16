Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8815F6C806
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:06:41 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cb5so3926857wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gEH0Jx1WAXWF+QV2IZf0CfKTXw3O9FmUGoksGNH43UE=;
	b=UXIIkEigDIm00+wb0kndert0ioxJ14m2l+9WQ/noSKuAx/c2enu77J/lnVSJl3sYWV
	+UgWV8ZCCb6QFcrXThDKJ06GEw3hpxcOL3OGnbUhs6kSwe3eO9IAwjmbq9slHh8frqsv
	92PLjIgCAGmZWNoQb2wnmHf4mGJlSqrDzueGY1oTxG0uTadmXkoVpScuaoVpuJal3bnF
	bXfm4Kq6o6zdZuSpbBsbawQ5YcAkWuezwDegUrRpg0aruRGuAuY9MFdTUOrCRP6YBEIl
	YJDpl6hIiUTYHUmM20fJwPXnFTefOyQ9qYCtwJ/5emfoG2ccIwvwcHO2RqaRl/f1GlC/
	Hv0A==
X-Gm-Message-State: ALoCoQlyLvMUdCeoDIiwst6kn3NC8Uyl3D24EZhNQqUl7JmHj79V/R0QfcYZswLSWaZLYc1AfQ/a
X-Received: by 10.180.212.41 with SMTP id nh9mr4987049wic.9.1379354802995;
	Mon, 16 Sep 2013 11:06:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx7sm25399911wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 11:06:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 19:06:35 +0100
Message-Id: <1379354796-8157-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379354796-8157-1-git-send-email-ross.burton@intel.com>
References: <1379354796-8157-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 3/4] xserver-xorg: change mesa dependency to virtual/mesa
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
X-List-Received-Date: Mon, 16 Sep 2013 18:06:42 -0000

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


