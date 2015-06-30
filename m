Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 810897196D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U36d5p024535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:06:39 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 20:06:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 20:06:36 -0700
Message-ID: <cover.1435633566.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] bootimg.bbclass: fixes for iso and hddimg
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
X-List-Received-Date: Tue, 30 Jun 2015 03:06:39 -0000
Content-Type: text/plain

The following changes since commit 592a1d94a7b0e80059016adb59c4c61e256206f0:

  oeqa/parselogs: Whitelist qemumips64 runtime error (2015-06-27 22:49:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/boot
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/boot

Robert Yang (2):
  bootimg.bbclass:iso: use mkisofs -iso-level 3 for large iso
  bootimg.bbclass:hddimg: check the size of rootfs.img for hddimg

 meta/classes/bootimg.bbclass |   28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

-- 
1.7.9.5


