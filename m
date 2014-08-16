Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6271665CB2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 05:15:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7G5F3EL016896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 22:15:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 22:15:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 22:15:01 -0700
Message-ID: <cover.1408166066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] syslinux: fix race issue
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
X-List-Received-Date: Sat, 16 Aug 2014 05:15:07 -0000
Content-Type: text/plain

The following changes since commit 324c6ac33ab44e4c1949b8001a53a8ffd2a979e2:

  avahi: unset FILES_avahi to avoid packaging files there (2014-08-15 18:20:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/syslinux

Robert Yang (1):
  syslinux: fix race issue

 .../files/syslinux-libupload-depend-lib.patch      |   34 ++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-libupload-depend-lib.patch

-- 
1.7.9.5


