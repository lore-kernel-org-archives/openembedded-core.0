Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAE960959
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 10:20:25 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id fs12so58726lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mEG6Rx6ziDy5PiW4Tf2HxTx0J0LKJkn74J3KqJz3suQ=;
	b=J2pFmIT3Eau/m6hetQVdjDTLnCRy0WpY3RiiGgqGN5B65tA/wY8GiOQoHGgj3h2Ppu
	xIKQK+IjIyEjaT5t5Eh0F6/AK2uwmBT+3C/Qn12FxFsEOgFNp/GUfO9mB777wtYtCrgc
	ZmMtlvGqiwiJGyrAs4FOTOU9VgUk7/9ZF3lzKAcSaIcwJ3kzLklFvVqZnIveNQgwj3ZS
	UE9Is9iiIw77FMAk4dta9Xa8dKGGb71dpdh/OUX8fGkO3uComjStJ2Isss/g2ivw3t4m
	0E+3wgh8KHBXsc5lHRjJ+yY4G8cgf7b9L1/NXeV85gBwQhpBJKrZfNOIbYHZgm0TLcJc
	u5hQ==
X-Received: by 10.152.116.7 with SMTP id js7mr3280299lab.7.1369909224912;
	Thu, 30 May 2013 03:20:24 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id a3sm10657948lbg.2.2013.05.30.03.20.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 30 May 2013 03:20:24 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Uhzy2-0005oN-FB; Thu, 30 May 2013 13:20:22 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 13:20:20 +0300
Message-Id: <cover.1369909097.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Misc package upgrades
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
X-List-Received-Date: Thu, 30 May 2013 10:20:25 -0000

zlib update now using tar.xz source package. Other updates
have not been submitted before.

The following changes since commit 984eb9e25b658c5e9a870983841060aca32bc137:

  bind: add ipv6 support (2013-05-29 22:20:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (4):
  zlib: update to upstream version 1.2.8
  icu: update to upstream version 51.2
  pixman: update to upstream version 0.30.0
  atk: update to upstream version 2.8.0

 .../{zlib-1.2.7 => zlib-1.2.8}/remove.ldconfig.call.patch   |    0
 meta/recipes-core/zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb}     |   11 ++++++-----
 .../xorg-lib/{pixman_0.29.4.bb => pixman_0.30.0.bb}         |    4 ++--
 meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb}     |    6 +++---
 meta/recipes-support/icu/icu.inc                            |    1 +
 meta/recipes-support/icu/icu_50.1.2.bb                      |   11 -----------
 meta/recipes-support/icu/icu_51.2.bb                        |   11 +++++++++++
 7 files changed, 23 insertions(+), 21 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.7 => zlib-1.2.8}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.29.4.bb => pixman_0.30.0.bb} (89%)
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb} (75%)
 delete mode 100644 meta/recipes-support/icu/icu_50.1.2.bb
 create mode 100644 meta/recipes-support/icu/icu_51.2.bb

-- 
1.7.10.4


