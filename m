Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F50073CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 07:52:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G7qjxq008875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:52:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 00:52:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 00:52:42 -0700
Message-ID: <cover.1442389930.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes
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
X-List-Received-Date: Wed, 16 Sep 2015 07:52:45 -0000
Content-Type: text/plain

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  subversion: 1.8.13 -> 1.8.14 since 1.8.13.tar.gz was gone
  nspr: fix SRC_URI
  mkelfimage: fix owner for /usr/sbin/mkelfImage

 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    1 +
 .../disable_macos.patch                            |    0
 .../libtool2.patch                                 |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |    0
 .../{subversion_1.8.13.bb => subversion_1.8.14.bb} |    4 ++--
 meta/recipes-support/nspr/nspr_4.10.8.bb           |    2 +-
 6 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.8.14.bb} (96%)

-- 
1.7.9.5


