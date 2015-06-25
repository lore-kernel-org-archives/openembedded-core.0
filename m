Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76BCC605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:24:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P9OXxx029402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:24:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 02:24:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 02:24:30 -0700
Message-ID: <cover.1435224137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] 2 fixes for runqemu
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
X-List-Received-Date: Thu, 25 Jun 2015 09:24:35 -0000
Content-Type: text/plain

Hello,

The 2 patches will make qemu easier to use.

// Robert

The following changes since commit 2587b83faabdc8858e8746201805369ed8d53ba8:

  wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:03:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (2):
  runqemu: disable graphic when no DISPLAY
  runqemu: enable kvm when use tap under sudo

 scripts/runqemu          |   20 ++++++++++++++++----
 scripts/runqemu-internal |   15 +++++++++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

-- 
1.7.9.5


