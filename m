Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C29772E97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U3QaOI027083
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:26:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 20:26:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 20:26:35 -0700
Message-ID: <cover.1435634748.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] logrotate: 3.8.8 -> 3.9.1
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
X-List-Received-Date: Tue, 30 Jun 2015 03:26:36 -0000
Content-Type: text/plain

The following changes since commit 592a1d94a7b0e80059016adb59c4c61e256206f0:

  oeqa/parselogs: Whitelist qemumips64 runtime error (2015-06-27 22:49:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/logrotate
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/logrotate

Robert Yang (1):
  logrotate: 3.8.8 -> 3.9.1

 .../logrotate/act-as-mv-when-rotate.patch          |   65 ++++++++++++--------
 .../disable-check-different-filesystems.patch      |   26 ++++----
 .../logrotate/logrotate/update-the-manual.patch    |   26 +++++---
 .../{logrotate_3.8.8.bb => logrotate_3.9.1.bb}     |   14 ++---
 4 files changed, 73 insertions(+), 58 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.8.bb => logrotate_3.9.1.bb} (80%)

-- 
1.7.9.5


