Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF0D47D3B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 205so8871283pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=N3RTR9sgH0TunvNR3P+l6hrCS1E9CyfwUbpBLe4SJPI=;
	b=TgSf7ap9622J+tFje4PeZIG6UQA+jZa0YU/gLDIZzfBuwYc6elVcRrfaBJ6vQEpWNR
	vceq9cK4ktOX3y+Yjj281daVhxSoEQYM2Ab1XqT97KuYAS8uuU1CpuJxpLCsw1rERzsl
	X/3KxhDDw1Syse6bnj/XtnLc6mN5x78nag5JJkpB6BdZHNvqIHAyDC1LElNnU6UiWyYP
	kAIT4VQZPrW00aYUYVdzlS5Oe/MdzkYcb9MhVl9fPMewl04bne4hgG2O0BF6sZyqlfpr
	7qb6dnw5o2TCky2odaDV1u6WL1OmqMu7eSwerudCg7huYVQ9RLIQVnqhtLZXFcv1uZm1
	r80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=N3RTR9sgH0TunvNR3P+l6hrCS1E9CyfwUbpBLe4SJPI=;
	b=ggCx/I1W2YlCe+PllL8aRvwM89jufLUto5KIsuDvusEyb5sbffSeJ4XZnGD+1t/Z2m
	EjgQudmZImxKSDIsB/Oa6NEi/jfFDLEe3X9MgaIBjrhpBhdtWlVni6OgY726Zlsh/pdb
	DKmSP7RW8vjDTe+JT3juopdQbVpNAyRSDcKe5xcR8FcdrR/Upx+/tiRolRGO9mG5Z2GS
	X+QWcXq25C/zA8cVoMk+aeYuak0ezBKwVnDaTrQBI6kPWowGFmdluTLPLARBaswuBCnT
	pXslhw62VtIA4LsRMtJdlVtrk8P3IZORrdnKZKEzbhQcq2XTHKUMMetaFh4/YsMMUWoL
	gAvw==
X-Gm-Message-State: APjAAAXKj+eo07wE36We3GWbox0Vp7FAdAB1/ocQbB5fQsyKzRTiYGKU
	sBuO5m7iWh0XKfQr8oum7winCzJOEos=
X-Google-Smtp-Source: APXvYqzLSiWCofc4hQ0CzxjywNUstxZDJ3XpIB90dsTb0YeuYlrnHBzPe8uzs5LhvWmhZIjXGQBhzg==
X-Received: by 2002:a62:aa0d:: with SMTP id e13mr33835296pff.4.1570461066432; 
	Mon, 07 Oct 2019 08:11:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:37 -0700
Message-Id: <cover.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud 00/26] Pull request
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:05 -0000

This has backports waiting for warrior to merge thus the delay for this request.

