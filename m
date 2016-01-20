Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 268F260767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:30:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K9UeD4016718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:30:40 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 01:30:39 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <dengke.du@windriver.com>
Date: Wed, 20 Jan 2016 04:30:35 -0500
Message-ID: <cover.1453281406.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] ncurses: drop the compatible option
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
X-List-Received-Date: Wed, 20 Jan 2016 09:30:42 -0000
Content-Type: text/plain

The following changes since commit 68c7113a746694e25df2ac5d86171ed96b7c2e94:

  poky.conf: Delete BB_SIGNATURE_HANDLER settings (2016-01-19 23:02:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/ncurses_drop_compatible_option
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/ncurses_drop_compatible_option

Dengke Du (1):
  ncurses: drop the compatible option

 meta/recipes-core/ncurses/ncurses.inc    | 10 +++++-----
 meta/recipes-core/ncurses/ncurses_6.0.bb |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
1.9.1


