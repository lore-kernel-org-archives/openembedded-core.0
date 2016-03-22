Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4F8460796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:48:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2M9mMHT000029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 02:48:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 02:48:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Mar 2016 02:48:18 -0700
Message-ID: <cover.1458640034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes for grub-efi.bbclass (live + vm)
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
X-List-Received-Date: Tue, 22 Mar 2016 09:48:22 -0000
Content-Type: text/plain

The following changes since commit 34e7292fb40635cee1f1237ac3156530f8dfce37:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:53:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/efi
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/efi

Robert Yang (3):
  bootimg.bbclass: fix settings for grub-efi.bbclass
  grub-efi.bbclass: make it can build vm and live together
  bootimg.bbclass: only inherit syslinux when pcbios

 meta/classes/boot-directdisk.bbclass |    5 ++---
 meta/classes/bootimg.bbclass         |   13 ++++++++-----
 meta/classes/grub-efi.bbclass        |   10 ++++++----
 meta/classes/image-live.bbclass      |    6 ++----
 meta/classes/image-vm.bbclass        |    3 +--
 meta/classes/image.bbclass           |   13 +++++++++++++
 meta/classes/syslinux.bbclass        |   20 ++++----------------
 7 files changed, 36 insertions(+), 34 deletions(-)

-- 
1.7.9.5