The following changes since commit d3d3f443039b03f1200a14bfe99f985592632018:

  build-appliance-image: Update to thud head revision (2019-08-01 11:58:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org//log/?h=stable/thud-next

Adrian Bunk (2):
  bind: upgrade 9.11.5 -> 9.11.5-P4
  dhcp: Replace OE specific patch for compatibility with latest bind
    with upstream patch

Alexander Kanavin (1):
  buildhistory: call a dependency parser only on actual dependency lists

Andrii Bordunov via Openembedded-core (4):
  curl: fix CVE-2018-16890 CVE-2019-3822 CVE-2019-3823
  dbus: fix CVE-2019-12749
  glib-2.0: fix CVE-2019-13012
  libcomps: fix CVE-2019-3817

Anuj Mittal (5):
  patch: fix CVE-2019-13636
  python3: fix CVE-2019-9740
  libxslt: fix CVE-2019-13117 CVE-2019-13118
  patch: backport fixes
  pango: fix CVE-2019-1010238

Armin Kuster (6):
  gcc: Security fix for CVE-2019-14250
  binutils: Security fix for CVE-2019-14444
  binutils: Security fix for CVE-2019-12972
  bind: update to latest LTS 9.11.5
  go: update to 1.11.13, minor updates
  dhcp: fix issue with new bind changes

Bartosz Golaszewski (1):
  qemu: add a patch fixing the native build on newer kernels

Bruce Ashfield (1):
  linux-yocto/4.14: update to v4.14.143

Dan Tran (3):
  binutils: Fix 4 CVEs
  python: Fix 3 CVEs
  python3: Fix CVEs

Muminul Islam (1):
  libxslt: Cve fix CVE-2019-11068

Ruslan Bilovol (1):
  dhcp: drop lost patch

Trevor Gamblin (1):
  patch: fix CVE-2019-13638

 meta/lib/oe/buildhistory_analysis.py               |   2 +-
 .../bind/bind/CVE-2018-5740.patch                  |  72 -----
 .../bind/{bind_9.11.4.bb => bind_9.11.5-P4.bb}     |   8 +-
 ...d-includes-of-new-BIND9-compatibility-hea.patch |  79 +++++
 .../dhcp/0008-tweak-to-support-external-bind.patch | 117 -------
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |   1 +
 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch   | 127 ++++++++
 meta/recipes-core/dbus/dbus_1.12.10.bb             |   1 +
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         |  47 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |   1 +
 meta/recipes-devtools/binutils/binutils-2.31.inc   |   6 +
 .../binutils/binutils/CVE-2018-1000876.patch       | 180 +++++++++++
 .../binutils/binutils/CVE-2018-20623.patch         |  74 +++++
 .../binutils/binutils/CVE-2018-20651.patch         |  35 +++
 .../binutils/binutils/CVE-2018-20671.patch         |  49 +++
 .../binutils/binutils/CVE-2019-12972.patch         |  39 +++
 .../binutils/binutils/CVE-2019-14444.patch         |  33 ++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
 .../gcc/gcc-8.2/CVE-2019-14250.patch               |  44 +++
 meta/recipes-devtools/go/go-1.11.inc               |   6 +-
 .../libcomps/libcomps/CVE-2019-3817.patch          |  97 ++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     |   1 +
 ...k-temporary-file-on-failed-ed-style-patch.patch |  93 ++++++
 ...ak-temporary-file-on-failed-multi-file-ed.patch |  80 +++++
 ...ke-ed-directly-instead-of-using-the-shell.patch |  44 +++
 .../patch/patch/CVE-2019-13636.patch               | 113 +++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   4 +
 .../python/python/bpo-30458-cve-2019-9740.patch    | 219 ++++++++++++++
 .../python/python/bpo-35121-cve-2018-20852.patch   | 127 ++++++++
 .../python/python3/CVE-2018-14647.patch            |  95 ++++++
 .../python/python3/CVE-2018-20406.patch            | 217 +++++++++++++
 .../python/python3/CVE-2018-20852.patch            | 129 ++++++++
 .../python/python3/CVE-2019-9636.patch             | 154 ++++++++++
 .../python/python3/CVE-2019-9740.patch             | 155 ++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   5 +
 meta/recipes-devtools/python/python_2.7.16.bb      |   2 +
 ...error-messages-when-qemi_cpu_kick_thread-.patch |  19 +-
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 336 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   1 +
 .../pango/pango/CVE-2019-1010238.patch             |  38 +++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  20 +-
 .../recipes-support/curl/curl/CVE-2018-16890.patch |  50 +++
 meta/recipes-support/curl/curl/CVE-2019-3822.patch |  47 +++
 meta/recipes-support/curl/curl/CVE-2019-3823.patch |  55 ++++
 meta/recipes-support/curl/curl_7.61.0.bb           |   3 +
 .../libxslt/files/CVE-2019-13117.patch             |  33 ++
 .../libxslt/files/CVE-2019-13118.patch             |  76 +++++
 .../libxslt/libxslt/CVE-2019-11068.patch           | 128 ++++++++
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |   5 +-
 52 files changed, 3059 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.11.5-P4.bb} (95%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-30458-cve-2019-9740.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-35121-cve-2018-20852.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-14647.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20406.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch

-- 
2.7.4


