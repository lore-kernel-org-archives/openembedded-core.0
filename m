Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9152E7461D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:22 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id 91-v6so11765921pld.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=K2lXhqD8MRkEvKSQOGYyHaEQ4x6C+cTsI14aDvN8VJo=;
	b=Hkp5DRx7Qa45oSzCdc4TUAdFOuYXsHzWrBi1653DdpgoSYVEDapOfP2GoelJKGDi86
	H8rIH+2+iS5URDU9qkxnvEMtypI3Fn0RpJiK9I7Un+120AD/Q8mZRj3SLxPuZAVkjEk3
	FWo6cv8JZvL5VGir/22SEb/WEvImzB5GzPSTIb7DnJay2weJs6kWnMEnEa3fMYn1f1e9
	4J6W2CyvniP5HYzVKknAtfUuRHFDXZ9UVlndIXSP+9ezQdJ8PFeNRX6qpAlD+FZEIClx
	3GyuW+G1rhvPdDBDRTmlBd0MzA5lBWj+CkT4+Lr1hw98qp8Aio4wFoWCJy9YKMyMzjMu
	dLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K2lXhqD8MRkEvKSQOGYyHaEQ4x6C+cTsI14aDvN8VJo=;
	b=AlMjxuoMB0qlxbgfEabTPSAlA7s140A3jEuoUWruNhlmcwCpDxj/gWRKXUs0PU2uU7
	bbSJFiHCqPvMO4y0I8aZpZfggRbr64ZH+3SCY/zQ9LIjTIMTRCaX0LGTx9O/Y8A+h/s1
	sPNZ3b8rFtuBilYSv3t9ubPciCV00no5lWNbtsw0bkErSTNcN8CsJbfa+eTZ1fVzv0OE
	fpQY4zRlm5+iw7cHRTtoa3Y77Gp1v1FTAq9YxlOOs7yEvvhVJ4oa3FmB8VLlzRAZTccW
	gNyEXQ6Y8z0fOybIJyiw1Qp7DeImC1Ts9RnmlQ8gWd86JF9OFMtAMYL9tcIkrpVX0DJu
	uH0w==
X-Gm-Message-State: AElRT7E871OLaDY7zVP6KUWND8F/zFPhx/0o2nbXC95l3W3aH21GV1S3
	L+Zmbp1ufPKUp+p/uzhF0OsVdA==
X-Google-Smtp-Source: AIpwx4/h+6ufGHZ2FPOdgTblbjPLyIveBTOLk9uSF4dX0OoIQ4sTZFuKR7MayL0CAugbpuNmoXM3/A==
X-Received: by 2002:a17:902:830a:: with SMTP id
	bd10-v6mr16152921plb.322.1522806563362; 
	Tue, 03 Apr 2018 18:49:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:48:59 -0700
Message-Id: <cover.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/21] Package updates for Master
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:22 -0000

Please concider these changes for master next. 
The X11 changes should not go in sumo. These changes will affect meta-oe
and possible others

