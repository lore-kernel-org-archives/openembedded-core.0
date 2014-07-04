Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4B265C94
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 08:46:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s648kQgF017290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 01:46:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 4 Jul 2014 01:46:25 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 16:45:12 +0800
Message-ID: <cover.1404463017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] adt_installer: several fixes
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
X-List-Received-Date: Fri, 04 Jul 2014 08:46:33 -0000
Content-Type: text/plain

The following changes since commit 359f08766fac29d56a763de712434d8f0536441f:

  yocto-bsp: Drop GLIBC_ADDONS setting (2014-07-04 09:12:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/adtinstaller
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/adtinstller

Chong Lu (4):
  adt_installer: remove unnecessary variable
  adt_installer: fix syntax error
  adt_installer: check the result of updating opkg
  adt_installer: not download repo page

 meta/recipes-devtools/installer/adt-installer/adt_installer           | 4 ++--
 .../installer/adt-installer/scripts/adt_installer_internal            | 4 ++--
 meta/recipes-devtools/installer/adt-installer_1.0.bb                  | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
1.9.1


