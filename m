Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E61066A4A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:15:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r552FgK6015451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 19:15:42 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 19:15:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 10:14:01 +0800
Message-ID: <cover.1370398286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/4 V2] insane/package: refactor packaging sanity tests
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
X-List-Received-Date: Wed, 05 Jun 2013 02:15:41 -0000
Content-Type: text/plain

Changes:
* Fix the build error on multilib.

// Robert

The following changes since commit 8a2ac668d99f7d64c2acffc3a39cedb2d152be6e:

  lrzsz: check locale.h in configure (2013-06-04 15:53:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/refactor
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/refactor

Robert Yang (4):
  insane/package: let package.bbclass inherit insane.bbclass
  defaultsetup.conf: remove INHERIT_INSANE
  insane/package: refactor packaging sanity tests
  multilib.bbclass: fix the PACKAGEFUNCS_append

 meta/classes/insane.bbclass        | 39 ++++++++++++++++++++++++------------
 meta/classes/multilib.bbclass      |  2 +-
 meta/classes/package.bbclass       | 41 +++++++++++++++++++++++++-------------
 meta/conf/distro/defaultsetup.conf |  3 +--
 4 files changed, 55 insertions(+), 30 deletions(-)

-- 
1.8.1.2


