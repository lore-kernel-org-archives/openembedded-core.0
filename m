Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BDA6C6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:03:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 03:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860438977"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 03:03:14 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9D6AE6A4083
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:02:05 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 13:04:17 +0200
Message-Id: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 11:03:14 -0000

This patch set provides libjpeg-turbo as a drop-in replacement for libjpeg.

libjpeg-turbo is a fork of the original libjpeg project.Most of the major Linux
distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo recently.
lbjpeg-turbo provides better JPEG compression/decompression(at least 25% faster)
while maintaining same API/ABI as libjpeg.

Once we reach an agreement on this, based on the decision, we can move the
libjpeg package to meta-oe for applications which may depend on API version 9.

[YOCTO #8628]

Maxin B. John (2):
  libjpeg: Replace libjpeg with libjpeg-turbo
  libjpeg-turbo: import the recipe from meta-oe

 meta/recipes-core/jpeg/jpeg_9a.bb                | 29 -----------------
 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/jpeg/jpeg_9a.bb
 create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb

-- 
2.4.0


