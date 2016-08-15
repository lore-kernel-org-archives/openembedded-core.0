Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2E1776FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:36:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F7a1n2005839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Aug 2016 00:36:01 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Aug 2016 00:36:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 03:35:56 -0400
Message-ID: <cover.1471246474.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/3] packages upgrade: man-pages/gnupg/ncurses
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
X-List-Received-Date: Mon, 15 Aug 2016 07:36:06 -0000
Content-Type: text/plain

The following changes since commit 6b66e9317f4ec3a69f98f29836aafa35b52f3fc7:

  Allow for simultaneous do_rootfs tasks with rpm (2016-08-12 15:25:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20160815
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/upgrade-20160815

Hongxu Jia (3):
  man-pages: upgrade to 4.07
  gnupg: upgrade to 2.1.14
  ncurses: upgrade to 6.0+20160625

 .../ncurses/{ncurses_6.0+20160319.bb => ncurses_6.0+20160625.bb}      | 2 +-
 .../man-pages/{man-pages_4.06.bb => man-pages_4.07.bb}                | 4 ++--
 meta/recipes-support/gnupg/{gnupg_2.1.12.bb => gnupg_2.1.14.bb}       | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160319.bb => ncurses_6.0+20160625.bb} (84%)
 rename meta/recipes-extended/man-pages/{man-pages_4.06.bb => man-pages_4.07.bb} (86%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.12.bb => gnupg_2.1.14.bb} (90%)

-- 
2.8.1


