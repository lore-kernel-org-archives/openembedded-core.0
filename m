Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2112C73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 07:29:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J7TVYZ009786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 00:29:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 00:29:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Aug 2015 03:29:27 -0400
Message-ID: <cover.1439967611.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] libcap-ng, swig: add packages
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
X-List-Received-Date: Wed, 19 Aug 2015 07:29:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add packages libcap-ng and swig.

They are from meta-oe and with adding them to oe-core, the copies from
multiple layers could be removed: meta-oe, meta-selinux ...

* The swig is depended by libcap-ng to build python bindings

* The libcap-ng library is intended to make programming with posix
  capabilities much easier than the traditional libcap library.
    
  It's not a replacement to libcap, it provides different library
  (libcap-ng.so) while packages explicitly look for libcap.so. It
  could be used by qemu, util-linux, libvirt, audit ... to work
  with posix capabilities.

The following changes since commit c348fa50186fb0796bc7b793c4b8d710419f2a0d:

  bitbake: toaster: move code from setup_lv_tests to setUp (2015-08-17 14:41:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/libcap-ng
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/libcap-ng

Wenzong Fan (2):
  swig: add package 3.0.2
  libcap-ng: add package 0.7.7

 meta/recipes-devtools/swig/swig.inc                | 63 ++++++++++++++++++++
 ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ++++++++++++++++++++++
 ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 ++++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.2.bb           |  8 +++
 .../libcap-ng/libcap-ng/python.patch               | 58 ++++++++++++++++++
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  | 39 ++++++++++++
 6 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig.inc
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 create mode 100644 meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
 create mode 100644 meta/recipes-devtools/swig/swig_3.0.2.bb
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/python.patch
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb

-- 
1.9.1


