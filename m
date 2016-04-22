Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B952570101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:44:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M5iY9F010546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:44:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:44:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:44:31 -0700
Message-ID: <cover.1461303847.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/2] ase_contains -> bb.utils.contains (master branch only)
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
X-List-Received-Date: Fri, 22 Apr 2016 05:44:37 -0000
Content-Type: text/plain

The following changes since commit 9838f8d077d16e52ad592879d65a9e8350b93075:

  build-appliance-image: Update to krogoth head revision (2016-04-19 21:25:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/warn
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/warn

Robert Yang (2):
  directfb/pango/webkit: base_contains -> bb.utils.contains
  utils.bbclass: warn for deprecated base_contains

 meta/classes/utils.bbclass                   | 1 +
 meta/recipes-graphics/directfb/directfb.inc  | 2 +-
 meta/recipes-graphics/pango/pango_1.38.1.bb  | 2 +-
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 4 ++--
 4 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.8.0


