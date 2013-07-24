Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 08FDE60842
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:14 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so190623eaj.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=d+tXpgKKBtqAt0i9KucSEcEJlM5fYeNFgPcayFc8yk8=;
	b=gN7VEYTraouYoFOm11AoQBIHszucCB0oniBeH8I1thPdkVc+ZQDtf8C0BDCUq6qklS
	g2744PyOXZ9ZHKMOEG+qWpFVhrNZcDvAkvjEh4xXlVXB3o1W/M4WiX3KbOO8I0JZPVYJ
	mbh87K3XpVdpeQwmBd1MrG02jVmbr0WjDUfUp2ZY0ADpCzo7xoyQNmWk50itkEHEyJ4X
	7PVC8ctuxScSJ7JXiDzeUOMESAzMDOaxXImUX4p0omw5Qg6ifkRz0PeaovKuKSG+uHmj
	b4tbcOkPD5UKXKxqT3Zb2gXd4lBfHAxMMIYLWDza3aAiHT4ghe8yarV+kMbPx0eDemEz
	Turw==
X-Received: by 10.15.94.142 with SMTP id bb14mr37542627eeb.112.1374667335305; 
	Wed, 24 Jul 2013 05:02:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm65675360eeu.2.2013.07.24.05.02.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:36 +0200
Message-Id: <cover.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 00/18] autodetected dependencies
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:15 -0000

The following changes since commit ac5d20f4adac69ea1702694fb50849c9e465b443:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-23 07:49:54 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/deps

Martin Jansa (18):
  test-dependencies: add simple script to detect missing or autoenabled
    dependencies
  gst-plugins-bad: add few more PACKAGECONFIGs
  xkeyboard-config: add missing dependency on util-macros
  ccache: add zlib dependency
  cups: add PACKAGECONFIG for acl
  directfb: add PACKAGECONFIG for jpeg2000
  distcc: add PACKAGECONFIG for popt
  grub: add PACKAGECONFIG for grub-mount
  mailx: remove support for autodetection of krb5
  minicom: add configure option and PACKAGECONFIG for lockdev
  ltp: add acl, openssl dependency
  patch: add PACKAGECONFIG for attr
  python-imaging: add PACKAGECONFIG for lcms
  socat: add PACKAGECONFIG for tcp-wrappers
  sudo: add PACKAGECONFIG for zlib
  gstreamer1.0-plugins-good: add PACKAGECONFIG for v4l
  gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, v4l,
    bzip2, orc
  gettext: disable nls when INHIBIT_DEFAULT_DEPS is set

 meta/classes/gettext.bbclass                       |   4 +-
 meta/recipes-bsp/grub/grub_2.00.bb                 |   3 +
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   3 +
 meta/recipes-devtools/ccache/ccache.inc            |   2 +
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   4 +-
 meta/recipes-devtools/patch/patch.inc              |   3 +
 .../allow.to.disable.some.features.patch           |  65 ++++++
 .../python/python-imaging_1.1.7.bb                 |  10 +-
 meta/recipes-extended/cups/cups16.inc              |   1 +
 meta/recipes-extended/ltp/ltp_20130503.bb          |   2 +-
 .../explicitly.disable.krb5.support.patch          |  46 ++++
 meta/recipes-extended/mailx/mailx_12.5.bb          |   1 +
 .../minicom-2.6.2/allow.to.disable.lockdev.patch   |  21 ++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |   7 +-
 meta/recipes-extended/sudo/sudo.inc                |   3 +
 meta/recipes-graphics/directfb/directfb.inc        |   3 +
 .../xorg-lib/xkeyboard-config_2.9.bb               |   2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |  10 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |  12 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   2 +-
 scripts/test-dependencies.sh                       | 256 +++++++++++++++++++++
 21 files changed, 449 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 create mode 100644 meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
 create mode 100755 scripts/test-dependencies.sh

-- 
1.8.3.2


