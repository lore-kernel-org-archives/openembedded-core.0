Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEF0A65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5X4uU025209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:33:04 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 22:33:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 22:32:59 -0700
Message-ID: <cover.1426743145.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] fix oelint.bbclass and HOMEPAGE
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
X-List-Received-Date: Thu, 19 Mar 2015 05:33:03 -0000
Content-Type: text/plain

The following changes since commit 0752c79282b1cc9699743e719518e6c341d50a3a:

  systemd: fix /var/log/journal ownership (2015-03-16 17:38:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/lint
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/lint

Robert Yang (5):
  oelint.bbclass: adjust task order
  oelint.bbclass: remove duplicated code
  gawk: fix HOMEPAGE
  groff: fix HOMEPAGE
  tzdata: fix HOMEPAGE

 meta/classes/oelint.bbclass                 |   19 +++++++++----------
 meta/recipes-extended/gawk/gawk_4.1.1.bb    |    2 +-
 meta/recipes-extended/groff/groff_1.22.2.bb |    2 +-
 meta/recipes-extended/tzdata/tzdata.inc     |    2 +-
 4 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.7.9.5


