Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0892477026
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7IH4JZe001838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:04:19 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 10:04:19 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 12:04:14 -0500
Message-ID: <cover.1471539779.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Re-enable prelink for IA32 and MIPS
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
X-List-Received-Date: Thu, 18 Aug 2016 17:04:20 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit ecc8d346223030ee06aa6d83427f757982e948e4:

  sanity: Require bitbake 1.31.1 for multi-config changes (2016-08-18 10:07:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/prelink
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/prelink

Mark Hatle (3):
  prelink: Move to latest version of prelink
  local.conf.sample: Disable ARM and PPC due to prelink test case
    failures
  Revert "local.conf.sample: Disable prelink by default"

 meta/conf/local.conf.sample                  | 12 ++++++++++--
 meta/recipes-devtools/prelink/prelink_git.bb |  2 +-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.5.5


