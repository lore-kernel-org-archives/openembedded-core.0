Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF85718E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qRiE008447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:27 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:15 -0800
Message-ID: <cover.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/12] fix SRC_URI and others
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:28 -0000
Content-Type: text/plain

There are still other do_ferch errors after these fixes:
WARNING: Failed to fetch URL http://createrepo.baseurl.org/download/createrepo-0.4.11.tar.gz, attempting MIRRORS if available
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/n/net-tools/net-tools_1.60-25.diff.gz;apply=no;name=patch, attempting MIRRORS if available
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-1.diff.gz;name=patch, attempting MIRRORS if available
WARNING: Failed to fetch URL http://www.xinetd.org/xinetd-2.3.15.tar.gz, attempting MIRRORS if available
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/a/apt/apt_0.9.9.4.tar.gz, attempting MIRRORS if available

I'd like to go on fixing them if this is fine, such as use
pkgs.fedoraproject.org or yocto's mirror to instead of.

// Robert

The following changes since commit 2a775ebbb175dd70fc7228607c306d4ccb9e4ba4:

  net-tools: Fix rerunning of do_patch task (2015-01-23 14:32:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/src_uri
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/src_uri

Robert Yang (12):
  dpkg: add perl to RDEPENDS
  screen: add PACKAGECONFIG for libutempter
  perf: add LIBNUMA_DEFINES
  cdrtools-native: fix HOMEPAGE and SRC_URI
  base-passwd: fix SRC_URI
  dosfstools: fix SRC_URI
  cwautomacros: fix SRC_URI and HOMEPAGE
  man: fix SRC_URI
  pax: fix SRC_URI and HOMEPAGE
  latencytop: fix SRC_URI and HOMEPAGE
  pcmciautils: fix SRC_URI and HOMEPAGE
  mingetty: fix SRC_URI

 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    4 ++--
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |    2 +-
 .../cdrtools/cdrtools-native_3.01a20.bb            |    4 ++--
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    3 ++-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 .../cwautomacros/cwautomacros_20110201.bb          |    4 ++--
 meta/recipes-extended/man/man_1.6g.bb              |    2 +-
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |    2 +-
 meta/recipes-extended/pax/pax_3.4.bb               |    4 ++--
 meta/recipes-extended/screen/screen_4.0.3.bb       |    3 +++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    2 +-
 meta/recipes-kernel/perf/perf.bb                   |    4 +++-
 12 files changed, 21 insertions(+), 15 deletions(-)

-- 
1.7.9.5


