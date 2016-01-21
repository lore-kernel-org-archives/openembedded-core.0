Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6620360670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:30 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a202so1409668oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5KUZd1xXVhBGNHoRIMPhyUMfjZn6EssgJ1ftWAKiOX8=;
	b=k+QZD/fXQgsXwP6uH7n8aldyvhcpOr4dPt9d5UGPyguMa9mwSh+bBIpaaexiHysRkr
	HhxipU39i56L6S/Z4PiucaKqFvvNBS8vABjdL3SOZZ9Geuuwel9aVgmAJVhOsoAvWgwY
	S53AbrCZAG3eVcNWy4XcSBcpVi99SDkVrl7piuanoXEqfSPNG2+w43pDnJEu5KAqMX94
	Lep4PKxSuwgBJ9YSJAo5+wZIm1xKxb6sMLbJKwcwFLHzQDguFAjw3Qu2RP1JgZm1XqFR
	BYhsSq5gbezJw0qdKBsrKi8IB9Dx7vduZw3ohaGuXhPEracNWkPj+QVeR59cY7JW/sEH
	6oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5KUZd1xXVhBGNHoRIMPhyUMfjZn6EssgJ1ftWAKiOX8=;
	b=LtuPPm2H+11guHjrGQdBabpFI46Oat8pwLc+qPIRThdU4NBMR/sRmUdAoehYo13BIl
	WeO0P2iOIxi+QiYmThOIa12xrfnCFcOwWE5FYIv5U+gE1XiN3bz3l/OdW4ueVDq+SE/A
	4z0lJaP3WphEjEeR/EL46IsZC3UT/iHsl/ZNP9D+M+q3D0TUy/BcmUKQG3EjIXWby3l2
	VNum5nysjyveAC60hraPzcCGp3lf6wuQ+YFb+jROXhwnYJvL8JAYcjgp1uuAsGv18J4P
	jEhLvCkob9i4eoEuaV2TZRy57fBU3zsWY8+L/Pn+i6FNOQnsfk6C1N0JxweCOXF7EGM1
	7BFA==
X-Gm-Message-State: ALoCoQlAUOhQA5tTT2AQA0OUdOmvQL6/qE0SWX9+Ik5cM8fRnVDYjl/tQgnHismAhFhmSIsuXLKTvDXKtqtpQmsH+9K+tvKJYw==
X-Received: by 10.202.87.194 with SMTP id l185mr29395317oib.52.1453344211643; 
	Wed, 20 Jan 2016 18:43:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:42:58 -0800
Message-Id: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/25] gstreamer1.0 cleanups + update git recipes to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:32 -0000

Andre McCurdy (25):
  gst-player: minor formatting improvements
  gst-plugins-package.inc: minor formatting improvements
  gstreamer1.0: minor formatting improvements
  gstreamer1.0-plugins.inc: minor formatting improvements
  gstreamer1.0-plugins-base: minor formatting improvements
  gstreamer1.0-plugins-good: minor formatting improvements
  gstreamer1.0-plugins-bad: minor formatting improvements
  gstreamer1.0-plugins-ugly: minor formatting improvements
  gstreamer1.0-libav: minor formatting improvements + update HOMEPAGE
  gstreamer1.0-omx: minor formatting improvements + update HOMEPAGE
  gstreamer1.0-rtsp-server.inc: minor formatting improvements
  gstreamer1.0.inc: add missing glib-2.0-native dependency
  gstreamer1.0-plugins.inc: add missing glib-2.0-native dependency
  gstreamer1.0-plugins.inc: convert GSTREAMER_1_0_DEBUG to a
    PACKAGECONFIG
  gstreamer1.0-plugins-good.inc: remove duplicate --disable-examples
  gstreamer1.0-plugins-bad.inc: don't set ${S} or apply version specific
    patch
  gstreamer1.0-plugins-bad.inc: update hls dependency gnutls -> nettle
  gstreamer1.0-plugins.inc: drop obsolete lib-link.m4 workaround
  gstreamer1.0-plugins.inc: don't set base SRC_URI via python
  gstreamer1.0: update git recipe to 1.7.1
  gstreamer1.0-plugins-base: update git recipe to 1.7.1
  gstreamer1.0-plugins-good: update git recipe to 1.7.1
  gstreamer1.0-plugins-bad: update git recipe to 1.7.1
  gstreamer1.0-plugins-ugly: update git recipe to 1.7.1
  gstreamer1.0-libav: update git recipe to 1.7.1

 .../recipes-multimedia/gstreamer/gst-player_git.bb |  3 +-
 .../gstreamer/gst-plugins-package.inc              |  7 +-
 .../gstreamer/gstreamer1.0-libav.inc               | 15 +++--
 .../gstreamer/gstreamer1.0-libav_1.6.2.bb          |  5 +-
 .../gstreamer/gstreamer1.0-libav_git.bb            | 26 +++++---
 .../gstreamer/gstreamer1.0-omx.inc                 |  7 +-
 .../gstreamer/gstreamer1.0-omx_1.2.0.bb            |  1 -
 .../gstreamer/gstreamer1.0-omx_git.bb              |  7 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 74 ++++++++++------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    | 11 ++--
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 43 +++++++++----
 .../gstreamer/gstreamer1.0-plugins-base.inc        | 26 ++++----
 ...make-gio_unix_2_0-dependency-configurable.patch | 47 ++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   | 13 ++--
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 22 ++++---
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 36 +++++------
 .../gstreamer/gstreamer1.0-plugins-good_1.6.2.bb   |  6 +-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     | 18 ++++--
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        | 14 ++--
 .../gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb   |  7 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     | 20 ++++--
 .../gstreamer/gstreamer1.0-plugins.inc             | 41 +++---------
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  4 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 29 +++++----
 .../gstreamer/gstreamer1.0_1.6.2.bb                |  2 +-
 .../gstreamer/gstreamer1.0_git.bb                  | 19 ++++--
 26 files changed, 290 insertions(+), 213 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch

-- 
1.9.1


