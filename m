Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62AF871AFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:31:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q2VJi7013798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 25 Oct 2016 19:31:19 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 19:31:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 25 Oct 2016 22:31:16 -0400
Message-ID: <cover.1477448814.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fontcache: fix fonts postinst failed
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
X-List-Received-Date: Wed, 26 Oct 2016 02:31:21 -0000
Content-Type: text/plain

1. Test steps:

1) edit local.conf:
---
IMAGE_INSTALL_append = " liberation-fonts"
---

2) Build image.
bitbake core-image-minimal

2. Expected:
No build warning of "The postinstall intercept hook 'update_font_cache' failed"

//Hongxu

The following changes since commit ef627ab364d52fe19994c94c1a78fbe21620a32c:

  local.conf.sample.extended: remove RM_OLD_IMAGE (2016-10-19 17:07:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-font
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-font

Hongxu Jia (1):
  fontcache: fix fonts postinst failed

 meta/classes/fontcache.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.8.1


