Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC646B2BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:43:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s039hHc8018047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:43:17 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:43:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:45:46 +0800
Message-ID: <cover.1388771106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/3] upgrade e2fsprogs and logrotate
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
X-List-Received-Date: Fri, 03 Jan 2014 09:43:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit b26fe9bc5b459770c0716ba086b905924d7f2b9b:

  mime.bbclass: remove the --disable-update-mimedb (2014-01-04 01:25:27 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/up
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/up

Robert Yang (3):
  e2fsprogs: upgrade to 1.42.9
  logrotate: upgrade to 3.8.7
  logrotate: two minor fixes

 .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |  47 -------
 .../e2fsprogs-1.42.8/debugfs-sparse-copy.patch     | 148 ---------------------
 .../e2fsprogs-1.42.8/debugfs-too-short.patch       |  41 ------
 .../e2fsprogs-fix-tests-f_extent_oobounds.patch    |  43 ------
 .../e2fsprogs/e2fsprogs-1.42.8/fallocate.patch     |  22 ---
 .../{e2fsprogs-1.42.8 => e2fsprogs}/acinclude.m4   |   0
 .../fix-icache.patch                               |   6 +-
 .../{e2fsprogs-1.42.8 => e2fsprogs}/mkdir.patch    |   0
 .../populate-extfs.sh                              |   0
 .../quiet-debugfs.patch                            |   0
 .../remove.ldconfig.call.patch                     |   0
 .../{e2fsprogs_1.42.8.bb => e2fsprogs_1.42.9.bb}   |  10 +-
 .../act-as-mv-when-rotate.patch                    |  53 ++++++--
 .../disable-check-different-filesystems.patch      |   2 +-
 .../logrotate-CVE-2011-1548.patch                  |   0
 .../update-the-manual.patch                        |  18 +--
 .../{logrotate_3.8.1.bb => logrotate_3.8.7.bb}     |  13 +-
 17 files changed, 52 insertions(+), 351 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/e2fsprogs-fix-tests-f_extent_oobounds.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/fix-icache.patch (91%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/populate-extfs.sh (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/quiet-debugfs.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.8 => e2fsprogs}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.8.bb => e2fsprogs_1.42.9.bb} (85%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/act-as-mv-when-rotate.patch (65%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/disable-check-different-filesystems.patch (96%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/logrotate-CVE-2011-1548.patch (100%)
 rename meta/recipes-extended/logrotate/{logrotate-3.8.1 => logrotate}/update-the-manual.patch (61%)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.1.bb => logrotate_3.8.7.bb} (74%)

-- 
1.8.3.1


