Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4BD575A38
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:16:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DGxDj020859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:16:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:16:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:51 -0700
Message-ID: <cover.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [YOCTO 2.1] [PATCH 0/8] fixes for package_qa_walk() and buildpaths
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:00 -0000
Content-Type: text/plain

The following changes since commit 4038970f8ce27ac0d7a0afe2cdaa9a65108dfff5:

  os-release: fix do_compile() when RPM signing is enabled (2015-10-07 00:08:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/buildpaths
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/buildpaths

Robert Yang (8):
  insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
  insane.bbclass: make package_qa_walk() can print all the messages
  insane.bbclass: buildpaths: ignore .pyc files
  insane.bbclass: skip buildpath qa check when set
    INHIBIT_PACKAGE_STRIP
  insane.bbclass: fix for ignoring debug files
  package.bbclass: strip archive files
  autotools.bbclass: use relative path to run configure script
  glibc-initial.inc: use relative path to run configure

 meta/classes/autotools.bbclass            |    4 +++-
 meta/classes/insane.bbclass               |   32 ++++++++++++++++++++++++-----
 meta/classes/package.bbclass              |   18 +++++++++++++++-
 meta/recipes-core/glibc/glibc-initial.inc |    2 +-
 4 files changed, 48 insertions(+), 8 deletions(-)

-- 
1.7.9.5


