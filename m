Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 335F0729A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5STHq006892
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:30 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:22 -0800
Message-ID: <cover.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] Packages upgrade
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:31 -0000
Content-Type: text/plain

The following changes since commit c3598cf720e04ab27ab5d2817c09f2496b677560:

  kernel-devsrc: Ensure we have a dependency on the actual source (2014-12-21 13:51:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (7):
  file: upgrade to 5.21
  wget: upgrade to 1.16.1
  wget: add PACKAGECONFIG for util-linux
  rsync: upgrade to 3.1.1
  logrotate: upgrade to 3.8.8
  git: upgrade to 2.2.0
  make: upgrade to 4.1

 .../recipes-devtools/file/file/debian-742262.patch |    4 +--
 .../file/{file_5.18.bb => file_5.21.bb}            |    4 +--
 .../git/{git_2.0.1.bb => git_2.2.0.bb}             |    4 +--
 .../make/{make_4.0.bb => make_4.1.bb}              |    4 +--
 .../rsync/{rsync_3.1.0.bb => rsync_3.1.1.bb}       |    4 +--
 .../disable-check-different-filesystems.patch      |   34 --------------------
 .../{logrotate_3.8.7.bb => logrotate_3.8.8.bb}     |    5 ++-
 meta/recipes-extended/wget/wget.inc                |    5 ++-
 .../wget/{wget_1.16.bb => wget_1.16.1.bb}          |    4 +--
 9 files changed, 18 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/file/{file_5.18.bb => file_5.21.bb} (86%)
 rename meta/recipes-devtools/git/{git_2.0.1.bb => git_2.2.0.bb} (61%)
 rename meta/recipes-devtools/make/{make_4.0.bb => make_4.1.bb} (71%)
 rename meta/recipes-devtools/rsync/{rsync_3.1.0.bb => rsync_3.1.1.bb} (83%)
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
 rename meta/recipes-extended/logrotate/{logrotate_3.8.7.bb => logrotate_3.8.8.bb} (89%)
 rename meta/recipes-extended/wget/{wget_1.16.bb => wget_1.16.1.bb} (45%)

-- 
1.7.9.5


