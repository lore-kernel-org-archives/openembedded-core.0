Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 126545 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 May 2014 16:00:07 UTC
Received: from mail-pb0-f47.google.com (unknown [209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id C4CA26B737
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 16:00:07 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so2691382pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4r4UfZ8hyW3jc+sf2usRK1HwsoWw5oksz1fLWBQmMg4=;
	b=Yr+Hxaoj/ef+dPBvWhDA8GjFiTetXXRfD5kYka9vd8cX3lY2WaIGfCVRu6sRiwzP18
	r7ahOdw36Dn9m6G1kMJ4NKdM4hTQKZGf53h/8FBvVklQKylv4n+RwibiEkqangC0Yxq/
	FF41bRntZZKtu6pIx63hi2aB0GCYfv/QxzlXXND/uvymqxV/5oAwPLuJeVUZA1l6JjTc
	C8h1IqXvZFnkySvgjVSU1KttYXpoWw7GbpsEnZr6Ag3+UZvjKkql8GZZxMs7Ub0+TXyv
	pgYBvSa1UbHNpxM2Pqiv3DC8BPQkJrYctDpzVqlEN9Wiy8fSL45pNh4inzDn7yQNPkso
	SXyQ==
X-Received: by 10.69.19.225 with SMTP id gx1mr69113485pbd.34.1400774408140;
	Thu, 22 May 2014 09:00:08 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id xz7sm978867pac.3.2014.05.22.09.00.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 09:00:07 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 09:02:18 -0700
Message-Id: <1400774540-4405-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [RFC/RFT 0/2] wayland/weston: upgrade to 1.5.0
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
X-List-Received-Date: Thu, 22 May 2014 16:00:13 -0000

From: Tim Orling <TicoTimo@gmail.com>

The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/wayland-weston-1.5.0
  http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/wayland-weston-1.5.0

* has not been functionally tested yet
* for JaMa test-dependencies:
  -> make-lcms-configurable.patch does not work as intended, needs attention
  -> poppler no longer included in weston
  
Tim Orling (2):
  wayland: upgrade to 1.5.0
  weston: upgrade to 1.5.0

 ...disable-macro-checks-not-used-for-scanner.patch |  2 +-
 .../wayland/wayland/just-scanner.patch             | 49 ----------------------
 .../wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} |  7 ++--
 ...emove-dependence-on-wayland-scanner-flags.patch | 30 -------------
 .../weston/disable-wayland-scanner-pkg-check.patch | 13 ++++++
 .../wayland/weston/make-lcms-configurable.patch    | 22 ++++++++++
 .../wayland/{weston_1.4.0.bb => weston_1.5.0.bb}   | 13 +++---
 7 files changed, 47 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/just-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} (89%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.4.0.bb => weston_1.5.0.bb} (88%)

-- 
1.8.3.2