The following changes since commit 4cedddb83623c79980b354642dfeaf78218ca4b7:

  libpcre-ptest: skip locale test (2018-03-30 09:40:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/master-updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akuster/master-updates

Armin Kuster (21):
  libpcre2: update to 10.31
  xprop: update to 1.2.3
  xkeypboard-config: update to 2.23.1
  xkbcomp: update to 1.4.1
  xinit: update to 1.4.0
  xwininfo: update to 1.1.4
  gnutls: update to 3.6.2
  xeyes: update to 1.1.2
  libshmfence: update to 1.3
  xset: update to 1.2.4
  xcb-proto: update to 1.13
  curl: update to 7.59.0
  mkfontscale: update to 1.1.3
  util-macros: update to 1.19.2
  libxcb: update to 1.13
  xf86-video-vesa: update 2.4.0 update
  xorgproto: add replacement for depricated calibrateproto
  *proto: remove depricated xorg proto header recipes and replace by
    xorgproto
  maintainers and distro: replace deprecated *protro header files with
    xorgproto
  xorg: replace depricated *proto depends with xorgproto
  maintainers: update email address

 meta/conf/distro/include/distro_alias.inc          |  30 +--
 meta/conf/distro/include/maintainers.inc           | 238 +++++++++------------
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} |   6 +-
 meta/recipes-graphics/xorg-app/rgb_1.0.6.bb        |   2 +-
 meta/recipes-graphics/xorg-app/xev_1.2.2.bb        |   2 +-
 .../xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb}    |   4 +-
 .../xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb}    |   4 +-
 .../{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb}         |   6 +-
 .../xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb}    |   4 +-
 .../xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb}      |   4 +-
 .../{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb}       |   4 +-
 .../xorg-driver/xf86-video-intel_git.bb            |   6 +-
 .../xorg-driver/xf86-video-omap_0.4.5.bb           |   2 +-
 ...ideo-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} |   8 +-
 .../xorg-driver/xf86-video-vmware_13.2.1.bb        |   2 +-
 .../xorg-driver/xorg-driver-common.inc             |   2 +-
 .../xorg-driver/xorg-driver-input.inc              |   2 +-
 .../xorg-driver/xorg-driver-video.inc              |   2 +-
 meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb     |   2 +-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb |   2 +-
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |   2 +-
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb      |   2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |   4 +-
 meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb     |   2 +-
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb |   2 +-
 .../Fix-inconsistent-use-of-tabs-vs.-space.patch   |  62 ------
 .../xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb}    |   8 +-
 .../xorg-lib/libxcomposite_0.4.4.bb                |   2 +-
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb |   2 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb   |   2 +-
 meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb    |   2 +-
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb  |   2 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb  |   2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb   |   2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb      |   2 +-
 .../recipes-graphics/xorg-lib/libxinerama_1.1.3.bb |   2 +-
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb |   2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb  |   2 +-
 .../recipes-graphics/xorg-lib/libxrender_0.9.10.bb |   2 +-
 meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb    |   2 +-
 .../xorg-lib/libxscrnsaver_1.2.2.bb                |   2 +-
 .../xorg-lib/libxshmfence/extensions.patch         |  14 +-
 .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}   |   4 +-
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |   2 +-
 meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb    |   2 +-
 meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb     |   2 +-
 meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb   |   2 +-
 .../recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb |   2 +-
 .../xorg-lib/libxxf86misc_1.0.3.bb                 |   2 +-
 meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb |   2 +-
 ...d-config_2.22.bb => xkeyboard-config_2.23.1.bb} |   4 +-
 .../xorg-proto/bigreqsproto_1.1.2.bb               |  16 --
 .../xorg-proto/calibrateproto/fix.patch            |  42 ----
 .../xorg-proto/calibrateproto_git.bb               |  21 --
 .../xorg-proto/compositeproto_0.4.2.bb             |  21 --
 .../xorg-proto/damageproto_1.2.1.bb                |  20 --
 meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb |  18 --
 meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb  |  15 --
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  |  14 --
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |  22 --
 .../xorg-proto/fontsproto_2.1.3.bb                 |  18 --
 meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb |  18 --
 .../xorg-proto/inputproto_2.3.2.bb                 |  22 --
 meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb  |  18 --
 .../xorg-proto/presentproto_git.bb                 |  22 --
 .../xorg-proto/randrproto_1.5.0.bb                 |  19 --
 .../xorg-proto/recordproto_1.14.2.bb               |  18 --
 .../xorg-proto/renderproto_0.11.1.bb               |  21 --
 .../xorg-proto/resourceproto_1.2.0.bb              |  19 --
 .../xorg-proto/scrnsaverproto_1.2.2.bb             |  19 --
 .../xorg-proto/videoproto_2.3.3.bb                 |  14 --
 .../0001-Make-whitespace-use-consistent.patch      | 215 -------------------
 ...print-is-a-function-and-needs-parentheses.patch |  75 -------
 .../{xcb-proto_1.12.bb => xcb-proto_1.13.bb}       |  10 +-
 .../xorg-proto/xcmiscproto_1.2.2.bb                |  17 --
 .../recipes-graphics/xorg-proto/xextproto_7.3.0.bb |  24 ---
 .../xorg-proto/xf86dgaproto_2.1.bb                 |  18 --
 .../xorg-proto/xf86driproto_2.1.1.bb               |  17 --
 .../xorg-proto/xf86miscproto_0.9.3.bb              |  17 --
 .../xorg-proto/xf86vidmodeproto_2.3.1.bb           |  18 --
 .../xorg-proto/xineramaproto_1.2.1.bb              |  19 --
 .../xorg-proto/xorgproto_2018.4.bb                 |  14 ++
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     |  24 ---
 meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb  |  19 --
 .../recipes-graphics/xorg-util/makedepend_1.0.5.bb |   2 +-
 ...util-macros_1.19.1.bb => util-macros_1.19.2.bb} |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  12 +-
 .../curl/{curl_7.58.0.bb => curl_7.59.0.bb}        |   4 +-
 .../gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb}    |   4 +-
 .../{libpcre2_10.30.bb => libpcre2_10.31.bb}       |   6 +-
 91 files changed, 217 insertions(+), 1183 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} (71%)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} (72%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb} (75%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} (78%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb} (72%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} (70%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} (87%)
 delete mode 100644 meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/presentproto_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.12.bb => xcb-proto_1.13.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
 create mode 100644 meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb} (75%)
 rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)
 rename meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} (54%)
 rename meta/recipes-support/libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb} (90%)

-- 
2.7.4


