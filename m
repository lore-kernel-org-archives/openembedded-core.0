Return-Path: <Ning.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8642460881
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 05:21:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r535LNP0008376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Jun 2013 22:21:24 -0700 (PDT)
Received: from pek-nzhang0-d3.wrs.com (128.224.162.247) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 2 Jun 2013 22:21:23 -0700
From: Ning Zhang <ning.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 13:21:17 +0800
Message-ID: <cover.1370228342.git.ning.zhang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] yocto_kernel: modify the msg when adding duplicate items
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
X-List-Received-Date: Mon, 03 Jun 2013 05:21:24 -0000
Content-Type: text/plain

The following changes since commit 73dae11852c656adbf5a2b0e44ac4c7e0078cd8d:

  rpm: remove .real hacks in argument parsing (2013-05-31 14:02:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ning/bug4558
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ning/bug4558

Ning Zhang (1):
  yocto_kernel: modify the msg when adding duplicate items

 scripts/lib/bsp/kernel.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


