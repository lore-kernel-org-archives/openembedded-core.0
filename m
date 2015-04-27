Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF4D73C48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 02:25:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3R2PukN010044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 19:25:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 26 Apr 2015 19:25:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 10:25:53 +0800
Message-ID: <cover.1430101500.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Package Upgrade : pciutils and sysstat
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
X-List-Received-Date: Mon, 27 Apr 2015 02:25:58 -0000
Content-Type: text/plain

The following changes since commit 4b57b7d59ddea33ee7696880ea1652e56f46d843:

  mtd-utils: enable mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (2015-04-24 11:14:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrade-20150427
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrade-20150427

Chen Qi (2):
  pciutils: upgrade to 3.3.1
  sysstat: upgrade to 11.1.4

 meta/recipes-bsp/pciutils/{pciutils_3.3.0.bb => pciutils_3.3.1.bb}    | 4 ++--
 .../recipes-extended/sysstat/{sysstat_11.1.3.bb => sysstat_11.1.4.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.3.0.bb => pciutils_3.3.1.bb} (92%)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.3.bb => sysstat_11.1.4.bb} (40%)

-- 
1.9.1


