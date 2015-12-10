Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97DEB6E665
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id w144so24560649wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6iu/wJydzwsdjY3tomvDqCrsH0D/lWkzYyWwIQNc7VQ=;
	b=rNF5+AW5HglngSaZWzCyMFJ/r0GGrJT71GNRXZNl1f9MM59zZeufBuXhCZa1XsqZbC
	DnARSIbWa5j8iwCMIDRgACtexZD7UI7fMPz9oFjPHBTUPKRJE6GS7bNjr6hUeWCdBYmt
	nw5DcVXJQud/5ymTH9vtpjzH3UrzLQqTIlEN4m6DyH2DsDIreiCojl2DccJPhpwvwDJ9
	2HCNng7W8av2B7vtuFBFh5JKkr0RctcUKePrjLH9WPyLRaNQsvHEgw7TDdJHuD0pZLqc
	ooyCDqMraPdy8jiTRLRyoSJ98QXZxg2EBaTP1192gWuowDbCSU0NtqFWCSiHiPWkAbG2
	OjKQ==
X-Received: by 10.194.133.100 with SMTP id pb4mr10342105wjb.133.1449755211244; 
	Thu, 10 Dec 2015 05:46:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t194sm928677wmt.11.2015.12.10.05.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:21 +0100
Message-Id: <cover.1449754341.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][jethro][RESEND 00/11] Backports for jethro
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:50 -0000

The following changes since commit 224bcc2ead676600bcd9e290ed23d9b2ed2f481e:

  rpcbind: Security Advisory - rpcbind - CVE-2015-7236 (2015-12-08 00:18:12 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/jethro-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/jethro-backports

Martin Jansa (10):
  icu: force arm mode
  guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
    thumb where it fails for qemuarm
  directfb: add fPIC to CFLAGS
  libunwind: fix build for qemuarm
  gstreamer1.0-plugins-{base,good}: update PACKAGECONFIGs
  gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
  gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for
    v4l2 and libv4l2
  gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resindvd
  package_manager.py: define info_dir and status_file when OPKGLIBDIR
    isn't the default
  texinfo: don't create dependency on INHERIT variable

Ross Burton (1):
  libsdl2: require GLES when building Wayland support

 meta/lib/oe/package_manager.py                     | 19 +++++++
 meta/recipes-devtools/gcc/gcc_4.9.bb               |  5 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  4 ++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  4 ++
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |  5 ++
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |  2 +-
 meta/recipes-graphics/directfb/directfb.inc        |  3 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |  2 +-
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |  3 ++
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 13 ++---
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  7 ++-
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 14 ++---
 meta/recipes-support/icu/icu_55.1.bb               |  4 ++
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 61 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  5 ++
 15 files changed, 126 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch

-- 
2.6.3


