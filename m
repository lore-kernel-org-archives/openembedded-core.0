Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE2F165DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6BnWv029905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:42 -0700
Message-ID: <cover.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] meta: fix rdepends for util packages
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

These patches fix the PKG-util/-misc/-bin/-dev's RDEPENDS issue, they may not
work well for ipk or deb without these fixes.

// Robert

The following changes since commit d0be4b37743492fc9c178fd6f9ef73a5eb2fd9c3:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/util
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/util

Robert Yang (7):
  apr: add bash to RDEPENDS_apr-dev
  dtc: add bash to RDEPENDS_dtc-misc
  gst-plugins-base: add perl to RDEPENDS_gst-plugins-base-apps
  rpm: add perl to RDEPENDS_rpm-build
  aspell: add perl to RDEPENDS_aspell-utils
  syslinux: add perl to RDEPENDS_syslinux-misc
  lttng-ust: add python-core to RDEPENDS_lttng-ust-bin

 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    4 +---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 +---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    1 +
 meta/recipes-kernel/dtc/dtc.inc                    |    2 ++
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb       |    1 +
 .../gstreamer/gst-plugins-package.inc              |    2 ++
 meta/recipes-support/apr/apr_1.5.1.bb              |    1 +
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 ++
 8 files changed, 11 insertions(+), 6 deletions(-)

-- 
1.7.9.5


