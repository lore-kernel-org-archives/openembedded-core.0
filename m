Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id A791A7ED48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f19so305705plr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=baTP/oeUJmwHaPq5XlEmodV0v693jf5yf2JPQP9hyTg=;
	b=oUJ2QGy13psMNnzBSn5jVVeqYvpTEIZFDe2H7SAIuXmBwkzEKiU7BaknAYEKU3wAYs
	t9Sf6KT7WzAtO/3jaKsq9lE8Lu+SzPGzYXus6ASFrvHDqbPN15mKY6krQR/QKQrKViEB
	hw2zuS18wnm9u1wzC1AQXyIJX6EWVa9I717AtH867MarkaTfrux4BBwGoI22z4CRoDao
	E58zq5faBiVsD8xEIKC0f/o43uxGMj08gMXO0H92/o0GP7YHa4b5FMIqZWVRzc8EgsB1
	C6aBkyz3/ovdl2rU5jDrYHVNlMtW3z40JUY5Jbrb2ZpAGKmNs+x+AUS5W7A68zipBZk1
	bCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=baTP/oeUJmwHaPq5XlEmodV0v693jf5yf2JPQP9hyTg=;
	b=S+Va1HKBAC8kfAzJcs33awjMlt8+U9P0RwnZgOExhjshCl2N1JKq+jcVQJerG56syn
	nOA4ytjNh3SflR3+4N4tY7zCNEKcx751maxDe1iaKIFRGQk7p/0I72S8q7GKsEjWu0qz
	XWlf6wylXu6UYHyIl+FBRya2+Xv/S1L6FSqONUY9+l23j05GvfNx0rzVbKkcUhT0E3JR
	KXNC9QjrD6iM5zu03Z5A3mUrjJ34Ty6VmTLEM0fd1Z2Mgbry3wVxdU7TO18fyXukwsrr
	+Tw7cCwDrEA72xhif8OkDovxja/xNGn6EtUsIel0gLxXHMSFERV2dVOCGQHJ4qL7XAtZ
	Xxiw==
X-Gm-Message-State: APjAAAXlK5NaX9rsll3jNddBPkuqLfym00geT5uh97AzltQlQVJ9jDTA
	wS4XdUdrI7MIsVFsSDxh8keGtf/AJn0=
X-Google-Smtp-Source: APXvYqyhmfT+OGIjhRZROehBB3JTQt1qwwEd2+IFLeVk6JBaXtZ7kKJRMPd9toBSbRmOIPCPCzvvxA==
X-Received: by 2002:a17:902:864a:: with SMTP id
	y10mr564250plt.294.1569294804406; 
	Mon, 23 Sep 2019 20:13:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:12:56 -0700
Message-Id: <cover.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Thud][ 00/24] Thud patch review
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:23 -0000

Here is the lastes backports for thud-next.

Please review by Thursday.

The following changes since commit d3d3f443039b03f1200a14bfe99f985592632018:

  build-appliance-image: Update to thud head revision (2019-08-01 11:58:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-nmut
  http://cgit.openembedded.org//log/?h=stable/thud-nmut

Adrian Bunk (1):
  bind: upgrade 9.11.5 -> 9.11.5-P4

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

Trevor Gamblin (1):
  patch: fix CVE-2019-13638

 meta/lib/oe/buildhistory_analysis.py               |    2 +-
 .../bind/bind/CVE-2018-5740.patch                  |   72 -
 .../bind/{bind_9.11.4.bb => bind_9.11.5-P4.bb}     |    8 +-
 ...eplace-custom-isc_boolean_t-with-C-standa.patch | 2882 ++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |    1 +
 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch   |  127 +
 meta/recipes-core/dbus/dbus_1.12.10.bb             |    1 +
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         |   47 +
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |    1 +
 meta/recipes-devtools/binutils/binutils-2.31.inc   |    6 +
 .../binutils/binutils/CVE-2018-1000876.patch       |  180 ++
 .../binutils/binutils/CVE-2018-20623.patch         |   74 +
 .../binutils/binutils/CVE-2018-20651.patch         |   35 +
 .../binutils/binutils/CVE-2018-20671.patch         |   49 +
 .../binutils/binutils/CVE-2019-12972.patch         |   39 +
 .../binutils/binutils/CVE-2019-14444.patch         |   33 +
 meta/recipes-devtools/gcc/gcc-8.2.inc              |    1 +
 .../gcc/gcc-8.2/CVE-2019-14250.patch               |   44 +
 meta/recipes-devtools/go/go-1.11.inc               |    6 +-
 .../libcomps/libcomps/CVE-2019-3817.patch          |   97 +
 meta/recipes-devtools/libcomps/libcomps_git.bb     |    1 +
 ...k-temporary-file-on-failed-ed-style-patch.patch |   93 +
 ...ak-temporary-file-on-failed-multi-file-ed.patch |   80 +
 ...ke-ed-directly-instead-of-using-the-shell.patch |   44 +
 .../patch/patch/CVE-2019-13636.patch               |  113 +
 meta/recipes-devtools/patch/patch_2.7.6.bb         |    4 +
 .../python/python/bpo-30458-cve-2019-9740.patch    |  219 ++
 .../python/python/bpo-35121-cve-2018-20852.patch   |  127 +
 .../python/python3/CVE-2018-14647.patch            |   95 +
 .../python/python3/CVE-2018-20406.patch            |  217 ++
 .../python/python3/CVE-2018-20852.patch            |  129 +
 .../python/python3/CVE-2019-9636.patch             |  154 ++
 .../python/python3/CVE-2019-9740.patch             |  155 ++
 meta/recipes-devtools/python/python3_3.5.6.bb      |    5 +
 meta/recipes-devtools/python/python_2.7.16.bb      |    2 +
 ...error-messages-when-qemi_cpu_kick_thread-.patch |   19 +-
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch |  336 +++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |    1 +
 .../pango/pango/CVE-2019-1010238.patch             |   38 +
 meta/recipes-graphics/pango/pango_1.42.4.bb        |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |   20 +-
 .../recipes-support/curl/curl/CVE-2018-16890.patch |   50 +
 meta/recipes-support/curl/curl/CVE-2019-3822.patch |   47 +
 meta/recipes-support/curl/curl/CVE-2019-3823.patch |   55 +
 meta/recipes-support/curl/curl_7.61.0.bb           |    3 +
 .../libxslt/files/CVE-2019-13117.patch             |   33 +
 .../libxslt/files/CVE-2019-13118.patch             |   76 +
 .../libxslt/libxslt/CVE-2019-11068.patch           |  128 +
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |    5 +-
 51 files changed, 5862 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.11.5-P4.bb} (95%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
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


