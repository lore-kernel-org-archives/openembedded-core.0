Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id CB26478295
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 15:00:48 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id b7-v6so10353993plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vHzXoT/9w9jsylm0Z3X738cyoOW0TqPQSsTNj35oCVw=;
	b=heostqgHL34ibd1hR3jZ3aXawPaK4t0WbybazIuK2+fDi53GQBAfizG7XTpT6l1JkA
	CONPEsdRUQ1w3WYeEHkOvheZ5EhUpcRIqhSucffKURwcbtDzXsJ3FpcxeLoOOQJtGH1e
	fzJ9Jm23dmy0MgbCNGAjZo4pg0qnMd5+PewqL6J8WlsvXnyFrD3/fTEWTVUi8Pcf2TTm
	+P2fVIZV7q2oV7KqN4PxREiZlgF+2xQIZc8M5rR/bgc4iaiheCIn4pbAZn9TFeBoG3Lk
	UY5e56HaHp0fXdg/oXHUct0w36Ca3nOUb4bymGuOW6DBXj+BLRc7Y27TrQTNxrYhy3QM
	37DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vHzXoT/9w9jsylm0Z3X738cyoOW0TqPQSsTNj35oCVw=;
	b=BdqE356AW+78JukuCAuiWg6EKWqBpfBET13VWfd/QQlIj6tGh2/HwPgK4UNJpaB0aT
	g1sHniV1WCIfBBcGAAPly/VM6cdTwaDv3StTFeDJ2Qh9ErNg301v5bo4IkqJ8G+O4xWB
	wF2V7UrgJcXpLs5GEwbTK70z2K9BQTeJaDMd8WTcwk2NrtZQwj4+GThXbeOsOh2slir5
	hd+moEtse2NUUqlX3C8GF/acaj/lZv3bKeUhezstEhRF6Eg7lIjGnuydta3DcL3AI8Yq
	tvF5AnXl7JZtRNtvrJgkQ0cQjrKK6nsBZxLmCvWQ3fy5G7rDxk4n8tWm8q/w+K2yWDWt
	MygQ==
X-Gm-Message-State: AElRT7EyWZAYiRkTPZRtyyWOPSPywcz3shhPqfOMoJ5r7O4/Q/GnIUvz
	p8+7JPI69+cMixFrN01FV63WMw==
X-Google-Smtp-Source: AG47ELtVpQFIKu9C3civIATRJWJVYRJN9W//yDNI2gJJz1ugB1yvNUwyoIUQZ0TaWTOIcun7Tc51lw==
X-Received: by 2002:a17:902:6bc1:: with SMTP id
	m1-v6mr6384058plt.239.1521990049130; 
	Sun, 25 Mar 2018 08:00:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:2db3:d824:9df5:a117])
	by smtp.gmail.com with ESMTPSA id
	f4sm2305516pfn.150.2018.03.25.08.00.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Mar 2018 08:00:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2018 08:00:24 -0700
Message-Id: <cover.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/21] PKG updates and QA warning fix
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
X-List-Received-Date: Sun, 25 Mar 2018 15:00:48 -0000

From: Armin Kuster <akuster@mvista.com>

Cover letter only

Please consider these updates for master-next. 
nss has an outstanding patch sitting in the queue somewhere.
Passed AB except failures not related to these changes.

The following changes since commit f49ee61422c867516db252054e993df29f775136:

  systemd-boot: upgrade to 237 (2018-03-20 09:59:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/mut-pkg-up
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/mut-pkg-up

Armin Kuster (21):
  ltp: add rdepend for procps
  libpcre2: update to 10.31
  xprop: update to 1.2.3
  xkeypboard-config: update to 2.23.1
  nss: update to 3.35
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
  nspr: update to 4.19
  libxcb: update to 1.13
  xf86-video-vesa: update 2.4.0 update
  tzcode-native: update to 2018d
  tzdata: update to 2018d

 meta/recipes-extended/ltp/ltp_20180118.bb          |   1 +
 ...code-native_2018c.bb => tzcode-native_2018d.bb} |   8 +-
 .../tzdata/{tzdata_2018c.bb => tzdata_2018d.bb}    |   4 +-
 .../{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} |   4 +-
 .../xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb}    |   4 +-
 .../xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb}    |   4 +-
 .../{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb}         |   6 +-
 .../xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb}    |   4 +-
 .../xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb}      |   4 +-
 .../{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb}       |   4 +-
 ...ideo-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} |   6 +-
 .../Fix-inconsistent-use-of-tabs-vs.-space.patch   |  62 ------
 .../xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb}    |   6 +-
 .../xorg-lib/libxshmfence/extensions.patch         |  14 +-
 .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}   |   4 +-
 ...d-config_2.22.bb => xkeyboard-config_2.23.1.bb} |   4 +-
 .../0001-Make-whitespace-use-consistent.patch      | 215 ---------------------
 ...print-is-a-function-and-needs-parentheses.patch |  75 -------
 .../{xcb-proto_1.12.bb => xcb-proto_1.13.bb}       |  10 +-
 ...util-macros_1.19.1.bb => util-macros_1.19.2.bb} |   4 +-
 .../curl/{curl_7.58.0.bb => curl_7.59.0.bb}        |   4 +-
 .../gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb}    |   4 +-
 .../{libpcre2_10.30.bb => libpcre2_10.31.bb}       |   6 +-
 ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch |  30 ---
 .../nspr/{nspr_4.18.bb => nspr_4.19.bb}            |   5 +-
 .../nss/nss/nss-build-hacl-poly1305-aarch64.patch  |  30 +++
 .../nss/{nss_3.34.1.bb => nss_3.35.bb}             |   5 +-
 27 files changed, 86 insertions(+), 441 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018c.bb => tzcode-native_2018d.bb} (70%)
 rename meta/recipes-extended/tzdata/{tzdata_2018c.bb => tzdata_2018d.bb} (98%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} (72%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb} (75%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} (78%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb} (72%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} (77%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} (87%)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.12.bb => xcb-proto_1.13.bb} (83%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb} (75%)
 rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)
 rename meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} (54%)
 rename meta/recipes-support/libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb} (90%)
 delete mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
 rename meta/recipes-support/nspr/{nspr_4.18.bb => nspr_4.19.bb} (95%)
 create mode 100644 meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
 rename meta/recipes-support/nss/{nss_3.34.1.bb => nss_3.35.bb} (97%)

-- 
2.7.4


