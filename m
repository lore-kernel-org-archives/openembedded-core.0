Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5F47895A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 01:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02B8020B46;
	Tue, 20 Mar 2018 01:11:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jWsnkXSB3ODJ; Tue, 20 Mar 2018 01:11:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD0072098D;
	Tue, 20 Mar 2018 01:11:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3800A163373;
	Mon, 19 Mar 2018 21:11:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:11:06 -0400
Message-Id: <cover.1521507765.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Tue, 20 Mar 2018 01:11:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Upgrades for lzip, hdparm and lz4.

The following changes since commit c94271d87d16323f920891344642f76dfb3c994f:

  buildperf: measure the size of core-image-sato rootfs (2018-03-16 03:42:03 -0700)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib denix/master

Denys Dmytriyenko (3):
  lzip: upgrade 1.19 -> 1.20
  hdparm: upgrade 9.53 -> 9.55
  lz4: upgrade 1.7.4 -> 1.8.1.2

 .../hdparm/{hdparm_9.53.bb => hdparm_9.55.bb}      |  4 +-
 .../lzip/{lzip_1.19.bb => lzip_1.20.bb}            |  4 +-
 ...sts-Makefile-don-t-use-LIBDIR-as-variable.patch | 82 ----------------------
 .../lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb}           | 10 +--
 4 files changed, 9 insertions(+), 91 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.53.bb => hdparm_9.55.bb} (90%)
 rename meta/recipes-extended/lzip/{lzip_1.19.bb => lzip_1.20.bb} (88%)
 delete mode 100644 meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
 rename meta/recipes-support/lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb} (79%)

-- 
2.7.4


