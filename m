Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B73FC6A4DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 10:59:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r54AxhEc010978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 03:59:43 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 03:59:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jun 2013 06:59:39 -0400
Message-ID: <cover.1370343476.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-0.97: fix the objcopy error in configure
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
X-List-Received-Date: Tue, 04 Jun 2013 10:59:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 8f5bc47729edb8cb051d81e9ff1680cb8d2eca25:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_grub097_0604_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub097_0604_1

Jackie Huang (1):
  grub-0.97: fix the objcopy error in configure

 .../grub/grub-0.97/objcopy-absolute.patch          |   40 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch

-- 
1.7.9.5


