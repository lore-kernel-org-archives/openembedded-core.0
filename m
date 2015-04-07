Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 491AA73D15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:58:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t37CwFF0016095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 05:58:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 05:58:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 05:58:13 -0700
Message-ID: <cover.1428410929.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Tue, 07 Apr 2015 12:58:15 -0000
Content-Type: text/plain

Hello,

I think that one recipe should only have one -dev package, I'm not sure
whether this is right or not, please feel free to give your comments, we
still have about 30 recipes in oe-core which have more than one dev
packages, more info:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7481

// Robert

The following changes since commit fbaddd724855a829698d853a70eee86118d6a5e7:

  package_manager: call createrepo with --dbpath pointing inside WORKDIR (2015-04-02 12:00:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/dev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dev

Robert Yang (2):
  xz: remove xz-dev from PACKAGES
  bzip2: remove bzip2-dev from PACKAGES

 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
 meta/recipes-extended/xz/xz_5.2.0.bb       |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.9.5


