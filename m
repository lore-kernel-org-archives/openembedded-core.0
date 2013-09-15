Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03F4A61577
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:13:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8F9DHO4013846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 02:13:17 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 15 Sep 2013 02:13:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Sep 2013 05:13:11 -0400
Message-ID: <cover.1379235732.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Sun, 15 Sep 2013 09:13:15 -0000
Content-Type: text/plain

The following changes since commit 3b4c037e41f6678845fb29d97aae5f48f07a68c7:

  telepathy-mission-control: do_compile failed (race issue) (2013-09-14 04:44:28 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/coreutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/coreutils

Robert Yang (1):
  coreutils: set acpaths to avoid "Argument list too long" error

 meta/recipes-core/coreutils/coreutils_6.9.bb  |    6 ++++++
 meta/recipes-core/coreutils/coreutils_8.21.bb |    6 ++++++
 2 files changed, 12 insertions(+)

-- 
1.7.10.4


