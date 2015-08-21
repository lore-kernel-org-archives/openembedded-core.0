Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 668B360557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 05:39:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L5d1To007691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:39:01 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 20 Aug 2015 22:39:01 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 01:38:57 -0400
Message-ID: <cover.1440126018.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] libcap-ng, swig: add packages
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
X-List-Received-Date: Fri, 21 Aug 2015 05:39:02 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* add swig 3.0.6 which the latest version from meta-oe

The following changes since commit a01a33b17861c227c1c16fbc2d819d86fb9bf893:

  linux-yocto-3.14: Update to branch HEADs (2015-08-20 15:17:01 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/libcap-ng
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/libcap-ng

Wenzong Fan (2):
  swig: add package 3.0.6
  libcap-ng: add package 0.7.7

 meta/recipes-devtools/swig/swig.inc                | 63 ++++++++++++++++++++
 ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ++++++++++++++++++++++
 ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 ++++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.6.bb           |  8 +++
 .../libcap-ng/libcap-ng/python.patch               | 58 ++++++++++++++++++
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  | 39 ++++++++++++
 6 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig.inc
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 create mode 100644 meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
 create mode 100644 meta/recipes-devtools/swig/swig_3.0.6.bb
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/python.patch
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb

-- 
1.9.1


