Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 483D16E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 01:19:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6D1Ja3K014084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Jul 2016 18:19:36 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 18:19:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jul 2016 21:19:26 -0400
Message-ID: <cover.1468372600.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 13 Jul 2016 01:19:38 -0000
Content-Type: text/plain

Hi all,

I hand't heard if there were any issues with these in any test branches, but
to be safe, I'm batching up all my pending commits and sending them as a
consolidated series.

These commits represent mainline backports (largely for intel platform
support), -stable integrations asn well as some configuration tweaks.

All in all, nothing that should cause us any issues.

Cheers,

Bruce

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/4.1/4.4: x86, power and usb-c mainline backports
  linux-yocto/4.1/4.1: mei, usb and extcon changes
  linux-yocto/4.4: cpumask: Export cpumask_any_but()
  linux-yocto/config: mei, gpio and usb type c
  linux-yocto/4.1: update to 4.1.27
  linux-yocto/4.4: update to v4.4.14
  linux-yocto/4.4: pwm and mei updates
  linux-yocto: powerclamp and gpio configuration changes
  linux-yocto/4.1: pinctrl backports

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.5.0


