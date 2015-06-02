Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 600D3756BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmrHZ010801
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:47 -0700
Message-ID: <cover.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Packages Upgrade
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (6):
  liberror-perl: 0.17023 -> 0.17024
  python-mako: 0.9.1 -> 1.0.1
  python-nose: 1.2.1 -> 1.3.6
  debianutils: 4.5 -> 4.5.1
  ethtool: 3.16 -> 4.0
  glib-2.0: 2.44.0 -> 2.44.1

 ...tModel-roll-back-use-of-type-redefinition.patch |   42 ----------------
 .../{glib-2.0_2.44.0.bb => glib-2.0_2.44.1.bb}     |    5 +-
 ...or-perl_0.17023.bb => liberror-perl_0.17024.bb} |    4 +-
 .../{python-mako_0.9.1.bb => python-mako_1.0.1.bb} |    7 +--
 .../{python-nose_1.2.1.bb => python-nose_1.3.6.bb} |    4 +-
 .../ethtool/ethtool/ethtool-uint.patch             |   50 --------------------
 .../ethtool/{ethtool_3.16.bb => ethtool_4.0.bb}    |    5 +-
 .../{debianutils_4.5.bb => debianutils_4.5.1.bb}   |    7 ++-
 8 files changed, 17 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.0.bb => glib-2.0_2.44.1.bb} (76%)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17023.bb => liberror-perl_0.17024.bb} (83%)
 rename meta/recipes-devtools/python/{python-mako_0.9.1.bb => python-mako_1.0.1.bb} (64%)
 rename meta/recipes-devtools/python/{python-nose_1.2.1.bb => python-nose_1.3.6.bb} (74%)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool/ethtool-uint.patch
 rename meta/recipes-extended/ethtool/{ethtool_3.16.bb => ethtool_4.0.bb} (85%)
 rename meta/recipes-support/debianutils/{debianutils_4.5.bb => debianutils_4.5.1.bb} (87%)

-- 
1.7.9.5


