Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9F9731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:57:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7H8vWNS001064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Aug 2016 01:57:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 01:57:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 17 Aug 2016 04:57:29 -0400
Message-ID: <cover.1471424152.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] grub: fix load module all_video failed
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
X-List-Received-Date: Wed, 17 Aug 2016 08:57:33 -0000
Content-Type: text/plain


The following changes since commit 6b66e9317f4ec3a69f98f29836aafa35b52f3fc7:

  Allow for simultaneous do_rootfs tasks with rpm (2016-08-12 15:25:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-grub
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-grub

Hongxu Jia (1):
  grub: fix load module all_video failed

 ...-explicitly-keeps-symbole-.module_license.patch | 61 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch

-- 
2.8.1


