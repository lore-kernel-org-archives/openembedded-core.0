Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAF097251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:09:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0M99JnR001530
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 01:09:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 01:09:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 17:09:13 +0800
Message-ID: <cover.1421917634.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] distcc: fix initscript can not stop distcc daemon correctly
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
X-List-Received-Date: Thu, 22 Jan 2015 09:09:24 -0000
Content-Type: text/plain

The following changes since commit c45589a55c67bfd0bf9da5050141f4d18835e113:

  poky.conf: mark all CentOS 6/7 versions as compatible (2015-01-12 13:31:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-distcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-distcc

Hongxu Jia (1):
  distcc: fix initscript can not stop distcc daemon correctly

 meta/recipes-devtools/distcc/files/distcc | 5 +++++
 1 file changed, 5 insertions(+)

-- 
1.9.1


