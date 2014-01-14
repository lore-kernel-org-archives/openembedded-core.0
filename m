Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CA84F6BC9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:40 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id e4so2652478wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7NHAGlybjefOCs3j6T3Mc/e0yS0vJZS1sBeyg2QVCUE=;
	b=SArq0mMd7UpGIU5p/oKH3jrkqeCWuoe3VoXdmTYu6nTbQx8b/TOiKPPThqehs305u8
	nJDU9pP9Wct9Yrdq54m7zlunNNYfUysMDFywZ+MCAcrtN+3mhdNf8ElqIqlug3hv510V
	bhXK2GfiUPLoMmBYzZtdFrttPIKki/BT9RcSsJf40+SdSRjDOsr/7mxkRlRxj0FyWi42
	/9OGSfRbUESZzl4t3GjVUs+GomUgwfdhRwUgAsT9tqyuEyxp55wf6OgtVz4mOlS/Uiin
	vX7aunv6ZOHwsaOw4PbBNaypMFCp65alhrlTGlUtnIzkFJMpHh/rujo989Fsk5byElVs
	L/gg==
X-Gm-Message-State: ALoCoQk2tUcLxwwR/J2qmEwkmhKiJTD3dbb0m/RKCqTniOyEmmHYLHbQmpJ71aZ6s7oJbmWKTRBq
X-Received: by 10.194.201.134 with SMTP id ka6mr2646651wjc.93.1389712781319;
	Tue, 14 Jan 2014 07:19:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:25 +0000
Message-Id: <cover.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V3 0/7] Add Piglit
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:42 -0000

Hi,

V3 of the Piglit series that adds a missing build dependency from meta-oe (honestly no idea
how this ever worked for me), and fixes cmake.bbclass for multilib builds.

Ross

The following changes since commit d6ed40fa2a7646e3353460390090aaaecf5b38a3:

  cmake: default to out-of-tree builds (2014-01-14 11:33:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/piglit

for you to fetch changes up to f0636fc5fd95fc5f9f1271ccbaf347d06489d3e7:

  packagegroup-core-tools-testapps: add Piglit (2014-01-14 14:42:06 +0000)

----------------------------------------------------------------
Ross Burton (7):
      cmake: specify all install paths
      python-mako: add (from meta-oe)
      python-nose: add (from meta-oe)
      python-numpy: add (from meta-oe)
      waffle: add (from meta-oe)
      piglit: add (from meta-oe)
      packagegroup-core-tools-testapps: add Piglit

 meta/classes/cmake.bbclass                         |    9 ++
 .../packagegroup-core-tools-testapps.bb            |    7 +-
 meta/recipes-devtools/python/python-mako_0.9.1.bb  |   20 +++
 meta/recipes-devtools/python/python-nose_1.2.1.bb  |   14 ++
 .../python/python-numpy/aarch64/_numpyconfig.h     |   30 +++++
 .../python/python-numpy/aarch64/config.h           |  139 ++++++++++++++++++++
 .../python/python-numpy/arm/config.h               |   21 +++
 .../python/python-numpy/arm/numpyconfig.h          |   17 +++
 .../python/python-numpy/armeb/config.h             |   21 +++
 .../python/python-numpy/armeb/numpyconfig.h        |   17 +++
 .../python/python-numpy/i586/config.h              |  108 +++++++++++++++
 .../python/python-numpy/i586/numpyconfig.h         |   24 ++++
 .../python/python-numpy/mipsel/config.h            |   21 +++
 .../python/python-numpy/mipsel/numpyconfig.h       |   17 +++
 .../python/python-numpy/trycompile.diff            |   33 +++++
 .../python/python-numpy/unbreak-assumptions.diff   |   16 +++
 .../python/python-numpy/x86-64/_numpyconfig.h      |   30 +++++
 .../python/python-numpy/x86-64/config.h            |  139 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |   78 +++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |   48 +++++++
 meta/recipes-graphics/waffle/waffle_1.3.0.bb       |   32 +++++
 21 files changed, 840 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-mako_0.9.1.bb
 create mode 100644 meta/recipes-devtools/python/python-nose_1.2.1.bb
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/trycompile.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy_1.7.0.bb
 create mode 100644 meta/recipes-graphics/piglit/piglit_git.bb
 create mode 100644 meta/recipes-graphics/waffle/waffle_1.3.0.bb

Ross Burton (7):
  cmake: specify all install paths
  python-mako: add (from meta-oe)
  python-nose: add (from meta-oe)
  python-numpy: add (from meta-oe)
  waffle: add (from meta-oe)
  piglit: add (from meta-oe)
  packagegroup-core-tools-testapps: add Piglit

 meta/classes/cmake.bbclass                         |    9 ++
 .../packagegroup-core-tools-testapps.bb            |    7 +-
 meta/recipes-devtools/python/python-mako_0.9.1.bb  |   20 +++
 meta/recipes-devtools/python/python-nose_1.2.1.bb  |   14 ++
 .../python/python-numpy/aarch64/_numpyconfig.h     |   30 +++++
 .../python/python-numpy/aarch64/config.h           |  139 ++++++++++++++++++++
 .../python/python-numpy/arm/config.h               |   21 +++
 .../python/python-numpy/arm/numpyconfig.h          |   17 +++
 .../python/python-numpy/armeb/config.h             |   21 +++
 .../python/python-numpy/armeb/numpyconfig.h        |   17 +++
 .../python/python-numpy/i586/config.h              |  108 +++++++++++++++
 .../python/python-numpy/i586/numpyconfig.h         |   24 ++++
 .../python/python-numpy/mipsel/config.h            |   21 +++
 .../python/python-numpy/mipsel/numpyconfig.h       |   17 +++
 .../python/python-numpy/trycompile.diff            |   33 +++++
 .../python/python-numpy/unbreak-assumptions.diff   |   16 +++
 .../python/python-numpy/x86-64/_numpyconfig.h      |   30 +++++
 .../python/python-numpy/x86-64/config.h            |  139 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |   78 +++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |   48 +++++++
 meta/recipes-graphics/waffle/waffle_1.3.0.bb       |   32 +++++
 21 files changed, 840 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-mako_0.9.1.bb
 create mode 100644 meta/recipes-devtools/python/python-nose_1.2.1.bb
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/trycompile.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy_1.7.0.bb
 create mode 100644 meta/recipes-graphics/piglit/piglit_git.bb
 create mode 100644 meta/recipes-graphics/waffle/waffle_1.3.0.bb

-- 
1.7.10.4


