Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E4E2D7579E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:41:55 +0000 (UTC)
Received: by iecwk5 with SMTP id wk5so16858665iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=shdX95HgBMTnF/p2QsZKoFqCDjAM2+d3Z05i2qIXusI=;
	b=h/PHrmxXvDE8VAVtLYynvf8xX5jVSNLZfCb3GFzKYLzEsK7oa+6EfNoQ5lMmZlNLhh
	NnYjkSGGN5wZY322D1jwL+rmCx2Vrp8fH8Dht9k3zNw7B8eRxJ3J2rsGKJ0J/YHw+kBH
	fxcfDgUQKzNoLYEOciXs0wAR7B0V6LrtuoyetcJnCTsSuRUqGRsBYseOdl3HArvkDNBs
	wuyV3WcEuYMFudYPZ/j9ujiaclZdY7GZ+JMxOuPBk3iNa7JOufixmFNwQFwmXTDzkQKk
	xE/Xb9/i6TQsdn1RPpCTWD3t8LsdWwe0FoorXkJE3q4x7oW+kUbj4aI3ECyKoO3Mycf7
	Wo6g==
X-Received: by 10.50.30.197 with SMTP id u5mr28599570igh.9.1433349716059;
	Wed, 03 Jun 2015 09:41:56 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by mx.google.com with ESMTPSA id
	g12sm15056389ioe.28.2015.06.03.09.41.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 09:41:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 09:41:48 -0700
Message-Id: <cover.1433349512.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Wayland 1.8 upgrade
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
X-List-Received-Date: Wed, 03 Jun 2015 16:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This brings in wayland 1.8 component upgrade
runqemu change is required to let emulators keep working with wayland's shift to libinput backend
lsof,libpam issues fixes as exposed when compiled for musl

Khem Raj (4):
  wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice
  libpam: Fix wrong crypt library detection
  lsof: Remove LSOF_OS

 meta/recipes-extended/lsof/lsof_4.88.bb            |  5 +-
 .../pam/libpam/crypt_configure.patch               | 31 +++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |  6 +-
 .../wayland/{libinput_0.7.0.bb => libinput_git.bb} | 15 ++--
 .../wayland/{wayland_1.6.0.bb => wayland_1.8.0.bb} |  9 ++-
 .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++++++++
 .../weston/disable-wayland-scanner-pkg-check.patch | 20 +++---
 .../wayland/{weston_1.6.0.bb => weston_1.8.0.bb}   | 25 ++++---
 scripts/runqemu-internal                           |  4 +-
 9 files changed, 162 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/crypt_configure.patch
 rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb => libinput_git.bb} (42%)
 rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.0.bb} (87%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_1.6.0.bb => weston_1.8.0.bb} (84%)

-- 
2.1.4


