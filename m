Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B56477037D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1pPlX025021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:51:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 18:51:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 18:51:22 -0700
Message-ID: <cover.1405043280.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] file: fix perl reported as awk
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
X-List-Received-Date: Fri, 11 Jul 2014 01:51:28 -0000
Content-Type: text/plain

NOTE:
The "[PATCH 2/2] file: remove dump and filesystems" is 36K, so I removed the
contents from the patch, you can get it from the repo.

// Robert

The following changes since commit 6acd4fc8d5e642b5c6c75fcc40dd8f37caf7ddcf:

  lib/oe/image.py: check the rootfs size against IMAGE_ROOTFS_MAXSIZE (2014-07-10 17:37:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/file
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/file

Robert Yang (2):
  file: fix perl reported as awk
  file: remove dump and filesystems

 .../recipes-devtools/file/file/debian-742262.patch |   16 +
 meta/recipes-devtools/file/file/dump               |   81 --
 meta/recipes-devtools/file/file/filesystems        |  812 --------------------
 meta/recipes-devtools/file/file_5.18.bb            |   10 +-
 4 files changed, 18 insertions(+), 901 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/debian-742262.patch
 delete mode 100644 meta/recipes-devtools/file/file/dump
 delete mode 100644 meta/recipes-devtools/file/file/filesystems

-- 
1.7.9.5


