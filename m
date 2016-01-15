Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8A162134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 03:07:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F37WX1012790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 19:07:33 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 19:07:32 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 14 Jan 2016 22:07:29 -0500
Message-ID: <cover.1452826805.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] ncurses: 5.9 0 -> 6.0
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
X-List-Received-Date: Fri, 15 Jan 2016 03:07:34 -0000
Content-Type: text/plain

The following changes since commit 92cc02fe517bad0af4e493fda3331738cbcc9a26:

  linux-yocto: Update Genericx86* BSPs to 4.1.15 (2016-01-14 15:18:46 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dengke/upgrade-ncurses
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dengke/upgrade-ncurses

Dengke Du (1):
  ncurses: 5.9 0 -> 6.0

 .../recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache | 0
 .../ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch            | 0
 meta/recipes-core/ncurses/ncurses.inc                              | 1 -
 meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb}       | 7 +++----
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses-6.0}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb} (59%)

-- 
1.9.1


