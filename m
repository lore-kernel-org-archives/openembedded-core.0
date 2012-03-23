Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD7M-0006qy-K4
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:37:56 +0100
Received: by wera1 with SMTP id a1so3009682wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZtPCm5PhIjc7MZy177HAaG30Ntr9c3lHsk1XqUAD9yg=;
	b=PkqybAjdGb4C5XusLDZvwTzpVUg1pa0+x36VHriBukP6tyYqJ51U8KswkOEVcxjwGn
	w3BhXJwMCcGP8r24jRfW0/jpoIV9tN2ddw2QNnC8dEYHMFVCFAm6e6JqC2j/YH1e7Hj/
	vcrB9XRhg/sAGmNUJYrQbja3xLE49fwwHJRR2v0cjCed7TzBb85oUpjBJLlhRtzZ0eJP
	ma0IbRK3oHi2l7FycwudPpYM2xLRlicrGzJYeV3GDEhN3PJl0hIiwInj+mxp6m+89les
	RDXXZbaa9x3EODdg4j7r5kuYNuVTtQQ9UyMxMSY6RmsOkpRfZJb79ygqTdfSM3OSgjxi
	fEsQ==
Received: by 10.216.141.212 with SMTP id g62mr8022264wej.2.1332541740072;
	Fri, 23 Mar 2012 15:29:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm28693630wid.2.2012.03.23.15.28.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:28:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:28:55 +0100
Message-Id: <cover.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 00/10] Merge native BBCLASSEXTENDs and SDK fix
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
X-List-Received-Date: Fri, 23 Mar 2012 22:37:56 -0000

V2: removes 3 patches from original patchset because of RPs feedback
  [oe-core][PATCH 04/13] base.bbclass: extract *virtclass_map_dependencies logic from native/nativesdk bbclasses and call it f
  [oe-core][PATCH 05/13] xorg: add more native BBCLASSEXTENDs for gtk+-native                                                 
  [oe-core][PATCH 06/13] gtk+: import native support from meta-oe                                                             

pango-native is not nice, but retested today on RP's request and it's really 
mandatory dependency of librsvg (pangoft2 dependency is dropped in newer librsvg 
versions, but pangocairo is mandatory in all).

The following changes since commit 7ad7c837bac0cd086098be0d7cdf5cd8388a8696:

  taglib: Refresh patch after recent accidental breakage (2012-03-23 18:30:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (2):
  xev: move from meta-demoapps
  classes: scons: add EXTRA_OESCONS

Martin Jansa (8):
  bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
  librsvg: import native support from meta-oe
  pixman: add native support and perl-native to DEPENDS from meta-oe
  cairo: import native support from meta-oe
  tiff: import native support from meta-oe
  libusb*: import native support from meta-oe
  pango: import native support and --disable-introspection from meta-oe
  rootfs_ipk: replace 3 opkg-cl calls with one in get_package_filename

 .../recipes-graphics/xorg-app/xev_1.0.3.bb         |    7 -------
 meta/classes/rootfs_ipk.bbclass                    |    7 ++++---
 meta/classes/scons.bbclass                         |    6 ++++--
 meta/conf/bitbake.conf                             |    4 ++--
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 ++
 meta/recipes-graphics/cairo/cairo.inc              |    1 +
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    3 +++
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    0
 meta/recipes-graphics/xorg-app/xev_1.0.3.bb        |   10 ++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb    |    3 ++-
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb      |    1 +
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
 14 files changed, 37 insertions(+), 18 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb
 rename {meta-demoapps => meta}/recipes-graphics/xorg-app/xev/diet-x11.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.0.3.bb

-- 
1.7.8.5



